# Simulacro IAW

- [Simulacro IAW](#simulacro-iaw)
  - [Test](#test)
  - [Desarrollo](#desarrollo)
    - [Desarrollo 1](#desarrollo-1)
      - [a) CMS](#a-cms)
      - [b) PHP básico y acceso a datos](#b-php-básico-y-acceso-a-datos)
      - [c) PHP con sesiones](#c-php-con-sesiones)
    - [Desarrollo 2](#desarrollo-2)
      - [a) CMS](#a-cms-1)
      - [b) PHP básico y acceso a datos](#b-php-básico-y-acceso-a-datos-1)
      - [c) PHP con sesiones (0,75 puntos)](#c-php-con-sesiones-075-puntos)
    - [Desarrollo 3](#desarrollo-3)
      - [a) CMS](#a-cms-2)
      - [b) PHP básico y acceso a datos](#b-php-básico-y-acceso-a-datos-2)
      - [c) PHP con sesiones](#c-php-con-sesiones-1)


## Test

<!-- 1b
2b
3b (?)
4d (`&$`)
5a
6b (dice que es la `a` pero no puede ser)
7d
8b
9a
10c (sinsentido)
11d (!!)
12a
13d
14d
15a -->


1. No es un CMS:
    - [ ] Wordpress
    - [x] Visual Studio Code
    - [ ] Joomla
    - [ ] Prestashop

2. La sentencia en php con la que me conecto a un servidor mysql es:
    - [ ] mysql_free_result
    - [x] mysql_connect
    - [ ] mysql_select_db
    - [ ] mysql_query

3. La sentencia en php con la que selecciono la base de datos a la que me voy a
conectar es:
    - [ ] mysql_connect
    - [ ] **mysql_select_db**
    - [ ] mysql_fetch_array
    - [x] mysql_query

4. En php, para pasar valores por referencia a una función, utilizamos:
    - [ ] #variable
    - [ ] &variable
    - [ ] $variable
    - [x] &$variable

5. El paso por valor en php se hace:
    - [x] Solo con la variable a usar: $variable
    - [ ] Anteponiendo a la variable con dólar el carácter &: &$variable
    - [ ] Anteponiendo a la variable sin dólar el carácter &: &variable
    - [ ] No existe esa opción en php

6. Si nos encontramos este trocito de código php, el orden de llamada a las funciones es:
```php
function f2(){
    function f1(){
        print "Estoy en F1\n";
    }
    print "Estoy en F2\n";
}
```
  - [ ] f1 y f2
  - [x] f2 y f1
  - [ ] f1, f2, y f1
  - [ ] Da igual el orden de llamadas


7. Las variables de sesión en php:
    - [ ] No existen en php las variables de sesion
    - [ ] Las variables son las mimas para todos los usuarios conectados al servicor
    - [ ] Hay un espacio común de variables de sesión para los diferentes usuarios
    - [x] Son independientes entre los diferentes clientes o usuarios

8. En wordpress, index.php:
    - [ ] No existe, es index.html
    - [x] Página de inicio con la apariencia de nuestra página web
    - [ ] Se linka con config.php para la configuración de inicio de wordpress
    - [ ] Ninguna de las anteriores.


9. La siguiente información ('Database connection details') se guarda en:
    - [x] wp-config.php
    - [ ] wp-admin
    - [ ] wp-includes
    - [ ] wp-content


10. El sistema gestor de bases de datos de Wordpress es:
    - [ ] SqlLite
    - [ ] MariaDB
    - [x] MySql
    - [ ] Mongodb

11. El archivo style.css de wordpress se encuentra en:
    - [ ] No existe, se llama en wordpress style-content.css
    - [ ] Apariencia -> Plugins
    - [ ] Apariencia -> Widgets
    - [x] **Apariencia -> Personalizar**

12. ¿Dónde se suelen ubicar los widgets en wordpress?
    - [x] **Barra lateral, pie de página, etc**
    - [ ] En las diferentes entradas de wordpress
    - [ ] Solo en header y footer de wordpress
    - [ ] No se ubican, son archivos de configuración

13. Seguro que te has encontrado en WP con al menos una categoría por defecto, que es:
    - [ ] Inside
    - [ ] Text
    - [ ] Multimedia
    - [x] Uncategorized

14. Un rol de usuario que existe en Wordpress es:
    - [ ] Editor
    - [ ] Colaborador
    - [ ] Autor
    - [x] Todas las anteriores

15. El nivel de permiso más bajo en WP es:
    - [x] Suscriptor
    - [ ] Editor
    - [ ] Autor
    - [ ] Administrador


---

## Desarrollo

```md
> DESARROLLO
- 1 poquito CMS
- 1 poquito PHP
- 1 poquito PHP sesiones
```


### Desarrollo 1

#### a) CMS

1. Preguntas test sobre WP:
   1. ¿Cuál es el propósito principal de los plugins en WordPress? (0,15 p)
        - [ ] Personalizar la apariencia de un sitio web
        - [x] Agregar funcionalidades adicionales
        - [ ] Crear una copia de seguridad del sitio
        - [ ] Ninguna de las anteriores
   2. ¿Qué es un tema (theme) en WordPress? (0,15 p)
        - [ ] Un tipo de publicación
        - [ ] Una extensión que optimiza el SEO
        - [x] Un conjunto de plantillas que controla la apariencia de un sitio web
        - [ ] Ninguna de las anteriores
   3. ¿Qué archivo de WordPress controla la apariencia de una página web? (0,15 p)
        - [x] style.css
        - [ ] index.php
        - [ ] config.ini
        - [ ] Ninguna de las anteriores
   4. ¿Qué es el “Panel de Control” en WordPress? (0,15 p)
        - [ ] Una característica solo disponible para usuarios de pago.
        - [x] La interfaz donde los administradores gestionan su sitio web.
        - [ ] Un widget de WordPress.
        - [ ] Ninguna de las anteriores
   5. ¿Qué significa SEO en el contexto de WordPress? (0,15 p)
        - [ ] Sitio Excelente y Organizado
        - [ ] Sistema de Edición Online
        - [x] Optimización para Motores de Búsqueda
        - [ ] Ninguna de las anteriores

2. Con WordPress instalado en local, realizar las siguientes tareas: (0,75 puntos, a repartir entre los siguientes apartados)
   1. Realizar un menú con 3 páginas, donde en cada página añadáis varios widgets, indicando su funcionalidad y ubicación dentro de cada página.
   2. Añadir breve explicación del porqué de los widgets elegidos y como ha sido su instalación y mini configuración (configuración mínima para este ejercicio del simulacro).

#### b) PHP básico y acceso a datos

1. El resultado, en el navegador, de este trozo de código PHP es: (0,5
puntos)
```php
<?php
print "<p>Comienzo</p>\n";
for ($i = 10; $i > 3; $i++) {
    print "<p>$i</p>\n";
}
print "<p>Final</p>\n";
?>
```
  - [ ] `<p>Comienzo</p>`<br>`<p>10</p>`<br>`<p>11</p>`<br>`<p>12</p>`
  - [ ] Comienzo<br>10<br>11<br>12
  - [ ] `<p>Comienzo</p>`<br>`<p>10</p>`<br>`<p>11</p>`<br>`<p>12</p>`<br>`<p>11</p>`<br>`<p>12</p>`
  - [x] Ninguna de las anteriores

2. Realizar el siguiente ejercicio, similar a los de clase: (0,75 puntos)

```txt
NUMEROS PARES
DESDE el numero [ ] HASTA el numero [ ](Generar numeros pares)
```
```php
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Simulacro: 1:b:2</title> 
    <!-- <link rel="stylesheet" type="text/css" href="main.css"> -->
</head>
<body>    
    <p><b>NÚMEROS PARES</b></p>
    <form method="post">
        <label for="tabla1">DESDE el número</label> 
        <input type="number" id="tabla1" name="tabla1" required>        
        <label for="tabla2">HASTA el número</label>        
        <input type="number" id="tabla2" name="tabla2" required>        
        <input type="submit" name="iguales" value="Generar números pares">
    </form>

    <?php        
    if (isset($_POST['iguales'])) {
        $tabla1 = $_POST['tabla1'];
        $tabla2 = $_POST['tabla2'];
        
        // echo "<br><br>// ESTO DE ABAJO ES LO IMPORTANTE<br>";

        for ($i = $tabla1; $i <= $tabla2; $i++) {
            if ($i % 2 == 0) {
                echo $i . " ";
            }
        }
    }
    ?>
</body>
</html>
```

#### c) PHP con sesiones

1. Con el siguiente trocito de código php, responder a las siguientes cuestiones: (0,5 puntos)
```php
<?php
session_start();
$_SESSION["nombre"] = "Pepito Perez";
print "<p>Su nombre es $_SESSION[nombre].</p>\n";
unset($_SESSION["nombre"]);
if (isset($_SESSION["nombre"])) {
    print "<p>Su nombre es $_SESSION[nombre].</p>\n";
} else {
    print "<p>No sé su nombre.</p>\n";
}
?>
```
  - ¿Qué salida se mostraría en pantalla? Justifica la respuesta:<br>
    Saldría 'Su nombre es Pepito Pérez' y luego 'No sé su nombre' por lo del `unset`
  - Añade el código para cerrar y terminar con la sesión.<br>
    `session_destroy` (**OJO**)

2. Define brevemente los siguientes conceptos: (0,25 puntos)
    1. URI: ...
    2. Theme: ...


---


### Desarrollo 2

#### a) CMS

1. Preguntas test sobre WP:
    1. ¿Cuál es el objetivo de un plugin de caché en WordPress? (0,15p)
        - [ ] Agregar efectos visuales a un sitio web
        - [x] Mejorar la velocidad de carga de un sitio web almacenando en caché contenido estático.
        - [ ] Crear copias de seguridad del sitio web.
        - [ ] Ninguna de las anteriores
    2. ¿Cuál es el nombre de la base de datos utilizada por WordPress para almacenar el contenido del sitio? (0,15 p)
        - [ ] MySiteDB
        - [x] MySQL
        - [ ] WordPressDB
        - [ ] Ninguna de las anteriores
    3. ¿Cuál de las siguientes afirmaciones describe mejor una “publicación” en WordPress? (0,15 p)
        - [ ] Un contenido estático en una página de inicio.
        - [x] Un artículo o entrada en un blog o sitio web.
        - [ ] Un mensaje de correo electrónico enviado desde el sitio web.
        - [ ] Ninguna de las anteriores
    4. ¿Cuál de las siguientes afirmaciones describe mejor a un “administrador” en WordPress? (0,15 p)
        - [ ] Un usuario que puede ver el sitio web pero no realizar cambios.
        - [x] Un usuario con permisos completos para gestionar y editar todos los aspectos del sitio web.
        - [ ] Un tipo de tema en WordPress.
        - [ ] Ninguno de los anteriores
    5. ¿Qué es un “shortcode” en WordPress? (0,15 p)
        - [x] Un fragmento de código que permite mostrar contenido dinámico en una página o entrada.
        - [ ] Un tipo de ataque cibernético en WordPress.
        - [ ] Una plantilla de página predefinida.
        - [ ] Ninguna de las anteriores

2. Con WordPress instalado en local, realizar las siguientes tareas: (0,75 puntos a repartir entre los apartados por igual)
    1. Crear 2 usuarios nuevos dentro de tu Wordpress, con diferentes roles (administrador, editor, etc); y loguéate a tu web con ambos usuarios mostrando las diferencias en el panel de configuración, etc para que que permite wordpress con cada uno
    2. Añadir 2 plugins a tu Wordpress indicando que funcionalidad tiene y el grado de recomendación que darías a un futuro administrador de Wordpress.


#### b) PHP básico y acceso a datos

1. Escribe que saldría por pantalla con este trozo de código php: (0,5 puntos):
```php
<?php
$dado1 = rand(1, 6);
$dado2 = rand(1, 6);
print "<p>\n";
print "<img src=\"img/$dado1.svg\" alt=\"$dado1\" width=\"140\" height=\"140\">\n";
print "<img src=\"img/$dado2.svg\" alt=\"$dado2\" width=\"140\" height=\"140\">\n";
print "</p>\n";
print "\n";
print " <p>Total: $dado1 + $dado2 = ".($dado1 + $dado2)."</span></p>\n";
?>
```
  Básicamente dos imágenes, cada una un dado con un determinado valor, y una línea de texto con ambos valores y la suma.


2. Realizar el siguiente ejercicio en php, en el cual debemos comprobar si los valores de ambas cajas de texto conciden introduciendo texto en ellas (0,75 puntos):
```txt
Primera palabra [ ] Segunda palabra [ ] (Comprobar si son diferentes)
```
```php
<?php
echo '
<p><b>COMPARAR PALABRAS</b></p>
<form method="post">
    <label for="palabra1">Primera palabra:</label>
    <input type="string" id="palabra1" name="palabra1" required>
    <label for="palabra2">Segunda palabra:</label>
    <input type="string" id="palabra2" name="palabra2" required>
    <input type="submit" name="diferentes" value="Comprobar si son diferentes">
</form>
';
if (isset($_POST['diferentes'])) {
    $palabra1 = $_POST['palabra1'];
    $palabra2 = $_POST['palabra2'];
    
    if ($palabra1 !== $palabra2) {
        echo $palabra1." y ".$palabra2." son diferentes";
    } else {
        echo $palabra1." y ".$palabra2." son iguales";
    }
}
?>
```

#### c) PHP con sesiones (0,75 puntos)

1. Realiza el login y logout como el ejercicio de clase con este formulario:
```txt
Iniciar Sesión
[Usuario]
[Contraseña]
(Iniciar Sesión)
```
```php
// ...
```

2. Define brevemente los siguientes conceptos: (0,25 puntos)
   1. SEO: ...
   2. URL: ...


---

### Desarrollo 3

#### a) CMS

1. Preguntas test sobre WP:
    1. ¿Qué es un “widget personalizado” en WordPress? (0,15 p)
        - [ ] Un pequeño dispositivo electrónico que se conecta al sitio web.
        - [ ] Una característica obsoleta en WordPress.
        - [x] Un bloque de contenido que se puede personalizar y agregar a áreas de widgets en el sitio web.
        - [ ] Ninguna de las anteriores
    2. ¿Cuál es el propósito de la “biblioteca de medios” en WordPress? (0,15 p)
        - [ ] Almacenar libros electrónicos y archivos de texto.
        - [x] Administrar y cargar imágenes, videos y otros archivos multimedia en el sitio web.
        - [ ] Mostrar la lista de enlaces de sitios web favoritos.
        - [ ] Ninguna de las anteriores
    3. Si la URL de mi WordPress es www.hola.com ¿Cuál será la del escritorio de WordPress? (0,15 p)
        - [ ] www.hola.com/wp-install
        - [x] **www.hola.com/wp-admin**
        - [ ] www.hola.com/wp-panel<>
        - [ ] www.hola.com/panel
    4. ¿Cuál NO es una categoría de usuarios de WordPress? (0,15 p)
        - [ ] Administrador
        - [x] Escritor
        - [ ] Editor
        - [ ] Suscriptor
    5. ¿Cómo se llama a las plantillas de diseño visual de WordPress? (0,15 p)
        - [ ] Formato
        - [ ] Plantilla
        - [x] Tema
        - [ ] Diseño


2. Con WorddPress instalado en local, realizar las siguientes tareas:
   1. Indica como se pueden incluir diferentes elementos en wordpress, en las diferentes partes estructurales de una web. (0,5 puntos)<br>
    foo
   2. Indica como editarías directamente en código, los archivos css en tu wordpress; adjuntando alguna imagen (0,25 puntos)<br>
    foo


#### b) PHP básico y acceso a datos

1. Escribe que saldría por pantalla con este trozo de código php: (0,5 puntos)
```php
<?php
print "<p>Comienzo</p>\n";
for ($i = 1; $i < 3; $i++) {
    for ($j = 10; $j < 12; $j++) {
        print "<p>i: $i -- j: $j</p>\n";
    }
}
print "<p>Final</p>\n";
?>
```
`Comienzo`<br>`i: 1 -- j: 10`<br>`i: 1 -- j: 11`<br>`i: 2 -- j: 10`<br>`i: 2 -- j: 11`<br>`Final`<br>

2. Utilizando la función `isset`, realizar el siguiente ejercicio en php, donde se muestren en el documento los números, que vayan en orden decreciente del número del primer type text al número del segundo type text. (0,75 puntos)

```txt
NÚMEROS DECRECIENTES
Primer número (mayor que el segundo): [ ] Segundo número: [ ] (GENERAR)
```
```php
<?php
print '
<p><b>NÚMEROS DECRECIENTES</b></p>
<form method="post">
    <label for="numero1">Primer número (mayor que el segundo):</label>
    <input type="string" id="numero1" name="numero1" required>
    <label for="numero2">Segundo número:</label>
    <input type="string" id="numero2" name="numero2" required>
    <input type="submit" name="generar" value="Comprobar si son diferentes">
</form>
';
if (isset($_POST['generar'])) {
    $numero1 = $_POST['numero1'];
    $numero2 = $_POST['numero2'];
    
    if ($numero1 < $numero2) {
        print "$numero1 es menor que $numero2. Vuelve a intentarlo";
    } else {
        for ($i = $numero1; $i >= $numero2; $i--) {
            echo $i . " ";
        }
    }
}
?>
```
<!-- ```php
<!DOCTYPE html><html><head>
    <meta charset="utf-8" />    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title> 
     <link rel="stylesheet" type="text/css" href="main.css" />    
<script src=“XXX.js"></script></head>
<body>    
<?php        
     if (isset($_POST['iguales'])) 
      { }
    ?>
    <label for="num1">NUMEROS DECRECIENTES</label>
    <form method="post">
        <label for="num1">Primer numero (mayor que el segundo)</label> 
        <input type="text" id="pal1" name="pal1" />        
        <label for="num1">Segundo numero</label>        
        <input type="text" id="pal2" name="pal2" />        
        <input type="submit" name="iguales" value="GENERAR" />


    </form>    
   <?php             
        if (isset($_POST['iguales'])) 
          {}        
    ?>    
</body></html>
``` -->


#### c) PHP con sesiones

1. Realizar una función login en línea a la función logout descrita en las líneas de abajo. Comentar las líneas de AMBAS funciones, indicando que hace cada linea (0,5 puntos)
```php
function logOut() {
  session_unset();
  session_destroy();
  session_start();
  session_regenerate_id(true);  //esta se que no la hemos visto, pero se puede deducir
}
```
```php
// La función session_unset() elimina todas las variables de sesión.
// Esto asegura que no haya ninguna variable de sesión restante antes de destruir la sesión.
function logOut() {
  session_unset();
  
  // La función session_destroy() destruye toda la información registrada de una sesión.
  // Esto incluye variables de sesión y datos de sesión almacenados en el servidor.
  session_destroy();
  
  // La función session_start() reanuda una sesión existente o crea una nueva si no hay ninguna.
  // Esto es necesario para iniciar una nueva sesión después de destruir la anterior.
  session_start();
  
  // La función session_regenerate_id(true) regenera el ID de sesión y opcionalmente elimina los datos asociados con la sesión antigua.
  // Esto ayuda a prevenir ataques de fijación de sesión y garantiza una mayor seguridad al generar un nuevo ID de sesión.
  session_regenerate_id(true);
}

function logIn() {
  // La función session_start() reanuda una sesión existente o crea una nueva si no hay ninguna.
  // Esto es necesario para iniciar una nueva sesión al iniciar sesión.
  session_start();
}
```

2. Define brevemente los siguientes conceptos: (0,25 puntos)
    1. cPanel: ventanita de config con la configuración: apariencia etc etc... == panel de configuración; dashboard
    2. Hosting: ...
