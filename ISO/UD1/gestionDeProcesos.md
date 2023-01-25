# Gestión de Procesos .pdf

- [Gestión de Procesos .pdf](#gestión-de-procesos-pdf)
  - [Introducción](#introducción)
  - [Estados de un proceso `P`](#estados-de-un-proceso-p)
  - [Creación de procesos](#creación-de-procesos)
  - [Terminación de procesos](#terminación-de-procesos)
  - [Algoritmos para la Gestión de Procesos](#algoritmos-para-la-gestión-de-procesos)
    - [Algoritmo FIFO - First In First Out](#algoritmo-fifo---first-in-first-out)
    - [Algoritmo por Prioridades](#algoritmo-por-prioridades)
    - [Algoritmo FCFS - First Come First Served](#algoritmo-fcfs---first-come-first-served)
    - [Algoritmo SJF - Shortest Job First](#algoritmo-sjf---shortest-job-first)
    - [Algoritmo RR (Round Robin)](#algoritmo-rr-round-robin)
  - [Hilos de ejecución](#hilos-de-ejecución)


## Introducción

Un programa, entendido como un archivo que contiene órdenes, reside en la memoria secundaria del ordenador, mientras que un proceso reside en la memoria principal.
- **Proceso**: secuencia de acciones derivadas de la ejecución de una serie de instrucciones.
- **Programa**: secuencia de procesos definida a priori, que pueden ser ejecutada por un procesador.

Cada proceso necesita una serie de recursos, siendo el sistema operativo el encargado de proporcionárselos.

En función del tipo de proceso, los recursos necesarios pueden ser diferentes pero, por regla general, todos necesitan un espacio en memoria y un tiempo de uso del microprocesador (CPU).

Cuando se crea un proceso, se le asocia un paquete de información sobre el denominado Bloque de Control de Proceso (BCP), que le acompaña durante toda su vida. En este BCP se recogen datos del proceso como son:
- Su **estado** actual
- Su **PID** (número identificador de proceso)
- Valores de **registros asociados** a él, como el contador de programa, los punteros, acumuladores, etc
- Valores de los **recursos asignados**: espacio en memoria, archivos, E/S, etc


Todos los procesos, desde su creación, tendrán la capacidad de comunicarse y sincronizarse con otros procesos y con recursos del sistema. Este hecho da lugar a diferentes tipos de procesos: 
- **Independientes**: no se comunican con otros procesos. Estos tipos de procesos apenas existen.
- **Cooperativos**: se comunican y sincronizan para realizar una actividad común.
- **Competitivos**: necesitan hacer uso del mismo recurso y, por consiguiente, competirán por él

En cualquier caso, la ejecución de los procesos exigirá concurrencia, cualidad que deberá gestionar el sistema operativo gracias a técnica denominada multiprogramación, que permite que dos o más procesos puedan ejecutarse "a la vez".

> De todos los procesos que se están ejecutando a la vez sólo uno tiene la "atención del usuario"; Este proceso se dice que está en **primer plano** y del resto se dice que están en **segundo plano**. Es posible pasar un proceso de primer plano a segundo plano y viceversa. <!-- TEMA GUI?! -->

Los procesos pueden descomponerse, a su vez, en *hilos* que son secuencias de instrucciones del proceso que, aunque comparten memoria y recursos, pueden ejecutarse de manera simultánea a otra secuencia de instrucciones del mismo proceso |

<img src="/img/ISO/ud1-CBP.png" alt="CBP" width="300"/>


## Estados de un proceso `P`

| Estado     | meaning |
| ---        | ---     |
| new        | momento en el que se está creando el `P`
| ready      | está esperando a que se le asigne un procesador (CPU)
| running    | se está ejecutando en la CPU
| waiting    | bloqueado, esperando un determinado Evento
| terminated | finaliza su ejecución, muere
| suspendido | suspendido y desplazado a la memoria secundaria

El proceso puede cambiar de estado cuantas veces sea necesario (TRANSICIÓN).

Sin embargo, un procesador sólo puede ejecutar un proceso a la vez. El OS establece los mecanismos necesarios para que los diferentes procesos que compiten por la CPU puedan hacerlo de la forma más eficiente y beneficiosa para el sistema.

<img src="/img/ISO/ud1-estadosProcesos.png" alt="estadosProcesos" width="300"/>


## Creación de procesos

La creación de un proceso se hace a través de la llamada al sistema "crear proceso" desde otro proceso denominado *proceso padre*. El proceso resultante se denomina proceso hijo y es prácticamente una *réplica* de su padre.

Como se puede deducir, debe existir un **proceso inicial** con la capacidad de pedir al sistema que se cree un proceso. Este proceso creador es de vital importancia en los sistemas operativos y constituye la **raíz** del árbol de procesos.

Los procesos se marcan en su creación con un número único llamado identificador de proceso (PID). **Salvo el proceso raíz**, todos los procesos llevan dos números:
- PID: que lo identifica a él
- PPID: que identifica a su padre

Después de que un proceso genera un hijo, **ambos** continúan ejecutándose desde el punto en el que se hizo la creación.

## Terminación de procesos

Generalmente un proceso finaliza su ejecución cuando pasa al estado terminado y le pide al sistema que lo elimine utilizando la llamada al sistema "exit".

Los procesos hijo pueden ser eliminados cuando el proceso padre quiera. Esto se denomina **matar un proceso** (kill) y es habitual cuando:
- El hijo se excede en el uso de los *recursos* asignados.
- La tarea que se asignó al hijo ya no se necesita.
- El proceso padre quiere terminar y 'el SO no permite que los hijos continúen sin el padre'.

Hay que prestar especial atención al hecho de que 'un proceso no debería terminar hasta que todos sus hijos lo hagan'. Sin embargo, las operaciones sobre procesos no son fiables al 100% y se pueden dar anomalías en la gestión de los procesos:
- **Procesos huérfanos**. Se denominan así a los procesos que quedan en el sistema cuando su padre ha finalizado. Cuando esto sucede, el PPID del proceso (para sistemas UNIX) pasa a ser el PID del proceso inicial (sustituçao). <!--Y EN WINDOWZ?? -->
- **Procesos zombies**. Son procesos que han finalizado pero su padre los mantiene como vivos. Este tipo de procesos suelen ser fruto de errores de programación o de fallos del sistema. Al contrario que los procesos huérfanos, los zombies no son adoptados por el proceso inicial sino que tienden a eliminarse para evitar el consumo de recursos.


## Algoritmos para la Gestión de Procesos

Los procesos no se ejecutan en cualquier orden, sino que siguen un orden establecido por el sistema operativo. La forma en la que el sistema operativo gestiona los procesos es lo que se conoce como **planificación** y la herramienta que lo hace recibe el nombre de **planificador** (en inglés, *scheduler*).

La misión del planificador es:
- Garantizar que cada proceso tiene acceso al recurso en su justa medida.
- Explotar el recurso, manteniéndolo ocupado el máximo tiempo posible.
- Reducir todo lo posible los tiempos de espera de los diferentes procesos.

### Algoritmo FIFO - First In First Out

Asignan el procesador al **proceso que más tiempo lleva en el estado de Listo**, es decir, el primero que entra en la cola de procesos listos es el primero que sale de ella al pasar al estado de Ejecución.

El primero en entrar no libera los recursos hasta que no termina. Es el más sencillo pero el más ineficaz por su menor rendimiento

<!-- PNG in PDF-->

### Algoritmo por Prioridades
A cada proceso se le asigna una prioridad según la cual se ejecutan.

Este algoritmo tiene el inconveniente de que los procesos con prioridad 
baja pueden relegarse en el tiempo.

<!-- PNG in PDF-->

### Algoritmo FCFS - First Come First Served
Utiliza una estructura de cola en la que los procesos se ejecutan según 
entran en ella.

Aquí, los procesos demasiado largos harían esperar al resto de procesos 
hasta que termine de ejecutarse.

> - [x] Igual que FIFO? [SÍ](https://en.wikipedia.org/wiki/FIFO_(computing_and_electronics))

### Algoritmo SJF - Shortest Job First
Intenta reparar el problema de FCFS pero, en este caso, los procesos largos se ven desfavorecidos y pueden retrasarse en su ejecución continuamente.

Una vez que el proceso entra en ejecución, se ejecuta por completo, aunque haya en cola procesos más cortos. // wtf

### Algoritmo RR (Round Robin)
Utiliza una organización en cola circular: Los procesos se ejecutan en cola y cuando acaba el último se sigue con el primero. A cada proceso se le asigna un tiempo de uso de CPU denominado cuanto.

El problema de este algoritmo está en la fijación del cuanto, ya que cuantos demasiado largos degeneran en FCFS y cuantos demasiado cortos disminuirían el rendimiento por los continuos cambios de contexto de los procesos.

> - [ ] Fact-check!


## Hilos de ejecución

