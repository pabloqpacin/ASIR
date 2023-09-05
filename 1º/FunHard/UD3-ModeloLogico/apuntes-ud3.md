# Hardware — UD3: Modelo Lógico

- [Hardware — UD3: Modelo Lógico](#hardware--ud3-modelo-lógico)
  - [1. ud3-teoria.pdf](#1-ud3-teoriapdf)
  - [ud3-presentacion\_A — Von Neumann](#ud3-presentacion_a--von-neumann)
  - [ud3-presentacion\_B — Configuración, diagnóstico e interconexión de equipos](#ud3-presentacion_b--configuración-diagnóstico-e-interconexión-de-equipos)
  - [ud3-presentacion\_C — Entornos Operativos, Utilidades](#ud3-presentacion_c--entornos-operativos-utilidades)



## 1. ud3-teoria.pdf

- **Modelo JVN (John Von Neumann)**
  - CPU (+ RAM) + periféricos entrada + periféricos salida // comunicación via BUSes
  - partes Procesador:
    - **CU**: busca instrucciones en memoria, las interpreta -decode- y envía hasta instrucción 'HALT' (envía a PU, RAM, I/O...)
    - **PU + ALU**: ejecutan tareas asignadas por **CU** // guardan resultados en *registros* ('acumulador ACC')
    - **RAM**: celda==1byte celdilla==1bit // biestables: 1 o 0 // **direcciones** [2^n] y accesos de lectura/escritura
  - Operaciones de RAM:
    - **Lectura** (Dirección): se carga dirección en 'registro de direcciones', se decodifica la dirección, se localiza la celda de memoria, se copia su contenido en el 'registro de datos'
    - **Escritura** (Valor en Dirección): se carga dirección en 'registro de direcciones', se carga información por escribir en 'registro de datos', se decodifica dirección, se copia la info del 'registro de datos' en la celda de memoria
  - TIEMPOS lectura-escritura: RAM==nanosegundos < DiscoDuro==milisegundos
  - Otros componentes arquitectura...
    - Procesador SOC VS arquitectura x86 // SOC==ARM versátiles tipo smartphone, más funciones con menos componentes
    - Coprocesadores SOC
    - Coprocesador GPU
    - **CISC vs RISC** // CISC==retro RISC==moderno (RISC==menos instrucciones)
  - Otros conceptos...
    - AI+ML+DL // **aplicaciones:** arquitectura procesadores... reacción a voz, gestos, facial
  - **Generaciones de la Computación:**

| Gen | Fechas    | Características
| --- | ---       | ---
| 0   | -         | ábaco, tablas logarítmicas, Pascalina, punchcards, sistema binario...
| 1ª  | 1940-1956 | interruptores electromecánicos y válvulas de vacío; máquinas grandes, pesadas y lentas; ENIAC, Mark_I, IBM_701
| 2ª  | 1956-1963 | **transistores**; menor tamaño y consumo; fines comerciales y primeros periféricos; IBM_7090; batch processing y primeros lenguajes programación
| 3ª  | 1964-1971 | **circuitos integrados** SSI/MSI; nuevos sistemas almacenamiento; *lenguajes alto-nivel* propósito-general (C, Pascal, Basic); IBM's System_360
| 4ª  | 1971-1981 | integración, uso doméstico, microprocesadores, muchos lenguajes de programación; Commodore 64, Spectrum
| 5ª  | 1982-1991 | VLSI o tremenda integración (Ley de Moore), multimedia, abaratamiento, redes; Apple
| 6ª  | 1992-hoy  | ULSI, GLSI; Internet...


- **Evolución funcional**
  - Originalmente, sistemas aislados y centralizados -físicamente-; ahora *sistemas distribuidos*:
    - **Distribución vertical:** nivel corporativo > departamental > personal
    - **Distribución horizontal:** ordenadores conectados, ninguno centraliza la información


## ud3-presentacion_A — Von Neumann

- **Modelo Von Neumann**
  - Elementos principales
    - Procesador
      - UC
      - PU + ALU
      - Registros
    - Memoria
      - RAM
      - ROM, disco duro
    - I/O
    - Buses: datos, direcciones, control
  - Instrucciones dentro del procesasador:
    - *Fetch*
    - *Decode*
    - *Execute*
    - *Store*
    - (segmentación, pipeline)
  - Otros conceptos...
    - **SoC** - System on a Chip; co-procesador, GPU
    - CISC/RISC
    - Inteligencia Artificial: Machine Learning, Deep Learning
    - **Chips Neuromórficos**


## ud3-presentacion_B — Configuración, diagnóstico e interconexión de equipos

- Ensamblado equipos
  - Componentes
  - **BIOS**
    - passwd
    - [ ] MB Intelligent Tweaker - MIT 
  - Tarjetas POST — de Diagnóstico
  - Software de Diagnóstico: CPU-z, GPU-z, HW-Monitor, HWinfo, SiSoftSandra, MemTest86... *Hiren's Boot CD*...
  - Averías Comunes

## ud3-presentacion_C — Entornos Operativos, Utilidades

- Sistemas Operativos y actualización
- Utilidades del sistema
  - Antivirus
  - Firewall
  - Gestión tareas
    - [ ] `taskchd.msc`
    - [ ] `eventvwr.msc`
    - [ ] `msconfig.exe`