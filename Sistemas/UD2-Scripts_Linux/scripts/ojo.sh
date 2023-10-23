#!/bin/bash

##
 # - Apuntes Bash -- REFERENCIA DOCUMENTO ORIGINAL??
##

var="hola"
if [ $var = h* ]; then echo sí; else echo no; fi # => no
if [[ $var = h* ]]; then echo sí; else echo no; fi # => sí
if [[ $var = “h*” ]]; then echo sí; else echo no; fi # => no (ajuste exacto)