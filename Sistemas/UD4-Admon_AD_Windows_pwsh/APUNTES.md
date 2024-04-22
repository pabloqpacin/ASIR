# Unidad 4 McGrawHill <br> Administración de servicio de Active Directory en Windows (PowerShell)

```md
# Objetivos
1. Instalar y configurar Active Directory con PowerShell.
2. Administrar usuarios, grupos y unidades organizativas con PowerShell.
3. Administrar permisos con PowerShell.
4. Asignar perfiles a grupos.
5. Definir directivas de grupo.
```

<Table of Contents>

## 1. [Instalación y configuración de Active Directory con Powershell](https://drive.google.com/file/d/12Xr6C0iR8wnuQduiU_chLb7D0-tQ9pnE/view)

```md
En este apartado, llevaremos a cabo una instalación de Active Directory a partir de cmdlets en PowerShell y aprenderemos a configurar el servicio de DHCP y NAT. También estudiaremos cómo podemos añadir una nueva máquina al controlador de dominio, de manera local pero también de manera remota. Por último, recordaremos algunos de los elementos propios de Active Directory.
En determinadas instalaciones, a veces, es necesario volver al punto de partida, ya que, debido al olvido o a alguna reconfiguración del servidor, se hace necesario modificar de nuevo alguna configuración. Conocer los cmdlets de degradación de dominio y eliminación de servicios es también una tarea con la que todo administrador debería estar familiarizado.
```

```bash
# Después de cada 'Install-WindowsFeature'
Update-Help -UICulture en-US

# Cmdlets...
Get-Help <foo> -Examples
```
```ps1
# Movidas pwsh $PROFILE
Set-PSReadLineOption -Colors @{ Command = 'DarkCyan' }

# En clientes...
New-NetFirewallRule -DisplayName "Allow ICMPv4-In" -Direction Inbound -Protocol ICMPv4 -IcmpType 8 -Action Allow -Enabled True
```


### 1.1 Instalación de un controlador de dominio con PowerShell

> Máquina: Windows Server 2022 Desktop con 2 interfaces de red, una **bridged** y otra en **red interna**

#### Cmdlet `Install-ADDSForest`

- Configuración base: nombre del servidor y dirección IP estática de interfaz interna: `configuracionBase.ps1`

```ps1
#Nombre del servidor
$nombreServer="aso"
#Dirección IP del interfaz interno
$dirIP="192.168.200.1"
#Nombre del adaptador
$redInterna="Ethernet 2"
Rename-Computer -NewName $nombreServer
Get-NetAdapter -name $redInterna | Remove-NetIPAddress -Confirm:$false
Get-NetAdapter -name $redInterna | New-NetIPAddress -addressfamily IPv4 -ipaddress $dirIP -prefixlength 24 -type unicast
# Restart-Computer -force
```

- Añadir rol de AD y DNS y creación de bosque con `CreaDominio.ps1`

```ps1
$dominioFQDN = "asix.local"
$dominioNETBIOS = "asix"
$adminPass = "aso2022."
Install-WindowsFeature AD-Domain-Services,DNS
Import-module ADDSDeployment
Install-ADDSForest `
  -DomainName $dominioFQDN -DomainNetBiosName $dominioNETBIOS `
  -SafeModeAdministratorPassword (ConvertTo-SecureString -string $adminPass -AsPlainText -Force) `
  -DomainMode WinThreshold -ForestMode WinThreshold -InstallDNS -Confirm:$false
```

- [ ] Instalar herramientas gráficas...

### 1.2 Degradar un controlador de dominio con PowerShell

Para cambiar la config etc.

#### Cmdlet `Uninstall-ADDSDomainController`

...

### 1.3 Servicio DHCP con PowerShell

#### Cmdlets `Add-DHCPServerV4Scope`, `Set-DHCPServerV4OptionValue` y `Add-DHCPServerINDC`

- `configuracionDHCP.ps1`: el cmdlet `Install-WindowsFeature -Name DHCP` añade el rol de DHCP. Mediante el cmdlet `Add-DhcpServerv4Scope` se añade el ámbito de DHCP donde se define la dirección IP origen del rango y la dirección IP destino. `Set-DhcpServerv40ptionValue` establece los parámetros de DNS y la puerta de enlace que recibirán los clientes cuando soliciten una dirección dinámica al servidor de DHCP. Finalmente, `Add-DhcpServerInDC` autoriza el DHCP en el dominio.

```ps1
$nombreDC="aso.asix.local"
$nombreAmbito="asix.local"
$ipDNS="192.168.200.1"
$ipGW="192.168.200.1"
$idAmbito="192.168.200.0"
$ipInicial="192.168.200.20"
$ipFinal="192.168.200.200"
$mascara="255.255.255.0"
#Instalar el rol de DHCP
Install-WindowsFeature -Name DHCP
#Definir el ámbito de DHCP
Add-DhcpServerv4Scope -Name $nombreAmbito -StartRange $ipInicial -EndRange $ipFinal -SubnetMask $mascara
Set-DhcpServerv4OptionValue -ScopeID $idAmbito -DNSServer $ipDNS -DNSDomain $nombreAmbito -Router $ipGW
#Autorizar DHCP en el AD
Add-DhcpServerInDC -DnsName $nombreDC
```

```ps1
Get-DhcpServerv4Scope
Get-DhcpServerv4Statistics

# # Eliminar ámbitos IPv3 especificados
# Remove-DhcpServerv4Scope

