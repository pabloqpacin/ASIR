# UD 3.1 - DHCP DNS y Web Apache en UbuntuServer

Dada la dirección de red *192.168.100.0* realizar 12 subredes. Quedaros con la **SEGUNDA** subred disponible para hacer el direccionamiento de red.

Instala en un UBUNTU SERVER los servicios DHCP, DNS y HTTP.

Realiza **una reserva** para un cliente LINUX.

Crear el dominio `presenciales.net` y crea los host para los servicios `web` y `ftp`. Crea también un *alias* para cada uno de los host.

Visualiza desde los clientes la página web creada por ti.


- [UD 3.1 - DHCP DNS y Web Apache en UbuntuServer](#ud-31---dhcp-dns-y-web-apache-en-ubuntuserver)
  - [1. Subnetting: 192.168.100.16/28](#1-subnetting-1921681001628)
  - [2. Instalación de servicios DHCP, DNS y Web Apache](#2-instalación-de-servicios-dhcp-dns-y-web-apache)
  - [3. Configuración de servicio DHCP](#3-configuración-de-servicio-dhcp)
  - [4. Configuración de servicio DNS](#4-configuración-de-servicio-dns)
  - [5. Configurar Apache (HTTP Web)](#5-configurar-apache-http-web)
  - [6. Reiniciar y verificar servicios](#6-reiniciar-y-verificar-servicios)


<!-- > **NOTA 1**: el siguiente comando imprimirá la dirección IP privada asignada a la máquina

```bash
hostname -I | awk '{print $1}'
```
> **NOTA 2**: en mi caso, la interfaz de ethernet es `enp0s3`, en otros ordenadores puede ser distinta. El siguiente comando imprimirá el nombre de la interfaz ethernet de la máquina

```bash
ip -o link show | grep -v 'lo' | awk -F ': ' '{print $2}' | head -n1
```
 -->

## 1. Subnetting: 192.168.100.16/28

- Cálculo

```bash
# X Subnets:
#     - 2^n >= x
#     - /mask + n

# 192.168.100.-1/24: 12 subredes
2^n >= 12: 2⁴ >= 12: 16 >= 12:
/24 + 4 = /28:
    192.168.100.-0000-0000          # 1: 192.168.100.0/28
    192.168.100.-0001-0000          # 2: 192.168.100.16/28
    192.168.100.-0010-0000          # 3: 192.168.100.32/28
```

- Segunda subred de 12 para servicios DHCP/DNS

```yaml
Direccion red:  192.168.100.16/28
Primer host:    192.168.100.17        # en nuestro caso, el servidor DHCP+DNS
Ultimo host:    192.168.100.30
Broadcast:      192.168.100.31
```

## 2. Instalación de servicios DHCP, DNS y Web Apache

```bash
sudo systemctl edit systemd-networkd-wait-online.service
    # [Service]
    # TimeoutStartSec=10
```


> **Configuración de red** de la máquina virtual (VM) Ubuntu Server: *NAT o Bridged*

- Instalación de paquetes necesarios

```bash
# Actualizar repositorios y paquetes instalados
sudo apt-get update && sudo apt-get upgrade -y

# Instalación de paquetes
sudo apt-get install isc-dhcp-server \
    bind9 bind9-utils apache2 \
    grc nmap whois
```

## 3. Configuración de servicio DHCP

> **Configuración de red** de la VM: *Red Interna*

- Verificamos que no recibimos direccionamiento ni conexión a internet

```bash
ip -c a && whois github.com
```

- Asignar dirección IP estática al servidor en red interna

```bash
sudo vim /etc/netplan/00-installer-config.yaml
```

```yaml
network:
    version: 2
    renderer: networkd
    ethernets:
        enp0s3:
            dhcp4: false
            addresses: [192.168.100.17/28]
            gateway4: 192.168.1.1   # ...
            nameservers:
                addresses: [192.168.100.17]
```

- Aplicamos configuración y verificamos que tenemos IP privada estática

```bash
sudo netplan apply
ip -c a           # enp0s3: 192.168.100.17/28
```

- Asignamos una interfaz de red para el servicio DHCP

```bash
sudo vim /etc/default/isc-dhcp-server
```
```conf
INTERFACESv4="enp0s3"
```

- Configuración del servicio DHCP

```bash
sudo vim /etc/dhcp/dhcpd.conf
```
```conf
option domain-name "presenciales.net";
option domain-name-servers ns.presenciales.net;

default-lease-time 600;
max-lease-time 7200;
ddns-update-style none;

subnet 192.168.100.16 netmask 255.255.255.240 {
    range 192.168.100.20 192.168.100.30;
    option subnet-mask 255.255.255.240;
    option routers 192.168.100.17;
    option domain-name-servers 192.168.100.17;
    option domain-name "presenciales.net";
}

host cliente_linux {
    hardware ethernet 08:00:27:9c:6a:c1;
    fixed-address 192.168.100.18;
}
```

```bash
# Troubleshoot...
journalctl
```

## 4. Configuración de servicio DNS
<!-- 
- Primero 'forwarders'

```bash
sudo vim /etc/bind/named.conf.options
```
```c
options {
        directory "/var/cache/bind";

        forwarders {
                192.168.100.17;
        };

        dnssec-validation auto;
        // listen-on port 53 {192.168.100.17;}
        listen-on-v6 { any; };
};
``` -->

- Luego archivo de configuración principal `named.conf.local`

```bash
sudo vim /etc/bind/named.conf.local
```
```c
// Resolución Directa
zone "presenciales.net" {
        type master;
        file "/etc/bind/db.presenciales.net";
};

// Resolución Inversa
zone "100.168.192.in-addr.arpa" {
       type master;
       file "/etc/bind/db.192";
};
```
```bash
# Verificar sintaxis configuración
named-checkconf
```

- Ahora creamos el archivo de zona Directa `db.presenciales.net`

```bash
sudo cp /etc/bind/db.local /etc/bind/db.presenciales.net
sudo vim /etc/bind/db.presenciales.net
```
```conf
$TTL    604800
@       IN      SOA     presenciales.net.   root.presenciales.net. (
                              2        ; Serial
                         604800        ; Refresh
                          86400        ; Retry
                        2419200        ; Expire
                         604800 )      ; Negative Cache TTL
;     
@       IN      NS        presenciales.net.
@       IN      A         192.168.100.17
@       IN      AAAA      ::1

ns      IN      A         192.168.100.17
www     IN      A         192.168.100.17
ftp     IN      A         192.168.100.18

Dns    IN      CNAME     ns.presenciales.net.
Web    IN      CNAME     www.presenciales.net.
Nas    IN      CNAME     ftp.presenciales.net.
```

- Por último el de zona Inversa `db.presenciales.net`

```bash
sudo cp /etc/bind/db.127 /etc/bind/db.192
sudo vim /etc/bind/db.192
```
```conf
$TTL    604800
@       IN      SOA  presenciales.net.     root.presenciales.net. (
                          1          ; Serial
                     604800          ; Refresh
                      86400          ; Retry
                    2419200          ; Expire
                     604800 )        ; Negative Cache TTL
;

@        IN     NS      presenciales.net.
17       IN     PTR     ns.presenciales.net.
17       IN     PTR     www.presenciales.net.
18       IN     PTR     ftp.presenciales.net.
```

```bash
# Verificar sintaxis configuración
named-checkzone presenciales.net /etc/bind/db.presenciales.net
named-checkzone 100.168.192.in-addr.arpa. /etc/bind/db.192

```

## 5. Configurar Apache (HTTP Web)

- Crear archivos para la web -- OJO PERMISOS, PREGUNTAR AL PROFE

```bash
sudo mkdir -p /var/www/web/css
sudo mkdir /var/www/web/js

sudo chown -R $USER /var/www/web
```

```bash
vim /var/www/web/index.html
```

```html
<html>
<head>
    <title>HAXIR</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/style.scss">
</head>
<body>
    <h1>HAXIR</h1>
    <p>Pulsar aquí: &emsp; <input type="button" value="Pulsar" onclick="pulsar_boton()"></p>
    <hr>
    <script type="text/javascript" src="js/script.js"></script>
</body>
</html>
```

```bash
vim /var/www/web/js/script.js
```

```js
function pulsar_boton(){
    alert('Prueba otra vez');
}
```

```bash
vim /var/www/web/css/style.scss
```

```scss
body {
    color: lavender;
    background-color: #282c34;            
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}
```

- Editar configuración de Apache

```bash
cd /etc/apache2/sites-available
cp 000-default.conf presenciales.conf

vim presenciales.conf
```

```conf
<VirtualHost *:80>
    ServerAdmin admin@presenciales.net
    DocumentRoot /var/www/web

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

- Crear symlink

```bash
rm /etc/apache2/sites-enabled/000-default.conf

ln -s \
    /etc/apache2/sites-available/presenciales.conf \
    /etc/apache2/sites-enabled
```

---

## 6. Reiniciar y verificar servicios

- Reiniciar los servicios para aplicar la nueva configuración

```bash
sudo systemctl restart isc-dhcp-server named apache2
```

- have windows sensible to nmap from other boxes

```ps1
New-NetFirewallRule -DisplayName "Allow ICMP Echo Request" -Protocol ICMPv4 -IcmpType 8 -Direction Inbound -Action Allow
Get-NetFirewallProfile | Select Name, Enabled

```


> **Encender** máquinas virtuales de los **clientes**

- Verificar servicios en servidor y cliente Linux (`ns.asir.com` y `www.asir.com`)

```bash
# Verificar estado servicios en Ubuntu Server
systemctl status named isc-dhcp-server
resolvectl status
# TODO: MÁS MONITOREO

# Otros comandos...
nmap -sV 192.168.100.16/28
curl www.presenciales.net
```

```bash
# Verificar direccionamiento y resolución de nombres en servidor y cliente
dominios=('presenciales.net' 'ns.presenciales.net' 'www.presenciales.net' 'ftp.presenciales.net')
direcciones_ip=('192.168.100.129' '192.168.100.131' '192.168.100.131')

for nombre in ${dominios[@]}; do
    echo "---"
    nslookup $nombre
    ping -c2 $nombre
    # dig $nombre
done

    echo "-x-"

for direccion in ${direcciones_ip[@]}; do
    echo "---"
    nslookup $direccion
    ping -c2 $direccion
done
```

- Verificar servicios en cliente Windows (`ftp.asir.com`)

```ps1
New-NetFirewallRule -DisplayName "Allow ICMPv4-In" -Protocol ICMPv4
ipconfig /all
```

```ps1
$dominios=('asir.com', 'ns.asir.com', 'www.asir.com', 'ftp.asir.com')
$direcciones_ip=('192.168.100.129', '192.168.100.131', '192.168.100.131')

foreach ($nombre in $dominios) {
    Write-Output "---"
    nslookup $nombre
    ping -n 2 $nombre
}

    Write-Output "-x-"

foreach ($direccion in $direcciones_ip) {
    Write-Output "---"
    nslookup $direccion
    ping -n 2 $direccion
}
```

```ps1
nmap -sV 192.168.100.128/27
ssh ns.asir.com
curl www.asir.com
mysql -h www.asir.com -u root -p

ipconfig /release
ipconfig /renew

nslookup web.asir.com
```

- Capturas de pantalla

> ...

