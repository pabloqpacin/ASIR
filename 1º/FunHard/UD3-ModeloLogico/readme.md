# Hardware — UD3: Modelo Lógico

## Campus Virtual

- Teoría
  - ud3-teoria.pdf
  - ud3-presentacion_A.pdf
  - ud3-presentacion_B.pdf
  - ud3-presentacion_C.pdf
- [Material Complementario](/FunHard/UD3-Modelo-logico/materialComplementario.md)
- Prácticas
  - practica-averias
  - practica-herramientasDiagnostico
- Cuestionario
- Cuestionario UDS1,2,3

> [apuntes-ud3.md](/FunHard/UD3-ModeloLogico/apuntes-ud3.md)


### Cuestionario

| index | cuestionario |
| ---   | --- |
| Q1    | La memoria RAM: Random Access Memory. Se almacenan los datos de los programas que se están utilizando en ese momento. Podemos decir que es:
| A1    | — Memoria a corto plazo.
| Q2    | Juego de instrucciones muy reducido. Conforme las memorias fueron mejorando, la unidad de control se logró diseñar muy rápida para ejecutar las instrucciones. Se refiere a?
| A2    | — **RISC** ~~CISC~~ ~~Ninguna~~
| Q3    | Consiste en la creación de algoritmos que resuelvan problemas por su cuenta.
| A3 ?  | — *IA* ~~Programas~~ ~~Ninguna~~
| Q4    | En cual generación se emplean por primera vez lenguajes de alto nivel no específicos, los lenguajes de programación de propósito general (C, Pascal, Basic, etc)?
| A4    | — ~~1ª~~ **3ª** ~~6ª~~
| Q5    | A cual generación pertenece los ordenadores con una de las siguientes características: Uso de la tecnología basada en válvulas de vacío, tecnología que sustituyó a los interruptores electromecánicos, para dar soporte a los bíestables.
| A5    | — **1ª** ~~2ª~~ ~~3ª~~
| Q6    | Dentro de las fases de las instrucciones del un procesador, La instrucción es decodificada y preparada para la ejecución es:
| A6    | — ~~Fetch~~ *Decode* ~~Execute~~
| Q7    | Una Ventaja del RISC es:
| A7    | — ~~Muchas instrucciones~~ ~~Consumo elevado~~ *Segmentación sencilla*
| Q8    | Es un conjunto de instrucciones almacenado secuencialmente, este concepto corresponde a:
| A8    | — *Programa* ~~BIOS~~ ~~Sistema_Operativo~~
| Q9    | Dispositivos que tienen firmware instalado como por ejemplo:
| A9    | — ~~SistemasOperativos~~ *MP3_Electrodomésticos_Routers* ~~Ordenadores~~
| Q10   | Se carga la dirección en el registro de direcciones. Se decodifica la dirección. Se localiza la celda de memoria. Se copia el contenido de la celda de memoria en el registro de datos
| A10   | — ~~ESCRITURA~~ ~~OPERACIÓN_DE_ESCRITURA~~ **OPERACIÓN_DE_LECTURA**


### Cuestionario UDS1,2,3

| index | cuestionario |
| ---   | --- |
| Q1    | Describe con tus palabras los pasos que se producen en un ordenador desde que damos al botón de encendido hasta que vemos la pantalla del OS.
| A1    | — Al darle al botón activamos un mecanismo que proporciona energía a la máquina. Cuando la máquina se enciende, la BIOS se activa y según esté configurada, pasa el control de la máquina a un dispositivo de almacenamiento u otro (x o y disco duro, usb, etc.). Una vez el dispositivo bootea, se carga su Sistema Operativo de acuerdo con la partición primaria correspondiente.
| Q2    | ¿Qué es el Firmware?
| A2    | — Es un desarrollo de código que se encarga de que el hardware funcione correctamente.
| Q3 !  | ¿Qué es **rescatux**?
| A3    | — ~~*Herramienta desarrollada en Linux para recuperar archivos del sistema NTFS.*~~ Una herramienta que nos permite recuperar el cargador(arranque) del sistema operativo.
| Q4    | ¿Qué es un botnets?
| A4    | — Una red que tiene a su cargo a una serie de equipos o robots informáticos (bots), que funcionan de forma autónoma.
| Q5    | Los honeypot…
| A5    | — Simulan un sistema vulnerable, para monitorizar los ataques y tomar nota del ocurrido.
| Q6    | ¿Qué es Recuva?
| A6    | — Programa de recuperación de datos perdidos.
| Q7 !  | El **NorthBridge** o puente norte…
| A7    | — *Es el encargado de gestionar la memoria RAM, los puertos gráficos (AGP) y el acceso al resto de componentes del chipset, así como la comunicación entre estos y el procesador.*
| Q8    | La **BIOS** es (Elige varias)
| A8    | — ~~1—Lo segundo que se ejecuta al encender un ordenador después de la memoria RAM.~~ 2—Una memoria que permite reconocer los fallos de hardware. 3—Una secuencia de códigos de ejecución (software) almacenada en un chip de la placa base (hardware). 4—Una memoria No-Volátil que siempre está funcionando gracias a una pila que podremos ver en la placa base.
| Q9    | La UEFI es la versión moderna de la BIOS, con una interfaz más bonita que permite interactuar con el ratón y no solo con el teclado. La BIOS tiene un diseño antiguo.
| A9    | — VERDADERO
| Q10   | Elige la correcta:
| A10   | — El formateo físico define el tamaño de los bloques, su número y la ubicación de los discos mientras que el formateo lógico define las particiones, comprueba la integridad de los bloques y define los crusters.
| Q11   | Rufus es un programa que:
| A11   | — Nos permite crear un USB booteable.
| Q12   | Las copias de seguridad pueden ser:
| A12   | — Completa, incremental, diferencial y en espejo
| Q13   | La memoria RAM…
| A13   | — La memoria RAM es una memoria de corto plazo volátil. Los datos se almacenan de forma temporal hasta que apagamos el ordenador
| Q14   | Las **fases de una instrucción** dentro del procesador son:
| A14   | — *Fetch, decode, execute y store*
| Q15   | ¿Qué nos permite usar RAID?
| A15   | — Varios discos duros como si fueran uno solo. Idealmente tendrán el mismo tamaño y specs (de hecho serán el mismo modelo) y podremos establecer redundancia para garantizar la integridad y seguridad de los datos. Destacan RAID 0, 1, 5, 6 y opcionalmente 10.
| Q16   | Señala la opción verdadera sobre **RAID**.
| A16   | — ~~El RAID 0 también se denomina RAID en espejo.~~ El RAID 6 tiene la misma dinámica que el RAID 5 pero con dos bloques de paridad y usando un disco más. Su ventaja es que pueden fallar dos discos sin perder la información.
