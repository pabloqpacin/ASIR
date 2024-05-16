## Simulacro SAD

> WIP

- [Simulacro SAD](#simulacro-sad)
- [Test](#test)
- [DESARROLLO](#desarrollo)
  - [Desarrollo 1](#desarrollo-1)
    - [a) Explicar apartados](#a-explicar-apartados)
    - [b) Análisis hash MD5](#b-análisis-hash-md5)
    - [c) Análisis tcpdump](#c-análisis-tcpdump)
  - [Desarrollo 2](#desarrollo-2)
    - [a) Explicar imágenes](#a-explicar-imágenes)
    - [b) Cifrado con veracrypt](#b-cifrado-con-veracrypt)
    - [c) Análisis con Wireshark](#c-análisis-con-wireshark)
  - [Desarrollo 3](#desarrollo-3)
    - [a) Explicar noticias y gráficos](#a-explicar-noticias-y-gráficos)
    - [b) Análisis de red (Wifi)](#b-análisis-de-red-wifi)
    - [c) IPtables](#c-iptables)


## Test

<!-- 1a
2d
3c (!!)
4a
5a
6c (...)
7a
8c
9a
10d
11b
12c
13d
14d
15a -->


1. Los ataques de phising se realizan a nivel OSI:
    - [x] 6
    - [ ] 5
    - [ ] 4
    - [ ] 3
    
2. Es un elemento indispensable a la hora de entender las ACL o listas de control de acceso:
    - [ ] Objeto
    - [ ] Sujeto
    - [ ] Derecho de acceso
    - [x] Todas las anteriores
    
3. Cambiar el nombre del SSID por otro que simule uno confiable, es un ataque de:
    - [ ] Ingeniería social
    - [ ] Fuerza bruta
    - [x] Man in the middle
    - [ ] Diccionario de datos
    
4. En criptografía asimétrica, se utilizan:
    - [x] 2 claves
    - [ ] Ninguna clave
    - [ ] 3 claves, una de ellas publica
    - [ ] 1 clave
    
5. RSA es un algoritmo de encriptación: <!--SABER UN PAR DE EJEMPLOS DE CADA TIPO-->
    - [x] Asimétrico
    - [ ] Simétrico
    - [ ] De 32 bits
    - [ ] De 64 bits
    
6. En criptografía asimétrica, se cifra con la clave:
    - [ ] Publica
    - [ ] Privada
    - [x] Tanto con la pública como la privada
    - [ ] Ninguna de las anteriores
    
7. El método de cifrado más rápido es, de entre los siguientes:
    - [x] Simétrico
    - [ ] Asimétrico
    - [ ] Los dos cifran a la misma velocidad
    - [ ] Cualquiera de las anteriores
    
8. Una huella hash de un archivo:
    - [ ] No se puede modificar nunca
    - [ ] Por cada archivo, siempre tenemos el mismo archivo hash, aunque el archivo se modifique
    - [x] Con que cambie un solo byte del archivo, el archivo hash asociado cambia
    - [ ] Depende del sistema de cifrado que se use
    
9. El análisis forense se basa en:
    - [x] Recolección y análisis de evidencias digitales
    - [ ] Únicamente en el análisis de dispositivos que ya no funcionan
    - [ ] El único objetivo es identificar a las personas que realizan una acción penal en el mundo ciber
    - [ ] Todas las anteriores son válidas

10. Ataques de contraseña son:
    - [ ] Fuerza bruta/ataques diccionario
    - [ ] Phising
    - [ ] Keylogger
    - [x] Cualquiera de las anteriores es válida

11. La imagen (...) hace referencia a:
    - [ ] Phising
    - [x] Spoofing o suplantación
    - [ ] DDoS
    - [ ] Sniffing

12. La monitorización de una red consiste en:
    - [ ] Chequear de manera periódica que los dispositivos de red no han sufrido alteraciones físicas o lógicas.
    - [ ] Comprobar que protocolos como tcp/ip o udp envían y reciben de forma correcta
    - [x] **Su control continuo para su notificación al administrador por cualquier suceso ocurrido**
    - [ ] Medir los parámetros eléctricos de la red para garantizar unas velocidades superiores al 90% teórico.

13. Un protocolo de seguridad en red corporativa, consiste en:
    - [ ] Solo la seguridad física que impide el acceso a la infraestructura de red
    - [ ] Únicamente las reglas a seguir en caso de infección o ataques a la red
    - [ ] Solo las normas a seguir por las personas que utilicen una determinada red de computadores
    - [x] Conjunto de reglas y formatos que determinan como se realiza el intercambio de información

14. Son elementos de la seguridad perimetral:
    - [ ] Firewalls
    - [ ] VPN’s
    - [ ] Honeypots
    - [x] Todas las anteriores son válidas

15. El objetivo del proxy NAT es:
    - [x] **Enmascarar las direcciones IP entre origen y destino**
    - [ ] Ocultar la IP y navegar por la web
    - [ ] Acelerar acceso a las páginas web
    - [ ] Permite a los usuarios de internet acceder a determinados servidores internos


---

## DESARROLLO


### Desarrollo 1

#### a) Explicar apartados

1. ¿Qué es la criptografía? ¿Qué se cifra en informática? ¿Cómo se cifra? (0,75)

```md
La criptografía es el estudio y práctica de técnicas para asegurar la comunicación y proteger la información de accesos no autorizados o modificaciones durante la transmisión o almacenamiento. 

En informática, la criptografía se utiliza para cifrar datos, es decir, convertir información en un formato ilegible llamado texto cifrado, que solo puede ser desencriptado por aquellos que tienen la clave adecuada.

Los datos que se cifran en informática pueden ser cualquier tipo de información digital, como archivos, mensajes de correo electrónico, contraseñas, datos personales, transacciones financieras, entre otros.

La cifra se realiza mediante algoritmos matemáticos que transforman los datos originales en una forma ilegible utilizando una clave secreta. Este proceso se llama cifrado. Para descifrar los datos y volverlos legibles nuevamente, se necesita la clave adecuada, y este proceso se llama descifrado.

Existen varios métodos de cifrado, incluyendo:

- **Cifrado simétrico:** Utiliza una única clave para cifrar y descifrar los datos. Ejemplos de algoritmos de cifrado simétrico incluyen AES (Estándar de Cifrado Avanzado) y DES (Estándar de Cifrado de Datos).

- **Cifrado asimétrico:** Utiliza un par de claves, una pública y otra privada, para cifrar y descifrar los datos. La clave pública se comparte con otros para cifrar los datos, mientras que la clave privada se mantiene en secreto y se utiliza para descifrar los datos. Ejemplos de algoritmos de cifrado asimétrico incluyen RSA y ECC (Cifrado de Curva Elíptica).

- **Funciones hash:** No es un método de cifrado en sí mismo, pero se utiliza para crear un resumen único e irreversible de los datos originales. Este resumen se conoce como hash y se puede utilizar para verificar la integridad de los datos. Ejemplos de funciones hash incluyen SHA-256 y MD5.

En resumen, la criptografía es una herramienta fundamental en informática para garantizar la seguridad y privacidad de la información mediante el cifrado de datos utilizando algoritmos matemáticos.
```

2. ¿En qué se basa la criptografía simétrica? Describe cómo funciona, claves, etc. (0,75 puntos)

```md
La criptografía simétrica se basa en el uso de una única clave para cifrar y descifrar los datos. Esta clave se comparte entre el remitente y el destinatario de la comunicación y se mantiene en secreto para otros usuarios. Aquí tienes una descripción detallada de cómo funciona la criptografía simétrica:

1. **Generación de la clave:** El remitente y el destinatario acuerdan una clave compartida de antemano y la mantienen en secreto. Esta clave puede ser generada aleatoriamente y debe ser lo suficientemente larga y compleja para garantizar la seguridad del cifrado.

2. **Cifrado de los datos:** El remitente utiliza la clave compartida para cifrar los datos originales. Para hacerlo, utiliza un algoritmo de cifrado simétrico como AES (Estándar de Cifrado Avanzado) o DES (Estándar de Cifrado de Datos). Este algoritmo toma la clave y los datos originales como entrada y produce un texto cifrado ilegible.

3. **Transmisión de los datos cifrados:** Una vez que los datos están cifrados, el remitente puede transmitirlos de forma segura a través de cualquier canal de comunicación, ya que el texto cifrado es ilegible sin la clave adecuada.

4. **Descifrado de los datos:** El destinatario utiliza la misma clave compartida para descifrar los datos recibidos. Utiliza el mismo algoritmo de cifrado simétrico y la clave para revertir el proceso de cifrado y recuperar los datos originales.

5. **Uso seguro de la clave:** Es crucial mantener la clave compartida en secreto y protegerla de accesos no autorizados. Si un tercero obtiene acceso a la clave, podría descifrar los datos cifrados y comprometer la seguridad de la comunicación.

En resumen, la criptografía simétrica utiliza una única clave compartida entre el remitente y el destinatario para cifrar y descifrar los datos. Esto proporciona un método eficiente y rápido para asegurar la confidencialidad de la comunicación, siempre que la clave se mantenga en secreto.
```
<!-- ```md
La criptografía asimétrica se basa en el uso de un par de claves relacionadas matemáticamente: una clave pública y una clave privada. Este enfoque ofrece una serie de ventajas sobre la criptografía simétrica, especialmente en términos de seguridad y autenticación. Aquí tienes una descripción detallada de cómo funciona la criptografía asimétrica:

1. **Generación del par de claves:** El destinatario genera un par de claves: una clave pública y una clave privada. Estas claves están relacionadas matemáticamente, pero no es posible deducir la clave privada a partir de la clave pública.

2. **Distribución de la clave pública:** El destinatario distribuye su clave pública a cualquier persona que desee comunicarse con él. La clave pública se puede compartir libremente y se utiliza para cifrar los datos que se enviarán al destinatario.

3. **Cifrado de los datos:** El remitente utiliza la clave pública del destinatario para cifrar los datos que desea enviar. Utiliza un algoritmo de cifrado asimétrico como RSA (Algoritmo de Criptografía de Rivest-Shamir-Adleman) o ECC (Cifrado de Curva Elíptica) para realizar el cifrado. Los datos cifrados resultantes solo pueden ser descifrados con la clave privada correspondiente, que solo el destinatario posee.

4. **Transmisión de los datos cifrados:** Una vez que los datos están cifrados con la clave pública del destinatario, el remitente puede transmitirlos de forma segura a través de cualquier canal de comunicación.

5. **Descifrado de los datos:** El destinatario utiliza su clave privada para descifrar los datos cifrados recibidos. Utiliza el mismo algoritmo de cifrado asimétrico y su clave privada para revertir el proceso de cifrado y recuperar los datos originales.

6. **Firma digital:** Además de cifrar datos, la criptografía asimétrica también se utiliza para crear firmas digitales. El remitente puede firmar digitalmente un mensaje utilizando su clave privada, lo que proporciona autenticación y garantiza la integridad del mensaje. El destinatario puede verificar la firma digital utilizando la clave pública del remitente.

En resumen, la criptografía asimétrica utiliza un par de claves relacionadas matemáticamente (pública y privada) para cifrar y descifrar datos, así como para proporcionar autenticación y garantizar la integridad de los mensajes. Esto ofrece una mayor seguridad y flexibilidad en comparación con la criptografía simétrica.
``` -->

<!-- ```md
Aquí tienes dos cifrados simétricos y dos asimétricos:

Cifrados Simétricos:
1. AES (Estándar de Cifrado Avanzado): Es uno de los algoritmos de cifrado más utilizados y seguros. AES opera en bloques de datos de 128 bits y puede tener longitudes de clave de 128, 192 o 256 bits.

2. 3DES (Triple Data Encryption Standard): También conocido como TDEA (Triple DES), este algoritmo utiliza la estructura de clave de DES tres veces para mejorar la seguridad. Opera en bloques de datos de 64 bits y utiliza claves de 168 bits (56 bits para cada una de las tres claves).

Cifrados Asimétricos:
1. RSA (Algoritmo de Criptografía de Rivest-Shamir-Adleman): Es uno de los algoritmos de cifrado asimétrico más ampliamente utilizados. Se basa en la dificultad de factorizar grandes números primos. RSA se utiliza para cifrar y firmar digitalmente datos. Las claves RSA generalmente tienen tamaños de 1024, 2048 o 4096 bits.

2. ECC (Cifrado de Curva Elíptica): Este algoritmo utiliza operaciones matemáticas en puntos de una curva elíptica para cifrar y firmar digitalmente datos. Ofrece la misma seguridad que RSA con claves mucho más cortas. Las claves ECC son considerablemente más cortas que las claves RSA, lo que las hace ideales para dispositivos con recursos limitados, como teléfonos móviles y dispositivos IoT (Internet de las cosas).
``` -->


#### b) Análisis hash MD5

- Utiliza el siguiente link para obtener el archivo md5 de, por ejemplo, este archivo de examen: https://hash.online-convert.com/es/generador-md5 . ¿Qué es lo que se obtiene? ¿Qué son los valores numéricos obtenidos en dicha página web? (1 punto)

```txt
hex: 94f221d01ac7c63617fa61090f92ec94
HEX: 94F221D01AC7C63617FA61090F92EC94
h:e:x: 94:f2:21:d0:1a:c7:c6:36:17:fa:61:09:0f:92:ec:94
base64: lPIh0BrHxjYX+mEJD5LslA==
---
"Firmas"
```

#### c) Análisis tcpdump

- Realiza un análisis con Windump, usando la conexión de red al AP con SSID UE-Students (o tu SSID de tu router en casa). Interpreta los resultados. (1 punto)

```bash
sudo tcpdump -w /tmp/dump.pcap -i eth0 'icmp or port 80' &
tcpdump_pid=$!

ping 192.168.1.1
curl wikipedia.org
sleep 5
sudo kill -SIGINT $tcpdump_pid
wait $tcpdump_pid

sudo tcpdump -r /tmp/dump.pcap

```
```bash
# sudo tcpdump -i eth0 -n -vvv -s0 -e host <dirección_IP_del_AP> and wlan[0:4]==0x00504b4f
```


### Desarrollo 2

#### a) Explicar imágenes

1. Si yo firmo un acta de notas de alumnos, con mi firma digital como el ejemplo de la imagen (imagen descargada de Google): (0,75 puntos) ¿Qué mecanismos se utilizan para poder firmar digitalmente un documento? ¿Qué implica que yo firme digitalmente un documento?

foo <!--un certificado (qué es); veracidad, autenticidad-->

2. ¿Qué es la cadena de custodia en un procedimiento de análisis forense? ¿Por qué es importante que no se rompa dicha cadena? (0,75 puntos)

foo <!-- cadena de custodia; integridad de evidencias -->


#### b) Cifrado con veracrypt

- Este apartado debe ser el último que hagas en el examen si eliges esta pregunta. Cuando vayas a entregar el examen, reúne todos los documentos entregables en un rar (si fuera un solo documento, da igual) y cífralo con veracrypt. Indica cuantos bits utiliza para cifrar, tipo de cifrado y en esta pregunta indícame que pasos tendré que realizar para poder descifrar el archivo rar (que si no puedo...no podre corregirte el examen ) (1 punto)

Básicamente instalar veracrypt, crear un volumen cifrado con contraseña de 20MB en /tmp/examen, montarlo y meterle los archivos. Desmontarlo y compartirlo. Para abrirlo, instalar veracrypt, montar el volumen cifrado y listo.

<!-- ```md
Para cifrar un archivo con VeraCrypt y luego descifrarlo, sigue estos pasos:

**Cifrado del archivo con VeraCrypt:**

1. Abre VeraCrypt en tu sistema.
2. Haz clic en el botón "Create Volume" para crear un nuevo volumen.
3. En el asistente de creación de volumen, elige la opción "Create a file container" y haz clic en "Next".
4. Selecciona "Standard VeraCrypt volume" y haz clic en "Next".
5. Elige una ubicación y un nombre para tu archivo contenedor, y haz clic en "Save".
6. Selecciona el algoritmo de cifrado y el tamaño de la clave. Puedes optar por AES, Serpent, Twofish u otros algoritmos disponibles en VeraCrypt. Cuanto mayor sea el tamaño de la clave, más segura será la encriptación.
7. Especifica el tamaño del archivo contenedor y haz clic en "Next".
8. Proporciona una contraseña segura para el archivo contenedor y haz clic en "Next".
9. Selecciona el sistema de archivos que deseas utilizar para el volumen cifrado y haz clic en "Next".
10. Revisa la configuración y haz clic en "Format" para crear el volumen cifrado.
11. Una vez completado el proceso de creación del volumen, haz clic en "Exit".

**Descifrado del archivo con VeraCrypt:**

1. Abre VeraCrypt en tu sistema.
2. En la ventana principal de VeraCrypt, haz clic en el botón "Select File" y selecciona el archivo contenedor que creaste anteriormente.
3. Haz clic en el botón "Mount" para montar el archivo contenedor. Ingresa la contraseña que estableciste durante el proceso de creación.
4. Una vez montado, el archivo contenedor aparecerá como una nueva unidad en tu sistema, similar a un disco duro o una unidad USB.
5. Puedes acceder al contenido del archivo contenedor a través de esta unidad montada.
6. Cuando hayas terminado de trabajar con el archivo contenedor, regresa a VeraCrypt y haz clic en el botón "Dismount" para desmontar la unidad y cerrar el archivo contenedor.

Siguiendo estos pasos, podrás cifrar y descifrar archivos utilizando VeraCrypt de manera segura. Asegúrate de recordar la contraseña que estableciste durante el proceso de cifrado, ya que la necesitarás para descifrar el archivo posteriormente.
``` -->

> Cifrado AES: 256-bit key, 128-bit block, 14 rounds (AES-256)

```bash
mkdir /tmp/foo && cd $_

URL='https://launchpad.net/veracrypt/trunk/1.26.7/+download/'
PKG='veracrypt-1.26.7-Debian-12-amd64.deb'

curl -LO ${URL}${PKG}
sudo dpkg -i ${PKG}
sudo apt install --fix-broken
```
```ps1
# https://github.com/microsoft/winget-pkgs/issues/69241
winget install idrix.veracrypt --accept-package-agreements --silent
```




#### c) Análisis con Wireshark

- ¿Qué es XSS (visto en php)? Con ayuda de wireshark, filtra paquetes con métodos GET que contengan la palabra script en la URI para evitar cualquier intento de XSS en el examen de la UEM. (1 punto)

foo <!--wireshark, filtrar método GET y palabra 'script' (CAERÁ ALGO DE XSS)-->

```md
Cross-Site Scripting (XSS) es una vulnerabilidad de seguridad que ocurre cuando un atacante inserta código malicioso, generalmente en forma de scripts, en páginas web accesibles por otros usuarios. Este código se ejecuta en el navegador web de los usuarios que visitan la página comprometida, lo que permite al atacante robar información sensible, como cookies de sesión, datos de autenticación o realizar acciones en nombre del usuario.

En PHP, una forma común de XSS es cuando los datos proporcionados por el usuario no se filtran adecuadamente antes de ser mostrados en la salida HTML. Por ejemplo, si un sitio web permite que los usuarios ingresen comentarios o mensajes en un formulario y luego muestra esos comentarios sin filtrar en una página web, un atacante podría insertar scripts maliciosos en su comentario, que luego se ejecutarían cuando otros usuarios vean la página.

Para filtrar paquetes con métodos GET que contengan la palabra "script" en la URI y así evitar posibles intentos de XSS, puedes utilizar Wireshark para capturar y filtrar los paquetes de red. Aquí te muestro cómo hacerlo:

1. Abre Wireshark y selecciona la interfaz de red en la que deseas capturar el tráfico.
2. Haz clic en el botón "Capture Options" (icono de engranaje) para configurar las opciones de captura.
3. En la pestaña "Capture Filter", ingresa el filtro siguiente para capturar solo los paquetes con métodos GET que contengan la palabra "script" en la URI:

> tcp.port==80 and (http.request.method == "GET") and (http.request.uri contains "script")

tcp.port==xxx

4. Haz clic en "Start" para iniciar la captura.

Este filtro capturará solo los paquetes HTTP que utilicen el método GET y cuya URI contenga la palabra "script". Esto te permitirá identificar posibles intentos de XSS en el tráfico de red capturado. Recuerda que la detección de XSS es solo una parte de un enfoque completo de seguridad web y que se deben implementar otras medidas de seguridad para proteger adecuadamente tu aplicación contra este tipo de ataques.
```



### Desarrollo 3

#### a) Explicar noticias y gráficos

1. Explicar las siguientes situaciones (noticias):

foo <!--ransomware, encriptar para extorsionar; spoofing|phising; DDoS, saturar servidores web; vulnerabilidad explotable (backdoor)-->

2. Indica de las siguientes noticias, los tipos de ataques a los que se refieren y sus métodos de funcionamiento: (1 punto)

foo <!--según número de bits, más tiempo (FALACIA: RSA SE USA CON 1K BIT MAL PLANTEADO), según sea encriptación o desencriptación-->


#### b) Análisis de red (Wifi)

- Con la herramienta de parrot o kali que hayáis utilizado en los ejercicios, realiza un análisis de red mediante tu tarjeta inalámbrica conectada al AP de la uem e interpreta los resultados. (0,5 puntos)

```bash
# sudo tcpdump ...
```


#### c) IPtables

- Explicar las siguientes reglas de iptables (indicar que permiten, o que deniegan, etc...): (0,25 cada una, 1,5 puntos en total)
    1. `$ sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT`: ... <!-- acepta tráfico HTTP -->
    2. `$ sudo iptables -A INPUT -p tcp --dport 233 -j ACCEPT`: ... <!-- acepta tráfico... -->
    3. `$ sudo iptables -P FORWARD DROP (p 53):`: ... <!-- no permite forwarding -->
    4. `$ sudo iptables -A INPUT -p icmp -j DROP`: ... <!-- se bloquea el ping -->
    5. `$ sudo iptables -L INPUT -n -v --line-numbers`: ... <!-- numera las reglas de INPUT -->
    6. `$ sudo iptables -F`: ... <!-- flush... -->

<!-- > Examen: con --state hay una, con flush DNS también -->

```md
Aquí tienes la explicación de cada una de las reglas de iptables proporcionadas:

1. `$ sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT`: Esta regla permite el tráfico TCP entrante en el puerto 80. Es comúnmente utilizada para permitir conexiones HTTP entrantes a un servidor web. El flag `-A INPUT` agrega la regla a la cadena de iptables INPUT, `-p tcp` especifica que se aplica a protocolo TCP, `--dport 80` especifica el puerto destino 80 y `-j ACCEPT` indica que el tráfico que cumpla con esta regla debe ser aceptado.

2. `$ sudo iptables -A INPUT -p tcp --dport 233 -j ACCEPT`: Esta regla permite el tráfico TCP entrante en el puerto 233. Similar al caso anterior, esta regla permitiría conexiones TCP entrantes en el puerto 233.

3. `$ sudo iptables -P FORWARD DROP (p 53)`: Esta regla establece la política predeterminada para el tráfico que pasa a través del firewall en la cadena FORWARD. En este caso, establece la política predeterminada en DROP, lo que significa que todo el tráfico FORWARD será denegado a menos que se especifique lo contrario. El `(p 53)` parece ser un comentario que indica que esta regla se aplica al puerto 53, que es el puerto estándar para DNS.

4. `$ sudo iptables -A INPUT -p icmp -j DROP`: Esta regla deniega todo el tráfico ICMP entrante. El protocolo ICMP se utiliza para mensajes de control y errores en la red, como ping, tracert, etc. Al denegar todo el tráfico ICMP entrante, se bloquean estas funciones de diagnóstico de red.

5. `$ sudo iptables -L INPUT -n -v --line-numbers`: Este comando lista todas las reglas en la cadena INPUT de iptables, mostrando información detallada como direcciones IP, puertos y contadores de paquetes y bytes. Es útil para ver todas las reglas que están actualmente configuradas en el firewall.

6. `$ sudo iptables -F`: Este comando elimina todas las reglas de todas las cadenas de iptables, lo que efectivamente despeja todas las configuraciones de firewall existentes. Es útil para reiniciar el firewall o eliminar todas las reglas existentes antes de aplicar nuevas configuraciones.
```


---

<!--
OJO

- hashmyfiles
- veracrypt
- tcpdump
- windump
- wintcp
-->

---
