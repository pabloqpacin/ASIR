# Materia UDx: Titulo

<Table of contents>

## TEORÍA

> apuntes.md

## PRÁCTICA (McGrawHill)

<!-- ### foo -->
<!-- ### bar -->

### 1

#### Caso práctico 1 -- Gufw

```md
**Gufw**

**Introducción**
Comenzamos con este ejercicio de uso (sencillo) de un cortafuegos con interfaz gráfico en el primer apartado de la unidad. No se ha estudiado con detalle el funcionamiento interno de los cortafuegos, pero el software seleccionado, Gufw, es muy intuitivo y sencillo.
En los siguientes apartados se estudia con detalle el mecanismo de creación de reglas para cortafuegos y se verán múltiples ejemplos de uso.

**Enunciado**
La herramienta de configuración de cortafuegos predeterminada para Ubuntu es UFW (Uncomplicated Firewall) que ha sido desarrollada con el fin de simplificar la gestión de la configuración del firewall de iptables, ya que UFW proporciona un método sencillo de uso para crear reglas de firewall basadas en host IPv4 o IPv6. Por defecto, UFW está desactivado. Podemos verificarlo preguntando por su estado.

$ sudo ufw status
Status: inactive 

La versión para GNOME se llama gufw.
Para conocer el funcionamiento de este cortafuegos recomendamos ir a la página oficial de Ubuntu.
Se pide:
- Instalar y activar la herramienta.
- Aplicar la política de denegar todo el tráfico saliente.
- Crear una regla que niegue el tráfico HTTP hacia www.uv.es. 
- Crear una regla que impida acceder a páginas web que no sean seguras.

---

**Solución**

**Paso 1. Instalación y activación**
Para instalar:
	$ sudo apt install gufw
Para ejecutar (cambiar a root):
	# gufw
La interfaz gráfica que muestra recién instalado es la que se muestra en la siguiente pantalla.
Lo primero que hay que hacer es activar el cortafuegos (enable). Para ello, debemos ir a Estado y mover el botón. Después de unos instantes se activará.
Podemos determinar las preferencias de uso del cortafuegos, en Editar > Preferencias.

**Paso 2. Aplicar la política de denegar todo el tráfico saliente**
En Entrante dejamos PERMITIR y en Saliente dejamos DENEGAR.
Comprobamos que no podemos ni hacer ping a ninguna IP.
Vemos que en Reglas han aparecido dos nuevas reglas que eliminaremos antes de pasar al apartado siguiente.

**Paso 3. Crear una regla que niegue el tráfico HTTP hacia www.uv.es**
Vamos a reglas y pulsamos en el signo «+».
Aplicamos los parámetros adecuados y añadimos la regla.
```
```yaml
Nueva regla: Avanzada:
    Nombre: Denegar saliente a www.uv.es
    Insertar: 0
    Política: Denegar
    Dirección: Saliente
    Interfaz: enp0s3
    Registro: No registrar
    Protocolo: TCP
    Desde: ...
    A: 147.156.200.249:443
```
```md
Comprobamos ahora en el navegador que no se permite el acceso al sitio web de la Universidad de Valencia.

**Paso 4. Crear una regla que impida acceder a páginas web que no sean seguras.**
Comprobación. Aunque hoy día es difícil encontrar páginas no seguras, todavía hay ejemplos. Es el caso del Parlamento de Andalucía o el Concello de Lugo.
En cualquier momento podemos consultar el Registro (logs) generados por la herramienta gufw, que nos van comentando la actividad realizada.
```

#### Ponte a prueba 1 -- DMZ en el router

```md
**DMZ en el router**
En la actualidad la mayoría de los routers disponen en su configuración de la opción para habilitar una DMZ. De esta forma un equipo (personal o de una organización) que ofrece servicios al exterior puede ser accesible desde Internet. 
Y esta opción, que en principio parece atractiva, hay que activarla con cuidado. Hay que tener en cuenta que en ese caso la seguridad de toda la red está recayendo sobre el router y nuestra habilidad y conocimientos para configurarlo. Y en último extremo, ser conscientes de que el router no ha sido diseñado para la función de cortafuegos al 100%.
La DMZ activada en el router permite abrir todos los puertos hacia una dirección IP privada en concreto. Es una forma de comprobar el funcionamiento del cortafuegos instalado y configurado en un equipo personal. Por defecto, todos los puertos del router están cerrados, es decir, no hay ninguna regla de reenvío de puertos o port forwarding en el router.
En el caso de las VPN, requieren tener abiertos determinados puertos. Se puede configurar la VPN estando activa la DMZ del router y una vez que funcione todo correctamente en la VPN desactivar la DMZ y solo dejar abiertos los puertos realmente necesarios.
Se pide averiguar, en el propio router, cómo se abre o se activa la DMZ.
> Se recomienda tener a mano las instrucciones del router instalado por el ISP o comprado por el usuario.
```

