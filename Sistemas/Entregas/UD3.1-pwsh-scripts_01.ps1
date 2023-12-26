###### Primeros ejercicios powershell (22/12/2024)

############### ENUNCIADOS/FUNCIONES


# 1. Realizar un script que pide un número al usuario y muestre su tabla de multiplicar.

function 1_tabla_multiplicar_input {

    $UserInput = Read-Host "Introduce un número entero"

    if ($UserInput -match '^\d+$') {
        $number = [int]$UserInput

        Write-Host "Tabla de multiplicar de '$number'"
        1..10 | ForEach-Object {
            $result = $number * $_
            Write-Host "$number x $_ = $result"
        }
    } else {
        Write-Host "ERROR: introduce un número válido"
    }

}


# 2. Realizar un script que escoja un numero aleatorio entre 1 y 20, pregunte al usuario y le diga si es más pequeño o más grande.

function 2_adivinar_numero_maquina {
    Write-Host "Implementado directamente en la tercera función"
}


# 3. Realizar un script que escoja un numero aleatorio entre 1 y 20, pregunte al usuario y le diga si es más pequeño o más grande,
# que continúe hasta que acierte. Haz que muestre el número de intentos hasta que lo acierta cuando finalice.

function 3_adivinar_numero_maquina {

    $RandomNumber = Get-Random -Minimum 1 -Maximum 20
    # Write-Host $RandomNumber

    while ($UserInput -ne $RandomNumber) {
        $UserInput = Read-Host "Adivina mi número secreto"
        
        if ($UserInput -match '^\d+$') {
            
            $NumIntentos++
            
            $UserNumber = [int]$UserInput
            
            if ($UserNumber -gt $RandomNumber) {
                Write-Host "Muy alto"
            } elseif ($UserNumber -lt $RandomNumber) {
                Write-Host "Muy bajo"
            } else {
                Write-Host "`n¡Enhorabuena! Has adivinado mi número secreto '$RandomNumber'"
            }

        } else {
            Write-Host "ERROR: introduce un número válido"
        }
    }

    Write-Host "Número de intentos: $NumIntentos"
}


# 4. Realizar un script que muestre 5 números aleatorios del 1 al 10 seguidos de el mismo número de asteriscos:
#     ./ejer4.sh
#     1 *
#     3 **
#     1 *
#     6 ******
#     2 **

function 4_imprimir_random_astericos {
    
    for ($i=1; $i -le 5; $i++) {

        $RandomNumber = Get-Random -Minimum 1 -Maximum 10
        $Asteriscos = ''
        
        1..$RandomNumber | ForEach-Object {
            $Asteriscos += '*'
        }

        Write-Host "$RandomNumber $Asteriscos"
    }
}


# 5. Escribir un script que muestre los grupos y los usuarios del sistema, dependiendo del parámetro de entrada -u o -g:
#   - Con -u : todos los usuarios
#   - Con -g : los grupos seguido de los usuarios del grupo

function 5_usuarios_grupos {

    param (
        [string]$flag
    )

    switch ($flag) {
        '-u' {
            Write-Host "Listado de todos los usuarios:"
            Get-LocalUser | Select-Object Name
        }
        '-g' {
            Write-Host "Listado de grupos y sus usuarios:"
            Get-LocalGroup | ForEach-Object {
                $group = $_
                Write-Host "Grupo: $($group.Name)"
                Get-LocalGroupMember -Group $group.Name | ForEach-Object {
                    Write-Host "  Usuario: $($_.Name)"
                }
                Write-Host "------------------------"
            }
        }
        default {
            Write-Host "Parámetro no reconocido. Uso: -u para usuarios, -g para grupos"
        }
    }
}


# 6. Escribir un script para obtener la información acerca del equipo en uso (pista: usar systemInfo).El formato de salida debe ser algo asi:
#   - Nombre del equipo:
#   - Fabricante:
#   - Modelo:
#   - Memoria instalada:

function 6_systeminfo {
    $systeminfo = systeminfo
    $systeminfo | select-string "Nombre de host"
    $systeminfo | select-string "Fabricante"
    $systeminfo | select-string "Modelo"
    $systeminfo | select-string "Memoria"
}


# 7. Crear un script que automatice la copia de seguridad de archivos,
# copiando todo lo de una ruta de origen a una ruta destino.

function 7_copiar_ruta {
    
    $RutaOrigen = Read-Host "Introduce la ruta de origen para la copia de seguridad"
    $RutaDestino = Read-Host "Introduce la ruta de destino para la copia de seguridad"

    if (Test-Path $RutaOrigen -PathType Container) {
        Write-Host "La ruta de origen existe."

        if (Test-Path $RutaDestino -PathType Container) {
            Write-Host "La ruta de destino existe."

            Copy-Item -Path $RutaOrigen -Destination $RutaDestino -Recurse -Verbose

            if ($?) {
                Write-Host "Copia de seguridad completada exitosamente."
            } else {
                Write-Host "Hubo un error durante la copia de seguridad."
            }
        } else {
            Write-Host "La ruta de destino no es válida."
        }
    } else {
        Write-Host "La ruta de origen no existe."
    }
}


############### RUNTIME

while ($true) {

    Write-Host "`nOperaciones disponibles:
    - q     --> Salir
    - 1     --> Tabla de multiplicar de un número dado
    - 2     --> ...
    - 3     --> Adivina el número secreto de la máquina
    - 4     --> Imprimir números aleatorios + asteriscos correspondientes
    - 5 -u  --> Mostar usuarios del sistema
    - 5 -g  --> Mostrar grupos del sistema y usuarios correspondientes
    - 6.    --> Información del sistema (nombre equipo, fabricante, modelo, memoria...)
    - 7.    --> Copiar ruta de origen en ruta de destino"

    $userInput = Read-Host "`nIntroduce la opción correspondiente a la operación deseada (q, 3, 5 -g, ...)"
    Write-Host ""

    switch ($userInput) {
        "q" { return }
        "1" { 1_tabla_multiplicar_input }
        "2" { 2_adivinar_numero_maquina }
        "3" { 3_adivinar_numero_maquina }
        "4" { 4_imprimir_random_astericos }
        '5 -u' { 5_usuarios_grupos -flag '-u' }
        '5 -g' { 5_usuarios_grupos -flag '-g' }
        "6" { 6_systeminfo }
        "7" { 7_copiar_ruta }
        default { Write-Host "Opción no reconocida. Vuelve a intentarlo." }
    }

}


