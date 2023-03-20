# ISO UD5 Admon Informacion (Apuntes)


## ud5-teoria + ud5-presentacion

```markdown
# Index
1. Sistemas de archivos [SDA]
   1. Tipos de SDA
   2. Modelos de los SDA
2. Los archivos y directorios
3. Estructura de directorios (Linux)
4. Operaciones sobre archivos
5. ~~Comandos Windows (Gestión Archivos)~~
6. Administración de discos duros [DD]
   1. Formato de DD
   2. Particionado de DD
   3. Reglas de particionado (MBR & GPT)
7. Herramientas de administración de DD
8. Admon. discos básicos
9. Admon. discos dinámicos
10. Gestión volumen simple
11. Gestión volúmenes distribuidos
12. Gestión volúmenes seccionados
13. Gestión volúmenes reflejados
14. Gestión RAID-5
15. Copias de seguridad; tipos y planes
16. Cuotas de disco: niveles de cuota y de advertencia
```

> @RedHat: [FileSystems](https://web.mit.edu/rhel-doc/5/RHEL-5-manual/Deployment_Guide-en-US/pt-filesystems.html) <!--(Red Hat Enterprise Linux Deployment Guide, 2006)-->
>
> @wikigain: [How to Configure RAID in Windows 11?](https://www.wikigain.com/configure-raid-in-windows-11/)

1. **Sistemas de archivos [SDA]**
    - *Def:* determinan [ENFUP] estructura - nombre - formaDeAcceso - uso - protección ... de datos almacenados // en DiscosDuros, USBs, DVDs...
    - *Objetivos:* orgLógicaSectoresFísicos, estructuraJerárquica, capacidadCrearEditarEliminar, seguridad+disponibilidad, UX
    - DivisionesLógicas MedioFísico == **PARTICIONES** (w/ propio SDA via *FORMATEO*)
   2. **TIPOS**
       - INTRO
         - archivo == bloques/clusters // sistema == REGISTRO BLOQUE + SECTORES (eg. 512b 1kb 2kb)
         - *Técnicas asignación:* AsignaciónAdyacente(fragmentación), ListaEnlazada(nextVSnull), ListaIndexada(mejorPeroMeh), Ínodo(UNIX-metainfo)
         - directorio == archivo contenido=ListaEnlazada(padre,self,hijos)
       - **Familia Windows**
         - *FAT:* <!--File Allocation Table--> dispositivosPequeños, ListaIndexada, pocaSeguridad; TABLA-Clusters: siguienteBloque, EOF, libre, defectuoso
         - *NTFS:* <!--NT File System--> nombres255chars(!(`?"/\<>*|:`)),  registroTransaccional(Journaling)<!--allChangesRegistered-->, ACL+cifrado+compresión(Permisos), archivo16TB-volumen264TB, CUOTAS-disco
         - *ReFS*
       - **Familia Apple** // ~~MFS, HFS, HFS+~~ // *APFS:* (10.2/Sierra+) OK SSD
       - **Familia GNU/Linux** // ~~ext2, ext3; ZFS~~ // *ext4:* Journaling+Extents; archivo16TB-volumen1EB
   3. **MODELOS**
       - *SDA Transaccionales:* (TRANSACCION=bloqueOperaciones) commitVSrollback, **COW**(~~sobreescribir~~) // EstadoDiscoOK, CopiasSeguridad, DeshacerModificaciones
       - *SDA Distribuidos:* árbolFicherosLÓGICO, RED-CarpetasCompartidas-Servidor
       - *SDA Encriptación:* segúnAuth+
       - *SDA Virtuales:* puenteOSs; formatosExclusivos (eg. VBox DD...)
2. **Los archivos y directorios**
    - *Archivo:* bits + nombre + path // `nombre.extensión`
    - *Directorio:* contenedor archivos/subdirectorios // directorios RAÍZ (`K:\ || /`) == Jerarquía/Org.lógica
    - **Atributos && Permisos** -- S H R *A* Fecha Hora Tamaño
    - TIPOS == Ejecutables VS Datos
3. **Estructura de directorios**
   1. **C:\\**
       - *Windows:* System32 Boot Help PolicyDefinitions Fonts Temp (...)
       - Archivos de programa + Archivos de Programa (x86)
       - PerfLogs + Usuarios(Default,Public,Users...)
   2. **Linux (FHS)**
      - /bin /sbin /boot /dev /etc /home /lib /mnt /media /opt */proc* /root /tmp **/usr** /var
    - *Concepto de RUTA:* absoluta VS relativa // `.` vs `..` vs `\ || /` <!--árbol de directorios-->
4. Operaciones sobre archivos (CLI vs GUI) 
    - Crear - Eliminar - ModificarPropiedades - CortarCopiarPegar - Enlazar - Encriptar - Comprimir <!--ZIP vs TAR-->
    - [ComandosPS101.ps1](/ISO/UD5-AdmonInformacion/docs/comandosPS101.ps1)
5. Admon. Discos Duros [DD]
   1. **PARTICIONADO** <!--Windows11 tools: search 'particiones' o 'GPT'-->
      - Divisiones Lógicas Independientes (sobre la que se puede montar un SistemaDeArchivos)
      - MODOS: `GPT` `MBR` `APM`
   2. **FORMATEADO:** implantar SistemaDeArchivos sobre Particiones
   3. Reglas de particionado
      1. `MBR`: BIOS-based, 2TBmaxDisco
          - 1ºSectorDisco == TablaDeParticiones (4registros == 4particionesPrimarias MAX || 3+1extendida = * lógicas)
          - MasterBootRecord (ie. SectorArranque) == 1ºSectorDisco // lee TDP y cede control a *ParticiónActiva* (PA == OS) <!--whether Primaria o Lógica-->
          - 3 TiposParticiones: primaria + extendida + lógica(23max,)
      2. `GPT`: <!--GUID Partition Table--> UEFI-based, 256TBmax
          - 128particionesPrimariasMax // direccionamiento *LBA* (Logical Block Addressing)
          - ParticionesPrimarias nomenclatura (Windows VS Linux)
6. Herramientas Admon. DD
    - **Windows:** `diskpart` CLI vs GUI `diskmgmt.msc`
    - *D.Básicos VS D.Dinámicos:* Dinámicos == admite gran cantidad volúmenes // Conversión OK
    - **VOLUMEN** == 'área almacenamiento con un único SDA almacenado en una o más o particiones'
    - **ORGANIZACIÓN DD:** ConjuntoVolúmenes - ConjuntoEspejos - ConjuntoBandas - SinParidad - ConParidad
    - **RAID:** RAID0 - RAID1 - RAID5
7. ~~NULL~~
8. Admon. discos...
   1. básicos (How-To)
   2.  Admon. discos dinámicos (How-To // volumen simple -> sistema multidisco RAID)
   3.  Gestión volumen simple (How-To // —if NTFS— crear extender reducir)
   4.  Gestión volúmenes distribuidos
        - Vol Distribuido == vol Dinámico en 2~32 DiscosFísicosDinámicos // NO-TOLERANTE-A-ERRORES // —if admin—
   5.  Gestión volúmenes seccionados (RAID 0 *DINÁMICO* // NO extender/reducir)
   6.  Gestión volúmenes reflejados (RAID 1 *DINÁMICO* //  NO e/r)
   7.  Gestión RAID-5 (How-To // crear reparar reemplazar)
   8.  Montaje/Desmontaje Particiones
9.  **Copias Seguridad**; tipos y planes
     - *MÉTODOS:* completa - diferencial - incremental // diara=archivosMods semanal=sistema mensual=archivosSinMod
     - *Windows* == copiaSegArchivos && CopiaSegImagenSistema ... `ControlPanel>FileHistory`
10. Cuotas de disco: niveles de cuota y de advertencia
     - Admin capacidad disco/usuario (partición Datos)



```powershell
    # using VSCode PowerShell extension for grammar checks
# 4. Operaciones sobre los archivos -- Windows PowerShell
Set-Location ~                                  # cd
Get-ChildItem                                   # dir || ls
mkdir testAsir      # (*)
    cd testAsir

New-Item helloWorld.txt
Write-Output "Hello, World!" > helloWorld.txt   # echo
Get-Content helloWorld.txt                      # type || cat
Copy-Item helloWorld.txt copyWorld.txt          # cp
Rename-Item copyWorld.txt deleteCopy.txt        # mv
Move-Item deleteCopy.txt ..
Remove-Item ../deleteCopy.txt                   # rm

attrib helloWorld.txt
Start-Process https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/attrib

cd ..
rm testAsir -recurse

# (*)
New-Item -ItemType Directory -Path "C:\Some\Path\That\Doesnt\Exist" -Force
```

<details>
<summary>ChatGPT on `||`</summary>

```markdown
# Can I use '||' in powershell?

- In PowerShell, the `||` operator is not used for the same purpose as it is in Bash.
- In Bash, the `||` operator is used to execute the second command only if the first command fails (i.e., returns a non-zero exit code). This can be useful for error handling and conditional execution of commands.
- In PowerShell, the equivalent operator for this purpose is `-ErrorAction Stop`. Here's an example:

`Get-ChildItem C:\Some\Directory -ErrorAction Stop || Write-Host "An error occurred"`

- This PowerShell command will attempt to retrieve the child items of the directory `C:\Some\Directory`. If an error occurs, PowerShell will stop processing the pipeline and the `Write-Host` cmdlet will execute, displaying the message "An error occurred".
- Note that the `||` operator is not used in PowerShell for conditional execution of commands. Instead, PowerShell uses the if statement or the switch statement for conditional logic.
```

</details>