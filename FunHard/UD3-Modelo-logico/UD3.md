# UD3 - Modelo Lógico




## Intro (Campus Virtual *checklist*)

- [x] 'material complementario'
- [ ] docs
- [ ] ejercicios
<!-- - [ ] supdawg -->
- [ ] Tareas
- [ ] AutoEvaluación
- [ ] Custionario


## Material Complementario

<details>
<summary>Click to expand</summary>

01. [ ] [¿Qué es y Cómo Funciona el CPU o Procesador?](https://www.youtube.com/watch_popup?v=vMS2n09X_sk)

- nutshell
  - CPU: computar, ordenar y procesar; cálculos matemáticos y procesos de control
  - CPU->socket->motherboard VIA pines
  - velocidad —cálculos— en Hercios (**1Hz=1vibraciónPorSegundo**)
- historia (procesadores)
  - pre-transistores = armatostes
  - transistores (50s,60s) = pequeños potentes y confiables
  - circuito integrado = todo en 1 placa (menos tamaño más rendimiento)
  - 1971 Intel primer microprocesadores (*C4004*)
  - 1972 primero de **8** bits (*C8008*) pero MALARDO
  - 1974, *C8080*, primer microprocesador "de propósito general"
  - 1978, *D8086*, primero de **16** bits; nuevo ESTÁNDAR
  - 1985, *i386*, primero de **32** bits... and beyond...
- funcionamiento
  - [ ] (...)
  - 4 fases
    - lee datos que deben ser procesaods
    - analizan datos leídos en primera fase
    - ejecutan procesos sugeridos y analizados anteriormente
    - llevar info del cpu a la memoria y mostrarla al usuario
    - (hasta que detenga el proceso)


02.  [ ] [La Arquitectura del Procesador: ¿De qué se trata?](https://www.youtube.com/watch_popup?v=kDKqKwk8VDY&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=2)

- nutshell
  - procesador coordina todas las tareas de un pc
  - interior = bloques interconectados, cada uno con su función
  - computadora lee instrucciones y datos; velocidad según FRECUENCIA (GHz)
  - "reloj" coordina TODO el sistema ^[Is this why Pygame projects require tweaking?? Microseconds depending on the box clock?]
- current trends (aspecto lógico)
  - (...)
  - más núcleos
  - integración de: *controlador memoria* y *tarjeta gráfica*
  - CPU vs Accelerated **APU**  —CPU+GPU—
  - SoC = APU+IO
- current trends (aspecto físico)
  - temperatura, voltaje
  - potencia requerida DIRECTAMENTE PROPORCIONAL frecuencia velocidad
  - importancia REFRIGERACIÓN (+ límites por los fabricantes)


03.  [x] [Núcleos vs GHz: ¿Qué es más Importante en el Procesador?](https://www.youtube.com/watch_popup?v=V0elByb5zEg&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=3)

- nutshell
  - "la arquitectura de un procesador define cómo está interconectado y qué bloques tiene internamente; más tareas al mismo tiempo, o más especializado"
  - "distintas arquitecturas, jodido comparar solo por número de núcleos etc."
- current trends
  - integrar más elementos en microprocesador (*MP*); ie varios MP en uno(núcleos)
  - más núcleos, mejor rendimiento <!--especialmente para programas en memoria como ANTIVIRUS que temporalmente usan el 100% de un núcleo-->
  - (4 ok)
- comps
  - procesador = bloques sincronizados via RELOJ y miles de millones de oscilaciones por segundo
  - frecuencia GHz = cambio de valor reloj por segundo
  - bloques funcionan en PARALELO
  - *límites* para la frecuencia: consumo y temperatura


04.  [x] [¿El Overclocking, IPC, TDP, Turbo Boost y Turbo Core en el Procesador?](https://www.youtube.com/watch_popup?v=li8JeyOnWoo&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=4)

- *overclocking*
  - 'desbloquear máxima velocidad' ie más operaciones por segundo
  - más velocidad = más consumo, más **refrigeración**
  - método principal via BIOS
- *IPC — Instructions per Cycle*
  - "número de cálculos que es capaz de realizar un determinado procesador en función de su frecuencia de funcionamiento; cada función está regida a ~~un reloj~~ la frecuencia que emita cada pulso del reloj"
- *TDP — Thermal Design Power*
  - máxima potencia para un dispositivo
  - marca el diseño de la refrigeración
  - sobre CPU: refrigeración mínima & limita la **frecuencia** 
- *Turbo boost*
  <!-- -  DIRECTAMENTE PROPORCIONALES: frecuencia procesador & nº operaciones segundo (más frecuencia = más potencia más calor), límite físico de frecuencia... -->
  - Intel: **TurboBoost**
  - AMD: TurboCore
  - "TB accelerates the clock speed when processing demand increases and the processor is operating below its limits"
  - 'usando 4 de 6 núcleos... esos 4 reciben más potencia como para los que NO se están usando (en función del límite de temperatura)'
  - problema: siempre máxima potencia reduce vida útil 


05.   [x] [DIFERENCIA entre 32 Y 64 BITS](https://www.youtube.com/watch_popup?v=1maB6dRCw7o&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=5)

- nutshell
  - 64-bit procesa el doble de información en el mismo tiempo
  - 32-bit max RAM = 4 GB
  - 64-bit max RAM = 16 EB pero **OS** limita a 192 GB
  - (32-bit OSs run on 64-bit chips but FOOLERY-incompatibilities)


06.   [x] [La Memoria Caché: ¿Qué es y para qué sirve?](https://www.youtube.com/watch_popup?v=85RqrLy7MGM&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=6)

- nutshell
  - dentro del procesador; acelera acceso a RAM
  - importante: velocidad para llevar datos e instrucciones al procesador
  - aspecto clave de un microprocesador
- details
  - función: 'datos más usados lo más cerca del procesador'
  - acelera todo tipo de aplicaciones y evita bloqueos
  - no DRAM sino *SRAM* (no necesita 'refrescarse')
- niveles (1-3)
  - de menor a mayor tamaño según distancia con microprocesador
  - datos más importantes = más cerca
  - cada nivel, **bloque de control**
  - más tamaño, más tiempo
  - "físicamente diminuta, pero útil porque muchos programas aluden a los mismos datos (disponibles en la memoria caché)" 
- [infraestructura](/FunHard/UD3-Modelo-logico/img/memoriaCacheNiveles.png)
  - L1-instrucciones
  - L1-datos
  - L2: no distingue
  - L3: mayor tamaño
  - L4: 'current trend' para tarjetas gráficas integradas


07.   [x] [Socket del Procesador: ¿Qué es y en qué influye?](https://www.youtube.com/watch_popup?v=8GnvojtVZjU&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=7)

- nutshell
  - CPU va en zócalo en placa base, evitando soldar
  - socket compila y soporta el procesador, proporcionando energía e integrando componentes
  - varios tipos de conexión física (pines, etc.)
- variaciones
  - nº pines
  - actualización/renovación CPU: fácil AMD vs difícil Intel (compatibilidad)
- destacan
  - AM3+: familia AMD FX
  - FM1: AMD A series; 905 pines para nuevas tarjetas gráficas integradas
  - FM2: mejoras
  - 2011: Intel, 2011 pines
  - 1150: Intel Haswell
  - 1151: Intel Skyline
  - CONSTANTES RENOVACIONES para bien o para mal (placas bases fácilmente obsoletas con Intel, no tanto con AMD)


08.   [x] [Intel vs AMD: ¿Qué Procesador es Mejor?](https://www.youtube.com/watch_popup?v=SB8y3ER9m94&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=8)

- nutshell
  - Intel processors 10% más potente que AMD (procesadores)
  - AMD más económico
  - distintas **frecuencias** & arquitecturas


09.   [x] ~~[¿Cómo saber qué Procesador es mejor? | Comparador de CPU'S](https://www.youtube.com/watch_popup?v=55aDNEfXfmI&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=9)~~


10.   [x] ~~[¿CÓMO SABER LA GENERACIÓN DE TU PROCESADOR?](https://www.youtube.com/watch_popup?v=00cgQQrdYGQ&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=10)~~

</details>


## Docs

### Unidad III

### Tema 3.1

### Tema 3.3