# # Eliminar servicio DHCP en el AD
# Remove-DhcpServerInDC
```

### 1.4 Añadir una máquina cliente al Active Directory

> En máquinas clientes

#### Cmdlet `Add-Computer`

```ps1
Get-ADComputer -Filter *

Test-Connection asix.local -Quiet -Count 1

# En Terminal como Administrador
Add-Computer -DomainName asix.local -Restart        # Administrator==susodicho882;;

# ~~Fail... GUI==success~~
```

> https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/deployment/join-a-computer-to-a-domain

### 1.5 Añadir una máquina cliente al Active Directory de forma remota

```ps1
# En el cliente, como Administrador
Enable-PSRemoting
```

> Desde el propio server

```ps1
New-PSSession -ComputerName WIN11PROES -Credential WIN11PROES\pabloqpacin

Add-Computer -ComputerName WIN11PROES -LocalCredential WIN11PROES\pabloqpacin -DomainName asix.local -Credential administrador@asix.local -Restart -Force
```

### 1.6 Eliminar una máquina cliente del Active Directory

#### Cmdlet `Remove-Computer`

```ps1
Remove-Computer -UnjoinDomainCredential administrador@asix.local -Force -Restart
```

### 1.7 Habilitar NAT

Dar salida a internet a los clientes en red interna

#### Cmdlet `New-NetNat`

- `configuracionNAT.ps1`

```ps1
#Instalamos la característica 
Install-WindowsFeature Routing -IncludeManagementTools
#Configuramos NAT para que la red interna tenga acceso al exterior
New-NetNat -Name "IntNetASO" -InternalIPInterfaceAddressPrefix "192.168.200.0/24"

Get-NetNat
```

#### Cmdlets `Get-DNSServerForwarder` y `Add-DNSServerForwarder`

```ps1
Get-DnsServerForwarder
    # IPAddress          : {80.58.61.250, 80.58.61.254, fec0:0:0:ffff::1, fec0:0:0:ffff::2…}

# Add-DnsServerForwarder -IPAddress 8.8.8.8

# Remove-DnsServerForwarder
```



### 1.8 Elementos de Active Directory (OJO)

- **Active Directory**: base de datos relacional, ubicada en un servidor con el rol de <u>controlador de dominio</u>, y que almacena información sobre <u>usuarios y recursos</u> de una organización.

| Elemento                  | Descripción
| ---                       | ---
| Dominio                   | comparten una misma zona (conjunto de recursos+máquinas+usuarios); requiere DNS
| Controlador de Dominio    | equipo que ejecuta la implementación del servicio de directorio
| Árboles                   | 1\|n dominios en 1 espacio de nombres; aka subdominios (foo.asix.local)
| Bosque                    | 1\| dominios en 1 estructura (indepes); relaciones de confianza: compartir recursos
| Unidades Organizativas    | contenedores lógicos de objetos
| Grupos                    | contenedores cuyos miembros son objetos (usuarios\|grupos)
| Usuarios                  | aplicar diferentes controles de acceso sobre equipos\|recursos

> La diferencia entre los árboles y el bosque es que los dominios incluidos dentro de un bosque no comparten el mismo espacio de nombres

- "Para referenciar a los objetos del active directory, utilizamos su **Distinguished Name (DN)**. El DN permite identificar un objeto de manera única dentro de la jerarquía del Active Directory. Se forma a partir de un `atributo=valor`, separado por comas.

| Objeto                | Atributo
| ---                   | ---
| Usuario               | CN (Common Name)
| Grupo                 | CN (Common Name)
| Equipo                | CN (Common Name)
| Unidad Organizativa   | OU (Organizational Unit)
| Dominio               | DC (Domain Component)

- EJEMPLOS

```yaml
# Por ejemplo, veamos el siguiente DN de una  Unidad Organizativa:
DistinguishedName: OU=VENTAS, OU=Empresa,DC=asix,DC=local
# Identificaría a la unidad organizativa de Ventas, que está dentro de otra unidad organizativa Empresa en el interior del dominio asix.local

# Ahora observemos el siguiente DN de un grupo:
DistinguishedName: CN=FINANZAS, OU=FINANZAS, OU=Empresa,DC=asix,DC=local
# Identificaría al grupo Finanzas, que está incluido en la Unidad Organizativa Finanzas, y esta, a su vez, se ubica dentro de Empresa bajo el dominio asix.local.

# Otro caso sería el siguiente DN de un equipo:
DistinguishedName: CN=PC1,CN=Computers,DC=asix,DC=local
# Identificaría al equipo PC1 dentro del dominio asix.local.

# Por ejemplo, el siguiente DN de un usuario:
DistinguishedName: CN=Administrador, CN=Users,DC=asix,DC=local
# Identificaría al usuario Administrador que está ubicado dentro de Users y en el dominio asix.local.
```

## 2. Administración de objetos en Active Directory

```md
La administración de Active Directory resulta una tarea sencilla cuando se lleva a cabo a través de la interfaz gráfica, pero puede ser muy tediosa si debemos repetir en innumerables ocasiones las mismas secuencias de acciones. Pensemos, por ejemplo, en el caso típico que consiste en dar de alta a una cantidad muy grande de usuarios para crear la estructura completa de una organización. 
En este apartado hemos visto cómo podemos administrar los usuarios, los grupos y las unidades organizativas a través de cmdlets, que nos permitirán realizar scripts para automatizar este tipo de procesos.
```

> Todos los cmdlets que veremos ... pertenecen al módulo `ActiveDirectory`. Podemos consultar el conjunto completo de cmdlets con:

```ps1
Get-Command -Module ActiveDirectory -CommandType Cmdlet
```


### 2.1 Administración de usuarios en AD
#### Consultar usuarios (`Get-ADUser`)

```ps1
Search-ADAccount –AccountDisabled

