# Sistemas - Resumen Total

<details>
<summary>Table of Contents</summary>

- [Sistemas - Resumen Total](#sistemas---resumen-total)
  - [101](#101)
  - [UD1: Introducción a los OSs](#ud1-introducción-a-los-oss)
    - [1. Intro](#1-intro)
    - [2. Gestión de Procesos](#2-gestión-de-procesos)
    - [3. Gestión de Memoria](#3-gestión-de-memoria)
  - [UD2: Máquinas Virtuales](#ud2-máquinas-virtuales)
  - [UD3: Instalación OSs Propietarios](#ud3-instalación-oss-propietarios)
  - [UD4: Admin OSs Propietarios](#ud4-admin-oss-propietarios)
    - [1. Intro: cuentas de usuario \& grupos locales](#1-intro-cuentas-de-usuario--grupos-locales)
    - [2. Gestión usuarios/grupos locales](#2-gestión-usuariosgrupos-locales)
    - [3. Directivas de Seguridad Local (`gpedit.msc` \> `secpol.msc`)](#3-directivas-de-seguridad-local-gpeditmsc--secpolmsc)
    - [4. Seguridad de Recursos a nivel local](#4-seguridad-de-recursos-a-nivel-local)
  - [UD5: Aministración Información](#ud5-aministración-información)
    - [1. Sistemas de archivos](#1-sistemas-de-archivos)
    - [2. Archivos \& Estructura Directorios](#2-archivos--estructura-directorios)
    - [3. Particionado Discos](#3-particionado-discos)
      - [3.1 Particionado MBR](#31-particionado-mbr)
      - [3.2 Particionado GPT](#32-particionado-gpt)
    - [4. Administración Discos](#4-administración-discos)
  - [UD6: Administración Dominio](#ud6-administración-dominio)
  - [UD7: Administración Acceso Dominio](#ud7-administración-acceso-dominio)
  - [UD8: Linux: Intro](#ud8-linux-intro)
  - [UD9: Linux: usuarios, grupos y permisos](#ud9-linux-usuarios-grupos-y-permisos)

</details>

## 101

<!-- - **sistemas archivos (ud1):** ... -->
- **gestión arranque (ud1):** botón > POST > gestorArranque > OS
- **proceso arranque (ud3):** botón > BIOS: POST > gestorArranque (512bytes MBR) > OS
- **usuarios/permisos linux (ud4)**: ...
- 

<hr>

## UD1: Introducción a los OSs

### 1. Intro

- **Sistema Operativo:** conjunto de programas, servicios y funciones que gestiona y coordina el funcionamiento de todos los recursos hardware y software del sistema informático.
- **Evolución:** procesoSerie (conmutadores) > procesoLotes (tarjetasPerforadas) > multiprogramación/multitarea > sistemaTiempoCompartido
- **Clasificación según...**
  - *Estructura:* monolítica (1programa) | jerárquica | máquinaVirtual
  - *ModoExplotación:* procesamientoLotes | tiempoCompartido (competición/quantum) | tiempoReal (!)
  - *NumUsuarios:* monousuario | multiusuario
  - *NumProcesos:* monotarea | multitarea
  - *NumProcesadores:* monoproceso | multiproceso (simétrica|asimétrica) <!--(Un proceso varios procesadores = varios threads)-->
  - *OfertaServicios:* centralizados | de red | distribuidos (virtual, eg. MOSIX)
  - *Disponibilidad:* propietarios | libres (uso,estudioCódigo,distribuir,mejorarPublicar)
- **Funciones:** gestiónProcesos, gestiónMemoria, gestiónIO, gestiónSistemaArchivos, controlSeguridad

### 2. Gestión de Procesos

<!-- > Un proceso es un programa en ejecución cuyas instrucciones se encuentran total o parcialmente cargadas en la memoria principal. Por tanto, un programa, antes de ser ejecutado, no es más que un fichero o un conjunto de ficheros almacenados en la memoria secundaria (en el disco duro por lo general). En el momento en que se ordena su ejecución pasa a cargarse en memoria y a consituirse un proceso. Cada ejecución, por otro lado, constituye un proceso diferente.
-->

- **Definiciones:**
  - *Programa:* (memoriaSecundaria) secuencia de instrucciones predefinidas que pueden ser ejecutadas por un procesador
  - *Proceso:* (memoriaPrincipal) secuencia de acciones derivadas de la ejecución de un programa
  - *Thread:* parte independiente de un proceso
- **Tipos Procesos:**
    - monohilo | multihilo
    - sistema | usuario
    - interactivo | segundoPlano (daemon|servicio)
    - independientes | cooperativos | competitivos
- **Bloque de Control de Procesos:**
  - *Estado:* nuevo > preparado > enEjecución > bloqueado | suspendido > terminado | zombie
  - *PID + PPID*
  - *Propietario*
  - *Prioridad*
  - *Dirección memoria*
  - *Estado hardware...*
- **Algoritmos Planificación:**
  - *FCFS|FIFO:* sencillo, ineficaz
  - *PorPrioridades:* peligro BajaPrioridad esperan mucho
  - *SJF:* peligro procesosLargos esperan mucho
  - *RR:* bucle preparado>ejecución según quantum (ms)

### 3. Gestión de Memoria

- **Desafíos:** reubicación, protección, compartición, organizaciónLógica, organizaciónFísica
- **Tácticas:**
  - *Paginación:* memoriaFísica > frames, memoriaLógica > páginas; 1 página 1 frame discontinuo (TablaPaginación); fragmentaciónInterna
  - *Segmentación:* 1 proceso * segmentos discontinuos; fragmentaciónExterna
  - *MemoriaVirtual:* espacio DiscoDuro proceso no-ejecución; fake RAM, traducciónDirecciones
  - *Swapping:* espacio DiscoDuro proceso no-ejecución; ?

<hr>

## UD2: Máquinas Virtuales

- VDI vs VMDK vs VHD
- **Conexiones de Red en Hipervisor:**
  - *Comunicación NAT:* guest via host IP, no independiente
  - *Comunicación Bridge:* host proporciona adapatadorRed a guest, independiente
  - *Comounicación host-only:* red en host, no internet para VMs

<hr>

## UD3: Instalación OSs Propietarios

- **Consideraciones previas:** hardware...
- **Proceso instalación:** ...
- **Actualizaciones:** mejoran rendimiento y seguridad, optimizan gestiónRecursos y resuelven vulnerabilidades // WindowsUpdate
- **Registro/`regedit`:**
  - BaseDatos jerárquica: config sistema/apps/usuario
  - *HKCR:* archivos... (hkey_classes_root)
  - *HKLM:* hardware, programas instalados (local_machine)
  - *HKCC:* dispositivos... (current_config)
  - *HKU:* todos usuarios (user)
  - *HKCU:* detalles usuario actual (current_user)

<hr>

## UD4: Admin OSs Propietarios

### 1. Intro: cuentas de usuario & grupos locales

- **Cuenta Usuario:** información que indica al OS los archivos y carpetas a los que puede tener acceso dicho usuario, los cambios que puede realizar en el equipo, preferencias personales....
  - *Autenticación* (`SID` login) VS *Autorización*  (permisos/usuario) <!--(SID: código asociado por sistema a cuenta durante creación)-->
  - **Tipos:** estándar|admin|(invitado), local|deRed
- **Grupos locales predeterminados:**
  - *Administradores:* autorización total
  - *Invitados:* mismo acceso, menos permisos que Usuarios
  - *Usuarios*: no pueden hacer cambios 
  - *Usuarios avanzados*: derechos limitados, existen por compatibilidad con anteriores versiones de Windows
  - **Otros:** Lectores del registro de eventos, Operadores de config. de red, Operadores de copia de seguridad, Usuarios de escritorio remoto, Usuarios COM distribuidos, Usuarios del monitor del sistema, Usuarios del registro de rendimiento...

### 2. Gestión usuarios/grupos locales

- **Creación usuarios locales:** `lusrmgr.msc`
  - *Contraseña:* cambiarLogin | noPuedeCambiar | nuncaExpira | cuentaDeshabilitada
- **Creación grupos locales:** `lusrmgr.msc`
  - 1\. Crear Grupo, 2. Agregar Usuarios a Grupo
- **Seguridad:**
  - `User Account Control`: *4 niveles:* notificar siempre / cuando apps hacen cambios / x / nunca
    <!-- - `gpedit.msc` OK -->

### 3. Directivas de Seguridad Local (`gpedit.msc` > `secpol.msc`)

- **Objetivos:**
  1. Aplicar restricciones de seguridad sobre cuentas de usuario y contraseñas.
  2. Configurar equipos de forma local/remota, instalar/eliminar aplicaciones, restringir permisos usuarios, etc.
- **Directivas importantes:** 
  - *Contraseñas:* historialContraseñas, complejidad, longitudMínima, vigenciaMáxima
  - *Bloqueo de cuenta*: umbral, duración, restablecimiento
  - *Kerberos:* restricciones, vigencias vales, tolerancia...

### 4. Seguridad de Recursos a nivel local

- **Definiciones:**
  - *Recurso:* elemento del sistema a disposición del usuario (eg. archivo, carpeta, impresora, conexiónRed)
  - *Permiso:* regla asociada a recurso que regula los usuarios/grupos que pueden acceder y la forma en la que acceden (eg. leer, modificar, cambiarPropietario, eliminar)
  - *DerechosConexión/Privilegios:* otorgan al usuario/grupo la capacidad de llevar a cabo determinadas acciones sobre el sistema (eg. denegarAccesoRed, permitirInicioSesiónLocal, agregarEstacionesTrabajoAlDominio, hacerCopiasSeguridadArchivos, restaurarArchivos, cambiarHoraSistema, apagarEquipo)
<!-- - SAT -->
- **Permisos NFTS:**
  - *todo archivo/directorio tiene asociados:*
    - SID propietario,
    - permisos [ACL](https://learn.microsoft.com/en-us/windows/win32/secauthz/access-control-lists) de protección,
    - ACL seguridad/auditorías?
  - *características:*
    - herenciaPredeterminada,
    - acumulativos(prevalecePermisoMásEstricto)
  - *tipos:*
    - **especiales**: recorrerCarpetas, ejecutarArchivo, leerDatos, atributosLectura, crearArchivos, crearCarpetas, escribirDatos, atributosEscritura, eliminar, cambiarPermisos...
    - **estándar** (predefinidos): controlTotal, lecturaEjecución, modificar, lectura, escritura, mostrarContenido
  - *según herencia:* explícitos VS heredados
  - *propiedad:* propietario gestiona permisos, propietario puede cambiar


<hr>

## UD5: Aministración Información

### 1. Sistemas de archivos

- **Definición:** determina la estructura, nombre, forma de acceso, uso y protección de los datos.
- **Objetivos:** permitirManejoArchivos, organizaciónLógicaSectoresDisco, asignarControlarEspacioAsignado, mecanismosEdiciónDatos, mantenerEstructuraJerárquica, controlAccesoSeguro
- *NOTAS:*
  - "Un discoDuro se puede dividir en varias partes lógicas denominadas particiones. Cada partición tiene su propio sistema de archivos. Formatearlas es asignares un sistema de archivos."
  - "Un archivo es una secuencia de bloques (512b|1kb|2kb), alojados en sectores de espacio en disco. Importante registro de bloques asociados a cada archivo."
- **Técnicas manejo bloques:** AsignaciónAdyacente (fragmentación), AsinaciónListaEnlazada+Índice (tablaRegistrosMemoria:pointToNext|NULL), Inodos (metadatosArchivo, directoriosArchivoInodos[self,padre,hijos])
- **Tipos:**
  - *FAT:* asignaciónIndexada, lentitud, pocosPermisosSeguridad; Tabla:dirNext|EOF|free|corrupt, maxFilesize=4GB
  - *NTFS:* Windows, registroTransaccional(Journaling), admiteCuotasDisco, maxFilesize=16GB
  - *ReFS:* ...
  - *Apple:* ...
  - *Linux' ext4:* maxFilesize=16TB
- **Modelos:**
  - *Transaccionales:* "transacción: operaciones ejecutadas en bloque=commit|rollback"; COW=copyOnWrite <!--(tempFilePreSave)-->
  - *Distribuidos:* fácil acceso a información mediante árbol ficheros
  - *Virtuales VFS:* ...

### 2. Archivos & Estructura Directorios

- **Conceptos:**
  - *Archivo:* conjunto de bits asociados a un nombre (+ruta)
  - *Directorio:* contenedor con nombre que almacena archivos y directorios
  - *Nombres no permitidos:*
    - Windows: `\/?:*"<>|`
    - Linux: `/?*&$|`
  - *Ruta:* absoluta | relativa
- **Estructura Directorios:**
  - *Linux:* FHS => `/` ...
  - *Windows:*
    - `C:\`: ArchivosPrograma, ArchivosPrograma([x86](https://phoenixnap.com/kb/x64-vs-x86)), PerfLogs, Usuarios(Default,AccesoPúblico,usuarios), Windows
    - `C:\Windows`: System32, Boot, PolicyDefinitions, Temp...

### 3. Particionado Discos

- **Definición:** "División lógica del disco, establecer determinada superficie como unidad de almacenamiento independiente sobre la que montar un sistema de archivos"
- **Tipos:** MBR | GPT | APM
- **Formateado:** "implantar un sistema de archivos en la superficie de disco de una partición lógica"

#### 3.1 Particionado MBR

- **Intro:** BIOS-based; maxDiscSize=2TB
- **Particiones:**
  - *MBR:* primer sector disco; TablaParticiones(inicio/fin particiones) + MasterBoot program (lee tabla, cede control a particiónActiva)
  - *Partición Activa:* OS en particiónPrimaria
  - *Partición Primaria:* *-4 | 3
  - *Partición Extendida:* 0 | 1; contiene part.Lógicas (no tiene sistema de archivos)
  - *Particiones Lógicas:* * | 23; no permite instalar Windows OS!

#### 3.2 Particionado GPT

- **Intro:** UEFI-based; maxDiscSize=256TB
- **Técnica:** LBA (Logical Block Addressing)
- **Particiones:** max 128 particiones Primarias!

### 4. Administración Discos

- Discos Básicos (default) VS Dinámicos (*volúmenes*)
- **Volumen:** "almacenamiento lógico con un único sistema de archivos que abarca en una o más particiones"
- **Organización:**
  - *Conjunto de volúmenes|volumen distribuido:* unión varios discos/particiones; permite ampliar, no reducir, no reflejar, no toleranciaFallos (básicos|dinámicos)
  - *Conjunto de espejos|volumen reflejado:* RAID_1 // dos particiones, 2 copia 1
  - *Conjunto de bandas:* unión & división, varios discos (con/sin paridad)
  - *Sin paridad:* RAID_0 // división bandas
  - *Con paridad:* RAID_5 // división bandas
- **Creación volúmenes:** Básico, Dinámico, Simple, Distribuidos, Seccionados, Reflejados, RAID_5
  - ...
- **Copias Seguridad:** ...
- **Cuotas de Disco:** ...

<hr>

## UD6: Administración Dominio

## UD7: Administración Acceso Dominio

<hr>

## UD8: Linux: Intro

## UD9: Linux: usuarios, grupos y permisos
