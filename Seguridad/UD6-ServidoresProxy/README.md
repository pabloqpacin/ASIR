# Seguridad UD5: Servidores Proxy

- [Seguridad UD5: Servidores Proxy](#seguridad-ud5-servidores-proxy)
  - [TEORÍA](#teoría)
  - [PRÁCTICA (McGrawHill)](#práctica-mcgrawhill)
    - [1](#1)
      - [Caso práctico 1 -- Cliente proxy](#caso-práctico-1----cliente-proxy)
      - [Ponte a prueba 1 -- Proxy SOCKS](#ponte-a-prueba-1----proxy-socks)
      - [Ejercicios 1 -- test](#ejercicios-1----test)
    - [2](#2)
      - [Caso práctico 2 -- Filtrado de descargas](#caso-práctico-2----filtrado-de-descargas)
      - [Ponte a prueba 2 -- Configuración del almacenamiento de la caché de un proxy](#ponte-a-prueba-2----configuración-del-almacenamiento-de-la-caché-de-un-proxy)
      - [Ejercicios 2 -- test](#ejercicios-2----test)
    - [3](#3)
      - [Caso práctico 3 -- Configuración básica de Squid](#caso-práctico-3----configuración-básica-de-squid)
      - [Ponte a prueba 3 -- Ejemplos de utilización de ACL y HTTP\_ACCESS](#ponte-a-prueba-3----ejemplos-de-utilización-de-acl-y-http_access)
      - [Estudio de caso -- Filtrado de páginas web HTTP + Control de acecso a Internet](#estudio-de-caso----filtrado-de-páginas-web-http--control-de-acecso-a-internet)
      - [Ejercicios 3 -- test](#ejercicios-3----test)
    - [4](#4)
      - [Caso práctico 4 -- Configurar proxy Squid en modo transparente](#caso-práctico-4----configurar-proxy-squid-en-modo-transparente)
      - [Ponte a prueba 4 -- Configuración de Proxy inverso](#ponte-a-prueba-4----configuración-de-proxy-inverso)
      - [Ejercicios 4 -- test](#ejercicios-4----test)
    - [5](#5)
      - [Caso práctico 5 -- Instalación y configuración de SARG](#caso-práctico-5----instalación-y-configuración-de-sarg)
      - [Ponte a prueba 5 -- Calamaris](#ponte-a-prueba-5----calamaris)
      - [Estudio de caso -- Obtención de informes de Squid](#estudio-de-caso----obtención-de-informes-de-squid)
      - [Ejercicios 5 -- test](#ejercicios-5----test)
  - [QUIZ](#quiz)


## TEORÍA

> apuntes.md

## PRÁCTICA (McGrawHill)

<!-- ### foo -->
<!-- ### bar -->

### 1

#### Caso práctico 1 -- Cliente proxy

```md
**Enunciado**
Se pide averiguar dónde se debe realizar la configuración del cliente proxy en el navegador Firefox.

**Solución**
La configuración en el cliente web Firefox admite varias opciones.
Accede al menú de configuración situado en el extremo derecho de la barra de URL.
La captura siguiente muestra el acceso a la configuración de red en el navegador web Firefox. Para llegar a ella ve a los ajustes del menú de configuración del navegador en: Ajustes > General > Configuración de conexión

Veamos cuándo elegir cada una de las opciones:
- Sin proxy: cuando no se utiliza proxy. 
- Autodetectar configuración del proxy para esta red: cuando Firefox detecta automáticamente los ajustes de proxy en la red. 
- Usar la configuración del proxy del sistema: esta opción utiliza los ajustes de proxy predeterminados del sistema operativo.
- Configuración manual del proxy: cuando hay más de un servidor proxy. Se requiere información de configuración. Cada proxy necesita un hostname y un puerto diferente. 
- No usar proxy para: hay que indicar los nombres o direcciones IP de las páginas que no se quiere que utilicen proxy. 
- URL de configuración automática del proxy: solo si se dispone de un archivo (.pac). Escribir la URL y Recargar para guardar los cambios y que se cargue la configuración del proxy. 
- Habilitar DNS frente a HTTPS: esta opción habilita DNS frente a HTTPS (DoH) usando el servidor especificado. Para más información, consulta el artículo Firefox DNS-over-HTTPS. 
No realizaremos ahora la configuración real del cliente, pero ya tenemos localizado dónde debe ejecutarse.
```

#### Ponte a prueba 1 -- Proxy SOCKS

```md
**Proxy SOCKS**
Se pide averiguar cuál es el significado del proxy SOCKS, qué es y para qué sirve.
> Al ser un ejercicio de investigación, se recomienda encontrar información de fuentes fiables que permitan conocer este tipo de proxy.
```

#### Ejercicios 1 -- test

1. Una página web almacenada en la caché del proxy: **Se recupera a la velocidad de conexión de la LAN.**
2. Un proxy transparente: **Enruta las conexiones al proxy.**
3. Los componentes básicos de un proxy son: **Elementos destino, elementos cliente y reglas de acceso.**
4. La diferencia entre un proxy y un cortafuegos es que: **El proxy puede hacer de cortafuegos.**
5. Cuando se quiere compartir una conexión a Internet entre varios clientes... **Se usa un proxy NAT.**


### 2

#### Caso práctico 2 -- Filtrado de descargas

```md
**Enunciado **
Se quiere bloquear la descarga de determinados tipos de archivo por diversas razones: seguridad, evitar excesivo consumo de ancho de banda, evitar virus, etcétera. Si queremos bloquear la descarga de vídeos, música y ejecutables, podemos filtrar, por ejemplo, los siguientes tipos de archivo:
- mp3
- mpeg
- mpg
- avi
- exe
- pdf
Se pide generar los filtros necesarios en Squid y aplicarlos. Comprobar su funcionamiento con alguna captura.
NOTA: es preferible resolver este caso práctico después de haber leído también el Apartado 3 de la teoría.

**Solución**
Debemos seguir los pasos que se detallan a continuación:

**Paso 1. Crear las ACL**
Abre con un editor el archivo de configuración de Squid (/etc/squid/squid.conf) y busca la sección del archivo donde se encuentran las ACL. 
Crea la acl que identifica la red local:
acl redlocal src 172.20.10.2
Crea una nueva ACL llamada «nodescargas» en /etc/squid/squid.conf que bloquee la descarga de lo especificado en el fichero de texto /etc/squid/reglas/nodescargas.acl:
acl nodescargas urlpath_regex -i "/etc/squid/reglas/nodescargas.acl"

**Paso 2. Crear archivo nodescargas.acl**
Creamos el archivo de texto /etc/squid/reglas/nodescargas.acl con un editor y añadimos el siguiente contenido (no copiar y pegar desde el pdf):
\.exe$
\.avi$
\.mpeg$
\.mpg$
\.mp4$
\.pdf$
Observa que añadimos el carácter «\» delante del punto. El objetivo es «escapar» el «.», que es un comodín del shell.

**Paso 3. Crear regla de bloqueo**
Añadimos la regla que bloquea el acceso a las descargas en /etc/squid/squid.conf:
http_access deny redlocal nodescargas
Se puede utilizar la directiva http_reply_access si se quiere bloquear la respuesta desde el servidor.

**Paso 4. Guardar los cambios**
Guardamos los cambios en el archivo de configuración y reiniciamos el servicio Squid. Comprueba que, cuando se quiere descargar un tipo de archivo prohibido (por ejemplo .avi), Squid no lo permite.

El log de esta conexión nos dice:
1659111149.086 0 172.20.10.2 TCP_DENIED/403 4277 GET http://dist.divx.com/DivXInstaller.exe - HIER_NONE/- text/html
Nota: encontrar páginas HTTP en este momento es complicado y muchas de las descargas de música están cerradas por la autoridad competente, por cuestiones de derechos de autor.
Hay que recordar que Squid es un proxy HTTP y que para filtrar páginas seguras hay que complementar la configuración, como veremos más adelante.

Incluimos el contenido del archivo squid.conf con el que se ha realizado el ejercicio.
#Configuracion básica SQUID
#Parametros administrativos
visible_hostname elvira #hay que adaptar con el nombre de tu maquina (ejecuta el comando hostname en una terminal)
http_port 3128
cache_dir ufs /var/spool/squid/ 500 16 256
access_log /var/log/squid/access.log squid
cache_log /var/log/squid/cache.log
cache_effective_user proxy
acl todo src all
acl redlocal src 172.20.10.2         #adapta a tu red
#CP2
acl nodescargas urlpath_regex -i "/etc/squid/reglas/nodescargas.acl"
#CP2
http_access deny redlocal nodescargas 
#Only allow cachemgr access from localhost
http_access allow localhost manager
http_access deny manager
http_access allow redlocal
http_access deny todo

Observa que se han referenciado acl que no se han definido previamente. Estas acl están implícitas y no hace falta volver a escribirlas. Es el caso de manager y localhost.
```

#### Ponte a prueba 2 -- Configuración del almacenamiento de la caché de un proxy

```md
**Configuración del almacenamiento de la caché de un proxy**
Se pide averiguar cuáles son las directivas necesarias para realizar la configuración de la caché del proxy Squid.
> Se pueden consultar guías de configuración de Squid en Internet.
```

#### Ejercicios 2 -- test

1. De las siguientes opciones, indica cuál es la correcta para la directiva http_access: **Se utiliza para habilitar una ACL.**
2. ¿Cuál es la función de la siguiente línea: acl permite time 8:00-9:00? **Crea una lista de control que puede actuar entre las 8 y las 9.**
3. Una acl para controlar una IP... **Contiene el parámetro src.**
4. ¿Cuál es la función de la siguiente línea: cache_dir ufs /var/spool/squid/ 10 16 256? **Especifica la ubicación y el tamaño de la caché.**
5. La línea http_port 1.1.1.1:3128 escrita en el archivo squid.conf... **Especifica la interfaz por la que escucha el proxy.**


### 3

#### Caso práctico 3 -- Configuración básica de Squid

```md
**Enunciado** 
Vamos a definir las ACL y las reglas de control de acceso correspondientes para una configuración mínima del proxy en un servidor que tiene dos interfaces de red. Una de ellas atiende a la red local 192.168.1.0/24 y la otra da acceso a Internet.

**Solución**

**A. Creación de las ACL básicas para una configuración mínima**
      acl todo src all
      acl manager proto cache_object 
      acl localhost src 127.0.0.1
      acl redlocal src 192.168.1.0/255.255.255.0 
Explicación de cada una de ellas: 
- La primera ACL, llamada todo, comprende todas las redes. Una configuración mínima debe incluirla siempre. De esa forma, una vez permitidos los accesos a Squid que interesen, se puede, con esta ACL, denegar los que procedan de cualquier otra red.
- La segunda ACL, llamada manager, es muy importante. En ella se establece que la comunicación entre el administrador de la caché y Squid se hace mediante el protocolo cache_object. Una configuración mínima debe incluirla siempre.
- La tercera ACL, llamada localhost, identifica a la propia máquina. No es necesaria, pero es importante conocerla.
- La cuarta ACL, llamada redlocal, identifica la red local del aula.

**B. Creación de las reglas de control de acceso correspondientes a las ACL generadas**
      http_access allow localhost
      http_access deny manager !localhost
      http_access allow redlocal
      http_access deny todo
- La regla http_access, aplicada sobre la ACL llamada localhost, indica que está permitido el acceso a Squid para todas las peticiones HTTP originadas desde la IP 127.0.0.1.
- La regla http_access, aplicada sobre las ACL llamadas manager y localhost, bloquea el protocolo específico «cache_object». Este protocolo, propio de Squid, devuelve información sobre cómo está configurada la caché; por ello se deniega cualquier petición que intente utilizar ese protocolo menos a localhost (por eso lleva el carácter '!'). 
- La regla http_access, aplicada sobre la ACL llamada redlocal, indica que está permitido el acceso a Squid para todas las peticiones HTTP cuyo origen sea la red 192.168.1.0/24.
- La regla http_access, aplicada sobre la ACL llamada todo, indica que no está permitido el acceso a Squid desde cualquier IP que no sea de las dadas en las líneas anteriores. Si esta línea estuviera la primera dejaría sin efecto a las restantes.

A continuación incluimos un ejemplo de configuración básica de squid.conf. Para utilizar este archivo y hacer pruebas hay que adaptarlo a los datos del equipo servidor proxy.

#Configuracion básica SQUID
#Parametros administrativos
visible_hostname nombre_maquina
http_port 3128
cache_dir ufs /var/spool/squid/ 1000 16 256
access_log /var/log/squid/access.log squid
cachemgr_passwd password all
cache_effective_user proxy
dns_nameservers 8.8.8.8 8.8.4.4
hosts_file /etc/hosts

#Configuración personal
acl all src all
acl manager proto cache_object 
acl localhost src 127.0.0.1
acl redlocal src 172.20.10.2
http_access allow localhost redlocal
http_access deny manager !localhost
http_access deny all

**NOTA**: antes de aplicar cualquier modificación sobre el archivo de configuración original de Squid hay que hacer una copia de él.
El archivo anterior que hemos generado nosotros puede sustituir al del sistema, siempre que la adaptación a la máquina y a la red sea la correcta y al ejecutar el parse sobre él no dé ningún error de sintaxis.
```


#### Ponte a prueba 3 -- Ejemplos de utilización de ACL y HTTP_ACCESS

```md
**Ejemplos de utilización de ACL y HTTP_ACCESS_**
Antes de comenzar hay que configurar el navegador web para obtener los resultados que buscamos. Debemos ir a las preferencias del navegador y en la configuración de la red activar la opción de Configuración manual del proxy, poniendo como IP la de la propia máquina real y como puerto 3128.
Para hacer las pruebas hay que adaptar el archivo básico de configuración (CP A3) a las IP utilizadas por el alumnado.
Se pide:
1. Definir una ACL para las direcciones IP correspondientes a la red local.
2. Definir una ACL con las direcciones IP de los equipos de la red local almacenadas en el archivo /etc/squid/redlocal (una IP por línea).
3. Definir una ACL específica de Google para luego denegar o aceptar el acceso a Google.
4. Ejemplos de utilización de time: 
  4.1. Definir una ACL con un marco horario de lunes a viernes de 9 a 17 horas.
  4.2. Definir una ACL con un marco horario de 9 a 14 horas para cualquier día de la semana.
5. Ejemplos de utilización de url_regex:
  5.1. Definir una ACL con un patrón que identifica las URL que contienen la cadena gva.
  5.2. Definir una ACL con un patrón que identifica las URL que contienen el carácter (?). El patrón establecido lleva el carácter «\» delante, ya que, al ser «?» un carácter comodín del shell, si se le quiere eliminar este significado debe ir con escape «\».
6. Permitir el acceso a Squid a los equipos incluidos en la ACL llamada redlocal (punto 1).
7. Si dentro de redlocal hay equipos a los que no se quiere dar acceso se utiliza el carácter (!) para excluirlos. Crear otra ACL con las máquinas no permitidas (archivo «no_permitidos»).
8. Definir una ACL que seleccione el puerto 443 (o el 80) para luego aceptar o denegar conexiones a ellos.
```

#### Estudio de caso -- [Filtrado de páginas web HTTP](https://drive.google.com/file/d/1h9Stwu_1SlYfkMlGgS1nrM9kaKo15M4x/view) + [Control de acecso a Internet](https://drive.google.com/file/d/1CUy_UgaprGRBnwEP7sxGpB0M4Vw7KXMr/view)

...

#### Ejercicios 3 -- test

1. El parámetro empleado en squid.conf para poder requerir autenticación a los usuarios es: **auth_param.**
2. El módulo de software que se utiliza en la autenticación de usuarios con Squid es: **ncsa_auth.**
3. La línea htpasswd -c /etc/squid/uno dos: **Añade el usuario dos al archivo uno.**
4. Indica el significado de la siguiente ACL: acl todos src 0.0.0.0/0.0.0.0 **Identifica todos los equipos de la red.**
5. El tipo de ACL urlpath_regex: **Identifica la URL quitando la parte del protocolo y el hostname.**



### 4

#### Caso práctico 4 -- Configurar proxy Squid en modo transparente

```md
**Enunciado**
Dado el siguiente esquema de red, se pide:
- Hacer una copia del archivo de configuración de Squid.
- Incluir directivas específicas en la configuración de Squid. Prohibir, por ejemplo, ciertas palabras.
- Realizar la configuración de IPtables en el proxy.
- Configurar el cliente web.

**Solución**
El esquema de red dispone de tres zonas diferenciadas:
- Internet: comprenderá el tramo entre Internet y la interfaz pública de Internet. La IP puede ser estática o dinámica.
- Router-Servidor Proxy: tramo de red que une la interfaz «externa» del servidor Proxy a una de las bocas del router que da acceso a Internet.
- LAN Clientes: están en una red diferente a la del tramo entre el Router-Servidor Proxy.
El equipo Servidor Proxy dispone de dos interfaces de red: eth0 192.168.1.10/24 (Internet) y eth1 172.20.10.1/24 (LAN).


**Paso 1. Hacer una copia del archivo de configuración de Squid**
Por seguridad hacemos una copia del archivo de configuración.
$ cp /etc/squid/squid.conf /etc/squid/squid.conf.copia

**Paso 2. Incluir directivas específicas**
Las directivas que vamos a incluir en el archivo de configuración son las siguientes:
- Puerto: http_port 3128 transparent
- Memoria de la cache: cache_mem 64 MB
- Directorio de caché: cache_dir ufs /var/spool/squid 500 16 256
- ACL para la red local: acl redlocal src 172.20.10.0/28 
- ACL para la máquina local: acl localhost src 127.0.0.1/32
- ACL de prohibición de ciertas palabras: acl prohibidas url_regex "/etc/squid/bloqueos/prohibidas"
- Permitimos accesos desde la red local y bloqueamos palabras: http_access allow redlocal !prohibidas
- Permitimos accesos desde localhost: http_access allow localhost
- Denegamos todo lo que no se haya permitido previamente: http_access deny todo

Para que funcione con HTTPS (usa el puerto 443) será necesario añadir estas 2 líneas al archivo de squid.conf:
acl port_443 port 443
http_access allow port_443

En el archivo de «prohibidas» se irán poniendo las palabras que serán bloqueadas por el proxy. Cada palabra en una línea. (por ejemplo: sex, terrorismo, fake, casino).
Reiniciamos el servicio:
$ systemctl restart squid

**Paso 3. Configuración de IPtables en el proxy**
Activamos el IP FORWARD en el servidor y hacemos que el tráfico que salga de la LAN hacia el exterior por el puerto 80 y 443 se reenvíe al 3218 de localhost para cachear. 

Aquí es donde el proxy transparente «actúa», de forma que los usuarios no deben hacer nada en el navegador para navegar a través del proxy squid. 
$ echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A PREROUTING -p tcp -s 172.27.1.0/24 --dport 80 -j REDIRECT --to-port 3128
iptables -t nat -A PREROUTING -p tcp -s 172.27.1.0/24 --dport 443 -j REDIRECT --to-port 3128
iptables -t nat -A POSTROUTING -s 172.27.1.0/24 -d 0.0.0.0/0 -o eth0 -j MASQUERADE


**Paso 4. Configuración de los clientes**
En los equipos clientes, la ventaja de usar Squid en Modo Transparente es que no debemos configurar la dirección de nuestro proxy, ya que esto se hará de forma automática y de forma transparente en el proxy gracias a IPtables.
Marcamos Sin proxy.
Para comprobar si estamos usando la caché del proxy, podemos mirar en los logs de Squid las últimas líneas con la orden:
$ tail -f /var/log/squid/access.log 
donde podremos ver principalmente los TCP_HIT y TCP_MISS de las peticiones realizadas por los clientes de la LAN.
```

#### Ponte a prueba 4 -- Configuración de Proxy inverso

```md
**Configuración del proxy inverso**
Se pide definir, a nivel teórico y en general, cuáles son los requerimientos para configurar un proxy inverso.
> Se trata de una tarea de investigación por parte del alumnado. Se puede acceder a información web contrastada que explique el proceso.
```

#### Ejercicios 4 -- test

1. Un proxy transparente... **Enruta las conexiones al proxy.**
2. Cuando se utiliza un proxy transparente... **En el proxy se debe crear al menos una regla de cortafuegos.**
3. Indica el objetivo de la siguiente regla de IPtables: iptables -t nat -A PREROUTING -i eth1 -p tcp –dport 80 -j REDIRECT --to-port 3128: **Redirigir el tráfico que venga por la LAN hacia el puerto 80 que vaya al puerto 3128.**
4. Indica cuál de las siguientes no es una función del proxy inverso: **No realizar ninguna configuración en el cliente.**
5. Indica cuál de las siguientes afirmaciones es correcta en relación con el proxy inverso: **Su configuración no requiere reglas de cortafuegos.**


### 5

#### Caso práctico 5 -- Instalación y configuración de SARG

...

#### Ponte a prueba 5 -- Calamaris

...

#### Estudio de caso -- [Obtención de informes de Squid](https://drive.google.com/file/d/1ZFOd9H3ddhmi9oKsJSl1wYjy6pT5YSD9/view)

#### Ejercicios 5 -- test

1. Las incidencias de arranque del servicio Squid se almacenan en el archivo siguiente: **/var/log/squid/cache.log**
2. El código TCP_MISS de los logs de Squid indica lo siguiente: **Se realizará una búsqueda nueva porque no hay copia en la caché.**
3. El código de resultado NONE indica que: **La página web solicitada está en la caché.**
4. De las siguientes afirmaciones, indica cuál de ellas no es una funcionalidad de Sarg: **Impedir que un equipo se conecte.**
5. La orden que permite hacer un seguimiento en tiempo real de la generación de logs por parte de Squid es: **tail –f archivo_logs**



## QUIZ