Get-ADUser -Filter "Name -notlike 'k*'" -SearchBase "CN=Users,DC=asix,DC=local"

# Propiedades de un determinado usuario a partir de su 'SamAccountName'
Get-ADUser -Filter * -SearchBase "CN=Users,DC=asix,DC=local" | foreach-object {
    get-aduser -identity $_ -properties * | bat -l ps1
}

(get-aduser -identity aaparicio -properties *).memberof
```
```ps1
# Consultar los usuarios de un contenedor
Get-ADUser -Filter * -SearchBase "CN=Users,DC=asix,DC=local"
Get-ADUser -Filter * -SearchBase "OU=Empresa,DC=asix,DC=local"
# Consultar usuarios filtrando valores en sus propiedades
Get-ADUser -Filter "Name -like 'A*'" -SearchBase "OU=Empresa,DC=asix,DC=local"
# Obtener todas las propiedades de un usuario a partir de su SamAccountName
Get-ADUser -Identity Xaro -Properties *
```

#### Crear usuarios (`New-ADUser`)

```ps1
# Crear usuario en AD: asix\aaparicio
New-ADUser `
    -Name "aaparicio" -Path "CN=Users,DC=asix,DC=local" `
    -SamAccountName "aaparicio" -UserPrincipalName "aaparicio@asix.local" `
    -AccountPassword (ConvertTo-SecureString "aso2022." -AsPlainText -Force) `
    -GivenName "Alberto" -Surname "Aparicio Vila" `
    -ChangePasswordAtLogon $true -Enabled $true
    # -CannotChangePassword
    # -PasswordNeverExpires

New-ADUser `
    -Name "plopez" -Path "CN=Users,DC=asix,DC=local" `
    -SamAccountName "plopez"  -UserPrincipalName "plopez@asix.local" `
    -AccountPassword (ConvertTo-SecureString "aso2022." -AsPlainText -Force) `
    -GivenName "Pepe" -Surname "Lopez" -Enabled $true
```

#### Eliminar usuarios (`Remove-ADUser`)

```ps1
# Eliminar un usuario sin confirmación
Remove-ADUser -Identity "CN=aaparicio,CN=Users,DC=asix,DC=local" -Confirm:$false
```

#### Modificar usuarios (`Set-ADUser`)

```ps1
# Modificar un usuario 
Set-ADUser -Identity "CN=aaparicio,CN=Users,DC=asix,DC=local" -EmailAddress "aaparicio@asix.local"
```

#### Deshabilitar usuarios (`Disable-ADAccount`)

```ps1
# Deshabilitar una cuenta
Disable-ADAccount -Identity aaparicio
#Enable-ADAccount -Identity aaparicio
```

### 2.2 Administración de grupos en AD

- Recordemos que en Active Directory <u>existen dos tipos de grupos</u>:
  - **Grupos de seguridad**: permisos para recursosd el dominio; utilizados en ACL y para la admon. de red
  - **Grupos de distribución**:  sin seguridad, listado de usuarios únicamente para mensajería
- Dentro de los **Grupos de seguridad** existen, a su vez, 3 ámbitos diferenciados:
  - **Grupo Universal**: con permisos para n dominios, formado por usuarios|grupos de n dominios
  - **Grupo Global**: todos son miembros de 1 dominio, acceso a recursos de n dominios (del árbol del AD)
  - **Grupo Local de Dominio**:  grupo en 1 dominio con miembros de n dominios pero acceso solo a recursos en ese 1 dominio

#### Consultar grupos (`Get-ADGroup`)

```ps1
(get-adgroup -filter *).distinguishedname
(Get-ADGroup -Filter 'GroupScope -eq "Global"').DistinguishedName
```
```ps1
# Consultar información de un grupo
Get-ADGroup -Identity profesores
# Consultar todas las propiedades del grupo profesores
Get-ADGroup -Identity profesores -Properties * 
# Consultar todos las grupos que comiencen por Adm
Get-ADGroup -Filter "Name -like 'Adm*'"
```

#### Crear grupos (`New-ADGroup`)

> Por defecto, los grupos creados corresponden al tipo **Security**. Si se quisiera especificar otro **grupo de distribución**, se haría uso del parámetro `-GroupCategory`. Los posibles valores del parámetro `-GroupScope` son: `DomainLocal`, `Global` y `Universal`.

```ps1
# Crear un grupo dentro del contenedor Users
New-ADGroup -Name profesores -Path "CN=Users,DC=asix,DC=local" -GroupScope Global -Description "Grupo de Profesores"
```

#### Eliminar grupos (`Remove-ADGroup`)

```ps1
# Eliminar un grupo sin confirmación
Remove-ADGroup -Identity "CN=profesores,CN=Users,DC=asix,DC=local" -Confirm:$false
```
#### Modificar grupos (`Set-ADGroup`)
```ps1
# Modificar el ámbito del grupo profesores
Set-ADGroup -Identity profesores -GroupScope Universal
```

---

#### Consultar miembros de un grupo (`Get-ADGroupMember`)

```ps1
# Consultar miembros de un grupo
Get-ADGroupMember -Identity profesores
```

#### Añadir miembros a un grupo (`Add-ADGroupMember`)

> Para añadir|eliminar más de un miembro, utilizaríamos una lista separada por comas. Los objetos que se pueden eliminar son usuarios, grupos y máquinas referenciados por su *Distinguished Name*, *GUID*, *Security Identifier* o *SamAccountName*.

