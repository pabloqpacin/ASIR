# Redes UD3 — ¡Actividades!

<details>
<summary>Table of Contents</summary>

- [Redes UD3 — ¡Actividades!](#redes-ud3--actividades)
  - [1. Subnetting](#1-subnetting)
    - [1.1 Su red utiliza la dirección IP 172.30.0.0/16. Inicialmente existen 25 subredes, con un mínimo de 1000 hosts por subred. Se proyecta un crecimiento en los próximos años de un total de 55 subredes adicionales. ¿Qué máscara de subred se deberá utilizar?](#11-su-red-utiliza-la-dirección-ip-172300016-inicialmente-existen-25-subredes-con-un-mínimo-de-1000-hosts-por-subred-se-proyecta-un-crecimiento-en-los-próximos-años-de-un-total-de-55-subredes-adicionales-qué-máscara-de-subred-se-deberá-utilizar)
    - [1.2 Su ISP le ha asignado la dirección IP 194.168.16.0/24. Se requieren 10 Subredes con 10 hosts cada una. ¿Que máscara de subred debe utilizarse?](#12-su-isp-le-ha-asignado-la-dirección-ip-19416816024-se-requieren-10-subredes-con-10-hosts-cada-una-que-máscara-de-subred-debe-utilizarse)
    - [1.3 Una red de Clase B esta dividida en 8 subredes. ¿Qué máscara de subred se deberá utilizar si se pretende tener 2500 host por Subred?.](#13-una-red-de-clase-b-esta-dividida-en-8-subredes-qué-máscara-de-subred-se-deberá-utilizar-si-se-pretende-tener-2500-host-por-subred)
    - [1.4 Completa la siguiente tabla:](#14-completa-la-siguiente-tabla)
    - [1.5 Se tiene una dirección IP 172.17.111.0 con máscara 255.255.254.0, ¿cuantas subredes y cuantos host válidos habrá por subred?](#15-se-tiene-una-dirección-ip-172171110-con-máscara-2552552540-cuantas-subredes-y-cuantos-host-válidos-habrá-por-subred)
    - [1.6 A partir de la dirección IP 172.18.71.2 con máscara 255.255.248.0, ¿cual es la dirección de red y de broadcast de la subred a la que pertece el host?](#16-a-partir-de-la-dirección-ip-17218712-con-máscara-2552552480-cual-es-la-dirección-de-red-y-de-broadcast-de-la-subred-a-la-que-pertece-el-host)
    - [1.7 Una red clase B será dividida en 20 subredes a las que se sumarán 4 más en los próximos años. ¿Qué máscara se deberá utilizar para obtener un total de 2000 host por subred?](#17-una-red-clase-b-será-dividida-en-20-subredes-a-las-que-se-sumarán-4-más-en-los-próximos-años-qué-máscara-se-deberá-utilizar-para-obtener-un-total-de-2000-host-por-subred)
    - [1.8 (a) A partir de la dirección IP 192.168.85.129 con máscara 255.255.255.192, ¿cuál es la dirección de subred y de broadcast a la que pertece el host? (b) Usted tiene una IP 156.233.42.56 con una mascara de red de 23 bits. ¿Cuántos host y cuantas subredes son posibles?](#18-a-a-partir-de-la-dirección-ip-19216885129-con-máscara-255255255192-cuál-es-la-dirección-de-subred-y-de-broadcast-a-la-que-pertece-el-host-b-usted-tiene-una-ip-1562334256-con-una-mascara-de-red-de-23-bits-cuántos-host-y-cuantas-subredes-son-posibles)
    - [1.9 Una red clase B será dividida en subredes. ¿Que mascara se deberá utilizar para obtener un total de 500 host por subred?](#19-una-red-clase-b-será-dividida-en-subredes-que-mascara-se-deberá-utilizar-para-obtener-un-total-de-500-host-por-subred)
    - [1.10 La red 192.168.15.0/24 se divide en 9 subredes. Se desea conocer:](#110-la-red-19216815024-se-divide-en-9-subredes-se-desea-conocer)
  - [2. Packet Tracer](#2-packet-tracer)
    - [Tarea](#tarea)
    - [Resolución](#resolución)

</details>

## 1. Subnetting

<!--
```markdown
# Diff Ortega
- [ ] ej1 - solución? 55 o 80 subredes? /22 o /23?
- [ ] ej4-1 - (192.168.0.64/26) último host, broadcast
- [ ] ej4-8 - (193.128.128.128/25) último host, broadcast
- [ ] ej10 - resultados
```
-->

<details>
<summary>Subnetting UD3</summary>

### 1.1 Su red utiliza la dirección IP 172.30.0.0/16. Inicialmente existen 25 subredes, con un mínimo de 1000 hosts por subred. Se proyecta un crecimiento en los próximos años de un total de 55 subredes adicionales. ¿Qué máscara de subred se deberá utilizar?

- 172.30.0.0/16
  - 80 subredes = 2^n // n=7 ... 2^7=128 (~~2^6=64~~)
  - 16 + 7 = `/23`
- 1000 hosts = 2^n-2 // n=10 ... 2^10-2 = 1024-2
  - 32 - 10 = `/22`
- ...
- El ejercicio no se puede resolver porque tener "más de 64 subredes" es incompatible con tener "1000 hosts por subred".
- Si para el subnetting se requieren 64+ subredes, hay que tomar 7 bits y no 6 (`/23` y no `/22`), por lo que no será posible habilitar más de 510 hosts por subnet.
- Es decir, una máscara `/23` proporciona un máximo de 510 hosts. Entiendo que en este ejercicio el enunciado está mal planteado (concretamente la palabra "adicionales" supondría el origen del conflicto) ya que si el total de subredes fuera de 55, la máscara tomaría 6 bits (`/22`) y por lo tanto podría haber un máximo de 1022 hosts por subred.


<details>
<summary>ChatGPT (?)</summary>

```markdown
# ChatGPT
Para cumplir con los requisitos indicados, se necesitará una máscara de subred que permita tener al menos 1000 hosts por subred y permita tener un total de 80 subredes (25 subredes existentes + 55 subredes adicionales).
Para determinar la máscara de subred adecuada, se puede utilizar la fórmula:
n = 2^(32-p)    // 32=IPv4
Donde n es el número de hosts por subred y p es el número de bits de la máscara de subred.
Dado que se necesitan al menos 1000 hosts por subred, se puede elegir una potencia de 2 que sea mayor o igual a 1000. La potencia de 2 más cercana es 2^10 = 1024.
Entonces, p se puede calcular como:
p = log2(1024) = 10
Ahora, se necesita determinar cuántos bits se deben reservar para el número de subredes. Se necesitan 80 subredes en total, por lo que se puede utilizar la fórmula:
n = 2^p
Donde n es el número de subredes y p es el número de bits reservados para el número de subredes.
Se busca el valor de p que satisfaga la ecuación 2^p ≥ 80. Probando diferentes valores, se puede determinar que p = 7 es suficiente:
2^7 = 128 ≥ 80
Entonces, se necesitará reservar 7 bits para el número de subredes y 10 bits para el número de hosts. El número de bits restante para la dirección de red es:
32 - (7 + 10) = 15
Por lo tanto, la máscara de subred necesaria es /22, lo que significa que los primeros 22 bits de la dirección IP se utilizarán para identificar la red y los últimos 10 bits se utilizarán para identificar los hosts.
En resumen, la máscara de subred adecuada para esta red sería 255.255.252.0 (/22), lo que permitiría tener 1022 hosts por subred y 105 subredes en total (25 subredes existentes + 80 subredes adicionales).
```

</details>


### 1.2 Su ISP le ha asignado la dirección IP 194.168.16.0/24. Se requieren 10 Subredes con 10 hosts cada una. ¿Que máscara de subred debe utilizarse?

- 10 subnets = 2^n // n=4 ... 2^4 = 16 >= 10
  - Mask == 24 + 4 = `/28`
- 10 hosts = 2^n -2 // n=4 ... 2^4 -2 = 16-2 = 14 >= 10 
  - Mask == 32 - 4 = `/28`


### 1.3 Una red de Clase B esta dividida en 8 subredes. ¿Qué máscara de subred se deberá utilizar si se pretende tener 2500 host por Subred?.

- Class B (128.0.0.0 - 191.255.255.255) // default: `/16` (65,536 addresses)
  - **2500 hosts** = 2^n -2 // **n=12** ... 2^12 -2 = 4094 >= 2500 (~~n=11 ... 2046~~)
    - 32 - 12 = `/20`


### 1.4 Completa la siguiente tabla:

| 'i'           | 1                 | 2               | 3 (!)             | 4                  | 5                 | 6                | 7                | 8                    |
| ---           | ---               | ---             | ---               | ---                | ---               | ---              | ---              | ---                  |
| Dirección Red | `192.168.0.64/26` | `192.0.0.0/25`  | 220.123.12.208/29 | `201.33.33.128/27` | 211.211.211.0/24  | `193.31.5.96/30` | 192.168.15.40/29 | `193.128.128.128/25`
| Mask (DEC)    | 255.255.255.192   | 255.255.255.128 | 255.255.255.248   | 255.255.255.224    | 255.255.255.0     | 255.255.255.252  | 255.255.255.248  | 255.255.255.128
| Primer Host   | 192.168.0.65      | 192.0.0.1       | `220.123.12.209`  | 201.33.33.129      | `211.211.211.1`   | 193.31.5.97      | `192.168.15.41`  | 193.128.128.129
| Último Host   | 192.168.0.126     | 192.0.0.126     | `220.123.12.214`  | 201.33.33.158      | `211.211.211.254` | 193.31.5.98      | 192.168.15.46    | 193.128.128.254
| Broadcast     | 192.168.0.127     | 192.0.0.127     | 220.123.12.215    | 201.33.33.159      | 211.211.211.255   | 193.31.5.99      | 192.168.15.47    | 193.128.128.255
| Nº Hosts      | 62                | 126             | 6                 | 30                 | 254               | 2                | `6`              | 126

### 1.5 Se tiene una dirección IP 172.17.111.0 con máscara 255.255.254.0, ¿cuantas subredes y cuantos host válidos habrá por subred?

- (B) 172.17.111.0/23
  - Hosts = 2^n -2 // 2^9 -2 = 512 -2 = **510 hosts/net**
  - 23 - 16 (default) = 7 bits // 2^7 = **128 subredes**

```bash
# Verification successful
ipcalc 172.17.111.0/16 /23
```

<!--
<details>
<summary>ChatGTP</summary>

```markdown
# ChatGPT
La dirección IP 172.17.111.0 con máscara 255.255.254.0 representa una red que utiliza 23 bits para la identificación de la red y 9 bits para la identificación de los hosts.
Para determinar la cantidad de subredes que hay, podemos calcular la cantidad de bits reservados para la identificación de la red y utilizar la fórmula:
n = 2^(bits de la identificación de la red) - 2
Donde "n" es la cantidad de subredes y se resta 2 para excluir la dirección de red y la dirección de broadcast. En este caso, hay 9 bits reservados para la identificación de la red, por lo que podemos calcular:
n = 2^9 - 2 = 510
Por lo tanto, hay 510 subredes disponibles en esta red.
Para determinar la cantidad de hosts válidos por subred, podemos calcular la cantidad de bits reservados para la identificación de los hosts y utilizar la fórmula:
h = 2^(bits de la identificación de los hosts) - 2
Donde "h" es la cantidad de hosts válidos por subred y se resta 2 para excluir la dirección de red y la dirección de broadcast. En este caso, hay 9 bits reservados para la identificación de los hosts, por lo que podemos calcular:
h = 2^9 - 2 = 510
Por lo tanto, hay 510 hosts válidos por subred en esta red.

Sí, puedo confirmar el número de subredes de acuerdo con los bits de red.
La dirección IP 172.17.111.0 con máscara 255.255.254.0 utiliza 23 bits para la identificación de la red y 9 bits para la identificación de los hosts.
Para determinar la cantidad de subredes, podemos utilizar la fórmula:
n = 2^(bits de la identificación de la red) - 2
Donde "n" es la cantidad de subredes y se resta 2 para excluir la dirección de red y la dirección de broadcast. En este caso, hay 23 bits reservados para la identificación de la red, por lo que podemos calcular:
n = 2^23 - 2 = 8,388,606
Por lo tanto, hay 8,388,606 subredes disponibles en esta red.
Es importante tener en cuenta que, aunque la fórmula nos indica la cantidad máxima de subredes posibles con esa cantidad de bits de red, en la práctica la cantidad real de subredes que se pueden utilizar dependerá de cómo se asignen y utilicen las direcciones IP en la red.
```

</details>
-->

### 1.6 A partir de la dirección IP 172.18.71.2 con máscara 255.255.248.0, ¿cual es la dirección de red y de broadcast de la subred a la que pertece el host?

- 172.18.01000-111.2 /21
  - Dirección de red == `172.18.64.0/21`
  - Broadcast == `172.18.71.255`


### 1.7 Una red clase B será dividida en 20 subredes a las que se sumarán 4 más en los próximos años. ¿Qué máscara se deberá utilizar para obtener un total de 2000 host por subred?

- 128.0.0.0/16 (B)
  - 24 subredes >> 2^n >= 24 ... n=5
    - 16 + 5 = `/21`
    - 128.0.00000-000.00000000
  - 2000 hosts >> 2^n-2 >= 2000 ... n=11
    - 128.0.00000-000.00000000
    - 32 - 11 = `/21`

### 1.8 (a) A partir de la dirección IP 192.168.85.129 con máscara 255.255.255.192, ¿cuál es la dirección de subred y de broadcast a la que pertece el host? (b) Usted tiene una IP 156.233.42.56 con una mascara de red de 23 bits. ¿Cuántos host y cuantas subredes son posibles?

- (a)
  - 192.168.85.129/26
    - Dirección subred == 192.168.85.128/26
    - Broadcast == 192.168.85.191
- (b)
  - 159.233.42.56/23 == 159.233.0010101-0.56
    - Hosts = 2^n -2 // 2^9 -2 = 512 -2 = **510 hosts/net**
    - 23 - 16 (default) = 7 bits subred // 2^7 = **128 subredes**


### 1.9 Una red clase B será dividida en subredes. ¿Que mascara se deberá utilizar para obtener un total de 500 host por subred?

- 128.0.0.0/16
  - 500 hosts = 2^n-2 ... n=9 ... n^9 -2 = 512 - 2 = **510**
    - 32 - 9 = `/23`

### 1.10 La red 192.168.15.0/24 se divide en 9 subredes. Se desea conocer:

| i   | Q                       | A   |
| --- | ---                     | --- |
| 1   | Host 6 de la subred 5   | 192.168.15.70/28
| 2   | Host 12 de la subred 11 | 192.168.15.188/28
| 3   | Host 19 de la subred 4  | max hosts/net = 14 
| 4   | Host 8 de la subred 7   | 192.168.15.104/28

- 192.168.15.0/24
  - 9 subredes = 2^n // n=4 ... 2^4=16
    - 24 + 4 = `/28` (192.168.15.0000-0000)
    - **14 hosts/net**

| index | Subred             | Host nº | Host IP | 
| ---   | ---                | ---     | ---     |
| 1     | 192.168.15.0 `/28` | 
| 2     | 192.168.15.16      |
| 4     | 192.168.15.48      | 19      | -
| 5     | 192.168.15.64      | 6       | 192.168.15.70
| 6     | 192.168.15.80      |
| 7     | 192.168.15.96      | 8       | 192.168.15.104
| 11    | 192.168.15.176     | 12      | 192.168.15.188

```bash
# Verification successful
ipcalc 192.168.15.0/24 /28
```

</details>

## 2. Packet Tracer

<details>
<summary>Packet Tracer #1</summary>

![model-topology](/Redes/UD3-ArquitecturaRedes/PT-topology.png)

### Tarea

1. Implemente la red en el programa Cisco Packet Tracer. Para ello, tome en cuenta el documento “Instructivo de uso básico de Packet Tracer” y las siguientes instrucciones:
   1. Los Switches tienen que ser modelo 2960
   2. La conexión entre los Switches a Routers y Switches a PCs deben de ser con un cable directo de cobre. En el programa, se conoce como “Copper Straight-Through”
   3. Las conexiones Switch a Switch deben de ser con un cable de cobre cruzado. En el programa, se conoce como “Copper Cross-Over”
   4. El Router debe de ser modelo 2901

> **NOTA:** Todas las conexiones son a puertos `FastEthernet` excepto con el **Router**, que sería `GigabitEthernet`


2. Aplicar una configuración básica a los dispositivos de red. En especifico:
   1. Cambie el hostname del dispositivo al nombre que se encuentra ilustrado en la etiqueta de cada uno
   2. Asigne  la  contraseña  “ADMIN1”  para  el  acceso  a  la consola  del  Router  y  “SWCU”  para  los  Switches. Asegúrese  que  los  usuarios  tengan  que  autenticarse con dicha contraseña al acceder a la consola
   3. Asigne la contraseña “OIIK” para las líneas virtuales del router y la contraseña “RBUC” para los Switches.
   4. Asigne  la  contraseña  secreta  “ZNTE”  de  acceso  al dispositivo de red para el router y “BK150” para el Switch.
   5. Encripte todas las contraseñas en texto plano
   6. Asigne el siguiente mensaje de advertencia: “Acceso restringido solo a usuarios autorizado”
   7. Asigne  direcciones  IP  a  los  dispositivos  de  red  de acuerdo a los siguientes parámetros:
      1. El  router  debe  de  tener  la  dirección  IP utilizable
      2. Los switches deben de tener IPs de administración que comprendan entre la 5ta y la 8va dirección IP utilizable
      3. Los dispositivos finales deben de tener direcciones IPs que comprendan desde la #20 en adelante
   8. Guarde los cambios efectuados y asegure la conectividad entre dispositivos

2. Rellene el siguiente cuadro con la información correspondiente al siguiente planteamiento: Si PC3 emite 
un ping al servidor, ¿Cuáles serán las cabeceras IPs y MAC de ida y de vuelta? Represente su respuesta de la siguiente forma: IP_PC0, MAC_PC0

| Tramo         | MAC Origen | MAC Destino | IP Origen | IP Destino |
| ---           | ---        | ---         | ---       | ---        |
| PC3 a Server0 |
| Server0 a PC3 |

### Resolución

- 192.168.56.0/24

```bash
# 1. Config Router
                # Router>
enable          # Router#          

conf ter        # Router(config)#
hostname RE0

line console 0  # RE0(config-line)#
password ADMIN1
login

exit            # RE0(config)#
line vty 0 4    # RE0(config-line)#
password OIIK

exit            # RE0(config)#
enable secret ZNTE
service password-encryption
banner motd 'Acceso restringido solo a usuarios autorizados'

int g0/1        # RE0(config-if)#
ip address 192.168.56.1 255.255.255.0
no sh

exit            # RE0(config)#
do wr

exit            # RE0#
show ip int brief
```

```bash
# 2. Config Switches
                # Switch>
en              # Switch#
sh ip int brief

conf ter        # Switch(config)#
hostname SLAN1 || SLAN2 || SLAN3

line console 0  # SLAN(config-line)#
password SWCU
login

exit            # SLAN(config)#
line vty 0 4    # SLAN(config-line)#
password RBUC

exit            # SLAN(config)#
enable secret BK150
service password -encryption
banner motd 'Acceso restringido solo a usuarios autorizados'

int VLAN1       # SLAN(config-if)#
ip address 192.168.56.[5||6||7] 255.255.255.0
no sh

exit            # SLAN(config)#
do wr

exit            # SLAN#
sh ip int brief
```

</details>
