# Redes UD6 — Práctica Packet Tracer #2


<details>
<summary>Table of Contents</summary>

- [Redes UD6 — Práctica Packet Tracer #2](#redes-ud6--práctica-packet-tracer-2)
  - [Enunciado](#enunciado)
  - [Resolución](#resolución)
    - [1. Subnetting](#1-subnetting)
    - [2. Cisco IOS config](#2-cisco-ios-config)
      - [RS01](#rs01)
        - [CD0](#cd0)
        - [PC0](#pc0)
        - [CD1](#cd1)
        - [PC1, PC2](#pc1-pc2)
      - [RS02](#rs02)
        - [SW1 + PC3,PC4,PC5](#sw1--pc3pc4pc5)
        - [SW2 + PC6](#sw2--pc6)
    - [3. Simulation — Ping!](#3-simulation--ping)


</details>

## Enunciado

![topologia](/img/Redes/ud6-PT02-topology.png)

<details>
<summary>Detalles</summary>

1. Implemente la red en el programa Cisco Packet Tracer. Para ello, tome en cuenta el documento “Instructivo de uso básico de Packet Tracer” y las siguientes instrucciones:
   1. Los Switches tienen que ser modelo 2960
   2. **ROUTERS == 2901**
   3. La conexión entre los Switches a Routers y Switches a PCs deben de ser con un cable directo de cobre. En el programa, se conoce como “Copper Straight-Through” 


2. Diseñe un esquema de direccionamiento IP que cubra las demandas de usuarios ilustrada en la figura a partir del bloque de red 10.1.1.0/24 (No tome en cuenta el enlace punto a punto entre los routers). Plantee sus resultados en el siguiente cuadro: 

| Nº Subred             | #1  | #2  | #3  | #4  |
| ---                   | --- | --- | --- | --- |
| Demanda de Hosts      |
| ID de red/Mask        |
| Primera IP utilizable |
| Última IP utilizable  |
| Dirección Broadcast   |


3. Aplicar una configuración básica a los dispositivos de red. En específico:
   1. Cambie el hostname del dispositivo al nombre que se encuentra ilustrado en la etiqueta de cada uno
   2. Asigne la contraseña “Hollow1” para el acceso a la consola de los routers y “JUSKGY” para los Switches.  Asegúrese  que  los  usuarios  tengan  que autenticarse con dicha contraseña al acceder a la consola
   3. Asigne la contraseña “SRG13” para las líneas virtuales de los routers y la contraseña “SHHZ” para los Switches
   4. Asigne la contraseña secreta “B&RK” de acceso al dispositivo de red
   5. Encripte todas las contraseñas en texto plano
   6. Asigne  el  siguiente  mensaje  de  advertencia:  “Acceso  permitido  solo  a personal autorizado, si eres intruso habrá consecuencias”
   7. Guarde los cambios efectuados

4. Asigne direcciones IP a los dispositivos finales y de red de acuerdo al esquema IP diseñado en (1)
   1. Las  interfaces  LAN  de  los  routers  han  de  tener  la  primera  dirección  IP asignable.
   2. Los switches han de tener la 5ta dirección IP asignable. Implementarla en la interfaz de la VLAN por defecto (VLAN 1)
   3. Los dispositivos finales tendrán la IP de preferencia del estudiante.

5. En  base  a  los  conocimientos  del  proceso  de  encapsulamiento,  proceso  de des-encapsulamiento, comunicación en una red local y en una red remota. Rellene el siguiente cuadro con la información que va a tener cada tramo si se comunica PC0 con PC6. Para facilitar la respuesta, indique la información de la siguiente manera:
   - Para direcciones MAC: MAC GI0/1 RS02 
   - Para direcciones IP: IP PC0 
   - NOTA IMPORTANTE: Tal vez le sea de utilidad que use el modo de simulación para  responder  esta  pregunta.  El  modo  de  simulación  se  encuentra  en  la  parte inferior derecha. Automáticamente se abre un pequeño recuadro llamado “Event List” en donde una vez generada una PDU, al darle click, va a poder visualizar la información detallada de direccionamiento.
   - A efectos de la materia vista, se ha omitido el tramo de la red serial punto a punto entre routers. Solo se ha hecho énfasis en cuando los datos están en las LANs

| Tramo      | IP Origen | IP Destino | MAC Origen | MAC Destino |
| ---        | ---       | ---        | ---        | ---         |
| PC0 a RS01 |
| RS02 a PC6 | 


</details>

## Resolución

### 1. Subnetting

<!-- > Ordenar siempre de mayor a menor! -->

-  **Subnetting 10.1.1.0/24 (VLSM)** // `Hosts = 2^n -2`
   - 47 Hosts // n=6 ... 2^ 6 -2 >= 47 // 32 -6 = `/26`
   - 28 Hosts // n=5 ... `/27`
   - 11 Hosts // n=4 ... `/28`
   - 5 Hosts // n=3 ... 2^ 3 -2 >= 5 // 32 -3 = `/29`


| Nº Subred        | #1 [RS1>CD1]      | #2 [RS2>SW1]       | #3 [RS2>SW2]       | #4 [RS1>CD0]
| ---              | ---               | ---                | ---                | ---
| Demanda de Hosts | 47                | 28                 | 11                 | 5
| **Subred**       | **10.1.1.0`/26`** | **10.1.1.64`/27`** | **10.1.1.96`/28`** | **10.1.1.112`/29`**
| Máscara completa | *255.255.255.192* | *255.255.255.224*  | *255.255.255.240*  | *255.255.255.248*
| Primer host      | 10.1.1.1          | 10.1.1.65          | 10.1.1.97          | 10.1.1.113
| último host      | 10.1.1.62         | 10.1.1.94          | 10.1.1.110         | 10.1.1.118
| Broadcast        | 10.1.1.63         | 10.1.1.95          | 10.1.1.111         | 10.1.1.119
| Total hosts      | 62                | 30                 | 14                 | 6   

- NOTAS:
  - es preciso añadir interfaces **seriales** (`HWIC-2T`) a ambos **Routers** (via *GUI* > *Hardware*) para poder conectarlos (!)
  - **VLAN1** == **FastEthernet** connection (cable interface)
  - 3 tipos de contraseña
    1. Acceso a la consola (Hollow1, JUSKGY)
    2. Líneas virtuales (SRG13, SHHZ)
    3. Acceso al dispositivo (B&RK)



| Dispositivo     | Interfaz | Hacia Disp.   | IP           | Hosts req | # subred | passwd
| ---             | ---      | ---           | ---          | ---       | ---      | ---
| **Router RS01** | g0/0     | Switch CD0    | 10.1.1.`113` |           | [#4]     | Hollow1 + B&RK + SRG13
| **Router RS01** | g0/1     | Switch CD1    | 10.1.1.`1`   |           | #1       |
| **Switch CD0**  | 'VLAN1'  | PC0           | 10.1.1.`117` | 5         | [#4]     | JUSKGY + B&RK + SHHZ
| **Switch CD1**  | 'VLAN1'  | PC1, PC2      | 10.1.1.`5`   | 47        | #1       | JUSKGY
| **PC0**         | -        | -             | 10.1.1.`118` |           | [#4]     |
| **PC1**         | -        | -             | 10.1.1.`6`   |           | #1       |
| **PC2**         | -        | -             | 10.1.1.`7`   |           | #1       |
| **Router RS01** | Serial   | Router RS02   | 
| **Router RS02** | g0/0     | Switch SW1    | 10.1.1.`65`  |           | #2       | ...
| **Router RS02** | g0/1     | Switch SW2    | 10.1.1.`97`  |           | [#3]     | ...
| **Switch SW1**  | 'VLAN1'  | PC3, PC4, PC5 | 10.1.1.`69`  | 28        | #2       | ...
| **Switch SW2**  | 'VLAN1'  | PC6           | 10.1.1.`101` | 11        | [#3]     | ...
| **PC3**         | -        | -             | 10.1.1.`70`  |           | #2       |
| **PC4**         | -        | -             | 10.1.1.`71`  |           | #2       |
| **PC5**         | -        | -             | 10.1.1.`72`  |           | #2       |
| **PC6**         | -        | -             | 10.1.1.`102` |           | [#3]     |


### 2. Cisco IOS config


#### RS01

```bash
# Config Router *RS01* para subredes 10.1.1.0/26 y 10.1.1.112/29

    # Access 'Initial Config Dialog'
en
setup
    yes
    # Hostname:
    RS1
    # Enable secret:
    Hollow1
    # Enable passwd:
    B&RK
    # Virtual terminal passwd:
    SRG13
    # Config SNMP?
    no
    # Enter int
g0/1
10.1.1.1
255.255.255.192
    # Save?
    [2]

sh ip int brief
    conf ter 
        int g0/0
            ip address 10.1.1.113 255.255.255.248
            no sh
            end
sh ip int brief
exit
```

##### CD0

```bash
# Config Switch *CD0* para subred 10.1.1.112/29

    # Access 'Initial Config Dialog'
en
setup
yes
    # Hostname:
    CD0
    # Enable secret:
    JUSKGY
    # Enable passwd:
    B&RK
    # Virtual passwd:
    SHHZ
    # Config SNMP:
    no
    # Enter int:
vlan1
10.1.1.117
255.255.255.248
    # Enable cluster command switch?
    yes
    [2]
ping 10.1.1.113
```

##### PC0

```bash
# Config PC0 via 'Desktop > IP configuration'
10.1.1.118
255.255.255.248
    ping 10.1.1.113 # SUCESS!
```


##### CD1

```bash
# Config Switch *CD1* para subred 10.1.1.0/26
en
    conf ter
        hostname CD1
        enable secret JUSKGY
        int vlan1
            ip address 10.1.1.5 255.255.255.192
            no sh
            end
sh ip int brief
write
exit
```

##### PC1, PC2

```bash
# PC1
10.1.1.6
255.255.255.192

# PC2
10.1.1.7
255.255.255.192

ping 10.1.1.1   # SUCCESS!
```


#### RS02

##### SW1 + PC3,PC4,PC5
##### SW2 + PC6




### 3. Simulation — Ping!

1. Prepare Simulation Mode (Show None Filters but **ICMP**)
2. Open PC0 CMD and `ping 10.1.1.113`
3. Results:

| Tramo     | PC0 a RS01     | RS02 a PC6
| ---       | ---            | ---
| SRC IP    | 10.1.1.118     |
| DEST IP   | 10.1.1.113     |
| SRC ADDR  | 00E0.8F5B.4D68 |
| DEST ADDR | 00E0.A313.6801 |


---

| ChatGPT |
| ---
| En Packet Tracer, he configurado: <br> - 1 Router con dos salidas GigabitEthernet y sendas IPs 10.1.1.1/26 y 10.1.1.113/29 <br> - 2 Switches, con VLAN1 y sendas IPs 10.1.1.5/26 y 10.1.1.117/29 <br> - 3 PCs, el primero con IP 10.1.1.118/29 y los otros dos con IPs 10.1.1.6/26 y 10.1.1.7/26 <br> <br> El Router puede hacer PING a todos los dispositivos. Sin embargo, los PCs no hacen PING correctamente entre ellos, es decir, las redes no se comunican correctamente. <br> Explica por qué y proporciona posibles soluciones
| El problema se debe a que los PCs están en redes diferentes y no tienen una ruta definida para comunicarse entre sí. El PC con dirección IP 10.1.1.118/29 está en una red diferente a la de los otros dos PC, por lo que no pueden comunicarse directamente. <br> <br> Existen varias posibles soluciones para este problema: <br> <br> 1. &emsp; Agregar una ruta estática en cada PC: se puede agregar una ruta estática en cada PC para indicar la dirección IP de la subred a la que pertenecen los otros dos PC. Por ejemplo, en el PC con dirección IP 10.1.1.118/29 se puede agregar una ruta para la subred 10.1.1.0/26 con el gateway predeterminado 10.1.1.113. De esta manera, el PC puede enviar paquetes a la red de los otros dos PC a través del router.  <br> <br> 2. &emsp; Agregar una VLAN adicional en el switch: se puede agregar una VLAN adicional en uno de los switches y conectar los dos PC a esa VLAN. Esto creará una red separada para los dos PC y se podrán comunicar directamente. <br> <br> 3. &emsp; Cambiar la dirección IP del PC 10.1.1.118/29: se puede cambiar la dirección IP del PC 10.1.1.118/29 para que pertenezca a la misma subred que los otros dos PC (por ejemplo, 10.1.1.6/26 o 10.1.1.7/26). De esta manera, los tres PC estarán en la misma red y podrán comunicarse directamente. <br> <br> Cualquiera de estas soluciones debería resolver el problema de comunicación entre los PC.