```ps1
# Añadir un usuario al grupo
Add-ADGroupMember -Identity "CN=profesores,CN=Users,DC=asix,DC=local" -Members "CN=aaparicio,CN=Users,DC=asix,DC=local"
```

#### Eliminar miembros de un grupo (`Remove-ADGroupMember`)

```ps1
# Eliminar un usuario del grupo
Remove-ADGroupMember -Identity profesores -Members aaparicio -Confirm:$false
```

### 2.3 Administración de Unidades Organizativas en AD

#### Consultar unidades organizativas (`Get-ADOrganizationalUnit`)

El parámetro `-SearchBase` indica desde qué `Path` se va a comenzar a realizar la búsqueda en la estructura del Active Directory. Si solo quisiéramos acceder al primer nivel a partir de un determinado Path, podemos hacer uso del parámetro `-SearchScope`. Los posibles valores son `Base`, `OneLevel` o `Subtree`. Por ejemplo, para mostrar las Unidades Organizativas de primer nivel a partir de IES, debemos introducir:

```ps1
# Consultar una Unidad Organizativa
Get-ADOrganizationalUnit -Filter "Name -Like '*'" -SearchBase "OU=IES,DC=asix,DC=local"
# Consultar las unidades organizativas de primer nivel
Get-ADOrganizationalUnit -Filter * -SearchBase "OU=IES,DC=asix,DC=local" -SearchScope OneLevel
```
#### Crear unidades organizativas (`New-ADOrganizationalUnit`)

Por defecto, cuando se crea una Unidad Organizativa, el valor de la propiedad `-ProtectedFromAccidentalDeletion` es `True` y, por tanto, <u>**no se podrá eliminar esta Unidad Organizativa a no ser que se modifique esta propiedad**</u>. Los siguientes ejemplos crean dos unidades organizativas dentro de *IES* con el nombre *Profesores* y *Alumnos* sin protección contra su borrado accidental:

```ps1
# Crear una Unidad Organizativa
New-ADOrganizationalUnit -Name IES -Path "DC=asix,DC=local" -Description "Unidad Organizativa del IES" -ProtectedFromAccidentalDeletion:$true
# Crear una Unidad Organizativa sin protección Accidental
New-ADOrganizationalUnit -Name Profesores -Path "OU=IES,DC=asix,DC=local" -Description "Unidad organizativa de profesores" -ProtectedFromAccidentalDeletion:$false
New-ADOrganizationalUnit -Name Alumnos -Path "OU=IES,DC=asix,DC=local" -Description "Unidad organizativa de alumnos" -ProtectedFromAccidentalDeletion:$false
```
#### Modificar una unidad organizativa (`Set-ADOrganizationalUnit`)

El parámetro `-Identity` en este caso solo permite `Distinguished Name` y el `GUID`

```ps1
# Modificar una unidad organizativa
Set-ADOrganizationalUnit -Identity "OU=IES,DC=asix,DC=local" -Description "Unidad Organizativa para el IES"
# Modificar la protección contra eliminación accidental en una Unidad Organizativa
Set-ADOrganizationalUnit -Identity "OU=IES,DC=asix,DC=local" -ProtectedFromAccidentalDeletion:$false
```
#### Eliminar una unidad organizativa (`Remove-ADOrganizationalUnit`)
```ps1
#Eliminar una unidad organizativa y todo su contenido sin confirmación
Remove-ADOrganizationalUnit -Identity "OU=Alumnos,OU=IES,DC=asix,DC=local" -Recursive -Confirm:$false
```


### nmap scan...

```txt
PS C:\Users\Administrador> nmap -sV -p- localhost
Starting Nmap 7.94 ( https://nmap.org ) at 2024-04-20 23:14 Hora de verano romance
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00012s latency).
Other addresses for localhost (not scanned): ::1
Not shown: 65506 closed tcp ports (reset)
PORT      STATE    SERVICE       VERSION
22/tcp    open     ssh           OpenSSH for_Windows_8.1 (protocol 2.0)
53/tcp    open     domain        Simple DNS Plus
80/tcp    open     http          Microsoft IIS httpd 10.0
88/tcp    open     kerberos-sec  Microsoft Windows Kerberos (server time: 2024-04-20 21:14:30Z)
135/tcp   open     msrpc         Microsoft Windows RPC
137/tcp   filtered netbios-ns
389/tcp   open     ldap          Microsoft Windows Active Directory LDAP (Domain: asix.local0., Site: Default-First-Site-Name)
445/tcp   open     microsoft-ds?
464/tcp   open     kpasswd5?
593/tcp   open     ncacn_http    Microsoft Windows RPC over HTTP 1.0
636/tcp   open     tcpwrapped
3268/tcp  open     ldap          Microsoft Windows Active Directory LDAP (Domain: asix.local0., Site: Default-First-Site-Name)
3269/tcp  open     tcpwrapped
5357/tcp  open     http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
5985/tcp  open     http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
9389/tcp  open     mc-nmf        .NET Message Framing
47001/tcp open     http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
49664/tcp open     msrpc         Microsoft Windows RPC
49665/tcp open     msrpc         Microsoft Windows RPC
49666/tcp open     msrpc         Microsoft Windows RPC
49667/tcp open     msrpc         Microsoft Windows RPC
49668/tcp open     msrpc         Microsoft Windows RPC
55608/tcp open     ncacn_http    Microsoft Windows RPC over HTTP 1.0
55609/tcp open     msrpc         Microsoft Windows RPC
55612/tcp open     msrpc         Microsoft Windows RPC
55616/tcp open     msrpc         Microsoft Windows RPC
55617/tcp open     msrpc         Microsoft Windows RPC
55621/tcp open     msrpc         Microsoft Windows RPC
55636/tcp open     msrpc         Microsoft Windows RPC
Service Info: Host: ASO; OS: Windows; CPE: cpe:/o:microsoft:windows

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 64.20 seconds
```

