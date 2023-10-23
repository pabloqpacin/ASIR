#!/bin/bash

sumaTotal=0
numArgumentos=0

for arg in $@; do
    sumaTotal=$(expr $sumaTotal + $arg)
    # sumaTotal+=$arg
    echo "(La suma temporal es $sumaTotal)"
    numArgumentos=$(expr $numArgumentos + 1)
    # numArgumentos + 1
done

echo "La suma definitiva es: $sumaTotal"
echo "Tienes un total de $numArgumentos argumentos sumados"
echo "============="
echo $*
echo $#
echo $@