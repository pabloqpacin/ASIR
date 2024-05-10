# Seguridad UD3: Seguridad Activa

- [Seguridad UD3: Seguridad Activa](#seguridad-ud3-seguridad-activa)
  - [TEORÍA](#teoría)
    - [Webografía](#webografía)
  - [PRÁCTICA (McGrawHill)](#práctica-mcgrawhill)
    - [1](#1)
      - [Caso práctico 1 -- Herramientas de ingeniería social](#caso-práctico-1----herramientas-de-ingeniería-social)
      - [Ponte a prueba 1 -- Noticias sobre ataques activos y/o pasivos](#ponte-a-prueba-1----noticias-sobre-ataques-activos-yo-pasivos)
      - [Ejercicios 1 -- test](#ejercicios-1----test)
    - [2](#2)
      - [Caso práctico 2 -- Rootkits en Ubuntu](#caso-práctico-2----rootkits-en-ubuntu)
      - [Ponte a prueba 2 -- Extensiones de Firefox para bloquear adware](#ponte-a-prueba-2----extensiones-de-firefox-para-bloquear-adware)
      - [Estudio de caso -- Malwarebytes en Windows](#estudio-de-caso----malwarebytes-en-windows)
      - [Ejercicios 2 -- test](#ejercicios-2----test)
    - [3](#3)
      - [Caso práctico 3 -- Antivirus ClamAV (Ubuntu)](#caso-práctico-3----antivirus-clamav-ubuntu)
      - [Ponte a prueba 3 -- Estudio del ataque ransomware](#ponte-a-prueba-3----estudio-del-ataque-ransomware)
      - [Ejercicios 3 -- test](#ejercicios-3----test)
    - [4](#4)
      - [Caso práctico 4 -- Buenas prácticas en el uso del correo electrónico](#caso-práctico-4----buenas-prácticas-en-el-uso-del-correo-electrónico)
      - [Ponte a prueba 4 -- Actualización del sistema operativo](#ponte-a-prueba-4----actualización-del-sistema-operativo)
      - [Ejercicios 4 -- test](#ejercicios-4----test)
    - [5](#5)
      - [Caso práctico 5 -- Tripwire: detección de modificaciones de archivos y directorios](#caso-práctico-5----tripwire-detección-de-modificaciones-de-archivos-y-directorios)
      - [Ponte a prueba 5 -- SIEM](#ponte-a-prueba-5----siem)
      - [Estudio de caso -- Utilización sencilla de Snort](#estudio-de-caso----utilización-sencilla-de-snort)
      - [Estudio de caso -- Monitorización de eventos con `audit`](#estudio-de-caso----monitorización-de-eventos-con-audit)
      - [Ejercicios 5 -- test](#ejercicios-5----test)
  - [QUIZ](#quiz)


## TEORÍA

> apuntes.md

### Webografía

- [Botnet](https://drive.google.com/file/d/1NcsnHYvvhAZhp5T-X75a1aJzKh7MO0xc/view)
- [Clasificación del malware](https://drive.google.com/file/d/1nglHNsCPDXYxpMmlkIJ6GJK5DFXD96Ll/view)
- [Fantasmas (drive-by downloads)](https://drive.google.com/file/d/1mtB0GkT0lE_TDyesLuWJ5vBKGMoQa22L/view)
- [Gusanos (Worms)](https://drive.google.com/file/d/1xjRJsxatshUhgUpM3VkUoYApSGXeSfMP/view)
- [Puertas traseras (backdoors)](https://drive.google.com/file/d/1ytQpsXpREAGbJDD8lTYy1xq9xUAS65KB/view)
- [Troyanos (Trojan horses)](https://drive.google.com/file/d/1dlgHKLPotTHINFOyEcRgNxTpvo0fK2p5/view)
- [Virus y antivirus](https://drive.google.com/file/d/1pde7DBXuQ6U-_T2eAzJhobQ9gRiTjq1K/view)

## PRÁCTICA (McGrawHill)

<!-- ### foo -->
<!-- ### bar -->

### 1

#### Caso práctico 1 -- Herramientas de ingeniería social

```md
**Introducción**
Existen multitud de técnicas, tácticas, herramientas y estrategias de ingeniería social, pero la más utilizada y potente es el phishing. 
El __phishing__ permite copiar de forma idéntica sitios web reales para robar las credenciales del usuario. El usuario prácticamente no se da cuenta y accede al sitio falso introduciendo sus credenciales, pero al navegar puede que se dé cuenta de que está ocurriendo algo extraño y se  salga del sitio web falso. El problema es que al identificarse (login), ya le han robado sus credenciales.
Los phishers son herramientas que permiten hacer este tipo de captura de datos. El phisher permite emular un conjunto de sitios web populares, pero también permite al usuario crear a medida el sitio web falso que necesite.
La distribución Kali Linux dispone de varias herramientas tipo phisher, entre ellas _SEToolkit_, _Metasploit_ y _Wifiphisher_.

**Enunciado**
Se pide arrancar con la máquina virtual Kali Linux y recopilar información con la herramienta SEToolkit, incorporada en la distribución y utilizada en ingeniería social.

---
**Solución**
SEToolkit, o SET, es un framework de código abierto que sirve para realizar testeos enfocados en ataques de ingeniería social. Puede realizar:
- _Ataques de phishing_: al usar SET se pueden crear páginas de phishing de muchos sitios web como Instagram, Facebook, Google, etc.
- _Ataque de correo masivo_: es un módulo del kit de herramientas de ingeniería social que se utiliza para bombardear correos electrónicos en la cuenta de correo de destino. Se puede usar simplemente una cuenta de Gmail.
- _Ataque web_: este módulo combina diferentes opciones para atacar a la víctima de forma remota. El ataque web utiliza el método Credential Harvester, mediante el cual puede clonar cualquier sitio web para un ataque de phishing y puede enviar el enlace de esa página web a la víctima para recopilar la información de los campos de usuario y contraseña.
```
```bash
sudo setoolkit
  # 1: Social-Engineering Attacks
    # 2: Website Attack Vectors
      # 3: Credential Harvester Attack Method
        # 1: Web Templates
            # IP: <Enter>
            # Template: 2. Google

xdg-open localhost  # Básicamente, Google LMAO
sudo bat /root/.set/reports/*.xml
```

#### Ponte a prueba 1 -- Noticias sobre ataques activos y/o pasivos

```md
**Noticias sobre ataques activos y/o pasivos**
Busca noticias actuales relacionadas con ataques activos y/o pasivos realizados recientemente y con una repercusión mediática de cierta relevancia. Comenta el ataque e indica cuál ha sido el vector utilizado.
Buscar en Internet noticias aparecidas en los medios de comunicación. 

---
xz (abril 2024)
```

#### Ejercicios 1 -- test

1. Ocultar los caracteres cuando se introduce una contraseña es una medida: **De seguridad activa.**
2. Indica de las siguientes cuál no es una categoría de ataque activo. **Interceptación de datos y análisis del tráfico.**
3. De las siguientes afirmaciones, indica cuál de ellas es verdadera. **El ataque pasivo obtiene información.**
4. Indicar cuál de las siguientes opciones es la correcta con relación a la exploración de puertos en un ataque. **Puede indicar si el equipo a atacar  está activo o no.**
5. Indicar si el phishing está relacionado con los ataques activos por suplantación de identidad. **Sí, el objetivo del phishing es conseguir credenciales.**

### 2

#### Caso práctico 2 -- Rootkits en Ubuntu

- [ ] Install RK

```md
**Introducción**
El ejercicio consiste en la detección de rootkits en el equipo personal. Se desarrolla en Ubuntu, pero existen herramientas en Windows. En concreto, para Windows  existe la herramienta _GMER Anti-Rootkit_ (entre otras). Esta aplicación (gratuita) para eliminar virus escanea, detecta y elimina cualquier rootkit que se oculte en el ordenador. Es muy sencilla de usar y de escaneo muy rápido. La web del proyecto es http://www.gmer.net y está disponible para Windows 10 y para arquitecturas de 64bits. Es de la misma compañía que Avast.
Para Windows 11 está la herramienta de eliminación de software malintencionado de _Windows MSRT_ (Windows Malicious Software Removal Tool) o Bitdefender Total Security (https://www.bitdefender.com/solutions/total-security.html).

**Enunciado**
Detección de rootkits en GNU/Linux Ubuntu (_chkrootkit_ / _rkhunter_).

---
**Solución**

**chkrootkit / rkhunter**
Los rootkit son herramientas que tienen como finalidad esconderse a sí mismas y esconder a otros programas, procesos, archivos, directorios, llaves de registro y puertos, que permiten a un intruso mantener el acceso a un sistema para, remotamente, poder ejecutar acciones o extraer información.
<u>Chkrootkit es un script Linux que utiliza órdenes como strings y grep para buscar entre los ejecutables del sistema firmas de rootkits conocidos para este sistema operativo y compara el directorio /proc con la salida de la orden ps buscando discrepancias.</u>
Está disponible en el repositorio de Ubuntu y en GitHub.
	$ sudo apt install chkrootkit  
Ahora ejecutamos el comando chkrootkit. Hay que tener en cuenta que esta acción puede tardar un tiempo.
	$ sudo chkrootkit        

Rkhunter (Rootkit Hunter) es de código abierto. Esta herramienta también se puede utilizar para detectar puertas traseras y posibles exploits locales. Es un script que realiza varias comprobaciones en el sistema local para intentar detectar rootkits y malware conocidos. 
Instalamos rkhunter sin configuración del correo.
	$ sudo apt install rkhunter   # --no-install-recommends
Para rkhunter hemos de hacer unas modificaciones en la configuración. Editamos el archivo /etc/rkhunter.conf, buscamos las directivas siguientes y las dejamos con los valores que se indican.
	UPDATE_MIRRORS=1
	MIRRORS_MODE=0 
	WEB_CMD=""
Si se quieren automatizar las actualizaciones, desde el cron hay que editar el archivo /etc/default/rkhunter y asignar los siguientes valores:
	CRON_DAILY_RUN="true"
	CRON_DB_UPDATE="true"
	APT_AUTOGEN="true"
Actualizamos el paquete rkhunter: 
	$ sudo rkhunter --update
Ejecutamos para chequear el sistema. Hay que tener en cuenta que esta acción puede tardar un tiempo.
	$ sudo rkhunter -c --sk
Podemos revisar la bitácora del rkhunter con el comando:
	$ more /var/log/rkhunter.log
En el caso de no detectar ningún rootkit, se pueden descargar algunos desde las páginas siguientes:
https://www.hackplayers.com/2017/05/recopilatorio-de-rootkits.html
https://tenochtitlan-sec.blogspot.com/2017/05/recopilatorio-de-rootkits.html
En este caso para hacer las pruebas mejor hacerlo en la máquina virtual.
```

#### Ponte a prueba 2 -- Extensiones de Firefox para bloquear adware

```md
**Extensiones de Firefox para bloquear adware**
La herramienta Malwarebytes dispone de una extensión para Firefox, Malwarebytes Browser Guard, que protege la privacidad bloqueando los rastreadores, la publicidad y el contenido malicioso. Otras extensiones útiles son Adblocker ultimate, Privacy Badger y Ghostery, entre otras.
Acceder a las extensiones de Firefox y buscar estas extensiones y otras que puedan ser de interés para el alumnado.
```

#### Estudio de caso -- [Malwarebytes en Windows](https://drive.google.com/file/d/1k5k-2N9p8ycJgBEDO6uJb28zAW95U8uq/view)

...

#### Ejercicios 2 -- test

1. De las siguientes respuestas, indicar cuál es la que establece la diferencia entre troyanos, virus y gusanos. **El gusano no debe esperar a que se ejecute ningún archivo.**
2. Los rootkits se caracterizan por: **Implementar técnicas para permanecer ocultos.**
3. El análisis del software malicioso: **La mayoría de las veces es un análisis dinámico.**
4. Si la red en la que trabajamos disminuye la velocidad de transferencia de información, ralentizando la conexión con el servidor, puede indicar la presencia de un: **Gusano.**
5. Los rootkits se caracterizan por: **Obtener privilegios.**


### 3

#### Caso práctico 3 -- Antivirus [ClamAV](https://github.com/Cisco-Talos/clamav) (Ubuntu)

```md
**Introducción**
No es habitual hablar de virus en GNU/Linux; hay muy pocos virus diseñados para atacar sistemas GNU/Linux, pero los hay. El ejemplo más relevante en 2022 es Symbiote, un virus cuyo nombre procede de su capacidad para funcionar sin ejecutables (en simbiosis), ya que solo se 'inyecta' en los procesos en ejecución y los convierte en maliciosos.
Sin embargo, sí que podemos transmitir virus sin darnos cuenta: podemos recibir un archivo infectado y reenviarlo por correo. Al no tener antivirus, no sabemos si ese archivo está infectado o no.
ClamAV es un antivirus open source y multiplataforma, con versiones para Windows, GNU/Linux y macOS, entre otros sistemas operativos. 
La última versión (julio de 2022) liberada por Cisco de la suite antivirus es la ClamAV 0.105.0.  (https://www.clamav.net).

**Enunciado**
Instalar ClamAV desde Ubuntu Software y estudiar su funcionamiento.
Hay que recordar que este ejercicio se puede realizar en Windows descargando el software desde https://github.com/Cisco-Talos/clamav/blob/main/INSTALL.md.
También, si se prefiere, está disponible el antivirus Avast https://www.avast.com/es-mx/index#pc.

...
```

#### Ponte a prueba 3 -- Estudio del ataque ransomware

```md
**Estudio del ataque ransomware**
El ransomware es un software malicioso (malware) que bloquea archivos y datos, casi siempre mediante encriptación, y los retiene para pedir un rescate. El atacante o el grupo que controlan el ransomware desbloquean los archivos en remoto una vez que la organización víctima paga el rescate.
Obtener información sobre el malware ransomware para conocer los mecanismos utilizados en este tipo de ataque.
> Es un ejercicio de investigación en el que el alumnado tendrá que obtener información relativa al método de infección por ransomware, su funcionamiento y propuestas de seguridad frente a este ataque.
```

#### Ejercicios 3 -- test

1. Una aplicación que realice un ataque por fuerza bruta para descubrir la contraseña de un usuario: **Para que tenga éxito, primero se debe poder acceder al sistema.**
2. De las siguientes acciones, indica cuál de ellas crees tú que no se produciría nunca en un phishing bancario: **Se alquila una botnet para realizar el ataque.**
3. De las siguientes, indicar cuál es una medida de persistencia (fase 4): **Instalar una puerta trasera (backdoor)**
4. Indicar cuál es la función del comando whois. **Informa sobre el dominio dado.**
5. De las siguientes, indicar cuál no es una contramedida de la fase de exploración (fase 1): **Definir una política de contraseñas robusta.**


### 4

#### Caso práctico 4 -- Buenas prácticas en el uso del correo electrónico

```md
**Enunciado**
El correo electrónico es uno de los servicios de mensajería en red más usados con el objetivo de realizar una distribución masiva de malware. De hecho, los datos evidencian que más del 95 % del tráfico relacionado con el envío de correos electrónicos es utilizado con fines delictivos. Se pide averiguar diferentes tipos de delitos asociados al correo electrónico y, si se puede, algún caso concreto ocurrido en el último año.

**Solución**
El éxito de estas técnicas consiste en el envío masivo de mensajes. Por ejemplo, si se envían 20 millones de mensajes y solo el 1 % de los destinatarios caen, se habrá conseguido que 200.000 personas se infecten con un malware, se hayan robado sus credenciales bancarias o caigan en una estafa. 
Algunos de los problemas asociados al servicio de correo electrónico son los siguientes:

1. Correo no deseado, spam o correo basura
El término correo no deseado se usa para describir el envío de correos electrónicos masivos a destinatarios que no los solicitan y cuyas direcciones, por lo general, se consiguen a través de Internet. Las personas que envían correos electrónicos masivos se llaman 'spammers'.
El objetivo principal del correo no deseado es hacer publicidad de forma gratuita. Los spammers dicen que es una forma ecológica de hacer publicidad.
Los spammers utilizan servidores de correo mal configurados (open-relay), recogen direcciones de correo electrónico de Internet (en foros, páginas web, grupos de discusión, wikis, etc.) o  utilizan programas de software llamados 'bots', que exploran varias páginas y almacenan en una base de datos todas las direcciones de correo electrónico que aparezcan en ellos. 
El spammer solo tiene que ejecutar una aplicación que envía el mensaje de publicidad a cada dirección de manera sucesiva.
Efectos del spam:  
- Ocupa espacio en los buzones de correo de las víctimas.
- Los mensajes personales o profesionales están mezclados con los mensajes publicitarios, pudiendo eliminar por error o no leer los mensajes importantes.
- Pérdida de tiempo en clasificar y eliminar mensajes no solicitados.
- El ancho de banda que consumen en Internet.
El spam también genera costes administrativos adicionales para los proveedores de servicios de Internet (ISP) que se reflejan en el coste de sus abonados. 
Constituye uno de los principales medios de propagación de una importante cantidad de códigos maliciosos y, por lo tanto, se recomienda:
- No confiar en correos spam con archivos adjuntos y explorar el archivo antes de ejecutarlo. 
- Cuando se reciben adjuntos, prestar especial atención a las extensiones de estos.
- Evitar publicar las direcciones de correo en sitios web de dudosa reputación, como sitios pornográficos, foros, chats, entre otros. 
- Utilizar filtros anti-spam que permitan el filtrado del correo no deseado.
- No responder jamás el correo spam. Es preferible ignorarlos y/o borrarlos, ya que si se responde, se confirma que la dirección de correo se encuentra activa.
- En lo posible, evitar el reenvío de mensajes en cadena (por lo general, son bulos o hoax), ya que suelen ser utilizados para recolectar direcciones de correo activas.
- Si de todos modos se desea enviar mensajes en cadena, es recomendable hacerlo siempre con copia oculta (CCO), para que quien lo reciba lea solo la dirección del emisor.
- Proteger la dirección de correo utilizando una cuenta alternativa durante algún proceso de registro en sitios web y similares. 
- Utilizar claves seguras y cambiar la contraseña con periodicidad si se utiliza webmail. 
- Configurar la pregunta secreta, además, de una forma que no sea adivinable para fortalecer aún más la seguridad de la cuenta.
- Como medida de seguridad extra, bloquear las imágenes de los correos y descargarlas cuando   estemos seguros de que el correo no es dañino.

**Phising, vishing y smishing**
Todos ellos utilizan la ingeniería social, que consiste en aprovecharse de la ingenuidad del usuario y convencerlo de que realice una determinada acción, como enviar su usuario y contraseña o la información de su tarjeta de crédito.
El phishing es una comunicación falsa por correo electrónico, haciéndose pasar generalmente por un banco  que solicita el usuario y contraseña del cliente por alguna razón, como un problema en los sistemas informáticos de la entidad.
En el vishing, se solicita mediante un correo electrónico que el usuario actualice su información personal o resuelva un problema relacionado con su tarjeta de crédito mediante una llamada telefónica. Cuando la víctima llama, una grabación se hace pasar por el banco y le solicita información personal, como su usuario y contraseña o el número y pin de su tarjeta de crédito. También se usan llamadas automatizadas mediante telefonía sobre IP (ToIP); lo que es fácil de hacer con un software como Asterisk, haciéndose pasar por el banco, pidiendo los datos de la tarjeta de crédito y el pin en algún momento.
El smishing es una variante del phishing, pero utilizan los SMS de la telefonía móvil.
Entre las buenas prácticas de seguridad que se recomiendan a los usuarios, para que estos eviten ser víctimas del phishing, están las siguientes:
- Las entidades bancarias y financieras no solicitan datos confidenciales a través de este medio.
- Desconfiar de los correos que dicen ser emitidos por entidades que brindan servicios y solicitan cambios de datos sensibles, ya que suelen ser métodos de ingeniería social.
- No hacer clic sobre enlaces que aparecen en el cuerpo de los correos electrónicos, ya que pueden redireccionar hacia sitios web clonados o hacia la descarga de malware.
- Asegurarse de que la dirección del sitio web al cual se accede comience con el protocolo https. La 's' final significa que la página web es segura y que toda la información viajará de manera cifrada.
- Verificar la existencia de un certificado digital en el sitio web. El certificado digital se despliega en pantalla al hacer clic sobre la imagen del candado.
- Revisar que el certificado digital no haya caducado, ya que podría haber sido manipulado  intencionadamente con fines maliciosos.
- Comunicarse telefónicamente con la compañía para descartar la posibilidad de ser víctimas de un engaño, si se tienen dudas sobre la legitimidad de un correo.
- Jamás se deben enviar contraseñas, números de tarjetas de crédito u otro tipo de información sensible a través del correo electrónico, ya que la comunicación podría ser interceptada y robada.
- Denunciar los casos de phishing (dentro de lo posible) en la entidad de confianza, ya que, además de cortar la actividad del sitio malicioso, se colabora con la seguridad general de la navegación en Internet. 

**Hoax y cadenas**
Un hoax o bulo es un mensaje de correo electrónico con contenido falso o engañoso y normalmente distribuido en cadena. Algunos informan sobre virus desastrosos, niños enfermos o desaparecidos; otros contienen fórmulas para hacerse millonario o crean cadenas de la suerte, como las que existen por correo postal.
Las cadenas y los hoax tienen muchas similitudes y los objetivos que se persiguen con ambos son los mismos: captar direcciones de correo para  utilizarlas como spam o saturar la red y los servidores de correo.

**Scam**
El scam o estafa es una variante del spam en el que se produce una estafa y, por tanto, una pérdida monetaria por parte de la víctima que sufre el scam.
Hay muchísimas variantes, pero casi todos estos mensajes se identifican porque suelen estar mal traducidos y acaban pidiendo dinero por adelantado, lo que nunca debe hacerse.
El scam también se aplica a sitios web que tienen como intención ofrecer un producto o servicio que en realidad es falso, por tanto, es una estafa, así como redes sociales o páginas de encuentros.
Un tipo común de mensajes de este tipo son los que se conocen como cartas o estafas nigerianas. Consiste en engañar al incauto con una supuesta fortuna que ha heredado y persuadirle para que pague un dinero por adelantado, como condición para acceder a la supuesta fortuna. Las sumas solicitadas, aunque elevadas, son pequeñas comparadas con la fortuna que las víctimas esperan recibir. Son una versión actual del timo de la estampita o del cuento del tío.
```

#### Ponte a prueba 4 -- Actualización del sistema operativo

```md
**Actualización del sistema operativo**
Una de las medidas preventivas más importantes es mantener siempre actualizado el sistema operativo y, en especial, las actualizaciones de seguridad.
Se pide averiguar los mecanismos de actualización de los sistemas operativos Windows y GNU/Linux Ubuntu.
> Es un ejercicio de investigación y un recordatorio de los procedimientos de actualización de los sistemas operativos. Se pueden consultar los contenidos del módulo ISO del primer curso o hacer búsquedas en Internet.
```

#### Ejercicios 4 -- test

1. Indicar cuál de las siguientes es una buena práctica relacionada con la seguridad en la navegación: **Descargar programas de seguridad solo desde el sitio oficial, para evitar la descarga de archivos que pudieran ser previamente manipulados con fines delictivos.**
2. El tiempo de acceso a las unidades de disco es una cuestión de rendimiento del servidor: **Verdadero.**
3. Si recibes un correo electrónico indicando que accedas a Google.com por algún motivo, indica qué NO deberías hacer: **Me daría confianza por la web indicada y accedería.**
4. Indicar cuál de las siguientes es una técnica de envío de correos electrónicos falsos para robar información: **Phising.**
5. Indicar cuál de los siguientes NO es un paso adecuado en el uso del correo electrónico: **Abrir el correo para conocer su contenido.**
6. De las siguientes técnicas, indicar cuál de ellas es utilizada para el robo de información para cometer delitos informáticos: **Ingeniería social.**


### 5

#### Caso práctico 5 -- Tripwire: detección de modificaciones de archivos y directorios

```md
**Introducción**
Tripwire se utiliza para detectar modificaciones en archivos del sistema; es, por tanto, un sistema de detección de intrusos (IDS) que ayuda a vigilar la integridad de los archivos en el host. Tripwire ayudará a identificar los archivos o las modificaciones realizadas al sistema en el caso de que el intruso le haya comprometido.
Tripwire construye una BBDD con los MD5 (sumas de control) de los archivos. Hecho esto, hay que realizar análisis regulares del sistema para comprobar si se han hecho modificaciones en los archivos de este.
En resumen, las principales características de Tripwire son las siguientes:
- Válida para Windows y GNU/Linux.
- Existen dos versiones: GPL (disponible para GNU/Linux) y comercial.
- En esta dirección hay disponible una comparativa entre los diferentes productos Tripwire: http://www.tripwire.com/it-compliance-products/te/ost/compare.cfm
- Su función es monitorizar archivos según la configuración y la política que se desee.
- Es una herramienta altamente configurable.
La herramienta para Windows está disponible en https://www.tripwire.com/products/tripwire-ip360.
En Ubuntu está disponible en el pool.

**Enunciado**
1. Se pide instalar Tripwire en Ubuntu y realizar los cambios básicos de configuración, crear la base de datos y realizar un primer chequeo.
2. Mostrar algún informe generado.
3. Actualizar la base de datos y el archivo de políticas.
4. Modificar la política para que no se chequee el directorio /usr/sbin de nuestro equipo. 

**Solución**
Se deberán seguir los siguientes pasos: 
1. Instalación.
2. Cambios en los archivos de configuración.
3. Inicialización de la BBDD de Tripwire.
4. Uso de Tripwire.
5. Informes de Tripwire
6. Actualización de la BBDD.
7. Actualización del archivo de políticas.
8. Firma del archivo de configuración.
9. Archivos de Tripwire.

> https://drive.google.com/file/d/1rrwDL9w2LCBKvigZMbrSKGv2ax1pUnpx/view
```

#### Ponte a prueba 5 -- SIEM

```md
**SIEM (Security Information and Event Management)**
En el apartado hemos introducido los conceptos de IDS e IPS como sistemas de detección y prevención de intrusiones, respectivamente.
Proponemos ahora al alumnado que indague sobre el concepto de SIEM (Security Information and Event Management). 
Realiza un pequeño informe sobre la funcionalidad del SIEM y sus características principales.
> Investigar en Internet para obtener la información necesaria y realizar el informe.
```

#### Estudio de caso -- [Utilización sencilla de Snort](https://drive.google.com/file/d/1uYoFDIOEnsO_atCeWYNh2fsBh_sv9FbG/view)

#### Estudio de caso -- [Monitorización de eventos con `audit`](https://drive.google.com/file/d/1dS4WDavE9Bet71wFI6MVSiK0KC7Oh7d1/view) 

https://github.com/linux-audit/audit-userspace

#### Ejercicios 5 -- test

1. De los siguientes, indicar cuál busca patrones de red específicos generados por un malware conocido. **Basado en firma.**
2. De los siguientes, indicar cuál no es un tipo de IDS. **IDS basado en diccionario.**
3. De las siguientes afirmaciones, indicar cuál describe un sistema de detección de intrusiones. **Inspecciona paquetes entrantes y salientes en la red e identifica patrones sospechosos.**
4. De las siguientes opciones, indicar cuál de ellas es un objetivo de los IDS. **Identificar comportamientos anómalos en la red.**
5. Indicar dónde se sitúa normalmente un IPS en la red. **Combinado con el cortafuegos.**


## QUIZ

```md
1. Indica cuál es la opción falsa de las siguientes afirmaciones relacionadas con posibles ataques a realizados por personas:

a.
El shoulder surfing consiste en "espiar" físicamente a los usuarios.

**b.**
La ingeniería social es un acto tipificado como delito por la ley.

c.
El basureo se basa en obtener información dejada encima de la mesa.

d.
El masquerading se basa en suplantar la identidad de un usuario autorizado.


2. De las siguientes afirmaciones indicar cuál de ellas es correcta.

**a.**
En el sistema debe existir y utilizarse un perfil de usuario con privilegios restringidos.

b.
En redes sociales es indiferente publicar información sensible y confidencial.

c.
Respecto a posibles ataques a realizados por personas, la ingeniería social es un acto tipificado como delito por la ley.

d.
Riesgo para un sistema informático es lo mismo que amenaza.


3. De las siguientes afirmaciones indicar cuál de ellas es correcta.

a.
Mantener el sistema operativo actualizado no es una prioridad.

b.
La herramienta Tripwire es utilizada para realizar violaciones de la seguridad del sistema.

**c.**
Un ataque de denegación de servicio (DoS) exitoso no involucra un acceso al sistema.

d.
Aunque no haya vulnerabilidades sigue habiendo amenazas.


4. En relación con el ataque activo indicar cuál de las siguientes afirmaciones no es correcta.

a.
La atención se centra en la detección.

b.
Hay modificación de la información.

c.
Son una amenaza para la integridad y la disponibilidad.

**d.**
No hay daño en el sistema.


5. En relación con la protección del entorno de la información indicar cuál no es una buena práctica general.

**a.**
Realizar la instalación de complementos extras como barras de tareas.

b.
Configurar la visualización de archivos ocultos.

c.
Mantener la privacidad del perfil.

d.
Deshabilitar las carpetas compartidas.


6. De las siguientes definiciones indicar cuál de ellas se ajusta a un IDS (Sistema de detección de intrusiones).

**a.**
Recoge y analiza información procedente de distintas áreas de un equipo o red con el objetivo de identificar posibles fallos de seguridad.

b.
Identifica anomalías en un estado de protocolo comparando eventos actuales con actividades aceptadas predefinidas.

c.
Emite alarmas y pueden descartar paquetes y desconectar conexiones.

d.
Analiza las conexiones y los protocolos en tiempo real para determinar si se va a producir o si se está produciendo algún incidente.


7. De las siguientes herramientas indicar cuál de ellas es un IPS (Sistema de prevención de intrusiones).

a.
Snort.

b.
Tripwire.

**c.**
OSSEC.

d.
Ninguna de las anteriores.


8. En la fase de reconocimiento de un ataque indicar que herramienta se suele utilizar.

a.
Herramientas de eliminación de la caché y las cookies.

**b.**
Herramientas capturadoras de paquetes de red.

c.
Herramientas de monitorización de logs.

d.
Herramientas de detección de ping.


9. De las siguientes afirmaciones indicar cuál se ajusta al concepto de ‘degradación fraudulenta del servicio’.

a.
Las secuencias de autenticación son capturadas y repetidas.

**b.**
Los mensajes dirigidos a una determinada entidad son suprimidos.

c.
Los mensajes son retardados o reordenados.

d.
Los recursos del sistema no se alteran.


10. De las siguientes afirmaciones indicar cuál de ellas es la correcta.

a.
Vulnerabilidad es lo mismo que amenaza.

b.
Hay riesgo en el sistema, aunque no exista amenaza.

c.
En un ataque activo el intruso monitoriza.

**d.**
Un ataque es la realización de una amenaza.








```
