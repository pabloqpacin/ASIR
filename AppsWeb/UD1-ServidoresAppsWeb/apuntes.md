# Unidad 1 McGrawHill <br> Servidores de Aplicaciones Web

```md
# Objetivos
1. Identificar las diferentes tecnologías empleadas.
2. Instalar y configurar servidores web.
3. Conocer los servicios de hosting y computación en nube.
```

- [Unidad 1 McGrawHill  Servidores de Aplicaciones Web](#unidad-1-mcgrawhill--servidores-de-aplicaciones-web)
  - [1. Aplicaciones web](#1-aplicaciones-web)
    - [1.1 Aplicaciones de consola](#11-aplicaciones-de-consola)
    - [1.2 Aplicaciones de escritorio](#12-aplicaciones-de-escritorio)
    - [1.3 Aplicaciones web](#13-aplicaciones-web)
      - [A. Web 1.0 con páginas estáticas](#a-web-10-con-páginas-estáticas)
      - [B. Web 1.5 con páginas dinámicas](#b-web-15-con-páginas-dinámicas)
      - [C. Web 2.0 o aplicaciones web interactivas (RIA)](#c-web-20-o-aplicaciones-web-interactivas-ria)
      - [D. Web3 o aplicaciones web distribuidas](#d-web3-o-aplicaciones-web-distribuidas)
  - [2. Arquitecturas de las aplicaciones web](#2-arquitecturas-de-las-aplicaciones-web)
    - [2.1 Clasificaciones de las aplicaciones web](#21-clasificaciones-de-las-aplicaciones-web)
    - [2.2 Entornos de las aplicaciones web](#22-entornos-de-las-aplicaciones-web)
    - [2.3 Arquitecturas de las aplicaciones web](#23-arquitecturas-de-las-aplicaciones-web)
      - [A. Arquitectura monolítica en un mismo equipo (xAMP)](#a-arquitectura-monolítica-en-un-mismo-equipo-xamp)
      - [B. Aplicaciones web cliente-servidor](#b-aplicaciones-web-cliente-servidor)
      - [C. Aplicaciones web de 3 capas](#c-aplicaciones-web-de-3-capas)
  - [3. Hosting y computación en la nube](#3-hosting-y-computación-en-la-nube)
    - [3.1 Tipología de la computación en la nube](#31-tipología-de-la-computación-en-la-nube)
    - [3.2 Software como servicio (SaaS)](#32-software-como-servicio-saas)
    - [3.3 Plataforma como servicio (PaaS)](#33-plataforma-como-servicio-paas)
    - [3.4 Infraestructura como servicio (IaaS)](#34-infraestructura-como-servicio-iaas)
  - [Documentación externa](#documentación-externa)


## 1. Aplicaciones web

```md
En esta unidad aprenderemos qué son las aplicaciones web y las compararemos con las aplicaciones de consola o modo de texto que fueron las primeras en surgir y ser utilizadas, y con las aplicaciones de escritorio que se ejecutan sobre ordenadores personales con mayor potencia de cálculo.
Para ello comenzaremos por explicar qué es la Web, que surgió en 1989, cuando Tim Berners-Lee y Robert Cailliau desarrollaron una primera versión de un sistema basado en hipertextos (HTTP + HTML = WEB) para facilitar el acceso a la información del CERN (Organización Europea para la Investigación Nuclear), que era el nodo europeo más importante de Internet. Esta primera web se organizaba mediante una red de enlaces o hipervínculos entre diversos documentos que podían visualizarse con la ayuda de una aplicación específica: el navegador.
```

### 1.1 Aplicaciones de consola

- TUI, mainframes, 1960s 70s, cliente-servidor
- Actualidad: AS400 de IBM, COBOL; **banca**: sistemas críticos, difícil migrar, software propietario no estandarizado

### 1.2 Aplicaciones de escritorio

- Compiladas según arquitectura (32 o 64 bit) y sistema operativo (problema portabilidad), desde 1980s
- Ejemplos: apps diseño gráfico, animaciones 3D, edición de vídeo...
- Tendencia: **desuso** (limitaciones: actualización,sincronización...)

### 1.3 Aplicaciones web

- Arquitectura: máquinas conectadas a una red, cliente-servidor (servidores web)
- 1990s: HTTP + HTML = WEB -- **EVOLUCIÓN** <!--CERN-->

#### A. Web 1.0 con páginas estáticas

- Hasta 1997, acceso conmutado fijo o móvil (RTC, RDSI, GSM/2G, GPRS/2G), primeras etiquetas **HTML**
- Clientes: navegadores web, integración de programas 'applets' en Java
- Servidores: programas 'interfaz de entrada común' (CGI)

> 1. Cliente -- petición GET index.html --> servidor;
> 2. Servidor -- busca archivos en repositorio web (html, css, js);
> 3. Servidor -- envía index.html (\<p>HW\</p>) --> cliente;
> 4. Cliente -- muestra página;

- Comunicación: protocolo **HTTP** en puertos 80, 8080 (convención)
- Caso de uso: rellenar formularios (html css js)

#### B. Web 1.5 con páginas dinámicas

- Hasta 2003, lenguajes: **PHP**, ASP.net o JSP
- Ruta completa URL:

| https://  |localhost:8080/    |n1/n1/           |index.php/         |home/  |saluda/  |Mundo
| ---       | ---               | ---             | ---               | ---   | ---     | ---
| Protocolo | Servidor y puerto | Ruta (carpetas) | Recurso (página)  | Clase | Método  | Parámetro nombre

- 'Las páginas web dinámicas se crearán personlizadas a partir de la info recibida en la misma peticińo o mediante consultas a la base de datos. Lo habitual será que una misma página devuelva resultados diferentes para usuarios diferentes según los  parámetros enviados'

> 1. CLiente -- petición GET index.html --> servidor;
> 2. Servidor -- busca archivos en repo (html, css, js, php, jsp, asp);
> 3. Servidor -- prepara index.html;
> 4. Servidor -- creación html a partir del php;
> 5. Servidor -- consulta a base de datos;
> 6. Servidor -- devuelve index.html + index.php --> cliente;

- Las páginas se pueden generar dinámicamente sin necesidad de modificar la URL, gracias al uso de sesiones, a través de formularios POST, y utilizando otro tipo de variables externas

#### C. Web 2.0 o aplicaciones web interactivas (RIA)

- Siglo XXI, el Internet de las redes sociales con tecnologías para conexiones más estables y potentes, nuevas especificaciones del W3C como: XML, JSON...
- **RIA** (Rich Internet Application): web multimedia -- Flash, GAFAM (AJAX), HTML5 en 2012
- Arquitectura **híbrida** cliente-servidor local/remota

#### D. Web3 o aplicaciones web distribuidas

- Tendencia: Internet distribuido y libre; **token** digital, metaverso, criptomonedas...
- Pros: poca inversión, multiplataforma y responsive, requisito es URL
- Contras: requisito es conexión


## 2. Arquitecturas de las aplicaciones web

```md
En este apartado vamos a estudiar los diferentes servidores web más utilizados en el mercado, que son, dentro de los servidores privativos, Internet Information Services (IIS) de Microsoft y WebLogic Server de Oracle, y proyectos de código abierto (open source) como el servidor HTTP Apache, que ha sido líder del mercado durante muchos años; el HTTP Server de Oracle, basado en este, y por último el servidor web/proxy NginX, que ha sido el último en llegar, pero que ha igualado en cuota de mercado a Apache.
También nos centraremos en la arquitectura de los servidores web. Tanto la arquitectura cliente-servidor de dos niveles como la más profesional de tres niveles, que nos permite centralizar toda la información corporativa en el servidor de base de datos, y que requiere clientes livianos que no tengan un hardware potente para poder ejecutar el navegador web.
```

- Componentes:
  - **Frontend**: presentación: diseño, maquetación, programación // html css js + framework (angular, vue, react) // perfiles UI/UX
  - **Backend**: negocio/lógica // administración y configuración sitio web // capa persistencia de datos (SGBD) // php, perl, python, ruby, java ee, c#, asp.net

### 2.1 Clasificaciones de las aplicaciones web

- Clasificaciones
  - **Tamaño**: FatClient/ThinServer VS FatServer/ThinClient (cliente solo presentación)
  - Naturaleza **servicio** (capacidades servidor): archivos, bases de datos, transacciones, objetos, web...
- 'El reparto de funciones entre cliente y servidor consiste en gestionar y distribuir las responsabilidades de cada una de las **prestaciones funcionales** entre el cliente y el servidor'
<!-- - Diferentes arquitecturas... -->

### 2.2 Entornos de las aplicaciones web

- Etapas o entornos en el desarrollo de la aplicación web

| Entorno       | Tareas
| ---           | ---
| Desarrollo    | nuevas funcionalidades
| Pruebas/test  | testeo y validación
| Preproducción | pruebas funcionales y de garantía; formación a futuros usuarios
| Producción    | despliegue

### 2.3 Arquitecturas de las aplicaciones web

#### A. Arquitectura monolítica en un mismo equipo (xAMP)

- xAMP

| Componente        | Inicial | Servicio  | Alternativas
| ---               | ---     | ---       | ---
| Sistema Operativo | x       | Linux     | Windows Mac
| Servidor HTTP     | A       | Apache    | Nginx lighttpd IIS
| SGBDR             | M       | MySQL     | MariaDB PostgreSQL
| Programación      | P       | PHP       | ...

<!-- > [Bitnami](https://bitnami.com/): LAMP para desarrollo y pruebas -- localhost

<table style="text-align: center;">
  <thead>
    <tr >
      <th colspan=8 style="text-align: center;"><u>Módulos PHP de Binami</u></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan=2><b>phpMyAdmin</b></td>
      <td>e-Learning</td>
      <td>CMS</td>
      <td>Bug Tracking</td>
      <td>Wiki</td>
      <td>Forum</td>
      <td>Blog</td>
    </tr>
    <tr><td colspan=8><b>PHP</b></td></tr>
    <tr>
      <td colspan=4><b>MySQL/PostgreSQL</b></td>
      <td colspan=4><b>Servidor HTTP Apache</b></td>
    </tr>
    <tr><td colspan=8>Sistema operativo de usuario</td></tr>
  </tbody>
</table> -->

> Linux: [lamp-server](https://ubuntu.com/server/docs/lamp-applications) <!-- TODO: lamp-server -->

#### B. Aplicaciones web cliente-servidor

- Dos niveles (cliente y servidor) a través de la Web (conjunto recursos interconectados) // Uso Iternet y **procotolos** de comunicación (TCP IP DNS HTTP HTTPS)
- **Servidor**: 1 servidor web atiende peticiones de 1+ clientes, disponibilidad 24/7
- **Clientes**: componente consumidor, permite al usuario interactuar con front/backend (según validación acceso a recursos)

#### C. Aplicaciones web de 3 capas

- Lo más profesional (GYME), división máxima de funcionalidades por capa:
  - Capa **presentación** (nivel 1): responsive frontend, disponible en cualquier navegador web
  - Capa de **negocio** o lógica (nivel 2): backend, funcionalidades internas, modelo de negocio/servicio // **tendencias**: microservicios, serverless, cloud
  - Capa **persistencia** o datos (nivel 3): centralizar datos, accesible desde 1+ webserver (cluster, balanceo carga)
- VENTAJAS: flexibilidad, seguridad, rendimiento


## 3. Hosting y computación en la nube

```md
El concepto de computación en la nube (cloud computing) fue nombrado por primera vez por Ramnath Chellappa en 1997, en un seminario que impartió. Pero ya estaba asociado a John McCarthy, que fue pionero en la tecnología de la inteligencia artificial (IA) y que creó en el MIT, en 1958, el segundo lenguaje de programación de alto nivel llamado LISP, solo por detrás del FORTRAN, que surgió un año antes.
En esta última década se están desarrollando con fuerza la Internet de los servicios y el Big Data junto con la IA, con requisitos crecientes de capacidad de computación distribuida para atender a millones de usuarios de aplicaciones y extraer valor de la información a todos los niveles.
Una gran parte de toda esta información que se ha ido creando en el servicio de alojamientos web en línea (hosting) consiste en alquilar un espacio en un servidor en la nube que almacena todos nuestros archivos y datos que nos permite publicar un sitio y/o una aplicación web en Internet para que esté disponible 24 horas al día, 7 días a la semana, es decir, en cualquier hora de cualquier día para ser accesible desde cualquier lugar del planeta.
```

### 3.1 Tipología de la computación en la nube

- Coexistencia y limitaciones de computación en cluster y supercomputación == grid computing (compartir recursos de forma distribuida) > utility computing > **cloud computing**
  - **SaaS** - software como servicio: lo más popular, lo más gestionado (orientado a usuarios finales), ejemplos: Google Workspace, Microsoft 365, Dropbox, Paypal 
  - **PaaS** - plataforma como servicio: 'contenedores de aplicaciones, entornos cerrados donde alojar aplicaciones y recursos sin tener que administrarlos', ejemplos: Heroku, OpenShift...
  - **IaaS** - infraestructura como servicio: nubes de computación almacenamiento y servicios, capas de virtualización, gran control, ejemplos: AWS, Azure, VMware, etc etc.

### 3.2 Software como servicio (SaaS)

- Proveedor proporciona soporte a todos los niveles (servidores, aplicación...), para usuarios finales.

<!-- > TABLA componentes gestionados por equipo VS proveedor -->

### 3.3 Plataforma como servicio (PaaS)

- Orientado a desarrolladores de software o similar (e.g. CMS como Wordpress)
- HOSTING: WordPress, Dominios, **VPS**...

### 3.4 Infraestructura como servicio (IaaS)

- "Algunos de los planes de hosting funcionan sobre este nivel, por ejemplo, el cloud hosting el de servicio dedicado que puede estar contratado en cualquier de las IaaS que existen hoy en día.
- La diferencia es que en el cloud hosting el proveedor del servicio nos facilitará una consola de administración que nos facilitará la gestión del dominio y de nuestras webs. En cambio, el servicio dedicado nos dará acceso a una máquina sin ninguna ayuda y tendremos que ser nosotros los que nos encarguemos de realizar todo lo que queramos hacer, por lo que deberemos ser unos buenos administradores de sistemas y dominar el mundo de la computación en la nube. Algunos ejemplos de proveedores de infraestructura como servicio (IaaS): AWS, Azure, DigitalOcean, GoogleCloud, Linode"


## Documentación externa

- [AWS microservicios](https://aws.amazon.com/es/microservices/)
- [modelo serverless](https://www.ionos.es/digitalguide/servidores/know-how/serverless-computing/)
