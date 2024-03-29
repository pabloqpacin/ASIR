#!/bin/bash

# 1. Realizar un script llamado '01holamundo.sh ' que muestre por pantalla "Hola mundo!".
echo "1) Hola mundo!"

# 2. Ídem pero que en vez de "mundo" muestre los parámetros introducidos ('02holaparametros.sh ').
echo "2) Hola $@"

# 3. Ídem y que además verifique que al menos hayamos introducido un parámetro ('03holaalmenos1parametro.sh ').
if [ $1 ]; then
    echo "3) Hola $@"
fi

# 4. Ídem y que además separe cada argumento por ", " ('04holaparametrosseparados.sh ').
if [ $1 ]; then
    argumentos=("")
    for arg in $@; do
        argumentos+=("$arg,")
    done
    echo "4) Hola${argumentos[@]}" | sed 's/,$/!/'
fi

# 5. Ídem y que además en caso de error muestra una ayuda ('05holaconayuda.sh ').
if [ $1 ]
    then echo "5) Hola $@!"
    else echo "5) AYUDA: Introduce argumentos así: './script.sh argumento1 argumento2'"
fi

# 6. Realizar un script llamado 'suma' que realice la suma de 2 parámetros introducidos (tendrá que poder sumar números decimales, como 2.2 + 3).
if [[ $1 && $2 ]]; then
    result=$(echo "$1 + $2" | bc)
    echo "6) $result"
fi

# 7. Realizar un script llamado 'resta' que realice la resta de 2 parámetros introducidos (tendrá que poder sumar números decimales, como 2.2 3).
if [[ $1 && $2 ]]; then
    result=$(echo "$1 - $2" | bc)
    echo "7) $result"
fi

# 8. Realizar un script llamado 'multiplica' que multiplique los 2 parámetros introducidos (tendrá que poder multiplicar números decimales, como 2.2 * 3).
if [[ $1 && $2 ]]; then
    result=$(echo "$1 * $2" | bc)
    echo "8) $result"
fi

# 9. Realizar un script llamado 'division' que realice la división de 2 parámetros introducidos (tendrá que poder sumar números decimales, como 2.2 / 3).
if [[ $1 && $2 ]]; then
    result=$(echo "$1 / $2" | bc)
    echo "9) $result"
fi

