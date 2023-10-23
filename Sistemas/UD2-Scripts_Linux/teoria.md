# UD2 - Scripts Linux

```md
Contenidos
  1. Lenguaje de programación por guiones Shell
  2. Lenguaje de programación del Shell Bash
  3. Administración del sistema con Bash Shell
  4. Planificiación y automatización de tareas
  5. Scripts en entorno gráfico

Objetivos
  1. Conocer la Shell como lenguaje de scripting.
  2. Conocer las estructuras del lenguaje.
  3. Crear y depurar scripts.
  4. Administrar carpetas, usuarios y grupos.
  5. Administrar la red, procesos y servicios.
  6. Automatizar tareas para la administración del sistema.
```

- [UD2 - Scripts Linux](#ud2---scripts-linux)
  - [DESCARGAS](#descargas)
  - [1. El lenguaje de programación por guiones Shell](#1-el-lenguaje-de-programación-por-guiones-shell)
    - [1.1 Introducción a la Shell](#11-introducción-a-la-shell)
    - [1.2 ¿Qué es el lenguaje de guiones Shell?](#12-qué-es-el-lenguaje-de-guiones-shell)
    - [1.3 Conceptos previos](#13-conceptos-previos)
  - [2. El lenguaje de programación del Shell Bash](#2-el-lenguaje-de-programación-del-shell-bash)
    - [2.1 Expansión de los nombres de ficheros](#21-expansión-de-los-nombres-de-ficheros)
    - [2.2 Variables del Shell](#22-variables-del-shell)
    - [2.3 Sustitución de órdenes](#23-sustitución-de-órdenes)
    - [2.4 Expansiones aritméticas](#24-expansiones-aritméticas)
    - [2.5 Caracteres especiales](#25-caracteres-especiales)
    - [2.6 Redirección de entrada y salida](#26-redirección-de-entrada-y-salida)
    - [2.7 Tuberías o 'pipes'](#27-tuberías-o-pipes)
    - [2.8  Filtros o 'pipelines'](#28--filtros-o-pipelines)
    - [2.9 Creación y ejecución de un guión de Shell](#29-creación-y-ejecución-de-un-guión-de-shell)
    - [2.10 Interacción con el usuario](#210-interacción-con-el-usuario)
    - [2.11 Parámetros y variables especiales](#211-parámetros-y-variables-especiales)
    - [2.12 Estructuras de control](#212-estructuras-de-control)



## DESCARGAS

> TODO: html to zip

## 1. El lenguaje de programación por guiones Shell


### 1.1 Introducción a la Shell

- Software/interfaz entre OS y usuarios, lenguaje propio para 'shellscripts'
- Automatizar administración OS: mantenimiento, configuración, copias-seguridad... + Planificador de Tareas ([**cron**](https://support.system76.com/articles/custom-mouse-buttons/))
- DINÁMICA: Ubuntu + BASH

### 1.2 ¿Qué es el lenguaje de guiones Shell?

- Programa: secuencia de instrucciones para la ejecución una tarea
- Shell: intérprete de comandos, programa para la interacción entre OS y usuarios, acepta guiones (scripts)

### 1.3 Conceptos previos

1. Lenguajes de Programación
   - Léxico y reglas sintácticas y semánticas propias
   - Lenguaje máquina: binario, señales eléctricas
   - Lenguajes de bajo nivel: mnemotécnicos, microinstrucciones procesador
   - Lenguajes de alto nivel: abstractos, humanos, portables
2. Código fuente
3. Lenguajes compilados e interpretados
   - Compilador: traducen el código fuente a binario (según arquitectura) -- eficiencia
   - Intérpretes: traducen durante la ejecución (runtime) -- eficacia
4. Lenguajes de guiones (scripting)
   - Alto nivel, propósito general o específico, lenguajes interpretados
   <!-- -  Origen: JCL -->
   - Extienden otro lenguaje, entorno o aplicación web, ya sea del lado cliente ([JavaScript](https://eloquentjavascript.net/)) o servidor ([PHP](https://phptherightway.com/))
5. Intérpretes de comandos o Shells
   - Programa encargado convertir los comandos del usuario en input instrucciones ejecutables para el OS
   - Fundamentales para administrar sistemas y redes (CLI > GUI)
6. Trabajando con Bash
   - Acceso: mediante emulador de terminal tras validación de usuario
   - Shell genera prompt y acepta comandos
   - Interpreta comandos y argumentos, localiza el programa a ejecutar, pide al OS que lo ejecute y cede el control
   - Al finalizar la ejecución, el control vuelve a la shell y se genera otra prompt
   <!-- - Shell por defecto: variable de entorno `$SHELL` -->

```bash
# Determinar Shell habilitada por defecto
echo $SHELL

# Sintaxis genérica comandos
comando [-opciones] [argumentos] <return>

# Ejemplos
ls
ls -l
cat /etc/shells

```

<!-- <ul>
    <ul>
        <li>4</li>
    </ul>
</ul> -->


---
## 2. El lenguaje de programación del Shell Bash

### 2.1 Expansión de los nombres de ficheros
### 2.2 Variables del Shell
### 2.3 Sustitución de órdenes
### 2.4 Expansiones aritméticas
### 2.5 Caracteres especiales
### 2.6 Redirección de entrada y salida
### 2.7 Tuberías o 'pipes'
### 2.8  Filtros o 'pipelines'

1. `sort`
2. `tail` y `head`
3. `cut`
4. `grep`
5. `sed` y `tar`

### 2.9 Creación y ejecución de un guión de Shell
### 2.10 Interacción con el usuario
### 2.11 Parámetros y variables especiales
### 2.12 Estructuras de control

1. `test`
2. `if`
3. `case`
4. bucles: `while` y `until`
5. `for`
6. funciones

