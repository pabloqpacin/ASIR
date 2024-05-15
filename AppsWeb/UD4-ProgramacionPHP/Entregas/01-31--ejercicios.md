# Ejercicios 2024/01/31

BOILERPLATE
<!-- 
```php
<html>
<head>
    <title>Ejercicio N</title>
</head>
<body>
    <?php
        echo "supdawg";
    ?>
</body>
</html>
``` -->

## apuntes

- `echo` VS `print`
    - Using commas in a print statement will result in a syntax error because print can only take one argument.
  - `print` doesn't support multiple parameters like `echo`.
- `include()` VS `require()`


## boilerplate

```php
<!DOCTYPE html>
<html lang="es">
<head>
    <title>PHP 101</title>
    <style>
        body {
            background-color: #333;
            color: #fff;
            // font-family: system-ui, -apple-system, 'Segoe UI', Roboto, Ubuntu, sans-serif;
            // text-align: center;
            // padding: 20px;
        }
    </style>
</head>
<body>

    <?php

$i = 1;
echo $i, '<br>', $i+1;

    ?>

</body>
</html>
```


## ejercicios

---

1. Muestra los números del 1 al 20 con bucles `while` y `for`

```php
<?php

    echo '<br><hr>', 'Bucle FOR: <br>';
    for ($i = 1; $i <= 20; $i++){
        echo $i, ' ';
    }

    echo '<br><hr>', 'Bucle WHILE: <br>';
    $i = 1;
    while ($i <= 20){
        echo $i, ' ';
        $i++;
    }

?>
```

2. Crear una tabla con las etiquetas de html donde haya dos columnas. La primera, con palabras en español. La segunda, con sus traducciones en inglés.

```php
<?php

    // echo "<table border='1' width='200'>";
    echo "<table border=\"1\" width=\"200\">";
    echo "<tr><td>", "<b>English</b>",  "</td><td>", "<b>Spanish</b>",  "</td></tr>";
    echo "<tr><td>", "apple",           "</td><td>", "manzana",         "</td></tr>";
    echo "<tr><td>", "banana",          "</td><td>", "plátano",         "</td></tr>";
    echo "<tr><td>", "berries",         "</td><td>", "moras",           "</td></tr>";
    echo "<tr><td>", "lemon",           "</td><td>", "limón",           "</td></tr>";
    echo "<tr><td>", "orange",          "</td><td>", "naranja",         "</td></tr>";
    echo "</table>";

?>
```

3. Escribe un programa que utilice las variables `$x` y `$y`. Asígnales los valores 100 y 200 respectivamente. A continuación, muestra por pantalla el valor de cada variable y la suma, la resta, la multiplicación y la división. Mostrar y hacer las operaciones EN LA MISMA LÍNEA.

```php
<?php
    $x = 100;
    $y = 200;
    echo "$x + $y = ", $x + $y, '<br>';
    echo "$x - $y = ", $x - $y, '<br>';
    echo "$x * $y = ", $x * $y, '<br>';
    echo "$x / $y = ", $x / $y, '<br>';
?>
```


4. Realizar un conversor de euros a dólares

```php
define("EURO", 1.00);
define("DOLLAR", 1.08);

$currency = '';
$user_money = '';

while ($currency -notin d,D,e,E) {
    read '¿Quieres cambiar Euros [e] o Dolares [d]' $currency
    if ($currency -in e,E){
        $currency = 'Euros'
    elseif ($currency -in d,D){
        $currency = 'dólares'
    
    
    // if ($currency -notin d,D,e,E){
    else {
        echo "Por favor introduce 'e' para Euros o 'd' para Dólares";
    }
}

while ($currency -notin d,D,e,E) {
    read "¿cuántos $currency quieres cambiar?" $user_money
    read '¿Quieres cambiar Euros [e] o Dolares [d]' $currency
    if ($currency -notin d,D,e,E){
        echo "Por favor introduce 'e' para Euros o 'd' para Dólares";
    }
}


```

5. Obtener la siguiente imagen en un documento html (MULTIPLICACIONES)


| x   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| 1   | 1   | 2
| 2   | 2   | 4
| 3   |
| 4   |
| 5   |
| 6   |
| 7   |
| 8   |
| 8   |
| 9   |
| 10  | 10  | 20

```php
```
