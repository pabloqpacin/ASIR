# Hardware — UD2: Software Respaldo

## Campus Virtual

- Teoría
  - ud2-teoria.pdf
  - ud2-presentacion.pdf
- Prácticas
  - practica-RAID
  - practica-Clonezilla
- Material Complementario <!--Fuentes Alimentación-->
- Cuestionario


> [apuntes-ud2](/FunHard/UD2-SoftwareRespaldo/apuntes-ud2.md)


### Cuestionario

| index | cuestionario |
| ---   | --- |
| Q1    | La señal inicial que va desde la fuente de alimentación a la placa base se denomina 'God Power'.
| A1    | — **FALSO** <!--wtffffff-->
| Q2    | ¿Cuál de las siguientes definiciones se ajusta más a la descripción de la BIOS?
| A2    | — Secuencia de códigos almacenados en un chip integrado en la placa base.
| Q3    | Selecciona de las siguientes las que sean restricciones de MBR. (Hay más de una correcta).
| A3    | — (1 - Las particiones lógicas solo se pueden crear en una partición extendida.) (2 - Las particiones lógicas no pueden almacenar un S.O.) (3 - Máximo una partición extendida.)(4 - Máximo 4 particiones primarias)
| Q4    | ¿Cuál de las siguientes definiciones es correcta?
| A4    | — *En el formateo lógico se comprueba la integridad de los bloques y se rescribe la tabla de particiones.* {físico == El formateo lógico define el tamaño de los bloques, su número y su ubicación en los discos.}
| Q5    | Selecciona la respuesta correcta.
| A5    | — *La copia de seguridad **incremental** utiliza las fechas y horas para saber en que archivo se han realizado modificaciones.* {~~La copia de seguridad diferencial realiza copias en base a la última copia de seguridad.~~ ES EN BASE A LA ÚLTIMA **COMPLETA**}
| Q6    | ¿Cuál de las siguientes definiciones es correcta?.
| A6    | — *El RAID 0 es más propenso a perder información ya que no existe redundancia.* {NO==(El RAID 1 es más lento tanto escribiendo como leyendo que el RAID 0, pero tiene menos probabilidad de perdida de información.)(RAID. Redundant Array of Inseparable Disks. Consiste en juntar una cantidad de discos duros para que funcionen como una unidad.)}
| Q7    | Seleccionar la opción INCORRECTA.
| A7    | — *El RAID 1 tiene peor tiempo de lectura que el RAID 0.* {~~El RAID 6 es más seguro que el RAID 5.~~ ~~El RAID 5 es más eficiente que el RAID 6.~~ ~~El RAID 0 tiene menor tolerancia a fallos que el RAID 1.~~}
| Q8    | ¿Para qué se utiliza la herramienta RUFUS?
| A8    | — USB booteable
| Q9    | En el escritorio tenemos un Directorio (Directorio_1) y dentro de ese directorio hay otro directorio (Directorio_2). ¿Cuál de los siguientes comandos se utilizaría para acceder a la carpeta 2 si abrimos una terminal en el escritorio?
| A9    | — `cd Directorio_1/Directorio_2`
| Q10   | ¿Qué ocurre si en un RAID0 falla uno de los discos?
| A10   | — *Se pierde la información contenida.*