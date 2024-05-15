# Simulacro ASO

- [Simulacro ASO](#simulacro-aso)
  - [TEST](#test)
  - [DESARROLLO](#desarrollo)
    - [DESARROLLO 1](#desarrollo-1)
      - [a) Bash](#a-bash)
      - [b) Powershell](#b-powershell)
      - [c) LDAP](#c-ldap)
    - [DESARROLLO 2](#desarrollo-2)
      - [a) Bash](#a-bash-1)
      - [b) Powershell (Windows Server con Dominio promocionado)](#b-powershell-windows-server-con-dominio-promocionado)
      - [c) LDAP](#c-ldap-1)
    - [DESARROLLO 3](#desarrollo-3)
      - [a) Bash](#a-bash-2)
      - [b) Powershell](#b-powershell-1)
      - [c) LDAP](#c-ldap-2)


## TEST

<!-- 1a
2b
3a (`$0`)
4d (!!)
5a (!!)
6d
7??????
8a
9d
10a
11b
12a
13d
14d
15a -->


1. ¿Cómo se ejecuta un script en Linux?:
    - [x] ./mi-primer-script.sh
    - [ ] .mi-primer-script.sh
    - [ ] .mi-primer-script
    - [ ] Ninguna de las anteriores

2. Podemos emular AD DS en software libre con:
    - [ ] Active directory.
    - [x] LDAP.
    - [ ] Shell scripts.
    - [ ] Cualquiera de las anteriores

3. El nombre del script en bash se referencia como:
    - [x] $0
    - [ ] #0
    - [ ] &1
    - [ ] @1

4. En bash, escribir $@ es muy muy parecido a poner:
    - [ ] $.
    - [ ] $name
    - [ ] $# <!--num de parámetros: https://askubuntu.com/questions/939620/what-does-mean-in-bash -->
    - [x] $*

5. La diferencia entre $* y $@ es:
    - [x] __$* es devuelto como un solo valor y $@ es un conjunto de valores__
    - [ ] $@ es devuelto como un solo valor y $* es un conjunto de valores
    - [ ] $@ indica el número de parámetros y $* indica el ultimo de los parámetros
    - [ ] Ninguna de las anteriores

6. Las ordenes o comandos preestablecidos en powershell se denominan:
    - [ ] Todas las siguentes
    - [ ] PS’s
    - [ ] ISE
    - [x] Cmdlet

7. Las variables en bash scripting van precedidas de:
    - [x] $
    - [ ] &
    - [ ] var
    - [ ] @

8. La siguiente expresión en powershell devuelve: (1 -gt 2) -or (2 -lt 2)
    - [x] False
    - [ ] True
    - [ ] Equal
    - [ ] Ninguna de las anteriores.

9. La siguiente concatenación de instrucciones en PS daría como salida:
    - [ ] Es el uno<br>El 2 es impar
    - [ ] Es el dos<br>El dos es par
    - [ ] Es el tres.
    - [x] NO es uno de los 3 primeros números naturales.

```ps1
$valor = 0
switch ($valor) {
    1 {write-host “Es el uno”}
    2 {write-host “Es el dos”}
    3 {write-host “Es el tres”}
    1 {write-host “El 2 es impar”}
    2 {write-host “El 2 es par”}
    default (write-host “NO es uno de los 3 primeros números naturales”)
}
```

10. Sabiendo que el cmdlet Test-Connection realiza peticiones icmp a ciertas ip’s (ping), indicar la funcionalidad del siguiente codigo:
    - [x] Hace un recorrido por el rango de ip’s que el usuario introduzca y nos indica el equipo que responde con la frase “x.x.x.x está Conectado” o “x.x.x.x NO está Conectado”, donde las x son la ip correspondiente.
    - [ ] Hace un recorrido por el rango de ip’s de la 0 a la 255 y nos indica el equipo que responde con la frase “x.x.x.x está Conectado” o “x.x.x.x NO está Conectado”, donde las x son la ip correspondiente.
    - [ ] Hace un recorrido por el rango de ip’s que el usuario introduzca y nos indica el equipo que responde con la frase “x.x.x.x responde” o “x.x.x.x NO responde”, donde las x son la ip correspondiente
    - [ ] Ninguna de las anteriores.

```ps1
[int]$inicial = Read-Host "Dime el numeró inicial de la IP dento de la red 172.30.0.1"
[int]$final = Read-Host "Dime el numeró final de la IP dento de la red 172.30.0.1"
for ($i = $inicial; $i -lt $final+1; $i++) {
    $respuesta = Test-Connection 172.30.3.$i -Count 1 -Quiet
    if ($respuesta) {
        Write-Host "172.30.3.$i está Conectado"
    } else {
        Write-Host "172.30.3.$i NO está Conectado"
    }
}
```

11. Esta info es devuelta por:
    - [ ] No existen en poweshell
    - [x] Get-AdDomain
    - [ ] Nos devuelven los mismos campos
    - [ ] Son comandos de AD DS, no de powershell

```txt
AllowedDNSSuffixes              : {}
ChildDomains                    : {}
COmputersContainer              : CN=Computers,DC=User04,DC=com
DeletedObjectsContainer         : CN=Deleted Objects,DC=User04,DC=com
DistinguishedName               : DC=User04,DC=com
DNSRoot                         : User04.com
```

12. El siguiente codigo en PS:
    - [x] Crea 5 copias con diferentes nombres
    - [ ] Crea 5 copias con el mismo nombre
    - [ ] Crea 4 copias con diferentes nombres
    - [ ] Crea 4 copias con el mismo nombre

```ps1
for ($i=1; $i -le 5; $i++){
    Copy-Item -Path D:\UNPA\SO\Scripts\bkp\archivo.txt -Destination D:\UNPA\SO\Scripts\bkp\archivo-bkp$i.txt
}
```

13. LDAP sigue el modelo:
    - [ ] Grupos de trabajo.
    - [ ] P2P.
    - [ ] Vista Controlador.
    - [x] Cliente/Servidor.

14. La configuración en Ubuntu (y algunos Debian) de ldap, reside actualmente en editar el archivo:
    - [ ] /etc/ldap.conf
    - [ ] /etc/slapd.conf
    - [x] **/etc/ldap/slapd.d/** <!--https://github.com/pabloqpacin/ASIR/blob/main/Sistemas/UD5-OpenLDAP/APUNTES.md#b-configuraci%C3%B3n-del-servicio-de-directorio-->
    - [ ] Ninguna de las anteriores

15) Para conseguir la integración de un AD DS en Windows Server con clientes Ubuntu, se utiliza:
    - [x] **SSSD**
    - [ ] SSD
    - [ ] Secure Tunneling
    - [ ] realm discover.

---

## DESARROLLO

<!-- DESARROLLO
- 1 poquito bash
- 1 poquito powershell (MENÚS)
- 1 poquito ldap (APACHE DIRECTORY STUDIO) -- REVISAR CLASE -->

<!-- > OPCIÓN 1. NECESIDAD DE ADJUNTAR ARCHIVOS
1. Descargue el siguiente archivo haciendo click aquí: preguntas abiertas examen final convocatoria ordinaria.
2. Una vez descargado, elija 2/3 de las preguntas propuestas y realícelas, completando el documento con su nombre y apellidos según se indica.
3. Cuando termine las preguntas guarde el archivo en formato PDF y cambie el título del mismo, indicando su nombre y apellidos, de la siguiente manera: "Nombre_Apellidos_ Módulo X_ExamenOrdinaria". Solo se aceptarán los exámenes en formato en PDF.
4. En el caso que tengas que subir otros documentos adjuntos, SERA en formato zip o rar con el pdf y alguna imagen o similar que no hayáis incluido en el pdf pero que en este quede explicado por qué están las imágenes fuera del pdf.
5. Suba el archivo a esta actividad. -->

### DESARROLLO 1

<!-- 1.a.i: la primera
1.a.ii.a: la cuarta
1.a.ii.b: la segunda
1.c.i: hablar de dit, entries y objetoClass -->

#### a) Bash

1. Respecto a la ejecución del script que se muestra a continuación, indique cuál de las siguientes afirmaciones es correcta: (0,5 puntos)
   - [x] Es un Shell script que borra el archivo pasado como argumento, se comprueba que el archivo existe y que al menos se ha escrito un argumento
   - [ ] Es un Shell script que borra el archivo pasado como argumento, no se comprueba si el archivo existe, pero si que se haya escrito un argumento al menos
   - [ ] Es un Shell script que borra el archivo pasado como argumento, se comprueba que el archivo existe, pero no se comprueba nada sobre los argumentos
   - [ ] Ninguna de las anteriores

```bash
#!/bin/bash
if [ $# -eq 2 ]; then
    echo "Uso: sh borrar.sh archivo"
fi
if [ -f $1]; then
    rm $1
fi
```

2. Responde a las dos preguntas siguientes teniendo en cuenta el siguiente script:
    1. Indica que permite la línea 2 del script (0,5 puntos)
        - [ ] Recoge los 3 primeros parametros del script
        - [ ] Almacena en la variable arg el numero de argumentos del script
        - [ ] Visualiza por pantalla el contenido de la variable CADENA
        - [x] Se prepara para recorrer los N argumentos pasados al script
    2. Indica que salida por pantalla produciría el script (0,5 puntos)
        - [ ] Para cada uno de los argumentos del script, comprueba si existe y si es un fichero o directorio. Si es un fichero, indica su tamaño; si es un directorio, nos indica su tipo
        - [x] Para cada uno de los argumentos del script, comprueba si existe y si es un fichero o directorio. Si es un fichero, indica su tipo; si es un directorio, nos indica su tamaño
        - [ ] Para cada uno de los argumentos del script, no comprueba si existe y si fueran un fichero o directorio. Si es un fichero, indica su tipo; si es un directorio, nos indica su tamaño
        - [ ] Ninguna de las respuestas anteriores es correcta

```bash
#!/bin/bash
for arg in $*; do
    if test ! -e $arg; then
        echo "$arg no existe"
    else
        if test -f $arg; then
            tipo=`file $arg`
            echo "$arg es un fichero de tipo $tipo"
        fi
        if test -d $arg; then
            tam=`du sh $arg`
            echo "$arg es un directorio de tamaño $tam"
        fi
    fi
done
```

#### b) Powershell

1. Escribir un script que obtenga de las propiedades de vuestro equipo, el nombre y la versión mediante una pipe (0,5 puntos)

```ps1
systeminfo | select-string 'Nombre de host' && `
systeminfo | select-string 'Versión del sistema operativo'

# hostname
# Get-WmiObject -Class Win32_OperatingSystem | Select-Object -Property Name, Version

# [System.Environment]::OSVersion.VersionString
# [System.Environment]::OSVersion.VersionString

# (Get-WmiObject Win32_OperatingSystem).Caption
# (Get-WmiObject Win32_OperatingSystem).Version
```
<!-- ```log
 pabloqpacin@Win11ProES ~  systeminfo

Nombre de host:                            WIN11PROES
Nombre del sistema operativo:              Microsoft Windows 11 Pro
Versión del sistema operativo:             10.0.22631 N/D Compilación 22631
Fabricante del sistema operativo:          Microsoft Corporation
Configuración del sistema operativo:       Estación de trabajo miembro
Tipo de compilación del sistema operativo: Multiprocessor Free
Propiedad de:                              pabloqpacin
Organización registrada:
Id. del producto:                          00330-80000-00000-AA245
Fecha de instalación original:             17/10/2023, 19:45:53
Tiempo de arranque del sistema:            12/05/2024, 22:52:32
Fabricante del sistema:                    innotek GmbH
Modelo el sistema:                         VirtualBox
Tipo de sistema:                           x64-based PC
Procesador(es):                            1 Procesadores instalados.
                                           [01]: Intel64 Family 6 Model 141 Stepping 1 GenuineIntel ~2219 Mhz
Versión del BIOS:                          innotek GmbH VirtualBox, 01/12/2006
Directorio de Windows:                     C:\Windows
Directorio de sistema:                     C:\Windows\system32
Dispositivo de arranque:                   \Device\HarddiskVolume1
Configuración regional del sistema:        es;Español (internacional)
Idioma de entrada:                         es;Español (tradicional)
Zona horaria:                              (UTC+01:00) Bruselas, Copenhague, Madrid, París
Cantidad total de memoria física:          8.176 MB
Memoria física disponible:                 5.436 MB
Memoria virtual: tamaño máximo:            10.096 MB
Memoria virtual: disponible:               7.620 MB
Memoria virtual: en uso:                   2.476 MB
Ubicación(es) de archivo de paginación:    C:\pagefile.sys
Dominio:                                   asix.local
Servidor de inicio de sesión:              \\WIN11PROES
Revisión(es):                              7 revisión(es) instaladas.
                                           [01]: KB5036620
                                           [02]: KB5027397
                                           [03]: KB5030323
                                           [04]: KB5031274
                                           [05]: KB5036893
                                           [06]: KB5035967
                                           [07]: KB5037020
Tarjeta(s) de red:                         2 Tarjetas de interfaz de red instaladas.
                                           [01]: Intel(R) PRO/1000 MT Desktop Adapter
                                                 Nombre de conexión: Ethernet
                                                 DHCP habilitado:    Sí
                                                 Servidor DHCP:      192.168.1.1
                                                 Direcciones IP
                                                 [01]: 192.168.1.44
                                                 [02]: fe80::da48:eba6:e8b9:a5ea
                                           [02]: Microsoft KM-TEST Loopback Adapter
                                                 Nombre de conexión: Npcap Loopback Adapter
                                                 DHCP habilitado:    Sí
                                                 Servidor DHCP:      255.255.255.255
                                                 Direcciones IP
                                                 [01]: 169.254.216.98
                                                 [02]: fe80::d3f7:63a:8252:5d3b
Requisitos Hyper-V:                        Se detectó un hipervisor. No se mostrarán las características necesarias para Hyper-V.
``` -->

2. Escribir un script con un menú con las siguientes opciones, y lógicamente que se realicen dichas acciones/opciones: (0,75 puntos)
   1. Crear carpeta llamada foldersimu
   2. Crear archivo llamado filesimu
   3. Renombrar archivo filesimu por filesimu2
   4. Eliminar carpeta foldersimu
   5. Eliminar archivo filesimu2

```ps1
Write-Host "
== Elige una de las siguientes acciones:
1. Crear carpeta llamada foldersimu
2. Crear archivo llamado filesimu
3. Renombrar archivo filesimu por filesimu2
4. Eliminar carpeta foldersimu
5. Eliminar archivo filesimu2
"
$eleccion = Read-Host
switch ($eleccion) {
    1 { New-Item -ItemType Directory -Path 'foldersimu' }
    2 { New-Item -ItemType File -Path 'filesimu' }
    3 { Move-Item 'filesimu' 'filesimu2' }
    4 { Remove-Item 'foldersimu' }
    5 { Remove-Item 'filesimu2' }
    default { Write-Host "Opción no reconocida. Vuelve a intentarlo" }
}
```

#### c) LDAP

> - https://www.youtube.com/watch?v=Rl032gHFu88
> - https://drive.google.com/file/d/1U304eowo58GIfcKs7hUSkJqCqA10qf7q/view (slapd en ubuntu)

1. Explica los elementos del DIT de LDAP (0,25 puntos)

foo

2. Crea en Linux Server con su servicio de LDAP instalado, dos unidades organizativas, Usuarios y Grupos; dentro de Usuarios crear uno con vuestro nombre (account) y dentro de la uo Grupos, crear un PosixGroup llamado 2asir. Introducir el usuario dentro del grupo dentro del proceso de creación y configuración. Explicar brevemente el proceso realizado (0,5 puntos)


```bash
sudo sed -i "s/$(hostname)/ldapserver.asir.local/" /etc/hosts
sudo hostnamectl set-hostname ldapserver.asir.local
```

```bash
sudo apt update && sudo apt install -y \
    slapd ldap-utils
    # Admin pass: changeme
```

```bash
sudo dpkg-reconfigure slapd
    # Omit: No
    # DNS: asir.local
    # Organization name: asir
    # Admin pass: changeme
    # Remove DB if slapd purged: Yes
    # Move old DB: Yes
```

- Crear unidades organizativas (Usuarios y Grupos)

```bash
mkdir ~/ldap_ads

cat <<EOF | tee ~/ldap_ads/ou.ldif
dn: ou=Usuarios,dc=asir,dc=local
objectClass: top
objectClass: organizationalUnit
ou: Usuarios

dn: ou=Grupos,dc=asir,dc=local
objectClass: top
objectClass: organizationalUnit
ou: Grupos
EOF

sudo ldapadd -xD cn=admin,dc=asir,dc=local -Wf ~/ldap_ads/ou.ldif
```

- Crear grupo y definir miembros (con `memberUid`)

```bash
cat <<EOF | tee ~/ldap_ads/grupo.ldif
dn: cn=2asir,ou=Grupos,dc=asir,dc=local
objectClass: top
objectClass: posixGroup
gidNumber: 10000
cn: 2asir
memberUid: pablo
EOF

sudo ldapadd -xD cn=admin,dc=asir,dc=local -Wf ~/ldap_ads/grupo.ldif
```

- Crear usuario y asignarlo a 2asir (mediante el `gidNumber`)

```bash
cat <<EOF | tee ~/ldap_ads/usuario.ldif
dn: uid=pablo,ou=Usuarios,dc=asir,dc=local
objectClass: top
objectClass: posixAccount
objectClass: inetOrgPerson
objectClass: person
cn: pablo
uid: pablo
ou: Usuarios
uidNumber: 2000
gidNumber: 10000
homeDirectory: /home/pablo
loginShell: /bin/bash
userPassword: changeme
mail: pablo@asir.local
givenName: pablo
sn: Quevedo
EOF

# userPassword: $(sudo slappasswd)
sudo ldapadd -xD cn=admin,dc=asir,dc=local -Wf ~/ldap_ads/usuario.ldif
```

<!-- - Asignar grupos a usuarios (membresía real)

```bash
cat <<EOF | tee ~/ldap_ads/miembro.ldif
dn: cn=2asir,ou=Grupos,dc=asir,dc=local
changetype: modify
add: memberUid
memberUid: pablo
EOF

sudo ldapmodify -xD cn=admin,dc=asir,dc=local -Wf ~/ldap_ads/miembro.ldif
``` -->


- Demo

```bash
# sudo slapcat | bat -pl yaml

ldapsearch -xLLL -b 'dc=asir,dc=local' uid=pablo | bat -pl yaml

ldapsearch -xLLL -b "dc=asir,dc=local" "(&(cn=*)(memberUid=pablo))" dn | bat -pl yaml

# '(&(objectCategory=user)(memberOf=cn=MyCustomGroup,ou=ouOfGroup,dc=subdomain,dc=domain,dc=com))'
# '(&(objectCategory=group)(cn=myCustomGroup))'
```


---

### DESARROLLO 2
<!-- 2.a.i:la cuarta (ninguna)
2.c.i: 2/3 líneas -->

#### a) Bash

1. Indica que hace el siguiente script que recibe como argumentos, y en este orden, el nombre de un directorio y una cadena de caracteres: (0,5 puntos)
    - [ ] Busca la cadena de caracteres recibida en la llamada en todos los archivos regulares que cuelgan del directorio recibido como argumento
    - [ ] Ordena los archivos contenidos en el directorio recibido como argumento, almacenando el resultado en un archivo y mostrando el contenido del mismo por pantalla.
    - [ ] Ordena los archivos y directorios contenidos en el directorio recibido como argumento, redireccionando la salida a un archivo.
    - [x] Ninguna de las anteriores es correcta

```bash
#!/bin/bash
cd /
cd $1
ls > archivo
grep $2 (cat archivo)
```
2. Realizar un script que muestre un menú que se repita indefinidamente en pantalla con 4 opciones: (1 punto)
    - Usuarios conectados al sistema
    - Procesos que ejecuta un usuario
    - Uso de memoria
    - Salir

```bash
while true; do
    echo -e "\nElige una opción:"
    echo "1. Mostrar usuarios conectados al sistema"
    echo "2. Mostrar procesos que ejecuta un usuario"
    echo "3. Mostrar uso de memoria"
    echo "4. Salir"
    read ELECCION
    case $ELECCION in
        1) who ;;
        2) ps aux ;;
        3) free -h && echo "" && df -h ;;
        4) break ;;
        *) echo "Opción no reconocida. Vuelve a intentarlo" ;;
    esac 
done
```

#### b) Powershell (Windows Server con Dominio promocionado)

1. Crear un script que con un pequeño menú realice las siguientes cuestiones (0,5)
    - Crea un usuario local usersimu
    - Deshabilitar usuario anterior
    - Crea grupo local llamado groupsimu
    - Obtener usuarios y grupos del equipo
    - Eliminar grupo previo

<!-- ```ps1
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
Install-ADDSForest `
    -DomainName "asir.com" -DomainNetbiosName "asir" `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "aso2024." -AsPlainText -Force) `
    -DomainMode "WinThreshold" -ForestMode "WinThreshold" -InstallDNS -Confirm:$false
# Restart-Computer -Force
# Stop-Computer -Force
``` -->
```ps1
function Show-Menu {
    Write-Host "Seleccione una opción:"
    Write-Host "1. Crear usuario local 'usersimu'"
    Write-Host "2. Deshabilitar usuario 'usersimu'"
    Write-Host "3. Crear grupo local 'groupsimu'"
    Write-Host "4. Obtener usuarios y grupos del equipo"
    Write-Host "5. Eliminar grupo 'groupsimu'"
    Write-Host "6. Salir"
}

Show-Menu
$opcion = Read-Host "Opción"

switch ($opcion) {
    1 {
        New-LocalUser -Name usersimu
        Write-Host "Usuario 'usersimu' creado."
    }
    2 {
        Disable-LocalUser -Name usersimu
        Write-Host "Usuario 'usersimu' deshabilitado."
    }
    3 {
        New-LocalGroup -Name groupsimu
        Write-Host "Grupo 'groupsimu' creado."
    }
    4 {
        Get-LocalUser
        Get-LocalGroup | Format-Table
    }
    5 {
        Remove-LocalGroup -Name groupsimu
        Write-Host "Grupo 'groupsimu' eliminado."
    }
    6 {
        Write-Host "Saliendo del programa."
        break
    }
    default {
        Write-Host "Opción no válida. Intente de nuevo."
    }
}
```

2. Crear un script que con un pequeño menú realice las siguientes cuestiones: (0,75 puntos)
    - Copiar archivos o carpetas
    - Mover archivos o carpetas
    - Mostrar contenido de un archivo

```ps1
function CopiarArchivos {
    $origen = Read-Host "Ingrese la ruta del archivo o carpeta que desea copiar"
    $destino = Read-Host "Ingrese la ruta de destino donde desea copiar el archivo o carpeta"
    Copy-Item -Path $origen -Destination $destino -Recurse -Force
    Write-Host "Archivo o carpeta copiada exitosamente."
}

function MoverArchivos {
    $origen = Read-Host "Ingrese la ruta del archivo o carpeta que desea mover"
    $destino = Read-Host "Ingrese la ruta de destino donde desea mover el archivo o carpeta"
    Move-Item -Path $origen -Destination $destino -Force
    Write-Host "Archivo o carpeta movida exitosamente."
}

function MostrarContenido {
    $archivo = Read-Host "Ingrese la ruta del archivo que desea mostrar"
    if (Test-Path $archivo) {
        Get-Content $archivo
    } else {
        Write-Host "El archivo especificado no existe."
    }
}

while ($true) {
    Write-Host "`nSeleccione una opción:"
    Write-Host "1. Copiar archivos o carpetas"
    Write-Host "2. Mover archivos o carpetas"
    Write-Host "3. Mostrar contenido de un archivo"
    Write-Host "4. Salir"

    $opcion = Read-Host "Opción"

    switch ($opcion) {
        "1" { CopiarArchivos }
        "2" { MoverArchivos }
        "3" { MostrarContenido }
        "4" { Write-Host "Saliendo del programa."; exit }
        default { Write-Host "Opción no válida. Intente de nuevo." }
    }
}
```

#### c) LDAP

1. ¿Cómo funciona LDAP? ¿Qué relación tiene con Active Directory? Responde brevemente: (0,25 puntos)

foo

2. Crea en apache directory studio dos unidades organizativas, Usuarios y Grupos; dentro de Usuarios crear 3 usuarios con los miembros de tu grupo de proyecto y dentro de la uo Grupos, crear un grupo llamado proyecto. Introducir los usuarios dentro del grupo dentro del proceso de creación y configuración. Explicar brevemente el proceso realizado (0,5 puntos) NOTA: Si por lo que sea no has cursado el proyecto, invéntate los nombres.

```md
1. Instalación de LDAP en ubuntu server en red interna (+ DHCP)
2. Conexión con Apache Directory Studio desde cliente GUI en red interna
3. LDAP: New Entry: FOO

---

Usuarios: posixAccount + inetOrgPerson
```


---

### DESARROLLO 3

#### a) Bash

1. Indica que hace el siguiente script (0,5 puntos)
    - [x] Intercambia el nombre de dos ficheros pasados como parámetros
    - [ ] Ordena el contenido de dos archivos pasados como parámetros
    - [ ] Intercambia el contenido de dos archivos pasados como parámetros
    - [ ] Ninguna de las anteriores

```bash
#!/bin/bash
if [$# -ne 2]; then
    exit 1
fi
mv $1 temporal.tmp
mv $2 $1
mv temporal.tmp $2
```

2. Realizar un pequeño script que copie todos los ficheros que se le pasen por parámetro, al directorio Seguridad. Si el directorio no existe, se deberá crear. (1 punto)

```bash
#!/usr/bin/env bash

if [ ! -d Seguridad ]; then
    mkdir Seguridad
fi

for arg in $*; do
    if [ -f $arg ]; then
        cp $arg Seguridad/
    fi
done

# USO: bash script.sh foo bar
```

#### b) Powershell

1. Crear un script que nos solicite las notas de varios exámenes consecutivos. Después de cada nota nos preguntará si queremos continuar Si contestamos con una S pedirá otra nota. Si contestamos N mostrará el número de notas que hemos introducido y la nota media. (0,5 puntos)

```ps1
$notas = @()
$continuar = $true

while ($continuar) {
    $nota = Read-Host "Introduce la nota del examen"
    if ($nota -as [double] -ge 0 -and $nota -as [double] -le 10) {
        $notas += $nota
    } else {
        Write-Host "La nota debe ser un número válido entre 0 y 10"
        continue
    }

    $respuesta = Read-Host "¿Quieres continuar? (S/N)"
    if ($respuesta -eq "N") {
        $continuar = $false
    } elseif ($respuesta -ne "S") {
        Write-Host "Respuesta no válida, continuaremos ingresando notas."
    }
}

$totalNotas = $notas.Count
$notaMedia = ($notas | Measure-Object -Average).Average

Write-Host "Número de notas introducidas: $totalNotas"
Write-Host "Nota media: $notaMedia"
```

2. En la máquina virtual de Windows Server, realizar las siguientes operaciones mediante powershell, en un menú con 5 opciones: (0,75 puntos)
    - Creación de un usuario llamado userADSimu
    - Modificación de password de dicho usuario.
    - Creación de UO llamada UOSimu
    - Creación de un grupo llamado gSimu
    - Añade el usuario userADSimu al grupo proyecto

<!-- ```ps1
# DONE
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools
Install-ADDSForest `
    -DomainName "asir.com" -DomainNetbiosName "asir" `
    -SafeModeAdministratorPassword (ConvertTo-SecureString "aso2024." -AsPlainText -Force) `
    -DomainMode "WinThreshold" -ForestMode "WinThreshold" -InstallDNS -Confirm:$false
# Restart-Computer -Force
# Stop-Computer -Force
``` -->


```ps1
function Mostrar-Menu {
    # Clear-Host
    Write-Host "`nMenú de Operaciones"
    Write-Host "1. Crear usuario userADSimu"
    Write-Host "2. Modificar contraseña de userADSimu"
    Write-Host "3. Crear Unidad Organizativa UOSimu"
    Write-Host "4. Crear grupo gSimu"
    Write-Host "5. Añadir userADSimu al grupo gSimu"
    Write-Host "0. Salir"
}

do {
    Mostrar-Menu
    $opcion = Read-Host "Selecciona una opción"

    switch ($opcion) {
        1 {
            # Crear usuario userADSimu
            New-ADUser -Name "userADSimu" -SamAccountName "userADSimu" -AccountPassword (ConvertTo-SecureString "Password1234" -AsPlainText -Force) -Enabled $true
            Write-Host "Usuario userADSimu creado correctamente"
        }
        2 {
            # Modificar contraseña de userADSimu
            Set-ADAccountPassword -Identity "userADSimu" -Reset -NewPassword (ConvertTo-SecureString "NuevaContraseña1234" -AsPlainText -Force)
            Write-Host "Contraseña de userADSimu modificada correctamente"
        }
        3 {
            # Crear Unidad Organizativa UOSimu
            New-ADOrganizationalUnit -Name "UOSimu"
            Write-Host "Unidad Organizativa UOSimu creada correctamente"
        }
        4 {
            # Crear grupo gSimu
            New-ADGroup -Name "gSimu" -GroupScope Global
            Write-Host "Grupo gSimu creado correctamente"
        }
        5 {
            # Añadir userADSimu al grupo gSimu
            Add-ADGroupMember -Identity "gSimu" -Members "userADSimu"
            Write-Host "Usuario userADSimu añadido al grupo gSimu correctamente"
        }
        0 {
            Write-Host "Saliendo del menú"
        }
        default {
            Write-Host "Opción no válida, por favor selecciona una opción válida"
        }
    }
} while ($opcion -ne 0)
```

```ps1
Get-ADUser -Filter {SamAccountName -like "*Simu*"}
# Get-ADUser -Filter {Department -eq "IT"}
Get-ADUser -Filter {Name -like "*Simu*"}

Get-ADGroup -Filter {Name -like "*Simu*"}
Get-ADGroup -Filter {GroupScope -eq "Global"}

Get-ADGroupMember -Identity "gSimu"
Get-ADPrincipalGroupMembership -Identity "userADSimu"
Get-ADPrincipalGroupMembership -Identity "userADSimu" | Select-Object -ExpandProperty Name
```

#### c) LDAP

1. Crea en apache directory studio el siguiente esquema en LDAP: (0,75 puntos)


<details>
<summary>DHCP para ADS</summary>

```bash
sudo mv /etc/netplan/00-installer-config.yaml{,.bak}

cat<<EOF | sudo tee /etc/netplan/00-installer-config.yaml
# This is the network config written by '@pabloqpacin'
network:
  ethernets:
    enp0s3:
      dhcp4: true
    enp0s8:
      dhcp4: false
      addresses: [192.168.100.1/24]
      nameservers:
        addresses: [192.168.100.1]
  version: 2

EOF

sudo netplan try || \
sudo netplan apply
```

```bash
sudo sed -i '/^INTERFACESv4/s/""/"enp0s8"/' /etc/default/isc-dhcp-server
```

```bash
sudo sed -i '/^option domain-name\s/s/example.org/asir.com/' /etc/dhcp/dhcpd.conf
sudo sed -i 's/^option domain-name-servers .*/option domain-name-servers ns.asir.com;/' /etc/dhcp/dhcpd.conf

cat<<EOF | sudo tee -a /etc/dhcp/dhcpd.conf

subnet 192.168.100.0 netmask 255.255.255.0 {
  range 192.168.100.30 192.168.100.199;
  option subnet-mask 255.255.255.0;
  option routers 192.168.100.1;
  option domain-name-servers 192.168.100.1;
  option domain-name "asir.com";
}

host cliente_linux_desktop {
  hardware ethernet 08:00:27:2F:93:03;
  fixed-address 192.168.100.10;
}

EOF
```

```bash
sudo systemctl restart isc-dhcp-server
```

</details>


<!-- ```bash
sudo sed -i "s/$(hostname)/ldapserver.asir.local/" /etc/hosts
sudo hostnamectl set-hostname ldapserver.asir.local
``` -->

```bash
sudo apt update && sudo apt install -y \
    slapd ldap-utils
    # Admin pass: changeme
```

```bash
sudo dpkg-reconfigure slapd
    # Omit: No
    # DNS: example.com
    # Organization name: example
    # Admin pass: changeme
    # Remove DB if slapd purged: Yes
    # Move old DB: Yes
```

> Linux Desktop o Windows: ADS: 192.168.100.1 & 'cn=admin,dc=example,dc=com'


