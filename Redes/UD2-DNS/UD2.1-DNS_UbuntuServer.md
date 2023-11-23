# UD2.1 - DNS en UbuntuServer


Instala los servicios DHCP y DNS en un servidor UBUNTU SERVER para dar la configuración de todos los parámetros a un cliente windows y un cliente linux.

Dada la dirección de red *192.168.100.1*, crea 5 subredes y quédate con la **última** para la configuración del servicio. Haz **una reserva** para un equipo Windows (DHCP).

El dominio se llamará `asir.com` y dentro tienes que tener los host `www` y `ftp`, con sus respectivos alias.


- [UD2.1 - DNS en UbuntuServer](#ud21---dns-en-ubuntuserver)
  - [0. Subnetting: 192.168.100.128/27](#0-subnetting-19216810012827)
  - [1. Instalación de servicios DHCP y DNS](#1-instalación-de-servicios-dhcp-y-dns)
  - [2. Configuración de servicio DHCP](#2-configuración-de-servicio-dhcp)
  - [3. Configuración de servicio DNS](#3-configuración-de-servicio-dns)
  - [4. Reiniciar y verificar server](#4-reiniciar-y-verificar-server)
  - [5. Demostración con clientes](#5-demostración-con-clientes)


> **NOTA 1**: el siguiente comando imprimirá la dirección IP privada asignada a la máquina

```bash
hostname -I | awk '{print $1}'
```
> **NOTA 2**: en mi caso, la interfaz de ethernet es `enp0s3`, en otros ordenadores puede ser distinta. El siguiente comando imprimirá el nombre de la interfaz ethernet de la máquina

```bash
ip -o link show | grep -v 'lo' | awk -F ': ' '{print $2}' | head -n1
```


## 0. Subnetting: 192.168.100.128/27

- Cálculo

```bash
# X Subnets:
#     - 2^n >= x
#     - /mask + n

# 192.168.100.-1/24: 5 subredes
2^n >= 5: 2³ >= 5: 8 >= 5:
/24 + 3 = /27:
    192.168.100.-000-00000          # 1: 192.168.100.0/27
    192.168.100.-001-00000          # 2: 192.168.100.32/27
    192.168.100.-010-00000          # 3: 192.168.100.64/27
    192.168.100.-011-00000          # 4: 192.168.100.96/27
    192.168.100.-100-00000          # 5: 192.168.100.128/27
    # 192.168.100.-101-00000        # 6: 192.168.100.160/27
    # 192.168.100.-110-00000        # 7: 192.168.100.192/27
    # 192.168.100.-111-00000        # 8: 192.168.100.224/27
```

- Última subred de 5 para servicio DHCP

```yaml
Direccion red:  192.168.100.128/27
Primer host:    192.168.100.129        # en nuestro caso, el servidor DHCP+DNS
Ultimo host:    192.168.100.158
Broadcast:      192.168.100.159
```

## 1. Instalación de servicios DHCP y DNS

> **Configuración de red** de la máquina virtual (VM) Ubuntu Server: *NAT o Bridged*

- Instalación de paquetes necesarios

```bash
# Actualizar repositorios y paquetes instalados
sudo apt update && sudo apt upgrade -y

# Instalación de paquetes para DHCP
sudo apt install isc-dhcp-server -y

# Instalación de paquetes para DNS
sudo apt install bind9 -y

# Instalación de otros paquetes
sudo apt install dig grc nmap nslookup whois -y
```

## 2. Configuración de servicio DHCP

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
            addresses: [192.168.100.129/27]
            gateway4: 192.168.1.1   # ...
            nameservers:
                addresses: [192.168.100.129]
```

- Aplicamos configuración y verificamos que tenemos IP privada estática

```bash
sudo netplan apply
ip -c a           # enp0s3: 192.168.100.129/27
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
option domain-name "asir.com";
option domain-name-servers ns1.asir.com, ns2.asir.com;

default-lease-time 600;
max-lease-time 7200;
ddns-update-style none;

subnet 192.168.100.128 netmask 255.255.255.224 {
    range 192.168.100.132 192.168.100.158;
    option subnet-mask 255.255.255.224;
    option routers 192.168.100.129;
    option domain-name-servers 192.168.100.129;
    option domain-name "asir.com";
}

host www_cliente_linux {
    hardware ethernet 08:00:27:9c:6a:c1;
    fixed-address 192.168.100.130;
}

host ftp_cliente_windows {
    hardware ethernet 08:00:27:58:d0:b7;
    fixed-address 192.168.100.131;
}
```


## 3. Configuración de servicio DNS

- Primero 'forwarders'

```bash
sudo vim /etc/bind/named.conf.options
```
```c
options {
        directory "/var/cache/bind";

        forwarders {
                192.168.100.129
        };

        dnssec-validation auto;
        // listen-on port 53 {192.168.100.129;}
        listen-on-v6 { any; };
};
```

- Luego archivo de configuración principal `named.conf.local`

```bash
sudo vim /etc/bind/named.conf.local
```
```c
// Resolución Directa
zone "asir.com" {
        type master;
        file "/etc/bind/db.asir.com";
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

- Ahora creamos el archivo de zona Directa `db.asir.com`

```bash
sudo cp /etc/bind/db.local /etc/bind/db.asir.com
# sed s/localhost/asir.com./g /etc/bind/db.asir.com
sudo vim /etc/bind/db.asir.com
```
```conf
$TTL    604800
@       IN      SOA     ns.asir.com.   root.asir.com. (
                                2        ; Serial
                           604800        ; Refresh
                            86400        ; Retry
                          2419200        ; Expire
                           604800 )      ; Negative Cache TTL
;     
@       IN      NS        ns.asir.com.
;@      IN      A         192.168.100.129
;@      IN      AAAA      ::1

www     IN      A         192.168.100.130   ; self
web     IN      A         192.168.100.130   ; Arch
ftp     IN      A         192.168.100.131   ; Windows

;Dns     IN      CNAME     ns.asir.com
;Web     IN      CNAME     www.asir.com
;Ftp     IN      CNAME     ftp.asir.com
```

- Por último el de zona Inversa `db.asir.com`

```bash
sudo cp /etc/bind/db.127 /etc/bind/db.192
sudo vim /etc/bind/db.192
```
```conf
$TTL    604800
@       IN      SOA  ns.asir.com.     root.asir.com. (
                              1          ; Serial
                         604800          ; Refresh
                          86400          ; Retry
                        2419200          ; Expire
                         604800 )        ; Negative Cache TTL
;

@        IN     NS      ns.asir.com.
129      IN     PTR     ns.asir.com.
130      IN     PTR     www.asir.com.
131      IN     PTR     ftp.asir.com.
```

## 4. Reiniciar y verificar server

- Reinicar los servicios para aplicar la nueva configuración

```bash
# Reiniciar el servicio DHCP
sudo systemctl restart isc-dhcp-server

# Reiniciar el servicio DNS
sudo systemctl restart named
```
- Verificar servicios en servidor

```bash
# Verificar que DHCP está activo
echo "systemctl status isc-dhcp-server" | grep Active

# Verificar que DNS está activo
echo "systemctl status named" | grep Active

# Verificar que el DNS funciona correctamente
dig www.asir.com
resolvectl status
nslookup ftp.asir.com
nslookup 192.168.100.131
ping -c4 www.asir.com
curl www.asir.com
```

## 5. Demostración con clientes

> ...

- Windows (ftp.asir.com)

```ps1
New-NetFirewallRule -DisplayName "Allow ICMPv4-In" -Protocol ICMPv4
ipconfig /all
ping ns.asir.com
curl www.asir.com
```

- Linux

```bash
ping ns.asir.com
```