### 2.4 Consultar objetos con `Search-ADAccount`

El cmdlet Search-ADAccount recupera una o más cuentas de usuario, equipo o servicio que cumplan con los criterios especificados a través de los parámetros. Los criterios de búsqueda incluyen el estado de la cuenta y la contraseña. Para obtener más información al respecto, debemos consultar `Get-Help Search- ADAccount -Examples`. Algunos ejemplos de uso con este cmdlet (`a02_teo_4.ps1`) serían los siguientes:

```ps1
# Obtener todas las cuentas deshabilitadas
Search-ADAccount -AccountDisabled -UsersOnly
#  Obtiene la cuenta del servicio de directorio con el password expirado
Search-ADAccount -PasswordExpired -UsersOnly
#  Obtiene la cuenta del servicio de directorio que ha expirado
Search-ADAccount -AccountExpired -UsersOnly
# Mostrar cuentas que venzan en la próxima semana
Search-ADAccount -AccountExpiring -TimeSpan (New-TimeSpan -Days 7 )
# Mostrar cuentas bloqueadas
Search-ADAccount -LockedOut
``` 


## 3. Administración de permisos

```md
Otra de las tareas que el Administrador del dominio debe realizar es la creación de carpetas y la asignación de permisos por grupo o por usuario, en función de las políticas de acceso que se manejen. Sin embargo, a la hora de crear un número elevado de carpetas, se hace necesario, una vez más, contar con un proceso que, además de eliminar errores, pueda automatizarse. 

En el presente apartado se estudia cómo podemos crear permisos y asignarlos a carpetas o archivos a través de cmdlets en PowerShell. El objetivo de este caso práctico consistirá en crear una estructura de carpetas de manera automatizada y haciendo uso de los cmdlets presentados.
```

- Permisos básicos|avanzados en NTFS:
  - Básicos

| Permiso         | Inglés          | Descripción
| ---             | ---             | ---
| Control total   | `FullControl`   | usuario puede modificar, agregar, mover y eliminar archivos\|directorios y propiedades\|permisos asociados
| Modificar       | `Modify`        | usuario ver y modificar archivos y propiedades <br>Incluye RAE+W+Delete
| Leer y ejecutar | `ReadAndExecute`| usuario puede leer y ejecutar archivos ejecutables eg. scripts
| Leer            | `Read`          | usuario peude ver arhivo\|propiedades\|directorios <br>Incluye ReadData+ReadExtendedAttributes+ReadAttributes+ReadPermissions
| Escribir        | `Write`         | usuario puede escribir en archivo y agregar archivos a directorios <br>Incluye WriteData+AppendData+WriteExtendedAttributes+WriteAttributes

-  - Avanzados

| Permiso                             | Inglés                            | Descripción
| ---                                 | ---                               | ---
| Atravesar carpetas/Ejecutar archivo | `Traverse`/`ExecuteFile`          | permite navegar carpetas (aun sin permisos explícitos sobre los mismos) y ejecutar ejecutables
| Mostrar carpeta/Leer datos          | `ListDirectory`/`ReadData`        | ver listas de archivos y subcarpetas dentro de carpeta, consultar archivos contenidos
| Leer atributos                      | `ReadAttributes`                  | ver atributos de archivo\|carpeta
| Escribir atributos                  | `WriteAttributes`                 | modificar atributos de archivo\|carpeta
| Leer atributos extendidos           | `ReadExtendedAttributes`          | ver atributos extendidos de archivo\|carpeta
| Escribir atributos extendidos       | `WriteExtendedAttributes`         | modificar atributos extendidos de archivo\|carpeta
| Crear archivos/Escribir datos       | `CreateFiles`/`WriteData`         | permite creación de archivos en carpeta, permite efectuar cambios en los mismos
| Crear carpetas/Anexar datos         | `CreateDirectories`/`AppendData`  | permite crear subcarpetas y agregar datos a un archivo pero no cambiar\|eliminar\|sobreescribir los datos del archivo
| Borrar                              | `Delete`                          | poder eliminar archivo\|carpeta
| Leer permisos                       | `ReadPermissions`                 | leer permisos de archivo\|carpeta
| Cambiar permisos                    | `ChangePermissions`               | cambiar permisos de archivo\|carpeta
| Adoptar la propiedad                | `TakeOwnership`                   | adoptar propiedad de archivo\|carpeta
| Sincronizar                         | `Synchronize`                     | 'permite que un hilo espere hasta que el objeto se encuentre en el estado señalado'

- 'A veces, encontramos los <u>permisos codificados</u> por el formato de su máscara de acceso'
  - GR==GenericRead
  - GW==GenericWrite
  - GE==GenericExecute
  - GA==GenericAll
  - AS==Right to Access SACL

```
Los 16 bits de orden bajo corresponden a derechos de acceso específicos de los objetos, los 8 bits siguientes son para los derechos de acceso estándar, que se aplican a la mayoría de los tipos de objetos, y los 4 bits de orden superior se usan para especificar derechos de acceso genérico que cada tipo de objeto puede asignar a un conjunto de derechos estándar y específicosd e objetos. Así, por ejemplo, podemos encontrar permisos convalores 268435456 o con permiso GA activado (para un control total).
```

