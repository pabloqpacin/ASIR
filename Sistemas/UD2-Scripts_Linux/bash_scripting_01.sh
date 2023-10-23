#!/bin/bash

# 1.
echo "Hola mundo!"

# 2.
echo "Hola $@"

# 3.
if [ $1 ]; then
    echo "Hola $@"
fi

# 4.
if [ $1 ]; then
    argumentos=("")
    for arg in $@; do
        argumentos+=("$arg,")
    done
    echo "Hola${argumentos[@]}" | sed 's/,$/!/'
fi

# 5.
if [ $1 ]; then
    echo "Hola $@!"
else
    echo "AYUDA: Introduce argumentos así: './script.sh argumento1 argumento2'"
fi

# 6. Suma
echo "$1 + $2" | bc

# 7. Resta
echo "$1 - $2" | bc

# 8. Resta
echo "$1 * $2" | bc

# 9. Division
echo "$1 / $2" | bc
