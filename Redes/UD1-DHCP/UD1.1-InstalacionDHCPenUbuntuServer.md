# UD1.1 - DHCP con servidor 

Instala el servicio DHCP en un servidor UBUNTU SERVER para dar la configuración de todos los parámetros a un cliente windows y un cliente linux.

Crea subredes para poder meter 60 equipos en cada subred. De las subredes obtenidas tienes que usar la **segunda** para asignar la ip al servidor y el rango de direcciones disponible para los equipos.

Debes de hacer un manual de instalación y configuración de los servicios y, también, demostración en los clientes de que funciona correctamente.

- [UD1.1 - DHCP con servidor](#ud11---dhcp-con-servidor)
  - [0. Subnetting: 192.168.1.64/26](#0-subnetting-19216816426)
  - [1. Instalación del servicio DHCP](#1-instalación-del-servicio-dhcp)
  - [2. Asignación IP estática para servidor en Red Interna: netplan](#2-asignación-ip-estática-para-servidor-en-red-interna-netplan)
  - [3. Interfaz IPv4 para servicio DHCP: ids](#3-interfaz-ipv4-para-servicio-dhcp-ids)
  - [4. Configuración y reinicio servicio DHCP: dhcpd](#4-configuración-y-reinicio-servicio-dhcp-dhcpd)
  - [5. Demostración con clientes Linux y Windows](#5-demostración-con-clientes-linux-y-windows)

> **NOTA 1**: el siguiente comando imprimirá la dirección IP privada asignada a la máquina

```bash
hostname -I | awk '{print $1}'
```
> **NOTA 2**: en mi caso, la interfaz de ethernet es `enp0s3`, en otros ordenadores puede ser distinta. El siguiente comando imprimirá el nombre de la interfaz ethernet de la máquina

```bash
ip -o link show | grep -v 'lo' | awk -F ': ' '{print $2}' | head -n1
```


## 0. Subnetting: 192.168.1.64/26

- Cálculo

```bash
# X Hosts:
#     - 2^n-2 >= x
#     - /32 - n

# 192.168.1.-0/24: subredes para 60 equipos
2^n-2 >= 60: 2⁶-2 >= 60: 64-2 >= 60:
/32 - 6 = /26:
    192.168.1.-00-000000        # 1: 192.168.1.0/26
    192.168.1.-01-000000        # 2: 192.168.1.64/26
    192.168.1.-10-000000        # 3: 192.168.1.128/26
    192.168.1.-11-000000        # 3: 192.168.1.192/26
```

- Segunda subred para servicio DHCP

```yaml
Direccion red: 192.168.1.64/26
Primer host: 192.168.1.65           # en nuestro caso, el servidor
Ultimo host: 192.168.1.126
Broadcast: 192.168.1.127
```

## 1. Instalación del servicio DHCP

> **Configuración de red** de la máquina virtual (VM) Ubuntu Server: *NAT o Bridged*

- Instalación de paquetes necesarios

```bash
# Instalar el servidor dhcp y opcionalmente nmap y grc (colorear)
sudo apt update && sudo apt upgrade -y
sudo apt install isc-dhcp-server grc nmap -y
```

## 2. Asignación IP estática para servidor en Red Interna: netplan

> **Configuración de red** de la VM: *Red Interna*

- Primero verificamos que no tenemos conexión (direccionamiento ip) en la interfaz de ethernet. Al no depender de otro servidor DHCP, podremos implantar y ofrecer el servicio desde nuestra máquina

```bash
ip -c a     # enp0s3: <SIN DIRECCIONAMIENTO>
```

- Asignar dirección IP estática al servidor en red interna y configurar interfaz ethernet para no buscar otros servidores DHCP que proporcionen direccionamiento

```bash
sudo vim /etc/netplan/00-installer-config.yaml
```

```conf
network:
    version: 2
    renderer: networkd
    ethernets:
        enp0s3:
            dhcp4: false
            addresses: [192.168.1.65/26]
            gateway4: 192.168.1.1   # ...
            nameservers:
                addresses: [8.8.8.8, 8.8.4.4]
```

```bash
sudo netplan apply
```

- Comprobamos que se aplica el direccionamiento estático

```bash
ip -c a     # enp0s3: 192.168.1.65/26
```

## 3. Interfaz IPv4 para servicio DHCP: ids

- Asignamos una interfaz de red para el servicio DHCP

```bash
sudo vim /etc/default/isc-dhcp-server
```
```conf
INTERFACESv4="enp0s3"
```

## 4. Configuración y reinicio servicio DHCP: dhcpd

- Esta configuración será aplicada en la red donde el servicio DHCP esté activo, por lo tanto pasará esta configuración a los clientes

```bash
sudo vim etc/dhcp/dhcpd.conf
```
```conf
subnet 192.168.1.64 netmask 255.255.255.192 {
    range 192.168.1.66 192.168.1.126;
    option subnet-mask 255.255.255.192;
    # option routers 192.168.1.65;      # ...
    option domain-name-servers 8.8.8.8, 8.8.4.4;
}

# # Esto no lo añadimos porque ya hemos modificado el archivo de 'netplan' con una IP estática para el servidor
# host servidor {
#     hardware ethernet 08:00:27:99:ee:35 # MAC
#     fixed-address 192.168.1.65
# }
```

- Reiniciamos el servicio DHCP en nuestro servidor para aplicar la configuración

```bash
# Reiniciar el servicio
sudo systemctl restart isc-dhcp-server
# Verificar que está activo
echo "systemctl status isc-dhcp-server" | grep Active
```

## 5. Demostración con clientes Linux y Windows

- Verificación en el SERVIDOR

```bash
systemctl status isc-dhcp-server
less /var/lib/dhcp/dhcpd.leases
grep dhcpd /var/log/syslog
# dhcp-lease-list
```

![server_linux](/tmp/img/redes-dhcp-server.png)

- Verificación en los CLIENTES

```bash
ip route
grc nmap 192.168.1.64/26 || \
    ping -c4 192.168.1.65
```

![cliente_linux](/tmp/img/redes-dhcp-cliente_linux.png)
![cliente_windows](/tmp/img/redes-dhcp-cliente_windows.png)
