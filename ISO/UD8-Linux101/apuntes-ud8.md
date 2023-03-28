# ISO UD8: Linux101


## ud8-teoria

```markdown
1. GNU-LINUX
2. Software Libre — Licencias
3. Instalación OSs GNU/Linux
4. Puntos de montaje
5. Gestor de arranque
6. Consideraciones previas y requisitos
7. Instalación Ubuntu VM
   1. Creación
   2. Config
   3. Instalación OS
8. Config Ubuntu
   1. Características Sistema
   2. Actualizaciones
   3. Repositorios aplicaciones
   4. Drivers en Ubuntu
9. Ubuntu: Proceso arranque/detención sistema
10. Sistema de Archivos
    1.  Nomenclatura unidades
    2.  Principales directorios
    3.  Montaje del SdA
11. Admin Usuarios y Grupos
12. Uso del Terminal — Prompt
13. Comandos más usuales
    1.  Sintaxis
    2.  Caracteres especiales/comodines
    3.  Enlaces
```

1. **GNU-LINUX**
    - Conjunto OSs multitarea multiusuario multiplataforma (hilos + memoriaVirtual + SdA+) // hardware+
2. Software Libre
   1. *Licencias* == 4_libertades (ejecutar estudiar distribuir mejorar) = copylef *GPL*
   2. *Distros* == Linux kernel + GNU software // *Paquetes:* .rpm .deb .pkg .tgz
3. Instalación OSs GNU/Linux
    - Arranque > detecciónHardware > tipoInstalación > partición > montaje > escogerPaquetes > copiarArchivos > instalarGestorArranque > reiniciar+inicioSesión 
4. Puntos de montaje
    - **Montaje** == vínculo árbolDirectorios w/ SdA (informar OS camino)
5. Gestor de arranque ('GRUB_2')
6. Consideraciones previas == requisitosHardware + funcionalidadServidor
7. Instalación Ubuntu VM
   1. Creación (...)
   2. Config (...)
   3. Instalación OS <!--MAAS = MetalServer+Cloud-->
       - Particiones: `/` + `/home` + `swap` // Config PERFIL (hostname, username, SSH)
8. Config *Ubuntu*
   1. Características Sistema: Canonical
   2. Actualizaciones: LTS (~2years Apr)
   3. Repositorios aplicaciones: Gestor de Paquetes > 'control dependencias'
   4. ~~Drivers en Ubuntu~~
9. ~~Ubuntu: Proceso arranque/detención sistema~~
10. Sistema de Archivos ('ext4'=1EB-64kFiles)
    1.  *Nomenclatura unidades* == `hd` || `sd` // sda1, sda2, sdb1, ...
    2.  *Principales directorios* == **FHS**: `/` `/bin` `/boot` `/dev` `/etc` `/home` `/lib` `/mnt` `/opt` `/proc` `/root` `/sbin` `/tmp` `/usr` `/var`  
    3.  ~~Montaje del SdA~~
11. **Admin Usuarios y Grupos**
     - OS multiusuario = sesiones simultáneas
     - *TIPOS* == root && normales && especiales (daemons; nologin = `/etc/login.defs`)
     - **Grupos** == UID > GID // `/etc/group`
     - **ROOT** == `su -` `sudo`(`/usr/bin`) ... `/etc/sudoers`
12. Uso del Terminal — Prompt (`bash`, `zsh`)
13. Comandos más usuales
    1.  Sintaxis == `comando [-opciones] [parámetros]`
    2.  Caracteres especiales/comodines == `*` `?` `[ ]` `!` `{ }` -- **REGEX** 
    3.  *Enlaces*
         - [ ] i-nodes ([doc](https://rtfm.co.ua/en/what-is-hard-link-symlink-and-inode-in-linux/) - `df -i`)
         - Hard-links == SAME Inode - can delete SRC // 
         - Symlinks == DIFF Inode - can't delete SRC // `ln -s src dest`
    4.  ELSE &emsp; (`df -h`)
        1.  Comandos APT
         - `apt install <pkg>`
         - `apt update`
         - `apt upgrade`
         - `apt remove <pkg>`
         - `apt check`
         - `apt clean`
         - `apt-cache search`
         - '`apt show <pkg>`'
        2. Comandos RED
         - `igconfig eth0`
         - `ifup eth0`
         - `ifdown eth0`
         - `ifconfig eth0 192.168.1.1 netmask 255.255.255.0`