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

<!-- <details>
<summary>'material complementario'</summary> -->

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


1.  [ ] [La Arquitectura del Procesador: ¿De qué se trata?](https://www.youtube.com/watch_popup?v=kDKqKwk8VDY&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=2)

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



1.  [ ] [Núcleos vs GHz: ¿Qué es más Importante en el Procesador?](https://www.youtube.com/watch_popup?v=V0elByb5zEg&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=3)

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


1.  [ ] [¿El Overclocking, IPC, TDP, Turbo Boost y Turbo Core en el Procesador?](https://www.youtube.com/watch_popup?v=li8JeyOnWoo&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=4)




2.  [ ] [DIFERENCIA entre 32 Y 64 BITS](https://www.youtube.com/watch_popup?v=1maB6dRCw7o&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=5)
3.  [ ] [La Memoria Caché: ¿Qué es y para qué sirve?](https://www.youtube.com/watch_popup?v=85RqrLy7MGM&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=6)
4.  [ ] [Socket del Procesador: ¿Qué es y en qué influye?](https://www.youtube.com/watch_popup?v=8GnvojtVZjU&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=7)
5.  [ ] [Intel vs AMD: ¿Qué Procesador es Mejor?](https://www.youtube.com/watch_popup?v=SB8y3ER9m94&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=8)
6.  [ ] [¿Cómo saber qué Procesador es mejor? | Comparador de CPU'S](https://www.youtube.com/watch_popup?v=55aDNEfXfmI&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=9)
7.  [ ] [¿CÓMO SABER LA GENERACIÓN DE TU PROCESADOR?](https://www.youtube.com/watch_popup?v=00cgQQrdYGQ&list=PL4Wdg-psRY0aDSAFAH2ckqqMV88BFF8eH&index=10)

</details>