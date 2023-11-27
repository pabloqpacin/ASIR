# TR1 Actividad Evaluable <br> Servicios DHCP & DNS en Ubuntu Server


- [TR1 Actividad Evaluable  Servicios DHCP \& DNS en Ubuntu Server](#tr1-actividad-evaluable--servicios-dhcp--dns-en-ubuntu-server)
- [========================================](#)
  - [Enunciado](#enunciado)
  - [Objetivos](#objetivos)
- [========================================](#-1)
  - [Instalación DHCP](#instalación-dhcp)
  - [Configuración DHCP](#configuración-dhcp)
  - [Instalación DNS](#instalación-dns)
  - [Configuración DNS](#configuración-dns)

# ========================================
## Enunciado

<!-- <details> -->

```yaml
Actividad evaluable: 0.5
Tiempo estimado: 5 horas

Servicios DHCP y DNS:
        - server: Ubuntu
        - cliente:
            - Windows 10
            - Linux VM ...

Objetivos:
    RA1: Administra servicios de resolución de nombres,
         analizándolos y garantizando la seguridad del servicio.
    RA2: Administra servicios de configuración automática, identificándolos
         y verificando la correcta asignación de los parámetros.

Formato de entrega:
    - nombre archivo: Quevedo_Pablo_Act.1.pdf

Instrucciones:
    Manual en pdf donde se muestre la instalación y configuración de los servicios en el servidor Ubuntu Server.
    También se debe mostrar que los servicios funcionan en los clientes Windows y Linux.
```
</details>


## Objetivos

- hacer todo un script...
  - cambiar `sudo vim` por `sudo sed`
  - ojo con las variables tipo interfaces, direcciones, etc. -- COHERENCIA SUPER IMPORTANTE, reliable info-gathering

# ========================================

> Ubuntu Server 22.04
<!-- > Leap || RHEL -->
<!-- > Debian ... -->


## Instalación DHCP

- Prep VM

```yaml
Sistema: Ubuntu Server 22.04
Configuración:
    Red: red interna    # bridged primero para instalar el paquete
```

- Instalación servidor DHCP

```bash
sudo apt update
sudo apt ugprade -y

sudo apt-get install isc-dhcp-server
```

- Configuración tarjeta de red del servidor -- Asignación IP estática (en red interna) mediante *NetworkManager*

```bash
sudo nvim /etc/netplan/00-installer-config.yaml
```
```yaml
# /etc/netplan/00-installer-config.yaml
foo:
    bar: baz
```
```bash
sudo netplan apply
```

- Editar configuración del servicio DHCP

```bash
sudo nvim /etc/default/isc-dhcp-server
# sudo sed <añadir interfaces a la penúltima línea...>

sudo nvim /etc/dhcp/dhcpd.conf
# file /var/run/dhcp.pid

systemctl status dhcpd


# ...

dhcpd -t -cf /etc/dhcp/dhcpd.conf


```



## Configuración DHCP



## Instalación DNS



## Configuración DNS


