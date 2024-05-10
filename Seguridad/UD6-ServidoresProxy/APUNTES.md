# Unidad 6 McGrawHill <br> Instalación y configuración de servidores proxy

```md
# Objetivos
1. Conocer el concepto de servidor proxy y sus principales características.
2. Realizar la instalación y configuración básica de un servidor proxy-caché.
3. Aprender a configurar filtros y a activarlos. Aprender a configurar el acceso con autenticación en el proxy.
4. Conocer lar características mas relevantes respecto de la configuración de los proxies inversos y transparentes.
5. Utilizar herramientas de monitorización y análisis de los logs generados por el servidor proxy.
```

<Table of Contents>

## 1. Proxy: tipos, características y funciones

```md
La unidad aborda la configuración y uso de los servidores proxy, cuyo objetivo es la centralización y control del tráfico entre Internet y una red local, así como el control de los accesos no permitidos desde Internet hacia la red local y viceversa.
Detalla las características y funciones de los servidores proxy y los diferentes criterios de clasificación, y se centra principalmente en los proxies caché.
```
- **Objetivo**: centralización del tráfico entre internet y una red local (ordenadores no necesitan conexión directa a Internet + controlar accesos no permitidos en sendas direcciones)
- "El proxy hace una transformación de las direcciones de entrada y salida. Cuando un ordenador de la red local hace una solicitud o petición web, el proxy la intercepta y la procesa; de esa forma oculta la dirección IP del ordenador real que hace la solicitud y en la petición aparece la IP del proxy"
- 2 interfaces de red: 1 LAN 1 Internet

### Características y funciones

- **Elementos** comunes a todos los proxys: destino (servidores remotos), clientes (aplicaciones clientes que acceden al servicio remoto), reglas de acceso (condiciones de acceso)
- Clasificación según <u>quién implementa la política del proxy</u>:
  - **Proxy local**: implementa la política y hace las peticiones (el propio equipo cliente)
  - **Proxy de red o externo**: funcionan como caché, controlan el tráfico, bloquean contenido, comparten IP, etc

#### Proxy NAT

- Enmascara direcciones IP entre cliente y destino
- Útil para compartir una misma dir. IP para acceder a Internet (eg. aula escolar)

#### Proxy anónimo

- Permite ocultar la IP; los servidores remotos "desconocen" a los clientes
- Utilizados para saltar cortafuegos... o navegar por páginas "de dudas fiabilidad"
- Ejemplos: Ultrasurf, FirewallBlocker, ProtectedBrowser, Anonymous-Browsing

#### Proxy web o caché

- Situado entre la máquina del usuario y el servidor web de destino (| Internet); acelera|restringe el acceso a ciertos contenidos; restringe de la LAN hacia Internet

#### Proxy inverso

- Situado entre Internet y los servidores web; restringe de Internet a Servidor

#### Proxy transparente

...

### Funcionamiento

- Funciones:
  - Filtro de contenidos
  - Memoria caché de páginas web
  - Servidor de direcciones IP (asignación según servicio DHCP existente)
  - Cortafuegos
- Otras funciones:
  - Permitir acceso a máquinas que no están directamente conectadas a internet
  - Controlan acceso web aplicando reglas o normas
  - Registro del tráfico
  - Controlan seguridad LAN
- Otras funciones de seguridad:
  - Autenticación de usuarios
  - Filtrado del tráfico (paquetes & dominios)
  - Creación de logs

...

- Comprobación cabeceras `last modified` o `expires`



## 2. [Instalación y configuración del servidor proxy](https://drive.google.com/file/d/1M65RykNCpqXCNLlNKRDVjUqcb9ke64WL/view)

```md
Comenzaremos preparando el trabajo con el proxy Squid.
Para ello haremos la instalación, comprobaremos la estructura de archivos y directorios generada en el proceso de instalación y explicaremos algunos de los parámetros más importantes y básicos para realizar la configuración del servicio.
Incidimos en la necesidad de realizar una copia de seguridad del archivo global de configuración para poder recuperar el proxy en su estado inicial si hiciera falta.
```

...

