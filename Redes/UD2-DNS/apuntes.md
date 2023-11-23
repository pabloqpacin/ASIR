# Unidad 2 McGrawHill <br> Servicio de Nombres de Dominio (DNS)

```md
# Objetivos
1. Conocer qué aporta el servicio DNS a Internet.
2. Aprender los pasos que se dan para resolver un nombre.
3. Entender cómo se organiza la información de la base de datos DNS.
4. Instalar, configurar y administrar los servidores.
5. Descubrir las diferentes opciones del servicio dinámico de DNS.
```

- [Unidad 2 McGrawHill  Servicio de Nombres de Dominio (DNS)](#unidad-2-mcgrawhill--servicio-de-nombres-de-dominio-dns)
  - [1. El servicio DNS](#1-el-servicio-dns)
    - [1.1 Espacio de nombres de dominio](#11-espacio-de-nombres-de-dominio)
    - [1.2 Dominios por niveles](#12-dominios-por-niveles)
      - [1.2.1 Dominio raíz](#121-dominio-raíz)
      - [1.2.2 Dominios de primer nivel](#122-dominios-de-primer-nivel)
      - [1.2.3 Dominios de segundo nivel](#123-dominios-de-segundo-nivel)
      - [1.2.4 Subdominios](#124-subdominios)
    - [1.3 Tipos de dominio](#13-tipos-de-dominio)
  - [2. Resolutores de nombres](#2-resolutores-de-nombres)
    - [2.1 Proceso de resolución de un nombre de dominio](#21-proceso-de-resolución-de-un-nombre-de-dominio)
    - [2.2 Resoluciones directas y resoluciones inversas](#22-resoluciones-directas-y-resoluciones-inversas)
  - [3. Base de datos DNS](#3-base-de-datos-dns)
    - [3.1 Zonas primarias y secundarias](#31-zonas-primarias-y-secundarias)
    - [3.2 Características de las zonas primarias y secundarias](#32-características-de-las-zonas-primarias-y-secundarias)
    - [3.3 Tipos de servidores de DNS](#33-tipos-de-servidores-de-dns)
    - [3.4 Transferencias de zona](#34-transferencias-de-zona)
    - [3.5 Delegación de zonas](#35-delegación-de-zonas)
    - [3.6 Registro de recursos](#36-registro-de-recursos)
      - [3.6.1 Tipos de registro de recursos](#361-tipos-de-registro-de-recursos)
  - [4. Instalación, configuración y administración de servidores](#4-instalación-configuración-y-administración-de-servidores)
    - [4.1 Instalación](#41-instalación)
    - [4.2 Estado del servicio DNS](#42-estado-del-servicio-dns)
    - [4.3 Archivos de configuración](#43-archivos-de-configuración)
    - [4.4 Opciones generales (`named.conf.options`)](#44-opciones-generales-namedconfoptions)
    - [4.5 Opciones de las zonas (`named.conf.local`)](#45-opciones-de-las-zonas-namedconflocal)
      - [4.5.1 Zona de resolución Directa](#451-zona-de-resolución-directa)
      - [4.5.2 Zona de resolución Inversa](#452-zona-de-resolución-inversa)
      - [4.5.3 Vista sobre las zonas](#453-vista-sobre-las-zonas)
  - [5. DDNS](#5-ddns)
  - [Conceptos Importantes](#conceptos-importantes)


## 1. El servicio DNS

```md
DNS o sistema de nombres de dominio (domain name system) es un protocolo de nivel de aplicación de la familia de protocolos TCP/IP que establece las normas de funcionamiento de un servicio de nombres jerárquico basado en dominios.
En 1983, Paul Mockapetris publicó los primeros documentos de solicitud de comentarios relacionados con los nombres de dominio, los RFC (Request for Comments) 882 y 883. No obstante, fue en 1987, con el RFC 1034 y el RFC 1035, cuando se definió lo que hoy conocemos como servicio DNS, que ha sido actualizado con varios documentos RFC que forman las especificaciones actuales del DNS.
El protocolo DNS establece que, dentro de una red (y, por tanto, dentro de Internet también), puede haber varios servidores DNS que prestan el servicio de resolución de nombres DNS para obtener la dirección IP de un equipo a partir de su nombre DNS. Un servidor no tiene por qué resolver todos los nombres de la red. 
Pasemos a ver cómo se ha estructurado el protocolo DNS.
```

- DNS: administración de los **nombres de dominio (ND)** == servicio de resolución o traducción de IPs correspondientes -- servicio distribuido entre todos los servidores DNS de la red de redes basada en TCP/IP
- En redes TCP/IP: máquinas <u>se identifican según dirección de red o número IP (versión 4 o 6)</u>; pero para las personas, **NOMBRES estáticos** simbólicos
- Necesario traducir 'nombres de máquina de los dominios a direcciones IP únicas para localizar el servidor donde reside un sitio web' == servicio DNS
- **Dominio o nombre**: identifica un sitio web, único en Internet; e.g. 'www.mheducation.es'
- Elementos:
  - organizaicón jerárquica de dominios y subdominios
  - dominio tiene nombre -- todos los miembros de organización comparten ese nombre
  - dominio puede albergar subdominios -- mejor organización
  - cada servidor DNS pueden gestionar 1 o más zonas
  - 'en cada zona disponemos de la información necesaria paa resolver los nombres de las máquinas de tantos dominios como necesitemos, pero al menos de uno'

### 1.1 Espacio de nombres de dominio

- Servicio == base de datos (BD) distribuida == asociaciones de ND y sus direcciones IP (tipo ÁRBOL/RAMAS == `máquina.subdominio.subdominio...dominio` de inferior a superior jerárquicamente)
  - árbol == FQDN
  - desde el inicio o RAÍZ, hasta 127 niveles; lo habitual es 5 o 6
  - "`www` es un alias para el `hostname` (que da servicio web) por convención, aunque con HTTPS se puede suprimir
  - **nodos**: nombres únicos, no nulos (salvo RAÍZ), de máximo 63 caracteres, separados por `.`; se va delegando autoridad a cada nivel...
  - **FQDN**: max 255 caracteres, permite Unicode desde 2004

### 1.2 Dominios por niveles

- "Estructura jerárquica de árbol invertido basado en -max 127- niveles, habitualmente 3-6"

#### 1.2.1 Dominio raíz

- Se simboliza con un punto `.`. gestionado por *ICANN*, gestiona la información de los dominios de primer nivel

#### 1.2.2 Dominios de primer nivel

- **TLD** (top-level domain): ejemplos (.com .org .net .es), gestión por determinada organización con propia NIC (network information center)
  - España: ESNIC ([dominios.es](https://dominios.es)) desde 1988
  - gestión de los servicios DNS de segundo nivel, ejemplos mheducation.es, gva.es

#### 1.2.3 Dominios de segundo nivel

- Registrados a favor de una entidad (empresa, uni, persona...)
  - **Propietarios**: gestión del dominio y subdominios
  - **Gestión**: 1 o varios servidores DNS, con info de las máquinas disponibles en el dominio, servicios internos, etc.
  - **Nuevo dominio**: necesario registrarlo según ICANN

#### 1.2.4 Subdominios 

- Gestión privada/interna propia del dominio/empresa...


### 1.3 Tipos de dominio

1. **ccTLD** (country code TLD): dos letras representativas
2. **gTLD** (generic TLD):
   1. sTLD (sponsored): agencias determinadas de un sector
   2. uTLD (unsponsored): tipo .com .info .net
3. **lTLD**: tipo .cat .gal .eus

> **.arpa** (iana.org/domains/arpa): resoluciones inversas (de IP a FQDN) 

## 2. Resolutores de nombres

```md
El servicio DNS es lo que más utilizamos del sistema DNS: para cualquier consulta sobre cualquier otro equipo de nuestra intranet o de Internet, realizamos este proceso, solicitando la traducción del nombre de dominio completo para obtener su IP pública o privada. Los clientes DNS son los que inician el servicio. Los servidores DNS están a la espera de recibir las solicitudes  y contestar, afirmativamente (si las pueden resolver afirmativamente, de forma autoritaria) o negativamente (si ellos no tienen dicha información, indicando a quién ha de seguir realizando la petición).
Los clientes DNS realizan sus consultas a través del resolutor (resolver).
Un resolutor es un proceso que se ejecuta a petición de un programa que usa un nombre DNS para establecer una conexión.
El resolutor gestiona el proceso de consulta del nombre DNS, recepción de la respuesta relativa a la consulta y entrega del resultado.
Los procesos resolutores se ejecutan en los clientes DNS y en servidores que deben dar respuestas a clientes DNS.
```

- Ejemplo resolución `www.mheducation.es`
  - El cliente ejecuta proceso local 'resolutor DNS' == ping o host al server
  - Resolutor busca ND en *caché local DNS* y si lo encuentra devuelve IP correspondiente
  - Resolutor busca ND en archivo `hosts`(`/etc/hosts` VS `C:\Windows\System32\drivers\etc\hosts`)
  - Resolutor consulta (UDP/TCP 53) a servidor DNS
  - Servidor consulta su *caché DNS*, luego 'archivo de registros de zona (BD)'...
  - Servidor consulta a otros servidores DNS -- "finalmente, servidor DNS del dominio `mheducation.es` envía al primer servidor la dirección IP del ordenador `www` del dominio"
  - Primer servidor DNS envía al resolutor la dirección de `www.mheducation.es` y el resolutor entrega al cliente

### 2.1 Proceso de resolución de un nombre de dominio

> Ejemplo: cliente DNS `pc1.mcgrawSRI.org`, primer servidor DNS `servidor.mcgrawSRI.org`, resolución dominio `www.mheducation.es`

"Vamos a ver cómo se produce la resolución de un nombre de dominio con consultas entre los servidores del sistema de dominios"

Tipos:

1. **Resolución iterativa**
     1. consulta "www.mheducation.es" de cliente a servidor
     2. consulta ".es" de servidor a ROOT server
     3. IP ".es" de ROOT a servidor
     4. consulta "mheducation.es" de servidor al servidor_dominio .es
     5. IP "mheducation.es" de .es a servidor
     6. consulta "www.mheducation.es" a servidor_dominio mheducation.es
     7. IP máquina para servidor
     8. IP máquina para cliente
2. **Resolución recursiva**
     1. consulta "www.mheducation.es" de cliente a servidor
     2. consulta "www.mheducation.es" de servidor a ROOT
     3. consulta "www.mheducation.es" de ROOT a servidor_dominio .es
     4. consulta "www.mheducation.es" de .es a mheducation.es
     5. IP máquina de mheducation a .es
     6. IP máquina de .es a ROOT
     7. IP máquina de ROOT a servidor
     8. IP máquina de servidor a cliente


### 2.2 Resoluciones directas y resoluciones inversas

- **Directa**: resolución dirección IP a partir del nombre DNS
- **Inversa**: resolución nombre DNS a partir de dirección IP

> Resolución inversa:

- De ROOT cuelga el TLD `.arpa`, con varios dominios
  - De `in-addr.arpa` cuelgan servidores para resolver direcciones IPv4 (1-223)
  - ...
  - De `ip6.arpa`, resolución IPv6
  - ...

```bash
dig -x 8.8.8.8
```

## 3. Base de datos DNS

```md
Dentro de la base de datos del DNS, vamos a aprender qué son las zonas. Tenemos de dos tipos: las primarias y las secundarias, que son una copia de las anteriores. Para poder implementarlas, vamos a tener que configurar servidores DNS; estos pueden ser de cuatro tipos, dentro de dos categorías: los autoritarios (primarios, para zonas primarias, y secundarios, para zonas secundarias) y los no autoritarios (de caché y reenviadores). 
Veremos que entre el primario y el secundario realizaremos transferencias de zonas para llevar a cabo dicha copia. Los secundarios son un espejo de los primeros, lo que permite cierta tolerancia a fallos.
Y, por último, aprenderemos el concepto de delegación de zonas; si una organización es lo suficientemente grande como para poder autogestionarse, podrá solicitar a la zona superior que le cree su propia zona y se la delegue para gestionarla ella misma, y crear así tantos subdominios como se necesiten o se crean convenientes.
```

- "La BD Distribuida del sistema DNS se organiza en zonas, correspondientes al espacio de nombres del servicio DNS (EN-DNS)"
- **Zona**: contiene la información necesaria para resolver nombres pertenecientes a <u>uno o varios</u> dominios.
- **Zona**: archivo de texto en servidor DNS, contiene parte de la información del EN-DNS -- parte de la BD distribuida correspondiente a dicho EN-DNS

### 3.1 Zonas primarias y secundarias

- **Servidor autorizado**: almacena zonas (1 o más)
- **Zona (de autoridad)**: constituida por registros
- **Registro**: resolver nombres DNS o direcciones IP y recursos asociados -- **otras funciones**: indicar servidores DNS en zona
- "El caso más habitual es que una zona resuelva los nombres de un dominio (i.e. un dominio una zona)"
- "Nosotros administraremos cada zona en un <u>archivo diferente</u> para realizar resoluciones"
- DOS TIPOS DE BÚSQUEDA/RESOLUCIÓN:
  - **DIRECTA** (forward): dado un nombre DNS, devolver dirección IP asociada
  - **INVERSA** (reverse): dada una dirección IP, devolver nombre DNS

### 3.2 Características de las zonas primarias y secundarias

- DOS TIPOS DE ZONA
  - **PRIMARIAS** (master): información para la resolución -- podemos añadir, modificar, eliminar *registros*
  - **SECUNDARIAS** (slaves): información de solo-lectura -- espejo de primaria (<u>symlink</u>)
    - "Si la zona primaria deja de estar activa, la zona secundaria seguirá resolviendo nombres DNS de la zona y dará un servicio con cierta tolerancia a fallos"

### 3.3 Tipos de servidores de DNS

| Servidores  | Autorizado  | Descripción
| ---         | ---         | ---
| Primario    | SI          | Puede editar la zona/s (donde actúa como servidor autoritario)
| Secundario  | SI          | Obtiene info de la zona primaria de otro servidor primario por transferencia de zona<br>Aunque no se puede editar una zona secundaria, los clientes DNS pueden usar estos servidores DNS sin problema
| Caché       | NO          | Almacena temporalmente las últimas consultas del servidor.<br>Tiempo de almacenamiento según configuración del servidor para para los nombres consultados
| Reenviador  | NO          | Servidor designado por otro para resolver nombres FUERA del dominio

> Un servidor de nombres puede ser a la vez **primario** para algunas zonas, **secundario** para otras y **caché**. También puede ser, adicionalmente, **reenviador** para otros servidores.

### 3.4 Transferencias de zona

- Mecanismo de **actualización** de servidores secundarios, sincronizarlos con la zona primaria (solicitando al servidor primario —debe estar activo— una copia actualizada de la zona primaria)
- <u>Garantizar sincronización configurando 'nuevas transferencias —incrementales— cada cierto tiempo': `allow-transfer {<IP>}`</u>


<details>

```conf
; Definición en el servidor primario: Zona Directa
# zone "mgrawSRI.lan" {
  # type master;
    # file "/var/lib/bind/mgrawSRI.lan.hosts";
    allow-transfer {192.168.123.124};
# };
```

```conf
; Definición en el servidor primario: Zona Inversa
# zone "123.168.192in-addr.arpa" {
  # type master;
    # file "/var/lib/bind/192.168.123.rev";
    allow-transfer {192.168.123.124};
# };
```

```conf
; Definición en el servidor secundario: Zona Directa
# zone "mgrawSRI.lan" {
  # type slave;
  masters {192.168.123.123};
  # file "/var/lib/bind/mgrawSRI.lan.hosts";
# };
```

```conf
; Definición en el servidor secundario: Zona Inversa
# zone "123.168.192.in-addr.arpa" {
  # type slave;
  masters {192.168.123.123};
  # file "/var/lib/bind/192.168.123.rev";
# };
```

</details>

### 3.5 Delegación de zonas

- "Si tenemos un servidor DNS con la zona correspondiente a un dominio dividido en subdominios, podemos hacer dos cosas:"
  - Que el servidor tenga una sola zona para resolver nombres en todo el dominio
  - Que el servidor delegue en otras zonas la resolución de los nombres de los miembros de los subdominios

> - **TODO**: ...
> - see `Conceptos Importantes`

### 3.6 Registro de recursos

- Parámetros para cada campo:
  - **Propietario**: FQDN, importante `.` final para nombres completos (sin punto, nombres relativos + 'nombre de zona representado con `@`); cadena vacía == propietario anterior
  - **TTL**: opcional (vacío o `0` OK) -- uso por *servidores caché* como frecuencia actualización
  - **Clase**: familia de protocolos (`IN` == TCP/IP de Internet)
  - **Tipo**: según Clase...
  - **RDatos**: 'registro con el dato que hay que devolver en la consulta que nos realicen para este recurso'

| Propietario     | TTL | Clase | Tipo  | RDatos
| ---             | --- | ---   | ---   | ---
| mcgrawSRI.lan.  | 0   | IN    | A     | 192.168.123.123

#### 3.6.1 Tipos de registro de recursos

- **Tipos de registro para la clase `IN` en la creación de zonas y determinando parámetros de resolución**


| Nombre recurso      | Registro  | Función
| ---                 | ---       | ---
| Start of authority  | SOA       | Primer registro en zona, identifica servidor como autoritario, parámetros correspondientes
| Name server         | NS        | 'Equipo que ejerce como servidor de nombres en zona'
| Address IPv4        | A         | Obtener dirección IPv4 del FQDN ('de un equipo que se ha solicitado resolver')
| Address IPv4        | AAAA      | A==32bits/4bytes (128bits) -- Bind9: RFC 1886
| Pointer             | PTR       | Búsquedas inversas (IP hacia ND)
| Mail                | MX        | Gestión correspondencia; puede haber varios (0>n)
| Canonic name        | CNAME     | Aliases -- e.g. `www` para servidor web
| Texto               | TXT       | Misc., habitualmente para 'marca identificativa de dominio al usar servicios externos, eg. email 3rdparty'
| Service             | SRV       | 'Ubicación de servidores para determinado servicio'

Ejemplo RR de tipo SOA

```conf
# Propietario: mcgrawSRI.lan.
# TTL: 0
# Clase: IN
# TIpo: SOA
# Registro de datos: 

servidor1.mcgrawSRI.lan. (
  2022062901  ; número de serie
  10800       ; actualización
  3600        ; reintentos
  604800      ; caducidad
  86400       ; valor del TTL
)
```

> "Los valores de configuración están expresados en segundos, aunque también se pueden utilizar letras para representar las unidades de tiempo: en semanas, días, horas o minutos. El anterior registro SOA equivaldría a `(2022062901 3H 1H 1W 1D)`"


## 4. Instalación, configuración y administración de servidores

```md
El servicio DNS es universal: cualquier dispositivo electrónico conectado a Internet —ordenadores, portátiles, tabletas, teléfonos inteligentes, relojes inteligentes (o cualquier otro wearable)— requiere de su uso para poder localizar al resto de servicios digitales mundiales; para ello, llevan clientes de DNS preinstalados en sus sistemas. Aquí veremos los utilizados actualmente por sistemas operativos GNU/Linux.
Respecto a los sistemas operativos Windows Server, incluyen en la propia distribución del sistema el software servidor denominado Microsoft DNS, para integrarlo o no dentro de su Active Directory (AD) —como viste el curso pasado en el módulo de Implantación de Sistemas Operativos, o volverás a ver este curso en el módulo de Administración de Sistemas Operativos—, mediante scripts escritos en PowerShell. 
A partir de ahora, los contenidos relativos a configuración del servidor DNS corresponden al servidor **bind9** —creado en la Universidad de Berkeley, y que 1988 empezó a mantener Paul Vixie—, para sistemas operativos basados en GNU/Linux. En lo referente a los registros de zona, la sintaxis para escribirlos es igual en todos los servidores, ya que los registros están normalizados en los RFC correspondientes.
```

> `bind`

### 4.1 Instalación

> **Configuración Red VM**: NAT o Bridged

```bash
sudo apt-get update && sudo apt-get ugprade -y
sudo apt-get install bind9
cd /etc/bind && tree
ls named.conf*
```
> **Configuración Red VM**: Red Interna

### 4.2 Estado del servicio DNS

> Servicio `bind9` == `named`

```bash
systemctl status named
# Necesario reiniciar el servicio para aplicar cambios de configuración
named-checkzone && named-checkconf &&
  sudo systemctl restart named
```

### 4.3 Archivos de configuración

| Archivo en /etc/bind      | Función
| ---                       | ---
| named.conf                | Main <br> Tres directivas `include` para archivos `named.conf.*` <br> Zonas de búsqueda Directa e Inversa (archivos `zones.*` correspondientes): nombre, tipo, ubicación y nombre de archivo
| named.conf.default-zones  | Zonas por defecto: `0`, `127`, `255` y `local` <br> zona raíz ( `/usr/share/dns/root.hints`)
| **named.conf.local**      | ZONAS CREADAS POR USUARIO LOCALMENTE <br> Incluye `zones.rfc1918`
| **named.conf.options**    | Información opciones globales servidor
| zones.rfc1918             | Información para direcciones IP privadas en resolución local (VS ~~espacio nombres dominio~~)
| db.*                      | 5 archivos de zona: `db.0` `db.127` `db.255` `db.empty` `db.local`
| bind.keys (dnssec)        | Al activar, parte de DNS seguro *dnssec*... <br> Claves criptográficas para autenticar autoridad
| rndc.keys (dnssec)        | Al activar, parte de DNS seguro *dnssec*... <br> Almacenar claves intercambiadas entre primario/secundarios (en transferencias de zona)

### 4.4 Opciones generales (`named.conf.options`)

- `acl`:
  - "listas de direcciones IP para permitir/denegar el acceso al servidor de nombres"
  - "definir ACL desde intranet/extranet para incluir todos los hosts en redes 192.168.121.0/24 y 172.16.0.0/16: `acl intranet { { 192.168.123/24; } };`"
  - tres ACL predefinidas:
    - `any`/`none`: acceso permitido/denegado a cualquier máquina
    - `localhost`: acceso permitido solo a direcciones que empiecen por `127`
- `options`
  - "opciones de configuración del servidor y otras sentencias"
  - solo aparece 1 vez; ejemplos:
    - `directory`: archivos temprales de caché -- `options { directory /var/cache/bind; };`
    - `allow-query`: máquinas que pueden realizar consultas (filtrado por IP o ACL) -- `named. allow-query {redlocal}`
    - `blackhole`:  niega respuestas a consultas de esta lista negra -- `blackhole {10.0.0/24;};`
    - `listen-on`: puerto para servicio DNS -- `listen-on port 53 {any;};`
    - `forward`: modo de trabajo de reenviadores -- `forward only` "desactiva el modo recursivo y todas las peticiones se harán a través de los reenviadores indicados en la cláusula siguiente"
    - `forwarders`:  "cuando tenemos peticiones de resolución no solucionadas en nuestro servidor DNS local, aquí indicamos quiénes son nuestros reenviadores -- `forwarders {8.8.8.8; 8.8.4.4;};` -- **obligatorio** para poder hacer consultas fuera de red local

### 4.5 Opciones de las zonas (`named.conf.local`)

Cuatro tipos de zonas

- **Master zone** (maestra): copia principal de datos del servidor, se puede modificar
- **Slave zone** (esclava): datos duplicados de la zona maestra
- **Hint zone** (oculta): información de servidores del dominio RAÍZ -- cargar caché de resolución DNS para identificar servidor RAÍZ al que "lanzar las consultas que no podamos resolver, para que las resuelva aquel al que le corresponda"
- **Forward zone** (reenvío): "servidor de nombres que redirija las peticiones de información sobre la zona hacia otros servidores"

#### 4.5.1 Zona de resolución Directa

- Nombre condicionado al nombre de dominio (eg. `mcgrawSRI.local`) donde se resolverán <u>**nombres de máquina**</u>.
- Tipo *master* o *slave*.
- RR que define la resolución Directa es `A`

#### 4.5.2 Zona de resolución Inversa

- Nombre es dirección de red (eg. 192.168.123.0/24) invertido + dominio especial de infraestructura -- eg. `123.168.192.in-addr.arpa`

#### 4.5.3 Vista sobre las zonas

- **Views** de **bind** permiten utilizar ciertas zonas según consultante
- Ejemplo: servidor DNS con dos tarjetas de red: intranet y extranet ... Proporciona resolución (**vista**) diferente a clientes según estén en red interna o externa


## 5. DDNS

```md
El servicio DNS dinámico (DDNS, dynamic DNS) va destinado a los usuarios finales a los que su proveedor de servicios de Internet (ISP) les asigna una IP dinámica, es decir, a usuarios que no tienen IP estática o fija (bien porque su ISP no ofrece dicho servicio o porque lleva un coste asociado), y, por tanto, dicha IP dinámica puede cambiar cada vez que se conectan a Internet a través de su ISP o reinicializan su rúter.
Con el servicio DNS dinámico, el usuario consigue redirigir su dominio (gratuito o de pago) a su IP dinámica actual, aunque haya cambiado. Deberemos verificar que el servidor DDNS esté entre los admitidos por nuestro rúter, o si dispone de **DNS-O-Matic** (https://www.dnsomatic.com), que permite redirigir dicho servicio a prácticamente cualquier servidor DDNS existente. Esto último nos da un grado más de libertad, al poder asociar más de un dominio a nuestra única IP dinámica; por esa razón, será el servicio por el que optaremos para enlazar con el rúter que nos ha proporcionado nuestro ISP.
```

- **DNS Dinámico** asigna nombres de dominio a máquinas con dirección IP dinámica
- ISPs proporcionan IPs públicas dinámicas (cambian al reiniciar el router), con lo que no podríamos ejercer de servidor DNS...
- Con **DDNS** "podemos configurar uno o varios sitios webs doméstricos sin necesidad de contratar un servicio de *hosting* externo, o poder acceder a él remotamente para utilizarlo desde cualquier sitio a cualquier hora; por eso, deberemos tenerlo conectado a nuestro servidor las 24 horas, para montarnos todos los servicios que podamos necesitar: servidor web, FTP o servicios de escritorio remoto"
- Para configurarlo: "necesario poder acceder desde Internet al router con su IP pública... para lo cual hay que configurar el router y asociarlo a una IP mediante un nombre de dominio con el servicio DDNS elegido... Lo primero sería acceder al router desde la intranet con su IP privada y comprobar si admite dicho servicio DDNS y con qué proveedores"

> DDNS no solo se utiliza en internet, también en las redes de los diferentes OSs. ActiveDirectory, Dnsmasq, etc......

- "Si queremos tener más de un dominio apuntando a nuestra única IP pública dinámica, lo mejor será utilizar el **servicio intermedio DNS-O-Matic**: siempre conocerá nuestra IP pública dinámica y la distribuirá a los distintoss servicios DDNS configurados mediante *token* de seguridad -- e.g. **Duck DNS**


---

## Conceptos Importantes

| Concepto                  | Definición
| ---                       | ---
| Delegar                   | foo
| Dominio                   | foo
| Búsqueda recursiva        | foo
| Búsqueda iterativa        | foo
| Zona                      | foo
| Registro de recurso       | foo
| Resolución de nombres     | foo
| Resolución inversa        | foo
| Nombre canónico           | foo
| Servidor de nombres       | foo
| Transferencia de la zona  | foo

