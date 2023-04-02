# Redes — UD6: Dispositivos Interconexión Red (I)


## Campus Virtual

- Teoría
  - ud6-teoria.pdf
  - ud6-presentacion01.pptx
  - ud6-presentacion02.pptx
- Actividades
  - Práctica Packet Tracer #2
- Cuestionario

---

> [apuntes-ud6](/Redes/UD6-DispositivosInterconexion01/apuntes-ud6.md)
> 
> [practica-PT.md](/Redes/UD6-DispositivosInterconexion01/practica-PT02.md)


### Cuestionario

| index | cuestionario |
| ---   | --- |
| Q1    | Asocia en qué nivel trabajan los diferentes dispositivos de red:
| A1    | — Switch==Enlace Modem==Físico Bridge==Enlace Hub==Físico
| Q2    | Señala las características de un módem ADSL
| A2    | — Cable telefónico (ancho de banda distinto de la línea telefónica) && <br> La velocidad de bajada es distinta de la velocidad de subida ~~&& Televisión por cable~~
| Q3    | Qué diferencias existen entre los Bridges y los Hubs
| A3    | — Los hubs establecen un único dominio de colisión mientras que los bridges establecen varios dominios de colisión, uno por cada interfaz de conexión && <br> &emsp; Los bridges normalmente tienen un número pequeño de interfaces (de dos a cuatro), mientras que los hubs pueden llegar a tener docenas <br> ~~&& Los hubs y los bridges trabajan con las direcciones MAC de las tramas~~
| Q4    | ¿Qué función de las siguientes no es específica de los Switch que trabajan a nivel de enlace?
| A4 ?  | — Encaminar paquetes &ensp; ~~Convertir tramas Ethernet en tramas Token ring~~
| Q5    | ¿En qué dispositivo se produce una menor distorsión (ruido) al unir varios en forma de cascada?
| A5    | — Repetidores
| Q6    | Qué dispositivos permiten crear un único dominio de broadcast para toda la red y segmentar los dominios de colisión por cada puerto al que está conectado
| A6    | — Switch && *Bridges* <!-- NO Repetidor || Hub-->
| Q7    | Indica qué afirmaciones son verdaderas sobre las VLAN
| A7    | — Las VLAN permiten crear redes lógicas que funcionan de forma independiente dentro de una misma red física && <br> Permite crear segmentos de red con dominios de broadcast independientes
| Q8    | Indica qué afirmaciones son verdaderas sobre la configuración de VLAN en modo tagging
| A8 !? | — Admite tramas modificadas con la cabecera de la VLAN && <br> El conmutador sólo conmuta la información trama <br> ~~&& El conmutador interpreta la trama según la configuración de las VLAN de los puertos~~
| Q9    | Si queremos conectar 2 switches que puedan compartir varias VLAN, en qué modo tienen que estar configurados los puertos que forman parte del uplink
| A9    | — modo TRUNK
| Q10   | Una tormenta de broadcast se genera por la transmisión redundante de tramas cuando se forman bucles entre las interconexiones de los switchs
| A10   | — Verdadero