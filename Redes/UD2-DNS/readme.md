# Redes UD2: DNS

- [Redes UD2: DNS](#redes-ud2-dns)
  - [TEORIA](#teoria)
  - [PRACTICAS](#practicas)
    - [DNS en Ubuntu Server](#dns-en-ubuntu-server)
    - [DNS en Windows Server](#dns-en-windows-server)
    - [McGrawHill](#mcgrawhill)
      - [1](#1)
        - [Caso práctico 1 -- ubicación servidores raíz](#caso-práctico-1----ubicación-servidores-raíz)
        - [Ponte a prueba 1 -- TLD de dominios](#ponte-a-prueba-1----tld-de-dominios)
        - [Ejercicios 1 -- test](#ejercicios-1----test)
      - [2](#2)
        - [Caso práctico 2 -- directivas en clientes DNS](#caso-práctico-2----directivas-en-clientes-dns)
        - [Ponte a prueba 2 -- COMANDOS](#ponte-a-prueba-2----comandos)
        - [Estudio de caso -- Funcionamiento cliente DNS en GNU/Linux](#estudio-de-caso----funcionamiento-cliente-dns-en-gnulinux)
        - [Ejercicios 2 -- test](#ejercicios-2----test)
      - [3](#3)
        - [Caso práctico 3 -- parámetros SOA](#caso-práctico-3----parámetros-soa)
        - [Ponte a prueba 3 -- identificar recursos...](#ponte-a-prueba-3----identificar-recursos)
        - [Ejercicios 3 -- test](#ejercicios-3----test)
      - [4](#4)
        - [Caso práctico 4 -- `named-checkconf` VS `named-checkzone`](#caso-práctico-4----named-checkconf-vs-named-checkzone)
        - [Ponte a prueba 4 -- zona Inversa a partir de Directa](#ponte-a-prueba-4----zona-inversa-a-partir-de-directa)
        - [Estudio de caso -- Creación vistas Intranet/Extranet](#estudio-de-caso----creación-vistas-intranetextranet)
        - [Ejercicios 4 -- test](#ejercicios-4----test)
      - [5](#5)
      - [Caso práctico 5 -- DNS-O-Matic](#caso-práctico-5----dns-o-matic)
      - [Ponte a prueba 5 -- DDNS con BIND + DHCP](#ponte-a-prueba-5----ddns-con-bind--dhcp)
      - [Estudio de caso -- DDNS en router de ISP](#estudio-de-caso----ddns-en-router-de-isp)
      - [Ejercicios 5 -- test](#ejercicios-5----test)
  - [QUIZ](#quiz)


## TEORIA

> [apuntes.md](/Redes/UD2-DNS/apuntes.md)

## PRACTICAS

### DNS en Ubuntu Server

> foo

### DNS en Windows Server

> ...

### McGrawHill

#### 1

##### Caso práctico 1 -- ubicación servidores raíz

```md
Inicialmente, solo existían trece servidores raíz. Hoy en día, existen por todo el mundo otros muchos equipos espejo que contienen información copia de alguno de los principales. 
Contienen información para resolver en el dominio raíz; esa información indica cuáles son esos servidores y qué direcciones IP tienen, así como cuáles son los nombres y direcciones IP de los servidores de dominios de primer nivel (TLD). Por ejemplo, informa de cuáles son las direcciones IP de los servidores DNS del dominio .es. 
Los trece servidores raíz se enumeran según las primeras letras del abecedario y están en manos de diferentes organismos y corporaciones independientes, principalmente universidades, empresas privadas y organismos relacionados con el ejército de EE. UU.
Investiga y averigua cuáles son y dónde se encuentran, bajo qué entidad u organización.
```
```md
Diez están situados en Estados Unidos, y los otros tres, del resto del mundo, en Europa y Japón:
1. Servidor B: Instituto de Ciencias de la Información de la Universidad del Sur de California (EE. UU.). 
2. Servidor C: PSINet (Virginia, EE. UU.).
3. Servidor D: Universidad de Maryland (EE. UU.).
4. Servidor E: NASA (Mountain View, California, EE. UU.).
5. Servidor F: Internet Software Consortium (ISC.org) (Palo Alto, California, EE. UU.).
6. Servidor G: Agencia de Sistemas de Información de Defensa (California, EE. UU.).
7. Servidor H: Laboratorio de Investigación del Ejército (Maryland, EE. UU.).
8. **Servidor I: NORDUnet (Estocolmo, Suecia).**
9. Servidor J: (TBD) (Virginia, EE. UU.).
10. **Servidor K: RIPE-NCC (Londres, Reino Unido).**
11. Servidor L: (TBD) (California, EE. UU.).
12. **Servidor M: Wide Project, Universidad de Tokio (Japón).**

Puedes ver todas las réplicas que existen actualmente en https://root-servers.org; por ejemplo, en nuestro país hay algunas en Madrid, Barcelona y Málaga.
```

##### Ponte a prueba 1 -- TLD de dominios

```md
**Busca en qué TLD se han registrado**
Haz una búsqueda de los siguientes dominios: 
- El de la Unión Europea en castellano.
- El de la residencia del presidente del gobierno de nuestro país.
- El de tu comunidad autónoma.
- El de tu ayuntamiento.
- El de tu centro educativo.
¿Qué tipo de TLD es cada uno de ellos? Explícalo.
```

> ...

##### Ejercicios 1 -- test

1. Un dominio tiene un nombre, y todos sus miembros comparten el mismo: **VERDADERO**
2. Señala las afirmaciones correctas sobre un FQDN: **Siempre termina en un punto, que va implícito, que hace referencia al dominio raíz.**
3. El elemento más a la izquierda del nombre de dominio completo representa siempre el nombre del equipo o un alias: **VERDADERO**
4. Los dominios y sus subdominios se separan exclusivamente con guiones: **FALSO**
5. La jerarquía de dominios es descendente, del nivel superior hacia los inferiores, pero el nombre de domino completo se lee al revés, de izquierda a derecha: **VERDADERO**
6. Podemos tener dos nombres de dominio completos que se llamen igual: **FALSO**
7. Podemos crear alias de nombres sobre los equipos de máquinas: **VERDADERO**
8. Si tenemos un servidor que resuelve en el dominio `mheducation.com`, la dirección IP de ese servidor se encuentra almacenada... **En el servidor de mheducation.com y en los servidores primer nivel del dominio .com.**
9. El dominio de primer nivel .net es un dominio de tipo sTLD: **FALSO**

#### 2

##### Caso práctico 2 -- directivas en clientes DNS

```md
Como ya sabemos, al cliente del servicio de DNS se llama resolutor. El resolutor (resolver) es parte de una biblioteca de funciones (similares a las rutinas) de C que se enlazan a otros programas que necesitan utilizarlas para consultar un servidor DNS. Esto se realiza de forma transparente para el usuario. Las tareas del resolutor son:
- Interrogar al servidor de nombres.
- Interpretar respuestas (que pueden ser registros RR o errores).
- Devolver información al programa que la solicita.
El resolutor de GNU/Linux posee una configuración muy sencilla, que se realiza a través del archivo **/etc/resolv.conf**. Investiga para qué sirven las directivas *nameserver*, *domain*, *search* y *options*.
```
```md
La directiva **nameserver** indica la dirección IP de los servidores de DNS primario y secundario que hay que utilizar, definidos cada uno a través de una directiva diferente. El resolutor lanzará la consulta en el orden en que aparecen definidos. Si no se indica ningún servidor, se asume el local. El algoritmo para consultar un conjunto de servidores consiste simplemente intentar con uno de ellos; si transcurre un tiempo determinado sin obtener respuesta, se intenta con otro, hasta probar con todos. Luego se reintenta con todos nuevamente, hasta que se alcance el número máximo de reintentos.

La directiva **domain** indica el dominio por defecto. Si no está, se asume el nombre de dominio obtenido a partir del nombre local con hostname (del primer punto hacia adelante), y, si este no existe, se asume el dominio raíz. Por ejemplo:

`domain mgrawSRI.lan`

Si no existe esta línea en el archivo `/etc/resolv.conf` y la máquina local se llama 'servidor1.mgrawSRI.lan', se toma por defecto, como nombre de dominio, a partir del primer punto hacia la derecha ('mgrawSRI.lan').

La directiva **search** especifica la lista de dominios donde se harán las consultas. Por defecto, esta lista solo contiene el nombre del dominio local y de todos los dominios que lo contienen, excluyendo el de primer nivel y el dominio raíz. Por ejemplo:

`search mgrawSRI.lan`

Las directivas **domain** y **search** son mutuamente excluyentes; es decir, la última que se indica sobrescribe el valor de la anterior. 

La directiva **options** permite modificar el valor de algunos atributos internos del resolutor. Se expresa de la forma:

`options <opcion1> <opcion2> ... <opcionN>`

Las opciones más importantes son las siguientes:
- **debug** cambia el modo del resolutor, para que genere hacia la salida estándar información adicional acerca de su funcionamiento.
- **timeout:<n>** indica el tiempo en segundos que espera el resolutor la respuesta de un servidor de nombres de dominio. Por defecto, tiene un valor de 5 segundos.
- **attempts:<n>** indica el número de intentos que realiza el resolutor con cada servidor hasta obtener una respuesta. Por defecto, tiene un valor de 2 intentos.
```

##### Ponte a prueba 2 -- COMANDOS

```md
**¿Qué información podemos obtener de estos comandos?**
Veamos qué información podemos obtener de las diferentes herramientas que tenemos a nuestro alcance para lanzar todo tipo de consultas DNS desde nuestro equipo como clientes DNS.
```
```md
Las más utilizadas desde la terminal para realizar consultas DNS son:
- La orden **ping** o la **fping** con funciones extra.
- La orden **host**.
- La orden **dig**.
- La orden **nslookup**.
Investiga su sintaxis y trata de hacer consultas directas con todas ellas, para ver qué te puede aportar cada una.
```

##### Estudio de caso -- Funcionamiento cliente DNS en GNU/Linux

> ...

```bash
less /etc/host.conf
ss -lun
sudo nvim /etc/systemd/resolved.conf && sudo systemctl restart systemd-resolved
# ...
``` 

##### Ejercicios 2 -- test

1. Los clientes DNS realizan sus consultas a través del resolutor (resolver): **VERDADERO**
2. En un proceso de resolución del nombre DNS de www.mheducation.com, un servidor del dominio .com le envía a un servidor raíz la IP de www.mheducation.com. Señala cuál de las siguientes afirmaciones es correcta para esta situación: **Se está realizando una resolución RECURSIVA.**
3. En un proceso de resolución del nombre DNS de www.mheducation.com, un servidor del dominio .com le envía a nuestro servidor DNS directamente la IP de www.mheducation.com. Señala cuál de las siguientes afirmaciones es correcta para esta situación: **Se está realizando una resolución ITERATIVA.**
4. El puerto 53 es donde están escuchando los servidores las peticiones DNS de los clientes: **VERDADERO**
5. En la resolución directa, se busca por cierta IP para averiguar su nombre DNS: **FALSO**

#### 3

##### Caso práctico 3 -- parámetros SOA

- Dado este SOA en formato segundos, calcula los valores equivalentes de sus parámetros en formato de semanas, días, horas o minutos.

```conf
mcgrawSRI.com.   IN    SOA (2022062902    21600    7200    1209600    43200)
mcgrawSRI.com.   IN    SOA (2022062902    6H       2H      2W         12H)
```

##### Ponte a prueba 3 -- identificar recursos...

```conf
# Descifra qué registros de recursos hay en el dominio mcgrawSRI.lan
# Queremos que identifiques cada recurso e indiques su función en esta zona.

mcgrawSRI.lan. IN SOA servidor1.mcgrawSRI.lan. admin.mcgrawSRI.lan (1242759044 10800         3600           604800       38400 )

mcgrawSRI.lan.            	IN     NS servidor1.mcgrawSRI.lan. 

mcgrawSRI.lan.             	IN     NS servidor2.mcgrawSRI.lan. 

mcgrawSRI.lan.             	IN     MX   10      192.168.123.123

servidor1.mcgrawSRI.lan.  	IN     A        	192.168.123.123 

servidor2.mcgrawSRI.lan. 	IN     A            192.168.123.123 

pc1.mcgrawSRI.lan.        	IN     A            192.168.123.101 

pc2.mcgrawSRI.lan.        	IN     A            192.168.123.102 

www.mcgrawSRI.lan.         	IN     CNAME        servidor1.mcgrawSRI.lan.   

ftp.mcgrawSRI.lan.         	IN     CNAME        servidor1.mcgrawSRI.lan.   

smtp.mcgrawSRI.lan.        	IN     CNAME        servidor1.mcgrawSRI.lan.   

# Esta versión funciona con direcciones absolutas; investiga cómo puede crear una versión equivalente con direcciones relativas utilizando el símbolo @.

; Algunas de las cuestiones que has de averiguar son:

; ¿Qué tipo de zona tenemos creada?
; ¿Cómo se llama el nombre de dominio?
; ¿Cuál es el correo de contacto?
; ¿Cuántos tipos de registros hemos creado?
; ¿Qué hace cada uno de ellos?
```

##### Ejercicios 3 -- test

1. Existen cuatro tipos diferentes de servidores DNS: primario, secundario, caché y reenviador: **VERDADERO**
2. Podemos realizar modificaciones en una zona secundaria: **FALSO**
3. Una zona primaria contiene una copia del contenido de una zona secundaria: **FALSO**
4. Una zona secundaria se puede usar para resolver nombres: **VERDADERO**
5. Las zonas sirven para resoluciones directas, pero también para resoluciones inversas: **VERDADERO**
6. Una zona slave es una zona secundaria: **VERDADERO**
7. Un servidor DNS es autoritario sobre zonas primarias, pero no sobre las secundarias: **FALSO**
8. ¿Qué podemos hacer si tenemos un servidor DNS con la zona correspondiente a un dominio dividido en subdominios?
   1. **Que el servidor delegue en otras zonas la resolución de los nombres de los miembros de los subdominios.**
   2. **Que el servidor tenga una sola zona para resolver nombres en todo el dominio.**
9. En los registros de recursos, el campo de marca de tiempo de vida es un campo obligatorio: **FALSO**
10. El tipo de registro PTR de la clase IN sirve para las búsquedas inversas: **VERDADERO**


#### 4

##### Caso práctico 4 -- `named-checkconf` VS `named-checkzone`

```md
Averigua qué diferencia existe entre la utilidad named-chekconf y la utilidad named-chekzone, y cómo has de ejecutarlas para verificar que todas las modificaciones hechas sobre el archivo named.conf han sido correctas.
```

```md
Como es de esperar, sirve para cosas diferentes: la primera, **named-checkconf**, no requiere parámetros para ejecutarse y se centra en informar de posibles errores que podamos haber introducido en el fichero /etc/bind/named.conf.local mientras lo modificábamos.
En cambio, la segunda, **named-checkzone**, trata de encontrar errores en el fichero de registro de recursos (RR) que le indiquemos como parámetros: el dominio y el fichero donde se encuentra. En nuestro ejemplo, de mcgrawSRI.local.

Ejemplo resolución directa:
$ named-checkzone mcgrawSRI.local /var/lib/bind/mgrawSRI.local.hosts

Ejemplo resolución inversa:
$ named-checkzone 123.168.192.in-addr.arpa /var/lib/bind/192.168.123.rev 
```

##### Ponte a prueba 4 -- zona Inversa a partir de Directa

```md
**Crea la zona inversa a partir de la zona directa**

$ORIGIN mcgrawSRI.lan.
@ IN SOA servidor1 admin (1242759044   10800    3600      604800       38400)
@         		IN     NS             servidor1
@          		IN     NS             servidor2
@          		IN     MX     10      192.168.123.123
servidor1     	IN     A              192.168.123.123 
servidor2     	IN     A              192.168.123.124 
Pc1      		IN     A              192.168.123.101 
Pc2     		IN     A              192.168.123.102 
www           	IN     CNAME          servidor1 
ftp        		IN     CNAME          servidor1
smtp          	IN     CNAME          servidor1

Si una zona de resolución inversa sirve para justo lo contrario de lo que se hace en una zona directa, y conocemos los valores de la zona directa, ¿podemos construir la zona inversa?
```

```md
- En nuestro caso, partimos del ID de red del segmento LAN de nuestra intranet; es 192.168.123.0/24. Con este ID de red, tenemos el bloque de direcciones que va desde la 192.168.123.0 hasta la 192.168.123.255, y de momento solo hemos utilizado cuatro.
- Nuestra directiva $ORIGIN mcgrawSRI.lan ahora deberá contener las IP inversas con el dominio especial de infraestructura .in-addr.arpa. para IPv4.
- En una zona de resolución inversa se almacenan solo los registros de tipo PTR asociados cada uno con una dirección IP de tipo A o AAAA.
- Hemos de mantener los servidores de nombres NS que tengamos en nuestra zona.
```

##### Estudio de caso -- Creación vistas Intranet/Extranet

> ...

##### Ejercicios 4 -- test

1. Para instalar el servidor DNS en GNU/Linux ejecutaremos $ sudo apt install named: **FALSO**
2. Los archivos de configuración del servidor DNS BIND en GNU/Linux están en /etc/bind: **VERDADERO**
3. Respecto a los archivos de configuración de BIND:
   <!-- - El archivo named.conf.default-zones contiene la información de las zonas por defecto del espacio de nombres. -->
   <!-- - El archivo named.conf.local contiene la información de las zonas creadas por defecto al instalar BIND. -->
   - El archivo `named.conf.options` contiene la información de las opciones globales del servidor.
   - El archivo `named.conf` incluye en su configuración el contenido de los tres anteriores (`named.conf.options`, `named.conf.default-zones` `named.conf.local`).
4. En BIND podemos definir tantas acl de listas de direcciones IP como necesitemos: **VERDADERO**
5. En BIND podemos utilizar cinco tipos de zonas: master, slave, hint, forward y view: **FALSO**


#### 5

#### Caso práctico 5 -- DNS-O-Matic

```md
Regístrate en el servicio DNS-O-Matic (https://www.dnsomatic.com) y averigua el listado completo de todos los proveedores de DDNS con los que puede trabajar.

> ...
La principal ventaja de DNS-O-Matic es que no pretende ofrecer el servicio de DDNS, sino que es la opción intermedia para unir el servicio DDNS que elijamos —por ejemplo, DuckDNS— con nuestro rúter, ya que DuckDNS no aparece en el listado de nuestro rúter, pero DNS-O-matic sí que está disponible. Al mismo tiempo, nos permite enlazar más de un dominio (que no hace falta que sea el mismo servicio DDNS) con la IP dinámica de nuestro rúter.
Y el listado completo de los 58 proveedores de DDNS con los que puede trabajar DNS-O-Matic (a fecha de julio de 2022) se compone de todos estos:
activeDNS, afraid.org, ALL-INKL.COM, ChangeIP, city|network, CloudFlare, ClouDNS, deSEC, DLinkDDNS, DNS Made Easy, DNSexit, DSL Reports Monitor, DuckDNS, dy.fi, dynaccess.de, DynDNS, dyndns.berlin, dyndns.it, dyndnsfree.de, DynDNSService, DynIP, dynu, easyDNS, eNom, EntryDNS, freedyn.de, Google Domains, ratisdns.de, HE DNS, internet.bs, Loopia, MyOnlinePortal, NameCheap, nic.ru, Night Owl DDNS, No-IP, nsupdate.info, nubem, OpenDNS, Oray, OVH, PubYun, regfish, SafeDNS, Security Space, selfHOST.de, servermaster.de, Sitelutions, SPDNS, STRATO, Tekea, Tunnelbroker, WorldWideDNS.net, yDNS, zone.be y ZoneEdit.
Nosotros deberemos elegir el que más nos interese, por precio o por prestaciones.
```

#### Ponte a prueba 5 -- DDNS con BIND + DHCP

```md
**Creamos DDNS con BIND + DHCP Server**
Ambos servidores están desarrollados por ISC y podemos hacer que ambos servicios trabajen coordinados como si fueran solo uno, como pasa en otros servidores, como el Dnsmasq. Averigua los pasos que se deben realizar y qué parámetros requieren ambos servidores para confiar entre ellos y funcionar como uno solo. Crearemos las zonas estáticas de mgrawSRI.lan en zonas dinámicas.

- Convertir las zonas directa e inversa de mgrawSRI.lan en zonas dinámicas.
- Requeriremos crear la clave de autenticación compartida con la orden ddns-confgen.
- Copiar la clave compartida en nuestra configuración de BIND en la directiva key "ddns-key".
- Probaremos a crear un nuevo equipo dinámico Prueba.mcgrawSRI.lan.
- Congelaremos la zona directa con la orden rndc y desharemos los cambios de la Prueba.
- Congelaremos la zona inversa con la orden rndc y desharemos los cambios de la Prueba.
- Copiar la clave compartida en nuestra configuración de DHCP Server en la directiva key "ddns-key".
```

#### Estudio de caso -- DDNS en router de ISP

> ...


#### Ejercicios 5 -- test

1. El servicio DDNS surge por la escasez de IPv4: **VERDADERO**
2. Solo podremos montarnos un servidor web en nuestro equipo con DDNS: **FALSO**
3. ¿Qué servicio DDNS permite ser reutilizado por otros servicios DDNS? **dnsomatic.com**
4. El servicio DDNS también se utiliza para sincronizar el servicio DNS y el servicio DHCP entre ellos: **VERDADERO**
5. El servicio DuckDNS funciona mediante una API HTTP, en modo seguro, con un certificado SSL firmado de 128 bits válido: **FALSO**


## QUIZ
