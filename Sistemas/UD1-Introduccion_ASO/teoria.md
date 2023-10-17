# UD1 - Introducción ASO

- [UD1 - Introducción ASO](#ud1---introducción-aso)
  - [1. Introducción a ASO](#1-introducción-a-aso)
    - [1.1 ¿Por qué debemos programar scripts?](#11-por-qué-debemos-programar-scripts)
    - [1.2 Guiones Shell](#12-guiones-shell)
    - [1.3 PowerShell](#13-powershell)
    - [1.4 Integeración entre Sistemas](#14-integeración-entre-sistemas)
  - [2. Sistemas de Virtualización](#2-sistemas-de-virtualización)
    - [2.1 ¿En qué consiste la virtualización?](#21-en-qué-consiste-la-virtualización)
    - [2.2 Tipos de virtualización](#22-tipos-de-virtualización)
  - [3. Componentes virtualizados del HW (Proxmox VE)](#3-componentes-virtualizados-del-hw-proxmox-ve)
    - [3.1 Virtualización de componentes HW](#31-virtualización-de-componentes-hw)
  - [4. Componentes virtualizados de la red (Proxmox VE)](#4-componentes-virtualizados-de-la-red-proxmox-ve)
    - [4.1 Modelo de virtualizados de la red](#41-modelo-de-virtualizados-de-la-red)
  - [SÍNTESIS](#síntesis)
  - [ENLACES](#enlaces)
  - [DOCUMENTOS](#documentos)
  - [QUIZ](#quiz)


## 1. Introducción a ASO

- Scripts para gestionar servidores
- Virtualización OS, Hipervisores y Contenedores

### 1.1 ¿Por qué debemos programar scripts?

- Poder hacer tarea X sin esperar a que termine Y
- Scripts: programar conjuntos de tareas repetitivas (e.g. activación/gestión copias de seguridad, etc.)
  - Bash + PowerShell

### 1.2 Guiones Shell

- Bash

### 1.3 PowerShell

1. Aplicación de lenguajes de "scripting" (PowerShell) para la Administración
   - Shell, scripting, variables-constantes-tipos, bifurcación, selección múltiple
   - Terminal, PowerShell ISE, debugging, breakpoints, cmdlets, `Get-Help`
   - WMI <!--Windows Mgmt Instrumentation--> & CIM <!--Common Information Model-->: usuarios, procesos, servicios...
2. Administración del servicio de Active Directory en Windows
   - Instalación y configuración
   - Objetos AD: UO, grupos, usuarios
   - Directivas de Grupo, Perfiles, permisos
   - Administración remota

### 1.4 Integeración entre Sistemas 

- OpenLDAP: emulación de AD en Linux
- Integración en Red

1. Administración de AD mediante [OpenLDAP](https://www.openldap.org/) en Linux
   - Instalación en Ubuntu Server
   - Configuración dominios en clientes Linux
   - Perfiles móviles (carpetas personales y departamentales) para toda la organización
   - 1988==DAO; 1993==LDAP,DAP; 1995==LDAP
2. Integración de OSs en Redes Libres y Propietarias
   - Coexistencia servidores/clientes con distinto OS (Linux o Windows) y plataforma (escritorio o móvil).
   - Active Directory con OpenLDAP como Controlador Dominio
   - Servidor de impresión
   - Administración remota universal


---
## 2. Sistemas de Virtualización

- Ventajas, inconvenientes
- Soporte físico: VT-x/VT-i (vmx) & AMD-V (svm) + multicore/multithreading

### 2.1 ¿En qué consiste la virtualización?

- Parte real:
  - hardware
  - host OS
- Parte virtualizada:
  - hipervisor/VMM (tipos 1 y 2)
  - máquina virtual (hardware virtualizado)
  - guest OS

### 2.2 Tipos de virtualización

- Según la posición del hipervisor en la arquitectura
  - Solitario (1): Hardware -> VMM -> VMs
  - Alojado (2): Hardware -> OS -> VMM -> VMs
  - Híbrido: Hardware -> OS + VMM -> VMs
  - Containerizadas: Hardware -> OS -> Gestor contenedores -> Contenedores

1. VMM Solitario o Nativo (Tipo 1)
   - Hipervisor autosuficiente, drivers propios, lightweight, control total recursos, reparto a VMs, velocidad I/O
   - Iconvenientes: compatibilidad drivers, gestión ACPI
   - E.G. Proxmox, ESXi, XenServer, Hyper-V
2. VMM Alojado en un OS (Tipo 2)
   - Host soporta VMM: programación de procesos, reparto recursos, drivers hardware
   - **KVM/QEMU**: dos modos (SME, UME)
3. VMM Híbrido o Paravirtualización (Tipo 3)
   - ... 
4. VMM a nivel de OS o Contenedores (Tipo 4)
   - Contenedores LXC, Docker/Docker COmposer, Kubernetes

---
## 3. Componentes virtualizados del HW (Proxmox VE)

<!-- - TODO: ...
  - Config: memoria, procesadores (sockets), núcleos (cores), almacenamiento
  - Alta disponibilidad... -->

### 3.1 Virtualización de componentes HW

1. Virtualización de Procesadores
2. Virtualización de Memoria
3. Virtualización del Almacenamiento


---
## 4. Componentes virtualizados de la red (Proxmox VE)

### 4.1 Modelo de virtualizados de la red

1. Virtual Network Interface Card (vNIC)
2. Puente virtual de red (vmbridge)
3. VLAN
4. Redes enlazadas (bonding)


---
## SÍNTESIS

> FAIL: html should be pdf

---
## ENLACES

- @Microsoft: [Cómo escribir y ejecutar scripts en Windows PowerShell ISE](https://learn.microsoft.com/es-es/powershell/scripting/windows-powershell/ise/how-to-write-and-run-scripts-in-the-windows-powershell-ise?view=powershell-7.3)
- @Ubunlog: [Breve artículo donde se explican los siete campos del archivo /etc/passwd](https://ubunlog.com/etc-passwd/)
- @IONOS: [Artículo comparativo entre los mejores software de virtualización del mercado actual (2021)](https://www.ionos.es/digitalguide/servidores/configuracion/comparativa-de-software-de-virtualizacion/)
- @IONOS: [Virtualización: el alma de la nube. Cómo la virtualización ha hecho crecer la computación en la nube](https://www.ionos.es/digitalguide/servidores/configuracion/virtualizacion/)
- @KVM: [Web Oficial de Kernel-based Virtual Machine](https://www.linux-kvm.org/page/Main_Page)
- @Debian: [Wiki Oficial de Debian sobre KVM](https://wiki.debian.org/es/KVM)
- @Debian: [Wiki Oficial de Debian sobre la Biblioteca de virtualización](https://wiki.debian.org/es/libvirt)
- @Debian: [Wiki Oficial de Debian sobre Puentes de conexión entre redes](https://wiki.debian.org/BridgeNetworkConnections)
- @Debian: [Wiki Oficial de Debian sobre Contenedores LXC](https://wiki.debian.org/LXC)
- @Proxmox: [Wiki Oficial de Proxmox VE](https://pve.proxmox.com/wiki/Main_Page)
- @Proxmox: [Documentación Oficial de Proxmox VE](https://pve.proxmox.com/pve-docs/)
- @Proxmox: [Llamadas API disponibles en Proxmox](https://pve.proxmox.com/pve-docs/api-viewer/index.html)
- @OpenVSwitch: [Artículo sobre OVS en la documentación oficial de la wiki de Proxmox VE](https://www.openvswitch.org/)
- @Proxmox: [Artículo con información de virtualización anidada con Proxmox VE](https://pve.proxmox.com/wiki/Nested_Virtualization)
<!-- - @Proxmox: [API REST de Proxmox VE](https://pve.proxmox.com/pve-docs/api-viewer/index.html) -->

## DOCUMENTOS

- [ ] Proxmox VE: menús administración -- TODO: html to pdf


## QUIZ