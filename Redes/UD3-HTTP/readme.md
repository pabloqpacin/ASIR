# Materia UDx: Titulo

- [Materia UDx: Titulo](#materia-udx-titulo)
  - [TEORÍA](#teoría)
  - [PRÁCTICA](#práctica)
    - [foo](#foo)
    - [bar](#bar)
    - [McGrawHill](#mcgrawhill)
      - [1](#1)
        - [Caso práctico 1 -- Esquema comunicación HTTP](#caso-práctico-1----esquema-comunicación-http)
        - [Ponte a prueba 1 -- Tipos MIME en cabeceras HTTP](#ponte-a-prueba-1----tipos-mime-en-cabeceras-http)
        - [Ejercicios 1 -- test](#ejercicios-1----test)
      - [2](#2)
        - [Caso práctico 2 -- Apache2 en Ubuntu](#caso-práctico-2----apache2-en-ubuntu)
        - [Ponte a prueba 2 -- Apache en Windows](#ponte-a-prueba-2----apache-en-windows)
        - [Ejercicios 2 -- test](#ejercicios-2----test)
      - [3](#3)
        - [Caso práctico 3 -- Páginas personales](#caso-práctico-3----páginas-personales)
        - [Ponte a prueba 3 -- mod\_userdir](#ponte-a-prueba-3----mod_userdir)
        - [Estudio de caso -- Hosts virtuales para usuarios en Ubuntu y Windows](#estudio-de-caso----hosts-virtuales-para-usuarios-en-ubuntu-y-windows)
        - [Ejercicios 3 -- test](#ejercicios-3----test)
      - [4](#4)
        - [Caso práctico 4 -- Auth básica](#caso-práctico-4----auth-básica)
        - [Ejercicios 4 -- test](#ejercicios-4----test)
      - [5](#5)
        - [Caso práctico 5 -- Apache con SSL](#caso-práctico-5----apache-con-ssl)
        - [Ponte a prueba 5 -- Directivas **ssl**](#ponte-a-prueba-5----directivas-ssl)
        - [Estudio de caso -- foo](#estudio-de-caso----foo)
        - [Ejercicios 5 -- test](#ejercicios-5----test)
      - [6](#6)
        - [Caso práctico 6 -- Webalizer](#caso-práctico-6----webalizer)
        - [Ponte a prueba 6 -- Módulo mod-status](#ponte-a-prueba-6----módulo-mod-status)
        - [Estudio de caso -- Awstats](#estudio-de-caso----awstats)
        - [Ejercicios 6 -- test](#ejercicios-6----test)
  - [QUIZ](#quiz)


## TEORÍA

> apuntes.md

- Códigos de respuesta

| Código  | Descripción
| ---     | ---
| 1xx
| 2xx
| 3xx
| 4xx
| 5xx

## PRÁCTICA

### foo
### bar
### McGrawHill

#### 1

##### Caso práctico 1 -- Esquema comunicación HTTP

```md
**Esquema de una comunicación HTTP**

Se puede utilizar el comando **telnet** para establecer una comunicación en una página en cualquier puerto. En nuestro caso, para el puerto 80, que suele ser siempre el puerto utilizado por HTTP.

También se puede instalar una extensión para nuestro navegador que nos permita ver el contenido de los mensajes de petición y respuesta HTTP de las conexiones que establezcamos. Para Mozilla Firefox, la extensión se llama HTTP Header Live.

1. Se pide conocer la estructura de un proceso de comunicación normal utilizando el protocolo HTTP.
2. Se pide conocer las cabeceras de alguna página web
```

```bash
telnet localhost 80
  # HEAD / HTTP/1.1

# Firefox: HTTP Header Live: ... NO!!
```

##### Ponte a prueba 1 -- Tipos MIME en cabeceras HTTP

\-

##### Ejercicios 1 -- test

1. El protocolo HTTP es un protocolo de transferencia de **hipertexto**. Por defecto, establece el puerto **80** como puerto con el que se comunica el servidor con el **cliente**. Para realizar una comunicación **HTTP** entre un servidor y un cliente se necesita establecer previamente una conexión **TCP**. En una comunicación HTTP, el cliente envía mensajes de **petición**, y el servidor envía mensajes de **respuesta**.
2. ¿Cuál de los siguientes datos no forma parte de una línea de petición de un mensaje HTTP? **Descripción de estado**
3. ¿Cuál de los siguientes datos forma parte de una línea de respuesta de un mensaje HTTP? **Versión del protocolo**
4. En principio, MIME se desarrolló para permitir la transmisión de multitud de tipos de archivos mediante: **El correo electrónico**
5. El elemento de un documento web que sirve para enlazar con otro documento web se llama: **Hipervínculo**


#### 2

##### Caso práctico 2 -- Apache2 en Ubuntu

```bash
ps axl| grep apache2
sudo netstat -atunp | grep apache2 
```

##### Ponte a prueba 2 -- Apache en Windows

HELL NAW!

##### Ejercicios 2 -- test

1. Una vez que se ha instalado el servidor web Apache, ¿qué carpeta es tomada como carpeta raíz del sitio web? **/var/www/html**
2. Tras instalar el servidor Apache en un sistema Ubuntu, el archivo principal de configuración es... **/etc/apache/apache2.conf** ~~/etc/apache/httpd.conf~~ ~~/etc/apache2/apache2.conf~~
3. Indica cuál de los siguientes archivos se utiliza para la resolución del servidor web el equipo local. **/etc/hosts**
4. Indica cuál de los siguientes comandos volvería a arrancar el servicio Apache. **sudo systemctl restart apache2**
5. De los siguientes servidores web, indica cuál de ellos tiene una mayor implantación a nivel global. **Nginx**

#### 3

##### Caso práctico 3 -- Páginas personales

Preparar el servidor web Apache2 para que los usuarios del sistema puedan acceder a sus páginas web personales.

```bash
sudo useradd -mg users -G wheel usuario1 && sudo passwd usuario1
su usuario1

mkdir ~/public_html
echo "Esta es la página web del $USER" > ~/public_html/index.html
sudo chmod -R 755 /home/$USER

sudo a2enmod userdir
xdg-open http://localhost/~usuario1
```

##### Ponte a prueba 3 -- mod_userdir

```md
**Utilización del módulo mod_userdir**
La utilización del módulo **userdir** proporciona a los usuarios del sistema la posibilidad de disponer un espacio web personal dentro del sitio web. Tendrán una carpeta personal en la que podrán guardar todos los archivos de su espacio web.
Este módulo permite que cualquier usuario del servidor pueda crear su espacio web en un directorio o carpeta dentro de su cuenta. Es decir, permite asociar sitios con los usuarios del sistema. 
Se pide analizar el funcionamiento del módulo **userdir** en GNU/Linux Ubuntu e interpretar las directivas contenidas en el archivo de configuración.
```

##### Estudio de caso -- Hosts virtuales para usuarios en Ubuntu y Windows

```conf
<VirtualHost *:80>
  ServerName servidor.apache2.com
  ServerAdmin webmaster@localhost
  DocumentRoot /var/www/html
  ErrorLog ${APACHE_LOG_DIR}/error.log
  CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

```bash
touch .../virtual.conf

# ...

sudo a2ensite virtual
sudo systemctl reload apache2

xdg-open virtual.apache2.com
```


##### Ejercicios 3 -- test

1. Indica en cuál de los siguientes directorios se encuentran los archivos de carga de todos los módulos instalados para Apache. **/etc/apache2/mods-available**
2. En la configuración de un servidor virtual, la directiva DocumentRoot debe escribirse en el archivo de configuración del servidor virtual... **Dentro de la directiva VirtualHost.**
3. La directiva de configuración de Apache ServerRoot /apache indica que... **El servidor está instalado en el directorio /apache.**
4. De las siguientes afirmaciones, indica la opción verdadera. **La instalación de Apache2 deja, por defecto, activados sus mecanismos de registro de actividad.**
5. En relación con el módulo mod_userdir, indica cuál estas opciones es correcta. **Cualquier usuario puede tener en su home su espacio web.**

#### 4

##### Caso práctico 4 -- Auth básica

```md
> Dado el usuario **prueba**, que no existe en el sistema, establecer para él un acceso restringido al sitio "privado" utilizando autenticación básica.

Paso 1. Creación de un usuario prueba
Creamos el directorio «privado».
$ sudo mkdir /var/www/html/privado
Copiar a este directorio una página web sencilla que identifiquemos fácilmente, de nombre index.html.
Este es el sitio privado de prueba
Creamos el directorio donde almacenar las contraseñas (si no existe); por ejemplo:
$ sudo mkdir /etc/apache2/passwd
Nota: es importante que el archivo .htpasswd no esté accesible desde la web (fuera de DocumentRoot).
Damos de alta al usuario prueba en el archivo de contraseñas:
$ sudo htpasswd -c /etc/apache2/passwd/.htpasswd prueba
New password: 
Re-type new password: 
Adding password for user prueba
Comprobamos que se ha dado de alta el usuario prueba en .htpasswd:
$ cat /etc/apache2/passwd/.htpasswd 
prueba:$apr1$guQS0hhV$84lJKWqjVaIOyP4dechfp.
Cambiamos permisos de .htpasswd a 644 si no los tiene.

Paso 2. Autenticación HTTP básica
Ahora ya tenemos todo preparado para configurar las dos formas diferentes de autenticación básica.

1. Globalmente: utilizando el archivo de configuración /etc/apache2/sites-available/000-default.conf, en el que habría que añadir un bloque <Directory>...</Directory> o Locate para el directorio que queremos proteger:
	Alias /privado/ /var/www/html/privado/
	<Directory /var/www/html/privado>
		AuthType Basic
		AuthName "Directorio privado"
		AuthUserFile /etc/apache2/passwd/.htpasswd
		Require user prueba
		AllowOverride All
	</Directory>
Recuerda que hay que forzar a Apache2 a que lea sus archivos de configuración con force-reload.
Probamos la configuración desde el navegador: vamos a la URL http://servidor.apache2.com/privado/ y aparece esta ventana: ...
Introducimos los datos del usuario prueba y visualizamos el contenido del archivo index.html creado en dicho directorio.
Las directivas mencionadas arriba solo permiten un usuario en el directorio. En la mayoría de los casos, se querrá permitir el acceso a más de un usuario. Si fuese así, habrá que utilizar la directiva AuthGroupFile.
Si lo intenta otro usuario, le mostraría lo siguiente: ...

2. Utilizando archivos .htaccess: las directivas incluidas en el archivo .htaccess se aplicarán solo al directorio que lo contiene, así como a todos sus subdirectorios.
Los archivos .htaccess se leen cada vez que hay una petición de páginas, y no hay que reiniciar el servidor web para que se activen los cambios realizados.
Creamos en /var/www/privado/ el archivo .htaccess con el contenido siguiente:
$ sudo gedit /var/www/html/privado/.htaccess
AuthType Basic
AuthName "Directorio privado" 
AuthUserFile /etc/apache2/passwd/.htpasswd
Require user prueba
Ahora habría que comentar en /etc/apache2/sites-available/000-default.conf el grupo de directivas incluidas para la autenticación global e incluir un grupo <Directory></Directory> con la directiva AllowOverride que habilite la utilización de archivos .htaccess con autenticación:
	Alias /privado/ /var/www/html/privado/
	<Directory /var/www/html/privado>
		AllowOverride AuthConfig
	</Directory>
Probamos la configuración desde el navegador mediante .htaccess.
Vamos a la URL http://servidor.apache2.com/privado/ y aparece la misma ventana anterior, en la que se pide la identificación del usuario. Visualizamos el contenido del archivo index.html creado en dicho directorio.
Para eliminar un usuario del archivo de contraseñas hay que utilizar la opción –D en la orden htpasswd.
```

<!-- ##### Ponte a prueba 4 -- Directivas de authenticación-->
<!-- ##### Estudio de caso -- Auth digest con Apache2 -->
##### Ejercicios 4 -- test

1. Respecto a la directiva Satisfy, indica cuál es la opción correcta. **Puede requerir autenticación HTTP y por IP.**
2. Indica cuál de las siguientes afirmaciones es falsa. **La autenticación se lleva a cabo mediante el módulo mod_auth.**
3. La autenticación es un... **Mecanismo de comprobación de credenciales. **
4. La utilización del control de acceso o autenticación por IP... **Utiliza Satisfy para combinarse con la autenticación HTTP.**
5. Indica cuál de las siguientes afirmaciones es cierta. **La autenticación por IP equivale al control de acceso.**

#### 5

##### Caso práctico 5 -- Apache con SSL

Se pide realizar todos los pasos previos de configuración que son necesarios, así como generar un certificado autofirmado e instalarlo en Apache2. 

```md
Paso 1. Crear certificado
1. Comprobar si se tiene instalado el paquete openSSL y activado el módulo `mod_ssl`:
$ ls /etc/apache2/mods-enabled
Si no está cargado el módulo que activa SSL, hay que ejecutar
$ sudo a2enmod ssl
Vamos a hacer la configuración sobre el servidor web de ejemplo servidor.apache2.com.
Tenemos que ir a /etc/apache2 y crear el directorio sslcert; en él se guardará el certificado que vamos a generar. Vamos a /etc/apache2/sslcert/.
La siguiente orden crea el certificado y la clave de este.
$ sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/sslcert/apache.key -out /etc/apache2/sslcert/apache.crt
...............................
...+.+.....+.......+..+....+.........+......+..............+...+...................+.........+......+......+.........+...........+..........+...+.....+....+...+.....+....+...........+...+....+.....+..........+.................+...+.+.....+......+...+..........+...+..............+...+.......+.....+...+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:ES
State or Province Name (full name) [Some-State]:Valencia
Locality Name (eg, city) []:Valencia
Organization Name (eg, company) [Internet Widgits Pty Ltd]:McGraw-Hill
Organizational Unit Name (eg, section) []:educacion
Common Name (e.g. server FQDN or YOUR name) []:servidor.apache2.com
Email Address []:a@b.com
Comprobamos la creación de ambos archivos:
$ ls -al /etc/apache2/sslcert
total 16
drwxr-xr-x 2 root root 4096 jun 14 23:10 .
drwxr-xr-x 10 root root 4096 jun 14 23:07 ..
-rw-r--r-- 1 root root 1464 jun 14 23:10 apache.crt
-rw------- 1 root root 1700 jun 14 23:08 apache.key
Con ello, hemos creado el certificado (apache.crt) y la clave privada (apache.key) del servidor servidor.apache2.com, firmados por nosotros mismos.
$ cat apache.crt 
-----BEGIN CERTIFICATE-----
MIIECzCCAvOgAwIBAgIUZk8fwzS6wqr5UJnhUu/InRrmUtcwDQYJKoZIhvcNAQEL
BQAwgZQxCzAJBgNVBAYTAkVTMREwDwYDVQQIDAhWYWxlbmNpYTERMA8GA1UEBwwI
VmFsZW5jaWExFDASBgNVBAoMC01jR3Jhdy1IaWxsMRIwEAYDVQQLDAllZHVjYWNp
b24xHTAbBgNVBAMMFHNlcnZpZG9yLmFwYWNoZTIuY29tMRYwFAYJKoZIhvcNAQkB
FgdhQGIuY29tMB4XDTIyMDYxNDIxMTAwMloXDTIzMDYxNDIxMTAwMlowgZQxCzAJ
BgNVBAYTAkVTMREwDwYDVQQIDAhWYWxlbmNpYTERMA8GA1UEBwwIVmFsZW5jaWEx
FDASBgNVBAoMC01jR3Jhdy1IaWxsMRIwEAYDVQQLDAllZHVjYWNpb24xHTAbBgNV
BAMMFHNlcnZpZG9yLmFwYWNoZTIuY29tMRYwFAYJKoZIhvcNAQkBFgdhQGIuY29t
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA52l9itYE758LiwfiJ2Fa
KXux50uGL6hFbRGYeMQk17G0z1wjWPUGW3QtK9HBGtzKZGF5kFcmcJLuJwS/i8z2
oYIbafsFRtsDExtqSMLud/8xK8bbMNJXSSAhgs++jHFcN1/YshH6SWhphiFIEawm
Bwf55IpuN4BZkmXEs6iuqZMDp7X2x6xo/ctjitQ2uqHYre2CqW/EWAAqak0evtUl
uVLS0PxEDZHXc8ejpkpH4uFag9P6zxO3rKV8yfrueqpM7D9is4ALbWcPAPMSp1X8
G6L5JMjqMCLLcuM3n+QSFyMcfXGlMsNHRi30K0NEGXQ/kABxMoxcp4akN/VQXMr9
oQIDAQABo1MwUTAdBgNVHQ4EFgQUateJMp+CB3y9SJ8Dnfkrfff+MTswHwYDVR0j
BBgwFoAUateJMp+CB3y9SJ8Dnfkrfff+MTswDwYDVR0TAQH/BAUwAwEB/zANBgkq
hkiG9w0BAQsFAAOCAQEA2kxSJwqtl47VYYV1fFgaJGnF0x1um1PxKU8LSAEnfm9f
nmP4xkWZ6tpc1UDDSIAJ2FGxsEvf0PJRImuV/MoBjGk2iWkRUG/EqqmlLUcCxH9v
t35J6Ez5D2p/VbfXL9J/mxnw4SSAytSgHRukQRQAGTjKrHlaePP2ygvWYabswcxm
ew7neWTyl4vM0zGHDEziFVL3ZEcAfqM4FvTnRgvld/8GRT0GmzlJ2RcZ8i0SQils
oTOgsZX6tye6F1d+80C5jsGq21Nlwca0bfee2qKyCQFKvL9xG+oRSyJ/1030qXtg
AU+euMNt7LxWCVnVIRxo6PratPHUFjzdanzFppk87w==
-----END CERTIFICATE-----ion de Apache para que utilice SSL

Paso 2. Configurar Apache para use SSL
Además, en /var/www/htmls/ (si no existe, debemos crearlo como root) hay que añadir un archivo index.html con el texto «Prueba de servidor seguro HTTPs».

Configuramos Apache2 para que use por defecto el protocolo https:// con el certificado y la clave que hemos creado. Para ello, hay que editar el archivo:
$ sudo gedit /etc/apache2/sites-available/default-ssl.conf
Vamos a <VirtualHost _default_:443>; añadimos ServerName servidor.apache2.com:443 y actualizamos el DocumentRoot a /var/www/htmls/.
	IfModule mod_ssl.c>
			<VirtualHost _default_:443>
				ServerAdmin webmaster@localhost
				ServerName servidor.apache2.com
				DocumentRoot /var/www/htmls
Vamos más abajo y buscamos las líneas SSLCertificateFile y SSLCertificateKeyFile; ponemos la ruta que corresponde a cada documento. En nuestro caso, el resultado será el siguiente:
		SSLCertificateFile   /etc/apache2/sslcert/apache.crt
	SSLCertificateKeyFile /etc/apache2/sslcert/apache.key
A continuación, hemos de activar el site y reiniciar o recargar Apache2 para que cargue los cambios realizados:
$ sudo a2ensite default-ssl
Enabling site default-ssl.
To activate the new configuration, you need to run:
 systemctl reload apache2
$ sudo systemctl reload apache2
Con esto, tenemos el certificado SSL autofirmado funcionando en nuestro servidor Apache2.

Paso 3. Comprobar que Apache funciona mediante SSL
Para comprobar que funciona desde otro equipo con Ubuntu u otra distribución GNU/Linux, establecemos una conexión HTTPs al servidor desde una terminal. Ejecutamos según la sintaxis siguiente:
$ openssl s_client -connect IP_de_tu_servidor:443
Y adaptamos a los datos concretos. Si funciona, muestra información sobre el certificado del servidor seguro y que SSL funciona. Si no funciona, hay que asegurarse, con la orden nmap en el servidor, de que el puerto 443 está abierto.
Otra forma de comprobar el funcionamiento del servidor seguro es ir al navegador en el propio servidor y dar la URL https://servidor.apache2.com; aparece la siguiente ventana en la que se indica que el certificado de que dispone este sitio ha sido emitido por una entidad desconocida:
Pulsamos en Avanzado y, a continuación, en Aceptar el riesgo y continuar.
Ahora muestra el texto de bienvenida al servidor seguro.
Podemos ver el certificado con los datos introducidos en el navegador:
```

##### Ponte a prueba 5 -- Directivas **ssl**

Se pide crear una tabla con la descripción de las principales directivas relacionadas con el módulo ssl.

~~Se recomienda visitar la página oficial de Apache 2.4 para obtener la información (https://httpd.apache.org/docs/current/mod/mod_ssl.html).~~

##### Estudio de caso -- foo
##### Ejercicios 5 -- test

1. Cuando se ejecuta en Ubuntu el comando para obtener un certificado autofirmado, ¿qué archivos se deben indicar dentro del comando? **El archivo de certificado, el de petición de firma del certificado y el de clave.**
2. En el certificado digital aparece la identidad de la autoridad de certificación. **Verdadero.**
3. Verificar la validez de un certificado requiere comprobar la firma de la autoridad de certificación (CA) usando la clave pública de la CA. **Falso**
4. El objetivo de una CA es acreditar la correspondencia entre una clave y su propietario real. **Verdadero.**
5. Una autoridad certificadora puede tener un certificado digital emitido por otra autoridad. 
**Verdadero.**
6. La autoridad certificadora (CA) se encarga de firmar digitalmente... **La clave pública de los usuarios junto con otra información de la identidad.**
7. En relación con la firma digital, indica cuál de las siguientes afirmaciones es la correcta. **La firma digital de un mensaje no requiere cifrar todo el mensaje con la clave privada del remitente.**
8. El módulo ssl requiere la desactivación del puerto 80. **Falso**
9. La directiva SSLEngine no requiere ningún parámetro. **Falso**
10. El módulo ssl requiere la utilización del archivo httpd-ssl.conf. **Verdadero.**
11. La directiva SSLRequireSSL se debe poner a On para trabajar con soporte SSL. **Falso**



#### 6

##### Caso práctico 6 -- Webalizer

```md
Webalizer es una aplicación de análisis de logs de servidores web. Es decir, permite obtener estadísticas de acceso a un servidor web, indicando cuáles son las páginas más visitadas, etc.
Estas estadísticas las muestra como gráficas, que son accesibles vía web. Genera, por tanto, informes en formato HTML.
Webalizer se puede descargar de ftp://ftp.mrunix.net/pub/webalizer/ y se distribuye bajo licencia GNU GPL.
> Se pide instalar la herramienta y estudiar su comportamiento obteniendo algunas estadísticas del servidor web Apache.

Paso 1. Instalación
Desde Ubuntu instalamos el paquete .deb webalizer:
	$ sudo apt install webalizer
En el proceso de instalación-configuración, nos dice que la versión instalada es la 2.23 y el lugar en que se almacenarán los informes generados (/var/www/webalizer).
La sintaxis de utilización es:
	webalizer [opciones] <archivo_log>
donde <archivo_log> es el path del archivo de logs de cuya información se quiere obtener el informe. Si no se especifica, se toma el archivo por defecto dado en el archivo de configuración de Webalizer, que es /etc/webalizer/webalizer.conf.
La herramienta dispone de gran cantidad de opciones, que se pueden consultar con la orden man.
En general, no es necesario modificar el archivo de configuración /etc/webalizer/webalizer.conf. Si queremos modificar los parámetros configurados en la instalación de Webalizer y adecuarlos a nuestro sistema, lo haremos con estas directivas:
	LogFile /var/log/apache2/access.log.1
	OutputDir /var/www/webalizer
	ReporTitle Informe estadísticas servidor web
Como el directorio de salida por defecto es /var/www/webalizer y para Apache2 es /var/www/html, hay que mover el directorio /var/www/webalizer a la ruta /var/www/html para que la sincronización entre Apache y Webalizer sea correcta, además de modificar el valor OutputDir en webalizer.conf.
	# mv /var/www/webalizer /var/www/html/
	OutputDir /var/www/html/webalizer

Paso 2. Estadísticas de acceso con Webalizer
Para generar el informe, hay que ejecutar como root:
	$ sudo webalizer 
	Webalizer V2.23-08 (Linux 5.15.0-37-generic x86_64) locale: �c�ςU
	Utilizando histórico /var/log/apache2/access.log.1 (clf)
	Creando informe en /var/www/html/webalizer
	El nombre de máquina en el informe es 'elvira'
	No encuentro el archivo histórico...	
	Generando informe de Junio 2022
	Guardando información de archivo...	
	Generando informe resumido
	80 registros en 1 segundos, 80/sec
Si ahora vamos al navegador web e introducimos la URL http://servidor.apache2.com/webalizer/, veremos una gráfica del estilo siguiente:
En la imagen diferenciamos entre el informe resumido de los últimos doce meses (tabla superior) y el detalle para cada uno de los meses, que es una tabla que contiene totales para la fecha de generación del documento.
Los campos que aparecen en las estadísticas se interpretan de la forma siguiente:
- Accesos (hits): se define como el número de peticiones de archivos que se realizan al servidor durante un período de tiempo dado. Se confunden con «visitas», pero no son lo mismo. Un hit es un acceso, una petición al servidor de un archivo. Ejemplo: si en la página, además del archivo HTML, se utiliza un archivo externo JavaScript, otro CSS, y, además, la cabecera y una imagen pequeña, en total tenemos cinco accesos, cinco peticiones de archivos. El número de accesos siempre será mayor que el número de visitas.
- Archivos: es el número total de peticiones (accesos) que devuelven «algo» al usuario. No es lo mismo que acceso, ya que no siempre se enviará algo a la petición. En ocasiones, el resultado ya está en la caché o se produce algún error, con lo que no hay retorno.
- Visita: cuando un usuario entra en la página, se produce una visita. Todo el tiempo que navegue por la web contará como esa visita, solo una. La primera petición que realiza ese cliente remoto es lo que cuenta como visita. Luego puede estar el tiempo que quiera descargando algo, leyendo contenidos... Todo eso formará parte de la misma visita.
- Clientes: número de visitas que no se repiten. No se contabilizan los usuarios que vuelven a lo largo del tiempo. Este es uno de los valores más fiables para conocer el número de visitas, ya que tenderá a ser menor que el número real y no nos muestra las estadísticas web infladas.
- Total de kilobytes: cantidad total de datos que transfirió el servidor a los clientes. Es útil para llevar un control sobre la transferencia máxima mensual que nos proporciona nuestro servicio de hosting.
- Páginas vistas: cualquier tipo de archivo HTML, o cualquiera que genere HTML. No se incluyen los otros archivos incluidos en el documento, como imágenes, audio, Flash, etc.
- Página de entrada: páginas a través de las que el usuario accede a nuestro servidor. No siempre se accede a nuestra página principal.
- Página de salida: última página web visitada por el usuario.
- Referidos: sitios a través de los que se accede a nuestra página, ya sean buscadores u otras páginas que nos enlacen.
- Cadenas de búsqueda: palabra o palabras clave que se usan en los buscadores para llegar a nuestra página web o sitio web.
Si accedemos a un mes concreto, nos devuelve una información más completa de la actividad de Apache2.
Pero esta no es la forma «normal» de generar los informes.
Al instalar Webalizer, se incluye, por defecto, el script que lanza la ejecución programada diariamente en el directorio /etc/cron.daily/. Este script lo ejecuta diariamente el servidor a la hora indicada en el archivo /etc/crontab, y genera el informe diario correspondiente.
El usuario root puede ejecutar dicho script en cualquier momento y obtener un informe con las últimas estadísticas, de la forma siguiente:
	$ sudo /etc/cron.daily/webalizer
que analiza los logs que tenga nuestro servidor web y deja accesible el resultado en la carpeta webalizer del servidor: http://servidor.apache2.com/webalizer/

Paso 3. Archivo de configuración /etc/webalizer.conf
Las directivas más importantes del archivo de configuración son:
- LogFile 
Ruta al archivo que almacena los accesos registrados por el servidor web. 
	LogFile /var/log/apache2/access.log
- OutputDir
Ruta del directorio donde se ubicará el informe generado. Es importante que quede bajo el directorio del servidor web /var/www/webalizer
	OutputDir /var/www/webalizer
- ReportTitle
Título que aparecerá en el informe:
	ReportTitle Estadísticas Servidor Web
- HostName
Nombre del servidor web
	HostName servidor
- PageType
En este parámetro, que puede tener varias entradas, se especifica qué tipo de páginas se quiere procesar. Suelen ser páginas con extensión htm*, cgi (por ejemplo, consulta motores de búsqueda), páginas dinámicas con php* y archivos de Perl .pl:
	PageType htm*
	PageType cgi
	PageType phtml
	PageType php*
	PageType pl
- Quiet / ReallyQuiet
Suprimen los mensajes de error que puedan presentarse. Es recomendable asignarlos como yes para procesar los logs del servidor.
	Quiet yes
	ReallyQuiet yes
- TopEntry
Si se pone el valor 100, mostrará las 100 páginas de inicio de sesión más consultadas.
- TopExit
Si se pone el valor 100, mostrará las 100 páginas de salida de sesión más comunes.
```

##### Ponte a prueba 6 -- Módulo mod-status

```md
**Módulo mod-status**
Aunque el usuario administrador de Apache siempre tiene disponible la opción de ver directamente los logs generados por la herramienta, puede obtener también una descripción general muy detallada del rendimiento del servidor web habilitando el módulo mod_status.
El módulo mod_status es un módulo de Apache que permite a los usuarios acceder a información detallada sobre el rendimiento de Apache en una página HTML simple.
Se pide averiguar qué habría que hacer en el servidor web Apache para tener disponible esta información ofrecida por el módulo mod-status.
```

##### Estudio de caso -- Awstats

...

##### Ejercicios 6 -- test

1. Respecto a SHA-1, indica cuál de las siguientes afirmaciones es correcta. **Es un algoritmo para obtener un hash o resumen digital. Se utiliza en relación con la integridad de la evidencia digital.**
2. En relación al proceso de análisis forense, indica cuál de las siguientes secuencias de fase es correcta. **Evaluar, adquirir, analizar e informar.**
3. La normativa ISO/IEC 27042 se aplica a... **Analizar e interpretar evidencias.**
4. Indica cuál de las siguientes no es una fase del análisis forense. **Análisis de la nube.**
5. Indica cuál es la regla de oro del análisis forense. **Proteger el original de la evidencia.**

## QUIZ
