# UD 3.2 - DHCP DNS & HTTP WindowsServer2022

## Enunciado

Dada la dirección IP `174.210.100.2` crear *10* subredes. Quedaros con la *segunda subred* para asignar rango.
Haz **una reserva** para un cliente linux.
Crea el dominio `segundo.net`. Crea el **host** y **alias** del servicio web.
Crea un servidor web para dar gestión a la página web.
Debe funcionar todo desde el cliente windows y linux.

- [UD 3.2 - DHCP DNS \& HTTP WindowsServer2022](#ud-32---dhcp-dns--http-windowsserver2022)
  - [Enunciado](#enunciado)
  - [Resolución](#resolución)
    - [0. Subnetting: 174.210.100.16/28](#0-subnetting-1742101001628)
    - [1. Instalación servicios + IP estática](#1-instalación-servicios--ip-estática)
    - [2. Configuración DHCP](#2-configuración-dhcp)
    - [3. Configuración DNS](#3-configuración-dns)
    - [4. Configuración IIS](#4-configuración-iis)


## Resolución

### 0. Subnetting: 174.210.100.16/28

- Cálculo

```yaml
# 174.210.100.-2: 10 subredes

# X Subnets:
#     - 2^n >= x
#     - /mask + n

2^4 >= 10:
    /24 + 4 = 28:
        - 174.210.100.-0000-0000        # 1: 174.210.100.100.0/28
        - 174.210.100.-0001-0000        # 2: 174.210.100.100.16/28

```

- Segunda subred de 10 para servicios DHCP/DNS/IIS

```yaml
Direccion red:  174.210.100.16/28
Primer host:    174.210.100.17          # en nuestro caso, el servidor DHCP+DNS+IIS
Ultimo host:    174.210.100.30
Broadcast:      174.210.100.31
```


### 1. Instalación servicios + IP estática

> **Configuración de red VM**: bridged o NAT

```yaml
Administrador del servidor: Administrar:
    Agregar roles y caracteristicas

- Tipo de instalacion: Caracteristicas o roles
- Seleccion de servidor: VM (192.168.1.47)
- Roles de servidor: DHCP + DNS + IIS
    - Incluir herramientas de administracion: si
    # AVISO NO DIRECCION ESTATICA == OK
    - Caracteristicas: ...
    - Servidor DHCP: ...
    - Servidor DNS: ...
    - Servidor IIS:
        Servicios de rol: ...                       # ... FTP
    - Confirmacion: no reiniciar - instalar

Completar configuracion de DHCP: confirmar crear grupos de seguridad 'Admin DHCP' y 'Usuarios DHCP'
```

> **Configuración de red VM**: red interna

- Configurar IP estática

```yaml
Panel de control: Redes e internet:
    Centro de redes y recursos compartidos: Ethernet

Propiedades:
    Protocolo de Internet version 4 TCP/IPv4: Propiedades:
        Usar siguiente direccion IP:
            - Direccion IP:         174.210.100.17
            - Mascara de subred:    255.255.255.240         # /28
            - Default gateway:      174.210.100.17

            # - Default gateway:      192.168.0.1         # Advertencia: la puerta de enlace predeterminada no está en el mismo segmento de red (subred) que definen la dirección IP y la máscara de subred. ¿Desea guardar esta configuración?
        
        Usar siguientes direcciones DNS:
            - 174.210.100.17
            - 8.8.8.8
```

### 2. Configuración DHCP

```yaml
Administrador del servidor: Herramientas:
    DHCP

IPv4: Ambito nuevo:
    - Nombre: WinSer22
    - Direccion IP inicial: 174.210.100.20
    - Direccion IP final: 174.210.100.30
    - Longitud: 28
    - Mascara subred: 255.255.255.240
    # - Intervalo de direcciones excluido: 174.210.100.18 a 174.210.100.19
    - Duracion de concesion: 8 horas
    - Enrutador/Puerta de enlace: 174.210.100.17
    - Dominio primario: segundo.net                 # 174.210.100.17, 8.8.8.8
    # - WINS: ...
    - Activar ambito: si
        # 'Para proporcionar alta disponibilidad ...configurar "conmutación por error"'
```
```yaml
Administrador del servidor: Herramientas:
    DHCP

IPv4: Ambito 174.210.100.17:
    Reservas: Reserva Nueva:
        - Nombre: ClienteLinux
        - Direccion IP: 174.210.100.19
        - Direccion MAC: 08-00-27-9c-6a-c1
```

### 3. Configuración DNS


```yaml
Administrador del servidor: Herramientas:
    DNS

Zona Inversa: Zona nueva:
    - Tipo de zona: zona principal
    - Protocolo: IPv4
    - Id. de red: 174.210.100
    - Crear archivo: 100.210.174.in-addr.arpa.dns
    - Actualizacion dinamica: no
    - Finalizar

Zona Directa: Zona nueva:
    - Tipo de zona: zona principal
    - Nombre de zona: segundo.net
    - Crear archivo: segundo.net.dns
    - Actualizacion dinamica: no
    - Finalizar
```
```yaml
Zona Directa: segundo.net:

    Host nuevo -A o AAAA-:
        - Nombre: www
        - FQDN: www.segundo.net.
        - Direccion IP: 174.210.100.17
        - Crear PTR: si                     # zona inversa

    Alias nuevo -CNAME-:
        - Nombre: web
        - FQDN: web.segundo.net.
        - Host destino: www.segundo.net
```

### 4. Configuración IIS

```bash
mkdir C:\inetpub\mysite
nvim C:\inetpub\mysite\index.html

mkdir C:\inetpub\mysite\js
nvim C:\inetpub\mysite\js\script.js

mkdir C:\inetpub\mysite\css
nvim C:\inetpub\mysite\style.scss
```

```yaml
Administrador del servidor: Herramientas:
    Administrador de Internet Information Services (IIS)

Conexiones: WIN-...: Sitios:
    Default Web Site: quitar
    Agregar sitio web:
        - Nombre: segundo
        - Ruta: C:\inetpub\mysite
        - Tipo: http
        - Dirección IP: 174.210.100.17
        - Puerto: 80
        Iniciar sitio web inmediatamente: si
```