#### Ejercicios 1 -- test

1. De las siguientes opciones, indica cuál de ellas es una función del cortafuegos. **Filtrar el tráfico.**
2. De las siguientes afirmaciones, ¿cuál corresponde a la seguridad perimetral? **Se establece mediante software y/o hardware.**
3. De las siguientes afirmaciones, indica cuál se corresponde con una función del router frontera. **Es el dispositivo que separa la red corporativa del exterior.**
4. ¿Cuál es la afirmación correcta respecto al cortafuegos? **Puede ser un router.**
5. Señala la opción correcta respecto a la ubicación de las zonas DMZ. **Están dentro del perímetro de red.**


### 2

#### Caso práctico 2 -- Cortafuegos básico

```md
**Enunciado**
El equipo que va a hacer las veces de cortafuegos debe tener dos tarjetas de red, eth0 y eth1, y detrás de él hay una red local que deberá salir a Internet a través del equipo servidor.
Es decir:
- eth1 escucha la red local (192.168.1.254).
- eth0 conecta el servidor con el router.
**NOTA**
Adaptar el nombre de las interfaces eth0 y eth1 a las disponibles en la máquina del estudiante. 
Es importante recordar que las reglas se van acumulando en RAM y que están vigentes a menos que se eliminen. Esto hay que tenerlo en cuenta a la hora de comprobar los resultados.
Se va a suponer que se utiliza como __política por defecto denegar__.
Se pide escribir las reglas IPtables que realicen las siguientes acciones:

1. Limpiar posibles reglas de cortafuegos anteriores.
2. La política por defecto es denegar paquetes de entrada, salida y reenvío.
3. Aceptar todos los paquetes de entrada y salida de la interfaz de loopback.
4. Permitir todo a la interfaz de red interna del servidor.
5. Aceptar paquetes desde todas las conexiones establecidas.
6. Dejar que la máquina de la red local con dirección IP 192.168.1.2 se pueda conectar vía SSH (puerto 22) al equipo cortafuegos (se supone que está activo el servidor del servicio SSH).
7. Si tenemos un servidor web instalado en el equipo cortafuegos, dejar abierto el puerto 80 para todo el tráfico de entrada y salida.
8. Permitir el acceso a Webmin, instalado en el equipo cortafuegos (puerto 10000), a toda la red.
9. Permitir ping del exterior hacia adentro.
10. Permitir ping de dentro hacia el exterior.
```
```bash
# 1. Limpiar posibles reglas de cortafuegos anteriores:
iptables -F

# 2. Política por defecto denegar paquetes de entrada, salida y reenvío:
iptables -P INPUT DROP 
iptables -P OUTPUT DROP 
iptables -P FORWARD DROP 

# 3. Aceptar todos los paquetes de entrada y salida de la interfaz de loopback:
iptables -A INPUT -i lo -j ACCEPT 
iptables -A OUTPUT -o lo -j ACCEPT

# 4. Permitir todo a la interfaz de red interna del servidor:
iptables -A INPUT -s 192.168.1.254 -j ACCEPT

# 5. Aceptar paquetes desde todas las conexiones establecidas.
# Si el tráfico de paquetes, tanto de entrada como de salida, pertenece a una conexión establecida (en estado ESTABLISHED) o está relacionado con una conexión establecida (en estado RELATED) se aceptan y de esta forma se agiliza su paso por el cortafuegos, ya que no tendrá que pasar por otra serie de reglas IPtables.
# Para que esta regla funcione correctamente se ha de activar el reenvío (forward). Para ello hay que entrar en /etc/sysctl.conf y poner a 1 la variable net.ipv4.ip_forward (activado el reenvío). De esta forma será permanente. 
# También podemos hacerlo de forma temporal ejecutando la orden siguiente antes de la regla:
sysctl net/ipv4/ip_forward=1
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
# sed -i 's/^#\(.*ip_forward\)/\1/' /etc/sysctl.conf

# 6. Dejar que la máquina de la red local con dirección IP 192.168.1.2 se pueda conectar vía SSH (puerto 22) al equipo cortafuegos (se supone que está activo el servidor del servicio SSH):
iptables -A INPUT -s 192.168.1.2 -p tcp --dport 22 -j ACCEPT

# 7. Si tenemos un servidor web instalado en el equipo cortafuegos, dejar abierto el puerto 80 para todo el tráfico de entrada y salida:
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT

# 8. Permitir el acceso a Webmin, instalado en el equipo cortafuegos (puerto 10000), a toda la red:
iptables -A INPUT -p tcp --dport 10000 -j ACCEPT

# 9. Permitir ping del exterior hacia adentro:
iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT

# 10. Permitir ping de dentro hacia el exterior:
iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT

# Con estas reglas se tiene un servidor GNU/Linux haciendo de cortafuegos para la entrada/salida de paquetes.
# Pero hay que observar que no existe ninguna regla que permita a cualquier máquina de la red local (eth1) poder conectarse a Internet. En estas máquinas habrá que poner como puerta de enlace la IP del servidor.
# Las reglas correspondientes se verán en el apartado siguiente, en el Ponte a prueba.
```

