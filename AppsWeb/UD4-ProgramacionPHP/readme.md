# AppsWeb UD4: Programación PHP

- [AppsWeb UD4: Programación PHP](#appsweb-ud4-programación-php)
  - [TEORÍA](#teoría)
  - [PRÁCTICA](#práctica)
    - [foo](#foo)
    - [bar](#bar)
    - [McGrawHill](#mcgrawhill)
      - [1](#1)
        - [Caso práctico para la reflexión 1 -- conexiones remotas](#caso-práctico-para-la-reflexión-1----conexiones-remotas)
        - [Ponte a prueba 1 -- edición remota](#ponte-a-prueba-1----edición-remota)
        - [Ejercicios 1 -- test](#ejercicios-1----test)
      - [2](#2)
        - [Caso práctico 2 -- corregir errores](#caso-práctico-2----corregir-errores)
        - [Ponte a prueba 2 -- Vectores multidimensionales](#ponte-a-prueba-2----vectores-multidimensionales)
        - [Ejercicios 2 -- test](#ejercicios-2----test)
      - [3](#3)
        - [Caso práctico 3 -- números primos](#caso-práctico-3----números-primos)
        - [Ponte a prueba 3 -- bucles](#ponte-a-prueba-3----bucles)
        - [Estudio de caso -- tablas de multiplicar](#estudio-de-caso----tablas-de-multiplicar)
        - [Ejercicios 3 -- test](#ejercicios-3----test)
      - [x](#x)
        - [Caso práctico x -- foo](#caso-práctico-x----foo)
        - [Ponte a prueba x -- foo](#ponte-a-prueba-x----foo)
        - [Estudio de caso -- foo](#estudio-de-caso----foo)
        - [Ejercicios x -- test](#ejercicios-x----test)
  - [QUIZ](#quiz)

## TEORÍA

> apuntes.md

## PRÁCTICA

### foo
### bar
### McGrawHill

#### 1

##### Caso práctico para la reflexión 1 -- conexiones remotas

```md
**Planteamiento**
Independientemente de si se trata de sistemas de explotación o de desarrollo, no suele ser buena idea trabajar físicamente en el mismo servidor. A la hora de implementar una aplicación podemos adoptar diferentes estrategias:
- Desarrollarla y luego **actualizar los archivos del servidor** mediante una conexión remota. Una de las opciones más aconsejables es usar una aplicación de sincronización de archivos como GIT, aunque también podemos utilizar programas de transferencia de archivos que trabajen con protocolos seguros, como por ejemplo scp, sftp, rsync o clientes FTPS. Recuerda que el equipo que tiene instalado el servidor web también debe contar con el correspondiente servidor de transferencia de archivos.
- Realizar una conexión de **control remoto** para trabajar directamente con los datos y aplicaciones del servidor. Si se trata de un sistema Windows, podemos optar, por ejemplo, por Windows Admin Center o cualquier programa que use RDP. Si por el contrario, se trata de un sistema GNU/Linux, lo mejor es trabajar con SSH, pero como no se aconseja instalar un entorno gráfico en sus servidores, el desarrollador se vería limitado a usar herramientas en modo texto.
- Trabajar con el sistema de **archivos remotos y herramientas locales**. Según el caso, podemos optar por compartir parte del sistema de archivos del servidor y, desde el cliente, conectarse a ellos o montarlos sobre su propio sistema de archivos. De esta manera, se podrán editar con las herramientas instaladas en el cliente.
¿Qué estrategia crees que sería la más adecuada para un entorno real? ¿Y cuál para realizar las actividades y prácticas durante el curso?

**Conclusión**
Posiblemente la solución más adecuada en un entorno real sea la primera opción, que implica trabajar sin conexión y actualizar el código fuente en el servidor cuando sea necesario. Para realizar la mayoría de las actividades de este módulo se puede optar por cualquiera de las soluciones planteadas anteriormente pero, sin embargo, quizá sea más cómodo trabajar con la tercera. Por ejemplo, con Ubuntu Server con el servidor openssh-server instalado, desde el gestor de archivos del cliente GNU/Linux se puede acceder a los datos y modificarlos con Editor de textos instalado en el propio cliente. 
Por otro lado, mientras se aprende a programar con PHP y siempre que se trate de pruebas sencillas, se puede utilizar alguna herramienta online como la que W3Schools ofrece en su tutorial de PHP bajo el título «Try it Yourself».
```

##### Ponte a prueba 1 -- edición remota

```md
**Edición Remota**
La jefa del Departamento de Informática y Comunicaciones te ha comentado que está pensando en implementar una aplicación web para la gestión del préstamo de material de prácticas al alumnado, pero le falta tiempo para poder ponerse con ello. Te has ofrecido voluntario para preparar el servidor de desarrollo de manera que se usen las herramientas de edición locales de un sistema con escritorio, Ubuntu Desktop, sobre el sistema de archivos del servidor remoto sin entorno gráfico, Ubuntu Server. 

Sigue los pasos de este tutorial para instalar el servidor OpenSSH en Ubuntu Server, acceder remotamente al sistema de archivos del servidor y editar un archivo.

- Instala el servidor SSH en Ubuntu Server para que se puedan transferir archivos usando SFTP.
- Conéctate al servidor por medio del protocolo SFTP usando el administrador de archivos Nautilus. Conéctate con el usuario www-data del servidor.
- Busca el archivo index.html, ábrelo con Editor de textos y haz algún cambio.
- Abre el navegador web de Ubuntu Desktop, accede a tu servidor web y comprueba que los cambios se han realizado correctamente.
```

##### Ejercicios 1 -- test

1. ¿Qué extensión deben tener los archivos con código PHP? **`php`**
2. Es preferible trabajar localmente con los servidores, por lo que hay que evitar las conexiones remotas. **Falso**
3. La interactividad con el usuario se puede obtener gracias a la información que este envía al servidor mediante los formularios a través de los métodos GET y POST. **Verdadero**
4. PHP es un lenguaje de programación **interpretado**, no **compilado**y, además, es **compatible** con el servidor web nginx.
5. Selecciona la opción más adecuada para desarrollar código en un entorno real en el que se cuenta con un servidor web remoto. **Desarrollar en local y luego actualizar los archivos del servidor mediante una conexión remota.**


#### 2

##### Caso práctico 2 -- corregir errores

```php
<?php
  nombre = 'Gael';                                        // Inst 1
  echo 'Mi amigo se llama $nombre.<br>';                  // Inst 2
    $E = 2.71828;                                           // Inst 3
  echo "El valor aproximado del número e es ".E.".<br>";   // Inst 4
    $x = 10.0;                                              // Inst 5
                                                          // Inst 6
  echo "La variable $x es de tipo ".gettype($x).".<br>";   // Inst 7
    $semana[0] = 'lunes';                                   // Inst 8
  $semana[1] = 'martes';                                  // Inst 9
  $semana[2] = 'miércoles';                               // Inst 10
  $semana[3] = 'jueves';                                  // Inst 11
  $semana[4] = 'viernes';                                 // Inst 12
  $semana[5] = 'sábado';                                  // Inst 13
  $semana[6] = 'domingo'                                  // Inst 14
  $tam = 7;                                               // Inst 15
  echo "La semana tiene $tam días.<br>";                  // Inst 16
  $media = 10 + 5 + 7.5 / 3;                              // Inst 17
  echo "La media de 10, 5 y 7.5 es $media.<br>";          // Inst 18
?>
```
```php
?php
  $nombre = 'Gael';                                        // Inst 1
  echo "Mi amigo se llama $nombre.<br>";                   // Inst 2
  define('E',2.71828);                                     // Inst 3
  echo "El valor aproximado del número e es ".E.".<br>";   // Inst 4
  $x = 10.0;                                               // Inst 5
  settype($x, "integer");                                       // Inst 6
  echo "La variable $x es de tipo ".gettype($x).".<br>";   // Inst 7
  $semana[0] = 'lunes';                                   // Inst 8
  $semana[1] = 'martes';                                  // Inst 9
  $semana[2] = 'miércoles';                               // Inst 10
  $semana[3] = 'jueves';                                  // Inst 11
  $semana[4] = 'viernes';                                 // Inst 12
  $semana[5] = 'sábado';                                  // Inst 13
  $semana[6] = 'domingo';                                 // Inst 14
  $tam = count($semana);                                  // Inst 15
  echo "La semana tiene $tam días.<br>";                  // Inst 16
  $media = (10 + 5 + 7.5) / 3;                            // Inst 17
  echo "La media de 10, 5 y 7.5 es $media.<br>";          // Inst 18
 ?>
```

##### Ponte a prueba 2 -- Vectores multidimensionales

```md
**Vectores multidimensionales**
La jefa del Departamento de Informática y Comunicaciones, contenta con la ayuda que le prestaste, ha vuelto a ponerse en contacto contigo. Como sabe que te gusta programar, te ha pedido que diseñes en PHP un vector multidimensional para la nueva aplicación que cumpla con los siguientes requerimientos:
- El vector debe ser de tres dimensiones que almacenarán los grupos, los alumnos del grupo y sus datos, respectivamente.
- Los grupos, 1ASIR y 2ASIR, tendrán dos personas cada uno.
De cada persona se deben almacenar los siguientes datos: nombre, apellidos, material prestado y la fecha de préstamo.

Sigue estos pasos:
- Crea el vector asociativo $grupos. Cada una de las claves, 1ASIR y 2ASIR, hará referencia a un vector.
- Estos nuevos vectores serán indexados, por lo que no hace falta indicar las claves, solo sus elementos.
- En este caso sus elementos serán vectores asociativos con claves: nombre, apellidos, material y fecha.
Es aconsejable que revises el ejemplo de vector bidimensional de la teoría de este apartado y que, además de crear el vector tridimensional, hagas alguna prueba de funcionamiento.
```
```php
$grupos = [
    '1ASIR' => [
        [
            'nombre' => 'Juan',
            'apellidos' => 'García Pérez',
            'material_prestado' => 'Libro de PHP',
            'fecha_prestamo' => '2024-03-16'
        ],
        [
            'nombre' => 'María',
            'apellidos' => 'López Martínez',
            'material_prestado' => 'Libro de JavaScript',
            'fecha_prestamo' => '2024-03-15'
        ]
    ],
    '2ASIR' => [
        [
            'nombre' => 'Pedro',
            'apellidos' => 'Martín Sánchez',
            'material_prestado' => 'Libro de HTML',
            'fecha_prestamo' => '2024-03-14'
        ],
        [
            'nombre' => 'Laura',
            'apellidos' => 'Gómez Rodríguez',
            'material_prestado' => 'Libro de CSS',
            'fecha_prestamo' => '2024-03-13'
        ]
    ]
];

echo "Grupo 1ASIR:<br>";
foreach ($grupos['1ASIR'] as $alumno) {
    echo "Nombre: {$alumno['nombre']} {$alumno['apellidos']}, ";
    echo "Material prestado: {$alumno['material_prestado']}, ";
    echo "Fecha de préstamo: {$alumno['fecha_prestamo']}<br>";
}

echo "<br>Grupo 2ASIR:<br>";
foreach ($grupos['2ASIR'] as $alumno) {
    echo "Nombre: {$alumno['nombre']} {$alumno['apellidos']}, ";
    echo "Material prestado: {$alumno['material_prestado']}, ";
    echo "Fecha de préstamo: {$alumno['fecha_prestamo']}<br>";
}
```

##### Ejercicios 2 -- test

1. ¿Qué elementos indican que todo lo que hay a partir de ellos, hasta el final de línea, es un comentario? **// y #**
2. La función `settype()` cambia el tipo de dato de una variable durante la ejecución de una instrucción de manera que, cuando se vuelva a usar esa variable, habrá recuperado su tipo original. **Falso**
3. ¿Qué variable predefinida contiene la información que un formulario pasa a un programa PHP a través de la URL? La interactividad con el usuario se puede obtener gracias a la información que este envía al servidor mediante los formularios a través de los métodos GET y POST. **$_GET.**
4. En la expresión ((2 + 3) / 2 )."b" primero se aplica el operador `+`, y el último en aplicarse es `.`.
5. ¿Qué tipo de vector se caracteriza por usar claves de tipo cadena para indicar qué elemento del vector se quiere establecer o leer? **Asociativos.**

#### 3

##### Caso práctico 3 -- números primos

- Un número primo es el que solamente se puede dividir entre sí mismo y entre uno. 
- Crea las instrucciones para determinar si un número es primo o no. Recuerda que el operador aritmético % devuelve el resto de hacer la división entre dos números.

```php
$num = [1,2,3,4,5,6,7,8,9,10,11,12,13];

foreach ($num as $i) {
    $is_prime = true;
    for ($j = 2; $j <= sqrt($i); $j++) {
        if ($i % $j == 0) {
            $is_prime = false;
            break;
        }
    }
    if ($is_prime && $i > 1) {
        echo "$i es primo<br>";
    } else {
        echo "$i no es primo<br>";
    }
}
```

```php
<?php
// Process the form submission only if it's a POST request
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve user input from $_POST superglobal
    $number = $_POST['number'];

    // Check if the input is a prime number
    $is_prime = true;
    for ($i = 2; $i <= sqrt($number); $i++) {
        if ($number % $i == 0) {
            $is_prime = false;
            break;
        }
    }

    // Display the result
    if ($is_prime && $number > 1) {
        echo "$number is prime";
    } else {
        echo "$number is not prime";
    }
    echo '<hr>'; // Output separator
}

// HTML form
?>
<!DOCTYPE html>
<html>
<head>
    <title>User Input Form</title>
</head>
<body>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <label for="number">Enter a number:</label>
        <input type="number" id="number" name="number"><br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
```

##### Ponte a prueba 3 -- bucles

- **Bucles**
  - De nuevo, te piden ayuda con la aplicación web para la gestión del préstamo de material de prácticas  al alumnado. Esta vez se trata de despejar algunas dudas de cómo presentar la información al usuario de la aplicación. 
  - Comentas que las tablas te gustan mucho porque hacen que la información se lea cómodamente y permite localizar rápido la información. Para mostrar cómo quedaría, implementas un pequeño programa que muestre en pantalla una tabla de 4 filas y 8 columnas (la primera fila debe tener los números del 101 al 108, la segunda del 201 al 208, la tercera del 301 al 308 y la cuarta del 401 al 408).
  - Recuerda que puedes utilizar una estructura de control de tipo bucle dentro de otra.

```php
echo '<table border="1" width="200">';
for ($i = 1; $i <= 4; $i++){
    echo '<tr>';
    for ($j = 1; $j <= 8; $j++){
        echo '<td>'.$i.'0'.$j.'</td>';
    }
    echo '</tr>';
}
```

##### Estudio de caso -- tablas de multiplicar

- las tablas de multiplicar de tres formas: `while`, `do-while` y `for`

```php
// const num = 5;
$num = [1,2,3,4,5,6,7,8,9,10];

foreach ($num as $i){
    echo '<div style="display: inline-block; margin-right: 10px;">';
    echo '<table border="1">';
    for ($j = 1; $j <= 10; $j++) {
        echo '<tr>';
        echo '<td>'.$i.' * '.$j.'</td>';
        echo '<td>'.$i*$j.'</td>';
        echo '</tr>';
    }
    echo '</table>';
    echo '</div>';
}
echo '<hr>';

foreach ($num as $i){
    echo '<div style="display: inline-block; margin-right: 10px;">';
    echo '<table border="1">';
    $j = 1;
    while ($j <= 10){
        echo '<tr>';
        echo '<td>'.$i.' * '.$j.'</td>';
        echo '<td>'.$i*$j.'</td>';
        echo '</tr>';
        $j++;
    }
    echo '</table>';
    echo '</div>';
}
echo '<hr>';

foreach ($num as $i){
    echo '<div style="display: inline-block; margin-right: 10px;">';
    echo '<table border="1">';
    $j = 1;
    do {
        echo '<tr>';
        echo '<td>'.$i.' * '.$j.'</td>';
        echo '<td>'.$i*$j.'</td>';
        echo '</tr>';
        $j++;
    } while ($j <= 10);
    echo '</table>';
    echo '</div>';
}
echo '<hr>';
```

##### Ejercicios 3 -- test

1. Las estructuras de control sirven para modificar el orden de la ejecución de las instrucciones a través de: **La evaluación de condiciones.**
2. La estructura de control if - else: **Ejecuta diferentes bloques de instrucciones dependiendo de si se cumple o no la condición.**
3. Indica el código que falta para que el resultado en pantalla sea: 6-12-18-24-30: **$i = 6; y $i=$i+6**

```php
for (_______ $i <= 30; _______) {
  echo $i.’-’;
}
```

4. En un bucle for, en la misma línea se escribe primero la inicialización, luego la condición y por último el incremento o decremento. **Verdadero.**
5. Un bucle do - while funciona igual que un bucle while, aunque la condición se evalúa después de ejecutar el bloque de instrucciones. **Verdadero**

#### x

##### Caso práctico x -- foo
##### Ponte a prueba x -- foo
##### Estudio de caso -- foo
##### Ejercicios x -- test

1. foo
2. foo
3. foo
4. foo
5. foo



## QUIZ


---
```php
```