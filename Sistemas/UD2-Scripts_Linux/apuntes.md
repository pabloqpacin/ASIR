# UD2 - Scripts Linux

```md
Objetivos
1. Conocer la Shell como lenguaje de scripting.
2. Conocer las estructuras del lenguaje.
3. Crear y depurar scripts.
4. Administrar carpetas, usuarios y grupos.
5. Administrar la red, procesos y servicios.
6. Automatizar tareas para la administración del sistema.
```

- [UD2 - Scripts Linux](#ud2---scripts-linux)
  - [1. El lenguaje de programación por guiones Shell](#1-el-lenguaje-de-programación-por-guiones-shell)
    - [1.1 Introducción](#11-introducción)
    - [1.2 ¿Qué es el lenguaje de guiones Shell?](#12-qué-es-el-lenguaje-de-guiones-shell)
    - [1.3 Conceptos previos](#13-conceptos-previos)
      - [A. Lenguajes de programación](#a-lenguajes-de-programación)
      - [B. Código fuente](#b-código-fuente)
      - [C. Lenguajes compilados VS interpretados](#c-lenguajes-compilados-vs-interpretados)
      - [D. Lenguajes de guiones](#d-lenguajes-de-guiones)
      - [E. Intérprete de órdenes o shells](#e-intérprete-de-órdenes-o-shells)
      - [F. Trabajando con bash](#f-trabajando-con-bash)
  - [2. El lenguaje de programación del Shell Bash](#2-el-lenguaje-de-programación-del-shell-bash)
    - [2.1 Expansión de los nombres de ficheros](#21-expansión-de-los-nombres-de-ficheros)
    - [2.2 Variables del Shell](#22-variables-del-shell)
    - [2.3 Sustitución de órdenes](#23-sustitución-de-órdenes)
    - [2.4 Expansiones aritméticas](#24-expansiones-aritméticas)
    - [2.5 Caracteres especiales](#25-caracteres-especiales)
    - [2.6 Redirección de entrada y salida](#26-redirección-de-entrada-y-salida)
    - [2.7 Tuberías o 'pipes'](#27-tuberías-o-pipes)
    - [2.8  Filtros o 'pipelines'](#28--filtros-o-pipelines)
      - [A. Comando `sort`](#a-comando-sort)
      - [B. Comandos `tail` y `head`](#b-comandos-tail-y-head)
      - [C. Comando `cut`](#c-comando-cut)
      - [D. Comando `grep`](#d-comando-grep)
      - [E. Comandos `sed` y `tr`](#e-comandos-sed-y-tr)
    - [2.9 Creación y ejecución de un guión de Shell](#29-creación-y-ejecución-de-un-guión-de-shell)
    - [2.10 Interacción con el usuario (`read`)](#210-interacción-con-el-usuario-read)
    - [2.11 Parámetros posicionales y variables especiales](#211-parámetros-posicionales-y-variables-especiales)
    - [2.12 Estructuras de control](#212-estructuras-de-control)
      - [A. `test`](#a-test)
      - [B. `if`](#b-if)
      - [C. `case`](#c-case)
      - [D. Bucles: `while` y `until`](#d-bucles-while-y-until)
      - [E. `for`](#e-for)
      - [F. Funciones](#f-funciones)
  - [3. Administración del sistema con Shell Bash](#3-administración-del-sistema-con-shell-bash)
    - [3.1 Tratamiento de ficheros](#31-tratamiento-de-ficheros)
    - [3.2 Argumentos y formateo de la salida](#32-argumentos-y-formateo-de-la-salida)
    - [3.3 Información del sistema](#33-información-del-sistema)
    - [3.4 Copias de seguridad](#34-copias-de-seguridad)
    - [3.5 Gestión de procesos](#35-gestión-de-procesos)
  - [4. Planificación y automatización de tareas](#4-planificación-y-automatización-de-tareas)
    - [4.1 Planificación de tareas](#41-planificación-de-tareas)
    - [4.2 Planificadores del sistema operativo (GNU/Linux)](#42-planificadores-del-sistema-operativo-gnulinux)
    - [4.2 El planificador de tareas *cron*](#42-el-planificador-de-tareas-cron)
      - [A. Iniciar el servicio cron](#a-iniciar-el-servicio-cron)
      - [B. El fichero de crontab](#b-el-fichero-de-crontab)
      - [C. Planificación de tareas del sistema con crontab](#c-planificación-de-tareas-del-sistema-con-crontab)
      - [D. Salida de las tareas de cron](#d-salida-de-las-tareas-de-cron)
      - [E. Control de acceso a cron](#e-control-de-acceso-a-cron)
      - [F. Automatización de tareas](#f-automatización-de-tareas)
  - [5. Scripts en entorno gráfico](#5-scripts-en-entorno-gráfico)
    - [5.1 Interfaces gráficas para trabajar con scripts](#51-interfaces-gráficas-para-trabajar-con-scripts)
    - [5.2 Introducción a Zenity](#52-introducción-a-zenity)
    - [5.2 Uso de los diálogos](#52-uso-de-los-diálogos)
      - [A. Diálogo de calendario](#a-diálogo-de-calendario)
      - [B. Diálogo de contraseña](#b-diálogo-de-contraseña)
      - [C. Diálogo de formulario](#c-diálogo-de-formulario)
      - [D. Diálogo de lista](#d-diálogo-de-lista)
      - [E. Diálogo de selección de archivos](#e-diálogo-de-selección-de-archivos)
      - [F. Diálogo para la entrada de texto](#f-diálogo-para-la-entrada-de-texto)


## 1. El lenguaje de programación por guiones Shell

```md
Para poder hacer uso de un sistema informático, tendremos que conocer la interfaz que nos proporciona el sistema operativo.  Esta interfaz, presente desde la línea de órdenes, se denomina intérprete de comandos o Shell, y proporciona una capa de abstracción entre el lenguaje que conoce la máquina que hay por debajo del sistema y nuestro lenguaje de scripting. Estos intérpretes han ido evolucionando desde aquellos que solo interpretaban los comandos de forma secuencial hasta los actuales, que proporcionan una interfaz oral, capaz de reconocer nuestra voz. En este apartado, veremos la base de uno de los intérpretes más utilizados por los administradores de sistemas informáticos GNU/Linux, el Shell Bash.
Y para poder entender cómo funcionan los intérpretes de comandos y las ventajas que aportan a los administradores, veremos la base de los lenguajes de programación en general y de los lenguajes de scripts en particular.
```


### 1.1 Introducción

- Software/interfaz entre OS y usuarios, lenguaje propio para 'shellscripts'
- Automatizar administración OS: mantenimiento, configuración, copias-seguridad... + Planificador de Tareas ([**cron**](https://support.system76.com/articles/custom-mouse-buttons/))
- DINÁMICA: Ubuntu + BASH

### 1.2 ¿Qué es el lenguaje de guiones Shell?

- Programa: secuencia de instrucciones para la ejecución una tarea
- Shell: intérprete de comandos, programa para la interacción entre OS y usuarios, acepta guiones (scripts)


### 1.3 Conceptos previos

#### A. Lenguajes de programación
- Léxico y reglas sintácticas y semánticas propias
- Lenguaje máquina: binario, señales eléctricas
- Lenguajes de bajo nivel: mnemotécnicos, microinstrucciones procesador
- Lenguajes de alto nivel: abstractos, humanos, portables

#### B. Código fuente
- ...

#### C. Lenguajes compilados VS interpretados
- Compilador: traducen el código fuente a binario (según arquitectura) -- eficiencia
- Intérpretes: traducen durante la ejecución (runtime) -- eficacia

#### D. Lenguajes de guiones
- Alto nivel, propósito general o específico, lenguajes interpretados
   <!-- -  Origen: JCL -->
- Extienden otro lenguaje, entorno o aplicación web, ya sea del lado cliente ([JavaScript](https://eloquentjavascript.net/)) o servidor ([PHP](https://phptherightway.com/))

#### E. Intérprete de órdenes o shells
- Programa encargado convertir los comandos del usuario en input instrucciones ejecutables para el OS
- Fundamentales para administrar sistemas y redes (CLI > GUI)

#### F. Trabajando con bash
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


## 2. El lenguaje de programación del Shell Bash

```md
En este apartado, veremos las peculiaridades del lenguaje de programación del **Shell Bash** que nos permitan sacarle partido al sistema como **administradores**. Además, estudiaremos las variables, palabras reservadas, caracteres especiales, redirecciones de le entrada y la salida estándar, tuberías, filtros, ejecución, parámetros o argumentos de entrada, salida de resultados y estructuras de control, que facilitarán estas tareas.
La programación o el **desarrollo de los scripts** se puede realizar con cualquier editor de texto plano, pero el sistema operativo ya proporciona, tanto para línea de comando como para entornos gráficos, unos editores que reconocen las palabras reservadas del lenguaje de scripts y las identifica con colores diferentes que ayudan a seguir mejor el código. 
También existen **editores más sofisticados**, que permiten realizar la ejecución paso a paso, para poder ver los resultados intermedios poco a poco y así poder localizar más rápidamente los errores durante el desarrollo.
```

- **Capacidades/herramientas**: ejecutar secuencias de órdenes/comandos, expresiones regulares, variables, expansiones aritméticas, redirección de entrada y salida, tuberías, filtros, interacción con usuario, parámetros/argumentos de entrada, control de flujo...
<!-- - Editores... -->

### 2.1 Expansión de los nombres de ficheros

- **Expresiones regulares**: patrones para identificar archivos, porciones de texto donde se añaden caracteres especiales según sintaxis

| Expresión   | Descripción coincidencia
| ---         | ---
| ?           | Caracter simple
| *           | 0 o más caracteres
| [ ]         | caracteres entre corchetes
| [! ]        | caracteres NO entre corchetes
| [- ]        | caracteres rango

> ojo punto inicial

Ejemplos

```bash
ls s*       # empieza por s
ls (r|s)*   # empieza por r o s
ls *.sh     # acaba en .sh
ls a*s      # empieza por a y acaba en s
ls [a-d]*   # empieza por a b c o d
ls ????     # cuatro caracteres
```

### 2.2 Variables del Shell

- **Variable**: nombre no reservado por el sistema para alojar valores // importante no espacios (`variable='valor'`) // uso de `$` para acceder a los valores

```bash
nombre=Pablo
apellidos="Quevedo Pacin"
edad=28

echo $apellidos, $nombre, $edad años
```
- **Variables de entorno**

| Variable  | Descripción
| ---       | ---
| BASH      | ...
| HISTFILE  | archivo que recoge el histórico de órdenes ejecutadas
| HOME      | directorio de inicio del usuario
| HOSTNAME  | nombre del ordenador
| LOGNAME   | nombre del usuario conectado
| MACHTYPE  | arquitectura del ordenador
| OSTYPE    | tipo de sistema operativo
| PATH      | lista de directorios donde el Shell localiza los programas disponibles
| PPID      | identificador del proceso padre
| PWD       | ruta del directorio actual
| RANDOM    | número aleatorio
| SECONDS   | tiempo de sesión Shell
| UID       | identificador del usuario actual

### 2.3 Sustitución de órdenes

```bash
echo "Fecha actual: $(date)"
echo "Hora actual: `date +%H`"
```

### 2.4 Expansiones aritméticas

- `$((foo))`: evaluación de expresión aritmética (números enteros) // **operadores**:

| Operador              | Descripción
| ---                   | ---
| var++, var--          | postincremento y postdecremento
| ++var, --var          | preincremento y predecremento
| -, +                  | menos y más unarios
| !                     | negación lógica
| **                    | potencia
| *, /, /               | multiplicación, división, resto/residuo
| +, -                  | suma y resta
| <=, =>, <, >          | comparación
| ==, !=                | igualdad desigualdad
| &&                    | AND lógico
| \|\|                    | OR lógico
| expr ? expr : expr    | evaluación condicional
| =, *=, /= %=, +=, -=  | asignaciones
| ,                     | separador

### 2.5 Caracteres especiales

```md
- espacio: separación de orden/comando con sus opciones/argumentos
- return, nueva línea: final de orden con sus opciones/argumentos
- $ antes de nombre: valor de la variable
- * en ficheros: comodín para administrarlos...

PARA NO INTERPRETARLOS:
- \ precediendo
- " " rodeando
- ` ` rodeando
```

### 2.6 Redirección de entrada y salida

- **Descriptores** del stream: 0==STDIN 1==STDOUT 2==STDERR
- Uso de **operadores** de entrada/salida:

| Sintaxis  | Tal
| ---       | ---
| >         | `echo "$USER" > user.log`
| <         | `cat < user.log`
| >>        | 'append'
| 2>        | redireccion STDERR
| 2>>       | 'append'
| 2>&1      | redirección STADERR a STDOUT
| 1>&2      | redirección STDOUT a STDERR
| >&        | redirección de STDOUT y STDERR

### 2.7 Tuberías o 'pipes'

- `|`: rediregir la salida de un comando a la entrada de otro

```bash
echo "Esta frase tiene 5 palabras" | wc -w
```

### 2.8  Filtros o 'pipelines'

- "En Unix, hay una serie de órdenes que se utilizan mucho con las tuberías y son filtros que nos permiten formatear la salida de los comandos. Estos filtros son *sort*, *tail* *head*, *cut*, *grep*, *sed*, *tr*, *more* y *less*.

#### A. Comando `sort`

- Reordenar un flujo de líneas en orden alfabético en STDOUT

```bash
echo -e "3 - tres\n2 - dos\n1 - uno" | sort
```

#### B. Comandos `tail` y `head`

- Tail muestra las últimas líneas de texto, head las primeras

```bash
ls /usr/bin | tail -5
ls /usr/bin | sort -r | head -5
```

#### C. Comando `cut`

```bash
echo "Hello, World" | cut -c 1-5
```

#### D. Comando `grep`

- Filtro de búsqueda según expresiones regulares

```bash
grep "zsh" .zsh_history
```

#### E. Comandos `sed` y `tr`

```bash

echo "Hola" | tr 'a-z' 'A-Z'
```

### 2.9 Creación y ejecución de un guión de Shell

- Extensión `.sh` para resaltado sintaxis
- Comandos/instrucciones separados por líneas o `;`
- Uso de `#` para líneas de comentarios
- Uso de `#!/bin/bash` en la primera línea para la correcta interpretación del script
- Necesario hacer el script ejecutable (`chmod +x script.sh`)

### 2.10 Interacción con el usuario (`read`)

```bash
read -p "Dame un carácter: " DATO
echo "Has introducido el carácter $DATO"
```

### 2.11 Parámetros posicionales y variables especiales

| Variable  | Descripción
| ---       | ---
| $0        | Nombre del propio script
| $n        | Parámetro pasado en la posición n ($1, $2, etc)
| $*        | Cadena que contiene todos los parámetros
| $@        | Igual que $* pero los argumentos son independientes (no una cadena)
| $#        | Número de parámetros
| $$        | PID de la ejecución del script
| $!        | PID del último proceso ejecutado
| $?        | Estado último comando (0==OK, no-0==error), parámetro **salida**

### 2.12 Estructuras de control

#### A. `test`

- Para ficheros/directorios

| Expresión     | Descripción |
| ---           | ---
| -f fichero    | Verdadero si el fichero existe
| -r fichero    | Existe y se puede leer
| -w fichero    | Existe y se puede escribir
| -x fichero    | Existe y es ejecutable
| -d directorio | Existe y es un directorio

- Para cadenas de caracteres

| Expresión     | Descripción |
| ---           | ---
| cadena        | Verdadero si la cadena no es nula
| -z cadena     | Verdadero si longitud es cero
| -n cadena     | Longitud no es cero
| cad1 == cad2  | Cadenas son idénticas
| cad1 != cad2  | Cadenas no son idénticas

- Para operaciones aritméticas

| Expresión | Descripción |
| ---       | ---
| -eq       | equal
| -ne       | not equal
| -gt       | greater than
| -lt       | less than
| -ge       | greater or equal
| -le       | less or equal

- Operadores lógicos

| Expresión   | Descripción |
| ---         | ---
| -a          | AND lógico (&&)
| -o          | OR lógico (||)
| !expresión  | NOT lógico (!)
| true        | devuelve 0
| false       | devuelve no-0

#### B. `if`

```bash
if <condicion>; then
  <instrucciones>
elif <condicion>; then
  <instrucciones>
else
  <instrucciones>
fi
```

#### C. `case`

```bash
read -p "Introduce un número del 1 al 3: " NUM

case $NUM in
  1) instruccion1; instruccion2 ;;
  2) instruccion3; ... ;;
  3) instruccion4; ... ;;
  *) echo "Opción no válida"; instruccion5 ;;
esac
```


#### D. Bucles: `while` y `until`

- Iteración hasta cumplir condición

```bash
while <condicion>; do
  instruccion1
  instruccion2
done
```
```bash
until <condicion>; do
  instruccion1
  instruccion2
done
```

#### E. `for`

- "**Incondicional**", se repetirá un número acotado de veces (valores tras cláusula `in`)
- Ojo con `break` para salir de un bucle

```bash
for variables in var1 var2 var2; do
  instruccion1
  instruccion2
done
```
```bash
for num in `seq 1 10`; do     # == $(seq 1 10)
    echo "Contador: $num"
done
```

#### F. Funciones

- Pequeños algoritmos independientes, actúan cuando son llamados
- También se les pueden pasar parámetros/argumentos ($1 $2 etc)
- Ojo con `return` para interrumpir una función -- también permiten devolver un valor de salida (1 byte)

```bash
add_numbers() {
  local result=$(( $1 + $2 ))
  return $result
}

add_numbers 5 3
echo "The sum is $?"
```


## 3. Administración del sistema con Shell Bash

```md
Las **tareas más corrientes** de un administrador de sistemas son la administración del hardware, las aplicaciones instaladas, los usuarios, la asignación de recursos, la conectividad y la seguridad. Y para todas ellas es imprescindible acceder a los ficheros y procesos del sistema. Además, el dominio de la programación en Shell Bash nos ayudará enormemente con estas tareas.
En el apartado anterior hemos visto los componentes de los que dispone el lenguaje de programación de scripts. Ahora veremos mediante ejemplos el uso que un administrador de sistemas puede aplicar (¡ojo!, hay multitud de usos y aquí solo nos caben unos pocos).
Para dominar el desarrollo de scripts, hay que entender muy bien el **funcionamiento de sus componentes** así como el uso de **estrategias de diseño** que permitan seccionar el código para una mejor depuración de errores. Y no olvidemos también la documentación del código que facilitará el compartirlo con otros desarrolladores.
```

### 3.1 Tratamiento de ficheros
### 3.2 Argumentos y formateo de la salida
### 3.3 Información del sistema
### 3.4 Copias de seguridad
### 3.5 Gestión de procesos

## 4. Planificación y automatización de tareas

```md
Muchas de las tareas que realiza un administrador del sistema suelen ser repetitivas y algunas no exigen interactividad. Por tanto, un sistema que nos permita programar tareas para ser **ejecutadas de forma desatendida**, será de gran utilidad para el administrador. En este apartado, veremos la herramienta cron que incorporan los sistemas operativos GNU/Linux.

Una tarea puede ser un simple comando o un script muy elaborado, que podemos almacenar y parametrizar para utilizarlo en varios momentos o circunstancias. Por lo tanto, tendremos, por una parte, los scripts que realizaran la **tarea encomendada** y, por otra, el sistema automatizado de **lanzamiento de las tareas**.

El sistema de automatización de tareas también nos permite gestionar **tareas del sistema**, así como **tareas de los usuarios** de forma diferenciada.
```

### 4.1 Planificación de tareas
### 4.2 Planificadores del sistema operativo (GNU/Linux)
### 4.2 El planificador de tareas *cron*

#### A. Iniciar el servicio cron
#### B. El fichero de crontab
#### C. Planificación de tareas del sistema con crontab
#### D. Salida de las tareas de cron
#### E. Control de acceso a cron
#### F. Automatización de tareas



## 5. Scripts en entorno gráfico

```md
Ya hemos visto la utilidad y la importancia del uso de scripts para un administrador de sistemas. En este sentido, uno de los puntos clave —un tanto engorroso, al utilizar los scripts a nivel de usuario (tando los usuarios comunes como el administrador)—, es la interfaz de línea de comandos empleada para interactuar con ellos. Por todo ello, en este apartado veremos una herramienta que nos permite interactuar de forma gráfica con los scripts. Este herramienta nos permite utilizar las **librerías gráficas**, que componen el sistema operativo en uso.
Cada distribución GNU/Linux dispone de una **interfaz gestora de ventanas** que incorpora estas librerías. En Ubuntu, esa herramienta es Zenity, que utiliza las librerías gráficas GTK de GNOME. Para otra distribución, tendremos que averiguar cuál es la herramienta y cuáles son las librerías del gestor de ventanas empleado. En el caso de KDE como gestor de ventanas, se empleará la herramienta Kdialog, que utiliza las librerías gráficas Qt.
```

### 5.1 Interfaces gráficas para trabajar con scripts
### 5.2 Introducción a Zenity
### 5.2 Uso de los diálogos

#### A. Diálogo de calendario
#### B. Diálogo de contraseña
#### C. Diálogo de formulario
#### D. Diálogo de lista
#### E. Diálogo de selección de archivos
#### F. Diálogo para la entrada de texto


