#!/bin/bash

if [ $1 -gt $2 ]; then
    echo "$1 es el número mayor y $2 es el menor"
elif [ $1 -lt $2 ]; then
    echo "$2 es el número mayor y $1 es el menor"
else
    echo "$1 y $2 son iguales!!"
fi
    