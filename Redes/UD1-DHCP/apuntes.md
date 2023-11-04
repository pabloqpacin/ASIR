# Unidad 1 McGrawHill <br> Servicio de Configuración Automática de Red (DHCP)

```md
# Objetivos
1. Reconocer el funcionamiento de los mecanismos automatizados de configuración de los parámetros de red.
2. Conocer el protocolo DHCP y los tipos de mensajes que intercambia con los clientes.
3. Instalar y administrar un servicio de configuración dinámica de los parámetros de red dentro de una red local. Realizar asignaciones dinámicas y estáticas.
4. Reconocer los problemas de seguridad que conlleva el servicio DHCP y cómo mitigarlos.
```

- [Unidad 1 McGrawHill  Servicio de Configuración Automática de Red (DHCP)](#unidad-1-mcgrawhill--servicio-de-configuración-automática-de-red-dhcp)
  - [1. Configuración de los parámetros de red](#1-configuración-de-los-parámetros-de-red)
    - [1.1 Configuración de los parámetros de red](#11-configuración-de-los-parámetros-de-red)
    - [1.2 Parámetros de configuración de red](#12-parámetros-de-configuración-de-red)
    - [1.3 Configuración manual de parámetros de red](#13-configuración-manual-de-parámetros-de-red)
    - [1.4 Configuración automática de parámetros de red](#14-configuración-automática-de-parámetros-de-red)
  - [2. El protocolo DHCP](#2-el-protocolo-dhcp)
    - [2.1 Tipos de asignaciones en DHCP](#21-tipos-de-asignaciones-en-dhcp)
    - [2.2 (!) Proceso de concesión](#22--proceso-de-concesión)
    - [2.3 Parámetros asignados por DHCP](#23-parámetros-asignados-por-dhcp)
  - [3. Administración del servicio DHCP](#3-administración-del-servicio-dhcp)
    - [3.1 Archivos y directorios del servicio DHCP](#31-archivos-y-directorios-del-servicio-dhcp)
    - [3.2 El archivo de configuración del servicio DHCP: `dhcpd.conf`](#32-el-archivo-de-configuración-del-servicio-dhcp-dhcpdconf)
      - [3.2.1 Tipos de declaraciones](#321-tipos-de-declaraciones)
      - [3.2.2 Tipos de parámetros](#322-tipos-de-parámetros)
  - [4. Servidores autorizados. Seguridad del servicio DHCP](#4-servidores-autorizados-seguridad-del-servicio-dhcp)
    - [4.1 Servidores Autorizados](#41-servidores-autorizados)
    - [4.2 Seguridad del servicio DHCP](#42-seguridad-del-servicio-dhcp)


## 1. Configuración de los parámetros de red

```md
Comenzamos la unidad estudiando la configuración de los parámetros de conexión en red, los tipos de asignación, y cómo se realiza la configuración manual o estática y la configuración automática.
Repasamos los elementos del sistema implicados en esta configuración y cómo se deben realizar los cambios en los archivos de configuración.
Todo ello constituye información básica para abordar el servicio DHCP y comprender su significado y funcionalidad.
```

### 1.1 Configuración de los parámetros de red

- Procolo y direccionamiento IP: asignar direcciones a las interfaces de red de los equipos
- Existe una configuración de parámetros de red <u>para cada</u> interfaz interfaz de red
- Finalidades de los parámetros de configuración de red:
  1. Dirección IP y máscara (para conexión a red mediante interfaz)
  2. Conexión a otras redes mediante enrutador
  3. Resolución DNS
- Tipos de configuración
  1. **Manual (fija/estática)**: manipulación directa de los archivos de configuración
  2. **Automática**: permanentemente aplicar valores otorgados
  3. **Dinámica**: asignación temporal de direccionamiento (parámetros *default-lease-time*, *max-lease-time*) por parte de un servidor


### 1.2 Parámetros de configuración de red

- Parámetros necesarios:
  - **Dirección IP**: misma red que el servidor/otros equipos
  - **Máscara de red**: determina la subred (e.g. `192.168.1.7/24`)
  - **Puerta de enlace**: dispositivo encaminamiento (router)
  - **Servidor DNS**: asignar al menos una IP... (dentro o fuera de nuestra red)

### 1.3 Configuración manual de parámetros de red

- Proceso delicado:
  - Documentar existente asignación de direcciones IP para saber ocupadas VS disponibles
  - Compartir bits de red (!)
  - Seguir criterio de ordenamiento y organización de equipos dentro de la red
  - Evitar conflictos
- Programas de configuración para equipos (Linux):
  - Escritorios: *NetworkManager* GUI (Gnome)
  - Servidores: *networkd* a través de *netplan* (`/etc/netplan`)


### 1.4 Configuración automática de parámetros de red

- Depende de otro dispositivo: al encender, busca al servidor en la red para recibir los parámetros
- Ventajas:
  - Una configuración que vale para varias redes
  - Fácil y simple
  - Evitar conflictos direccionamiento
  - Ahorro tiempo administración

> `Caso práctico 1`

## 2. El protocolo DHCP

```md
Entramos en el protocolo DHCP, que es el que gobierna los diferentes tipos de concesión de los parámetros de red. Estudiamos las características de cada uno de ellos, los puertos implicados en el servicio y la forma en que se realiza el proceso de concesión.
En el caso de no disponer de un servidor DHCP, solo hay disponible el método de asignación de IP estática y manual, y para la asignación dinámica se recurre al sistema APIPA, que asigna una IP privada dentro de un rango específico.
```

- Protocolo de nivel de APLICACIÓN (según TCP/IP)
- **Objetivo**: proporcionar un servicio de red que permita a equipos obtener <u>dinámica y automáticamente</u> los parámetros de configuración de red; modelo *cliente-servidor*
- Versiones:
  - DHCP sustituyó a BOOTP (1993)
  - Normativa RFC2131 (1997): formato, contenido y posibles mensajes entre cliente y servidor
  - RFC2132: máscara, puertaEnlace, nombreServidor, nombreDominioRed; posteriores
  - posteriores: ... (https://ietf.org)

### 2.1 Tipos de asignaciones en DHCP

- **Tipos**: determina cómo un servidor decide qué IP entregar y los tiempos (limitados/ilimitados) de asignación (concesión o *lease*)
  - **Estática o manual**: asociación IP con MAC
  - **Automática**: asignación aleatoria según disponibles sin config previa hasta su renuncia por el cliente
  - **Dinámica**: asignación tiempo limitado, para mantener dirección cliente tiene que renovar la concesión antes de caducidad

> `APIPA`...


### 2.2 (!) Proceso de concesión

- Cliente recibe concesión de IP por tiempo límitado, a la mitad el cliente tiene que empezar a renovar
- CONEXIONES (protocolo *UDP*):
  - **Servidor DHCP**: puertos 67 y 546 (IPv4, IPv6)
  - **Cliente DHCP**: puertos 68 y 547 (IPv4, IPv6)
- 4 pasos en proceso de configuración en clientes:
  1. **Solicitud**: cliente mensaje difusión a toda red para servidor (dice MAC)
  2. **Propuesta**: servidor recibe solicitud, elige IP disponible, manda mensaje ARP para verificar, y le propone la IP al cliente
  3. **Aceptación**: cliente verifica propuesta está disponible, envía difusión aceptando propuesta (dice IP y servidor proponedor), no contesta a más propuestas (mensaje informa para que tampoco haya más)
  4. **Confirmación**: servidor recibe aceptación y envía directamente confirmación con dirección, máscara y otros parámetros y configs; TIEMPO de licencia o concesión, cliente debe solicitar renovación pasada la mitad del tiempo

### 2.3 Parámetros asignados por DHCP

- **Obligatorios**: asignados sí o sí
  - Dirección IP, máscara de subred, *lease-time*, *renewal-time*, *rebinding-time*
  - Si agota tiempo sin renovar, se libera la IP
  - Renewal-time == 1/2 lease-time
  - Rebinding-time == margen para renovar o re-solicitar
- **Opcionales** cuando solicitados por el cliente
  - Dirección puerta-de-enlace, servidores DNS, nombre de dominio DNS, dirección *broadcast*, MTU
  - Servidores SMTP, nombre servidor WINS, MTU, tiempo máximo de respuesta ARP


## 3. Administración del servicio DHCP

```md
Una vez instalado el servicio, comenzamos con su configuración básica. Para ello, estudiamos la estructura del archivo de configuración y describimos la sintaxis y el uso de sus componentes.
Existe una gran variedad de directivas disponibles; cada una de ellas tiene un significado muy concreto, que hay que conocer bien para saber si se deben incluir o no, y en qué lugar del archivo de configuración.
```

### 3.1 Archivos y directorios del servicio DHCP

| archivo/dir                 | descripción
| ---                         | ---
| /etc/dhcp                   | ...
| /etc/dhcp/dhcpd.conf        | principal archivo de config del servidor
| /etc/dhcp/dhlient.conf      | archivo config del cliente
| /var/lib/dhcp/dhcpd.leases  | info concesiones activas: IP, MAC, tiempos
| /usr/sbin/dhcpd             | demonio escucha solicitudes de clientes y verifica entrega correcta
| /var/log/syslog             | log registra inicios y paradas de servicios; informa errores dhcp


### 3.2 El archivo de configuración del servicio DHCP: `dhcpd.conf`

- Cambios en archivo config servidor, necesario reiniciar servicio
- Contiene **parámetros** (globales o locales) y **declaraciones** (descripción redes, máquinas o grupos, rango direcciones...)
- Ejemplo:

```conf
declaracion_1 {
}

declaracion_N {
  parametros locales
  sub_declaracion
}
```

```bash
man dhcpd.conf
```
#### 3.2.1 Tipos de declaraciones

1. **Subnet**: necesario especificar rango de direcciones

```properties
subnet IP_red netmask mascara_de_red {
  range IP_menor IP_mayor;
  [parametros] ;
}
```

2. **Host**: reserva direcciones (para otros servidores); se declaran el nombre, MAC e IP para el equipo 

```properties
host nombre {
  [parametros] hardware ethernet direccion_MAC;
  fixed-address direccion_IP;
}
```

3. **Shared-network**: <!--problemático, no garantiza el direccionamiento--> agrupa varias declaraciones; describe red de subredes

```properties
shared-network nombre {
  [parametros_y_declaraciones] ;
  declaracion_primera_subnet ;
  [otras_declaraciones] ;
}
```

4. **Group**: agrupa varios hosts, puede haber varias en un mismo archivo

```properties
group nombre {
  [parametros_y_declaraciones_host] ;
}
```

#### 3.2.2 Tipos de parámetros

- Parámetros de red y opciones de funcionamiento del servicio
- Un mismo P. se puede declarar en varias partes del archivo y recibir distintos valores.
- Según DONDE se declara un P. se distinguen: **globales** VS **locales**
  - **Globales**: declarados FUERA de las *sentencias de declaración*, afectan a todos los clientes
  - **Locales**: DENTRO de las sentencias de declaración; PREVALECEN frente a los globales


> `option <parametro>`

| sintaxis                                | descripción
| ---                                     | ---
| authoritative;                          |
| default-lease-time segundos;            |
| max-lease-time segundos;                |
| range ip_menor ip_mayor;                |
| hardware tipo direccion_fisica;         |
| fixed-address direccion_IP;             |
| option subnet-mask mascara;             |
| option brodcast-address direccion;      |
| option routers IP;                      |
| option domain-name-servers servidores;  |

| sintaxis                        | descripción
| ---                             | ---
| ddns-updates on/off;            |
| ddns-hostname nombre;           |
| ddns-domainname nombre;         |
| ddns-update-style tipo;         |
| allow client-updates;           |
| ignore client-updates;          |
| server-identifier direccion_IP; |
| server-name nombre;             |
| option host-name nombre;        |
| option servidor direcciones_IP; |


## 4. Servidores autorizados. Seguridad del servicio DHCP

```md
La posibilidad de que en la red puedan existir varios servidores DHCP sirviendo parámetros de red crea problemas importantes en el funcionamiento del servicio. Aparte de los derivados en el aspecto de la seguridad que puede acarrear esta situación, están los derivados de las situaciones de «confusión» dentro de la red.
Los mensajes enviados por los clientes para solicitar los parámetros de red son de broadcast. Todos los servidores DHCP de la red reciben estos mensajes, y el primero que responde es el que proporcionará dichos parámetros.
Para solucionar esta situación, se creó el concepto de servidor autorizado, y será el único que podrá realizar la tarea de asignación de parámetros de red.
```

### 4.1 Servidores Autorizados

- Varios servidores DHCP (routeres con config por defecto, posible ataque...) ocasionan conflictos y problemas
- Necesidad **autorización** == `authoritative;` (en Windows, según Controlador de Dominio)

### 4.2 Seguridad del servicio DHCP

- Protocolo HCP no autenticado: no requiere credenciales recibir direccionamiento
- Ataque habitual: configurar servidor DHCP malicioso para proporcionar/controlar tráfico en red (*spoofing*)
- Ataques avanzados (*rogue DHCP server*): DdoS, man-in-the-middle (*DNS*)
- Defensa: *DHCP snooping* en switches para bloquear OFFER y ACK en puertos no autorizados para DHCP
- Recomendaciones: control de acceso a la red, auditoría para todos los servidores autorizados, configuración DHCP estática (prevenir redirecciones de tráfico)