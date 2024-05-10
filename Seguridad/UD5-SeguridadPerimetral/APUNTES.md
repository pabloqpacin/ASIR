# Unidad 5 McGrawHill <br> Seguridad Perimetral

```md
# Objetivos
1. Aprender el concepto de seguridad perimetral y las tecnologías asociadas a ella.
2. Conocer el funcionamiento de los cortafuegos, sus tipos y características.
3. Aprender a configurar diferentes tipos de cortafuegos según la topología de la red utilizada.
4. Conocer el concepto de red privada virtual, su clasificación, configuración y uso.
5. Conocer la funcionalidad de los servidores de acceso remoto y los protocolos de autenticación asociados mas importantes.
```

- [Unidad 5 McGrawHill  Seguridad Perimetral](#unidad-5-mcgrawhill--seguridad-perimetral)
  - [1. Seguridad perimetral](#1-seguridad-perimetral)
    - [1.1 Cortafuegos](#11-cortafuegos)
    - [1.2 Sistemas de detección y prevención de intrusos (IDS/IDPS)](#12-sistemas-de-detección-y-prevención-de-intrusos-idsidps)
    - [1.3 Honeypots](#13-honeypots)
    - [1.4 Pasarelas antimalware y antiSpam](#14-pasarelas-antimalware-y-antispam)
    - [1.5 Redes privadas virtuales (VPN)](#15-redes-privadas-virtuales-vpn)
    - [1.6 Seguridad perimetral: ejemplo de arquitectura](#16-seguridad-perimetral-ejemplo-de-arquitectura)
    - [1.7 Zona desmilitarizada (DMZ)](#17-zona-desmilitarizada-dmz)
      - [A. Arquitectura débil de subred protegida](#a-arquitectura-débil-de-subred-protegida)
      - [B. Arquitectura fuerte de subred protegida](#b-arquitectura-fuerte-de-subred-protegida)
      - [C. Router frontera](#c-router-frontera)
  - [2. Cortafuegos: clasificación. Cortafuegos de filtrado de paquetes](#2-cortafuegos-clasificación-cortafuegos-de-filtrado-de-paquetes)
    - [2.1 Componentes de un cortafuegos](#21-componentes-de-un-cortafuegos)
    - [2.2 Clasificaciones](#22-clasificaciones)
      - [A. Según la tecnología utilizada](#a-según-la-tecnología-utilizada)
      - [B. Según área de influencia](#b-según-área-de-influencia)
    - [2.3 Cortafuegos de filtrado de paquetes TCP/IP ("IPFW")](#23-cortafuegos-de-filtrado-de-paquetes-tcpip-ipfw)
      - [`iptables`|`nftables`](#iptablesnftables)
  - [3. Cortafuegos con NAT. Pruebas de funcionamiento](#3-cortafuegos-con-nat-pruebas-de-funcionamiento)
    - [3.1 Funcionamiento de NAT](#31-funcionamiento-de-nat)
      - [A. Cambio de origen: objetivo snat](#a-cambio-de-origen-objetivo-snat)
      - [B. Cambio de destino: objetivo dnat](#b-cambio-de-destino-objetivo-dnat)
    - [3.2 Pruebas de funcionamiento del cortafuegos](#32-pruebas-de-funcionamiento-del-cortafuegos)
    - [3.3 Registros de sucesos de un cortafuegos](#33-registros-de-sucesos-de-un-cortafuegos)
    - [3.4 Distribuciones libres para implementar cortafuegos en máquinas dedicadas](#34-distribuciones-libres-para-implementar-cortafuegos-en-máquinas-dedicadas)
  - [4. Redes privadas virtuales](#4-redes-privadas-virtuales)
    - [4.1 Clasificación de las VPN](#41-clasificación-de-las-vpn)
      - [A. Según la tecnología del operador](#a-según-la-tecnología-del-operador)
      - [B. Según el nivel OSI](#b-según-el-nivel-osi)
      - [C. Según la topología](#c-según-la-topología)
    - [4.2 Modos de conexión mediante VPN](#42-modos-de-conexión-mediante-vpn)
      - [Conexión de acceso remoto (VPDN)](#conexión-de-acceso-remoto-vpdn)
      - [Interconexión de redes o LAN-a-LAN (site-to-site)](#interconexión-de-redes-o-lan-a-lan-site-to-site)
    - [4.3 VPN a nivel de red: IPSec](#43-vpn-a-nivel-de-red-ipsec)
    - [4.4 VPN a nivel de transporte: SSL/TLS](#44-vpn-a-nivel-de-transporte-ssltls)
    - [4.5 VPN a nivel de aplicación: SSH](#45-vpn-a-nivel-de-aplicación-ssh)
  - [5. Servidores de acceso remoto](#5-servidores-de-acceso-remoto)
      - [Protocolos de autenticación](#protocolos-de-autenticación)
- [DOCS](#docs)


## 1. Seguridad perimetral

```md
La defensa perimetral constituye uno de los pilares fundamentales de la seguridad de la red. Su objetivo es controlar la frontera que separa la red interna del exterior, y vigilar las comunicaciones para evitar accesos no autorizados, salida de datos desde el interior y ataques desde el exterior. 
Existen muchas tecnologías aplicables a la seguridad perimetral y de entre todas ellas, en esta unidad, vamos a estudiar los cortafuegos, que son un elemento de red en el que se define la política de accesos, de forma que se permite o se deniega el tráfico según cómo se definan sus reglas. 
Haremos también una breve descripción de otros mecanismos de seguridad perimetral, que iremos detallando a lo largo de la unidad.
```

- **Perímetro**: conjunto de máquinas y dispositivos de una orga. que interactúan con el exterior; {dinámico y cambiante} -- **Seguridad**: prevenir accesos no permitidos, salidas de datos y ataques
- **Seguridad perimetral**: arquitectura y elementos de red que proporcionan seguridad al perímetro de una red interna frente a otra, normalmente Internet, en la que no se confía.
- **Elementos importantes**: firewall, IDS/IDPS, pasarelas antimalware y antispam, honeypots, VPNs
- **Medidas**: filtrar la información que entra en la red, analizar y prevenir intrusiones, usar técnicas/tecnologías seguras
- **Funciones**: proteger información valiosa, rechazar conexiones no seguras, ÚNICO PUNTO de conexión con el exterior, controlar el tráfico


### 1.1 Cortafuegos

- Aseguran que las comunicaciones cumplen las <u>políticas de seguridad</u>: controlan las conexiones, bloquean el tráfico, detectan comportamientos extraños, evitan accesos no permitidos
- Se define la política de accesos, permitiendo o denegando el tráfico según las reglas definidas
- **Filosofías de uso**: política restrictiva (lista blanca) VS política permisiva (lista negra)

### 1.2 Sistemas de detección y prevención de intrusos (IDS/IDPS)

- **IDPS**: Dispositivo que monitoriza y genera alarmas si se producen alertas de seguridad
- **Funciones**: identificación ataques, automatización búsqueda de patrones en el tráfico, auditoría configuraciones y vulnerabilidades, registro eventos, bloqueo del ataque, informe a administradores

### 1.3 Honeypots

- **Honeypot**: Sistema configurado con vulnerabilidades y utilizado para recoger ataquese que permite estudiar nuevas técnicas.
- **Tipos**: baja interación VS alta interacción (...)
- **Ejemplos**: HoneyBOT, SPECTER, GHH
- Info: recogen muestras de virus o spam; han de permanecer especialmente controlados y aislados de la red

### 1.4 Pasarelas antimalware y antiSpam

....

### 1.5 Redes privadas virtuales (VPN)

- **VPN**: utilizan una infraestructura pública (no segura) para acceder a una red privada de forma segura
- **Características**: incluyen autenticación y autorización (gestión de usuarios|roles|permisos), integridad mediante hashes, confidencialidad (cifrado DES|3DES|AES), garantizan el "no repudio" ya que los datos están firmados

### 1.6 Seguridad perimetral: ejemplo de arquitectura

- Instalación de cortafuegos (DMZ y red interna + Política restrictiva) > Instalación de antispam y antivirus > Instalación de NIDS > Segmentación de servicios (web, pasarela antivirus/antispam) > Servicios internos (BD, correo) > clientes remotos usan VPN

### 1.7 Zona desmilitarizada (DMZ)

- **DMZ**: Diseño de una red local ubicada entre la red interna y la externa (Internet)
- **Características**: proporciona servicios al exterior (email, DNS, web, ftp... expuestos), protegida por uno o n cortafuegos que restringen el tráfico entre las 3 redes; accesos a la DMZ controlados mediante *PAT* (Port Address Translation)

#### A. Arquitectura débil de subred protegida

- Usa una zona DMZ detrás de un cortafuegos de perímetro para proteger la red interna (3 interfaces en el equipo firewall)

#### B. Arquitectura fuerte de subred protegida

- Usa una zona DMZ entre dos cortafuegos (de acceso y de contención) para proteger la red interna (2 proveedores distintos)

#### C. Router frontera

- ...
- **Protocolos**: EGP, BGP...

---

## 2. Cortafuegos: clasificación. Cortafuegos de filtrado de paquetes

```md
Entramos de lleno en el estudio de los cortafuegos como uno de los elementos fundamentales de la seguridad perimetral.
Diferenciaremos entre lo que son funciones básicas del cortafuegos de aquellas otras tareas que no lo son y, de esa forma, nos centraremos en su ámbito de uso. Introducimos la clasificación de los cortafuegos en base a dos premisas (tecnología y área de influencia); y comenzamos a detallar las características fundamentales de funcionamiento de los cortafuegos de filtrado de paquetes, que actúan en los niveles de red y transporte.
```

- **Definiciones**:
  - Combinación de técnicas|políticas de seguridad|tecnologías (hard + soft) encaminadas a proporcionar seguridad en la red: controlando el tráfico entre una red privada e Internet
  - Cualquier sistema/red utilizado para separar y asegurar una máquina|subred del resto, protegiéndola de servicios y protocolos peligrosos (amenazas)
- **Funciones**: filtrado de paquetes (permitir/denegar acceso), monitorizar el tráfico (supervisar destino/orgien/cantidad info), aislar secciones de red interna, almacenar paquetes para futuro análisis
- **NO Funciones**: proteger de amenazas internas, protección frente a ataques NO catalogados, proteger servicios/clientes válidos pero vulnerables, entrada de malware
- **Estrategias**:
  - *Permiso predeterminado (política permisiva o lista negra)*: fácil pero inseguro
  - *Denegación predeterminado (política restrictiva o lista blanca)*: difícil pero seguro

### 2.1 Componentes de un cortafuegos

- **Componentes**:
  - **Filtros**: hardware (routers) o software que filtra paquetes
  - **Nodos bastión**: puntos de contacto entre la red local e Internet, vulnerables por definición

### 2.2 Clasificaciones

- **Principios**:
  - El tráfico de la red interna que salga debe pasar por el cortafuegos
  - Solo el tráfico permitido en la pol. de seg.  debe poder atravesar el cortafuegos
  - El control de accesos se hace mediante el control de servicios, direcciones y usuarios

#### A. Según la tecnología utilizada

1. **Filtrado de paquetes sin estado (Stateless)**: nivel 3 OSI; control de red según reglas predefinidas (autorizar denegar tráfico paquetes)
2. **Filtrado de paquetes con estado (Stateful Packet Inspection)**: permisos según cabeceras paquetes (IPs origen/destino); monitorizar conexiones entrantes|salientes; determina conexiones existentes y puede limitar su número (VS DDoS); registro total
3. **Nivel de aplicación (ALG - Application Layer Gateway) -- Proxy**: gestiona tráfico mediante proxy intermediario entre servidores y clientes; recibe peticiones, analizan, filtran y transmiten
4. **Última generación (Next-Gen. Firewall)**: aúnan los tipos anteriores; filtrado paquetes dinámico|estático, soporte PVN; inspeccionan cabeceras IP|TCP|UDP

#### B. Según área de influencia

1. **Personales**: integrados en el OS -- iptables|nftables|UFW, ipfirewall, Firewall de MS Defender, Firewall Security <!--Linux, FreeBSD, Windows, macOS>
2. **Small Office - Home Office**: incorporan antivirus, filtrado IP, filtrado contenidos web, detección intrusos...
3. **Corporativos**: gran potencia y capacidad (miles de conexiones)


### 2.3 Cortafuegos de filtrado de paquetes TCP/IP ("IPFW")

- Funcionan filtrando las comunicaciones en ambos sentidos entre sus interfaces internas y externas <!--red local VS internet-->;  ANÁLISIS DE CABECERAS DE PAQUETES NO DE LOS DATOS
- Lista de reglas simples y <u>encadenadas</u> (Aceptación|Rechazo(se avisa)|Denegación(no se avisa, la máquina podría estar apagada)); la más importante es la cadena de entrada de la interfaz externa


#### `iptables`|`nftables`

- **Filtrado**: se decide si accept|reject|deny paquetes TCP en función de las cabeceras (mediante las cuales se establece la conexión TCP-handshake)
- **Tablas**:
  - `filter`: default, filtrado de paquetes
  - `nat`: transforma IP privada en pública y viceversa -- 'utilizada para que otras máquinas se conecten a servicios a través de la IP de la máquina, modificando la cabecera de los paquetes'
  - `mangle`: utilizada para alterar el estado de un paquete
- <u>Info</u>:
  - Cada una tendrá sus **cadenas internas** que determinan las acciones que ejecutará el filtro de red sobre el paquete
  - El orden de las reglas es importante (eg. no tiene sentido primero denegar todo y luego redirigir algo)
  - <u>"Si el paquete no cumple la primera regla pasa a la siguiente. Si la cumple, la regla decide qué se hace con el paquete recibido, y si no la cumple, pasa a la siguiente. Así sucesivamente hasta que se llega a la última regla, que es la que se aplica por defecto"</u>

```bash
# Filter table
{ sudo iptables -L || sudo nft list table filter } | bat -l conf
# NAT table
{ sudo iptables -t nat -L || sudo nft list table nat } | bat -l conf
# Mangle table
{ sudo iptables -t mangle -L || sudo nft list table mangle } | bat -l conf
```

> Docs `IPtables.pdf` y `NAT.pdf`


## 3. Cortafuegos con NAT. Pruebas de funcionamiento

```md
Seguimos con el estudio de los cortafuegos de filtrado de paquetes, pero en este apartado trabajaremos con la tabla NAT para realizar traducciones de direcciones IP de origen y destino.
La tabla NAT de IPtables permite el enmascaramiento de direcciones IP; es decir, la posibilidad de camuflar una red local detrás de una única IP válida. De esta forma podemos utilizar una única dirección IP pública para dar servicio a un grupo de equipos que están detrás del cortafuegos.
Estudiaremos ejemplos en los que se verá claramente que utilizar nat con IPtables es imprescindible para gestionar peticiones web,  así como las respectivas respuestas obtenidas.
```

- ...
  - enmascaramiento ip (1 pública n privadas)
  - tabla NAT de iptables y cadenas correspondientes
  - dos tipos de reglas:
    - Traducción de direcciones de red de origen: SNAT (cambiamos la IP origen del paquete) cadena POSTROUTING
    - Traducción de direcciones de red de destino: DNAT (cambiamos la IP destino del paquete) cadena PREROUTING
  - ejemplo: n equipos en LAN > SNAT determina ip pública > salida a internet con 1 ip pública > router recibe respuesta para equipo > DNAT determina ip privada > equipo recibe respuesta


```bash
sudo iptables --table nat --source foo --destination bar --append
# --output : interfaz según cadenas OUTPUT y POSTROUTING
# --input : interfaz según cadena PREROUTING
# --protocol : TCP/UDP/ICMP
# --sport : puerto de origen
# --dport : puerto de destino
```

### 3.1 Funcionamiento de NAT

| DNAT              | SNAT
| ---               | ---
| Cadena PREROUTING | Cadena POSTROUTING
| `-i` interfaz     | `-o` interfaz
| modificar puertos y direcciones de destino<br>`--to-destination`, `--dport`, `-d` | modificar puertos y direcciones de origen<br>`--to-source`, `--sport`, `-s`


#### A. Cambio de origen: objetivo snat

- Sentido: de clientes internos a servicios externos, traducción de dentro hacia fuera
- El cambio se hace con POSTROUTING y con `-o` y `--to`
- Ejemplos:

```bash
# Cambiar dirección de origen por 192.168.1.254
sudo iptables -t nat -A POSTROUTING -o eth0 --jump SNAT --to 192.168.1.254

# Lo mismo pero para puertos 1 a 1023 TCP
sudo iptables -t nat -A POSTROUTING -p tcp -o eth0 -j SNAT --to 192.168.1.254:1-1023

# Caso especial: enmascaramiento detrás de IP válida
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
```
- La opción `MASQUERADE` de enmascaramiento se debeu utilizar siempre que la dirección IP externa del servidor se obtenga dinámicamente
- **Casos de uso de SNAT**: permitir que varios hosts de la red interna compartan una dirección pública de salida, ocultar la verdadera IP de una máquina, comunicar máquinas internas que no tienen enrutado con otras redes o con internet

#### B. Cambio de destino: objetivo dnat

- Sentido: de servicios externos a clientes internos, traducción de fuera hacia dentro
- El cambio se hace con la cadena PREROUTING, uso de `-o` y `--to`

```bash
# Cambiar la dirección de destino por 192.168.1.254
sudo iptables -t nat -A PREROUTING -i eth0 -j DNAT --to 192.168.1.254

# Todo lo que llega por eth0 cambia su destino a 192.168.1.254:8080
sudo iptables -t nat -A PREROUTING -p tcp -i eth0 -j DNAT --to 192.168.1.254:8080

# redirigir tráfico web a un proxy
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to 192.168.1.1:3128

# proxy transparente
sudo iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p tcp --dport 80 -j REDIRECT --to-port 8080
# con esta regla en el equipo que hace de puerta de enlace y cortafuegos, se redirigen todas las peticiones hacia un servidor web (puerto 80) al puerto 8080 de dicha máquina
```

### 3.2 Pruebas de funcionamiento del cortafuegos

- Comprobar qué puertos|servicios están habilitados: `netstat`, `nmap`, `hping3` <!--$ hping3 -c 5 -S -p 80 www.mecd.gob.es-->
- Valores posibles en las cabeceras: SYN, ACK, RST, PSH, URG, FIN

### 3.3 Registros de sucesos de un cortafuegos

> https://askubuntu.com/questions/348439/where-can-i-find-the-iptables-log-file-and-how-can-i-change-its-location

- Los registros de sucesos graban en un archivo todas las entradas y salidas del cortafuegos

```bash
# cuando petición al puerto 80 desde máquina local, registro en dmesg, /var/log/syslog, /var/log/kern.log
sudo iptables -A INPUT -m state --state NEW -p tcp --deport 80 -j LOG --log-prefix "NEW_HTTP_CONN: "

# less /etc/rsyslog.d/*.conf | grep -e 'UFW' -e 'msg'


# movidas ssh
sudo iptables -A INPUT -s 192.168.10.10 -p tcp -m tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --dport 22 -j LOG --log-prefix 'INTENTO DE ACCESO A SSH ' --log-level 4
sudo iptables -A INPUT -p tcp -m tcp --dport 22 -j REJECT
# ...

# Lap rimera regla acepta el acceso al puerto 22 solamente a la IP 192.168.10.10. Si es cualquier otra IP, se graba el evento en /var/log/iptables.log
```

### 3.4 Distribuciones libres para implementar cortafuegos en máquinas dedicadas

- Ejemplos: IPCop, PfSense, Kali Linux, SmoothWall, OpenWall

## 4. Redes privadas virtuales

```md
Dentro de los mecanismos de seguridad perimetral entramos ahora en el estudio de las redes privadas virtuales (VPN).
El objetivo de una VPN es transportar datos privados sobre una infraestructura de red pública estableciendo una conexión similar a la de una red LAN sobre una red como Internet; con la característica o particularidad de que  los datos viajan encapsulados, es decir, aislados, y la mayoría de las veces encriptados.
Estudiamos los diferentes criterios de clasificación de las VPN y los detalles más relevantes de cada una de estas tecnologías.
```

- **VPN**: tecnología cliente-servidor que permite establecer una conexión similar a la de una red LAN sobre una red pública como Internet, mediante mecanismos de encapsulación o tunelización y encriptación
- **Objetivo**: transportar datos privados sobre una infraestructura de red pública
- **Características**:
  - Garantizar confidencialidad, autenticidad, disponibilidad y el no repudio modificando los paquetes IP: cifrando y firmando
  - Útiles para: separar información confidencial en intranet, comunicar dos puntos distantes a través de una red pública como Internet, establecer conexiones inalámbricas seguras
  - Crear mediante: hardware (según el fabricante) VS software (más populares, protocolos: IPSec, PPTP, L2TP, SSL/TLS)
- **Ventajas**: coste, movilidad clientes, seguridad, escalabilidad, muchas tecnologías disponibles
- **Desventajas**: calidad del servicio (<u>rendimiento</u> y fiabilidad dependen del ISP), latencia, sobrecarga por encapsulación o cifrado, interoperatividad entre dos nodos, escalabilidad costosa

### 4.1 Clasificación de las VPN

#### A. Según la tecnología del operador

- Implantación por ISP según SLA (Service Level Agreement)
- Tipos:
  - **Frame Relay**, **VC-ATM**: en desuso
  - **IP/MPLS**, **VPN IP**: (MultiProtocol Label Switching: varios tipos de datos encapsulados juntos)

#### B. Según el nivel OSI

- Nivel 2: PPTP, L2F, L2TP...
- Nivel 3: IPSec
- Nivel de transporte/aplicación: SSH o SSL/TLS

#### C. Según la topología

- **Punto a punto**: ...
- **Punto-multipunto**: sede central con delegaciones (tipo estrella)
- **DWVPN**: (dinámica multipunto) los enlaces se configuran dinámicamente

### 4.2 Modos de conexión mediante VPN

#### Conexión de acceso remoto (VPDN)

<!-- - road warrior -->
- **De marcado (Dialup)**: usuario tiene que instalar|configurar|utilizar software VPN para establecer el túnel + autenticación
- "Una vez autenticado el cliente, el servidor le envía las rutas necesarias para acceder a los servidores de la organización solo a través de la VPN creada, y para el resto de los servicios a Internet, el cliente accede con su acceso a Internet normal"
- Populares pero vulnerables (en caso de malware instalado en el cliente)

#### Interconexión de redes o LAN-a-LAN (site-to-site)

- Unión de dos intranets (servidor-servidor)

### 4.3 VPN a nivel de red: IPSec

- Protocolos de nivel 3, compatibles entre varios fabricantes -- popular para movidas IPv6 con Cisco
- **Modos**: transporte (sin cifrado, cabeceras IPSec en cab. original) VS túnel (se cifra cabecera original, nueva cabecera externa con direcciones IP de extremos del túnel)
- **Autenticación**: usuario+contra, OTP, biometría, claves compartidas, PKI...

### 4.4 VPN a nivel de transporte: SSL/TLS

- Protección conexiones web (protocolo HTTP) certificando la identidad del servidor
- Fácil implantación (navegador)

### 4.5 VPN a nivel de aplicación: SSH

- ...
- `grep 'PermitTunnel' /etc/ssh/sshd_config` ...
- `ssh-keygen` ...

> Docs ...

## 5. Servidores de acceso remoto

```md
En este último apartado definiremos el concepto de servidor de acceso remoto, aunque ya hemos utilizado este tipo de servidores mediante la creación de redes privadas virtuales o en los accesos inalámbricos. En todas estas tecnologías subyace la conexión a un servidor, con características quizás diferentes, pero siempre de acceso remoto, con la particularidad de que los servidores de acceso remoto, o RAS, no requieren necesariamente conectividad a Internet, es suficiente una conexión móvil a través de la línea telefónica.
Para establecer la conexión se requiere autenticación, y en este apartado enumeraremos los protocolos de autenticación más relevantes, y ofreceremos una breve descripción y uso de estos.
```

- **RAS**: (Remote Access Server) hardware + software necesarios para proporcionar servicios a usuarios conectados de forma remota -- autenticación para usuarios y acceso a la LAN -- Posible conexión telefónica (no TCP/IP) mediante protocolo PPTP (Point to Point Tunneling Protocol)

#### Protocolos de autenticación

- Protocolos comunes:
  - **PAP**: inseguro, no cifra user+pass
  - **CHAP**: común en servidores con acceso PPP, comprueban periódicamente la identidad del cliente remoto
  - **RADIUS**: tipo AAA (Authentication, Authorization, Accounting), manejo sesiones (determinar|limitar tiempo de conexión por usuario)
  - **SPAP**: envío contra cifrada para autenticación
  - **EAP/PEAP**: transmisión inalámbrica 
  <!-- - **MS-CHAP**: ... -->
  <!-- - **TACACS**: ... -->


---

# DOCS

- [Comparativa_SSL_IPSec](https://drive.google.com/file/d/1ZXd6YjeVq6rA6Uz4n1NpanP0zmNquVfY/view)
- [Cortafuegos_Ventajas_Inconvenientes](https://drive.google.com/file/d/1sjhtuk3e7bmEXF9OvIvtkgpBRiKE-8-2/view)
- [Implementacion_VPN_Cifrado](https://drive.google.com/file/d/1nuojE3ZoYUwZdWjYQhwpywhUXcEQdiSI/view)
- **[IPtables](https://drive.google.com/file/d/1ozxvdhQdIz8zyOxkXv17A_D4CQAhgTKF/view)**
- [NAT](https://drive.google.com/file/d/1k335F46AEo7xMUDwLNSXbWowbM72iitd/view)
- [VPN_Nivel_Enlace](https://drive.google.com/file/d/1ofZrRJ8TS1Vu4lJvdzrAMOBPgrNs38BX/view)

