# Redes — UD3: Arquitectura de Redes

<details>
<summary>Table of Contents</summary>

- [Redes — UD3: Arquitectura de Redes](#redes--ud3-arquitectura-de-redes)
  - [(A) UD3 (Modelo OSI)](#a-ud3-modelo-osi)
    - [1. Concepto de Arquitectura](#1-concepto-de-arquitectura)
    - [2. Desafíos de diseño](#2-desafíos-de-diseño)
    - [3. Funcionamiento Arq. basada en niveles](#3-funcionamiento-arq-basada-en-niveles)
    - [4. Modelos de Arq. de red](#4-modelos-de-arq-de-red)
      - [4.1 Modelo OSI](#41-modelo-osi)
      - [4.2 Protocolos TCP/IP](#42-protocolos-tcpip)
      - [4.3 Comparativa OSI vs TCP/IP](#43-comparativa-osi-vs-tcpip)
      - [4.4 Encapsulamiento Datos](#44-encapsulamiento-datos)
  - [(B) Uso Básico de Packet Tracer](#b-uso-básico-de-packet-tracer)
    - [1. Selección de Elementos para la Topología](#1-selección-de-elementos-para-la-topología)
    - [2. Modo de Simulación](#2-modo-de-simulación)
    - [3. Otras funcionalidades Básicas de Packet Tracers (GUI buttons)](#3-otras-funcionalidades-básicas-de-packet-tracers-gui-buttons)
    - [4. Configuración de Dispositivos Finales](#4-configuración-de-dispositivos-finales)
    - [5. Configuración de Dispositivos de Red (CLI)](#5-configuración-de-dispositivos-de-red-cli)
      - [Cisco IOS Command Hierarchy (src)](#cisco-ios-command-hierarchy-src)
      - [Comandos `#` Super-Usuario — 'Privileged EXEC mode'](#comandos--super-usuario--privileged-exec-mode)
      - [Comandos `(config)#`](#comandos-config)

</details>

## (A) UD3 (Modelo OSI)

<details>
<summary>UD3</summary>

### 1. Concepto de Arquitectura
1. **Definición:** Arquitectura == hardware + protocolos comunicación (capas)
2. **Características:** topología, método acceso a red, protocolos comunicación

### 2. Desafíos de diseño
- Encaminamiento (físico)
- **Direccionamiento (lógico):** identificación dispositivos
- **Acceso al medio:** competencia, orden de transmisión (colisiones)
- Detección de errores (saturación, orden)
- [Multiplexación](https://en.wikipedia.org/wiki/Multiplexing) (varias 'frecuencias' en un mismo medio)

### 3. Funcionamiento Arq. basada en niveles

Jerarquía de protocolos & medios // capas (n==proveedor) (interfaz) (n+1==usuario)

### 4. Modelos de Arq. de red
#### 4.1 Modelo OSI

Modelo teórico por capas:

1. **Capa física:** especificaciones mecánicas (conectores), electrónicas (**transmisión bits**-datos), funcionales (circuitos) y de procedimiento (secuencia eventos)
2. **Enlace de datos:** intercambio **tramas** (medio físico); detección de errores y control
3. **Red:** direccionamiento lógico intercambio **paquetes**
4. **Transporte:** segmentar, transferir y re-ensamblar datos
5. **Sesión:** organiza **diálogos**
6. **Presentación:** definición **formato** datos (+ compresión, cifrado)
7. **Aplicación:** servicio a usuario (proceso a proceso)

Hardware==1,2,3; Intermediario==4; Software==5,6,7

#### 4.2 Protocolos TCP/IP

<details>
<summary>Info</summary>

Este  modelo  TCP/IP  ya  es  una  arquitectura  en  sí  misma  (no  un  modelo  de referencia como OSI), siendo la arquitectura de red más utilizada hoy en día, ya que es un estándar abierto que es la base de las comunicaciones de Internet y de los sistemas operativos modernos. Por eso en algunos casos se habla de Familia de Protocolos de Internet refiriéndose a esta arquitectura.

Cuando nos referimos a la arquitectura TCP/IP o modelo TCP/IP, nos estamos refiriendo a un conjunto de reglas generales de diseño e implementación de protocolos de red, que permiten la comunicación de los ordenadores. La arquitectura TCP/IP se estructura en capas jerarquizadas compuesta de cuatro capas o niveles.

</details>

1. **Acceso a la red:** (OSI 1+2) medios físicos red transmisión *bits-frames*, conexión equipos en distintas redes, direccionamiento MAC físico; protocolos Ethernet-802.3 ARP
2. **Red-Internet:** direccionamiento IP lógico, conmutación *paquetes* (no ordenación) y control congestión; protocolos IP ICMP OSPF ARP
3. **Transporte:** control errores transmisión *segmentos*; protocolos UDP TCP
4. **Aplicación:** (OSI 5+6+7) gestión sockets (IP+puerto); protocolos DNS FTP SMTP-POP HTTP


#### 4.3 Comparativa OSI vs TCP/IP

| Capa  | OSI          | *PDU*   | TCP/IP      | Protocolos <!-- \| Dispositivo-->
| ---   | ---          | ---     | ---         | ---
| 7     | Aplicación   | data    | Applicación | DNS DHCP SMTP-POP FTP HTTP
| 6     | Presentación | .       | .           |
| 5     | Sesión       | .       | .           |
| 4     | Transporte   | segment | Transporte  | UDP TCP
| 3     | Red          | packet  | Red         | IP NAT ICMP OSPF
| 2     | Enlace Datos | frame   | Acceso red  | Ethernet ARP PPP
| 1     | Física       | bit     | .           |


#### 4.4 Encapsulamiento Datos

- Los "datos" se generan en las capas superiores (software) y se les añaden **"cabeceras"** para su transmisión (via hardware) progresivamente capa-a-capa
  - Encapsulamiento mediante "cabeceras" según info "protocolos" + info "control"
  - Nombres-PDU: data > segments-datagrams (chunks)  > packets (IPs) > frames (MACs) > bits

![https://geekflare.com/encapsulation-networking/](https://geekflare.com/wp-content/uploads/2023/01/howencapsulationwork.png)

- NOTAS
  - L4... TCP==Segment UDP==Datagram ([doc...](https://stackoverflow.com/questions/11636405/definition-of-network-units-fragment-segment-packet-frame-datagram))
  - L2... Header==MACs Trailer==ErrorDetection
  - {ud3-presentacion.pdf/4.DireccionamientoDatos == misma red VS red remota (direccionamiento IP)}

</details>

## (B) Uso Básico de Packet Tracer

<details>
<summary>Packet Tracer 101</summary>

### 1. Selección de Elementos para la Topología

- 3 tipos
  - Dispositivos de Red
  - Dispositivos Finales
  - Enlaces Físicos

### 2. Modo de Simulación

- 2 modos
  - Tiempo Real (por defecto)
  - Simulación

### 3. Otras funcionalidades Básicas de Packet Tracers (GUI buttons)

- a destacar
  - creación de notas
  - generación PDU simple: click dispos. origen + click dispos. destino
  - eliminar elementos

### 4. Configuración de Dispositivos Finales

- importante
  - configuración IP
  - acceso de consola a dispositivos de red
  - intercambio tarjetas físicas si es preciso

```markdown
- **Config IP:** click > Desktop > IP config
- **Acceso consola:** (conexión cable azul — puerto RS232 a Console) click > Terminal
```

### 5. Configuración de Dispositivos de Red (CLI)

<!--notas sueltas-->
* CLI: `?` al final de un comando proporciona orientación
* [`secret` VS passwd documentation](https://community.cisco.com/t5/networking-knowledge-base/understanding-the-differences-between-the-cisco-password-secret/ta-p/3163238)

#### Cisco IOS Command Hierarchy ([src](https://www.cisco.com/E-Learning/bulk/public/tac/cim/cib/using_cisco_ios_software/02_cisco_ios_hierarchy.htm))

<details>
<summary>Details</summary>

| Modo                         | Prompt
| ---                          | ---
| Usuario                      | `router>`
| Super-Usuario                | `router#`
| Config                       | `router(config)#`
| Interface level              | `router(config-if)#`
| Routing                      | `router(config-router)#`
| Line level (vty, tty, async) | `router(config-line)#`

```markdown
# Comandos Transición
- Switch> `enable`
- Switch# `configure terminal`
- Switch(config)# `interface vlan1`
- Switch(config-if)# `exit` || Ctrl+Z
```

</details>

#### Comandos `#` Super-Usuario — 'Privileged EXEC mode'

| Comando                      | Info |
| ---                          | ---  |
| `show running-config`        | ver config actual dispositivo
| `show ip interface brief`    | ver IPs/interfaz dispositivo (+estado capas1,2)
| `show interfaces [tipo num]` | detalles interfaz específica
| `write`                      | GUARDAR CONFIG efectuada en la sesión

#### Comandos `(config)#`

| Comando                       | Info |
| ---                           | ---  |
| `hostname <nombre>`           | renombrar dispositivo
| `line console`                | acceder a línea consola
| . `password <passwd>`         | cambiar contraseña SESIÓN
| . `login`                     |
| `banner motd <msg>`           | añadir mensaje de advertencia
| `enable secret <passwd>`      | contraseña encriptada > dispositivo
| `service password encryption` | encriptar contraseñas existentes en texto plano (eg. líena consola, virtuales)
| `interface [tipo num]`        | acceder para config interfaces
| . `IP address [IP] [mask]`    | 
| . `No shutdown`               | no-apagado (ENCENDER!)
| . `exit`


![example](/Redes/UD3-ArquitecturaRedes/PT-configBasica.png)

</details>