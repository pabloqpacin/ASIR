# ISO UD1: Procesos y Memoria

- [ISO UD1: Procesos y Memoria](#iso-ud1-procesos-y-memoria)
  - [ud1-teoria](#ud1-teoria)
  - [ud1-procesos](#ud1-procesos)
  - [ud1-memoria](#ud1-memoria)


## ud1-teoria

- **Introducción a los OSs**
  1. INTRO
       - Sistema informático == componentes Físicos Lógicos(programas,estructurasDeDatos) Humanos(Diseño,Desarrollo,Explotación)
  2. Concepto de OS
       - *Definición:* "Conjunto de órdenes y programas que controlan los procesos básicos de una computadora y permiten el funcionamiento de otros programas."
       - *Componentes:* interfaz gráfica, aplicaciónes del usuario, terminal de comandos, **kernel**
  3. Objetivos del OS (...)
  4. *Tipos de OSs*
     1. SEGÚN HISTORIA
        1. Proceso en serie
        2. Proceso por lotes
        3. Multitarea
        4. Tiempo compartido
     2. SEGÚN ESTRUCTURA
        1. Estructura Monolítica
        2. Estructura Jerárquica
        3. Máquina Virtual <!--Hypervisor-->
     3. SEGÚN MODO EXPLOTACIÓN 
        1. Procesamiento por lotes
        2. Tiempo compartido o interactivos (quantum)
        3. Tiempo real
     4. SEGÚN Nº USUARIOS
        1. Monousuario
        2. Multiusuario
     5. SEGÚN Nº PROCESOS
        1. Monotarea-monoprogramación
        2. Multitarea-multiprogramación
     6. SEGÚN Nº PROCESADORES
        1. Monoproceso
        2. Multiproceso (simétrica VS asimétrica)
     7. SEGÚN SERVICIOS PROPORCIONADOS
        1. Centralizados
        2. De red
        3. Distribuidos
     8. SEGÚN DISPONIBILIDAD
        1. Propietarios
        2. Libres
     9. SEGÚN LICENCIA
        1.  Copyright...
        2.  Copyleft...
  5. Interfaz de usuario UI + CLI
  6. Funciones de los OS...
  7. Gestión de PROCESOS
      - *Definición:* "secuencia de acciones derivadas de la ejecución de una serie de instrucciones."
      - **ESTADOS**
        - Estado: Creado - Listo - En ejecución - Bloqueado - Suspendido
        - PID
        - Prioridad
        - Dirección Memoria
      - **Threads**
      - Tipos
        - Nº Threads — Monohilo VS Multihilo
        - Responsable — Sistema VS Usuario
        - Interacción — Interactivo VS Segundo-plano (daemons)
      - **ALGORITMOS:** FIFO - SJF - Round-Robin - SRTF
  8. Gestión de MEMORIA
      - *Desafíos:* reubicación, protección, compartición, organización lógica, org. física
      - **TÉCNICAS:** Paginación, Segmentación, Memoria-Virtual, Swapping
  9.  Gestión de I/O (firmware—drivers): **Interrupciones & Transferencias**
  10. Gestión del Sistema de Archivos...
  11. Seguridad y protección (confidencialidad - integridad - disponibilidad)
  12. Gestores de arranque 



## ud1-procesos

- **Gestión de Procesos**
  - (BCP) Bloque de Control de Proceso: Estado - PID+PPID - Valores registros - Valores recursos
    - ESTADOS: new - ready - running - waiting - terminated - suspended
    - Anomalías: procesos huérfanos & zombies
  - TIPOS: Independientes, Cooperativos, Competitivos
  - **Algoritmos Scheduler**
    - FIFO/FCFS — First In First Out/First Come First Served
    - SJF — Shortest Job First
    - RR — Round Robin (quantum)
    - Por prioridades
  - *Hilos*
  - Interrupciones y excepciones...
  - **DAEMONS-SERVICES** (segundo-plano)
  - Comandos Linux: `top`-`htop` `ps`-`pstree` `pgrep` `kill`-`pkill`-`killall`


## ud1-memoria

- **Gestión de Memoria**
  - *Desafíos:* reubicación - protección - compartición - org. lógica - org. física
  - **TÉCNICAS:** Paginación(frames,pages) - Segmentación - Mewmoria Virtual - Swapping