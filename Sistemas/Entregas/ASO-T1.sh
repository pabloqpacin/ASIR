#!/bin/bash

echo -e "\n------######################################################################------"
echo -e "##############~~~~~~~{     ASO-T1 v0.1.2 de @pabloqpacin    }~~~~~~~##############"
echo -e "------######################################################################------\n"


######### VARIABLES ##########

RESET='\e[0m'
BOLD='\e[1m'
RED='\e[31m'
CYAN='\e[36m'
GREEN='\e[32m'
YELLOW='\e[33m'


######### FUNCIONES ##########

# 1. Script que liste todos los archivos, incluidos los ocultos, del parámetro pasado al script como ruta
1_listar_dir_param() {
    if [ -d $1 ]
        then ls --color=tty -al $1
        else echo "Error: '$1' no es un directorio válido"
    fi
}

# 2. Script que muestre cuantos usuarios hay conectados y lo escriba en un archivo que será pasado al script como parámetro
2_guardar_usuarios_conectados_en_param() {
    if [[ ! $1 ]]; then echo "Proporciona parámetro \$1..." && return 1; fi
    if [[ -f $1 || ! -e $1 ]]
        then date >> $1 && who | tee -a $1 && echo -e "" >> $1
        else echo "Error: '$1' no es un archivo válido"
    fi
}

# 3. Script que muestre todos los archivos del directorio PASADO COMO PARAMETRO ordenados por tamaño (de mayor a menor) junto con el resto de características, es decir,
# permisos, tamaño, fechas de la última modificación, etc. El tamaño de cada fichero debe aparecer en un formato “legible”, o sea, expresado en Kb, Mb, etc. (Podeis probarlo con /etc como parametro)
3_archivos_ord_tamaño_en_param() {
    if [ -d $1 ]
        then ls --color=tty -alhSF $1
        else echo "Error: '$1' no es un directorio válido"
    fi
}

# 4. Script que escriba 10 primeras líneas del fichero pasado como parámetro (ejemplo: /etc/bash.bashrc) a otro fichero nuevo que será pasado al script como segundo parámetro.
4_copiar_10_param_a_param() {
    if [ ! $2 ]; then
        echo "Error: no se detecta archivo de destino \$2"
        return 1
    fi
    if [ -f "$1" ] && { [ ! -e "$2" ] || [ -f "$2" ]; }
        then head $1 >> $2
        else echo "Error: '$1' o '$2' no es un archivo válido"
    fi
}

# 5. Crear un archivo txt. Después, en un script mostrar primeramente las 3 primeras líneas de ese archivo pasado como parámetro, y posteriormente en el mismo script mostrar únicamente la última línea.
5_mostrar_3_1_param() {
    if [ -f $1 ]
        then cat -n $1 | head -n3 && cat -n $1 | tail -n1
        else echo "Error: '$1' no es un archivo válido"
    fi
}

# 6. Script que dado una ruta de un archivo txt como parámetro, guarde en el, la siguiente información: nombre del equipo, sistema operativo en uso, procesos en ejecución y las particiones del disco.
6_guardar_host_lsblk_pstree_en_param() {
    if [[ -f $1 || ! -e $1 ]]
        then date >> $1
             echo "Nombre del equipo: $(hostname)" >> $1
             echo "Sistema operativo: $(cat /etc/os-release | awk -F= '/^PRETTY_NAME=/{ print $2 }' | tr -d '"')" >> $1
             echo -e "Particiones del disco:\n$(lsblk)" >> $1
             echo -e "Procesos en ejecución:\n$(pstree)\n" >> $1
        else echo "Error: '$1' no es un archivo válido"
    fi
}

# 7. Script que guarde en un archivo pasado como primer parámetro, el almacenamiento disponible y utilizado en el sistema y que muestre filtradas las unidades con un % de uso superior al 30%.
7_almacenamiento_30_en_param() {
    if [[ -f $1 || ! -e $1 ]]
        then echo -e "Almacenamiento disponible:\n$(df -h | awk '$5 > 30')" | tee $1
        else echo "Error: '$1' no es un archivo válido"
    fi
}

# 8. Script que ordene el contenido de todos los archivos que se le pasen como parámetro (salvo el ultimo) y una su contenido en otro archivo (que es el ultimo parámetro pasado al script).
    # ORDENAR EL CONTENIDO? == líneas alfabéticamente ?

# 9. Script que dada una ruta como primer parámetro, busque todos los tipos de fichero con permisos 0774 que sean pertenecientes a un usuario dado como segundo parámetro y los muestre por pantalla.
9_listar_archivos_perm_user(){
    if [ ! $2 ]; then
        echo "Error: no has introducido parámetro \$2" && return 1
    elif ! grep -q $2 /etc/passwd; then
        echo "Error: '$2' no es un usuario válido" && return 1
    fi
    if [ -d $1 ]; then
        find $1 -type f -perm 0774 -user $2
    else
        echo "Error: '$1' no es un directorio válido"
    fi
}

