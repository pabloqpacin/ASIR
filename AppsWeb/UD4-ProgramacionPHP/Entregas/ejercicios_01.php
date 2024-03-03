<?php

require './index.php';

# Ejercicio 1: Muestra los números del 1 al 20 con bucles while y for
echo "Ej1 (for) -- ";
for ($i=1; $i<=20; $i++){
    // print $i . "<br>";
    // echo $i, "<br>";
    echo $i, ' ';
}
echo '<br>';

echo "Ej1 (while) -- ";
$i = 1;
while ($i <= 20){
    echo $i, ' ';
    $i++;    
}
echo '<br> <hr>';

// Ejercicio 2: Crear una tabla con las etiquetas de html donde haya dos columnas.
    // La primera, con palabras en español. La segunda, con sus traducciones en ingles.
echo "Ej2 -- <table border='1' width=\"200\">";
echo "<tr><td>", "<b>English</b>",  "</td><td>", "<b>Spanish</b>",  "</td></tr>";
echo "<tr><td>", "apple",           "</td><td>", "manzana",         "</td></tr>";
echo "<tr><td>", "banana",          "</td><td>", "plátano",         "</td></tr>";
echo "<tr><td>", "berries",         "</td><td>", "moras",           "</td></tr>";
echo "<tr><td>", "lemon",           "</td><td>", "limón",           "</td></tr>";
echo "<tr><td>", "orange",          "</td><td>", "naranja",         "</td></tr>";
echo "</table> <hr>";

// Ejercicio 3: Escribe un programa que utilice las variables $x y $y. Asignales los valores 100 y 200 respectivamente.
    // A continuación, muestra por pantalla el valor de cada variable, la suma, la resta, la multiplicación y la división.
    // Mostrar y hacer las operaciones, en la misma línea.
$x = 100;
$y = 200;
echo "Ej3 -- \$x = $x, \$y = $y", '<br>';
echo "Suma: &emsp; $x + $y = &emsp;", $x + $y, '<br>';
echo "Resta: &emsp; $x - $y = &emsp;", $x - $y, '<br>';
echo "Multi.: &emsp; $x * $y = &emsp;", $x * $y, '<br>';
echo "División: &emsp; $x / $y = &emsp;", $x / $y, '<br>';
echo '<hr>';

// // Ejercicio 4: Realiza un conversor de euros a dólares
echo "Ej4 -- <br>";
// define('EURO_TO_DOLLAR','1.0800');
// echo "Te damos la bienvenida a este conversor de divisa. <br>";
// (*)
echo '<hr>';


// Ejercicio 5: Obtener la siguiente imagen en un documento html
echo "Ej5 -- <br>";

$rows = 10;
$columns = 10;

echo '<table border="1" width="200">';

// Header row
echo '<tr>' , '<th>&times;</th>';
for ($col = 1; $col <= $columns; $col++) {
    echo '<th>' . $col . '</th>';
}
echo '</tr>';

// Table content
for ($row = 1; $row <= $rows; $row++) {
    echo '<tr>';
    echo '<td>' . $row . '</td>';   
    for ($col = 1; $col <= $columns; $col++) {
        echo '<td>' . ($row * $col) . '</td>';
    }
    echo '</tr>';
}

echo '</table>';
echo '<hr>';


// Ejercicio 6: Crear un select en html e incrustarle por medio de php los valores del 1 al 10 (**)
echo '
<form>
    <label for="numero">Selecciona un número:</label>
    <select name="numero" id="numero">';

for ($i = 1; $i <= 10; $i++) {
    echo '<option value="' . $i . '">' . $i . '</option>';
}

echo '
    </select>
    <input type="submit" value="Enviar">
</form>';
echo '<hr>';

// Ejercicio 7: El mismo ejercicio anterior, pero insertar los valores de la frase “ComoEstanUstedes”
echo '
<form>
    <label for="letra">Selecciona una letra:</label>
    <select name="letra" id="letra">';

$cadena = 'ComoEstanUstedes';
for ($i = 0; $i < strlen($cadena); $i++) {
        // echo $cadena[$i] . ' ';
        echo '<option value="' . $cadena[$i] . '">' . $cadena[$i] . '</option>';
    }

echo '
    </select>
    <input type="submit" value="Enviar">
</form>';
echo '<hr>';

?>