#### Ponte a prueba 2 -- Ampliación de ejemplos de uso de IPtables

```md
**Ampliación de ejemplos de uso de IPtables**
Como continuación de la creación de reglas IPtables para la tabla filter se propone escribir las siguientes:
1. Ver las reglas introducidas para la tabla filter.
2. Borrar todas las reglas de la tabla filter.
3. Eliminar todos los paquetes de la entrada.
4. Eliminar todos los paquetes de la salida.
5. Permitir la salida de todos los paquetes.
6. Aceptar conexiones al servidor web (80) y al servidor ftp (21) generando un registro de log (-l).
7. Cuando se trabaja con cortafuegos, se pueden establecer políticas por defecto de aceptación o denegación de paquetes recibidos y/o enviados (escribir la regla de aceptación de paquetes recibidos; escribir la regla de denegación de paquetes recibidos).
8. Otra regla importante es la relacionada con el estado de las conexiones.
Si el tráfico de paquetes, tanto de entrada como de salida, pertenece a una conexión establecida (en estado ESTABLISHED) o está relacionado con una conexión establecida (en estado RELATED), se aceptan y, de esta forma, se agiliza su paso por el cortafuegos, ya que no tendrá que pasar por otra serie de reglas IPtables.
Escribir las reglas correspondientes. No son acciones relacionadas, son reglas independientes para hacer prácticas de sintaxis.

**Importante**
El orden en el que se organizan las reglas del cortafuegos es determinante.
Normalmente, cuando hay que decidir qué se hace con un paquete, se va comparando con cada regla del cortafuegos hasta que se encuentra una que le afecta, match, y se hace lo que dicte esta regla (aceptar o denegar); después de eso __no se mirarán más reglas__ para ese paquete.
¿Cuál es el peligro?
Si ponemos reglas muy permisivas entre las primeras del cortafuegos, puede que las siguientes no se apliquen y no sirvan de nada.
> Se recomienda revisar los ejemplos ofrecidos en el archivo IPtables.pdf, así como todo el contenido del apartado correspondiente.
```

#### Ejercicios 2 -- test

1. El filtrado de paquetes está sujeto a las reglas básicas: **INPUT, OUTPUT, FORWARD.**
2. Los paquetes que atraviesan un cortafuegos pueden ser filtrados: **Por los datos de la cabecera del paquete.**
3. Cuando un paquete no llega a su destino y se informa al emisor de las causas: **El paquete se ha rechazado.**
4. Un cortafuegos se puede clasificar según su área de influencia en: **Personal o SOHO.**
5. La regla que se añade a IPTABLES para no permitir la salida por la interfaz eth1 de paquetes de la red privada 192.168.1.0 es: **iptables -A INPUT -i eth1 -d 192.168.1.0/24 -j DROP.**


### 3

#### Caso práctico 3 -- Ejercicio de cortafuegos

...

#### Ponte a prueba 3 -- Utilización de la tabla nat de IPtables

```md
**Utilización de la tabla nat de IPtables**
Si tenemos una red local a la que hay que proporcionar conexión a Internet y solo disponemos de una dirección IP pública, una posible solución consiste en utilizar la tabla nat de IPtables.
El equipo que va a hacer las veces de cortafuegos debe tener dos tarjetas de red, eth0 y eth1, y detrás de él hay una red local que deberá salir a Internet a través del equipo servidor.
Es decir:
- eth1 escucha la red local (192.168.1.254).
- eth0 conecta el servidor con el router.
Las reglas que hay que activar utilizan comandos de la tabla nat. 
Hay que recordar que nat era la tabla que permitía enmascarar la dirección IP de los paquetes enviados por las máquinas de la red local, como si fuesen todos ellos enviados por el servidor.

Se pide crear un guion que incluya las reglas imprescindibles para dar salida a Internet a la red local.
1. Cargar el módulo nat para IPtables.
2. Establecer la política por defecto de Aceptar.
3. Habilitar la salida de la red local a través de la interfaz de red eth1.
4. Enmascarar la red local a través de eth0.
> El ejercicio es una continuación del cortafuegos básico visto en el Caso práctico del apartado 2. Repasa dicho caso práctico y añade las reglas solicitadas.
```

