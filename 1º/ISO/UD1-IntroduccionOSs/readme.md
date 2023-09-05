# ISO 1. Introducción a los Sistemas Operativos

## Campus Virtual


- Teoría
  - ud1-teoria
  - ud1-procesos
  - ud1-memoria
- [Material Complementario](/ISO/UD1-IntroduccionOSs/material-complementario.md) <!--memoria: asignación-->
- Prácticas
  - ejer-procesos
- Cuestionario

> [apuntes-ud1](/ISO/UD1-IntroduccionOSs/apuntes-ud1.md)


### EJER - Procesos

| index | cuestionario |
| ---   | --- |
| Q1    | Se tienen 3 procesos 'P1', 'P2', y 'P3' con tiempos de ejecución 85, 45 y 118. Si actúa el algoritmo SJF, determinar el orden en que se encuentran en la lista de preparados.
| A1    | — P2, P1, P3
| Q2    | Se tienen 2 procesos 'P1' y 'P2' con tiempo de ejecución de 25 y 30. Si actúa el algoritmo RR (q=10) determinar el orden en que se encuentra en la lista de preparados. 
| A2    | — P1, P2, P1, P2, P1, P2
| Q3    | Se dan dos procesos, 'P1' con tiempo de ejecución de 20 y 'P2' con tiempo de ejecución de 15. Según el algoritmo de rueda con quantum 10, indicar el tiempo de retorno, de respuesta y de espera. 
| A3    | — *Better ask ChatGPT...*
| Q4    | Se tienen que realizar 5 trabajos, llegan en el orden descrito en la tabla. Realiza el ejercicio para todos los algoritmos que conozcas.
| A4    | — FIFO/FCFS: P1, P2, P3, P4, P5
| A4    | — SJB: P2, P4, P3, P5, P1
| A4    | — RR: (q=5) P1, P2, P3, P4, P5, P1
| A4    | — Por prioridades: P2, P5, P1, P3, P4 

> Q4

| P   | Tiempo uso CPU | Prioridad |
| --- | ---            | ---
| 1   | 10             | 3
| 2   | 1              | 1
| 3   | 2              | 3
| 4   | 1              | 4
| 5   | 5              | 2

### Cuestionario

| index | cuestionario |
| ---   | --- |
| Q1    | Un proceso es:
| A1    | — Una secuencia de acciones derivadas de la ejecución de una serie de instrucciones.
| Q2    | Los procesos pueden estar en primer y segundo plano al mismo tiempo dependiendo del tipo de *Algoritmo de planificacion*.
| A2    | — FALSO
| Q3    | Los tipos de procesos son:
| A3    | — independientes, cooperativos e competitivos.
| Q4    | Un proceso puede variar su estado por ejemplo de bloqueado a preparada infinitas veces independientemente del algoritmo de ejecución
| A4    | — VERDADERO
| Q5    | Los estados de los procesos son:
| A5    | — Nuevo, preparado, en ejecución, bloqueado, terminado y suspendido.
| Q6    | En el Algoritmo FIFO entrara primero el proceso más corto de la lista de procesos
| A6    | — FALSO
| Q7    | En en Algoritmo SJF una vez que el proceso entra en ejecución, se ejecuta por completo, aunque haya en cola procesos más cortos.
| A7    | — **VERDADERO** 
| Q8    | Un demonio...
| A8    | — es un proceso que se ejecuta en segundo plano sin necesidad alguna de interacción con el usuario para llevar a cabo su tarea.
| Q9    | Se tienen 2 procesos P1 y P2 con tiempo de ejecución de 28 y 35. Si actúa el algoritmo RR (q=10) determinar el orden en que se encuentra en la lista de preparados.
| A9    | — p1,p2,p1,p2,p1,p2,p2 terminando en el momento 63.

