# Redes — UD5: Capa Enlace

## Campus Virtual

- Teoría
  - ud5-teoria.pdf
  - ud5-presentacion.pdf
- Cuestionario

> [apuntes-ud5](/Redes/UD5-CapaEnlace/apuntes-ud5.md)

### Cuestionario

| index | cuestionario |
| ---   | --- |
| Q1    | La diferencia entre las tramas en medios cableados (802.3) y la trama en medios inalámbricos (802.11)
| A1    | — Las tramas en medios inalámbricos permiten registrar más direcciones MAC
| Q2    | El subnivel de acceso al medio (MAC) realiza las funciones:
| A2    | — Direccionamiento MAC && Delimitación de las tramas <br> && División dinámica && División estática: multiplexación
| Q3    | El subnivel de enlace lógico (LLC) realiza las funciones:
| A3    | — Control del flujo && Detección de errores && Control de errores
| Q4    | ¿Qué es una trama jumbo?
| A4    | — Una trama que permite enviar hasta 9000 Bytes de datos
| Q5    | El cálculo de redundancia cíclica CRC se basa en realizar la división de la trama utilizando como operador el polinomio por medio del operador OR en el que se descarta el resto y el cociente es el código de verificación
| A5    | — Falso
| Q6    | El polinomio que genera automáticamente el CRC como máximo puede ser de grado:
| A6    | — 31
| Q7    | En el método ventana deslizante los equipos de origen y destino pueden enviar simultáneamente varias tramas sin tener la confirmación ACK de cada una de ellas
| A7    | — Verdadero
| Q8    | En un método de control de flujo basado en ventana deslizante como actúa el ARQ del sistema
| A8    | — Vuelta atrás, rechaza todas las tramas enviadas y las vuelve a reenviar todas && <br> Rechazo selectivo, si existe un error en el envío de la trama se vuelve a transmitir la trama y el sistema es capaz de ordenar las tramas
| Q9    | ¿Hasta cuántos posibles valores de tiempo de espera pueden tomar los equipos en el protocolo de acceso al medio CSMA/CD?
| A9    | — 2^10 ~~&& Se incrementa hasta llegar al límite de las 16 colisiones~~
| Q10   | ¿Qué se codifica en el campo 802.Q?
| A10   | — Si el equipo forma parte de una VLAN