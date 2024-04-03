# Unidad 3 McGrawHill <br> Servidores web (HTTP)

```md
# Objetivos
1. Conocer las listas de control de acceso, y justificar su necesidad como ampliación de permisos y sus propiedades.
2. Estudiar las políticas de contraseñas de usuarios.
3. Conocer el concepto de criptografía y su función como mecanismo de seguridad, y estudiar los diferentes tipos de criptografía y sus usos más comunes.
4. Estudiar y trabajar con la firma digital y el certificado digital.
5. Comprender la importancia de la biometría como método de autenticación y sus tipos.
6. Analizar y comprender el análisis forense y sus diferentes fases como mecanismo de control y prevención de ataques.
```

- [Unidad 3 McGrawHill  Servidores web (HTTP)](#unidad-3-mcgrawhill--servidores-web-http)
  - [1. Características generales de un servidor web. Protocolo HTTP: peticiones y respuestas. Tipos MIME](#1-características-generales-de-un-servidor-web-protocolo-http-peticiones-y-respuestas-tipos-mime)
    - [1.1 Estructura de la World Wide Web](#11-estructura-de-la-world-wide-web)
    - [1.2 URL](#12-url)
    - [1.3 Protocolo HTTP](#13-protocolo-http)
    - [1.4 Comunicación entre el navegador web y el servidor web](#14-comunicación-entre-el-navegador-web-y-el-servidor-web)
    - [1.5 Mensajes HTTP](#15-mensajes-http)
      - [A. Mensajes de petición](#a-mensajes-de-petición)
      - [B. Mensajes de respuesta](#b-mensajes-de-respuesta)
    - [1.6 Tipos MIME](#16-tipos-mime)
  - [2. Servidores web: Apache. Configuración](#2-servidores-web-apache-configuración)
    - [2.1 Herramientaa instaladas opr Apache2](#21-herramientaa-instaladas-opr-apache2)
    - [2.2 Dominio del servidor Apache2](#22-dominio-del-servidor-apache2)
    - [2.3 Carpeta inicial del sitio](#23-carpeta-inicial-del-sitio)
    - [2.4 Navegador web](#24-navegador-web)
  - [3. Módulos. Hosts virtuales](#3-módulos-hosts-virtuales)
    - [3.1 Órdenes: a2enmod/a2dismod](#31-órdenes-a2enmoda2dismod)
    - [3.2 Módulos en Windows](#32-módulos-en-windows)
    - [3.3 Servidores virtuales (Ubuntu)](#33-servidores-virtuales-ubuntu)
    - [3.4 Hosts virtuales en Windows](#34-hosts-virtuales-en-windows)
  - [4. Autenticación y control de acceso](#4-autenticación-y-control-de-acceso)
    - [4.1 Identificación o autenticación](#41-identificación-o-autenticación)
    - [4.2 Autorización](#42-autorización)
    - [4.3 Control de acceso](#43-control-de-acceso)
      - [~~A. Ubuntu~~](#a-ubuntu)
        - [~~A.1 Control de acceso por host: directiva Require~~](#a1-control-de-acceso-por-host-directiva-require)
        - [~~A.2 Autenticación HTTP básica~~](#a2-autenticación-http-básica)
        - [~~A.3 Autenticación HTTP *digest*~~](#a3-autenticación-http-digest)
  - [5. El protocolo HTTPS. Certificados](#5-el-protocolo-https-certificados)
    - [5.1 SSL/TLS (*Secure Socket Layer* / *Transport Layer Security*)](#51-ssltls-secure-socket-layer--transport-layer-security)
    - [5.2 Módulo de seguridad](#52-módulo-de-seguridad)
    - [5.3 Certificados](#53-certificados)
    - [5.4 Autoridad de certificación](#54-autoridad-de-certificación)
  - [6. Registro y monitorización](#6-registro-y-monitorización)
    - [6.1 Rotación de archivos de registro](#61-rotación-de-archivos-de-registro)


## 1. Características generales de un servidor web. Protocolo HTTP: peticiones y respuestas. Tipos MIME

```md
Abordamos el servicio web y todas sus funcionalidades. Para ello comenzamos con el concepto de servidor web, su origen y evolución y sus características más relevantes.
Detallamos el protocolo HTTP como conjunto de normas que regulan el mecanismo de intercambio de mensajes entre el servidor web y el cliente web (navegador), así como los tipos MIME para la interpretación del contenido de los archivos transferidos entre servidor y cliente.
```

- Servicio Web
  - Navegador web: cliente, realiza peticiones al servidor, especificando: el nomre DNS del equipo que tiene instalado el servidor web y la ruta y nombre de la página web solicitada
  - Servidor web: 'lee en el sitio web el archivo correspondiente a la página web solicitada y se lo envía al cliente'
- Otros conceptos:
  - **Página web**: 'Archivo escrito en un lenguaje de marcas que, además de texto, contiene como elementos principales hipervínculos o hiperenlaces que enlazan la página con otras partes de esta o con otras páginas que estén en el mismo equipo o en otros equipos de la red'
  - **Sitio web**: 'Conjunto de páginas web y archivos complementarios que se distribuyen en Internet o en una intranet bajo un mismo nombre DNS'
- Consideraciones hardware: según demanda (peticiones): memoria, almacenamiento, ancho de banda...
- Elección software: software libre, recursos, admin. varios sitios, control de acceso a usuarios, seguridad, integración (PHP, ASP, Perl)

### 1.1 Estructura de la World Wide Web

- 1989 CERN (Tim Berners Lee y Robert Caillou)
- WWW: sistema global de documentos o páginas web enlazados entre sí mediante hipervínculos o hiperenlaces
- Funcionamiento:
  - red de documentos; cada documento es un nodo de la red
  - red de servidores encargados de alojar y distribuir los documentos
  - programas clientes (navegadores) que muestran los documentos con los hiperenlaces
- Documentos: escritos en lenguaje de marcas (HTML5); hipertextos VS hipermedios

### 1.2 URL

- RFC 1738: *Uniform Resource Locator*: Secuencia de caracteres con un formato determinado que permite localizar un recurso en Internet o en otra red cualquiera
- Formato: `protocolo://[usuario:contraseña@]máquina:puerto/ruta_recurso&otros`
  <!-- - máquina: nombre DNS o dirección IP -->

### 1.3 Protocolo HTTP

- *Hypertext Transfer Protocol* (1990, CERN); v1.1 en 1999, RFC 2616; v2 en 2014, RFC 7230 y 7235
- Protocolo de transferencia de hipertexto que sigue el modelo cliente/servidor y establece las normas para el intercambio de la información contenida en las páginas web
- Existencia de HTTPS

### 1.4 Comunicación entre el navegador web y el servidor web

- Navegador > Cliente > Servidor DNS > IP, TCP > Hipertexto
- HTML5
- HTTP == Protocolo sin estado; o se encuentra el recurso o no (código error); 'En ambos casos al final se libera la conexión'
<!-- - Socket == dirección IP + puerto -->

### 1.5 Mensajes HTTP

- 1 Conexión = Varias peticiones (Por cada recurso)
- Campos (ASCII): Línea de petición/respuesta + Encabezados + Línea vacía + Cuerpo mensaje


#### A. Mensajes de petición

- Desde el cliente al servidor HTTP
- 3 datos separados por un espacio: método de la petición (GET|POST|...), dirección URI del recurso (foo/bar.gif), versión HTTP

> doc Metodos.pdf

#### B. Mensajes de respuesta

- Desde el servidor a clientes
- En el cuerpo se envía el contenido del recurso solicitado (HTML...)
- En línea de respuesta/estado: versión HTTP, código respuesta/estado (200|400|500|...), descripción
- Algunos encabezados: Date, Server, Content-Length, Content-Encoding, Connection (keep-alive|close)

> doc Codigos_Respuesta.pdf

### 1.6 Tipos MIME

- Archivos no ASCII (imágenes, vídeos, etc.)
- *Multipurpose Internet Mail Extensions*, RFC 2048, IANA <!--ORIGINALMENTE EMAIL-->
- `tipo/subtipo`: `Text/html`, `Video/mpeg`, `Image/*`
- Objetivos (integración MIME/HTTP):
  1. Informar al cliente del tipo de datos que está recibiendo el servidor
     - Según encabezado `Content-Type`: visualizar documento (text/html), llamar app externa (application/pdf), preguntar al usuario (image/x-fwf)
  2. Permitir la negociación de contenido
     - Ejemplo: `Allow: application/pdf`
  3. Encapsular una o más entidades dentro del cuerpo de mensaje, mediante los tipos MIME multipart
     - Tipo `multipart/form-data` para encapsular datos de un formulario

...

> https://www.iana.org/assignments/media-types/media-types.xhtml

## 2. Servidores web: Apache. Configuración

```md
Entramos en el estudio del servidor web Apache viendo su estructura y sus principales características y funcionalidades.
Analizamos a nivel global cuál es su implantación y uso, y procedemos a su instalación, tanto en GNU/Linux Ubuntu como en Windows.
Revisamos la estructura de directorios creada en proceso de instalación, así como los principales archivos que gestionan su comportamiento.
Por último, introducimos un recordatorio sobre los navegadores web, ya que son las herramientas que utilizaremos para acceder a los contenidos alojados en los servidores web.
```

- Características:
  - Soporte para protocolos HTTP/1.0 HTTP/1.1 y HTTP/2
  - Permite ejecución de scripts CGI
  - Permite creación de hosts virtuales (multialojados): 'permite atender varios sitios web en distintos dominios desde la misma máquina'
  - Permite restringir recursos a determinados usuarios o grupos distintos de los del sistema
  - Soporte para SSL <!--Secure Sockets Layer-->, Certificados Digitales...

### 2.1 Herramientaa instaladas opr Apache2

- a2enmod, a2dismod, a2ensite, a2dissite

### 2.2 Dominio del servidor Apache2

- Por defecto, localhost

### 2.3 Carpeta inicial del sitio

- `/var/www/html` || `/usr/local/apache2/htdocs`

### 2.4 Navegador web

- Solicita e interpeta documentos (generalmente HTML) recibidos mediante HTTP
- Extensiones, plugins...

## 3. Módulos. Hosts virtuales

```md
Seguimos profundizando en las funcionalidades que proporciona Apache. Ahora abordamos la gestión y configuración tanto de los módulos como de los hosts virtuales.
Ambos son pilares fundamentales de la estructura de Apache. En el primer caso, la modularización de la funcionalidad de Apache le hace más ágil y eficiente. En el segundo caso, con los servidores virtuales aumenta el rendimiento del servidor web, al ser capaz de gestionar múltiples sitios web por un mismo servidor web.
Seguimos viendo las características de ambas funcionalidades en GNU/Linux y Windows.
```

- 'En Apache2, el módulo es una forma de agrupar ciertas funcionalidades para el servidor web'
- Casos de uso: permitir a usuarios que dispongan de su espacio web, establecer sistema de control de acceso, enlazar con programas que interpreten páginas web dinámicas (PHP)...
- 2 tipos: compilados estática o dinámicamente (DSO)

### 3.1 Órdenes: a2enmod/a2dismod

- Dos directorios para módulos: `/etc/apache2/mods-(available|enabled)`: archivos `.load` o `.conf` y symlinks respectivamente
- En el archivo principal (`/etc/apache2/apache2.conf`): `IncludeOptional mods-enabled/*.load` ...

```bash
sudo a2enmod userdir
# ln -s available enabled   # ...
```

### 3.2 Módulos en Windows

\-

### 3.3 Servidores virtuales (Ubuntu)

- 'Trabajar con hosts virtuales consiste en ejecutar más de un sitio web en el mismo servidor web'
- Petición > Apache > Comprueba dominio > Virtual host > Contenido
- Ventajas (precio, versatilidad, configuración, actualizaciones, requerimientos) VS Desventajas (configuración, fragilidad, actualizaciones, seguridad)
- Tipos:
  1. Basados en direcciones IP: un VH por cada IP del equipo; se requieren varios adaptadores o interfaces virtuales
  2. Basados en puertos: un puerto de escucha por cada VH (eg. 80, 443)
  3. Basados en nombres: misma dirección y puerto pero diferente nombre para cada dominio
- Directivas asociadas:
  - Consideraciones: el VH heredará los parámetros globales, sección `<VirtualHost>`, mínimo las dos primeras:
  - Directivas: `DocumentRoot` `ServerName` `ServerAlias` `VirtualHost`

### 3.4 Hosts virtuales en Windows

\-

## 4. Autenticación y control de acceso

```md
Estudiamos los mecanismos de seguridad disponibles en Apache2. En primer lugar, veremos los conceptos de autenticación, autorización y control de acceso y los tipos de autenticación, así como los módulos y las directivas de Apache implicadas en estos mecanismos.
El objetivo es realizar la configuración del servidor Apache para asegurar la autenticación y el control de acceso y comprobar que los mecanismos de seguridad establecidos funcionan correctamente.
```

- Autenticación: se verifica identidad de usuario
- Autorización: se verifica que el usuario de identidad conocida tiene acceso a la info solicitada
- Control acceso: se verifica que la máquina que hace la solicitud tiene acceso

### 4.1 Identificación o autenticación

- Mediante: credenciales login (usuario + contraseña), certificados digitales
- Módulos:
  - mod_auth_basic, mod_auth_digest > archivos: htpasswd, htdigest
  - mod_authn_dbm, mod_authn_dbm, mod_authnz_ldap
<!-- - .htaccess: se requiere AllowOverride: AuthConfig -->

### 4.2 Autorización

- Server tiene lista de usuarios con permisos para posibles acciones
- Directivas como `<Directory>`, archivos como `.htaccess`

### 4.3 Control de acceso

- ...
- Autenticación:
  - Básica: credenciales en cliente web y transmitidas sin cifrar al servidor
  - Digest: cifrado
  - Por certificado: se envía al server al conectarse

```bash
# ...
```

#### ~~A. Ubuntu~~
##### ~~A.1 Control de acceso por host: directiva Require~~
##### ~~A.2 Autenticación HTTP básica~~
##### ~~A.3 Autenticación HTTP *digest*~~

## 5. El protocolo HTTPS. Certificados

```md
Vamos a trabajar con los mecanismos de seguridad que proporciona Apache2. Entre ellos, está el uso de los protocolos SSL y TLS; el módulo implicado en la gestión de estos protocolos, que es mod-ssl, y la utilización de un host virtual específico para acceder a los contenidos web disponibles a través de la web segura.
Crearemos un certificado autofirmado, que, aunque no tenga ninguna validez legal, muestra el proceso que se debe seguir para su instalación y uso por parte de Apache2. 
Por último, introducimos el concepto de autoridad certificadora, como entidad que legalmente está capacitada para la emisión de certificados, tanto personales como de servicios web seguros.
```

- El protocolo HTTPS combina HTTP + SSL/TSL para transmitir mensajes cifrados y garantizar la identidad del servidor ante los clientes
- Puerto 443 por defecto
- Se garantiza: la confidencialidad (mensajes cifrados), integridad (detección modificaciones), autenticación (identidad servidor mediante certificado digital)
- En APACHE debe activarse el módulo **ssl** y, para poder crear servidores virtuales, se debe incluir en el archivo `/etc/apache2/ports.conf` las siguientes directivas:

```html
<IfModule mod_ssl.c>
    NameVirtualHost *:443
    Listen 443
</IfModule>
```

### 5.1 SSL/TLS (*Secure Socket Layer* / *Transport Layer Security*)

<!-- - 'La utilización de SSL/TSL garantiza que todo el intercambio de información realizado durante una sesión de conexión se lleva a cabo de forma segura mediante encriptación' -->
- SSL: permite establecer comunicación segura y codificada (cifrada) entre el servidor y el navegador
- TLS: [RFC 5246](https://datatracker.ietf.org/doc/html/rfc5246), mejora de SSL
- HTTPS se basa en criptografía tanto simétrica (clave compartida) como asimétrica (clave pública/privada):
  - La **criptografía asimétrica** funciona bien para la autenticación, ya que cada usuario protege su clave secreta, pero es lenta para el cifrado
  - La **criptografía simétrica** es rápida en el cifrado y mala para la gestión de claves
- CAPA: HTTP > SSL > TCP/IP...
- Comunicación en 2 fases:
  1. Handhshake: intercambio claves públicas, auth certificados digitales...
  2. Comunicación: intercambio datos mediante clave simétrica 

### 5.2 Módulo de seguridad

- `mod_ssl` para Apache2, básicamente OpenSSL
- `sudo apt install openssl libssl-dev`: librerías crypt y ssl
  - la aplicación **openssl** permite mediante CLI:
    - crear claves RSA, DSA
    - crear certificados X.509, CSR y CRL
    - calcular el MD5
    - encriptar y desencriptar
    - crear nuestra propia CA

### 5.3 Certificados

- **Certificado digital**: documento digital emitido por una entidad autoridad de certificación (CA); ase asocia una clave pública al usuario/organización determinados
- 'Cuando un navegador web se conecta por primera vez con un sitio HTTPS, recibe la clave pública desde el servidor, nos da información sobre el certificado correspondiente y nos pide confirmación sobre si consideramos válido el certificado y, por tanto, deseamos usar la clave pública para conectarnos con el servidor'
- 'Los navegadores normalmente disponen de una lista de autoridades de certificación, que les permite establecer conexiones automáticamente con servidores HTTPS que disponen de un certificado emitido por alguna de esas autoridades de certificación'
- CSR: ..., .csr VS .crt
- **Funcionamiento**: hashing del mensaje (MD5, SHA...), cifrado clave privada usuario (RSA).
- **Comprobación**: validez según clave pública autor (mediante CA)

### 5.4 Autoridad de certificación

- 'Entidad considerada de confianza que se encarga de emitir certificados para usuarios u organizaciones, que sirvan para garantizar la identidad de estos ante otros usuarios u organizaciones'
- Objetivo: acreditar correspondencia entre una clave y su propietario real, "notario electrónico" que extiende certificado de claves firmado con su propia clave privada
- LEY: prestadoras de servicios de certificación, aquellas personas físicas o jurídicas que expiden certificados pudiendo prestar servicios relacionados con la firma electrónica
- Autoridades: FNMT, VeriSign, GlobalSign, CyberTrust, RSA Security


## 6. Registro y monitorización

```md
Entramos en el estudio del sistema que utiliza Apache para el almacenamiento de información relativa a los accesos y las situaciones de error. Conoceremos las directivas asociadas al registro y su proceso de rotación de archivos de registro, que consiste en salvar periódicamente el archivo actual bajo otro nombre y crear uno nuevo vacío.
Por último, trabajaremos con herramientas que proporcionan estadísticas de uso del servidor web Apache2 y veremos mecanismos que mejoren el rendimiento del servidor web.
```

<!-- - El registro de Apache2 es un sistema de almacenamiento de información relativa a los accesos y las situaciones de error -->
- Los errores vienen con formato determinado, los registros de actividad/accesos sí que son muy configurables
- Directivas: CustomLog (accesos), ErrorLog (`/var/log/apache2/error.log`), LogLevel (8 niveles, por defecto `warn`)
- Niveles de LogLevel, de menor a mayor información almacenada:

| Nivel     | Descripción   | Ejemplo
| ---       | ---           | ---
| emerg
| alert
| crit
| error
| warn
| notice
| info
| debug

### 6.1 Rotación de archivos de registro

- Logrotate <!--(renombrar log y crear otro vacío)--> + cron: `/etc/logrotate.d/apache2`
- "La configuración general indica que Logrotate rota los archivos diariamente; los rota 14 veces antes de borrarlos, puede comprimir los archivos de la semana y crea un archivo nuevo por cada archivo que rota. Luego incluye las configuraciones específicas de cada servicio dadas en /etc/logrotate.d y, por último, incluye tratamientos específicos a los archivos de logs incluidos (/var/log/wtmp)"
- "Todo servidor web debe disponer de estadísticas de uso para poder conocer qué páginas son más frecuentemente servidas y cuáles menos (`webalizer`, `awstats`)

