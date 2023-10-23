#!/bin/bash

echo "Existen $# parámetros"
echo "Ellos son: $@"
echo "El primero es: $1"
echo "Este script se llama: $0"

echo "Ejecutando 'pwd'" && pwd
echo "El comando 'pwd' devuelve $?" # código del último comando: 0==ok, 1==error, 2==??
echo "El ID de este script es $$" 
echo "El script lo ejecutó $USER"
echo "$HOSTNAME"
echo "$SECONDS"
echo "$RANDOM"
echo "$LINENO"

