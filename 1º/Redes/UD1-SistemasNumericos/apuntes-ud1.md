# Redes UD1 - Sistemas Numéricos

## 1. Sistemas Numéricos

> Conversión DEC BIN OCT HEX

<!-- > Awful explanation, lucky me [I actually learnt with David Bombal](ENLACE_A_ASIR+) -->

## 2. Direccionamiento IP

- Direcciones IP > Organismos: [IANA](http://www.iana.org/), [InterNIC](https://www.internic.net/), [ICANN (lookup tool)](https://lookup.icann.org/en)
- En dirección IPv4... dos direcciones reservadas! ("-2")
- primeraDirección==direcciónDeRed (`0`)
- últimaDirección==direcciónDeBroadcast (`255`)

| Movida           | Tal (DEC)        | Cual (BIN) |
| ---              | ---              | ---        |
| Dirección IP     | 173.23.128.0/18  | MASK == 255.255.192.0
| Dirección de Red | 173.23.128.0     | **173.23.10**000000.00000000
| Primer Host      | 173.23.128.1     | **173.23.10**000000.00000001
| Último Host      | 173.23.191.254   | **173.23.10**111111.11111110
| Broadcast        | 173.23.191.255   | **173.23.10**111111.11111111
| | |
| Dirección IP     | 192.168.35.96/27 | MASK == 255.255.255.224
| Dirección de Red | 192.168.35.96    | **192.168.35.011**00000
| Primer Host      | 192.168.35.97    | **192.168.35.011**00001
| Último Host      | 192.168.35.126   | **192.168.35.011**11110
| Broadcast        | 192.168.35.127   | **192.168.35.011**11111

### CLASES de IPs

| Class | First Octet Address | Default Subnet Mask | Bits Req 
| ---   | ---                 | ---                 | ---      
| A     | 001 - 126           | 255.0.0.0           | 0        
| B     | 128 - 191           | 255.255.0.0         | 10       
| C     | 192 - 223           | 255.255.255.0       | 110      
| D     | 224 - 239           |                     | 1110     
| E     | 240 - 255           |                     | 1111     

#### A
- MASK==`255.0.0.0 (/8)`
- El primer bit de la red es siempre a `0`; con lo cual, solo pueden cambiar los siete bits restantes.
- `2^7 = 128` PERO `126` REDES; `0.0.0.0` y `127.0.0.0` RESERVADAS
- `2^24 – 2 = 16,777,214` hosts direccionables

#### B 
- MASK==`255.255.0.0 (/16)`
- Los dos primeros bits de la dirección de red están fijados a `10`; con lo cual, solo pueden cambiar los catorce bits restantes
- `2^14 = 16.384` redes de Clase B).
- `2^16 – 2 = 65,534 host direccionables`

#### C
- MASK==`255.255.255.0 (/24)`
- Los tres primeros bits de la dirección de red están fijados a `110`; con lo cual, solo 
pueden cambiar los veintiun bits restantes.
- `2^21 = 2,097,152` redes de Clase C
- `28 – 2 = 254` host direccionables

#### D
- Destinadas a realizar emisiones por multicast (envío de un emisor a varios receptores)
- Cuatro primeros bits reservados (`1110`)

#### E
- Destinadas para fines de investigación
- Primeros cuatro bits reservados (`1111`)

### Direcciones de red *reservadas*

| Direcciones                         | Función |
| ---                                 | ---     |
| 0.0.0.0/8 — 0.255.255.255/8         | Operativa propia del router
| 127.0.0.0/8 — 127.255.255.255/8     | **Loopback** local
| 10.0.0.0/8 — 10.255.255.255/8       | PRIVATE IPs (A)
| 172.16.0.0/16 — 172.31.255.255/16   | PRIVATE IPs (B)
| 192.168.0.0/24 — 192.168.255.255/24 | PRIVATE IPs (C) <!--WEIRD!!!!-->
| 169.254.0.0/16 — 169.254.255.255/16 | (*)


- (*) Se usan cuando un host no recibe la información para la configuración automática desde un servidor DHCP. Que un host tenga estas direcciones indica que puede haber algún error de red.

<!--127.0.0.0 a 127.255.255.255, etc. NOTICE mask!!-->