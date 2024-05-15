
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resimulacro</title>
    <link rel="stylesheet" type="text/css" href="resultados.css">
</head>
<body>
    
</body>
</html>


<?php
//validamos datos del servidor
$user = "root";
$pass = "";
$host = "localhost";

//conetamos al base datos
$connection = mysqli_connect($host, $user, $pass);

//hacemos llamado al imput de formulario
$nombre = $_POST["name"] ;
$correo = $_POST["mail"] ;
$asunto = $_POST["about"] ;
$mensaje = $_POST["text"] ;

//verificamos la conexion a base datos
if(!$connection) 
        {
            echo "No se ha podido conectar con el servidor" . mysql_error();
        }
  else
        {
            echo "<b><h3>Hemos conectado al servidor</h3></b>" ;
        }

        //indicamos el nombre de la base datos
        $datab = "simulacrofinal";
        //indicamos selecionar ala base datos
        $db = mysqli_select_db($connection,$datab);

        if (!$db)
        {
        echo "No se ha podido encontrar la Tabla";
        }
        
        //insertamos datos de registro al mysql xamp, indicando nombre de la tabla y sus atributos
        $instruccion_SQL = "INSERT INTO tabla (nombre, correo, asunto, mensaje)
                             VALUES ('$nombre','$correo','$asunto','$mensaje')";
                           
                            
        $resultado = mysqli_query($connection,$instruccion_SQL);

       
        $consulta = "SELECT * FROM tabla";
        
$result = mysqli_query($connection,$consulta);
if(!$result) 
{
    echo "No se ha podido realizar la consulta";
}

echo "<h1> PRESENTACION DE DATOS: </h1>";  

$i=1;
while ($colum = mysqli_fetch_array($result))
 {
    echo "<p>";
    echo "<h2> Informacion de la fila" . $i . "</h2>" . "\n";
    echo "Nombre: " . $colum['nombre']. "\n";
    echo "Mail: " . $colum['correo']. "\n";
    echo "Asunto: " . $colum['asunto'] . "\n";
    echo "Mensaje: " . $colum['mensaje'] . "\n";
    echo "</p>";
    $i = $i +1;
}


mysqli_close( $connection );

   //echo "Fuera " ;
   echo'<a href="formulario.html"> <img src="anterior.png"> </a>';


?>