#### Estudio de caso -- Configuración de cortafuegos: [I](https://drive.google.com/file/d/15HsSEHjpDkZ85hMj0Y7W6yyuPx3gmqO1/view), [II](https://drive.google.com/file/d/1PzqhOCFq4BJkfT-opFhrBzV6QpKhOSem/view)

...

#### Ejercicios 3 -- test

1. De las siguientes afirmaciones, indica cuál es una de las principales ventajas de hping3: **Que puede especificar el número de puerto o el tipo de protocolo.**
2. En referencia a los mensajes recogidos por el log de IPtables, indica la opción correcta: **Los emite el kernel de GNU/Linux.**
3. Indica la función de la siguiente regla IPtables: iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/24 -j SNAT --to-source 172.28.0.254: **Traduce la dirección de origen a 172.28.0.254.**
4. ¿Cuáles de las siguientes son las cadenas de la tabla nat? **PREROUTING y POSTROUTING.**
5. Indica cuál es la afirmación correcta: **SNAT es un objetivo de la tabla nat.**


### 4

#### Caso práctico 4 -- Creación de una VPN (Packet Tracer)

```md
**Enunciado**
Realiza la simulación de una VPN utilizando Cisco Packet Tracer. La topología que se debe utilizar es la que se ofrece en la imagen siguiente.
...

---

**Solución**

**Paso 1. Configurar dispositivos**
Creamos la topología pedida: 2 routers 2811, 2 switch 2950-24 y dos pc, PC0 y PC1.
La tabla de direccionamiento IP indica los valores que asignar a cada dispositivo. Lo hacemos todo desde la pestaña CLI.

**Paso 2. Creación de los segmentos**
Se puede hacer desde la pestaña CONFIG y la opción RIP.
Añadir los dos segmentos de red con los que se encuentra conectado directamente el Router 0. Para ello, escribimos primero la dirección del Segmento 1 y pulsamos Add. Añadir la segunda dirección del Segmento 2. 
Hacer lo equivalente para el Router 1.
Se puede hacer en línea de comando, como lo hemos hecho nosotros.

**Paso 3. Configuración de la VPN**
Router 0 pestaña CLI:
Router>enable
Router#
Router#configure terminal
Enter configuration commands, one per line. End with CNTL/Z.
Router(config)#interface FastEthernet0/0
Router(config-if)#ip address 192.168.10.1 255.255.255.0
Router(config-if)#ip address 192.168.10.1 255.255.255.0
Router(config-if)#ip address 192.168.10.1 255.255.255.0
Router(config-if)#no shutdown
Router(config-if)#
%LINK-5-CHANGED: Interface FastEthernet0/0, changed state to up
%LINEPROTO-5-UPDOWN: Line protocol on Interface FastEthernet0/0, changed state to up

Router(config-if)#exit
Router(config)#interface FastEthernet0/1
Router(config-if)#ip address 10.0.0.1 255.0.0.0
Router(config-if)#ip address 10.0.0.1 255.0.0.0
Router(config-if)#ip address 10.0.0.1 255.0.0.0
Router(config-if)#no shutdown
Router(config-if)#
%LINK-5-CHANGED: Interface FastEthernet0/1, changed state to up
 
Router(config-if)#exit
Router(config)#router rip
Router(config-router)#network 192.168.10.0
Router(config-router)#network 10.0.0.0
Router(config-router)#
%LINEPROTO-5-UPDOWN: Line protocol on Interface FastEthernet0/1, changed state to up

Router(config-router)#exit
Router(config)#crypto isakmp policy 10
Router(config-isakmp)#authentication pre-share
Router(config-isakmp)#hash sha
Router(config-isakmp)#encryption aes 256
Router(config-isakmp)#group 2
Router(config-isakmp)#lifetime 86400
Router(config-isakmp)#exit
Router(config)#crypto isakmp key toor address 10.0.0.2
Router(config)#crypto ipsec transform-set TSET esp-aes esp-sha-hmac 
Router(config)#access-list 101 permit ip 192.168.10.0 0.0.0.255 192.168.20.0 0.0.0.255
Router(config)#crypto map CMAP 10 ipsec-isakmp 
% NOTE: This new crypto map will remain disabled until a peer
   and a valid access list have been configured.

Router(config-crypto-map)#set peer 10.0.0.2
Router(config-crypto-map)#match address 101
Router(config-crypto-map)#set transform-set TSET
Router(config-crypto-map)#exit
Router(config)#interface FastEthernet0/1
Router(config-if)#crypto map CMAP
*Jul. 3 07:16:26.785: %CRYPTO-6-ISAKMP_ON_OFF: ISAKMP is ON
Router(config-if)#do wr
Building configuration...
[OK]
Router(config-if)#

Router 1 pestaña CLI:
Router>enable
Router#
Router#configure terminal
Enter configuration commands, one per line. End with CNTL/Z.
Router(config)#interface FastEthernet0/0
Router(config-if)#ip address 192.168.20.1 255.255.255.0
Router(config-if)#ip address 192.168.20.1 255.255.255.0
Router(config-if)#no shutdown
Router(config-if)#
%LINK-5-CHANGED: Interface FastEthernet0/0, changed state to up
%LINEPROTO-5-UPDOWN: Line protocol on Interface FastEthernet0/0, changed state to up

...

**Paso 4. Pruebas**
En la barra de accesos rápidos hay un sobre cerrado que identifica la opción Add Simple PDU. Lo seleccionamos y, a continuación, clicamos en PC0 y PC1. Y, al contrario, del PC1 al PC0.
Ejecutar los siguientes comandos como prueba de funcionamiento:
Router# show crypto isakmp sa 
Router# show crypto ipsec sa 
El primero muestra la fuente destino y el estado del túnel creado. 
El segundo comando muestra los paquetes que han sido cifrados y descifrados en el túnel creado y más información sobre el túnel. La captura siguiente muestra la salida generada por ambos comandos.

**Paso 5.  Resumen**
Explicamos la función de los comandos utilizados:
- Configurar la política de seguridad.
- Configurar el tipo de protocolos y los algoritmos de encriptación.
- Preparar el par de asociación de seguridad (SA).
- access-list: es la acl que permite la comunicación entre las dos redes.
- set peer: poner la IP del otro router al que se puede enviar tráfico protegido.
- Establecer el set de transformación, que es lo que busca en el otro miembro del par de asociación, y si es el mismo, se aplica la combinación de protocolos de seguridad y algoritmos.
- Aplicar CMAP  a la interfaz: el cripto map es una lista de transformaciones aceptables y hay que explicarle al router cómo evaluar el tráfico contra este mapa y a usar la política.

Los comandos cryto ipsec transform – set auth2 esp-des esp-sha-hmac sirven para la autenticación y la encriptación con el protocolo ipsec.
ESP es el protocolo que ofrece el servicio de confidencialidad, el de autenticación de orden de los datos de los datagramas IP.
crypto map CMAP 10 ipsec–isakmp es el mapa criptográfico  en el que se define el par de claves.
ISAKMP define el formato para el intercambio de generación de claves y los datos de autenticación. Proporciona un marco coherente para la transferencia de claves y datos de autenticación, que es independiente de la técnica de generación de claves, el algoritmo de cifrado y el mecanismo de autenticación.

IPsec es el protocolo sobre la capa de red (IP). Proporciona encapsulamiento y encriptación:
Encapsulated Security Payload (ESP), que protege los datos del paquete IP de interferencias de terceros,  que cifra el contenido utilizando algoritmos de criptografía simétrica (como Blowfish, 3DES).
Authentication Header (AH), que protege la cabecera del paquete IP de interferencias de terceros así como contra la falsificación (spoofing), calculando una suma de comprobación criptográfica y aplicando a los campos de cabecera IP una función hash segura. Detrás de todo esto va una cabecera adicional que contiene el hash para permitir la validación de la información que contiene el paquete.
Pre-shared (clave previamente compartida, clave precompartida o PSK) es una clave secreta compartida con anterioridad entre las dos partes usando algún canal seguro antes de que se utilice.
En el archivo CP_A04.pkt, que tienes en la sección de Ejemplos para trabajar y analizar puedes encontrar la solución al ejercicio.
```

