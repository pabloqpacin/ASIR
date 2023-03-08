# UD1 Material Complementario — @jvprofe: [Gestión de Memoria: asignación](https://youtu.be/hMhPTWUJX_M)

- [UD1 Material Complementario — @jvprofe: Gestión de Memoria: asignación](#ud1-material-complementario--jvprofe-gestión-de-memoria-asignación)
  - [Sistemas monoprogramados](#sistemas-monoprogramados)
  - [Particiones estáticas de tamaño fijo](#particiones-estáticas-de-tamaño-fijo)
  - [Particiones estáticas de tamaño variable](#particiones-estáticas-de-tamaño-variable)
  - [Particiones Dinámicas](#particiones-dinámicas)
  - [Necesidad de Instrucciones Secuenciales](#necesidad-de-instrucciones-secuenciales)
  - [Paginación](#paginación)
  - [Memoria Virtual](#memoria-virtual)
  - [Segmentación](#segmentación)


## Sistemas monoprogramados
- No son **multitarea**
- Sistema Operativo - Proceso en ejecución == ocupan TODA la memoria

## Particiones estáticas de tamaño fijo
- Dividen `D` la memoria para la asignación de procesos `P` (mismo tamaño bloques)
- ejemplo: P1 ocupa D1 entera, P2 y P3 ocupan D2 y D3 pero sobra espacio; P4 no cabría y no se llegaría a ejecutar!
- problema: **fragmentación interna**^[como en C no?]: memoria *inutilizada*

## Particiones estáticas de tamaño variable
- `D` varios tamaños pero mismo problema de **fragmentación interna** y de bloques quizá demasiado pequeños
- ~~Adaptar las `D` al tamaño de los `P`~~

## Particiones Dinámicas
- `P` se autoasigna memoria (espacio `E`, no `D`)
- al desaparecer el `P`, el `E` puede quedar inutilizado (frag.int.)
- SOLUCIÓN: **dividir procesos para aprovechar tales huecos**

## Necesidad de Instrucciones Secuenciales

<!-- a:HEX to DEC, bit to MiB = 260.11 -->

- ejemplo memoria + instrucciones:
  - (`P2` con varias instrucciones se divide antes y después de `P1`)
  - PROBLEMA: programa dividido en memoria ergo **registro** secuencial lee algo que no debe 

| Dirección  | Instrucción (ASM)             |
| ---        | ---                           |
| 0x0F810000 | 2.1 `add  $t5, $t1, $t2`      | 
| 0x0F810004 | 2.2 `sw   $t5, theArray($t0)` |
| 0x0F810008 | 1.1 `add  foo`                |
| 0x0F81000C | 1.2 `sw   bar`                |
| 0x0F810010 | 2.3 `addi $t0, $t0, 4`        |
| 0x0F810014 | 2.4 `blt  $t0, 160, loop`     |
| 0x0F810018 |
| 0x0F81001C |

> **arquitectura**: cargar programa en memoria, al ejecutarlo el *registro contador de programas de la CPU* lee la primera posición(dirección asignada) y continúa secuencialmente

## Paginación
- ejemplo
  - páginas 1,2,3 con líneas 1-20 --> da igual que estén ordenadas en tanto que conocemos su número y el desplazamiento (línea)
- tabla de páginas: numeradas y con desplazamiento (las páginas son grandes, hay que saber encontrar x dentro cada una)
- en memoria física, se pueden guardar tales páginas en **marcos de páginas**

Memoria Virtual (**páginas**) VS Memoria Física (**marcos**)
- marco abarca varias direcciones!! <!--roughly 64K ?-->
- Dirección memoria virtual `0x010FA00C` con dos partes:
  1. `010` -> **página** que lleva —mediante MMU^[Memory Management Unit]— al **marco** de la memoria física!
  2. `FA00C` --> **desplazamiento** (*offset*)
- El MMU determina que 010 se corresponde con 100 pongamos, así que la correspondencia física podría ser 0x100FA00C para la movida virtual 0x010FA00C.
- RESUMEN: sistema permite 'desorganización'

<img src="/img/ISO/ud1-paginacion.png" alt="paginacion" width="500"/>

PROBLEMA
- dos [2] accesos a memoria
  1. Consulta *Tabla de páginas*
  2. Consulta de la dirección real, física
- SOLUCIÓN: **TLB**
  - Translation Lookaside Buffer
  - Buffer de traducción de direcciones; pequeña memoria más cerca del procesador que puede evitar consultar la Tabla de páginas si está synced (VELOCIDAD)
    - MAPA: `0x` -> TLB -> `0x` || `0x` -> TLB -> Tabla de páginas -> `0x` 

## Memoria Virtual

- se verifica si un programa ya está en memoria o si hay que llevarlo desde el drive
- ventajas:
  - programa no necesita estar cargado en memoria todo el tiempo
  - número de direcciones mayor (porque virtual > físico)

<img src="/img/ISO/ud1-memoriaVirtual.png" alt="memoriaVirtual" width="500"/>

> ojo disco SWAP

## Segmentación

- alternativa a la paginación aunque se usan a la vez (*segmentos paginados*)!
- segmentos de tamaño variable
- misma división (eg. 0x010FA00C en Memoria Virtual)
  1. segmento `010` va a la tabla de segmentos
  2. tabla de segmentos: nº (010) + Base + Límite
     1. base de la memoria física 
     2. límite que va con el offset (`FA00C`) a la MMU y...
  3. Si MMU detecta que el **desplazamiento** > **límite**: SEGMENTATION FAULT!
  4. Si todo ok, lleva a la memoria física real!
