# Simulacro 1

```md
Simulacro 1
Son 10 preguntas de tipo test, donde las respuestas correctas suman 0,3 y las respuestas incorrectas restan 0,1.

Después tenéis 3 ejercicios prácticas, donde tenéis que elegir dos de ellos para llevar a cabo. Tenéis que entregarme un pdf con la configuración de los servicios y demostración de que funcionan correctamente, no es necesario mostrar la instalación de los mismos.

Suerte.

Límite de tiempo 1 hora 30 minutos
Límite de tiempo: 1 hora 30 minutos. Durante el examen, presione Alt+Shift+T para que se lea el tiempo restante1 hora 30 minutos01:30:00
Límite de tiempo
Debe realizarse antes del 7/2/20247/2/2024
Vence en 0 días
Esta evaluación tiene intentos ilimitados.
```

## Test

- En relación con el servicio DNS, ¿cuál de estas afirmaciones es incorrecta?
    - [ ] Se trata de una organización jerárquica en dominios y sus subdominios, por niveles.
    - [ ] Cada servidor DNS se debe encargar como mínimo de una zona, pero puede gestionar varias si es necesario.
    - [x] Un dominio tiene varios nombres y todos los miembros de su organización comparten ese nombre.
    - [ ] ~~En cada zona disponemos de la información necesaria para resolver los nombres de las máquinas de tantos dominios como necesitemos, pero al menos de uno.~~
- ¿Cómo se denominan las resoluciones de nombres de dominio en el sistema de dominios?
    - [ ] Resolución iterativa y directa.
    - [x] Resolución iterativa y recursiva.
    - [ ] Resolución directa e iterativa.
    - [ ] ~~Resolución directa, iterativa y recursiva.~~
- ¿Cómo podemos saber el estado del servidor DNS?
    - [ ] Con la orden systemctl restart named o su equivalente service bind9 restart.
    - [x] Con la orden systemctl status named o su equivalente service bind9 status.
    - [ ] Con la orden systemctl star named o su equivalente service bind9 star.
    - [ ] Con la orden systemctl stop named o su equivalente service bind9 stop.
- Un cliente DHCP debe iniciar el proceso de renovación de la concesión cuando...
    - [ ] Ha finalizado la concesión anterior.
    - [ ] Se ha agotado el tiempo de concesión por defecto.
    - [x] Se ha agotado la mitad del tiempo de concesión asignado.
    - [ ] Se ha agotado la mitad del tiempo establecido en max-lease-time.
- En la declaración de una reserva DHCP en el archivo dhcpd.conf, para que se pueda identificar al cliente, se debe especificar su...
    - [x] Dirección física.
    - [ ] Nombre de equipo.
    - [ ] Nombre DNS.
    - [ ] Dirección IP.
- Indica qué puerto del servidor DHCP se utiliza para comunicarse con los clientes.
    - [x] *UDP 67*.
    - [ ] TCP 68.
    - [ ] UDP 68.
    - [ ] TCP 67.
- Indica cuál de las siguientes opciones de código se utiliza para asignar una dirección estática a un equipo en el archivo dhcpd.conf.
    - [ ] address 192.168.1.1;
    - [x] fixed-address 192.168.1.1;
    - [ ] default-ip 192.168.1.1;
    - [ ] ip 192.168.1.1;
- Indica cuál de las siguientes afirmaciones es verdadera:
    - [x] Todos los hosts virtuales tendrán, como máximo, un DocumentRoot.
    - [ ] ~~Todos los hosts virtuales tendrán, como máximo, un NameVirtualHost.~~
    - [ ] Todos los hosts virtuales tendrán, como máximo, un ServerAlias.
    - [ ] Todos los hosts virtuales tendrán, como máximo, una sección Directory.
- Respecto a los hosts virtuales por IP, indica cuál es la opción falsa.                # DE DÓNDE SALEN ESTAS PREGUNTAS?!?
    - [ ] Requieren la directiva ServerName.
    - [x] No pueden combinarse con hosts virtuales por nombre.
    - [ ] Puede escuchar cada uno de ellos por varias interfaces de red.
    - [ ] Requieren disponer de varias direcciones IP.
- La autoridad certificadora (CA) se encarga de firmar digitalmente...
    - [x] La clave pública de los usuarios junto con otra información de la identidad.
    - [ ] Las claves simétricas de los usuarios.
    - [ ] ~~Los certificados de las autoridades de registro.~~
    - [ ] Las claves privadas de los usuarios de dicha CA.


## Práctica 1

```md
Instala los servicios DHCP y DNS en un servidor UBUNTU SERVER para dar la configuración de todos los parámetros a un cliente linux.

Dada la dirección de red 192.168.100.1, crea 4 subredes y quédate con la última para la configuración del servicio. Haz una reserva para un equipo Linux.

El dominio se llamará uni.net y dentro tienes que tener los host www y ftp, con sus respectivos alias.
```

1. subnetting

```md
2^n>=4; 2^ 2 >=4; /24 + 2 = /26

192.168.100.00-000000/26    # subred1
192.168.100.01-000000/26    # subred2
192.168.100.10-000000/26    # subred3
192.168.100.11-000000/26    # subred4

Red:            192.168.100.192/26
Primer host:    192.168.100.193/26
Último host:    192.168.100.254/26
Broadcast:      192.168.100.255/26
```

1. instalación paquetes

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install isc-dhcp-server bind9 bind9-utils
```

2. ip estática (CAMBIO A RED INTERNA)

```bash
sudo vim /etc/netplan/
```
```yaml
addresses: [192.168.100.193/26]
nameservers:
    addresses: [192.168.100.193]
```

```bash
sudo netplan apply
```

3. dhcp

```bash
vim
```

4. dns
5. demostración


## práctica 2

```md
Instala los servicios DHCP, DNS y HTTP en un servidor UBUNTU SERVER para dar la configuración de todos los parámetros a un cliente windows.

Dada la dirección de red 192.168.100.1, crea subredes para 25 equipos para cada subred y quédate con la primera para la configuración del servicio. Haz una reserva para un equipo Windows.

El dominio se llamará prueba.com. Tienes que mostrar la web desde el cliente correctamente.
```

## práctica 3

```md
Instala los servicios DHCP, DNS y HTTP en un servidor WINDOWS para dar la configuración de todos los parámetros a un cliente linux.

Dada la dirección de red 192.168.100.1, crea subredes para 25 equipos para cada subred y quédate con la primera para la configuración del servicio. Haz una reserva para un equipo Linux.

El dominio se llamará examen.es. Tienes que mostrar la web desde el cliente correctamente.
```
