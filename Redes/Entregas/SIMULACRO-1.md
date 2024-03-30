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

- [Simulacro 1](#simulacro-1)
  - [Test](#test)
  - [Prácticas](#prácticas)
    - [Práctica 1](#práctica-1)
      - [0. Subnetting: 192.168.100.192/26](#0-subnetting-19216810019226)
      - [1. DHCP](#1-dhcp)
      - [2. DNS](#2-dns)
    - [Práctica 2](#práctica-2)
      - [0. Subnetting: 192.168.100.32/28](#0-subnetting-1921681003228)
      - [1. DHCP](#1-dhcp-1)
      - [2. DNS](#2-dns-1)
      - [3. HTTP](#3-http)
    - [Práctica 3](#práctica-3)


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


## Prácticas

### Práctica 1

```md
Instala los servicios DHCP y DNS en un servidor UBUNTU SERVER para dar la configuración de todos los parámetros a un cliente linux.
Dada la dirección de red 192.168.100.1, crea 4 subredes y quédate con la última para la configuración del servicio. Haz una reserva para un equipo Linux.
El dominio se llamará uni.net y dentro tienes que tener los host www y ftp, con sus respectivos alias.
```

<!--
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
-->


#### 0. Subnetting: 192.168.100.192/26

- Cálculo

```bash
# X Subnets:
#     - 2^n >= x
#     - /mask + n

# 192.168.100.-0/24: 10 subredes
2^n >= 4: 2^2 >= 4: 4 >= 4:
/24 + 2 = /26:
    192.168.100.-00-000000          # 1: 192.168.100.0/26
    192.168.100.-01-000000          # 2: 192.168.100.64/26
    192.168.100.-10-000000          # 3: 192.168.100.128/26
    192.168.100.-11-000000          # 4: 192.168.100.192/26 -- !!
```

- Subred

```yaml
Direccion red:  192.168.100.192/26
Primer host:    192.168.100.193        # en nuestro caso, el servidor DHCP+DNS+HTTP+Correo
Ultimo host:    192.168.100.254
Broadcast:      192.168.100.255
```

#### 1. DHCP

- Instalación de paquetes necesarios

```bash
sudo apt update && sudo apt install -y \
    isc-dhcp-server
```

- Asignar direccionamiento estático en red interna (segundo adaptador de red)

```bash
sudo vim /etc/netplan/00-installer-config.yaml
```

```yaml
# This is the network config written by 'subiquity'
network:
  ethernets:
    enp0s3:
      dhcp4: true
    enp0s8:
      dhcp4: false
      addresses: [192.168.100.193/26]
      nameservers:
        addresses: [192.168.100.193]
  version: 2
```
```bash
sudo netplan try || \
sudo netplan apply
```
- Definir interfaz para servicio DHCP

```bash
sudo sed -i 's/INTERFACESv4=.*/INTERFACESv4="enp0s8"/' /etc/default/isc-dhcp-server
```
- Configuración servicio DHCP

```bash
sudo sed -i 's/^option domain-name "example.org";/option domain-name "uni.net";/' /etc/dhcp/dhcpd.conf
sudo sed -i 's/^option domain-name-servers .*/option domain-name-servers ns.uni.net;/' /etc/dhcp/dhcpd.conf

cat<<EOF | sudo tee -a /etc/dhcp/dhcpd.conf

subnet 192.168.100.192 netmask 255.255.255.192 {
  range 192.168.100.200 192.168.100.250;
  option subnet-mask 255.255.255.192;
  option routers 192.168.100.193;
  option domain-name-servers 192.168.100.193;
  option domain-name "uni.net";
}

host cliente_linux {
  hardware ethernet 08:00:27:9c:6a:c1;
  fixed-address 192.168.100.195;
}

# host cliente_windows {
#   hardware ethernet 08:00:27:58:d0:b7;
#   fixed-address 192.168.100.35;
# }

EOF
```
- Aplicamos la configuración

```bash
sudo systemctl restart isc-dhcp-server
```

#### 2. DNS

- Instalación de paquetes necesarios

```bash
sudo apt update && sudo apt install -y \
    bind9 bind9-utils
```

- Definimos zonas de resolución

```bash
cat<<EOF | sudo tee -a /etc/bind/named.conf.local

// Resolución Directa
zone "uni.net" {
        type master;
        file "/etc/bind/db.uni.net";
};

// Resolución Inversa
zone "100.168.192.in-addr.arpa" {
       type master;
       file "/etc/bind/db.192";
};

EOF
```

- Configuración de zona directa

```bash
cat<<EOF | sudo tee /etc/bind/db.uni.net

\$TTL    604800
@       IN      SOA     uni.net.   root.uni.net. (
                              2        ; Serial
                         604800        ; Refresh
                          86400        ; Retry
                        2419200        ; Expire
                         604800 )      ; Negative Cache TTL
;     
@       IN      NS        uni.net.
@       IN      A         192.168.100.193
@       IN      AAAA      ::1
@       IN      MX 10     correo.uni.net.

ns      IN      A         192.168.100.193
www     IN      A         192.168.100.193
ftp     IN      A         192.168.100.193
correo  IN      A         192.168.100.193

Dns     IN      CNAME     ns.uni.net.
Web     IN      CNAME     www.uni.net.
Nas     IN      CNAME     ftp.uni.net.
Mail    IN      CNAME     correo.uni.net.

EOF
```

- Configuración de zona inversa

```bash
cat<<EOF | sudo tee /etc/bind/db.192

\$TTL    604800
@       IN      SOA  uni.net.     root.uni.net. (
                          1          ; Serial
                     604800          ; Refresh
                      86400          ; Retry
                    2419200          ; Expire
                     604800 )        ; Negative Cache TTL
;

@        IN     NS      uni.net.
193      IN     PTR     ns.uni.net.
193      IN     PTR     www.uni.net.
193      IN     PTR     ftp.uni.net.
193      IN     PTR     correo.uni.net.

EOF
```

```bash
# Verificar sintaxis configuración
named-checkconf
named-checkzone uni.net /etc/bind/db.uni.net
named-checkzone 100.168.192.in-addr.arpa. /etc/bind/db.192
```

- Aplicamos la configuración

```bash
sudo systemctl restart named
```


### Práctica 2

```md
Instala los servicios DHCP, DNS y HTTP en un servidor UBUNTU SERVER para dar la configuración de todos los parámetros a un cliente windows.
Dada la dirección de red 192.168.100.1, crea subredes para 25 equipos para cada subred y quédate con la primera para la configuración del servicio. Haz una reserva para un equipo Windows.
El dominio se llamará prueba.com. Tienes que mostrar la web desde el cliente correctamente.
```


#### 0. Subnetting: 192.168.100.32/28

- Cálculo

```bash
# X Hosts:
#   - 2^n-2 >= x
#   - /32 - n

# 192.168.100.-0/24: 25 hosts
2^n -2 >= 25: 2⁵ -2 >= 25: 30 >= 25:
/32 - 5 = /27:
    192.168.100.-000-00000          # 1: 192.168.100.0/27   -- !!
    192.168.100.-001-00000          # 2: 192.168.100.32/27
    192.168.100.-010-00000          # 3: 192.168.100.64/27
    192.168.100.-011-00000          # 4: 192.168.100.96/27
```

- Tercera subred de 10 para servicios DHCP/DNS

```yaml
Direccion red:  192.168.100.0/27
Primer host:    192.168.100.1
Ultimo host:    192.168.100.30
Broadcast:      192.168.100.31
```

#### 1. DHCP

- Instalación de paquetes necesarios

```bash
sudo apt update && sudo apt install -y \
    isc-dhcp-server
```

- Asignar direccionamiento estático en red interna (segundo adaptador de red)

```bash
sudo vim /etc/netplan/00-installer-config.yaml
```

```yaml
# This is the network config written by 'subiquity'
network:
  ethernets:
    enp0s3:
      dhcp4: true
    enp0s8:
      dhcp4: false
      addresses: [192.168.100.1/27]
      nameservers:
        addresses: [192.168.100.1]
  version: 2
```
```bash
sudo netplan try || \
sudo netplan apply
```
- Definir interfaz para servicio DHCP

```bash
sudo sed -i 's/INTERFACESv4=.*/INTERFACESv4="enp0s8"/' /etc/default/isc-dhcp-server
```
- Configuración servicio DHCP

```bash
sudo sed -i 's/^option domain-name "example.org";/option domain-name "prueba.com";/' /etc/dhcp/dhcpd.conf
sudo sed -i 's/^option domain-name-servers .*/option domain-name-servers ns.prueba.com;/' /etc/dhcp/dhcpd.conf

cat<<EOF | sudo tee -a /etc/dhcp/dhcpd.conf

subnet 192.168.100.0 netmask 255.255.255.224 {
  range 192.168.100.5 192.168.100.30;
  option subnet-mask 255.255.255.224;
  option routers 192.168.100.1;
  option domain-name-servers 192.168.100.1;
  option domain-name "prueba.com";
}

# host cliente_linux {
#   hardware ethernet 08:00:27:9c:6a:c1;
#   fixed-address 192.168.100.34;
# }

host cliente_windows {
  hardware ethernet 08:00:27:58:d0:b7;
  fixed-address 192.168.100.35;
}

EOF
```
- Aplicamos la configuración

```bash
sudo systemctl restart isc-dhcp-server
```

#### 2. DNS

- Instalación de paquetes necesarios

```bash
sudo apt update && sudo apt install -y \
    bind9 bind9-utils
```

- Definimos zonas de resolución

```bash
cat<<EOF | sudo tee -a /etc/bind/named.conf.local

// Resolución Directa
zone "prueba.com" {
        type master;
        file "/etc/bind/db.prueba.com";
};

// Resolución Inversa
zone "100.168.192.in-addr.arpa" {
       type master;
       file "/etc/bind/db.192";
};

EOF
```

- Configuración de zona directa

```bash
cat<<EOF | sudo tee /etc/bind/db.prueba.com

\$TTL    604800
@       IN      SOA     prueba.com.   root.prueba.com. (
                              2        ; Serial
                         604800        ; Refresh
                          86400        ; Retry
                        2419200        ; Expire
                         604800 )      ; Negative Cache TTL
;     
@       IN      NS        prueba.com.
@       IN      A         192.168.100.1
@       IN      AAAA      ::1
@       IN      MX 10     correo.prueba.com.

ns      IN      A         192.168.100.1
www     IN      A         192.168.100.1
ftp     IN      A         192.168.100.1
correo  IN      A         192.168.100.1

Dns     IN      CNAME     ns.prueba.com.
Web     IN      CNAME     www.prueba.com.
Nas     IN      CNAME     ftp.prueba.com.
Mail    IN      CNAME     correo.prueba.com.

EOF
```

- Configuración de zona inversa

```bash
cat<<EOF | sudo tee /etc/bind/db.192

\$TTL    604800
@       IN      SOA  prueba.com.     root.prueba.com. (
                          1          ; Serial
                     604800          ; Refresh
                      86400          ; Retry
                    2419200          ; Expire
                     604800 )        ; Negative Cache TTL
;

@        IN     NS      prueba.com.
1        IN     PTR     ns.prueba.com.
1        IN     PTR     www.prueba.com.
1        IN     PTR     ftp.prueba.com.
1        IN     PTR     correo.prueba.com.

EOF
```

```bash
# Verificar sintaxis configuración
named-checkconf
named-checkzone prueba.com /etc/bind/db.prueba.com
named-checkzone 100.168.192.in-addr.arpa. /etc/bind/db.192
```

- Aplicamos la configuración

```bash
sudo systemctl restart named
```

#### 3. HTTP

- Con docker ya instalado, ejecutamos un [contenedor Apache](https://hub.docker.com/r/pabloqpacin/sonda-web)

```bash
# sh <(curl -sSL https://get.docker.com)
docker run -d --name web1 -p 80:80 --restart always pabloqpacin/sonda-web:v1
```

> Captura

### Práctica 3

```md
Instala los servicios DHCP, DNS y HTTP en un servidor WINDOWS para dar la configuración de todos los parámetros a un cliente linux.
Dada la dirección de red 192.168.100.1, crea subredes para 25 equipos para cada subred y quédate con la primera para la configuración del servicio. Haz una reserva para un equipo Linux.
El dominio se llamará examen.es. Tienes que mostrar la web desde el cliente correctamente.
```

...
