# Redes T3

- [Redes T3](#redes-t3)
  - [Enunciado](#enunciado)
  - [Resolución](#resolución)
    - [0. Misc](#0-misc)
    - [0. Subnetting: 192.168.100.32/28](#0-subnetting-1921681003228)
    - [1. DHCP](#1-dhcp)
    - [2. DNS](#2-dns)
    - [3. HTTP](#3-http)
    - [4. FTP](#4-ftp)
    - [5. Correo](#5-correo)
      - [Servidor](#servidor)
      - [Clientes](#clientes)
        - [Cliente Linux](#cliente-linux)
        - [Cliente Windows](#cliente-windows)
      - [Server](#server)


## Enunciado

Crea un servidor con Ubuntu Server donde instales los servicios DHCP, DNS, HTTP, FTP y CORREO. Debes de comprobar que funcionan correctamente en ambos clientes.

> Dada la dirección IP 192.168.100.0 crear 10 subredes. Quedaros con la tercera subred para asignar rango. Haz una reserva a un cliente windows.

- DHCP: Podéis usar la red que queráis. Tenéis que hacer una reserva para el cliente Linux.
- DNS: El nombre de la zona será `universidad.com`
- HTTP: Debe cargar una web creada por vosotros, me da igual el contenido.
- FTP: Crea tres usuarios, Javier, David y Alicia. Debes mostrar que accedes con dichos usuarios correctamente en ambos clientes con Filezilla o cualquier otro software que consideres oportuno.
- CORREO: Debes dar de alta sólo a dos usuarios, los que quieras. Uno de ellos se da de alta en el cliente Linux y el otro en el cliente Windows. Debes de mostrar cómo se manda un correo de un usuario al otro y se responde a ese mismo.

## Resolución

<!-- 
resolvectl status
- [ ] https://phoenixnap.com/kb/postfix-smtp
- [ ] https://serverfault.com/questions/969671/postfixdovecot-case-sensitive-email-address
-->


### 0. Misc

- Necesario para que la máquina virtual Ubuntu Server pueda gestionar dos interfaces de red, una Bridged y la otra en Red Interna.

```bash
sudo apt install -y openvswitch-switch \
                    net-tools
```

### 0. Subnetting: 192.168.100.32/28

- Cálculo

```bash
# X Subnets:
#     - 2^n >= x
#     - /mask + n

# 192.168.100.-0/24: 10 subredes
2^n >= 10: 2⁴ >= 10: 16 >= 10:
/24 + 4 = /28:
    192.168.100.-0000-0000          # 1: 192.168.100.0/28
    192.168.100.-0001-0000          # 2: 192.168.100.16/28
    192.168.100.-0010-0000          # 3: 192.168.100.32/28 -- !!
    192.168.100.-0011-0000          # 4: 192.168.100.48/28
```

- Subred

```yaml
Direccion red:  192.168.100.32/28
Primer host:    192.168.100.33        # en nuestro caso, el servidor DHCP+DNS+HTTP+Correo
Ultimo host:    192.168.100.46
Broadcast:      192.168.100.47
```

### 1. DHCP

- Instalación de paquetes necesarios

```bash
sudo apt update && sudo apt install -y \
    isc-dhcp-server
```

- Asignar direccionamiento estático en red interna (segundo adaptador de red)

```bash
sudo vim /etc/netplan/00-installer-config.yaml
```

```yaml
# This is the network config written by 'subiquity'
network:
  ethernets:
    enp0s3:
      dhcp4: true
    enp0s8:
      dhcp4: false
      addresses: [192.168.100.33/28]
      nameservers:
        addresses: [192.168.100.66]
  version: 2
```
```bash
sudo netplan try || \
sudo netplan apply
```
- Definir interfaz para servicio DHCP

```bash
sudo sed -i 's/INTERFACESv4=.*/INTERFACESv4="enp0s8"/' /etc/default/isc-dhcp-server
```
- Configuración servicio DHCP

```bash
sudo sed -i 's/^option domain-name "example.org";/option domain-name "universidad.com";/' /etc/dhcp/dhcpd.conf
sudo sed -i 's/^option domain-name-servers .*/option domain-name-servers ns.universidad.com;/' /etc/dhcp/dhcpd.conf

cat<<EOF | sudo tee -a /etc/dhcp/dhcpd.conf

subnet 192.168.100.32 netmask 255.255.255.240 {
  range 192.168.100.36 192.168.100.46;
  option subnet-mask 255.255.255.240;
  option routers 192.168.100.33;
  option domain-name-servers 192.168.100.33;
  option domain-name "universidad.com";
}

host cliente_linux {
  hardware ethernet 08:00:27:9c:6a:c1;
  fixed-address 192.168.100.34;
}

host cliente_windows {
  hardware ethernet 08:00:27:58:d0:b7;
  fixed-address 192.168.100.35;
}

EOF
```
- Aplicamos la configuración

```bash
sudo systemctl restart isc-dhcp-server
```

### 2. DNS

- Instalación de paquetes necesarios

```bash
sudo apt update && sudo apt install -y \
    bind9 bind9-utils
```

- Definimos zonas de resolución

```bash
cat<<EOF | sudo tee -a /etc/bind/named.conf.local

// Resolución Directa
zone "universidad.com" {
        type master;
        file "/etc/bind/db.universidad.com";
};

// Resolución Inversa
zone "100.168.192.in-addr.arpa" {
       type master;
       file "/etc/bind/db.192";
};

EOF
```

- Configuración de zona directa

```bash
cat<<EOF | sudo tee /etc/bind/db.universidad.com

\$TTL    604800
@       IN      SOA     universidad.com.   root.universidad.com. (
                              2        ; Serial
                         604800        ; Refresh
                          86400        ; Retry
                        2419200        ; Expire
                         604800 )      ; Negative Cache TTL
;     
@       IN      NS        universidad.com.
@       IN      A         192.168.100.33
@       IN      AAAA      ::1
@       IN      MX 10     correo.universidad.com.

ns      IN      A         192.168.100.33
www     IN      A         192.168.100.33
ftp     IN      A         192.168.100.33
correo  IN      A         192.168.100.33

Dns     IN      CNAME     ns.universidad.com.
Web     IN      CNAME     www.universidad.com.
Nas     IN      CNAME     ftp.universidad.com.
Mail    IN      CNAME     correo.universidad.com.

EOF
```

- Configuración de zona inversa

```bash
cat<<EOF | sudo tee /etc/bind/db.192

\$TTL    604800
@       IN      SOA  universidad.com.     root.universidad.com. (
                          1          ; Serial
                     604800          ; Refresh
                      86400          ; Retry
                    2419200          ; Expire
                     604800 )        ; Negative Cache TTL
;

@        IN     NS      universidad.com.
33       IN     PTR     ns.universidad.com.
33       IN     PTR     www.universidad.com.
33       IN     PTR     ftp.universidad.com.
33       IN     PTR     correo.universidad.com.

EOF
```

```bash
# Verificar sintaxis configuración
named-checkconf
named-checkzone universidad.com /etc/bind/db.universidad.com
named-checkzone 100.168.192.in-addr.arpa. /etc/bind/db.192
```

- Aplicamos la configuración

```bash
sudo systemctl restart named
```

### 3. HTTP

- Con docker ya instalado, ejecutamos un [contenedor Apache](https://hub.docker.com/r/pabloqpacin/sonda-web)

```bash
# sh <(curl -sSL https://get.docker.com)
docker run -d --name web1 -p 80:80 --restart always pabloqpacin/sonda-web:v1
```

### 4. FTP

- Instalamos paquetes necesarios en el server (en los clientes se instala **Filezilla**)

```bash
sudo apt install -y \
    vsftpd
```

- Configuración del servicio vsfptd

```bash
sudo cp /etc/vsftpd.conf{,.bak}
# sudo vim /etc/vsftpd.conf

sudo sed -i 's/#write_enable=YES/write_enable=YES/' /etc/vsftpd.conf
sudo sed -i 's/#ftpd_banner=.*/ftpd_banner=Buenardas/' /etc/vsftpd.conf
sudo sed -i 's/#chroot_local_user=YES/chroot_local_user=YES/g' /etc/vsftpd.conf
sudo sed -i 's/#chroot_list_enable=YES/chroot_list_enable=YES/' /etc/vsftpd.conf
sudo sed -i 's/#chroot_list_file=.*/chroot_list_file=\/etc\/vsftpd.chroot_list/' /etc/vsftpd.conf
```

- Creación de usuarios

```bash
cat<<EOF | tee ~/usuarios.sh
#!/usr/bin/env bash

new_users=('javier' 'david' 'alicia')
user_list=/etc/vsftpd.chroot_list

for user in \${new_users[@]}; do
    echo \$user | tee -a \$user_list && \
    # groupadd \$user && useradd -mg \$user \$user
    useradd -mg users \$user && \
    passwd \$user     # 1234
done

EOF

sudo bash ~/usuarios.sh
```

- Aplicamos la configuración

```bash
sudo systemctl restart vsftpd
```


### 5. Correo

#### Servidor

- Previamente hemos definido el recurso MX en el DNS

```bash
grep 'MX 10' /etc/bind/db.universidad.com
```

- Instalación de postfix (MTA)

```bash
sudo apt install -y \
  postfix
  # Internet site: universidad.com
```

- Configuración del servicio postfix

```bash
echo 'universidad.com' | sudo tee /etc/mailname
```
```bash
sudo cp /etc/postfix/main.cf{,.bak}
sudo vim /etc/postfix/main.cf
```
```c
myhostname = correo.universidad.com
mynetworks = 192.168.100.32/28 ...
// home_mailbox = Maildir/      // NO!!!
```
```bash
sudo systemctl restart postfix
```

- Instalación de dovecot (MDA)

```bash
sudo apt install -y \
  dovecot-core dovecot-pop3d dovecot-imapd
```


#### Clientes

- Se instala thunderbird

```bash
sudo pacman -Syu thunderbird || \
sudo apt install thunderbird || \
winget install mozilla.thunderbird
```

- Nos autenticamos en thunderbird

```yaml
cliente_linux:
  - Nombre completo: david
  - Dirección de correo electrónico: david@universidad.com
  - Contraseña: 1234

cliente_windows:
  - Nombre completo: alicia
  - Dirección de correo electrónico: alicia@universidad.com
  - Contraseña: 1234
```

- Enviamos un correo con la cuenta de [david@universidad.com](#) desde el Cliente Linux, respondemos desde la cuenta de [alicia@universidad.com](#) en en Cliente Windows

```yaml
Enviar:
  Remitente: david@universidad.com
  Para: alicia@universidad.com
  Cc: pabloqpacin@universidad.com
  Asunto: prueba
  Cuerpo: ¡hola!

Responder a todos:
  Remitente: alicia@universidad.com
  Para: david@universidad.com
  Cc: pabloqpacin@universidad.com
  Asunto: Re: prueba
  Cuerpo: ¡recibido!
```

##### Cliente Linux

![cliente_linux](/img/Redes/T3/cliente_linux.png)

##### Cliente Windows

![cliente_windows](/img/Redes/T3/cliente_windows.png)


#### Server

- Revisamos logs y verificamos que los correos existen localmente

```bash
tail -f /var/log/mail.log

sudo less /home/david/mail/Sent

for file in /var/mail/*; do
  sudo bat $file;
done
```

<!-- ```txt
  From david@ubuntu-server  Sat Mar 30 00:23:59 2024
  Message-ID: <da4d2999-ecfe-44a4-8117-3e9a3df9115a@universidad.com>
  Date: Sat, 30 Mar 2024 01:23:57 +0100
  MIME-Version: 1.0
  User-Agent: Mozilla Thunderbird
  Content-Language: en-US
  To: alicia@universidad.com
  Cc: pabloqpacin@universidad.com
  From: david <david@universidad.com>
  Subject: prueba
  Content-Type: text/plain; charset=UTF-8; format=flowed
  Content-Transfer-Encoding: 8bit
  X-IMAPbase: 1711757691 0000000001
  X-UID: 1
  Status: RO
  X-Keywords:
  Content-Length: 9

  ¡hola!

  /home/david/mail/Sent (END)
``` -->
<!-- ```bash
sudo apt install -y mailutils
mail
``` -->



<!--
- Se configura (en base a los usuarios del FTP)

```yaml
Cliente_Linux: Thunderbird:
    Address_01:
        - Full name: Javier
        - Email Address: javier@universidad.com
        - Password: 1234
        # - Manual configuration:
        #     Incoming Server:
        #         - Protocol: IMAP
        #         - Hostname: .universidad.com
        #         - Port:
        #         - Connection security: None
        #         - Authentication method: Autodetect
        #         - Username: javier@universidad.com
        #     Outgoing Server:
        #         - Hostn
# Add Security Exception:
# You are about to override how THunderbird identifies this site.
# Legitimate banks, stores, and other public sites will not ask you to do this.
# Location: mail.universidad.com:143
  # Get Certificate:
# This site attempts to identify itself with invalid information.
  # View:       Localhost: Courier Mail Server: Automatically-generated IMAP SSL key; postmaster@example.com
# Unknown Identity
# The certificate is not trusted because it hasn't been verified as issued by a trusted authority using a secure siame: .universidad.com
        #         - Port:
        #         - Connection security: None
        #         - Authentication method: Autodetect
        #         - Username: javier@universidad.com
        - Available configurations:
          - IMAP: yes
            # Keep your folders and emails synced on your server
            # Incoming IMAP STARTTLS: mail.universidad.com
            # Outgoing IMAP STARTTLS: mail.universidad.com
            # Username: javier
          - POP3: no
            # Keep your folders and emails on your computer
        # - Manual configuration:
        #     Incoming Server:
        #         - Protocol: IMAP
        #         - Hostname: mail.universidad.com
        #         - Port: 143
        #         - Connection security: STARTTLS
        #         - Authentication method: Normal password
        #         - Username: javier
        #     Outgoing Server:
        #         - Hostname: mail.universidad.com
        #         - Port: 25
        #         - Connection security: STARTTLS
        #         - Authentication method: Normal password
        #         - Username: javier
gnature
# Permanently store this exception: Yes
# Cancel: No
# Confirm Security Exception: Yes

# Unable to log in at server. Probably wrong configuration, username or password
```