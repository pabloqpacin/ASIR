# Redes — UD7: Nivel de Red & Transporte

<!-- > SUBNETTING => []() && []() -->

## ud7-teoria

```markdown
1. Familia de Protocolos TCP/IP
2. La Capa de Red
   1. Protocolo IP
   2. Direccionamiento IP
      1. Direccionamiento IPv4
      2. Formato de datagrama IP
   3. Protocolo ARP
   4. Protocolo ICMP
3. La Capa de Transporte
   1. Puertos
   2. Protocolo UDP
   3. Protocolo TCP
```

1. Familia de Protocolos TCP/IP [...]
2. **La Capa de Red** (*encaminamiento entre LANs*)
   1. **Protocolo IP**
       - Datagramas IP &ensp; - &ensp; NO_ORIENTADO_CONEXIÓN &ensp; - &ensp; NO_CONFIABLE
   2. **Direccionamiento IP**
       - IP/equipo &ensp; - &ensp; públicas || privadas &ensp; - &ensp; estáticas || dinámicas &ensp; - &ensp; IPv4 || IPv6 (32||128)
      2. **Direccionamiento IPv4**
          - (netid VS hostid) *CLASES* == A.`0+7` || B.`10+14` || C.`110+21` || D.`1110`.multicast || E.`11110`
          - *SubnetMask* == 255.0.0.0 (`/8`) || 255.255.0.0 (`/16`) || 255.255.255.0 (`/24`)
          - *Direcciones Reservadas* == 0.0.0.0 - 0.0.0.10 - 127.0.0.1 - 169.254.0.0 - 192.168.1.0 - 192.168.1.255 - 255.255.255.255
          - *Direcciones Privadas* == (RFC 1918) `10.0.0.0`; `172.16.0.0`-`172.31.0.0`; `192.168.0.0`-`192.168.255.0`
          - *Gateway* == 'IP Router'
          - *SUBNETTING* == bits Host > bits Red (`2^n`) **[...]**
          - *CIDR* == eg. /25 => 2^32-25=2^7 posibles Direcciones en Red! &emsp; // **VLSM** &emsp; // [*SUPERNETTING*](https://www.geeksforgeeks.org/supernetting-in-network-layer/)
          - *Transición IPv4 > IPv6* == pila dual (IPx2enRed) || túnel (6>4):: ISATAP
      3. **Formato de datagrama IP**
          - **Campos del datagrama IP** ([doc](http://www.tcpipguide.com/free/t_IPDatagramGeneralFormat.htm))
            - *VERSION* == [4b] "IPv4"
            - *IHL* == [4b] header length (5-15...)
            - *TOS* == [8b] &ensp; // Prioridad 0-7 [3b] + D || T || R [4b] + MBZ [1b]
            - *TL* == [16b] longitud max total Datagrama (~65kb)
            - *IDentificación* == [16b] por-si Fragmentación paquete
            - *Flags* == [3b] Reservado || DF || MF.`0-1`
            - *Despl.Fragmentación* == [13b] (...)
            - *TTL* == [8b] límite Saltos-Routers en red... salto=-1, 0=drop
            - *Protocolo* == [8b] info altoNivel :: 1=ICMP 2=IGMP 4=IP-in-IP-Encapsulation 6=TCP 17=UDP ...
            - *CRC Cabecera* == [16b] evita corrupción envío; se comprueba en cada Salto <!--checksum-->
            - *Dir IP Origen* == [32b] (original)
            - *Dir IP Destino* == [32b] (destino final)
            - *Opciones IP* == [...]
            - *Relleno* == extra.Opciones
            - *Datos* == [!]
          - **Fragmentación: relación Datagramas/Tramas**
            - *MTU* == 1500 bytes (Ethernet) || 9000 bytes (jumbo) || 8192 bytes (Token-Ring) -- header 20b + datos 1480b
   3. **Protocolo ARP**
       -  *Tabla ARP* == (DIFUSIÓN Q > A) IP > MAC; tiempoVida &emsp; `arp -a`
   4. **Protocolo ICMP**
       - diagnóstico Red; CAMPOS Datagrama IP => Cabecera ([Tipo](https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml)1byte, Código1b,Checksum2b,else4b)
         <!-- - TIPOS == 0=EchoReply 3=DestinationUnreachable 4=SourceQuench 5=Redirect 8=Echo 11=TimeExceeded (...) -->
         - *Solicitud-respuesta eco* == [8,0] comunicación entre hosts; `PING`
           - *Equipo inaccesible* == [3]
           - *Redireccionar* == [5] Router1 pide a Host que use Router2
           - *Tiempo excedido* == [11] TTL = 0
             - `tracert`||`traceroute` == (TTL) Salto = "[11]"
         - *Disminución tráfico origen* == [4] router pide host bajarVelocidad||esperar (buffer overwhelmed)
3. **La Capa de Transporte** <!--PDU: Segmento-->
   1. **[Puertos](https://packetlife.net/media/library/23/common-ports.pdf)**
       - canales conexiones - Servicios red &emsp; // 16 bits => 65536 puertos
         - *Conocidos* == [0-1023] &emsp; // 20|21=FTP &ensp; 25=SMTP &ensp; 53=DNS &ensp; 67|68=DHCP &ensp; 80=HTTP &ensp; 110=POP3 &ensp; 443=HTTPS &ensp;
         - *Registrados* == [1024-49151]
         - *Dinámicos-privados* == [49152-65535]
       - [ ] `netstat` && `ss` ([doc](https://linuxconfig.org/bash-netstat-command-not-found-debian-ubuntu-linux))
   2. **Protocolo UDP**
       - NO_ORIENTADO_CONEXIÓN + NO_CONFIABLE
       - Campos Segmento:
         - *Puerto UDP Origen* == [16b] Op.
         - *Puerto UDP Destino* == [16b]
         - *Longitud mensaje UDP* == [16b]
         - *UDP Checksum* == [16b] Op.
         - *Datos*
   3. **Protocolo TCP**
       - ORIENTADO_CONEXIÓN + CONFIABLE
       - Campos Segmento: ([doc](https://www.ibm.com/docs/en/aix/7.2?topic=protocols-tcp-header-field-definitions))
         - *Puerto TCP Origen* == [16b]
         - *Puerto TCP Destino* == [16b]
         - *Número Secuencia* == [32b] Specifies the sequence number of the first byte of data in this segment.
         - *Número ACK* == [32b] núm secuencia siguiente byte que se espera [!]
         - *HLEN* == [4b] (min 5)
         - *Reservado* == [4b]
         - *CÓDIGO* == [6b] Propósito-contenido: `URG`|`ACK`|`PSH`|`RST`|`SYN`|`FIN`
         - *Ventana* == [16b] tamaño ventanaDeslizante Destino (memoria)
         - *Checksum* == [24b] incluye IPs Origen y Destino
         - *Puntero Urgencia* == [8b] indica Siguiente Urgente
         - *Opciones* == Op. tamaño máximo
         - *Relleno* == case múltiplo 32 bits
         - *Datos*
       - **CONFIABILIDAD** == parada-espera (`ACK` || `ARQ`) || ventanaDeslizante
   4. **CONEXIONES**
       - [ ] *Socket* == `direcciónIP:puerto` == apertura pasiva(escuchar)||activa(conectar.`SYN`) &emsp; // cierre :: `FIN` + `ACK`