## 3. [Configuración de filtros. Métodos de autenticación en un proxy](https://drive.google.com/file/d/1-L_HIFDi2iGji1gtCMxDdLjQLAdbO7ZA/view)

```md
En este apartado abordaremos el uso de las listas de control de acceso como mecanismo de creación de filtros de contenidos para poder discriminar los sitios a los que tienen acceso los clientes del servidor.
Estudiaremos también los diferentes mecanismos de autenticación soportados por Squid. Así, el servidor proxy puede exigir que un usuario se autentique antes de permitir el acceso. Esta opción permite controlar a los usuarios que hacen uso del proxy, mejorando la seguridad.
```

### 3.1 Configuración de filtros
#### ACL
#### HTTP_ACCESS
### 3.2 Métodos de autenticación en un proxy
#### Autenticación básica

## 4. [Proxy transparente. Proxy inverso](https://drive.google.com/file/d/1TUQiKOS03NkWZwP0TiS2WCpru_mvwQn6/view)

```md
Presentamos dos tipos de servidores proxy. Por un lado, el proxy transparente, también llamado proxy forzado, que es un servidor situado como punto intermedio entre un equipo en una red local e Internet. Su función consiste en controlar las peticiones web y redirigirlas hacia Internet sin modificar nada de ellas. 
Por otro lado, el proxy inverso, situado entre un grupo de servidores internos y los clientes web externos que quieren utilizarlos. El proxy inverso transmite todas las solicitudes de los clientes web a los servidores y entrega a los clientes las respuestas y servicios procedentes de los servidores.
```

### 4.1 Proxy transparente

- Enrutamiento sin configurar nada en los clientes; las máquinas de la LAN utilizan la máquina proxy como **puerta de enlace**
- Configuración (Squid):
  - parámetro `http_port 3128` por `http_port 192.168.1.1:3128 transparent`
  - iptables:
    - `iptables -t nat -A PREROUTING -i eth1 -p tcp -dport 80 -j REDIRECT --to-port 3128`
    - `iptables -t nat -A PREROUTING -i eth1 -p tcp -dport 443 -j REDIRECT --to-port 3128`
    - `iptables -t nat -A PREROUTING -s 192.168.1.0/24 -o eth0 -j MASQUERADE`
    - `sudo echo 1 > /proc/sys/net/ipv4/ip_forward`

### 4.2 Proxy inverso

- Controlar accesos desde el exterior a nuestro servidor; ocultar varios servidores detrás de un mismo nombre y dirección IP
- Funciones:
  - **Seguridad**: eg. reenviar solo solicitudes a puertos 80 o 443 (selección|filtrado del tráfico)
  - **Balanceo de carga**: repartir el tráfico entre varios servidores: mejora rendimiento, fortaleza ante fallos...


## 5. Monitorización. Herramientas de análisis de registros

```md
En este apartado analizamos diferentes mecanismos que permiten auditar la actividad de Squid, todos ellos basados en el estudio de los logs generados por el servidor proxy.
Para ello se necesita que la configuración de Squid contemple la creación de diferentes logs, tanto de acceso como de gestión de la cache.
Sobre esta información, directamente accediendo a los logs o a través del uso de herramientas específicas que los organizan, podemos comprobar la actividad del proxy Squid de forma más amigable.
```

### 5.1 Monitorización

```bash
tail -f /var/log/squid/cache.log
tail -f /var/log/squid/acess.log
```

- Peticiones HTTP: `TCP_*`: HIT, MISS, REFRESH_HIT, REF_FAIL_HIT, CLIENT_REFRESH, CLIENT_REFRESH_MISS, IMS_HIT, IMS_MISS, SWAPFAIL, TUNNEL, DENIED, DENIED/400, DENIED/401, DENIED/403

### 5.2 Herramientas de análisis de registros
#### A. SARG (Squid Analysis Report Generator)

- Herramientas de análisis de logs de Squid: Lightsquid, sqstat, squid-graph, SARG...
- Resultados de SARG (generación de informes): top 100 páginas más visitadas, informes diarios|semanales|mensuales, gráficas consumo por usuario/host, detalles páginas visitadas por usuario, errores de autenticación, descargas...

#### B. Calamaris

- Generación de informes...