# 10. Realizar un script que realice las siguientes tareas:
    # a. Crea dos usuarios con los nombres usu1 y usu2; y comprueba que sus directorios de trabajo se han creado
    # b. Crea el grupo suspensos y añade a los usuarios del punto anterior. Comprueba que los usuarios creados pertenecen al citado grupo.
    # c. Crea el archivo file1 en tu directorio de trabajo (sin extensión) y haz que los usuarios del grupo suspensos tengan los siguientes permisos sobre el:
        # i. Otros: lectura y ejecución on; escritura off
        # ii. Grupo: lectura on, escritura y ejecucion: off
        # iii. Usuario: todo on
10_crear_usuarios_grupo() {
    local group_name='suspensos'
    local user_names=('usu1' 'usu2')

    if ! grep -q $group_name /etc/group; then
        echo "Creando grupo '$group_name' -- se requieren permisos sudo/root"
        # sudo groupadd $group_name
    fi

    for user in "${user_names[@]}"; do
        if ! grep -q $user /etc/passwd; then
            echo "Creando usuario '$user' -- se requieren permisos sudo/root"
            # sudo useradd -mg users -G suspensos $user
        fi
    
        if [ ! -d /home/$user ]; then
            echo "Error: el directorio '/home/$user' no existe..." && return 1
        elif ! getent group $group_name | grep -q $user; then
            echo "Error: el usuario '$user' no pertenece al grupo '$group_name'..." && return 1
        fi
    done

    if [ ! -f $HOME/file1 ]; then
        touch $HOME/file1 &&
            chmod u=rwx,g=r,o=rx $HOME/file1 || chmod 744 $HOME/file1
    fi
}
    
# 11. En un script, obtener un listado de los usuarios del sistema, numerados, como se observa en la imagen: ...
11_numerar_usuarios_sistema() {
    IFS=$'\n' # Set Internal Field Separator to newline to iterate over lines
    count=1

    for line in $(cat /etc/passwd); do
        echo "$count $(echo "$line" | awk -F':' '{print $1}')"
        ((count++))
    done
}

# 12. Script que automatice la búsqueda de archivos de tipo fichero, con mas de 2kb y permisos 0246; tanto de todo el sistema como de una ruta pasada como parámetro.
12_buscar_ficheros_en_sis_o_param() {
    read -p "Realizar búsqueda en todo el sistema [A] o en \$1 '$1' [B]? " opt

    case $opt in
        [aA])
            find / -type f -size +2k -perm 0246 ;;
        [bB]) 
            if [ -d "$1" ]; then
                find "$1" -type f -size +2k -perm 0246
            else
                echo "Error: '$1' no es un directorio válido" >&2
                return 1
            fi ;;
        *) echo "Opción no válida" >&2 ;;
    esac
}

# 13. Crear un script (llamarlo script_copy.sh) que copie un fichero regular en otro, ambos pasados como argumentos. Si no se le pasan los argumentos, lo comprobará, y solicitará al usuario que los introduzca interactivamente
13_copiar_param_en_param_o_pedir() {
    if [ ! $1 ]; then
        read -p "Introduce el nombre/ruta del archivo que quieres copiar: " param1
    else param1=$1; fi

    if [ ! $2 ]; then
        read -p "Introduce el nombre/ruta para la copia: " param2
    else param2=$2; fi

    if [ -f $param1 ] && [ ! -d $param2 ]; then
        echo "Copiando '$param1' como '$param2'"
        cp $param1 $param2
    fi
}

# 14. Crear un script que borre con confirmación todos los ficheros pasados como argumentos. (llamarlo script_borrar.sh).
14_borrar_todos_params_preguntar() {
    for param in $@; do
        read -p "Eliminar '$param'? [Y/n] " opt
        case $opt in 'Y'|'y'|'') rm $param ;; esac
    done
}

# 15. Crear un script que para cada argumento que reciba (puede recibir una lista de argumentos) realice una de las siguientes operaciones:
    # a. Si es un directorio, ha de listar los ficheros que contiene.
    # b. Si es un fichero regular, tiene que imprimir su contenido por pantalla.
    # c. En otro caso, debe indicar que no es ni un fichero regular ni un directorio (por ejemplo, un fichero de bloques o de caracteres del directorio /dev).
15_listar_o_imprimir_segun_param() {
    for param in $@; do
        if [ -d $param ]; then
            ls -al $param
        elif [ -f $param ]; then
            cat $param
        else
            echo "El archivo/parámetro no es un directorio ni archivo. Next."
        fi
    done
}

# 16. Crea un script (script_user.sh) que reciba como argumento el identificador de un usuario e imprima por pantalla la siguiente información:
# identificador, nombre completo del usuario, directorio home, shell que utiliza, número de sesiones actualmente abiertas y procesos pertenecientes a dicho usuario.
# El script debe permitir las siguientes opciones:
    # a. -p: sólo muestra la información de los procesos.
    # b. -u: muestra toda la información excepto la referente a los procesos.
