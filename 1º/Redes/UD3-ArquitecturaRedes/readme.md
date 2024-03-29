# Redes - UD3: Arquitectura Redes

## Campus Virtual

- Teoría
  - ud3-teoría.pdf
  - ud3-presentacion.pdf
  - usoBasicoPacketTracer.pdf
  <!-- - [enlace PacketTracer](https://packettracer.network/cisco-packet-tracer-descargue-su-version/) -->
- Actividades
  - [x] Subnetting
  - [x] PacketTracer#1
- [x] Cuestionario


## Mi Trabajo

> [apuntes-ud3-PT.md](/Redes/UD3-ArquitecturaRedes/apuntes-ud3.md)
> 
> [practicals-ud3](/Redes/UD3-ArquitecturaRedes/practicals-ud3.md)


### Cuestionario UD3

| index | cuestionario |
| ---   | --- |
| Q1    | Dada la dirección 200.200.100.0 con direccionamiento por clase crear 6 subredes
| A1    | — `ipcalc 200.200.100.0/24 /27`
| Q2    | BIN to DEC = 001100 && 000011
| A2    | — 12 && 3
| Q3    | DEC to BIN = 64 && 100
| A3    | — 0100.0000 && 0110.0100
| Q4 !  | Elige la VERDADERA
| A4    | — <!--wtf...--> Un HUB permite centralizar el cableado de una red enviando toda la información a todos los paquetes de una red mientras el Switch solo envía la información al ordenador que la necesita.
| Q5 ?  | Un router Se basa en el uso del protocolo IP, por lo que necesita tener asignadas al menos dos direcciones IP, una para Internet(Pública) y otra para la red local.
| A5    | — VERDADERO
| Q6    | Un Firewall
| A6    | — Es un dispositivo que es capaz de filtrar el tráfico de la red y aislar un ordenador de los otros ordenadores de la red.
| Q7 ?  | En la conmutación de paquetes orientada a la conexión es más probable que se pierdan los paquetes por el camino ya que se tiene que dar una conexión previa.
| A7    | — FALSO
| Q8    | Indica la CORRECTA
| A8    | — El modelo OSI es un modelo de referencia Teórico que se compone de 7 capas.
| Q9    | En La comunicación con un dispositivo en la misma red (y asumiendo que ya los dispositivos se conocen mutuamente):
| A9    | — Lo que sucederá es que los datos se enviarán directamente sin necesidad de la intervención del Router.
| Q10   | PDU per Layer...
| A10   | — 1==Bits 2==Tramas 3==Paquete 4==Segmento|Datagrama 5,6,7==Datos


```markdown
# A1
- 200.200.100.0/24
  - 6 subredes = 2^n // n=3
    - 24 + 3 = /27
    - 200.200.100.000-00000 /27

000 001 010 011 100 101 ... 110 111

1. 200.200.100.0
2. 200.200.100.32
3. 200.200.100.64
4. 200.200.100.96
5. 200.200.100.128
6. 200.200.100.160
7. -
8. -
```