<table><head><tr>
<th>31<th>30<th>29<th>28<th>27<th>26<th>25<th>24<th>23<th>22<th>21<th>20<th>19<th>18<th>17<th>16<th>15<th>14<th>13<th>12<th>11<th>10<th>9<th>8<th>7<th>6<th>5<th>4<th>3<th>2<th>1
</tr></head><body><tr>
<td>GR<td>GW<td>GE<td>GA<td colspan=3>Reservado<td>AS<td colspan=8>Permisos estándar de acceso<td colspan=15>Permisos de acecso específicos de cada objeto
</tr></body></table>


- **<u>Permisos herededos en NTFS</u>**:

| Objeto                              | Herencia                                                                  | Descripción
| ---                                 | ---                                                                       | ---
| Esta carpeta                        | `none`                                                                    | no se propaga la herencia
| Esta carpeta, subcarpeta y archivos | `ContainerInherit`, `ObjectInherit`                                       | la herencia se propaga a subcarpetas y archivos
| Esta carpeta y subcarpeta           | `ContainerInherit`                                                        | la herencia se propaga a las subcarpetas
| Solo subcarpetas y archivos         | `ContainerInherit`, `ObjectInherit`, `InheritOnly` en `PropagationFlags`  | la herencia se propaga a las subcarpetas y archivos
| Solo subcarpetas                    | `ContainerInherit`, `InheritOnly` en `PropagationFlags`                   | la herencia se propaga a las subcarpetas
| Solo archivos                       | `ObjectInherit`, `InheritOnly` en `PropagationFlags`                      | la herencia se propaga solo a los archivos

- - En ocasiones se puede eliminar esta herencia de permisos; 3 maneras:
    - Eliminar la herencia a nivel de la carpeta superior: los objetos contenidos en ella dejan de heredar los permisos
    - Eliminar la herencia a nivel de una subcarpeta o del archivo contenido dentro del recurso principal
    - Permitir o denegar explícitamente un permiso de manera diferente a como está definido en el recurso contenedor

### 3.1 Obtener permisos (`Get-Acl`)


La propiedad **Access** es una lista de objetos de tipo `FileSystemAccessRule`. Como se observa, los admi- nistradores tendrán permisos de control total en esa carpeta, esas subcarpetas y esos archivos. Para los usua- rios, encontramos varias ACL: Lectura y Ejecución en esa carpeta, esa subcarpeta y esos archivos; en otra ACL, para crear carpetas o anexar datos a esta carpeta o estas subcarpetas; y finalmente, crear archivos o escribir datos, que afecta solo a las subcarpetas.

```ps1
# Obtener todas las propiedades de la unidad c:
Get-ACL -Path c:\ | fl *
# Obtener los permisos de la unidad C:
Get-ACL -Path C:\ | Select-Object -ExpandProperty Access | ft -AutoSize
```
- [ ] AD: carpeta `C:\Empresa_users` para OU

<!-- ```ps1
### CUSTOM!!
$directoryPath = "C:\Empresa_users"
$groupSID = (Get-ADGroup -Filter "Name -eq 'Empresa'").SID.Value

New-Item -ItemType Directory -Path "C:\Empresa_users"
TakeOwn /F $directoryPath /A /R /D Y
icacls $directoryPath /grant "$groupSID:F" /T /C
  # Grant full control permissions to the "Empresa" group
``` -->
```ps1
# ...
New-Item -ItemType Directory -Path "C:\Empresa_users"

# Obtener los permisos de la carpeta c:\Empresa_users
Get-ACL -Path C:\Empresa_users | Select-Object -ExpandProperty Access | ft -AutoSize
```


### 3.2 Clase `FileSystemAccessRule (System.Security.AccessControl)`


Representa una abstracción de una entrada de control de acceso (ACE) que define una regla de acceso para un archivo o directorio. Entre sus constructores, tenemos lo siguiente:

```cpp
FileSystemAccessRule (IdentityReference,FileSystemRights, InheritanceFlags, PropagationFlags, AccessControlType)
```
Inicializa una nueva instancia de la clase **FileSystemAccessRule** utilizando una referencia a una cuenta de usuario, un valor que especifica el tipo de operación asociado a la regla de acceso, un valor que determina cómo se heredan los derechos, un valor que determina cómo se propagan los derechos y un valor que especifica si se va a permitir o denegar la operación.

Por ejemplo, si quisiéramos crear una ACE para que el grupo Empresa tenga permisos de lectura y ejecución para esta carpeta, esta subcarpeta y estos archivos, crearíamos el primero de los siguientes objetos. O, por ejemplo, podemos solicitar que el usuario *aaparicio* goce de control total para esta carpeta, estas subcarpetas y estos archivos.

```ps1
# Crear objetos FileSystemAccessRule
New-Object System.Security.AccessControl.FileSystemAccessRule("Empresa","ReadAndExecute", "ContainerInherit, ObjectInherit", "none", "Allow")
New-Object System.Security.AccessControl.FileSystemAccessRule("aaparicio","FullControl", "ContainerInherit, ObjectInherit", "none", "Allow")
```


### 3.3 Método `setAccessRuleProtection(Boolean,Boolean)`