16_info_user_param() {

    if ! grep -q $1 /etc/passwd; then
        echo "Error: \$1 '$1' no es un usuario válido"
        return 1
    fi

    u_informacion_general() {
        echo "- Identificador (UID): $(grep $1 /etc/passwd | awk -F ':' '{print $3}')"
        echo "- Nombre completo usuario: $(grep $1 /etc/passwd | awk -F ':' '{print $5}')"
        echo "- Directorio home: $(grep $1 /etc/passwd | awk -F ':' '{print $6}')"
        echo "- Shell que utiliza: $(grep $1 /etc/passwd | awk -F ':' '{print $7}')"
        echo "- Número de sesiones actualmente abiertas: $(echo foo)"
    }

    p_informacion_procesos() {
        echo "- Procesos pertenecientes al usuario: $(ps --user $USER | wc -l)"
        sleep 2 && ps --user $(id -u) | less
    }

    read -p "Selecciona una opción: solo info procesos [-p], todo menos procesos [-u], todo [ ]: " opt
    case $opt in
        '-p') p_informacion_procesos $1 ;;
        '-u') u_informacion_general $1 ;;
           *) u_informacion_general $1 && p_informacion_procesos $1 ;;
    esac
}

######### EJECUCION ##########

# if [ -z $1 ]; then
#     # echo -e "\n== Ejecutar script como 'bash script.sh <parametro>' para el éxito de las funciones =="
#     echo -e "Error: no se detecta \$1, terminando script. Pasa un argumento bro."
#     exit 0
# fi

echo -e "${YELLOW}===${RESET} Directorio actual (${YELLOW}${BOLD}pwd${RESET}): '${RED}$PWD${RESET}' ${YELLOW}==${RESET}"
echo -e "${YELLOW}==${RESET} Parámetro ${YELLOW}${BOLD}\$1${RESET} introducido: '${RED}$1${RESET}' ${YELLOW}==${RESET}"
echo -e "${YELLOW}==${RESET} Parámetro ${YELLOW}${BOLD}\$2${RESET} introducido: '${RED}$2${RESET}' ${YELLOW}==${RESET}"
# array and for ... in case many params


while true; do
    echo -e "\nElige operación:"
    echo -e "- *  Salir"
    echo -e "- 1. Listar archivos en directorio \$1"
    echo -e "- 2. Guardar usuarios conectados en archivo \$1"
    echo -e "- 3. Ordenar por tamaño archivos en directorio \$1"
    echo -e "- 4. Copiar 10 primeras líneas del archivo \$1 al archivo \$2"
    echo -e "- 5. Mostrar 3 primeras y última línea del archivo \$1"
    echo -e "- 6. Guardar nombre del equipo, sistema operativo, particiones y procesos activos en \$1"
    echo -e "- 7. Guardar almacenamiento disponible en unidades con +30% de uso en archivo \$1"
    echo -e "- 8. TODO"
    echo -e "- 9. Listar archivos con permisos 0774 del usuario \$2 en el directorio \$1"
    echo -e "- 10. Crear usuarios y grupos"
    echo -e "- 11. Listar usuarios del sistema numerados"
    echo -e "- 12. Buscar archivos con más de 2kb y permisos 0246 en todo el sistema o en \$1"
    echo -e "- 13. Copiar \$1 en \$2 o pedir nombres/rutas interactivamente"
    echo -e "- 14. Borrar todos los archivos/parámetros \$1 \$2... (se pide confirmación)"
    echo -e "- 15. Según parámetros \$1 \$2... imprimir contenidos archivo o directorio"
    echo -e "- 16. Recabar información sobre el usuario \$1"
    
    read opt

    case $opt in
        1) 1_listar_dir_param $1 ;;
        2) 2_guardar_usuarios_conectados_en_param $1 ;;
        3) 3_archivos_ord_tamaño_en_param $1 ;;
        4) 4_copiar_10_param_a_param $1 $2 ;;
        5) 5_mostrar_3_1_param $1 $2 ;;
        6) 6_guardar_host_lsblk_pstree_en_param $1 ;;
        7) 7_almacenamiento_30_en_param $1 ;;
        8) echo "TODO" ;;
        9) 9_listar_archivos_perm_user $1 $2 ;;
        10) 10_crear_usuarios_grupo ;;
        11) 11_numerar_usuarios_sistema ;;
        12) 12_buscar_ficheros_en_sis_o_param $1 ;;
        13) 13_copiar_param_en_param_o_pedir $1 $2 ;;
        14) 14_borrar_todos_params_preguntar $@ ;;
        15) 15_listar_o_imprimir_segun_param $@ ;;
        16) 16_info_user_param $1 ;;

        "*") exit 0 ;;
    esac

done

