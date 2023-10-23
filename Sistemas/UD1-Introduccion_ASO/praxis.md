# UD 1 - Introducción ASO


- [UD 1 - Introducción ASO](#ud-1---introducción-aso)
  - [1. Introducción a ASO](#1-introducción-a-aso)
    - [Caso práctico: bash scripts](#caso-práctico-bash-scripts)
    - [Ponte a prueba: PowerShell files](#ponte-a-prueba-powershell-files)
    - [Ejercicios: PowerShell](#ejercicios-powershell)
  - [2. Sistemas de Virtualización](#2-sistemas-de-virtualización)
    - [~~Caso práctico: instalación Proxmox~~](#caso-práctico-instalación-proxmox)
    - [Ponte a prueba: KVM/QEMU](#ponte-a-prueba-kvmqemu)
    - [Estudio de caso: virtualización anidada en Proxmox VE](#estudio-de-caso-virtualización-anidada-en-proxmox-ve)
    - [Ejercicios:](#ejercicios)
  - [3. Componentes virtualizados del HW (Proxmox VE)](#3-componentes-virtualizados-del-hw-proxmox-ve)
    - [Caso práctico: creación VM](#caso-práctico-creación-vm)
    - [Ponte a prueba: conversión discos](#ponte-a-prueba-conversión-discos)
    - [Estudio de caso: creación VMs desde API \& CLI](#estudio-de-caso-creación-vms-desde-api--cli)
    - [Ejercicios:](#ejercicios-1)
  - [4. Componentes virtualizados de la red (Proxmox VE)](#4-componentes-virtualizados-de-la-red-proxmox-ve)
    - [Caso práctico: OVS](#caso-práctico-ovs)
    - [Ponte a prueba: modelo de red física para virtualizar con Proxmox VE](#ponte-a-prueba-modelo-de-red-física-para-virtualizar-con-proxmox-ve)
    - [Ejercicios:](#ejercicios-2)
  - [N. Foo](#n-foo)
    - [Caso práctico: foo](#caso-práctico-foo)
    - [Ponte a prueba: foo](#ponte-a-prueba-foo)
    - [Estudio de caso: foo](#estudio-de-caso-foo)
    - [Ejercicios: foo](#ejercicios-foo)


## 1. Introducción a ASO

### Caso práctico: bash scripts

- ¿Cuál es la extensión de los shell scripts?

```md
.sh
```
- Determina la shell por defecto de un usuario.

```bash
grep "$USER" /etc/passwd | awk -F ':' '{print $7}'
    # /usr/bin/zsh
    # /bin/bash
```


### Ponte a prueba: PowerShell files

- Tipos de archivos que podemos crear con PowerSHell

```yaml
ps1: script
psm1: módulo; funciones y comandos; organizar y reutilizar código
psd1: manifiesto de módulos; autor, descripción, dependencias, definir alias, exportar comandos
ps1xml: ...
pssc: configuración sesión; directivas seguridad, config proxy
psrc:  espacio ejecución; ...
```

### Ejercicios: PowerShell

1. MS-DOS sigue siendo un sistema de scripts válido para administrar servidores con cualquier sistema operativo == F
2. PowerShell dispone de un entorno de scripting integrado para poder programar == V
3. [PowerShell] tiene acceso al Sistema de Administración de Windows (WMI) == V
4. [PowerShell] no da soporte al Modelo de Información Común (CIM) == F
5. Podemos administrar todos los objetos existentes en un AD == V
6. [PowerShell] solo funciona en Sistemas Operativos de Microsoft == F
7. La integración completa en red de sistemas operativos libres y propietarios no es posible == F


## 2. Sistemas de Virtualización

### ~~Caso práctico: instalación Proxmox~~

> [Proxmox en hardware](https://github.com/pabloqpacin/dotfiles/blob/main/docs/Proxmox_VE.md)

### Ponte a prueba: KVM/QEMU

- Instalaremos Ubuntu Server 22.04 sobre KVM/QEMU. ¿Qué otras bibliotecas o programas vamos a necesitar? ¿Qué gestor de máquinas virtuales podríamos utilizar para KVM/QEMU?

```md
libvirt
virsh - https://www.libvirt.org/manpages/virsh.html
virt-manager
```

### Estudio de caso: virtualización anidada en Proxmox VE

- Vídeo: creación de contenedor LXC Ubuntu dentro de una VM de Proxmox en VirtualBox <!-- WTF -->


### Ejercicios: 

1. Existen cuatro sistemas de virtualización == V
2. Los sistemas virtualizados bare-metal de nivel 1 no requieren de otro OS invitado para funcionar == V
3. Para virtualizar sistemas requerimos de:
   - [x] procesadores con tecnología de Intel VT-x/VT-i o de AMD-V Pacífica o posteriores 
   - [x] Host OS que soporte virtualización
   - [ ] Hipervisor o VMM para contenedores
   - [ ] Guest OS en todos los sistemas
4. QEMU Tiene dos sistemas de emulación: completa o de usuario == V
5. KVM es el módulo basado en virtualización de sistemas Windows == F

---

## 3. Componentes virtualizados del HW (Proxmox VE)

> TODO

### Caso práctico: creación VM
### Ponte a prueba: conversión discos
### Estudio de caso: creación VMs desde API & CLI
### Ejercicios:

---

## 4. Componentes virtualizados de la red (Proxmox VE)

> TODO

### Caso práctico: OVS

- Investiga cuáles son las diferencias entre los dispositivos de red virtuales nativos Linux (Bridge|Bond|VLAN) de ProXmox VE y los dispositivos equivalentes OVS (Bridge|Bond|IntPort).

### Ponte a prueba: modelo de red física para virtualizar con Proxmox VE
### Ejercicios:



---
---

## N. Foo
### Caso práctico: foo
### Ponte a prueba: foo
### Estudio de caso: foo
### Ejercicios: foo