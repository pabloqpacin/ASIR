<?php

$originalVariable = "Hello, World!";

// Create a reference to the original variable
$referenceVariable = &$originalVariable;

// Modify the reference, which also modifies the original variable
$referenceVariable = "Modified Hello!";

// Output the original variable
echo $originalVariable;
    // SERÁ "Modified Hello!", YA NO ES "Hello, World!"

?>