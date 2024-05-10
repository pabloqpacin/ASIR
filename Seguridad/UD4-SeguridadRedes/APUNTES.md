# Unidad 4 McGrawHill <br> Seguridad en redes

```md
# Objetivos
1. Aprender a utilizar herramientas para la monitorización y análisis del tráfico en redes.
2. Conocer la estructura básica de una red corporativa. 
3. Aprender los conceptos más importantes acerca de la seguridad en las redes inalámbricas.
4. Conocer los riesgos de seguridad que presentan los servicios de red clásicos.
5. Aprender el significado de la defensa en profundidad de servidores.
```

- [Unidad 4 McGrawHill  Seguridad en redes](#unidad-4-mcgrawhill--seguridad-en-redes)
  - [1. Monitorización del tráfico en redes](#1-monitorización-del-tráfico-en-redes)
    - [1.1 Protocolo SNMP (Simple Network Management Protocol)](#11-protocolo-snmp-simple-network-management-protocol)
    - [1.2 Herramientas para la captura y el análisis del tráfico](#12-herramientas-para-la-captura-y-el-análisis-del-tráfico)
      - [A. TCPDUMP (|WINDUMP)](#a-tcpdump-windump)
      - [B. Escaneo de puertos](#b-escaneo-de-puertos)
      - [C. Wireshark](#c-wireshark)
  - [2. Seguridad en la red corporativa](#2-seguridad-en-la-red-corporativa)
    - [2.1 Seguridad en las redes](#21-seguridad-en-las-redes)
    - [2.2 Mecanismos =\> Protocolos =\> Servicios](#22-mecanismos--protocolos--servicios)
  - [3. Seguridad en redes inalámbricas](#3-seguridad-en-redes-inalámbricas)
    - [3.1 Seguridad de las redes inalámbricas WLAN](#31-seguridad-de-las-redes-inalámbricas-wlan)
    - [3.2 Seguridad de las redes inalámbricas](#32-seguridad-de-las-redes-inalámbricas)
  - [4. Riesgos potenciales de los servicios de red](#4-riesgos-potenciales-de-los-servicios-de-red)
    - [4.1 Seguridad en las capas](#41-seguridad-en-las-capas)
    - [4.2 Recomendaciones para la protección de los servicios de red](#42-recomendaciones-para-la-protección-de-los-servicios-de-red)
    - [4.2 Riesgos en algunos servicios](#42-riesgos-en-algunos-servicios)
      - [DNS](#dns)
      - [DHCP](#dhcp)
      - [HTTP](#http)
      - [Correo Electrónico](#correo-electrónico)
  - [5. Seguridad en los servidores](#5-seguridad-en-los-servidores)
    - [5.1 Defensa en profundidad (DiD)](#51-defensa-en-profundidad-did)
    - [5.2 Buenas prácticas de seguridad en servidores](#52-buenas-prácticas-de-seguridad-en-servidores)


## 1. Monitorización del tráfico en redes

```md
La Unidad 4 aborda la seguridad en el ámbito de las redes informáticas y comenzaremos estudiando diferentes mecanismos y herramientas de monitorización del tráfico en redes.

El objetivo de la monitorización es detectar cualquier evento producido en ella en base al control continuo del tráfico que circula por el medio de transmisión. De esta forma, el administrador puede conocer situaciones de sobrecarga de la red, cómo se distribuye el consumo del ancho de banda disponible entre los equipos conectados e, incluso, situaciones anómalas que induzcan a pensar en posibles intrusiones en la red.
```

- **Definición**: Supervisar la red o monitorizarla == controlar permanentemente la red informática para que notifique al administrador de la red cualquier evento producido en ella (sobrecarga, caída de servidores, conexiones de red...)
- **Objetivo**: saber cómo, quién y en qué se está usando el ancho de banda disponible, detectar y prevenir cuellos de botella y llevar a cabo acciones correctivas o preventivas (qué equipos, aplicaciones o protocolos ocnsumen recursos de red)
- **Aplicaciones (sniffers)**: Wireshark, ~~Etherape~~, TcpDump/WinDump
  - **Filtros**: captura VS <u>visualización</u>

### 1.1 Protocolo SNMP (Simple Network Management Protocol)

- Info de los dispositivos de red, memoria libre, uso de CPU, detección de errores, establecer alarmas, comprobar estado funcionamiento, etc.
- Agentes en dispositivo (nodos) > base de datos árbol MIB + gestor en server
- TCP/IP; SNMP trap (agentes envían respuesta sin solicitud)

### 1.2 Herramientas para la captura y el análisis del tráfico

#### A. TCPDUMP (|WINDUMP)

- **Uso**: Detectar tráfico no esperado, puertas traseras, escaneos de puertos... cualquier intrusión.
- **Filtros**: protocolos (IP, TCP, UDP, ARP...), interfaces, puertos TCP/UDP o direcciones IP, Dirección (origen|destino)

#### B. Escaneo de puertos

- **Tipos de barridos**: horizontales (varias máquinas, un puerto) VS verticales (una máquina, varios puertos)
- **Estado de puertos**: abierto VS cerrado (o filtrado con Reject) VS filtrado (mediante Drop)
- **Herramientas**: `nmap`
- **Nota**: intentar minimizar la información que ponemos al alcance de nmap mediante: NAT, Proxies,Filtrado (Drop VS Reject), IDS + Acciones de Respuesta Automática

#### C. Wireshark

...

> Docs Wireshark_Filtros.pdf, Aplicaciones_Monitorizacion_Redes_Equipos.pdf


## 2. Seguridad en la red corporativa

```md
Introducimos el concepto de red corporativa como conjunto de redes de diferentes tecnologías utilizadas para interconectar elementos distantes entre sí.
El objetivo es proporcionar servicios seguros de red a usuarios remotos que deberán ser asegurados, ya que cada uno de ellos incorpora vulnerabilidades al sistema. Las medidas de seguridad aplicables están basadas en el uso de mecanismos de seguridad y en base a ellos se construyen los protocolos de seguridad.
```

- **Red corporativa**: red que comunica lugares geográficamente distantes y que facilita el acceso remoto de usuarios, siendo todos los elementos comunicados propiedad de una organización o persona (mecanismos seguros: RedesPúblicas==VPN; distintas tecnologías cable=inalámbricas)

### 2.1 Seguridad en las redes

- 'Las redes se crean para intercambiar información entre los sistemas conectados, mediante servicios de red (eg. smtp, http, ftp...)
  - Cada **servicio** ofrecido es una puerta de entrada a nuestra organización
  - Cada uno introduce nuevas **vulnerabilidades** (+complejidad==+peligro)
- **Seguridad en redes**: Conjunto de técnicas que tratan de minimizar la vulnerabilidad de los sistemas y su información. <u>Se trata de conseguir que el coste del acceso indebido a un recurso sea superior a su valor</u>
- **Formas de protección**: se utilizan MECANISMOS de seguridad para construir PROTOCOLOS de seguridad que facilitarán la prestación de SERVICIOS de seguridad

### 2.2 Mecanismos => Protocolos => Servicios

- **Mecanismos**: criptográficos
- **Protocolo**: conjunto de reglas y formatos que determinan cómo se realiza el intercambio de información
- **Servicios**: protegen frente a ataques sobre la identidad (masquerade), los servicios (denegación), la información (revelación,manipulación...)


## 3. Seguridad en redes inalámbricas

```md
En la actualidad, el uso de las redes inalámbricas está sustituyendo a las redes cableadas debido a su inferior coste económico y a la comodidad que aporta al usuario respecto a la conectividad.
Pero, como ya se ha ido insistiendo a lo largo de las unidades, comodidad es prácticamente sinónimo de inseguridad. Las redes con tecnología inalámbrica, además de ser susceptibles a los mismos ataques que las redes cableadas, pueden sufrir otros tipos de ataques solo por el hecho de que los datos transmitidos circulan libremente por el aire, que es un canal compartido, y pueden ser interceptados por posibles intrusos.
```

...

### 3.1 [Seguridad de las redes inalámbricas WLAN](https://drive.google.com/file/d/1X70I3KihIAdiTOFLY94EupqWvCRIsJo4/view)

- ...
  - **Herramientas**: `aircrack-ng`
  - **Mecanismos de seguridad**: WEP > WPA > WPA2
  - **Buenas prácticas**: utilizar mecanismos de autenticación red-cliente, cifrar la información transmitida,
  - **Características de APs**: filtrado de MACs, creación de VPN, servidores RADIUS, WPA y WPA2, portal cautivo

### 3.2 Seguridad de las redes inalámbricas

...



## 4. Riesgos potenciales de los servicios de red

```md
Cualquier servicio de red requiere el uso de puertos para establecer las conexiones y la comunicación y, como ya se ha explicado, la apertura de puertos hace vulnerable al servidor y abre la posibilidad de ataques.
Lo más importante es, en primer lugar, tener activos y escuchando solo aquellos servicios que realmente sean necesarios; en segundo lugar, aplicar a estos servicios imprescindibles todos los mecanismos de seguridad disponibles para ellos y, en tercer y último lugar, tener el software implicado con las últimas actualizaciones de seguridad.
```

### 4.1 Seguridad en las capas

- Capa 2 o de Enlace:
  - Ataques basados en MAC y ARP
  - Ejemplos:
    - *CAM Table Overflow*: inundar la tabla de MACs de un switch para que envíe todas las tramas a todos los equipos (tipo HUB)
    - *ARP Spoofing*: infiltrarse en red para husmear paquetes en LAN, modificar o incluso detener el tráfico
- Capa 3 o de Red:
  - Vulnerabilidades asociadas a los medios de conexión (control de acceso y confidencialidad)
  - Ejemplos: redirección|pinchazos de la línea o escuchas medios inalámbricos
  - Medidas a tener en cuenta: filtrado de paquetes, monitorización routers y equipos (logs), separar redes y filtros anti-sniffing (prevenir capturación de claves)
- Capa 4 o de Transporte:
  - Problemas de autenticación|integridad|confidencialidad
  - Ejemplos: DoS, interceptación de sesiones TCP
- Capa 7 o de Aplicación:
  - Deficiencias de seguridad en protocolos (mesh de protocolos)
  - Principales amenazas: DoS, puertos abiertos vulnerables
  - Ejemplos: *DNS Spoofing*, Telnet (auth en texto plano), FTP, HTTP
  - Soluciones: cifrado, certificados digitales, SSL, TLS, SET

### 4.2 Recomendaciones para la protección de los servicios de red

- Conocer los servicios de nuestra máquina (con `netstat`, `nmap`...) y ofrecer la menor información posible de nuestro sistema

### 4.2 [Riesgos en algunos servicios](https://drive.google.com/file/d/1mGimvOdYju8V84z3hxYrdB_NjfbOL-RJ/view)

#### DNS

- Mayor peligro: modificar resoluciones DNS en server|clientes ~~para modificar las conexiones de sus destinatarios~~ -- herramienta `whois`
  - **AXFR**: ... -- `dig`
  - **DNS Spoofing**: se intenta que un usuario se conecte a un sistema controlado por el atacante y así capturar o modificar la información; traducción falsa de las direcciones y los nombres de dominio: variantes:
    - *hijacking*
    - *spoofing* 
  - Contramedidas: separar servidores DNS internos de los externos; controlar la recursividad empleada por los servidores en las búsquedas -- básicamente poner a salvo los servidores internos frente a contaminación

#### DHCP

- Protocolo inseguro por definición (bc IP + UDP); ojo 'autorización' tanto para los servidores como para los clientes...

#### HTTP

- Fallos de seguridad en servicios web: configuración en servidores, riesgos en navegadores, datos interceptables

#### Correo Electrónico

- Clientes de correo (MUA: Thunderbird, Outlook); Servidores <!--transmisión y almacenamiento--> (SMTP; MTA: Qmail, Postfix) -- Uso fraudulento (remitente falso, correo basura), vulnerabilidades (buffer overflow [dirección muy larga + MAIL FROM o RCPT TO])


## 5. Seguridad en los servidores

```md
Respecto a la seguridad en los servidores, introducimos el concepto de server hardening como fortificación o endurecimiento del servidor, que consiste en la reducción de vulnerabilidades en el sistema y el establecimiento de las medidas que mejoren la seguridad del servidor.
Explicamos el término defensa en profundidad como el conjunto de mecanismos para reducir la probabilidad de éxito de un ataque,  detallando las capas que componen esta técnica.
```

- **Hardening**: proceso de reducción de vulnerabilidades en el sistema: medidas de seguridad: un servicio == una función

### 5.1 Defensa en profundidad (DiD)

- Varias líneas defensivas (en cada capa OSI o stack TCP/IP)
- **DiD**: estrategia de ciberseguridad basada en la utilización conjunta de diferentes productos y prácticas de seguridad para mitigar el riesgo y proteger los recursos de la organización -- 'seguridad por capas' -- reducir impacto en caso de intrusión
- <u>Criterios</u> para los mecanismos de seguridad:
  - Actuación conjunta y coordinada, protección redundante
  - No existir interdependencia
  - Proporcionar protección en los puntos más vulnerables y aplicarse por capas
- Capas:
  1. **Políticas y procedimientos**: reglas, normas y procedimientos establecidos por la organización; conocios de forma apropiada, entendible y accesible
  2. **Seguridad física**: barreras, control de acceso físico y vigilancia para prevenir acceso a equipos e infraestructuras físicas
  3. **Perímetro**: punto de encuentro entre redes externas e internas -- aseguramiento del acceso remoto
  4. **Redes**: IDS para prevenir que el atacante monitorice o modifique el tráfico
  5. **Hosts**: servidores|clientes: instalar parches de seguridad, desactivar servicios no necesarios, software antimalware proactivo, cortafuegos (comunicaciones entrantes/salientes), restringir ejecución aplicaciones
  6. **Aplicaciones**: autenticación y autorización
  7. **Datos**: cifrado
  8. **Copias de seguridad**: periódicas y redundantes

### 5.2 Buenas prácticas de seguridad en servidores

1. **Establecer políticas de contraseña**: cambiar periódicamente, largas y complejas, 2FA
2. **Usar cuentas con privilegios limitados**
3. **Utilizar software anti-malware o antivirus**: especialmente en caso de servidores de correos
4. **Tener los sistemas actualizados**
5. **Usar protocolos seguros para la administración**: evitar Telnet o FTP, mejor SSH2 con claves pública/privada (cuidado con acceso remoto siendo root)
6. **Deshabilitar o desinstalar servicios no usados**
7. **Difusión de las políticas de seguridad**: necesidad de transmitir y explicar y crear consciencia de la importancia de estas medidas entre los usuarios de nuestros servicios
