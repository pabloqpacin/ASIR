<?php

$num = 29;

$primo = true; // se inicializa a verdadero y si en ninguna iteración cambia a falso es que no se ha encontrado un número entre el que dividirse y por tanto $num será primo.

//el bucle comienza desde 2 y llega hasta el número anterior a $num
for ($i = 2; $i < $num; $i++) {
	if (($num % $i) == 0) {
 		 $primo = false;
	}
}

if ($primo){
    echo "$num es un número primo";
} else {
    echo "$num NO es un número primo";
}

?>