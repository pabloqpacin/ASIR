# Sistemas UD4: Administración de servicio de Active Directory en Windows (PowerShell)

- [Sistemas UD4: Administración de servicio de Active Directory en Windows (PowerShell)](#sistemas-ud4-administración-de-servicio-de-active-directory-en-windows-powershell)
  - [TEORÍA](#teoría)
  - [PRÁCTICA (McGrawHill)](#práctica-mcgrawhill)
    - [1](#1)
      - [Caso práctico 1 -- Instalando Active Directory](#caso-práctico-1----instalando-active-directory)
      - [Ponte a prueba 1 -- Configuración del controlador de dominio](#ponte-a-prueba-1----configuración-del-controlador-de-dominio)
      - [Estudio de caso -- Configuración de dominio en Windows Core](#estudio-de-caso----configuración-de-dominio-en-windows-core)
      - [Ejercicios 1 -- test](#ejercicios-1----test)
    - [2](#2)
      - [Caso práctico 2 -- Creación de estructuras](#caso-práctico-2----creación-de-estructuras)
      - [Ponte a prueba 2 -- Deshabilitar usuarios en el controlador de dominio](#ponte-a-prueba-2----deshabilitar-usuarios-en-el-controlador-de-dominio)
      - [Ejercicios 2 -- test](#ejercicios-2----test)
    - [3](#3)
      - [Caso práctico 3 -- Estructura de carpetas con PowerShell](#caso-práctico-3----estructura-de-carpetas-con-powershell)
      - [Ponte a prueba 3 -- Depurando scripts](#ponte-a-prueba-3----depurando-scripts)
      - [Ejercicios 3 -- test](#ejercicios-3----test)
    - [4](#4)
      - [Caso práctico 4 -- Asignar usuarios a carpetas](#caso-práctico-4----asignar-usuarios-a-carpetas)
      - [Ponte a prueba 4 -- Personalización de directivas de grupo](#ponte-a-prueba-4----personalización-de-directivas-de-grupo)
      - [Estudio de caso -- Creación de objetos con Windows Core](#estudio-de-caso----creación-de-objetos-con-windows-core)
      - [Ejercicios 4 -- test](#ejercicios-4----test)
  - [QUIZ](#quiz)


## TEORÍA

> apuntes.md

## PRÁCTICA (McGrawHill)

<!-- ### foo -->
<!-- ### bar -->

### 1

#### Caso práctico 1 -- Instalando Active Directory

```md
**Instalando Active Directory**
Al llevar a cabo una instalación de Active Directory, se desea cambiar el nombre de máquina por un nombre diferente al que el controlador del dominio tiene configurado.
Para ello, se pide ejecutar los cmdlets necesarios para eliminar NAT, ámbito de DHCP y dominio. Además, habrá que cambiar el nombre de la máquina y volver a configurar el controlador de dominio con los servicios de NAT y DHCP.
```
```ps1
<#
    Para eliminar NAT, ámbito de DHCP y dominio, ejecutamos los siguientes cmdlets:
#>

# Eliminamos NAT
Remove-NetNat -Name "IntNetASO" -Confirm:$false

# Desautorizamos el DHCP
$nombreDC="aso.asix.local"
Remove-DhcpServerInDC -DnsName $nombreDC

# Eliminamos el ámbito de DHCP
$idAmbito="192.168.200.0" 
Remove-DhcpServerv4Scope -ScopeId $idAmbito -Force

#Eliminamos el controlador de dominio

$adminPass = "aso2022."
Uninstall-ADDSDomainController -DemoteOperationMasterRole -LocalAdministratorPassword (ConvertTo-SecureString -string $adminPass -AsPlainText -Force) -ForceRemoval 
Uninstall-WindowsFeature -Name AD-Domain-Services,DNS -Confirm:$false
Restart-Computer

#Cambiamos el nombre de máquina
$nombreServer="aso"
Rename-Computer -NewName $nombreServer 
```

#### Ponte a prueba 1 -- Configuración del controlador de dominio

Inicia sesión en el controlador de dominio y, haciendo uso de cmdlets, rellena la siguiente tabla

| Elemento a consultar                      | Cmdlet
| ---                                       | ---
| Estado del servicio DHCP Server           | `Get-Service -Name DHCP \| Format-List *`
| Scope ID del Ámbito de DHCP               | `Get-DhcpServerV4Scope`
| Rango de DHCP                             | `Get-DhcpServerV4Scope`
| InternalIPInterfaceAddressPrefix (NAT)    | `Get-NetNat`
| Información del dominio                   | `Get-ADDomain`
| Reenviadores DNS                          | `Get-DnsServerAddress`

#### Estudio de caso -- [Configuración de dominio en Windows Core](https://drive.google.com/file/d/1zBJW0EhmZthR14ASzKZ2RTjoV-F0ZPjV/view)

- [ ] TODO

#### Ejercicios 1 -- test

1. ¿Qué hace el cmdlet Install-ADDSForest? **Crea un nuevo bosque de Active Directory.**
2. ¿Cuál sería la diferencia principal entre estos dos cmdlets?
1.- `Install-ADDSForest -DomainName "asix.local" -InstallDNS` 
2.- `Install-ADDSForest -DomainName "asix.local" -CreateDNSDelegation`. **El primer cmdlet crearía un nuevo bosque e instalaría el DNS para ese nuevo bosque.**
3. Tras configurar un ámbito nuevo, el administrador ejecuta el siguiente cmdlet:
`Set-DhcpServerv4OptionValue -ScopeID '172.16.20.0' -DNSServer 172.16.20.1 -DNSDomain asix.local -Router 172.16.21.1`. ¿Las máquinas de la red interna podrán acceder a Internet? **No, ya que la puerta de enlace que recibirán los clientes no está bien configurada.**
4. Si quisiéramos habilitar el NAT para los clientes de la red interna cuya dirección de red es 10.20.30.0/24, ¿qué cmdlet deberíamos ejecutar? **New-NetNat -Name "IntNetASO" -InternalIPInterfaceAddressPrefix "10.20.30.0/24".**
5. ¿Cómo podríamos consultar qué servidores DNS reenviadores tenemos? **Get-DNSServerForwarder.**


### 2

#### Caso práctico 2 -- Creación de estructuras

```md
**Creación de estructuras**
A partir de los ficheros **departamentos.csv** y **empleados.csv**, crea la estructura de unidades organizativas, grupos y usuarios a través de un script en PowerShell. Deberás cumplir lo siguiente:
- Crear una Unidad Organizativa para cada departamento.
- Cada Unidad Organizativa contendrá un grupo de seguridad global con el mismo nombre que el departamento.
- Cada usuario se creará dentro de la unidad organizativa correspondiente a su departamento. 
- Habrá un grupo principal llamado Empresa cuyos miembros serán los departamentos. Los miembros de cada departamento serán los empleados de ese departamento.
- Por defecto, los empleados tendrán que cambiar la contraseña durante el siguiente inicio de sesión. La contraseña, para todos ellos, será “aso2022.”.
```

<details>
<summary>.csv</summary>

- departamentos.csv

```csv
departamento;descripcion
VENTAS;Departamento de Ventas
PRODUCCION;Departamento de Produccion
PERSONAL;Departamento de Personal
FINANZAS;Departamento de finanzas
```

- empleados.csv

```csv
departamento;nombre;apellido
VENTAS;Juan;Mateu
VENTAS;Matias;Garcia
VENTAS;Ivan;Perez
VENTAS;Sergio;Pallares
VENTAS;Marta;Zornoza
PRODUCCION;Ximo;Mateu
PRODUCCION;Enric;Garcia
PRODUCCION;Hugo;Perez
PRODUCCION;Andrea;Zornoza
PERSONAL;Consuelo;Mateu
PERSONAL;Natalia;Garcia
PERSONAL;JuanAntonio;Perez
PERSONAL;Julio;Zornoza
FINANZAS;Carla;Mateu
FINANZAS;Toni;Garcia
FINANZAS;Gloria;Martinez
FINANZAS;Paco;Molla
FINANZAS;Xaro;Zornoza
```
</details>
<br>

```ps1
### Para la solución de esta actividad, haremos uso de los cmdlets que hemos visto en la presente sección. Estos cmdlets se ejecutarán dentro de bloques foreach (a02_in_CreaEmpresa.ps1) como se indica a continuación:

#Creamos la unidad principal Empresa
New-ADOrganizationalUnit -Name Empresa -Path "DC=ASIX,DC=LOCAL" -ProtectedFromAccidentalDeletion $false
#Creamos el grupo principal
New-ADGroup -Name Empresa -GroupScope Global -Path "OU=Empresa,DC=ASIX,DC=LOCAL"
#Leemos el fichero departamentos
$departamentos = Import-Csv -Path .\departamentos.csv -Delimiter ";"
#Para cada departamento creamos su Unidad Organizativa y su grupo
foreach ($dep in $departamentos) {
	New-ADOrganizationalUnit -Name $dep.departamento -Path "OU=Empresa,DC=ASIX,DC=LOCAL" -Description $dep.descripcion
	New-ADGroup -Name $dep.departamento -GroupScope Global -Path "OU=$($dep.departamento),OU=Empresa,DC=ASIX,DC=LOCAL"
	#Añadimos el grupo como miembro de Empresa
    Add-ADGroupMember -Identity "CN=Empresa,OU=Empresa,DC=ASIX,DC=LOCAL" -Members "CN=$($dep.departamento),OU=$($dep.departamento),OU=Empresa,DC=ASIX,DC=LOCAL"  
}

#Leemos el fichero usuarios
$usuarios = Import-Csv .\empleados.csv -Delimiter ";"
#Para cada empleado creamos su usuario y lo añadimos al grupo correspondiente
foreach ($usu in $usuarios) {
	Write-Host "Añadiento usuario: $($usu.nombre)"
	New-ADUser -Name $usu.nombre -Path "OU=$($usu.departamento),OU=Empresa,DC=ASIX,DC=LOCAL" `
    -SamAccountName $usu.nombre -UserPrincipalName "$($usu.nombre)@ASIX.local" -GivenName $usu.nombre -Surname $usu.apellido `
    -AccountPassword (ConvertTo-SecureString "aso2022." -Force -AsPlainText) -ChangePasswordAtLogon $true -Enabled $true
	Add-ADGroupMember -Identity "CN=$($usu.departamento),OU=$($usu.departamento),OU=Empresa,DC=ASIX,DC=LOCAL" -Members "CN=$($usu.nombre),OU=$($usu.departamento),OU=Empresa,DC=ASIX,DC=LOCAL"
}

### Loguearse desde otro equipo del Dominio
```
```ps1
get-aduser -filter 
```

#### Ponte a prueba 2 -- Deshabilitar usuarios en el controlador de dominio

```md
Tener un control sobre las cuentas de usuario presentes en nuestro Active Directory es importante, sobre todo cuando nuestro sistema lleva funcionando un tiempo prolongado. Para comprender mejor esta importancia, realiza un script en PowerShell que deshabilite aquellos usuarios que no hayan iniciado sesión en el controlador de dominio durante los últimos tres meses.

Genera un fichero .csv donde se incluyan aquellos usuarios que han sido deshabilitados y cuyo nombre sea `usuariosDeshabilitados_ddmmyyyyhhmmss.csv`, donde el sufijo indicará el día, el mes, el año, la hora, los minutos y los segundos correspondientes al momento de la ejecución. En el fichero se añadirá, para cada usuario, lo siguiente:
**GivenName, Surname, Name, SamAccountName, DistinguishedName**

Una posible ejecución del script daría como resultado:
  PS Z:\> Z:\pp_2.ps1
  ¡20 usuarios deshabilitados!
  Fichero usuariosDeshabilitados_19062022121358.csv generado

1. Utiliza los cmdlet Get-ADUser, Disable-ADAccount para extraer la información necesaria.
2. Averigua cómo puedes buscar un objeto cuya propiedad no tenga ningún valor.
```
- Este script realiza las siguientes acciones:
  - Calcula la fecha límite que indica tres meses atrás desde la fecha actual.
  - Utiliza Get-ADUser para obtener usuarios que no han iniciado sesión en los últimos tres meses y que aún están habilitados.
  - Deshabilita los usuarios obtenidos usando Disable-ADAccount.
  - Genera un nombre de archivo CSV con una marca de tiempo.
  - Exporta la información de los usuarios deshabilitados al archivo CSV.
  - Muestra la cantidad de usuarios deshabilitados y el nombre del archivo generado.
- Para buscar un objeto cuya propiedad no tenga ningún valor, puedes utilizar el operador `-not` junto con `-eq $null`. Por ejemplo, para buscar usuarios sin un valor en la propiedad `Description`, puedes usar el filtro `{Description -notlike '*'}`.

```ps1
# Obtener la fecha actual y calcular la fecha hace tres meses
$fechaLimite = (Get-Date).AddMonths(-3)

# Obtener usuarios que no han iniciado sesión en los últimos tres meses
$usuariosDeshabilitados = Get-ADUser -Filter {LastLogonTimestamp -lt $fechaLimite -and Enabled -eq $true} -Properties GivenName, Surname, Name, SamAccountName, DistinguishedName

# Deshabilitar los usuarios obtenidos
$usuariosDeshabilitados | ForEach-Object {
    Disable-ADAccount -Identity $_.SamAccountName
}

# Generar nombre de archivo CSV con marca de tiempo
$timestamp = Get-Date -Format "ddMMyyyyHHmmss"
$nombreArchivo = "usuariosDeshabilitados_$timestamp.csv"

# Crear archivo CSV y escribir encabezados
$usuariosDeshabilitados | Select-Object GivenName, Surname, Name, SamAccountName, DistinguishedName |
    Export-Csv -Path $nombreArchivo -NoTypeInformation

# Contar y mostrar la cantidad de usuarios deshabilitados
$cantidadUsuariosDeshabilitados = $usuariosDeshabilitados.Count
Write-Host "$cantidadUsuariosDeshabilitados usuarios deshabilitados!"
Write-Host "Archivo $nombreArchivo generado"
```

#### Ejercicios 2 -- test

1. ¿Cuál es la función del parámetro –Enabled en el cmdlet New-ADUser? **Especifica si la cuenta del usuario está habilitada o no.**
2. ¿Cómo podemos consultar las cuentas de usuario que están deshabilitadas? 
**Search-ADAccount –AccountDisabled.**
3. Observando las propiedades del usuario en el código de la imagen, ¿qué cmdlet podrá haber ejecutado el administrador? **Get-ADUser –Identity naparicio.** (`Sam*`)
4. ¿Qué tipo de objeto muestra el comando de la imagen? **Grupo**
5. ¿Cómo podemos identificar una Unidad organizativa? **Por su GUID.**


### 3

#### Caso práctico 3 -- Estructura de carpetas con PowerShell

```md
**Estructura de carpetas con PowerShell**
A partir de los ficheros `departamentos.csv` y `empleados.csv`, crea la estructura de carpetas a través de un script en PowerShell. Descarga los ficheros en esta pantalla.
La estructura deberá cumplir las siguientes condiciones:
1. Se creará una carpeta llamada `C:\Empresa`. Dentro de esta carpeta, habrá una carpeta por cada uno de los **departamentos**.
2. Se creará una carpeta llamada `C:\Empresa_users`. Dentro de esta carpeta, habrá una carpeta por cada **empleado**.
3. Los permisos de la carpeta `Empresa` serán de "**Control total**" para el grupo `Administradores` (lo que afecta a esta carpeta, sus subcarpetas y sus archivos) y de "**Lectura y ejecución**" para el grupo `Empresa` (aplicable solo a esta carpeta).
4. Los permisos de las carpetas de cada departamento serán de "**Control total**"» para el grupo `Administradores` (vendrá heredado) y "**Modificar**" para el departamento (aplicado a esta carpeta, su subcarpeta y sus archivos).
5. Los permisos de la carpeta `C:\Empresa_users` serán de "**Control total**" para el grupo `Administradores` (aplicado a esta carpeta, sus subcarpetas y sus archivos) y de "**Lectura y ejecución**" para el grupo `Empresa` (aplicable únicamente a esta carpeta).
6. Por su parte, los permisos de la carpeta de usuario serán de "**Control total**" tanto para el usuario (aplicable a esta carpeta, sus subcarpetas y sus archivos) como para el grupo `Administradores` (vendrá heredado).
```
<details>
<summary>Archivos .csv</summary>

```csv
departamento;descripcion
VENTAS;Departamento de Ventas
PRODUCCION;Departamento de Produccion
PERSONAL;Departamento de Personal
FINANZAS;Departamento de Finanzas
```
```csv
departamento;nombre;apellido
VENTAS;Juan;Mateu
VENTAS;Matias;Garcia
VENTAS;Ivan;Perez
VENTAS;Sergio;Pallares
VENTAS;Marta;Zornoza
PRODUCCION;Ximo;Mateu
PRODUCCION;Enric;Garcia
PRODUCCION;Hugo;Perez
PRODUCCION;Andrea;Zornoza
PERSONAL;Consuelo;Mateu
PERSONAL;Natalia;Garcia
PERSONAL;JuanAntonio;Perez
PERSONAL;Julio;Zornoza
FINANZAS;Carla;Mateu
FINANZAS;Toni;Garcia
FINANZAS;Gloria;Martinez
FINANZAS;Paco;Molla
FINANZAS;Xaro;Zornoza
```
</details>

```ps1
# CreaEstructuraCarpetas.ps1

Write-Host "Creamos la estructura de Empresa..."
Remove-Item C:\Empresa -Force
New-Item C:\Empresa -Type Directory
$acl = Get-Acl c:\Empresa
$acl.SetAccessRuleProtection($true, $false)
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Administradores","FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")
$acl.AddAccessRule($rule)
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Empresa","ReadAndExecute", "None", "None", "Allow")
$acl.AddAccessRule($rule)
Set-Acl -path C:\Empresa -AclObject $acl


Write-Host "Asignamos Permisos a departamentos"
$deps = Import-CSV -Path "./departamentos.csv" -Delimiter ";"
foreach ($ou in $deps) {
  New-Item C:\Empresa\$($ou.departamento) -Type Directory -Force
  $acl = Get-Acl C:\Empresa\$($ou.departamento)
  $rule = New-Object System.Security.AccessControl.FileSystemAccessRule($($ou.departamento),"Modify", "ContainerInherit, ObjectInherit", "None", "Allow")
  $acl.AddAccessRule($rule)
  Set-Acl -path C:\Empresa\$($ou.departamento) -AclObject $acl
}
```
```ps1
# CreaCarpetasPersonales.ps1

Write-Host "Creamos la estructura de Carpetas de Usuarios"
Remove-Item C:\Empresa_users -Force
New-Item C:\Empresa_users -Type Directory
$acl = Get-Acl C:\Empresa_users
$acl.SetAccessRuleProtection($true, $false)
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Administradores","FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")
$acl.AddAccessRule($rule)
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Empresa","ReadAndExecute", "None", "None", "Allow")
$acl.AddAccessRule($rule)
Set-Acl -path C:\Empresa_users -AclObject $acl

$usuarios = Import-CSV -Path .\empleados.csv -Delimiter ";"
Write-Output "Creando carpetas de usuarios...."
foreach ($user in $usuarios) {
  $login = $user.login
  New-Item C:\Empresa_users\$($user.nombre) -Type Directory
  $acl = Get-Acl C:\Empresa_users\$($user.nombre)
  $rule = New-Object System.Security.AccessControl.FileSystemAccessRule($($user.nombre),"FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")
  $acl.AddAccessRule($rule)
  Set-Acl -path C:\Empresa_users\$($user.nombre) -AclObject $acl
}
```

```ps1
get-acl -Path C:\Empresa_users | Select-Object -ExpandProperty Access | ft -AutoSize
```

#### Ponte a prueba 3 -- Depurando scripts

...

#### Ejercicios 3 -- test

1. ¿Qué diferencia hay entre ContainerInherit y ObjectInherit? **ContainerInherit se aplica a subcarpetas y ObjectInherit se aplica a archivos.**
2. ¿Cómo aplicaríamos una ACL solo a subcarpetas y archivos? **Añadiendo en InheritanceFlags ContainerInherit y ObjectInherit, y en PropagationFlags, InheritOnly.**
3. ¿Cómo podríamos consultar en detalle los permisos de acceso de un determinado archivo o de cierta carpeta? **A través del cmdlet Get-Acl y expandiendo la propiedad Access.**
4. Observa la salida del cmdlet de la imagen, ¿a qué ítems se aplica? **A esta carpeta y a las subcarpetas.**
5. ¿Cómo podemos eliminar la herencia y borrar todas las reglas de un objeto? **SetAccessRuleProtection($true,$false).**


### 4

#### Caso práctico 4 -- Asignar usuarios a carpetas

```md
**Asignar usuarios a carpetas**
A partir del caso práctico elaborado en la tercera sección de esta unidad, crea un script para asignar a cada usuario su carpeta personal, así como un script de inicio de sesión, y para asociar a los usuarios del departamento de personal un perfil móvil.
Condiciones
- La carpeta personal se conectará a la unidad Z: 
- El script de inicio de sesión conectará la carpeta de los departamentos en la unidad X:
- Solo los usuarios del departamento de PERSONAL dispondrán de un perfil móvil, para facilitar su movilidad entre diferentes equipos.

Ejemplo
Un usuario de PERSONAL debería mostrar lo siguiente:
  PS Z:\> Get-ADUser -Identity Julio -Properties * | fl HomeDrive, HomeDirectory, ScriptPath, ProfilePath
  HomeDrive    : Z:
  HomeDirectory : \\aso.asix.local\Empresa_users\Julio
  ScriptPath   : Empresa.bat
  ProfilePath  : \\aso.asix.local\Empresa_users\Julio\perfil 

Y otro usuario de otro departamento:
  PS Z:\> Get-ADUser -Identity Xaro -Properties * | fl HomeDrive, HomeDirectory, ScriptPath, ProfilePath
  HomeDrive    : Z:
  HomeDirectory : \\aso.asix.local\Empresa_users\Xaro
  ScriptPath   : Empresa.bat
  ProfilePath  :

Por último, modifica la política de contraseñas predeterminada para cumplir con las siguientes propiedades:
  PS Z:\> Get-ADDefaultDomainPasswordPolicy
  ComplexityEnabled          : True
  DistinguishedName          : DC=asix,DC=local
  LockoutDuration            : 00:15:00
  LockoutObservationWindow   : 00:10:00
  LockoutThreshold           : 3
  MaxPasswordAge             : 60.00:00:00
  MinPasswordAge             : 1.00:00:00
  MinPasswordLength          : 8
  PasswordHistoryCount      : 3
  ReversibleEncryptionEnabled : False
```
---

- C:\Windows\SYSVOL\sysvol\asix.local\scripts\Empresa.bat

```bat
if NOT EXIST X: net use X: \\asix.local\Empresa
msg %username% Recuerda guardar los datos en las unidades X: o Z:
```

- script

```ps1
<#  Autor: Alberto Aparicio Vila #>

# Compartimos las carpetas que creamos para Empresa y Empresa_users
New-SmbShare -Name Empresa_users -Path C:\Empresa_users -ChangeAccess Empresa -FullAccess Administradores
New-SmbShare -Name Empresa -Path C:\Empresa -ChangeAccess Empresa -FullAccess Administradores
# Actualizamos las propiedades de cada usuario
$usuarios = Import-CSV -Path "./empleados.csv" -Delimiter ";"
Write-Output "Modificando atributos de usuarios...."
foreach ($user in $usuarios) {
  $usuario="CN=$($user.nombre),OU=$($user.departamento),OU=Empresa,DC=ASIX,DC=LOCAL"
  Set-ADUser -Identity $usuario -ScriptPath "Empresa.bat" -HomeDrive "Z:" -HomeDirectory "\\aso.asix.local\Empresa_users\$($user.nombre)"  
  if ($user.departamento -eq "PERSONAL") {
      Set-ADUser -Identity $usuario -ProfilePath "\\aso.asix.local\Empresa_users\$($user.nombre)\perfil"
  }
  Write-Output "Usuario $usuario actualizado!"
}
    
# Modificamos la politica de contraseñas por defecto
Set-ADDefaultDomainPasswordPolicy `
  -Identity asix.local -PasswordHistoryCount 3 -MinPasswordLength 4 `
  -LockoutDuration 00:15:00 -LockoutObservationWindow 00:10:00 -LockoutThreshold 3 `
  -ComplexityEnabled $True -ReversibleEncryptionEnabled $False -MaxPasswordAge 60.00:00:00

gpupdate /force
```

#### Ponte a prueba 4 -- Personalización de directivas de grupo

```md
**Personalización de directivas de grupo**
Crea una directiva de grupo y asígnala a una estructura de unidades organizativas de manera que los usuarios incluidos dentro de dicha estructura verifiquen las siguientes condiciones a la hora de iniciar sesión:
- No pueden acceder a un disco extraíble.
- No pueden acceder al administrador de tareas.
- No pueden modificar las propiedades de TCP/IP.
- No pueden agregar o quitar programas.
- Pueden eliminar el menú «Ejecutar».
- Pueden añadir un fondo de imagen corporativo como fondo de escritorio que no se pueda cambiar.
Finalmente, inicia sesión con un usuario en una máquina cliente y comprueba que la directiva de grupo se ha aplicado.

---
**Claves de resolución**
1. Cmdlets relativos a la creación y asignación de GPOs. New-GPO y New-GPLink.
2. Análisis de las directivas GPO en las plantillas administrativas.
```

#### Estudio de caso -- [Creación de objetos con Windows Core](https://drive.google.com/file/d/11_kl5o1RKPXccnDS2PyDSWlAOcZLVcew/view)

...

#### Ejercicios 4 -- test

1. ¿Cuándo se hace efectiva una nueva GPO? **Cuando se vincula a un objeto (sitio, dominio o unidad organizativa).**
2. A la hora de instalar el Active Directory, ¿qué dos directivas de grupo se crean por defecto? **Default Domain Controllers Policy y Default Domain Policy.**
3. ¿Cómo podríamos obtener un informe completo de una determinada GPO? **Get-GPOReport**
4. Supón que ejecutamos el siguiente cmdlet: `PS Z:\> New-GPLink -Name "NewGPO" -Target "OU=Alumnos, OU=IES, DC=ASIX, DC=LOCAL" -LinkEnabled Yes`. ¿Cuál de las siguientes afirmaciones sobre dicho cmdlet es correcta? **Vincula la GPO llamada NewGPO a la unidad organizativa Alumnos.**
5. Observa el siguiente cmdlet: `PS Z:\> Set-ADUser -Identity usu1 -ScriptPath "inicio.bat"`. ¿Qué podemos afirmar sobre el mismo? **Define, para el usuario usu1, un script de inicio de sesión llamado “inicio.bat”.**

## QUIZ
