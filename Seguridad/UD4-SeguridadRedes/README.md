# Seguridad UD4: Seguridad en redes

- [Seguridad UD4: Seguridad en redes](#seguridad-ud4-seguridad-en-redes)
  - [TEORÍA](#teoría)
  - [PRÁCTICA (McGrawHill)](#práctica-mcgrawhill)
    - [1](#1)
      - [Caso práctico 1 -- Utilización de Wireshark](#caso-práctico-1----utilización-de-wireshark)
      - [Ponte a prueba 1 -- Interpretar órdenes TCPdump](#ponte-a-prueba-1----interpretar-órdenes-tcpdump)
      - [Estudio de caso -- Utilización de TCPdump](#estudio-de-caso----utilización-de-tcpdump)
      - [Ejercicios 1 -- test](#ejercicios-1----test)
    - [2](#2)
      - [Caso práctico 2 -- NTopng](#caso-práctico-2----ntopng)
      - [Ponte a prueba 2 -- Regla de los cinco nueves (disponibilidad)](#ponte-a-prueba-2----regla-de-los-cinco-nueves-disponibilidad)
      - [Ejercicios 2 -- test](#ejercicios-2----test)
    - [3](#3)
      - [Caso práctico 3 -- Comparativa de los tipos de protocolos de seguridad de Wi-Fi](#caso-práctico-3----comparativa-de-los-tipos-de-protocolos-de-seguridad-de-wi-fi)
      - [Ponte a prueba 3 -- Estándares Wi-Fi actuales](#ponte-a-prueba-3----estándares-wi-fi-actuales)
      - [Estudio de caso -- Hacking con Wifislax](#estudio-de-caso----hacking-con-wifislax)
      - [Ejercicios 3 -- test](#ejercicios-3----test)
    - [4](#4)
      - [Caso práctico 4 -- ARP spoofing (envenenamiento ARP)](#caso-práctico-4----arp-spoofing-envenenamiento-arp)
      - [Ponte a prueba 4 -- Comando VRFY de SMTP](#ponte-a-prueba-4----comando-vrfy-de-smtp)
      - [Estudio de caso -- DNS Spoofing con Ettercap](#estudio-de-caso----dns-spoofing-con-ettercap)
      - [Ejercicios 4 -- test](#ejercicios-4----test)
    - [5](#5)
      - [Caso práctico 5 -- Software para fortificar servidores](#caso-práctico-5----software-para-fortificar-servidores)
      - [Ponte a prueba 5 -- Control de acceso al sistema operativo: DAC, MAC, MIC y RBAC](#ponte-a-prueba-5----control-de-acceso-al-sistema-operativo-dac-mac-mic-y-rbac)
      - [Ejercicios 5 -- test](#ejercicios-5----test)
  - [QUIZ](#quiz)


## TEORÍA

> apuntes.md

## PRÁCTICA (McGrawHill)

<!-- ### foo -->
<!-- ### bar -->

### 1

#### Caso práctico 1 -- Utilización de Wireshark

```md
**Enunciado**

Se pide:

1. Realizar la instalación de Wireshark (en Ubuntu o Windows) y describir su interfaz de trabajo.
2. Capturar paquetes aplicando el filtro HTTP para páginas seguras.
3. Instalar el servidor telnetd. Hacerlo por parejas: uno ejecuta el cliente telnet y el otro ejecuta el servidor telnetd.
    a. Ejecutar telnet en otra máquina de la red. Introducir usuario y contraseña y capturar las tramas de la conexión y desconexión. Hacer una captura gráfica que las muestre e identificar los flags.
    b. Localizar el login/password del usuario conectado e incluir la captura que los muestre.
4. Analizar la salida generada por la orden nast y comentar lo observado. Incluir una captura de la salida de la orden.
5. Descargar de Internet un archivo en cualquier formato que no sea muy grande. Ir a File > Exports > Objects > HTTP y comprobar en la ventana mostrada que aparece una  línea con la referencia del archivo descargado. Mostrar la información dada en STATISTICS y en IO GRAPHS y hacer capturas de los resultados.
Este procedimiento es muy útil para controlar todas las peticiones HTTP detectadas y los archivos que se han descargado, pudiendo así detectar un posible malware descargado en nuestro equipo sin nosotros saberlo.
6. Utilizar la herramienta Analyze/Expert Info y explicar con algún ejemplo para qué sirve.
7. Una herramienta similar a Wireshark pero para monitorizar redes inalámbricas es Kismet. Instala la herramienta y explica con alguna captura su funcionamiento. 

---

**Solución**

Paso 1. Instalación
Desde Ubuntu Software buscar la aplicación e instalarla o, si se prefiere, desde la línea de comando ejecutar en un terminal:
$ sudo apt-get install wireshark 
La herramienta está disponible en Mostrar Aplicaciones > Internet, pero ejecutamos la aplicación como root desde el terminal:
$ sudo wireshark 
Si muestra un mensaje avisando del problema que puede suponer ejecutar la aplicación como root, marcar para que no vuelva a avisar.

Paso 2. Descripción de la interfaz de trabajo
Al arrancar Wireshark como sudo muestra la siguiente pantalla:
Seleccionamos la interfaz, de la lista de interfaces, que vamos a utilizar; en nuestro caso, enp1s0.
Si pulsamos Start capturing packets nos muestra la interfaz de trabajo de la herramienta con todas sus zonas:
- zona 1: área de definición de filtros que permite definir patrones de búsqueda para visualizar aquellos paquetes o protocolos que nos interesen. Contiene las opciones de menú, los iconos de las opciones más comunes y la barra de filtros.
- zona 2: lista de visualización de todos los paquetes que se están capturando en tiempo real. Saber interpretar correctamente los datos proporcionados en esta zona (tipo de protocolo, números de secuencia, flags, marcas de tiempo, puertos, etc.) permite, en ciertas ocasiones, deducir el problema sin tener que realizar una auditoría.
- zona 3: permite desglosar por capas cada una de las cabeceras de los paquetes seleccionados en la zona 2 y facilita movernos por cada uno de los campos de estas. Es el panel de detalles de paquetes.
- zona 4: representa, en formato hexadecimal, el paquete en bruto; es decir, tal y como fue capturado por nuestra tarjeta de red.
- zona 5: es la barra de estado que muestra información acerca del estado actual de Wireshark y la captura

Preferencias
En Edit > Preferences tenemos disponible la configuración de la herramienta. Revisar las diferentes entradas disponibles.
En la opción Capture comprobamos que la tj Ethernet seleccionada enp1s0 está en modo promiscuo y con las opciones activadas por defecto se podría ya comenzar la captura pulsando en Start.

Filtros
Podemos aplicar filtros sobre los paquetes que capturar, de esa forma se reduce el volumen de tráfico capturado.
Pulsa en Capture > Capture Filters y muestra:
Si tenemos definidos varios filtros, podemos seleccionar uno de ellos y pulsando en Apply estamos aplicando dicho filtro a partir de ese momento.
Podemos también indicar que se filtren paquetes hacia/desde un dominio; para ello, en el campo Display Filter hemos de escribir ip.addr == 130.206.13.2, que equivaldría al filtro de captura host ftp.rediris.es.

Búsquedas
Podemos realizar búsquedas de información sobre los paquetes capturados; por ejemplo, se podría hacer una búsqueda de la palabra password en los paquetes para ver si en alguna conexión se transfiere esa información.
Para ello, debemos ir a Edit > Find Paquet, marcar la opción String y teclear la cadena de caracteres que queremos buscar. La posible o las posibles coincidencias quedan remarcadas en azul. Si se está aplicando un filtro, la búsqueda lo tendrá en cuenta.

Paso 3. Creación de filtros
1. Captura de paquetes aplicando un filtro para páginas HTTP seguras.
Visitamos la página del Ministerio de Educación (212.128.114.28).
Aplicamos el filtro de visualización para el puerto 443. La captura siguiente muestra una parte de los paquetes encontrados.
Ahora nos situamos sobre uno de los paquetes y en el menú flotante seleccionamos Analyze > Follow > TCP stream,  que muestra información completa relativa a ese paquete seleccionado.

2. Tenemos ya instalado el servidor telnetd. Ejecutar el servicio, hacer telnet desde otra máquina y capturar las tramas de conexión y desconexión.
Localizar el login/password del usuario conectado. 

3. Detección de interfaces de red en modo promiscuo.
Otro punto importante para los administradores es la búsqueda de tarjetas que puedan estar funcionando en modo promiscuo y que suelen ser habituales en este tipo de escenarios. Pueden resultar útiles herramientas como Neped, Sentinel, AntiSniff, Nast o SniffDet, ya que permiten detectar tarjetas en este estado. Instala la herramienta nast y ejecuta la orden:
$ nast -P all
```

#### Ponte a prueba 1 -- Interpretar órdenes TCPdump

- [ ] Dadas las siguientes órdenes TCPdump, explica el objetivo de cada una de ellas.
    1. tcpdump -i any -c 5
    2. tcpdump -i ens224 –v tcp and src 192.168.1.15
    3. tcpdump -nni enp1s0 –c 5 icmp
    4. tcpdump -i enp1s0 nt 192.168.1.0/24
    5. tcpdump -i any -n -nn host www.marca.es or www.rtve.es
    6. tcpdump -i any -nn src port 80 
    7. tcpdump -vvv -n -s 65535 -A -p -w /tcp/tcpdump host 10.168.1.3 and port 80

#### Estudio de caso -- [Utilización de TCPdump](https://drive.google.com/file/d/1h5tcKB9xjglr_YUTp2wTKgfAjoZ6Sz_2/view)

#### Ejercicios 1 -- test

1. Cuando un adaptador de red opera en modo «promiscuo»: **Sirve para capturar todo el tráfico que atraviesa un router.**
2. Monitorizar la red: **Es un proceso continuo de recolección de datos.**
3. De las siguientes, indica cuál de ellas es una aplicación de monitorización de redes: **Nagios.**
4. De las siguientes opciones, indica cuál es la correcta para que TDPdump no ponga la tarjeta de red en modo promiscuo: **Opción –p.**
5. Indica si existe alguna relación entre Wireshark y TCPdump: **Sí existe y se pueden intercambiar las salidas generadas.**


### 2

#### Caso práctico 2 -- NTopng

```md
**Introducción**
Ntopng es una herramienta de monitorización de red en la que prima la presentación de informes de los datos recogidos sobre la recolección de paquetes de red. Permite conocer, de forma sencilla y rápida, la utilización del ancho de banda de cada usuario en casa, en una LAN del trabajo, en redes públicas, etc.
Es muy útil para detectar malas configuraciones de equipos, puertos abiertos (que no deberían estarlo) y ataques de forma gráfica y muy completa. Trabaja con interfaz web.
Desde el punto de vista práctico, hay que tener en cuenta que:
- Debemos disponer de permisos de administrador en la máquina.
- Para capturar los paquetes, la interfaz de red de la máquina que ejecute Ntopng debe estar en modo promiscuo. Si deshabilitamos el modo promiscuo, Ntopng solo analizará el tráfico de red de la máquina en la que se ejecuta.
- Ntopng usa por defecto el puerto 3000 TCP para el servidor web de la interfaz. Hay que recordar esto con el cortafuegos, si se quiere acceder a la interfaz desde otra máquina.
- Requiere estar ejecutándose el servicio Redis.
- Está disponible en los repositorios de Ubuntu.
- La versión para Windows tiene una restricción en el número de paquetes de red que permite analizar.
Redis es un motor de base de datos Open Source con licencia BSD. Su funcionamiento se basa en el uso de tablas de hashes (clave – valor).
El funcionamiento general de Redis se basa en almacenar la información en la memoria RAM, pero también incorpora dos formas de hacer que esta información sea persistente, aunque ambos procedimientos  suponen un gran coste en el rendimiento del servidor.
El uso más común de Redis, entre otros, es cachear archivos, ya que al almacenar la información en RAM esta es rápidamente accesible.

**Enunciado**
Instala la herramienta Ntopng y analiza las funcionalidades que ofrece.

---

**Solución**

Paso 1. Instalación y configuración
Se debe instalar en el proxy, aunque lo vamos a hacer en un equipo sin proxy, ya que no se ha estudiado todavía la utilización de proxys. La instalación se puede hacer desde el software de Ubuntu o en una terminal:
$ sudo apt install ntopng
La instalación de Ntopng arrastra la instalación de Redis. Hay que configurar la interfaz de escucha en la red y el puerto en el que Ntopng va a trabajar que, por defecto, es el 3000.
Edita el fichero de configuración:
$ sudo gedit /etc/ntopng.conf
Comprueba las líneas que indican la interfaz utilizada para capturar paquetes y el puerto:
-i=enp1s0
-w=3000

...
```

#### Ponte a prueba 2 -- Regla de los cinco nueves (disponibilidad)

```md
**Disponibilidad del servicio: la regla de los cinco nueves**
Cuando una organización necesita disponer de la máxima disponibilidad de sus sistemas y datos deberá adoptar medidas especiales para ello, con el objetivo de que los tiempos de inactividad de los procesos críticos sean mínimos. 
En general, las organizaciones miden la disponibilidad conforme al porcentaje de tiempo de actividad. Y ahí es donde entra la regla de los cinco nueves.
Se trata de un ejercicio de investigación en el que se pide estudiar y resumir en qué consiste esta regla utilizada por las organizaciones para obtener una alta disponibilidad de sus activos.
```

#### Ejercicios 2 -- test

1. Los servicios de seguridad de las redes sirven para: **Proteger las comunicaciones de los usuarios de las redes frente a los atacantes que pretendan hacer un uso indebido de estas.**
2. Ante el riesgo de recibir determinados ataques dentro de una red telemática: **No se pueden establecer protecciones que proporcionen una seguridad total, pero sí establecer medidas que protejan de forma satisfactoria frente a los riesgos existentes.**
3. Los mecanismos criptográficos: **Sirven para construir protocolos de seguridad que sirvan para proporcionar servicios de seguridad.**
4. Señala la opción correcta respecto a la seguridad en redes: **Es un conjunto de técnicas que tratan de minimizar la vulnerabilidad de los sistemas.**
5. Señala la opción correcta respecto a los mecanismos criptográficos: **Todas las opciones son correctas.**


### 3

#### Caso práctico 3 -- Comparativa de los tipos de protocolos de seguridad de Wi-Fi

```md
**Enunciado**
Se pide crear una tabla comparativa entre los mecanismos de seguridad inalámbrica más usuales (WPA y WPA2) y averiguar qué tipo de seguridad se está utilizando en el router doméstico.
Antes de hacer el ejercicio se recomienda leer el material complementario relativo a estos dos mecanismos.

---

**Solución**

Paso 1. Comparativa WPA - WPA2
En este momento, WPA2 sigue siendo el protocolo estándar para la seguridad de Wi-Fi, en parte gracias a la utilización del método de cifrado AES.
Por sus características, WPA2 es el más seguro porque el consumo de recursos para ser hackeado es mayor, pero desde el año 2018 se están produciendo ataques tipo KRACK (Key Reinstallation Attack), y aunque no son muchos, habrá que tomarlos en consideración.
Este tipo de ataque se basa en un error de diseño en el handshake a 4 vías del protocolo WPA2. El handshake se ejecuta cuando un cliente quiere conectarse a una red Wi-Fi protegida y es utilizado para confirmar que tanto el cliente como el punto de acceso tienen las credenciales correctas, además de negociar una clave de encriptación nueva que será utilizada para encriptar todo el tráfico que luego viajará por la red; pero para ello el intruso debe estar dentro del rango de alcance de la red para poder atacarla.
Se puede obtener más información sobre este tipo de ataque en los siguientes enlaces:
- https://cso.computerworld.es/social-security/krack-el-nuevo-metodo-para-hackear-redes-wifi-wpa2
- https://unaaldia.hispasec.com/2017/10/kracks-grave-vulnerabilidad-en-el.html

Paso 2. Conocer el protocolo de seguridad del router personal
En primer lugar, hay que aclarar que las diferentes opciones para elegir en la seguridad Wi-Fi del router dependerán de la marca y del tipo de router, así como del proveedor de servicios de Internet de que se disponga.
Para conocerlo hay que acceder a la interfaz de administración del router mediante el navegador. Normalmente es la dirección 192.168.1.1. Hay que validarse con los datos proporcionados por el router y la contraseña se debe cambiar siempre por una más larga y compleja. Es una buena práctica cambiarla periódicamente.
La mejor opción de seguridad de Wi-Fi para el router es WPA2-AES, que es la dada por defecto en este router. También está disponible la opción WPA2-TKIP, pero ya no es tan seguro. Como se puede observar, WEP ni aparece.
La siguiente lista muestra una clasificación de la seguridad de mayor a menor.
- WPA2 + AES.
- WPA2 + TKIP.
- WPA + AES.
- WPA + TKIP.
- WEP.
- Red abierta.
Si hubiera que comprar un router, lo ideal ahora mismo sería conseguir uno que estuviese preparado para WEP3. De esa forma, en cuanto estuviese activo se podría utilizar con esta certificación.
```

#### Ponte a prueba 3 -- Estándares Wi-Fi actuales

```md
**Estándares Wi-Fi actuales**
Como se ha explicado en el apartado, los estándares Wi-Fi han ido evolucionando a lo largo de los años. Se han introducido mejoras relativas al alcance, al rendimiento y al funcionamiento cuando se trabaja con varios dispositivos.
Pero el problema que plantean esas mejoras de los estándares Wi-Fi está relacionado con el dispositivo router: si no es capaz de soportarlas o, al contrario, si el router las soporta pero los dispositivos no son compatibles con dicho estándar.
Se pide que el alumnado se documente sobre los últimos estándares Wi-Fi, pero solo sobre las características más importantes de cada uno de ellos y según el nombre por el que se les conoce vulgarmente.
```

#### Estudio de caso -- [Hacking con Wifislax](https://drive.google.com/file/d/1BfVcJSbYYiIw8XZ4T54HxllW4AAcJ8Oe/view)

- [ ] TODO: Pi5

```md
Herramientas Importantes:
- aircrack-ng
- airoscript
- goyscript-WEP
- minidWep-GTK
- reaver
- goyscript-WPA + airodump-ng
- strinGenerator
```

#### Ejercicios 3 -- test

1. ¿Cuál de los siguientes es un modo de funcionamiento de WPA? **Con clave inicial compartida.**
2. ¿Cuál de las siguientes NO es una ventaja de la utilización de portales cautivos? **Que utilizan el navegador.**
3. Señala la afirmación correcta respecto a WPA2: **No siempre utiliza autenticación con clave compartida (PSK).**
4. Señala la afirmación correcta respecto a a un servidor RADIUS: **No es necesario que esté en la red local del dispositivo que lo utiliza.**
5. De las siguientes opciones, indica cuál no es una buena solución de seguridad para redes inalámbricas: **Filtrado de direcciones MAC.**


### 4

#### Caso práctico 4 -- ARP spoofing (envenenamiento ARP)

```md
**Introducción**
El envenenamiento ARP consiste en intentar modificar la caché ARP, de forma que el sistema operativo recuerde una asociación falsa entre dirección IP y dirección MAC.

**Enunciado**
Vamos a suponer que disponemos de la siguiente red:
- ORDENADOR A: puerta de enlace (gateway). MAC 10:0d:7f:a2:75:93 y su IP 192.168.0.1.
- ORDENADOR B: víctima. MAC 7c:6d:62:72:44:38 y su IP 192.168.0.2.
- ORDENADOR C: atacante. MAC 00:13:a9:84:b6:e9 y su IP 192.168.0.3.
Se pide realizar la simulación del ataque ARP spoofing. El paso 1 de la solución explica la estrategia que se debe seguir. Se pueden utilizar máquinas virtuales.

---

**Solución**

**Paso 1. Ataque (estando en la máquina del atacante)**
Desde el sistema del atacante se envían paquetes de respuesta ARP falsos a ORDENADOR A y ORDENADOR B. 
En estos paquetes se le indica al ORDENADOR A que la dirección MAC del ORDENADOR B es la del atacante, y esa información queda almacenada en su caché ARP. 
Es necesario realizar la misma operación con la otra víctima.
- Enviar a ORDENADOR A un paquete de tipo arp-reply informando que 192.168.0.2 tiene dirección MAC 00:13:a9:84:b6:e9.
- Enviar a ORDENADOR B un paquete de tipo arp-reply informando que 192.168.0.1 tiene dirección MAC 00:13:a9:84:b6:e9.
A su vez, el atacante se encarga de reenviar la información a sus destinos adecuados. A partir de ahora, los paquetes de información que se envíen entre ambas llegan a la víctima.

Existen infinidad de programas capaces de realizar todos estos pasos con solo indicarles los datos adecuados, quizás el más famoso sea *Caín*, para Windows.

**Paso 2.1. Instalar el conjunto de herramientas dsniff, entre ellas está la orden arpspoof**
$ apt-get install dsniff
<u>arpspoof</u>: se encarga de enviar los paquetes arp-reply falsos a la máquina que le indicamos como target para suplantar la dirección MAC de la segunda máquina que le indicamos. Esta es la herramienta de envenenamiento ARP que se suele utilizar en las redes conmutadas.
Y nos aseguramos de que nuestra máquina sea capaz de reenviar paquetes y así evitamos que se corte el tráfico del usuario. Para ello debemos ejecutar:
$ echo 1 > `/proc/sys/net/ipv4/ip_forward`

**Paso 2.2.**
Ejecutar ping a cada máquina víctima para confirmar que las tres máquinas están en la misma red
$ ping

**Paso 2.3.**
Obtener las IP y MAC de los equipos del usuario y la puerta de enlace. Ejecutar
$ arp -a?(192.168.0.2) en 7c:6d:62:72:44:38 [ether] en eth0?(192.168.0.1) en 10:0d:7f:a2:75:93 [ether] en eth0

**Paso 2.4.**
Mediante la herramienta arpspoof podemos realizar el ataque mediante los siguientes parámetros:
- -i: interfaz en la que haremos el spoofing.
- -t: el target a quien le vamos a decir nuestra MAC.
- La IP del host que queremos suplantar.

A continuación, deberemos envenenar la tabla ARP tanto del gateway como del usuario para hacer pasar el tráfico por el sistema del atacante en ambas direcciones.
Ejecutar desde la máquina atacante la orden arpspoof de la puerta de enlace a la víctima: 
$ arpspoof -i eth0 -t 192.168.0.1 192.168.0.2
0:13:a9:84:b6:e9 10:d:7f:a2:75:93 0806 42: arp reply 192.168.0.2 is-at 0:13:a9:84:b6:e9
0:13:a9:84:b6:e9 10:d:7f:a2:75:93 0806 42: arp reply 192.168.0.2 is-at 0:13:a9:84:b6:e9
0:13:a9:84:b6:e9 10:d:7f:a2:75:93 0806 42: arp reply 192.168.0.2 is-at 0:13:a9:84:b6:e9

Seguidamente, hacemos lo mismo (en paralelo) de la víctima a la puerta de enlace:
$ arpspoof -i eth0 -t 192.168.0.2 192.168.0.1
0:13:a9:84:b6:e9 7c:6d:62:72:44:38 0806 42: arp reply 192.168.0.1 is-at 0:13:a9:84:b6:e9
0:13:a9:84:b6:e9 7c:6d:62:72:44:38 0806 42: arp reply 192.168.0.1 is-at 0:13:a9:84:b6:e9
0:13:a9:84:b6:e9 7c:6d:62:72:44:38 0806 42: arp reply 192.168.0.1 is-at 0:13:a9:84:b6:e9

Con esto ya podemos ejecutar TCPdump en el equipo atacante para capturar todo el tráfico del equipo víctima:
$ tcpdump -i eth0 host 192.168.0.2 -s 0 -w archivo.ataque
$ tcpdump -i eth0 'host 192.168.0.2' -s 0 -r archivo.ataque
reading from file archivo.ataque, link-type EN10MB (Ethernet)
17:56:27.045888 ARP, Reply 192.168.0.2 is-at 00:13:a9:84:b6:e9, length 28
17:56:27.335195 ARP, Reply 192.168.0.1 is-at 00:13:a9:84:b6:e9, length 28
17:56:29.046128 ARP, Reply 192.168.0.2 is-at 00:13:a9:84:b6:e9, length 28
17:56:29.335437 ARP, Reply 192.168.0.1 is-at 00:13:a9:84:b6:e9, length 28
17:56:29.764983 IP 192.168.0.2.60271 > 62.42.230.24.53: 60931+ A? notify5.dropbox.com. (37)
17:56:31.046357 ARP, Reply 192.168.0.2 is-at 00:13:a9:84:b6:e9, length 28

Observa cómo las respuestas ARP van todas a la MAC del atacante.
Existen diferentes herramientas para detectar este tipo de ataques, siendo el más conocido el ARPwatch o Caín en entornos gráficos.
```

#### Ponte a prueba 4 -- Comando VRFY de SMTP

```md
**Comando VRFY de SMTP**
Una de las órdenes SMTP que se pueden utilizar es VRFY, que consulta a un determinado servidor de correo para saber si una dirección de correo existe o no. Esta comprobación la suelen hacer los atacantes antes de lanzar un ataque a un servidor. Se puede deshabilitar y así el servidor no contestará a la petición de comprobación.
Se pide deshabilitar (en teoría) el uso del comando VRFY.
Averigua si una determinada cuenta de correo electrónico existe en un servidor de correo. Se puede utilizar cualquier cuenta propiedad de los estudiantes.

Se trata de un ejercicio en el que interviene el servicio telnet (cliente) y habrá que conocer el nombre del servidor de correo.
La primera parte del ejercicio no requiere la instalación de un servidor de correo.
```

#### Estudio de caso -- [DNS Spoofing con Ettercap](https://drive.google.com/file/d/1bW6oulxsbztLd31pi2rEQtpkphLtpfU6/view)

...


```bash
# ...
sudo sed -i -E 's/^(ec_uid\s*=\s*)65534/\10/' /etc/ettercap/etter.conf
sudo sed -i -E 's/^(ec_gid\s*=\s*)65534/\10/' /etc/ettercap/etter.conf

# Redirigir dominio aemet a IP de elmundo
{
  echo "aemet.es        A       193.110.128.199"
  echo "*.aemet.es      A       193.110.128.199"
} | sudo tee -a /etc/ettercap/etter.dns

# Operación via GUI...
#  https://www.kali.org/tools/ettercap/
```

#### Ejercicios 4 -- test

1. Indica cuál de las siguientes afirmaciones es correcta respecto al ARP Spoofing: **Es una técnica que permite modificar el tráfico.**
2. Indica cuál de las siguientes afirmaciones es incorrecta respecto al servicio DNS. **Requiere la autenticación del usuario.**
3. Indica cuál de las siguientes afirmaciones es correcta en relación con el servicio Telnet. **Requiere la autenticación del usuario que debe existir en el equipo remoto.**
4. Indica cuál de las siguientes afirmaciones es correcta en relación con el servicio de correo electrónico. **El servidor de correo ejecuta el protocolo SMTP.**
5. Indica cuál de las siguientes afirmaciones es falsa respecto al protocolo DHCP. **Es un protocolo completamente seguro.**

### 5

#### Caso práctico 5 -- Software para fortificar servidores

```md
**Enunciado**
Se pide al alumnado que haga una recopilación de herramientas software actuales utilizadas en el entorno GNU/Linux para la fortificación de servidores

---

**Solución**

**A. Lynis, auditoría de seguridad**
Lynis es una herramienta de auditoría disponible en las distribuciones Ubuntu, Fedora, Debian y OpenSUSE, tanto en versiones desktop como server. Su función es analizar todo el software instalado en nuestro equipo y buscar posibles problemas que debamos corregir. 
Es de código abierto, con licencia GPLv3, y está disponible en la web de cisofy.com. En el caso de Ubuntu, está disponible desde el terminal.

Una ejecución ejemplo sería para auditar el sistema:
$ sudo lynis audit system
Si lo que queremos es un análisis rápido, podemos ejecutar la orden:
$ sudo lynis -Q
Si queremos algo básico y rápido, podemos ejecutar el comando lynis –Q, que hace un análisis rápido para detectar posibles problemas de seguridad que encuentre en el software instalado.

A medida que se va ejecutando va mostrando información sobre el sistema:
- Resumen del sistema y actualizaciones pendientes.
- Gestor de arranque.
- Servicios que se inician con el sistema.
- Memoria y procesos.
- Usuarios, grupos y sistemas de autenticación disponibles.
- Shells del sistema.
- Sistemas de archivos y almacenamiento.
- Servicio de nombres.
- Gestores de paquetes.
- Impresoras.
- Servidores de correo electrónico.
- Estado del firewall.
- Servicios instalados (web, ssh, snmp, etc.).
- Servicios de loging, como syslog.
- Tareas programadas (cron y at).
- Presencia de SELinux o AppArmor.
- Sistemas de integridad de archivos instalados.
- Escaneadores de malware y de rootkits instalados.
Al terminar muestra un informe de todos los pasos realizados con el fin de que tomemos las medidas necesarias para endurecer la seguridad del servidor. También puede detectar vulnerabilidades y configuraciones por defecto, que muestra utilizando diferentes colores.

**B. Fwsnort**
Fwsnort no es un cortafuegos, pero permite convertir las reglas definidas para el IDS Snort en reglas de iptables para integrarlas en un cortafuegos IPtables y, de esta manera, dotarlo de las capacidades de un detector de intrusos.

**C. Grsecurity**
Es un conjunto de parches para el kernel GNU/Linux cuyo objetivo es la seguridad de servidores expuestos en Internet. Entre las características que ofrece podemos encontrar protección del espacio de direcciones o auditoría mejorada y control de procesos.
Ha sido desarrollado por la empresa Open Source Security Inc. y tiene licencia GPL, pero desde 2017 solo se permite su descarga a usuarios suscriptores.
Algunas de las técnicas que usa son:
- PaX y ASLR, para prevenir ataques de desbordamiento de búffer.
- Protección de desbordamiento de pila en sistemas x64.
- Control de acceso RBAC, para crear un sistema con los menores privilegios posibles.
- Restricciones adicionales a chroot, para evitar ataques de escalada de privilegios.
- Auditoría mejorada para usuarios, montaje de dispositivos y cambios de fecha y hora, entre otros.

**D. Port knocking y SPA**
El port knocking es una técnica (bastante antigua) que consiste en abrir puertos externamente en un cortafuegos mediante una secuencia preestablecida de intentos de conexión a una secuencia de puertos que están cerrados. 
Cuando el cortafuegos recibe una secuencia de conexión correcta, crea una regla de cortafuegos temporal para permitir conectarse al equipo que ejecutó la secuencia correcta. 
Se suele utilizar en la securización de los accesos al servidor SSH; por ejemplo, para abrir el puerto 22 de SSH habrá que realizar primero la conexión errónea al 7000, luego al 8000 y, finalmente, al 9000.
```

#### Ponte a prueba 5 -- Control de acceso al sistema operativo: DAC, MAC, MIC y RBAC

```md
**Control de acceso al sistema operativo: DAC, MAC, MIC y RBAC**
Se plantea al alumnado realizar un pequeño informe sobre medidas concretas de seguridad para servidores enfocadas a conseguir la defensa en profundidad dentro del grupo de control de acceso al sistema operativo.
> Es preciso investigar en Internet para obtener la información necesaria y realizar el informe. Se sugiere localizar términos como DAC, MAC, MIC o RBAC.
```

#### Ejercicios 5 -- test

1. ¿A cuál de los siguientes vegetales se podría asimilar la defensa en profundidad? **Alcachofa.**
2. Indica cuál de las siguientes afirmaciones NO es una buena práctica de seguridad en servidores. **Usar cuentas con privilegios.**
3. De las siguientes afirmaciones, indica cuál NO se identifica con una capa de la defensa en profundidad. **Defensa de usuarios.**
4. De las siguientes afirmaciones, indica cuál de ellas se identifica con el concepto de hardening. **Proceso de reducción de vulnerabilidades en el sistema.**
5. En relación a la herramienta Fwsnort, indica cuál de las siguientes afirmaciones es correcta. **Se combina con el cortafuegos.**

## QUIZ