#### Ponte a prueba 4 -- Diseñar y describir los componentes de una red VPN

...

#### Estudio de caso -- [Instalación y configuración de OpenVPN](https://drive.google.com/file/d/1QvnvopLzamCnehaQ_fDeIsMmQON00lxi/view)

- ...
- [ ] https://github.com/angristan/openvpn-install

#### Ejercicios 4 -- test

1. En relación con el protocolo L2TP, indica cuál es la respuesta correcta: **De nivel 2**
2. ¿Cuál de los siguientes no es un modo de conexión de una VPN? **Nivel de aplicación**
3. Selecciona la respuesta correcta desde el punto de vista de un usuario inexperto: **Las VPN con SSL son más sencillas de utilizar.**
4. Indica la respuesta correcta respecto a una red privada virtual VPN: **Encapsula la información.**
5. Para que se pueda establecer una comunicación con SSH... **El receptor debe conocer la clave pública del emisor.**


### 5

#### Caso práctico 5 -- Configuración segura del servicio SSH

```md
**Introducción**
SSH (Secure Shell) es un protocolo seguro muy utilizado en la administración remota de servidores, routers, switches, etc.
El protocolo SSH proporciona:
- Confidencialidad: los datos van cifrados punto a punto.
- Autenticación: frente al servidor SSH mediante usuario/contraseña o criptografía de clave pública; incluso se puede configurar un segundo factor de autenticación. 
- Integridad: utiliza HMAC (Hash-based Message Authentication Code) para comprobar la integridad de los datos. Cualquier modificación es detectada.
Por defecto, SSH utiliza el protocolo TCP de la capa de transporte, y el puerto es el 22, pero si se necesita por seguridad se puede cambiar.

Los métodos de autenticación disponibles en el servidor SSH son los siguientes:
- Usuario y contraseña (algo que sabemos).
- Claves criptográficas (algo que tenemos). 
- Combinación de estas autenticaciones: con un One Time Password generado por una aplicación como Google Authenticator o Latch OTP.

**Enunciado**
Se pide realizar la instalación del servidor OpenSSH y estudiar cómo podríamos asegurar este servicio tan utilizado en las conexiones a servidores remotos para su administración.

---

**Solución**

**Paso 1. Instalación y preparación OpenSSH**
OpenSSH es el programa servidor/cliente SSH más utilizado; es gratuito y de código abierto. 
	$ sudo apt update -y
	$ sudo apt upgrade -y
	$ sudo apt install openssh-server 
El archivo de configuración del servidor SSH es /etc/ssh/sshd_config.
Al instalar el servidor lo deja ejecutándose y escuchando peticiones en el puerto 22. Podemos comprobarlo.
	$ sudo systemctl status ssh
Otras opciones sobre el servicio son:
	$ sudo systemctl start ssh 
	$ sudo systemctl stop ssh 
	$ sudo systemctl status ssh

Si el servicio no se está ejecutando, lo activamos ejecutando:
	$ sudo systemctl enable --now ssh
Para que el cortafuegos permita el acceso al servidor SSH ejecutamos el comando siguiente, que es equivalente a una regla de iptables.
	$ sudo ufw allow ssh
Comprobamos el estado del cortafuegos ejecutando:
	$ sudo ufw status
También podríamos hacerlo desde el entorno grafico del ufw, que es gufw.
En este momento nuestro servidor SSH está en funcionamiento, esperando una conexión de un cliente.

**Paso 2. Lado cliente SSH**
En general, los sistemas basados en GNU/Linux llevan ya instalado el cliente SSH. Si hay que instalarlo, debemos ejecutar el comando:
	$ sudo apt install openssh-client
Para realizar la conexión al servidor SSH hay que conocer la dirección IP de la máquina y ejecutar siguiendo la sintaxis:
	$ ssh nombre_usuario@IPservidor

**Paso 3. Autenticación**
Respecto a la autenticación:
- Usuario y contraseña
Para habilitar el login al servidor SSH a través del usuario y la contraseña del sistema el archivo de configuración deberá tener esta sentencia: 
PasswordAuthentication yes
Por el contrario, si queremos impedir la autenticación a través de usuario/contraseña y permitir únicamente las conexiones a través de clave pública SSH, debemos indicar «no»:
PasswordAuthentication no
Esta sentencia afecta a todos los usuarios del sistema. Para no quedarnos sin acceso al servidor, deberíamos asegurarnos de que la sentencia siguiente está a yes:
PubkeyAuthentication yes
para permitir el inicio de sesión con claves criptográficas.

- Clave pública SSH
Para configurar el acceso con clave pública al servidor hay que indicarlo con:
PubkeyAuthentication yes
Pero para poder establecer conexión con el servidor SSH hay que copiar la clave pública al servidor SSH y para ello habrá que permitir (temporalmente) la autenticación con usuario/contraseña. Una vez copiada, denegamos la autenticación con usuario/contraseña.
De ellas, es más segura la conexión si se definen un par de claves SSH (pública y privada), para lo cual se pueden utilizar diferentes sistemas criptográficos; entre ellos están RSA y el algoritmo de firma digital de curva de Edwards o ed25519, conocido como edDSA (Edwards-curve Digital Signature Algorithm). 
Obtendremos las claves RSA, que suele estar soportado en todos los sistemas. Para ello ejecutamos el comando que muestra la siguiente captura junto con la salida generada.

    $ ssh-keygen -t rsa
Este comando crea en el directorio /home/nombre_usuario/.ssh/ los archivos que contienen las claves pública y privada (id_rsa, id_rsa.pub). Existe un directorio oculto .ssh por cada usuario que haya en el sistema operativo y que se conecte a un servidor remoto por SSH. 
Para poder utilizar estas claves, la pública hay que copiarla al servidor al cual nos queremos conectar vía SSH. Para ello ejecutamos el comando que muestra la siguiente captura junto con la salida generada.
    $ ssh-copy-id user@ip

**Paso 4. Conexión al servidor SSH**
Para hacer la conexión al servidor SSH ejecutar el comando siguiente:
$ ssh elvira@172.20.10.2


**Paso 5. Configuración de sshd_config con máxima seguridad**

**5.1. Cambiar el puerto por defecto del servidor SSH**
Por defecto, el servidor SSH utiliza el puerto 22 para las conexiones; pero si se quiere pasar inadvertido en procesos de escaneos masivos desde Internet (realizados por bots, por ejemplo) es preferible cambiar el puerto.
En /etc/ssh/sshd_config habrá que escribir:
Port 22443
Si reiniciamos el servicio, comprobamos con netstat que cambia el puerto de escucha:
tcp  0 0 0.0.0.0:22443 0.0.0.0:*  ESCUCHAR - 
Si se cambia el puerto para realizar la conexión al servidor SSH habrá que indicar el nuevo puerto con la opción –p (–p 22443).

$ sudo sed -i '/^#Port 22$/s/.*/Port 22443/' /etc/ssh/sshd_config || \
$ sudo sed -i '0,/^\s*#Port/{s/#Port\s*\(.*\)/Port 22443/}' /etc/ssh/sshd_config

**5.2. Bloquear el acceso root en las conexiones remotas**
Por defecto, los bots siempre intentan atacar  al puerto 22 y al usuario root. Desde OpenSSH podemos deshabilitar el login del usuario root para mayor seguridad:
PermitRootLogin no
La opción que viene por defecto es prohibit-password, que significa que se prohíben todos los métodos de autenticación interactivos, permitiendo publickey. Es preferible indicar «no».

**5.3. Otras configuraciones de seguridad**
Entre ellas están: 
- LoginGraceTime: establecemos el tiempo necesario para introducir la contraseña, evitando que el atacante tenga tiempo suficiente para deducir la contraseña.
- MaxAuthTries: número de intentos permitidos al introducir la contraseña antes de desconectar.
- MaxStartups: número de logins simultáneos desde una IP, para evitar que se pueda utilizar la fuerza bruta con varias sesiones a la vez.
Globalmente, los cambios en el archivo de configuración de sshd_config serían:
  Port 22443
  PermitRootLogin no
  LoginGraceTime 30
  MaxAuthTries 3
  MaxStartups 3


**Paso 6. Mitigar los ataques de fuerza bruta en SSH**
Para evitar los ataques de fuerza bruta contra SSH existen diferentes procedimientos y veremos algunos de ellos.

**6.1. IPtables**
Con IPtables podemos limitar el número de conexiones simultáneas al servidor. Una regla IPtables para limitar el número de conexiones sería:
$ sudo iptables -A INPUT -p tcp --dport 22443 -m connlimit --connlimit-upto 5 --connlimit-mask 32 -j ACCEPT 
Esta regla ACEPTA hasta 5 conexiones que provengan de la misma IP pública. Si el equipo dispone de varias interfaces de red con el parámetro –i, indicamos la interfaz en la que se aplica la regla. Si no se indica, se aplica a todas.

**6.2. Fail2ban**
Fail2ban permite bloquear las conexiones remotas que intentan accesos por fuerza bruta; es decir, intentos de conexión fallidos.
Es software libre y está disponible en los repositorios de Ubuntu.
$ sudo apt install fail2ban

La instalación crea un archivo de configuración en /etc/fail2ban/jail.conf. Ahora hacemos una copia de este archivo:
$ sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local 
Creamos con fail2ban una regla personalizada para SSH. Para ello creamos un nuevo archivo de configuración que se encargará de sobrescribir el archivo principal jail.local anterior.
$ sudo gedit /etc/fail2ban/jail.d/sshjail.local 
Y en él escribimos:
  [sshd]
  enabled = true
  port = 22443
  bantime = 3600
  findtime = 600
  filter = sshd
  maxretry = 3 
Reiniciamos fail2ban:
$ sudo /etc/init.d/fail2ban restart 
Los logs de conexión se pueden ver en /var/log/auth.log, y los específicos de fail2ban en /var/log/fail2ban.log.

**6.3. DenyHosts**
DenyHosts tiene acceso a las bases de datos de las IP conocidas como atacantes, vigila los logs de conexión para detectar si estamos ante un ataque de fuerza bruta y comprueba las bases de datos de IP para detectar si son botnets.
$ sudo apt install denyhosts 
En el archivo /etc/hosts.allow ponemos la lista blanca con los equipos que no queremos que bloquee.
$ sudo vi /etc/hosts.allow 
La sintaxis es la siguiente:
     sshd: direccion_IP 
Ahora editamos el archivo de configuración general de DenyHosts:
$ sudo gedit /etc/denyhosts.conf 
Y en él vemos comentadas las diferentes opciones de configuración disponibles. Es similar a fail2ban.

**6.4. SSHGuard**
SSHGuard es un software que también protege al servidor SSH de los intentos de intrusión.
Este programa parsea (analiza sintácticamente) los logs, de diferentes formatos, línea a línea buscando patrones del tipo intentos de login con error, para así bloquear al atacante.
Se integra a nivel de cortafuegos (iptables, ufw, u otros) para insertar reglas de bloqueo en función del servicio protegido. 
$ sudo apt install sshguard
Para integrarlo con IPtables introducimos una serie de cadenas y reglas antes del resto de reglas que tengamos. El orden es importante, ya que la cadena de SSHGuard tiene que aparecer la primera y, a continuación, las otras reglas, para que el tráfico entrante se filtre en la cadena SSHGuard:
$ iptables -N sshguard
Ahora todo lo que llegue por INPUT se le pasa a la cadena SSHGuard para # que decida si se tiene que bloquear o no.
$ iptables -A INPUT -j sshguard
Ahora vamos a comprobar qué archivos está monitorizando por defecto en /etc/sshguard/sshguard.conf.
$ cat /etc/sshguard/sshguard.conf

Las directivas más importantes son las siguientes:
- BACKEND: contiene la ruta del servidor de seguridad del sistema.
- THRESHOLD: indica el número de intentos después de los cuales se bloqueará al usuario.
- BLOCKE_TIME: determina la duración durante la cual el atacante permanecerá prohibido después de sucesivos intentos de inicio de sesión incorrectos.
- DETECTION_TIME: determina el tiempo durante el cual se detecta/graba al atacante.
- WHITELIST_FILE: contiene la ruta al archivo que contiene la lista de hosts conocidos.
Respecto al cortafuegos, para bloquear el ataque de fuerza bruta habrá que configurarlo.
$ sudo gedit /etc/ufw/before.rules
Y en él añadimos las siguientes líneas, justo donde indica la captura siguiente:
:sshguard - [0:0]
-A ufw-before-input -p tcp --dport 22 -j sshguard

Ahora reiniciamos el cortafuegos:
$ sudo systemctl restart ufw
Y solo queda crear la lista blanca, que permitirá a los hosts indicados que puedan iniciar sesión en el sistema sin ninguna restricción. 
$ sudo gedit /etc/sshguard/whitelist
Y reiniciamos el servicio SSHGuard.

Por último, si queremos comprobar la seguridad del servidor SSH existen diferentes herramientas software. Su objetivo es analizar la configuración del servidor y detectar algún agujero de seguridad.
Por ejemplo ssh-audit, que es una herramienta que se instala localmente donde esté el servidor SSH para comprobar la seguridad del servidor.
```

