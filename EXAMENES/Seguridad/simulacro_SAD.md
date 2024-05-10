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

foo

2. ¿En qué se basa la criptografía simétrica? Describe cómo funciona, claves, etc. (0,75 puntos)


foo <!--clave privada única-->

#### b) Análisis hash MD5

- Utiliza el siguiente link para obtener el archivo md5 de, por ejemplo, este archivo de examen: https://hash.online-convert.com/es/generador-md5 . ¿Qué es lo que se obtiene? ¿Qué son los valores numéricos obtenidos en dicha página web? (1 punto)

foo

#### c) Análisis tcpdump

- Realiza un análisis con Windump, usando la conexión de red al AP con SSID UE-Students (o tu SSID de tu router en casa). Interpreta los resultados. (1 punto)

foo



### Desarrollo 2

#### a) Explicar imágenes

1. Si yo firmo un acta de notas de alumnos, con mi firma digital como el ejemplo de la imagen (imagen descargada de Google): (0,75 puntos) ¿Qué mecanismos se utilizan para poder firmar digitalmente un documento? ¿Qué implica que yo firme digitalmente un documento?

foo <!--un certificado (qué es); veracidad, autenticidad-->

2. ¿Qué es la cadena de custodia en un procedimiento de análisis forense? ¿Por qué es importante que no se rompa dicha cadena? (0,75 puntos)

foo <!-- cadena de custodia; integridad de evidencias -->


#### b) Cifrado con veracrypt

- Este apartado debe ser el último que hagas en el examen si eliges esta pregunta. Cuando vayas a entregar el examen, reúne todos los documentos entregables en un rar (si fuera un solo documento, da igual) y cífralo con veracrypt. Indica cuantos bits utiliza para cifrar, tipo de cifrado y en esta pregunta indícame que pasos tendré que realizar para poder descifrar el archivo rar (que si no puedo...no podre corregirte el examen ) (1 punto)

foo <!-- PROBAR EN VM -->

#### c) Análisis con Wireshark

- ¿Qué es XSS (visto en php)? Con ayuda de wireshark, filtra paquetes con métodos GET que contengan la palabra script en la URI para evitar cualquier intento de XSS en el examen de la UEM. (1 punto)

foo <!--wireshark, filtrar método GET y palabra 'script' (CAERÁ ALGO DE XSS)-->


### Desarrollo 3

#### a) Explicar noticias y gráficos

1. Explicar las siguientes situaciones (noticias):

foo <!--ransomware, encriptar para extorsionar; spoofing|phising; DDoS, saturar servidores web; vulnerabilidad explotable (backdoor)-->

2. Indica de las siguientes noticias, los tipos de ataques a los que se refieren y sus métodos de funcionamiento: (1 punto)

foo <!--según número de bits, más tiempo (FALACIA: RSA SE USA CON 1K BIT MAL PLANTEADO), según sea encriptación o desencriptación-->


#### b) Análisis de red (Wifi)

- Con la herramienta de parrot o kali que hayáis utilizado en los ejercicios, realiza un análisis de red mediante tu tarjeta inalámbrica conectada al AP de la uem e interpreta los resultados. (0,5 puntos)

foo <!--...-->

#### c) IPtables

- Explicar las siguientes reglas de iptables (indicar que permiten, o que deniegan, etc...): (0,25 cada una, 1,5 puntos en total)
    1. `$ sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT`: ... <!-- acepta tráfico HTTP -->
    2. `$ sudo iptables -A INPUT -p tcp --dport 233 -j ACCEPT`: ... <!-- acepta tráfico... -->
    3. `$ sudo iptables -P FORWARD DROP (p 53):`: ... <!-- no permite forwarding -->
    4. `$ sudo iptables -A INPUT -p icmp -j DROP`: ... <!-- se bloquea el ping -->
    5. `$ sudo iptables -L INPUT -n -v --line-numbers`: ... <!-- numera las reglas de INPUT -->
    6. `$ sudo iptables -F`: ... <!-- flush... -->

<!-- > Examen: con --state hay una, con flush DNS también -->


---

<!--
OJO

- hashmyfiles
- veracrypt
- tcpdump
- windump
- wintcp
-->