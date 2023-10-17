# MySQL - alt - CLI

<!-- 2023-04-08 -->

Why yes, **MySQL Workbench** is fine and all but it's just too bright, hurts me eyes.

More importantly tho, the CLI works everywhere and [SQLTools](https://github.com/mtxr/vscode-sqltools) provides great functionaly within my comfy **VS Code** dev environment (thanks [Fireship](https://youtu.be/Cz3WcZLRaWc&ab_channel=Fireship)).


- [MySQL - alt - CLI](#mysql---alt---cli)
  - [WSL](#wsl)
    - [Windows Client](#windows-client)
    - [WSL Client](#wsl-client)
  - [Termux](#termux)
  - [Ubuntu box](#ubuntu-box)
  - [VSCode Tools](#vscode-tools)
    - [TODO `executeCurrentBlock`](#todo-executecurrentblock)
  - [ELSE](#else)
    - [netadmin — port security](#netadmin--port-security)
    - [extra documentation](#extra-documentation)

<!--
- IMPORTANT: no relevant changes done to our MySQL Server installation. That is, basically we running the DEFAULT CONFIG
-->

## WSL

### Windows Client

- As **MySQL Server** and **Shell** were installed on Windows, the commands below require the `.exe` file extension.
- Notice the connection port seems to be `33060` ([documentation](https://stackoverflow.com/questions/63556825/what-is-the-port-33060-for-mysql-server-ports-in-addition-to-the-port-3306)).

```bash
# Avoid 'mysql.exe' as screen can't be cleared and lesser functionality

# Access MySQL Server (Local)
# mysqlsh.exe -u root -p -- DON'T
mysqlsh.exe root@localhost/SCHEMA
    # enter password

# Print information about the current global session.
\s || \status

# Change JS prompt to SQL
\sql

# Verify selected DB
SELECT DATABASE() FROM DUAL;
    # SHOW DATABASES; — OPERATE!! 

# Quit MySQL Shell
\q
```

- It seems `mysqlsh.exe` was automatically added to the Windows PATH during installation. Unaware, [I added `mysql.exe` to the PATH](((https://dev.mysql.com/doc/mysql-windows-excerpt/5.7/en/mysql-installation-windows-path.html))) since running `mysql` wouldn't be recognized in neither CMD, PowerShell or the Linux terminal. <!--([see more]) ??-->

### WSL Client

```bash
sudo apt install mysql-client
```
```sql
-- Still different password than normal root...
CREATE USER 'root'@'192.168.1.%' IDENTIFIED BY 'malakia22talcual;'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.1.%' WITH GRANT OPTION;
```
```mysql
mysql -h 192.168.1.42 -P 3306 -u root -p
\P batcat
```

## Termux

<!--
# https://github.com/termux/termux-app/issues/757
echo -e '\e[2 q' # Change (cursor) to block
echo -e '\e[4 q' # Change to underline
echo -e '\e[6 q' # Change to bar
--->

- Decided to use [**Termux**](https://github.com/termux/termux-app) to connect me phone to the computer's **MySQL Server** (running in **localhost**), so we oughta set up **MySQL** on the phone too!
- First, I had to create a New **'Inbound Rule'** in my **Windows Defender Firewall** to allow **ICMP packets** in (from **Termux**), since the computer could `ping` the phone but the phone could only `ping` the router, not the computer.

```yaml
1: Press the Windows key + R to open the Run dialog box.
2: Type "control firewall.cpl" and press Enter to open the Windows Defender Firewall settings.
3: Click on "Advanced settings" on the left-hand side of the screen.
4: In the left-hand pane, click on "Inbound Rules."
5: In the right-hand pane, click on "New Rule" to create a new rule.
6: Select "Custom" as the type of rule you want to create and click Next.
    - TODO: Consider "Port" tho!!
7: Select "All programs" and click Next.
8: In the "Protocol and Ports" screen, select "ICMPv4" as the protocol type.
9: In the "Scope" screen, click "Customize..." and select the interface types "Local area network" and "Wireless".
10: Click "Next" until you get to the "Action" screen, then select "Allow the connection."
11: In "Profile" screen, select the appropriate profiles that apply (Private only).
12: Give the new rule a name (e.g., "Allow ICMP packets") and click "Finish."
```

- [ ] Must verify the security of such **Firewall** Settings in due time.
- Great success tho! Now **Termux** can `ping` both the machine and its **MySQL Server** network port (as long as they're in the same network).

```bash
ping -c 4 -p 3306 'IP'
```

- Now let's install **MySQL** in **Termux** too. This should provide it with its own **MySQL Server** and, more importantly, with the means to connect to and work remotely with the **Server** in our box.
- Reading [@parzibyte documentation](https://parzibyte.me/blog/en/2019/04/16/install-mysql-mariadb-android-termux/) and @StackOverflow ([1](https://stackoverflow.com/questions/11657829/error-2002-hy000-cant-connect-to-local-mysql-server-through-socket-var-run), [2](https://stackoverflow.com/questions/39281594/error-1698-28000-access-denied-for-user-rootlocalhost)) for troubleshooting, as well as the official **MariaDB** documentation (eg. [mysql_secure_installation](https://mariadb.com/kb/en/mysql_secure_installation/)).


```bash
# Install MySQL / MariaDB packages
apt show mariadb
pkg install mariadb
mysql --version

# Install config files
mysql_install_db
```
```bash
# Start the DBSM daemon!! -- EVERY TIME!!
mysqld_safe -u root &

# Connect client to server!
mysql -u root

# Get status information from the server — Quit
    # \s || \status && \q

# Find the daemon PIDs
pgrep -lf mysql
    # ps aux | grep mysql -n

# Kill the processes
kill -9 <PID>
```

- Locked myself out of *root* because didn't set a password when running the command below, so watch out!

```bash
# Strenghten the server config
mysql_secure_installation   # (...) Enable unix_socket auth

# Reset root account
mysqld_safe --skip-grant-tables &
mysql -u root
mysql> FLUSH PRIVILEGES;
mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY '<NewPass>';

# New login command -- EVERY TIME!!
mysql -u root -p
```
  
> - [How Linux Signals Work: SIGINT, SIGTERM, and SIGKILL](https://www.howtogeek.com/devops/linux-signals-hacks-definition-and-more/)
> - [How to force kill process in Linux using kill and killall](https://www.cyberciti.biz/faq/how-force-kill-process-linux/)
>   - `SIGTERM`(-15) vs `SIGKILL`(-9)
> - [How to kill a daemon with its name gracefully?](https://unix.stackexchange.com/questions/28260/how-to-kill-a-daemon-with-its-name-gracefully)
>   - avoid `SIGKILL`(9): "This last signal cannot be catched by the application, so that it cannot perform any clean-up. For this reason it should be avoided every time you can."

<details>
<summary> Script to Kill the Daemons...</summary>

```bash
#!/bin/bash

# Get the process IDs of the daemons
pids=$(pgrep -f "mysql")

# Loop through all of the PIDs and send signals to each one
for pid in $pids; do
  # Send the SIGTERM signal
  echo "Sending SIGTERM signal to PID $pid"
  kill -15 $pid

  # Wait for 10 seconds
  sleep 10

  # Check if the process is still running
  if pgrep -f "mysql" >/dev/null; then
    # Send the SIGINT signal
    echo "Sending SIGINT signal to PID $pid"
    kill -2 $pid

    # Wait for 10 seconds
    sleep 10

    # Check if the process is still running
    if pgrep -f "mysql" >/dev/null; then
      # Send the SIGKILL signal
      echo "Sending SIGKILL signal to PID $pid"
      kill -9 $pid
    fi
  fi
done
```
</details>

<br>

- Time to connect. Unfortunately, since the only active user in our **Server** is *root* with the default config, there's an an error.

```bash
mysql -h 'IP' -P 3306 -u root -p
    # ERROR 1130 (HY000): Host '<IP>' is not allowed to connect to this MySQL server
    # ERROR 1045 (28000): Access denied for user 'root'@'<IP>' (using password: YES) -- After creating the user :^)
```

- Therefore, we oughta create a new user in our box's **MySQL Server** and assign it to our phone's IP.
- In this case, the user will be granted full control over a given database, as long as they connect from the given IP address.

```sql
-- With this config, the user can only connect and access the given database from the given IP
CREATE USER 'termitico'@'<IP>' IDENTIFIED BY 'securePassword';
GRANT ALL PRIVILEGES ON <DB_NAME>.* TO 'termitico'@'<IP>';
```
- Finally, this command in **Termux** will connect us to the **Server**, where we'll have access only to the specified database `<DB_NAME>`.
- We may go over port security and more network admin stuff [later on](#netadmin--port-security).

```bash
mysql -h <IP> -P 3306 [DB_NAME] -u termitico -p
```

## Ubuntu box

- Inspired by [Network Chuck](https://youtu.be/xiUTqnI6xk8&ab_channel=NetworkChuck), decided to install **MySQL Server** in yet another separate machine.
- This documentation helped ([How to install MySQL on WSL 2 - Ubuntu](https://pen-y-fan.github.io/2021/08/08/How-to-install-MySQL-on-WSL-2-Ubuntu/)), as well as [Microsoft's](https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-database).
- Importantly, had to set a new *root* password to run `mysql_secure_installation` ([documentation](https://stackoverflow.com/questions/72103302/mysql-installation-on-ubuntu-20-04-error-when-using-mysql-secure-installation)).

```bash
# Install MySQL Server
apt show -a mysql-server
sudo apt install mysql-server -y
mysql --version

# Verify daemon is up, disable auto startup
systemctl status mysql  # sudo service mysql status
sudo systemctl disable mysql
    # sudo sed -i.bak '/start on/s/^/# /' /etc/init/mysql.conf

# Start the server -- EVERY TIME!!
sudo systemctl start mysql

# Login as root to local server
sudo mysql -e "show databases; select user(); quit"

# Login to main MySQL Server remotely (diff box)
mysql -h <IP> -P 3306 -u termitico -p
    # password
```

```bash
# Fail security script prompt due to default settings
sudo mysql_secure_installation
    # Error: SET PASSWORD has no significance for user 'root'@'localhost'

# Set a password for root
sudo mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'newSecurePassword';
quit

# Successfully run the script now
sudo mysql_secure_installation
    # Enter newSecurePassword
    # Remove anon users? y
    # Disallow root login remotely? y
    # Remove test database? n
    # Reload privilege tables? y

# New login procedure -- EVERY TIME!!
mysql -u root -p
    # password
```

## VSCode Tools

- Install the extensions *SQLTools* and the required driver (*SQLTools MySQL/MariaDB*).
- Just click on the extension to connect to our **Server**.
- The [Connection settings](https://vscode-sqltools.mteixeira.dev/en/drivers/my-sql) should be similar to the JSON below.
  - Although we select a Database now, we can `USE` any other later on.
  - In case of errors, set `authProtocol` to `xprotocol` and add a trailing `0` to the `port`. Fill `connectionTimeout` too.
  - Now **Password mode** may be either default's "SQLTools Driver Credentials" or "Ask on connect".


```json
{
  "mysqlOptions": {
    "authProtocol": "xprotocol"
  },
  "name": "any",
  "driver": "MySQL",
  "server": "localhost",
  "port": 33060,
  "database": "some",
  "username": "root",
  "connectionTimeout": 30
//   "askForPassword": true,
}
```

- First TEST the connection, then SAVE it. Enter your password and good to go.
- Now we'll be thrown into a `any.session.sql` file. We can use it to interact with our database or close it and use any other `.sql` file. If saved, it will be stored at the root of our current workspace.
- All set to start writing raw SQL. An useful feature for running queries selectively and interactively would be `-- @block`

```sql
-- @block — Run in active connection
CREATE ...
CREATE ...
DESCRIBE ...;

-- @block
INSERT INTO ...
INSERT INTO ...
SELECT ...
```

<!-- - Disable `highlightQuery` -->
- Lastly, these are perhaps the most practical key bindings, as described under **Feature Contributions** in the extension page ([doc](https://github.com/mtxr/vscode-sqltools/issues/876))

| ID                              | Key Bind          | Default/Custom | Description     
| ---                             | ---               | ---            | ---             
| `sqltools.executeQuery`         | `Ctrl+E` `Ctrl+E` | Default        | run all selected text
| `sqltools.executeCurrentQuery`  | `Ctrl+E` `Ctrl+W` | Custom         | run where cursor is (single query)
| `sqltools.executeFromInput`     | `Ctrl+E` `Ctrl+F` | Custom         | run what in prompt
| `sqltools.executeQueryFromFile` | `Ctrl+E` `Ctrl+Z` | Custom         | run all file
| `sqltools.executeCurrentBlock`  | —                 | Customisisimo  | run current block until next block or EOF

- Below, we shall implement a minor tweak to the extension so that `sqltools.executeCurrentBlock` actually comes to be.

### TODO `executeCurrentBlock`


<!--

> credit: @ChatGPT...

To execute all the queries up to the next `-- @block` marker or the end of the file using a key binding, you can create a custom command that selects the SQL queries in the current block and then executes them using the `sqltools.executeCustomBlock` command. Here's an example implementation of this command:

```json
{
  "key": "ctrl+shift+r",
  "command": "extension.executeCurrentBlock",
  "when": "editorTextFocus"
}
```

```typescript
import * as vscode from "vscode";
import { ConnectionManager } from "vscode-sqltools";

function getQueryBlocks(document: vscode.TextDocument): string[] {
  const queryBlocks = [];
  let currentBlock = "";
  for (let i = 0; i < document.lineCount; i++) {
    const line = document.lineAt(i);
    if (line.text.trim().startsWith("--@block")) {
      if (currentBlock) {
        queryBlocks.push(currentBlock);
      }
      currentBlock = "";
    } else {
      currentBlock += line.text + "\n";
    }
  }
  if (currentBlock) {
    queryBlocks.push(currentBlock);
  }
  return queryBlocks;
}

export function activate(context: vscode.ExtensionContext) {
  const connectionManager = new ConnectionManager(context);

  context.subscriptions.push(
    vscode.commands.registerCommand("extension.executeCurrentBlock", async () => {
      const editor = vscode.window.activeTextEditor;
      if (!editor) {
        vscode.window.showErrorMessage("No active editor.");
        return;
      }

      const document = editor.document;
      const queryBlocks = getQueryBlocks(document);

      const currentLine = editor.selection.active.line;
      let currentBlockIndex = 0;
      for (let i = 0; i < queryBlocks.length; i++) {
        const blockStartLine = document.lineAt(currentBlockIndex).lineNumber;
        const blockEndLine =
          i < queryBlocks.length - 1
            ? document.lineAt(currentBlockIndex + queryBlocks[i].split("\n").length - 1).lineNumber
            : document.lineCount - 1;
        if (currentLine >= blockStartLine && currentLine <= blockEndLine) {
          const queryText = queryBlocks[i];
          const conn = await connectionManager.getConnection();
          try {
            await conn.query(queryText);
            vscode.window.showInformationMessage("Query executed successfully.");
          } catch (e) {
            vscode.window.showErrorMessage(`Error executing query: ${e}`);
          }
          break;
        }
        currentBlockIndex += queryBlocks[i].split("\n").length;
      }
    })
  );
}
```

To use this command, save the above code as a TypeScript file (e.g., `executeCurrentBlock.ts`) in your VS Code extension project, then add the key binding and command definition to your `package.json` file as shown above.

This command will extract all the SQL query blocks in the current file, find the block containing the current cursor position, and execute that block using the SQLTools connection manager. Note that you may need to modify this code to match your specific SQLTools and VS Code configuration.

-->


---

## ELSE


### netadmin — port security


<!--
- https://phoenixnap.com/kb/ping-specific-port
- can I ssh into WSL from Termux?
-->


- **Windows [PWSH](https://github.com/PowerShell/PowerShell/tree/master/docs/learning-powershell)** <!--as a Server-->

```powershell
$PSVersionTable

ping --help
netstat --help
tracert --help

Get-Help Test-NetConnection
```

- **Linux** <!--as a Client-->

```bash
apt show net-tools bind9-utils iproute2 \
         nmap netcat-openbsd

man dig ip ss ping traceroute nmap
man hostname ifconfig telnet ssh 
```


### extra documentation

- Python: [mysql-for-termux](https://github.com/anay-p/mysql-for-termux)
- @SQLShack: [Visual Studio Code for MySQL and MariaDB development](https://www.sqlshack.com/visual-studio-code-for-mysql-and-mariadb-development/)