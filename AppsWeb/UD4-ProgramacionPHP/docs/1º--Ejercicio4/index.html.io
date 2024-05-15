<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Formulario</title>
	<link rel="stylesheet" href="boton.css">
	<link rel="stylesheet" href="estilos.css">
	
</head>
<body>
	<form action="registro.php" method="post>
		<p>*Nombre:</p>
		<input type="text" class="field" placeholder="name" required> <br/>

		<p>*Correo electrónico:</p>
		<input type="text" class="field" placeholder="mail" required> <br/>

		<p>*Asunto:</p>
		<input type="text" class="field" placeholder="about" required> <br/>

		<p>*Mensaje:</p>
		<textarea class="field" placeholder="text" required></textarea> <br/>

		<p class="center-content">
			<input type="submit" class="btn btn-blue" value="Enviar Datos">
		</p>
        <p>*Campos requeridos</p>
	</form>

</body>
</html>


