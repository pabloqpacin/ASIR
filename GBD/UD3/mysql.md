# MySQL

## setup

- [MySQL-Community==8.0.18.0](https://cdn.mysql.com//archives/mysql-installer/mysql-installer-community-8.0.18.0.msi)
- documentation
  - pasos instalación .pdf
  - manejo básico .pdf

### installation wizard

run installer above

Choosing a Setup Type
- ~~Developer Default--
  - (MySQL) Server
  - Shell
  - Router
  - Workbench
  - MySQL for Excel
  - MySQL for Visual Studio
  - Connectors
  - *Examples and tutorials*
  - *Documentation*
- Custom
  - Server
  - Workbench
  - Notifier
  - ~~**Excel**~~^[not installed]
  - Shell
  - Router
  - Documentation
  - Samples and Examples
  - ~~VS~~^[be tryna **VS Code extensions** tho]

Check Requirements
- 'Microsoft Visual C++ 2015 Redistributable Package (x64)'
- Execute

#### Server Config
High Availability
- default (Standalone MySQL Server / Classic MySQL Replication)

Type and Networking
- defaults +
- **Show Advanced and Logging Options**

Auth
- default

*Accounts and Roles*
- Root: minas7!
- User acc: [NADA????]

Windows Service
- defaults

Login Options
- defaults

Advanced Options
- defaults

Apply Configuration
- defaults (nothing)

#### Router Config

Router Config
- default (no Bootstrap)

#### Samples and Examples

Connect to Server
- root login


## Manejo Básico

<!-- ## shell 10x

```mysql
\help
``` -->

> MySQL Workbench
>
> MySQL Connections

Local Instance MySQL
- Service: Mysql@localhost:3306
- User: root
- Passwd: minas7!


# snippets dawg

| snippet         | meaning
| ---             | --- 
| `IF NOT EXISTS` | crea tabla si no existe ya


## NOTES

> Whatever schema is in USE, you can *mention* other schemas' tables using `<DB_name>.` as in:
```sql
-- USING a schema that is not sakila
SELECT *
FROM sakila.actor
```