#!/bin/bash

echo -e "Elige movidita:\n1 - operación\n2 - who"
read -p "--> " movidita

operacion() {
     if [ -n "$1" ] && [ -n "$2" ]; then
          echo -e "\nEste script opera matemáticamente con dos argumentos: $1 y $2"
          echo -e "OPCIONES:\n1. Sumar $1 y $2\n2. Restar $1 y $2\n3. Multiplicar $1 y $2\n4. Dividir $1 y $2"
          read -p "Enter option: " opt
          case $opt in
          '1') echo $(("$1 + $2")) ;;
          '2') echo $(("$1 - $2")) ;;
          '3') echo $(("$1 * $2")) ;;
          '4') echo $(("$1 / $2")) ;;
          esac
     else
          echo -e "\nPor favor introduce dos número enteros (e.g. 3 7) como argumento"
     fi
}

who() {
     if [ ! $1 ]; then
          echo -e "\nPor favor introduce un nombre de usuario (e.g. $USER) como argumento"
     elif who | grep -q $1; then
          echo "'$1' está conectado según 'who'"
     else echo "'$1' no está conectado según 'who'"
     fi
}

case $movidita in
     1) operacion $1 $2 ;;
     2) who $1 ;;
     *) echo 'oops' ;;
esac



# #######x#######
# function operacion {
#     $(($num1 $signo $num2))
# }

# echo -e "\n#######################################################################"
# echo -e "\n== Con este script puedes operar con dos números. =="
# echo -e "== Las operaciones pueden ser: sumar, restar, multiplicar y dividir. ==\n"
# read -p "Introduce dos números separados por un espacio: " num1 num2
# # echo $num1
# # echo $num2

# read -p "Introduce el signo de la operación (+ - * /): " signo


# case $signo in
#     '+') resultado=$num1 + $num2 ;;
#     '-') resultado=$num1 - $num2 ;;
#     '*') resultado=$num1 * $num2 ;;
#     '/') resultado=$num1 / $num2 ;;

# echo "El resultado de la operación es: $resultado"

# ./foo.sh 1 2
