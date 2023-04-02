# Redes — UD7: Nivel de Red & Transporte

## Campus Virtual

- Teoría
  - ud7-teoria
  - ud7-presentacion
- Cuestionario


> [apuntes-ud7](/Redes/UD7-CapasRedTransporte/apuntes-ud7.md)

### Cuestionario

| index | cuestionario |
| ---   | --- |
| Q1    | Señala cuáles son los protocolos que actúan a nivel de red:
| A1    | — ICMP - ARP - IP; &emsp; NO: UDP - TCP
| Q2    | En una dirección IP de clase A la parte de host tiene... bits y la parte de red tiene... bits.
| A2    | — 24 y 8
| Q3    | El subnetting nos permite...
| A3    | — Nos permite obtener a partir de BITS de host bits de red para crear subredes <!--~~Nos permite identificar los bits de red que tiene la IP por medio de la notación "/"~~-->
| Q4    | Tengo una IP 192.168.100.0/28 y quiero a partir de esta crear subredes que permitan conectar hasta 6 PCs en cada una. ¿Cuántas subredes puedo crear?
| A4 !! | — 2
| Q5    | ¿Cuántos equipos se pueden redireccionar con la IP 192.168.0.0/26?
| A5    | — 62
| Q6    | ¿Cuál es la máscara de red de la IP 192.168.15.1/25?
| A6    | — 255.255.255.128
| Q7    | ¿Cuál es el broadcast de la subred 192.168.100.0/28?
| A7    | — 192.168.100.15
| Q8    | El comando tracert
| A8    | — Visualización de los saltos de redes que tiene que realizar un paquete para llegar a su destino
| Q9    | Qué número de puerto se suele utilizar para comunicar aplicaciones FTP
| A9    | — 21
| Q10   | El indicador SYN de la cabecera de un segmento TCP indica
| A10   | — señala que el segmento incluye el número de secuencia desde donde va a iniciarse a contar los bytes de los datos que se van a enviar al iniciarse una conexión <br> ~~el número de secuencia del primer byte de los datos que trasporta el segmento.~~
