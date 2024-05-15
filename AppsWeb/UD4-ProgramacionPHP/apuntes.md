# Unidad 4 McGrawHill <br> Programación PHP

```md
# Objetivos
1.  Reconocer la relación entre los lenguajes de guiones de servidor y los lenguajes de marcas utilizados en los clientes.
2.  Reconocer la sintaxis básica de un lenguaje de guiones concreto.
3. Utilizar estructuras de control del lenguaje.
4. Definir y utilizar funciones.
5. Establecer y utilizar mecanismos para asegurar la persistencia de la información entre distintos documentos web relacionados.
```

- [Unidad 4 McGrawHill  Programación PHP](#unidad-4-mcgrawhill--programación-php)
  - [1. Lenguaje PHP](#1-lenguaje-php)
    - [1.1 Herramientas de edición de código](#11-herramientas-de-edición-de-código)
      - [A. Editores de texto](#a-editores-de-texto)
      - [B. Editores avanzados](#b-editores-avanzados)
      - [C. Entornos de Desarrollo Integrado (IDE)](#c-entornos-de-desarrollo-integrado-ide)
  - [2. Programación básica](#2-programación-básica)
    - [2.1 Integración con HTML](#21-integración-con-html)
    - [2.2 Literales, variables y constantes](#22-literales-variables-y-constantes)
      - [A. Literales](#a-literales)
      - [B. Variables](#b-variables)
      - [C. Constantes](#c-constantes)
    - [2.3 Tipos de datos escalares](#23-tipos-de-datos-escalares)
      - [A. Booleanos](#a-booleanos)
      - [B. Números enteros](#b-números-enteros)
      - [C. Números de coma flotante](#c-números-de-coma-flotante)
      - [D. Cadenas de caracteres](#d-cadenas-de-caracteres)
      - [E. Conversión de tipos](#e-conversión-de-tipos)
    - [2.4 Tipos de datos compuestos](#24-tipos-de-datos-compuestos)
      - [A. Vectores indexados](#a-vectores-indexados)
      - [B. Vectores asociativos](#b-vectores-asociativos)
      - [C. Vectores multidimensionales](#c-vectores-multidimensionales)
    - [2.5 Operadores](#25-operadores)
      - [A. Operadores aritméticos](#a-operadores-aritméticos)
      - [B. Operadores de asignación](#b-operadores-de-asignación)
      - [C. Operadores de comparación](#c-operadores-de-comparación)
      - [D. Operadores de incremento y decremento](#d-operadores-de-incremento-y-decremento)
      - [E. Operadores lógicos](#e-operadores-lógicos)
      - [F. Operadores para strings](#f-operadores-para-strings)
      - [G. Precedencia de operadores](#g-precedencia-de-operadores)
  - [3. Estructuras de control](#3-estructuras-de-control)
    - [3.1 Condiciones](#31-condiciones)
      - [A. If](#a-if)
      - [B. If - Else](#b-if---else)
      - [C. Switch](#c-switch)
    - [3.2 Repeticiones o bucles](#32-repeticiones-o-bucles)
      - [A. While](#a-while)
      - [B. Do - While](#b-do---while)
      - [C. For](#c-for)
  - [4. Funciones](#4-funciones)
    - [4.1 Funciones predefinidas](#41-funciones-predefinidas)
      - [A. Manejo de variables](#a-manejo-de-variables)
      - [B. Manejo de cadenas](#b-manejo-de-cadenas)
      - [C. Manejo de archivos](#c-manejo-de-archivos)
      - [D. Manejo de fecha y hora](#d-manejo-de-fecha-y-hora)
    - [4.2 Funciones de usuario](#42-funciones-de-usuario)
      - [A. Ámbito de las variables en las funciones](#a-ámbito-de-las-variables-en-las-funciones)
  - [5. Usuarios y sesiones](#5-usuarios-y-sesiones)
    - [5.1 Cookies](#51-cookies)
    - [5.1 Manejo de sesiones](#51-manejo-de-sesiones)


## 1. Lenguaje PHP

```md
El lenguaje de programación PHP, cuyo nombre viene del acrónimo recursivo de PHP: Hypertext Preprocessor, es de código abierto. El propósito principal de este lenguaje de scripting del lado del servidor es la creación de páginas web interactivas y dinámicas gracias a la información que este envía al servidor mediante los formularios a través de los métodos GET y POST. Así, dependiendo de la información recibida desde el cliente, la ejecución del código PHP en el servidor puede tener resultados distintos que, a su vez, forman diferentes páginas web.
Para la creación y edición de los programas existen tres tipos de herramientas: los editores de texto convencionales, los editores avanzados y los entornos de desarrollo integrados. Cada tipo de herramienta tiene unas características y funciones que lo hacen aconsejable en una u otra situación.
A la hora de trabajar con los servidores web donde se alojan o desarrollan las aplicaciones web conviene hacerlo de forma remota siguiendo alguno de estos modelos:
- Desarrollar en local y luego actualizar los archivos del servidor mediante una conexión remota.
- Realizar una conexión de control remoto para trabajar directamente con los datos y aplicaciones del servidor.
- Trabajar con el sistema de archivos remoto, pero con herramientas locales.
```

- Intro
  - DEFINICIÓN: PHP es un lenguaje de scripting del lado del servidor: páginas web interactivas y dinámicas según cliente (HTML... GET y POST...)
  - CARACTERÍSTICAS: Interpretado, multiplataforma, compatible con servidores web, integración con BBDD, OOP
  - ELEMENTOS: etiquetas, comentarios, instrucciones, constantes, variables, vectores, tipos, operadores, expresiones, estructuras de control, funciones, palabras reservadas, clases y objetos


### 1.1 Herramientas de edición de código

#### A. Editores de texto

Cambios pequeños.

Vim.

#### B. Editores avanzados

Funciones: personalización, interfaz avanzada, soporte para debugging, autocompletado, plugins, control de versiones.

Visual Studio Code.

#### C. Entornos de Desarrollo Integrado (IDE)

Básicamente `B`


## 2. Programación básica

```md
En este apartado se hará una introducción a la programación básica con el lenguaje de programación PHP orientado a la generación de páginas web dinámicas con HTML, siempre desde el punto de vista del paradigma de la programación procedimental. Los elementos de PHP que se van a presentar son:
- **Literales, variables y constantes**. Contienen información que un programa PHP es capaz de tratar.
- **Tipos de datos escalares**. Se estudiarán los booleanos, números enteros, números en coma flotante y las cadenas de caracteres.
- **Tipos de datos compuestos**. Se trabajarán los vectores indexados, asociativos, así como los unidimensionales y multidimensionales.
- **Los operadores**. Se verán ejemplos de los siguientes tipos de operadores: de comparación, de incremento y decremento, lógicos y para cadenas. 
Por cada uno de estos elementos, se dará una definición, se explicará su uso y se mostrarán ejemplos con sus correspondientes explicaciones que podrán ser probados e incluso editados, para estudiar su comportamiento. Elementos tan importantes como las instrucciones de control de flujo y las funciones se estudiarán en otros apartados.
```

- INTRO
  - Caso de uso: generación de código HTML para webs dinámicas

### 2.1 Integración con HTML

```html
<html>
  <head>
    <meta charset="utf-8">
    <title>Ejemplo 01</title>
  </head>
  <body>
    <p>IAW</p>
  </body>
</html>
```
```html
<html>
  <head>
    <meta charset="utf-8">
    <title>Ejemplo 01</title>
  </head>
  <body>
    <?php echo '<p>IAW</p>'; ?>
  </body>
</html>
```
### 2.2 Literales, variables y constantes

<!-- ```php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting('E_ALL');
``` -->

#### A. Literales

Conjunto de caracteres con un valor determinado durante toda la ejecución (eg. cadena 'hola', entero 5...).

#### B. Variables

`$` + letra o guión bajo + cadena (eg. `$i`, `$nombre`, `$foo420`)

Se recomienda inicializar variables antes de usarlas.

OJO Variables Predefinidas: `$_GET`, `$_POST`

#### C. Constantes

- Declaración con `const` o `define`
- Sin prefijo `$`, impresión sin comillas

```php
error_reporting(E_ALL);

define ('PI','3.141592');
$radio = 10;
$circunferencia = 2*PI*$radio;
echo "<p>Circunferencia = $circunferencia</p>";

const LIMITE_MAX = 30;
echo "<p>LIMITE_MAX es " . LIMITE_MAX . "</p>";

const LIMITE_MAX = 40;
echo "<p>LIMITE_MAX sigue siendo " . LIMITE_MAX . "</p>";
```
```php
echo PHP_VERSION . '<br>';
echo PHP_OS . '<br>';
echo PHP_OS_FAMILY . '<br>';
```

### 2.3 Tipos de datos escalares

- Rango de valores posibles/admitidos, cantidad de memoria, operaciones posibles, etc.

#### A. Booleanos

True o False.

#### B. Números enteros

- `Z = {... -3, -2, -1, 0, 1, 2, 3 ...}`
- Tamaño en memoria y rango de valores: DEPENDE del sistema en el que esté instalado PHP: `PHP_INT_SIZE`,`PHP_INT_MAX`,`PHP_INT_MIN`
- "Los números enteros admiten las siguientes notaciones: decimal (127), hexadecimal (0x7f), octal (0177), binario (0b01111111). Es importante indicar que un número entero decimal no puede empezar por `0` porque es la marca que indica que se trata de un número octal."

```php
echo PHP_INT_SIZE . '<br>';         // 8
echo PHP_INT_MAX . '<br>';          // 9223372036854775807
echo PHP_INT_MIN . '<br>';          // -9223372036854775808
echo '<hr>';

echo 127 . '<br>';                  // 127
echo 0x7f . '<br>';                 // 127
echo 0177 . '<br>';                 // 127
echo 0b01111111 . '<br>';           // 127
echo '<hr>';
```

#### C. Números de coma flotante

- float o double
- Normalmente, 64 bits, dependiendo del sistema. `PHP_FLOAT_MAX`, `PHP_FLOAT_MIN`
- Cinco formas de representar: 5.5, 3.6e3 (3.6 * 10^3 = 3600), 2e-5 (2 * 10^-5 = 0.00002)

```php
echo PHP_FLOAT_MAX . '<br>';          // 1.7976931348623E+308
echo PHP_FLOAT_MIN . '<br>';          // 2.2250738585072E-308
```

#### D. Cadenas de caracteres

- Conjunto ordenado de caracteres alfanuméricos y otros símbolos, normalmente **codificados** de igual forma que el archivo PHP
- Entrecomillado simple: `'foo'`, escape: `'\'foo\''`
- Entrecomillado doble: `"foo"`, expansión de variables `"$foo"`, escape con `\`

#### E. Conversión de tipos

- Tipado dinámico (no se declara)
- Conversión de tipado dinámica (eg. int + float = float)
- Tipado estático: `$x = (integer) 1` o `settype($x, 'float')`

```php
$x = 5;
echo "a) \$x: $x -- Tipo: " .gettype($x). "<br>";

$y = 10.5;
echo "b) \$y: $y -- Tipo: " .gettype($y). "<br>";

$z = (integer) $y;
echo "c) \$y: $y -- Tipo: " .gettype($y). "<br>";
echo "d) \$z: $z -- Tipo: " .gettype($z). "<br>";

settype($z, 'float');
echo "e) \$z: $z -- Tipo: " .gettype($z). "<br>";
echo "f) Más informacioń sobre $z: ";
var_dump($z);
```

### 2.4 Tipos de datos compuestos

- Casos de uso: bucles y funciones predefinidas

#### A. Vectores indexados

- "Para almacenar un valor en un vector indexado se usa una clave o índice numérico que determina suposición. Para acceder a los valores también se usan los índices numéricos"

```php
$finde = array('sábado', 'domingo');

$lectivos = [];
$lectivos[0] = 'lunes';
$lectivos[1] = 'martes';
$lectivos[2] = 'miércoles';
$lectivos[3] = 'jueves';
$lectivos[4] = 'viernes';

echo "Días no lectivos: $finde[0], $finde[1].<br>";
echo "Los dos primeros días lectivos: $lectivos[0], $lectivos[1].<br>";

$tam = count($lectivos);
echo "Número de días lectivos: $tam.<br>";
```

#### B. Vectores asociativos

- "En lugar de índices nuḿericos, se usan claves de tipo cadena clave-valor."
- "La función `var_dump()` nos muestra la longitud, claves, valores asociados, tipos y longitud"

```php
$persona = [
  'nombre' => 'Marta',
  'género' => 'Femenino',
  'edad' => 12
];

$agenda['lunes'] = 'correr';
$agenda['martes'] = 'compras';
$agenda['miércoles'] = 'gimnasio';
$agenda['jueves'] = 'fiesta';
$agenda['viernes'] = 'limpieza';

echo $persona['nombre']." tiene ".$persona['edad']." años.<br>";
echo "Después de la ".$agenda['jueves'].", toca ".$agenda['viernes']."<br>";

var_dump($persona);
echo '<br>';
var_dump($agenda);
```

#### C. Vectores multidimensionales

- ...

```php
$grupo = [
  ['nombre'=>'Marta','sexo'=>'Mujer','edad'=>12],
  ['nombre'=>'Eira','sexo'=>'Mujer','edad'=>8]
];

$agenda['sábado']['mañana'] = 'estudiar';
$agenda['sábado']['tarde'] = 'salir';
$agenda['domingo']['mañana'] = 'descansar';
$agenda['domingo']['tarde'] = 'cine';

$tam = count($grupo);
echo "El grupo lo forman $tam personas: ".$grupo[0]['nombre']." y ".$grupo[0]['nombre'].".<br>";
echo "El domingo por la tarde toca ".$agenda['domingo']['tarde'].".<br>";

var_dump($grupo);
echo '<br>';
var_dump($agenda);
```

### 2.5 Operadores

- Se pueden clasificar en unarios, binarios o ternarios.

#### A. Operadores aritméticos

- +: $x + $y: Devuelve la suma de los operandos
- \-
- \*
- /: $x / $y: La división devuelve un float a noser que los operandos sean de tipo integer y el dividendo sea divisible por el divisor
- %: $x % $y: Devuelve la resto de la división
- **: $x ** 2: Devuelve el cuadrado de $x

#### B. Operadores de asignación

- =
- +=
- -=
- *=
- /=
- %=: $x %= %y: Asigna a $x el módulo de los dos operandos
  

#### C. Operadores de comparación

- ==: Devuelve true si el valor de $x es igual a $y
- ===: Devuelve true si el valor y el tipo son iguales
- != o <>
- !==
- \>
- <
- \>=
- <=

#### D. Operadores de incremento y decremento

- ++$x: Incrementa $x en uno y devuelve el nuevo valor
- $x++
- --$x
- $x--

#### E. Operadores lógicos

- and o &&: devuelve true si $x y $x son true
- or o ||: devuelve true si uno es true
- xor: devuelve true solo si uno es true
- !: devuelve true si $x el false

#### F. Operadores para strings

- .: concatenación: $a . $b: devuelve de valor de $a unido al de $b
- .=: asignación y concatenación: añade el valor de $b al final de $a

#### G. Precedencia de operadores

- En el caso de que operadores de una expresión tengan la misma precedencia, manda la asociatividad (derecha o izquierda)


| Operadores  | Asociatividad | Tipo
| ---         | ---           | ---
| `**`        | Derecha       | Aritmético
| ...
| `or`        | Izquierda     | Lógico

```php
$a = 10;
$b = 6;
$c = 7.5;

echo $a + $b * $b .'<br>';
echo ($a + $b) * $b .'<br>';
echo $a / $b .'<br>';
// echo (integer) $a / $b .'<br>';
echo round($a / $b, 2) .'<br>'; // Outputs: 1.67 (a float rounded to 2 decimal places)
echo intdiv($a, $b) .'<br>'; // Outputs: 1 (an integer)
echo $a % $b .'<br>';
echo '<hr>';

$a += $b;

echo $a .'<br>';
echo ++$a .'<br>';
echo $a-- .'<br>';
echo $a .'<br>';
echo (integer) $c .'<br>';
echo $c .'<br>';
echo '<hr>';

$cad1 = 'Lun';
$cad2 = 'es';

$cad1 .= $cad2;
echo $cad1 .'<br>';
echo '<hr>';
```

## 3. Estructuras de control

```md
Las estructuras de control sirven para alterar el orden de la ejecución de las instrucciones, ya que las instrucciones que no están vinculadas a ninguna estructura de control se ejecutan de forma secuencial.
Para conseguir alterar el orden de ejecución de las instrucciones, las estructuras de control necesitan utilizar las expresiones lógicas y así determinar, en función de si una comprobación es verdadera o falsa, qué camino seguir y por tanto cuál será la siguiente instrucción a ejecutar.
En este apartado se ven, por una parte, las estructuras de control condicionales, que son las que determinan si se ejecuta una instrucción, o un bloque de ellas, dependiendo del resultado de una condición. Las estructuras de este tipo son `if`, `if - else` y `switch`.
Por otra parte, también se ven las estructuras repetitivas o de bucle en las que una instrucción o un bloque de ellas se repite un determinado número de veces hasta que se cumpla la condición de parada. Las estructuras de este tipo son `while`, `do - while` y `for`.
```

- Las instrucciones de un programa se ejecutan de forma secuencial y, gracias a las estructuras de control, se puede alterar este orden.
- Para conseguir alterar el orden de ejecución de las instrucciones, las estructuras de control necesitan utilizar **expresiones lógicas** y así determinar, en función de si una comprobación es verdadera o falsa, qué camino seguir y por tanto cuál será la siguiente instrucción a ejecutar.


### 3.1 Condiciones

#### A. If

```php
$z=3;
if ($z > 0){
  echo "\$z es mayor que 0";
}
```

#### B. If - Else

```php
$z=3;
if ($z > 0){
  echo "\$z es mayor que 0";
} else {
  echo "\$z es menor que 0";
}
```
```php
$num=3;
if ($num > 0){
  echo 'El número es positivo';
} elseif ($num == 0){
  echo 'El número es cero';
} else {
  echo 'El número es negativo';
}
```

#### C. Switch

```php
$e = rand(1,4);

switch ($e){
  case 1: $estacion = 'Primavera';  break;
  case 2: $estacion = 'Verano';  break;
  case 3: $estacion = 'Otoño';  break;
  case 4: $estacion = 'Invierno';  break;
  default: /* ... */ ;
}

echo 'La estación es: '.$estacion;
```

- IMPORTANTE: ¡¡se siguen evaluando casos hasta encontrar un `break`!! Útil para agrupar casos...

```php
$tareasPorHacer = '';
$numdia = rand(1,7);

switch ($numdia){
  case 1: $tareasPorHacer .= 'Lectura ';
  case 2: $tareasPorHacer .= 'Pádel ';
  case 3: $tareasPorHacer .= 'Estudiar ';
  case 4: $tareasPorHacer .= 'Gym ';
  case 5: $tareasPorHacer .= 'Salir ';
    break;
  default: $tareasPorHacer .= 'Ninguna ';
}

echo 'Tareas por hacer: '.$tareasPorHacer;
```

```php
$numdia = rand(1,7);

switch ($numdia){
  case 1:
  case 2:
  case 3:
  case 4:
  case 5: $dia = 'Entre semana'; break;
  case 6:
  case 7: $dia = 'Fin de semana'; break;
  default: $dia .= 'No se sabe qué día es';
}

echo 'El día es: '.$dia;
```

### 3.2 Repeticiones o bucles

#### A. While

```php
$i = 1;
while ($i<=10){
  echo $i.'<br>';
  $i++;
}
```

#### B. Do - While

```php
$i = 0;
do {
  $i++;
  echo $i.'<br>';
} while ($i<10);
```

#### C. For

```php
for ($i=1; $i<=10; $i++){
  echo $i.'<br>';
}
```

- `for` anidados...

```php
$filas = 3;
$columnas = 2;

echo '<table border="1" width="200">';
for ($i=1; $i<=$filas; $i++) {
  echo '<tr>';
  for ($j=1; $j<=$columnas; $j++){
    echo "<td> fila $i y columna $j </td>";
  }
  echo '</tr>';
}
echo '</table>';
```

- Variante `foreach` para recorrer arrays (indexados VS asociativos)

```php
$num = [1,2,3];
foreach ($num as $i){
  echo $i.' ';
}
```
```php
$hab = ['Vila-real'=>51000,'Castelló'=>171000];
foreach ($hab as $localidad=>$habitantes){
  echo "$localidad tiene $habitantes habitantes<br>";
}
```

## 4. Funciones

```md
Una función es un conjunto de instrucciones que se agrupan bajo un nombre con la finalidad de reutilizar código. Cuando se llama a una función, se ejecuta el conjunto de instrucciones que contiene y al finalizar se retoma el programa en la instrucción siguiente al punto de la llamada. 
PHP dispone de muchísimas funciones predefinidas que cualquier programador puede utilizar. La documentación completa sobre todas las funciones predefinidas se encuentra en el sitio web php.net que puede ser consultado por cualquier usuario. En esta unidad se verán algunas de las funciones más comunes para el manejo de variables, de cadenas, de archivos y de fecha y hora. 
PHP también permite definir funciones propias. En esta unidad se verá cómo se crean. Para ello se escribe el nombre de la función precedido de la palabra function, se indica si recibe datos, también llamados parámetros, y se escribe el conjunto de instrucciones que la forman.
```

- Hay funciones que devuelven un valor (ojo: asignación de variables, condición bucles...) o que no devuelven nada
- [Al escribir una función,] si devuelve un valor se deberá indicar en una instrucción con la palabra return seguida del valor que devuelve

### 4.1 Funciones predefinidas

> https://www.php.net/manual/en/indexes.functions.php

- Hemos visto hasta ahora: `echo` `settype` `gettype` `count` `define` `var_dump` `rand`

#### A. Manejo de variables

```php
// isset: determina si una variable está definida y no es null

for ($i=0; $i<=1; $i++){
  if (!isset($num)){
    echo 'La variable $num no existe'.'<br>';
  } else {
    echo 'La variable $num existe y vale '.$num.'<br>';
  }
  $num=7;
}
```
```php
// print_r: imprime información sobre una variable de forma legible

$ejemplo = [
  'x' => 'dato1',
  'y' => 'dato2',
  'z' => ['a','b','c']
];
print_r($ejemplo);

```
#### B. Manejo de cadenas

```php
// strtoupper: convierte un string a mayúsculas
echo strtoupper('hola');

// strtolower: convierte un string a minúsculas
echo strtolower(strtoupper('hola'));

// substr: devuelve substring o false si problema; se indica caracter de inicio y longitud
echo substr('probando',1,3);
```
```php
// strcomp: compara dos cadenas alfabéticamente (ASCII) - devuelve num negativo si la primera es menor, positivo si es mayor, 0 si iguales

$cadena1 = 'foo';
$cadena2 = 'FOO';

if (strcmp($cadena1, $cadena2) != 0) {
    echo 'Las cadenas no coinciden';
}
```
```php
// strpos: devuelve posición de la primera aparición del substring o false si no lo encuentra ('mixed type')
$string = "Hello, world! This is a test string.";
$pos = strpos($string, "world");

if ($pos !== false) {
    echo "Substring 'world' found at position: $pos";
} else {
    echo "Substring 'world' not found in the string.";
}
```

#### C. Manejo de archivos

```php
// opendir: abre gestor de directorio
// readdir: lee entrada desde directorio abierto con opendir
// closedir:  cierra gestor de directorio

// Directory path
$dir_path = '.';

// Open the directory
$dir_handle = opendir($dir_path);

// Check if directory opened successfully
if ($dir_handle) {
    echo "Directory opened successfully:<br>";

    // Read directory entries
    while (($file = readdir($dir_handle)) !== false) {
        // Skip special entries '.' and '..'
        if ($file != '.' && $file != '..') {
            echo "File: $file<br>";
        }
    }

    // Close the directory
    closedir($dir_handle);
    echo "Directory closed successfully.<br>";
} else {
    echo "Failed to open directory.<br>";
}
```

#### D. Manejo de fecha y hora

```php
// time: devuelve fecha hora Unix
echo time().'<br>';

// date: https://www.php.net/manual/en/function.date.php
echo date("Y-m-d H:i:s").'<br>';

// checkdate: checkdate(int $month,int $day,int $year):bool -- In summary, echo checkdate(3, 21, 2022); will output 1 because March 21, 2022, is a valid date. If you were to provide an invalid date, such as echo checkdate(2, 30, 2022);, it would output 0 indicating that February 30, 2022, is not a valid date.
if (checkdate(3, 21, 2022)) {
    echo "March 21, 2022, is a valid date.";
} else {
    echo "March 21, 2022, is not a valid date.";
}
// strtotime: descripción hora a UNIX
echo strtotime("10 March 1995");
```
```php
// mktime: ...

// Create a Unix timestamp for a specific date and time
$timestamp = mktime(12, 30, 0, 3, 16, 2022);
echo "Unix timestamp for March 16, 2022, 12:30 PM: $timestamp<br>";

// Get the date and time components from a Unix timestamp
$date = date('Y-m-d H:i:s', $timestamp);
echo "Date and time from timestamp: $date<br>";

// Get individual components of the date and time
$year = date('Y', $timestamp);
$month = date('m', $timestamp);
$day = date('d', $timestamp);
$hour = date('H', $timestamp);
$minute = date('i', $timestamp);
$second = date('s', $timestamp);

echo "Year: $year, Month: $month, Day: $day, Hour: $hour, Minute: $minute, Second: $second\n";
```


### 4.2 Funciones de usuario

> https://www.php.net/manual/en/functions.user-defined.php


```php
function suma_datos ($d1, $d2) {
  $resultado = $d1 + $d2;
  return $resultado;
}

$a = 1;
$b = 2;
$c = suma_datos($a,$b);
echo $c;
```
```php
function escribe_frase ($frase) {
    echo $frase;
}
escribe_frase('hola mundo');
```

#### A. Ámbito de las variables en las funciones

- Contexto o parte del código donde se peude utilizar:
  - Global: variable definida fuera de cualquier función; puede utilizarse en funciones indicando `global`
  - Local: la variable 'se pierde' al acabar la ejecución de la función, a no ser que se use `static` (para mantener su valor entre distintas llamadas)

```php
$x = 1;
$y = 2;

function suma_datos(){
  global $x, $y, $z;
  $z = $x + $y;
}

suma_datos();
echo $z;
```
```php
$x = 1;

function prueba ($y) {
  $x = $y + 3;
  echo 'Dentro de función: '.$x.'<br>';
}
echo 'Fuera de función: '.$x.'<br>';        // 1
prueba($x);                                 // 4
echo 'Fuera de función: '.$x.'<br>';        // 1
prueba($x);                                 // 4
echo 'Fuera de función: '.$x.'<br>';        // 1
```
```php
$x = 1;

function prueba() {
  static $x = 0;
  $x += 3;
  echo 'Dentro de función: '.$x.'<br>';
}
echo 'Fuera de función: '.$x.'<br>';        // 1
prueba($x);                                 // 3
echo 'Fuera de función: '.$x.'<br>';        // 1
prueba($x);                                 // 6
echo 'Fuera de función: '.$x.'<br>';        // 1
```


## 5. Usuarios y sesiones

```md
Como el protocolo HTTP no tiene estado, las peticiones no tienen relación entre ellas. Así pues, para que un programa PHP haga el seguimiento de la actividad de un usuario es necesario utilizar elementos complementarios como las cookies o las sesiones. De esta manera el programa guarda información adicional que le permite, por ejemplo, saber qué acciones puede hacer un determinado usuario o cuáles son sus preferencias de visualización.
Estos elementos complementarios pueden ser de dos tipos: cookies o sesiones. Ambas son mecanismos a través de los cuales el servidor almacena información. La diferencia entre ellas es que las cookies se almacenan en el equipo cliente y las sesiones en el servidor. En esta unidad se verán las principales funciones para gestionar tanto cookies como sesiones por parte de PHP
```

- Protocolo HTTP: **stateless**
  - Seguimiento actividad usuario: cookies (cliente) VS sesiones (server)

### 5.1 Cookies

- Ojo headers... (usar antes que cualquier HTML)
- Pueden ser usadas por otros archivos en el mismo servidor

```php
setcookie('color', false);
setcookie('forma', false);
setcookie('foo', false);

if (!isset($_COOKIE['color'])) {
    setcookie('color','rojo', time() +300);     // expires in 10 min.
    setcookie('forma','cuadrado');              // expires when session ends (browser is closed)
    setcookie('foo','bar', time() -0);          // expires automatically
    echo 'Recarga la página para ver las características de la figura';
} else {
    echo 'La figura es un '.$_COOKIE['forma'].' de color '.$_COOKIE['color'];
}

echo '<hr>';
print_r($_COOKIE);
```
```php
$cookieSize = strlen($_COOKIE['cookie_name']);
echo "Size of cookie data: $cookieSize bytes";
echo '<hr>';

$cookieContents = json_decode($_COOKIE['cookie_name'], true);
echo "Contents of cookie: ";
print_r($cookieContents);
echo '<hr>';

$expiryTime = $_COOKIE['cookie_name'] ? date('Y-m-d H:i:s', $_COOKIE['cookie_name']) : 'Cookie not set';
echo "Expiry time of cookie: $expiryTime";
echo '<hr>';

echo "All cookies set in this session: <br>";
print_r($_COOKIE);
echo '<hr>';

echo "Cookie domain: " . $_SERVER['HTTP_HOST'] . "<br>";
echo "Cookie path: " . $_SERVER['REQUEST_URI'];
echo '<hr>';

echo "User's IP Address: " . $_SERVER['REMOTE_ADDR'] . "<br>";
echo "User Agent: " . $_SERVER['HTTP_USER_AGENT'];
echo '<hr>';
```


### 5.1 Manejo de sesiones

```php
session_start();
$_SESSION['color'] = 'azul';
$_SESSION['forma'] = 'triángulo';
echo 'El id es: '.session_id().'<br>';
echo 'El nombre de sesión es: '.session_name().'<br>';
echo 'La forma es un '.$_SESSION['forma'].' de color '.$_SESSION['color'].'<br>';
unset($_SESSION['color']);
echo 'La forma es un '.$_SESSION['forma'].' de color... '.$_SESSION['color'].'<br>';
session_write_close();
```
```php
```
---

```php
```