- Establece o retira la protección de las reglas de acceso asociadas al objeto `ObjectSecurity`. Los objetos primarios no pueden modificar las reglas de acceso protegido a través de la herencia. Los parámetros de este método son:
  - **isprotected**: `true` para proteger las reglas de acceso asociadas a este objeto **ObjectSecurity** de la herencia; `false` para permitir la herencia.
  - **preserveInheritance**: `true` para conservar las reglas de acceso heredas; `false` para retirar las reglas de acceso heredadas. Este parámetro se ignora si isProtected es "`false`".
-  Por ejemplo, para eliminar la herencia y todos los permisos de la carpeta `C:\aso` (a03_teo_3.ps1), debemos hacer lo siguiente:

```ps1
# Eliminar herencia
mkdir c:\aso
$acl = Get-Acl -Path C:\aso
$acl.SetAccessRuleProtection($true,$false)
Set-Acl -Path C:\aso -AclObject $acl

# Get-ACL -Path C:\aso
```

### 3.4 Método `AddAccessRule(FileSystemAcessRule)`


Añade los permisos de la lista de control de acceso sobre el fichero o directorio correspondiente. Para hacer persistente el cambio, es necesario utilizar cmdlet `Set-Acl`. Por ejemplo, los siguientes cmdlets añaden dos ACL: una para los **Administradores** con permisos de **Control Total** aplicado a esta carpeta, estas sub- carpetas y estos archivos, así como otra para el grupo **Empresa** con permisos de Lectura y Ejecución aplicado a esta carpeta.

```ps1
# Añadir permisos 
$acl = Get-Acl C:\Empresa_users
$acl.SetAccessRuleProtection($true, $false)
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Administradores","FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")
$acl.AddAccessRule($rule)
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule("Empresa","ReadAndExecute", "None", "None", "Allow")
$acl.AddAccessRule($rule)
```

### 3.5 Modificar permisos (`Set-Acl`)

Para hacer persistentes los permisos de una carpeta o un archivo utilizaremos el cmdlet Set-Ac1. Podemos obtener más información al respecto sin más que consultar Get-Help Set-Acl -Examples. Por ejemplo, para hacer persistentes las ACL que hemos visto en el apartado anterior (a03_teo_4.ps1), haríamos lo siguiente:

```ps1
Set-Acl -path C:\Empresa_users -AclObject $(Get-Acl C:\Empresa_users)
# Set-Acl -path C:\Empresa_users -AclObject $acl
```
El parámetro -Aclobject especifica la ACL correspondiente.


## 4. Directivas de grupos y perfiles

```md
Las directivas de grupo son un conjunto de reglas que controlan el entorno de trabajo de las cuentas de usuario y de las cuentas de equipo, permiten la gestión centralizada y la configuración de sistemas operativos o aplicaciones y facilitan la configuración de los usuarios dentro de un entorno de Active Directory. En otras palabras: la Directiva de grupo controla todo aquello que los usuarios pueden y no pueden hacer en un sistema informático.
Otro punto de administración importante en este sentido son los perfiles de usuario. Estos definen un entorno de escritorio personalizado en el que se incluye la configuración individual de la pantalla, así como las conexiones de red, las impresoras y los recursos compartidos.
```

- **Directivas de grupo (Group Policy)**: configuraciones creadas por el administrador que se aplican a objetos del dominio para controlar los entornos de trabajo de los usuarios del dominio, los equipos y el comportamiento de distintos objetos. <!--Conjunto de reglas que facilitan las labores de administración de los usuarios y equipos.-->
- Algunos de los aspectos más útiles que se pueden definir por parte del administrador mediante las directivas son:
  - Los comandos de inicio de sesión.
  - Las características de las directivas de seguridad de las cuentas de usuario.
  - La configuración de la apariencia de la sesión de usuario.
  - La redirección del acceso a ciertas carpetas o archivos centralizados.
  - La distribución de software a los equipos clientes.
  - Los permisos otorgados a las cuentas de usuarios y grupos, etc.

### 4.1 Default Domain Policty

- En este apartado, veremos lso cmdlets que permiten consultar y modificar la directiva predeterminada de contraseñas en la estructura de Active Directory

#### Cmdlet `Get-ADDefaultDomainPasswordPolicy`

- Consultar la política de contraseñas predeterminada para un dominio:

```ps1
Get-ADDefaultDomainPasswordPolicy
```

#### Cmdlet `Set-ADDefaultDomainPasswordPolicy`

- Modificar la política de contraseñas predeterminada: `Set-ADDefaultDomainPasswordPolicy`
- Por ejemplo, el siguiente cmdlet modificará a cinco caracteres la longitud mínima de la contraseña, a 30 minutos la duración del bloqueo, restablecerá el bloqueo de la cuenta una vez transcurridos 20 minutos, fijará el número de intentos fallidos en cuatro, dejará de considerar necesario que se cumplan los requisitos de complejidad y exigirá que la contraseña caduque pasados 30 días:

```ps1
Set-ADDefaultDomainPasswordPolicy -Identity asix.local `
  -MinPasswordLength 5 -LockoutDuration 00:30:00 -LockoutObservationWindow 00:20:00 -LockoutThreshold 4 `
  -ComplexityEnabled $False -ReversibleEncryptionEnabled $False -MaxPasswordAge 30.00:00:00 
```
- Propiedades más comunes:

| Propiedad                   | Descripción
| ---                         | ---
| ComplexityEnabled           | permite habilitar la complejidad de la contraseña
| LockoutDuration             |  duración del bloqueo después de alcanzar el número máximo de intentos de inicio de sesión
| LockoutObservationWindow    | tiempo de restablecimiento de bloqueo de la cuenta
| LockoutThreshold            | número de intentos de inicio de sesión
| MaxPasswordAge              | vigencia máxima de la contraseña
| MinPasswordAge              | vigencia mínima de la contraseña
| MinPasswordLength           | número de caracteres mínimos de la contraseña
| PasswordHistoryCount        | establece el número de contraseñas almacenadas
| ReversibleEncryptionEnabled | establece las contraseñas con cifrado reversible o no