#### Ponte a prueba 5 -- Utilización de SSHFS

```md
**Utilización de SSHFS**
SSHFS es un sistema de archivos que permite al usuario montar directorios remotos en la máquina local de forma segura.
El protocolo SSH cifra la conexión entre la máquina local y remota y, por lo tanto, nadie podrá ver los archivos que se intercambian entre las dos máquinas de la red.
Se pide instalar SSHFS y describir y probar cómo se puede montar un directorio remoto de GNU/Linux Ubuntu en el sistema local Kali.
> Se pueden consultar diferentes fuentes para obtener la información necesaria.
```

#### Ejercicios 5 -- test

1. Un servidor RADIUS... **Es un RAS de autenticación.**
2. En relación con el acceso remoto, indica cuál de las siguientes afirmaciones es correcta: **Todas las respuestas son correctas.**
3. ¿Cuál es la función al utilizar el servidor el certificado digital? **Permite que el usuario, al acceder de forma remota, reciba la firma del servidor y confíe en él para futuras conexiones.**
4. De las siguientes afirmaciones, indica cuál de ellas se identifica con el protocolo CHAP: **Verifica periódicamente la identidad del cliente remoto.**
5. De las siguientes afirmaciones, indica cuál de ellas no se identifica con el protocolo RADIUS: **Utiliza una contraseña cifrada con un algoritmo de cifrado bidireccional.**



## QUIZ
