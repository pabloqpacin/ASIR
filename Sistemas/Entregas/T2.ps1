# @pabloqpacin 2024 -- ASO T2

##########################
# ENUNCIADOS Y FUNCIONES #
##########################

# 1. Se pide mostrar el siguiente mensaje:
    # 1. Obtener los nombres de archivos o carpetas de una ruta.
    # 2. Obtener información de forma recursiva de archivos o carpetas de la ruta del apartado anterior
function 1_se_pide(){
    Write-Host "
-- EJERCICIO 1 --
1. Obtener los nombres de archivos o carpetas de una ruta (RUTA ACTUAL).
2. Obtener información de forma recursiva de archivos o carpetas de la ruta del apartado anterior"

    switch (Read-Host "Elige acción [1/2]"){
        1 { Get-ChildItem }
        2 { tree }
    }
}

# 2. Ejercicio que cree un menú cuando se ejecute el script, sin bucle, y donde NO SE PUEDEN USAR ALIAS. El menú es el siguiente: ...
    # Gestionar la ruta como queráis, o se pide al usuario o se pone una fija dentro del scrip
function 2_menu(){
    Write-Host "
-- EJERCICIO 2 --
1. Crear carpeta
2. Crear archivo
3. Eliminar archivo
4. Eliminar carpeta
5. Renombrar archivo o carpeta
6. Muestra contenido carpeta
7. Copiar archivos o carpetas
8. Mover archivos o carpetas
9. Muestra contenido archivo"
    Read-Host "Indica opción del menú"
}

# 3. Crear un script con otro menú como el anterior, pero con las siguientes opciones: ...
    # No especifico ni nombres de usuario, ni grupo, etc.
function 3_menu(){
    Write-Host "
-- EJERCICIO 3 --
1. Obtener los usuarios y los grupos dentro de tu máquina
2. Obtener los miembros del grupo de tu usuario
3. Crea un usuario y un grupo locales
4. Deshabilitar un usuario
5. Añadir miembros a un grupo (el miembro debe existir)
7. Eliminar miembro de un grupo
6. Eliminar un usuario o grupo local
8. Redireccionar la info de los apartados 1 y 2 a un archivo llamado infousers.txt
"
    Switch (Read-Host "Indica opción del menú"){
        1 { Get-LocalUser; Get-LocalGroup | Format-Table }
        2 { Get-LocalGroupMember -Group "$env:USERNAME" }
        3 {
            New-LocalUser -Name 'NuevoUsuario' -Password (ConvertTo-SecureString "changeme" -AsPlainText -Force) -Description "Nuevo Usuario"
            New-LocalGroup -Name 'NuevoGrupo'
        }
        4 { Disable-LocalUser -Name 'NuevoUsuario' }
        5 { Add-LocalGroupMember -Group 'NuevoGrupo' -Member "$env:USERNAME", "NuevoUsuario" }
        7 { Remove-LocalGroupMember -Group 'NuevoGrupo' -Member "NuevoUsuario" -Confirm:$false }
        6 {
            Remove-LocalUser -Name 'NuevoUsuario' -Confirm:$false
            Remove-LocalGroup -Name 'NuevoGrupo' -Confirm:$false
        }
        8 {
            Get-LocalUser | Out-File -FilePath "infousers.txt"
            Get-LocalGroup | Out-File -FilePath "infousers.txt" -Append
            Get-LocalGroupMember -Group "$env:USERNAME" | Out-File -FilePath "infousers.txt" -Append
        }
    }
}

# 4. Tuberías en powershell:
    # a. Esta tubería ya la vimos en clase. ...
    # b. Obtener los nombres y los ID de los procesos del sistema, pero SOLO esos dos campos. El listado es grande pero finito: ... Esta captura es solo parte del listado
    # c. Obtener el listado de ordenes lanzadas en powershell, sacando solo el id y el CommandLine. Ejemplo: ... El listado es amplio en función de lo trabajado en powershell. Indica como se haría este script si quisiéramos sacar TODA LA INFO, no solo 2 campos
    # d. De la propia powershell, ¿ que hacen las siguientes tuberías?
        # $ (Get-Host).CurrentCulture | Format-List
        # $ Get-Service | Get-Member
function 4_tuberias(){
    Write-Host "
-- EJERCICIO 4 --
1. Mostrar direccionamiento IP en equipo
2. Mostrar ID y nombre de procesos del sistema
3. Mostrar histórico de comandos powershell
4. Responder a pregunta del enunciado
"
    Switch (Read-Host "Indica opción del menú"){
        1 { ipconfig /all | select-string 'IPv4' }
        2 { Get-Process | Select-Object -Property Id, ProcessName }
        3 { more (Get-PSReadlineOption).HistorySavePath }
        4 { Write-Host "Esas tuberías formatean y filtran la información del primer comando" }
    }
}

###########
# RUNTIME #
###########

Write-Host "
Ejercicio 1: listar archivos en ruta (actual)
Ejercicio 2: manipular archivos tal y como se pide en el enunciado
Ejercicio 3: mostrar información del sistema, admin. usuarios
Ejercicio 4: tuberías para mostrar información del sistema
"
Switch (Read-Host "Elige un ejercicio"){
    1{ 1_se_pide }
    2{ 2_menu }
    3{ 3_menu }
    4{ 4_tuberias }
}