### 4.2 Consultar directivas de grupo

- Cuando se pone en marcha un dominio, se crean dos directivas de grupo que establecen la configuración básica de los objetos del dominio y están vinculadas respectivamente a:
  - *Default Domain Controllers Policy*: la unidad organizativa Domain Controllers
  - *Default Domain Policy*: el dominio

#### Cmdlet `Get-Gpo`

- El cmdlet `Get-GPO` obtiene 1|n Objeto de Directiva de Grupo (GPD) del dominio. Se puede especificar por nombre o GUID.

```ps1
# Obtener todas las directivas
Get-GPO -All
# Obtener una GPO por nombre
Get-GPO -Name "Default Domain Policy"
```

#### Cmdlet `Get-GpoReport`

- El cmdlet `Get-GPOReport` genera un informe en formato XML o HTML que describe las propiedades y la configuración de políticas para 1|n GPO.

```ps1
# Generar un informe para una GPO
Get-GPOReport -Name "Default Domain Policy" -ReportType HTML -Path z:\GPO.html
```
 
### 4.3 Crear directivas de grupo

- Objetivo: centralizar y configurar de manera personalizada los usuarios|sistemas|aplicaciones de nuestro AD.

#### Cmdlet `New-Gpo`

- El cmdlet `New-GPO` crea un GPO con un nombre específico. De forma predeterminada, NO estará vinculado a un sitio|dominio|OU.

```ps1
# Crear una GPO
New-GPO -Name "GPO OU IES" -Comment "GPO para la OU IES" 
```

#### Cmdlet `New-GpLink`

- El cmdlet `New-GPLink` vincula un GPO a un sitio|dominio|OU

```ps1
# Vincular una GPO a una OU
New-GPLink -Name "GPO OU IES" -Target "OU=IES, DC=ASIX, DC=LOCAL" -LinkEnabled Yes
# Consular la GPO en IES (LinkedGroupOlicyObjects)
Get-ADOrganizationalUnit -Identity "OU=IES, DC=ASIX, DC=LOCAL"

# Remove-GPO
# Remove-GPLink
```

### 4.4 Personalización de directivas de grupo

```yaml
Administracion de directivas de grupo:
  Bosque asix.local: Dominios: asix.local:
    IES: GPO OU IES: editar

Directiva GPO OU IES _ASO.ASIX.LOCAL_:
  Configuracion de usuario: Directivas: Plantillas administrativas:
    - Impedir el acceso al simbolo del sistema: Habilitada
    - Impedir el acceso a herramientas de edicion del Registro: Habilitada

# $ gpupdate /force
```

### 4.5 Perfiles de usuario

- Definen un entorno de escritorio personalizado en el que incluye la configuración individual de la pantalla, así como las conexiones de red, impresoras y otros recursos compartidos

#### Carpeta particular

- Carpeta compartida y con permiso de escritura para el usuario; cuando el usuario inice sesión desde una máquina cliente, se conectará una unidad de red con ese recurso compartido. Por ejemplo, el siguiente cmdlet asigna al usuario Andrea su carpeta particular (previamente hay que compartir el recurso con los permisos correspondientes, en este caso se comparte `Empresa_users` con permisos de acceso para todos los usuarios del grupo `Empresa`)

```ps1
# Asignar una carpeta particular a un usuario
Set-ADUser -Identity "CN=Andrea,OU=PRODUCCION,OU=Empresa,DC=asix,DC=local" -HomeDrive "Z:" -HomeDirectory "\\aso.asix.local\Empresa_users\andrea"  
```

#### Scripts de inicio de sesión

- Otra opción es el script que se ejecutará en cada inicio de sesión, que debe hallarse en la carpeta compartida **NETLOGON** (cuya dirección local en el controlador de dominio es `C:\Windows\SYSVOL\sysvol\asix.local\scripts`):

```bat
if NOT EXIST X: net use X: \\asix.local\Empresa
msg %username% Recuerda guardar los datos en las unidades X: o Z:
```

- Supongamos que queremos enviar un mensaje a los usuarios cuando se conecten al sistema, tipo "Guarda los datos en red" o "No instales software sin permiso del administrador", o avisare de paradas previstas del sistema.


```ps1
# Asignar una script de inicio de sesión a un usuario
Set-ADUser -Identity "CN=Andrea,OU=PRODUCCION,OU=Empresa,DC=asix,DC=local" -ScriptPath "empresa.bat"  
```

#### Perfiles móviles

- Permiten al usuario configurar el entorno de trabajo a su gusto dentro de un equipo. Al iniciiar sesión en cualquier otra máquina del dominio, la configuración se importa y aplica a ese nuevo equipo (si es mucha carga puede degradar el rendimiento de la red).
- En nuestro caso, almacenaremos los perfiles de cada usuario en una carpeta de perfil, que crearemos dentro de las carpetas particulares de los usuarios.
<!-- - En este ejemplo, el usuario Andrea tendrá la misma configuración independientemente de la máquina desde la que se conecte -->

```ps1
# Configurar un perfil móvil
Set-ADUser -Identity "CN=Andrea,OU=PRODUCCION,OU=Empresa,DC=asix,DC=local" -ProfilePath "\\aso.asix.local\Empresa_users\andrea\perfil"  
```
