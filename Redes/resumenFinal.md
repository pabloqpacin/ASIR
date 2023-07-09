# Redes — Resumen Total

<details>
<summary>Table of Contents</summary>

- [Redes — Resumen Total](#redes--resumen-total)
  - [101](#101)
    - [1. Subnetting](#1-subnetting)
    - [2. PDUs](#2-pdus)
    - [3. Protocolos](#3-protocolos)
    - [4. Puertos](#4-puertos)
  - [UD1: Sistemas Numéricos](#ud1-sistemas-numéricos)
  - [UD2: Redes 101](#ud2-redes-101)
  - [UD3: Arquitectura Redes](#ud3-arquitectura-redes)
  - [UD4: Capa Física](#ud4-capa-física)
    - [1. Intro](#1-intro)
    - [2. Infraestructura física](#2-infraestructura-física)
  - [UD5: Capa Enlace](#ud5-capa-enlace)
    - [1. Funciones \& Subcapas MAC LLC](#1-funciones--subcapas-mac-llc)
    - [2. Formación/Delimitación Tramas](#2-formacióndelimitación-tramas)
    - [3. Acceso al Medio](#3-acceso-al-medio)
    - [4. Control de Errores](#4-control-de-errores)
    - [5. Control Flujo](#5-control-flujo)
  - [UD6: Dispositivos Interconexión](#ud6-dispositivos-interconexión)
    - [1. Dispositivos nivel Físico \& Enlace](#1-dispositivos-nivel-físico--enlace)
    - [2. Conmutadores: VLANs \& SpanningTree](#2-conmutadores-vlans--spanningtree)
  - [UD7: Capas Red \& Transporte](#ud7-capas-red--transporte)
    - [1. Capa de Red](#1-capa-de-red)
    - [2. Capa de Transporte](#2-capa-de-transporte)
  - [UD8: Enrutamiento](#ud8-enrutamiento)


</details>

## 101

### 1. Subnetting

- **Fórmulas:**
  - *x Subredes:* `2^n=>x` `/mask + n`
  - *x Hosts:* `2^n-2=>x` `/32 - n`
- **Acividades/Ejemplos:**

<details>

```markdown
# [1] 192.168.0.0/24 --> 8 subredes
- 2^n=x; 8=2^3; /24+3=/27; 192.168.0.000-00000
    - 192.168.0.001... 192.168.0.010... 192.168.0.011...

# [2] 192.168.11.0/24 --> 3 subredes (30hosts, 10hosts, 5hosts)
- 2^n-2=x; 30=2^5-2; /32-5=/27; 192.168.11.000-00000
    - 192.168.11.0/27 - 192.168.11.31/27
- 2^n-2=x; 10=2^4-2; /32-4=/28; 192.168.11.0001-0000
    - 192.168.11.32/28 - 192.168.11.47/28
- 2^n-2=x; 5=2^3-2; /32-3=/29; 192.168.11.00011-000
    - 192.168.11.48/29 - 192.168.11.55/29

# [3] 194.168.16.0/24 --> 10 subredes, 10 hosts cada una
- 2^n-2=x; 10=2^4-2; /32-4=/28; 194.168.16.0000-0000
    - 194.168.16.0, 194.168.16.32, ...

# [4]  Clase B tiene 8 subredes --> mask (2500 hosts/subred)
- 128.0.0.0/16
- 2^n-2=x; 2500=2^12-2; /32-12=/20; 128.0.0000-0000.00000000

# [5] 172.17.111.0/23 --> num subredes & hosts válidos por subred
- 172.17.0110111-1.0
    - /23 - /16 = 7; 2^7= 128 subredes
    - /32 - /23 = 9; 2^9-2= 510 hosts

```

</details>

### 2. PDUs

| Capa          | PDU |
| ---           | --- |
| 1. Física     | bit
| 2. Enlace     | frame
| 3. Red        | packet
| 4. Transporte | segment/datagram (TCP/UDP)
| n. Aplicación | data

### 3. Protocolos

| Capa          | Protocolo
| ---           | ---
| 2. Enlace     | WiFi Ethernet -ARP-
| 3. Red        | IP ICMP -ARP-
| 4. Transporte | TCP UDP
| n. Aplicación | DNS DHCP FTP HTTP SMTP/POP

### 4. Puertos

| Port  | Tech
| --:   | :--
| 20/21 | FTP
| 22    | SSH
| 53    | DNS
| 67    | DHCP
| 80    | HTTP 
| 110   | POP3
| 443   | HTTPS
| 3306  | MySQL

<hr>

## UD1: Sistemas Numéricos

- **Conversión:** decimal / binaria / octal / hexadecimal

<hr>

## UD2: Redes 101

- **Red Informática:**
  - *Características:* conectividad, escalabilidad, optimizaciónCostes, seguridad
  - *Abstracción Componentes:* emisor, receptor, medio, mensaje(protocolos), ruido
  - *Componentes Físicos:* tarjetaRed, cables (coaxial|parTrenzado|fibra), cableadoEstructurado, dispositivosInterconexión(hub|repetidor|switch|PoA|router|firewall)
  - *Clasificación según:*
    <!-- - *Medio:*
      - *punto-a-punto:* conmutaciónCircuitos | conmutaciónPaquetes (orientadaConexión | datagramas)
      - *multipunto* -->
    - ***Direccionalidad:*** **simplex | half-duplex | full-duplex**
    - *Cobertura:* PAN | LAN | CAN | MAN | WAN
    - *Topología:* bus | anillo | estrella | árbol | malla
    - *Medio:* cableadas (`802.3`) | inalámbricas (`802.11`)
    - *Relación Funcional:* cliente-servidor | P2P
    - *Privacidad:* públicas | privadas

<hr>

## UD3: Arquitectura Redes

- **Conceptos:**
  - *Caracerísticas:* topología + métodoAcceso + protocolos
  - *Desafíos:* encaminamiento, direccionamiento, accesoMedio, saturaciónReceptor, mantenimientoOrden, controlErrores, multiplexación
  - [ ] *Encapsulación:* datos aplicación en PDU según Capa, correspondientes cabecera (direccionamiento/protocolos) y cola (controlErrores)
- **Modelos/capas:**
  - **OSI:**
    1. *Física:* `bits` // características mecánicas|eléctricas|funcionales|deProcedimiento
    2. *Enlace:* `tramas` // MACs, control, detecciónErrores
    3. *Red:* `paquetes` // IPs, enrutamiento, direccionamiento
    4. *Transporte:* `segmentos`|`datagramas` // TCP/UDP, secuenciamiento, controlErrores
    5. *Sesión:* diálogo...
    6. *Presentación:* formato datos
    7. *Aplicación:* servicio
  - **TCP/IP:** 
    1. *AccesoRed:*
       - *Nivel Físico:* `802.3` | `802.11` 
       - *Nivel Enlace:* direccionamiento físico MACs en controlAccesoMedio
         - **MAC:** 48 bits = 24 fabricante + 24 dispositivo (`FF:FF:FF:FF:FF:FF`)
         - **Trama:** cabecera (MACs+tipoTrama) + packet + cola (controlErrores)
    2. *Red/Internet:*
       - *funciones:* direccionamiento lógico IPs, conectividad, enrutamiento, controlCongestión
       - *protocolos:* `IP` `ICMP` `OSPF/RIP` `ARP`
    3. *Transporte:*
       - *funciones:* ...
       - *protocolos*: `TCP` `UDP` 
    4. *Aplicación:* alto nivel...

<hr>

## UD4: Capa Física

### 1. Intro

- **Conceptos:**
  - *Elementos físicos:* características mecánicas | eléctricas
  - *Señales:* analógicas | digitales => 'modulación'
    - *Características Señales:* amplitud | frecuencia | faseIntervalo | anchoBanda
    - *Perturbaciones transmisión:* atenuación | distorsión | ruido
  - *Medios transmisión/factores:*
    - *Inalámbricos:* espectroFrecuencia
    - *Cableados:* velocidad, anchoBanda, espacioRepetidores, fiabilidad, coste, facilidadInstalación

### 2. Infraestructura física


- **NIC / TARJETA RED**
  - Conecta ordenador/red (puerto PCI|PCMI)
  - Porta dirección MAC + protocolos
  - *Componentes:*
    - Procesador principal
    - Conexión bus
    - Zócalo ROM-BIOS
    - Conector Wake-On-LAN
    - Transceptor: accesoMedio + CSMA/CD
    - Indicadores estado: LNK | ACT | COL | velTransmisión
    - Conexión red: RJ45 | antena
  - *Software:*
    - Drivers PC OS => Centro Redes
- **CABLES**
  - **ParTrenzado:**
    - *Conceptos:*
      - 8 hilos: naranja+verde+azul+marron+*blanco (568A | 568B)
      - Directo (diferente tipo dispositivo) | Cruzado (mismo tipo dispositivos)
      - max 100m
    - *Tipos:* UTP | STP | FTP
    - *Clasificación:*
      - Categoría: materiales,vueltas/metro... 1-8
      - Clase: anchoBanda... A-F (D=100MHz, E=250MHz, F=600MHz)
      - *FastEthernet:* 6E=1Gb/s, 7F=10Gb/s
    - *Nomenclatura:* 100BASE-T == Cat5d...
  - **Coaxial:**
    - Grandes distancias
    - Terminación BNC
    - *Tipos:* BandaBase (Grueso==10BASE-5, Fino==10BASE-2) | BandaAncha (xBROAD-y)
  - **FibraÓptica:**
    - Luz
    - *Tipos:* monomodo | multimodo | multimodoÍndiceGradual
    - *Nomenclatura:* 100BASE-SX. 1000BASE-LH... (100Mb/s, 1000Mb/s)
- **CABLEADO ESTRUCTURADO:**
  - *Tareas:* ...
  - *Subsistemas:*
    - *Horizontal:* planta (hubs, switches...)
    - *Vertical:* entre plantas, une horizontales
    - *Cuarto servidores:* rack central (servers, routers... SAI)
- **PUNTOS ACCESO**
  - *Desafíos:* reflexión, difracción, dispersión
  - *Frecuencias:* 2.4GHz & 5GHz
  - *Seguridad:* ocultarSSID, encriptación (WEP|WPA|WPA-PSK), auth, filtradoMACs

<hr>

## UD5: Capa Enlace

### 1. Funciones & Subcapas MAC LLC

- **Funciones:**
  - Elaboración tramas
  - Control acceso al medio
  - Control errores (envío tramas)
  <!-- - Control flujo  -->
- **Subcapas:**
  - *MAC - Medium Access Control* - `802.3`
    - Delimitación trama: en cadena bits física
    - Direccionamiento estaciones: direcciones MAC
    - Protocolo acceso al medio: arbitraje comunicación en LAN compartida
  - *LLC - Logical Link Control* - `802.2`
    - Define acceso datos al medio físico
    - Detección y tratamiento errores: eliminar tramas erróneas, solicitar retransmisiones, descartar duplicados
    - Adecuar flujo datos: entre emisores rápidos y receptores lentos

### 2. Formación/Delimitación Tramas

- **Campos trama/bytes:**
  - tamaño mínimo = 64 bytes | 512 bits
  - *Preámbulo y SDF:* sincronización — 10101010x7 10101011x1
  - *Direcciones MAC:* origen & destino — 6x2
  - *Etiqueta 802.1Q:* opcional, caso VLAN — 4
  - *Longitud/tipo:* ...
  - *Datos:* datos capas superiores — 46-MTU (1500 | 9000)
  - *CRC:* algoritmo verificación emisor/receptor — 4
  - *InterFrameGap:* '96 bit times'

### 3. Acceso al Medio

- **División Estática:** multiplexación
  - *TDMA:* Tiempo — anchoBanda entre canales según intervalos
  - *FDMA:* Frecuencia — distinta frecuencia para distintas señales
  - *SDMA:* Spacio — ...
  - *CDMA:* Código — distinta codificación para distintas señales
- **División Dinámica:** CSMA/CD
  - Dispositivo 'escucha' medio, comprueba libre, habla
  - Si habla simultánea => colisión
  - Si colisión => dispositivo envía notificación *jam* & todos dispositivos *backoff* (tiempo espera) (2^n : n=numColisiones; n max = 16)
  - *TOKEN RING:* ...

### 4. Control de Errores

- **Detección:** CRC
  - Cola tramas; comprobación origen + destino
  - Polinomio max grado 31
- **Corrección:**
  - *Errores:*
    - *Tramas perdidas:* 'confirmaciones positivas' => no se recibe ACK => retransmisión tras temporizador
    - *Tramas dañadas:* bits erróneos según CRC => ACK negativo => retransmisión
  - *Técnicas:* ARQ
    - *Parada y espera:* retransmisión tras temporizador
    - *Vuelta atrás N:* retransmitir trama x + todas posteriores (según VentanaDeslizante)
    - *Rechazo selectivo:* retransmitir trama x

### 5. Control Flujo

- **Parada-Espera:**
  - trama -> ACK -> trama -> ACK -> ...
- **Ventana Deslizante:**
  - Buffer: memoria virtual NIC => almacena n tramas simultáneamente
  - n tramas -> n ACK -> (ventana desliza) -> n tramas -> ...

<hr>

## UD6: Dispositivos Interconexión

### 1. Dispositivos nivel Físico & Enlace

- **Nivel Físico**
  - *Modem:*
    - modulación analógica~digital
    - DSL (líneaTelefónica) | cable (líneaCoaxialTV)
  - *Repetidor|Amplificador:*
    - señal digital|analógica
  - *Concentrador:* HUB|MAU
    - pasivos|activos (repiten|amplían)
    - crossover: unión cascada
    - 1 domColisión 1 domBroadcast
- **Nivel Enlace**
  - *PuntoAcceso:*
    - red inalámbrica
  - *Puente:*
    - unión distintas redes/topologías/tiposCable
    - fases gestión tramas: memoria -> CRC -> destinoMAC|floodingBroadcast
    - tipos: 802.X | transparentes | remotos
  - *Conmutador:* Switch
    - segmentación LAN, gestión anchoBanda
    - tablaDireccionesMAC
    - \* domColisión | 1 domBroadcast (salvo VLAN!!)
    - *configConsola:* user|admin:
      - confGlobal: MACs, IP
      - confInterfaz: shutdown, sentido(duplex...), velocidad, spantree
      - confVLAN: 
      - confLínea: setup remoto

### 2. Conmutadores: VLANs & SpanningTree

- **VLANs:**
  - Ventajas: red flexible/segmentada, velocidad, anchoBanda, seguridad, domBroadcast independientes
  - tipos:
    - *VLAN Tagging:* en NIC (802.1Q), dispositivo/MAC añade 'etiqueta' a frames
    - *VLAN Untaggin:* config en puertos Switch
- **SpanningTree:**
  - evitar tormenta broadcast
  - selección rootBridge -> camino más corto

<hr>

## UD7: Capas Red & Transporte

### 1. Capa de Red

- **Protocolo IP:**
  - NO CONFIABLE (Transporte ordena)
  - *Direccionamiento según:*
    - Visibilidad: públicas | privadas
    - Configuración: estáticas | dinámicas
    - Versión: IPv4 | IPv6
- **Direccionamiento IP:**
  - *Clases:* A `0.` - B `10.` - C `110.` - D - E
  - *Máscara de red:* ...
  - *Direcciones reservadas:* red, broadcast, loopback...
  - *Puerta de enlace:* 'router'
  - *Subnetting:* ...
  - *CIDR:* VLSM...
- **Campos paquetes/bytes:**
  - ...
- **Protocolos ARP | ICMP:**
  - *Tabla ARP:* pregunta difusión IP -> respuesta MAC -> tabla / TTL
  - *ICMP:*
    - ...
    - `ping`: solicitud/respuesta de echo con TTL (tipos 8,0,11)
    - otros: equipoInaccesible (tipo 3), disminuciónTráficoOrigen (tipo 4), redireccionar (tipo 5), tiempoExcedido (tipo 11)
    - `traceroute`: ...

### 2. Capa de Transporte

- **Puertos:**
  - *16 bit (65536):* conocidos (0-1023) | registrados (1024-49151) | privados (49152-65535)
    - 0-1023: 20/21-FTP 25-SMTP  53-DNS 67/68-DHCP 80-HTTP 110-POP3
  - `netstat`: ...
- **Protocolo UDP:**
  - NO CONFIABLE
  - *datagrama*: cabecera (puertos emisor/receptor) + datos
- **Protocolo TCP:**
  - CONFIABLE
  - *segmento:* cabecera + datos
    - puertos origen/destino
    - numSecuencia (bytes orden datos) + acuseRecibo (siguiente byte)
    - HLEN + reservado
    - Bits código/indicadores: URG | ACK | PSH | RST | SYN | FIN
    - Ventana: ...
    - Checksum
    - Puntero de urgencia
    - Opciones + relleno + datos
  - *Técnicas fiabilidad:* paradaEspera + ventanaDeslizante
  - *Conexiones:* escucha + conexión
    - *inicio:* SYN -> SYN ACK -> ACK
    - *cierre:* FIN -> ACK ; FIN -> ACK

<hr>

## UD8: Enrutamiento

- **Conceptos:**
  - métrica: num saltos entre dispositivos (routers) | anchoBanda, latencia
  - distancia administrativa: menor métrica
- **Tipos:**
  - *directo:* `route` ...
  - *estático:* ...
  - *dinámico:* routers comparten info
    - *categorías:* IGP | EGP (local|remote)
    - **Protocolos Enrutamiento Dinámico:**
      - tipos: classful | classless (noMask | Masks=redDistintaClase)
      - *Vector-Distancia:* mejor ruta = más corta (numSaltos) // envíoTablaEnrutamiento completa // RIP
        - intercambio cada 30s, max 15 saltos, omunicación UDP puerto 520, posible encriptamiento... RIPv1 | v2 (ful|less)
      - *Estado Enlace:* saltos + otrosFactores (router memoria importante) // 3 tablasEnrutamiento, topologíaCompleta // OSPF

