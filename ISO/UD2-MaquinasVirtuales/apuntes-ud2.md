# ISO UD2 — VMs

- [ISO UD2 — VMs](#iso-ud2--vms)
  - [ud2-teoriaVMs](#ud2-teoriavms)
  - [ud-LinuxFilesystem](#ud-linuxfilesystem)
  - [ud2-LinuxComandos01](#ud2-linuxcomandos01)

## ud2-teoriaVMs

- **Máquinas Virtuales**
  1. Concepto
      - *Virtualización:* crear OS virtual con hardware 'prestado' mediante **hipervisor**-abstracción
  2. Tipos
     1. **VM de Proceso** (eg. Java VM)
     2. **VM de Sistema:** anfitrión VS invitados; VMs-independientes; *hipervisor1* VS *hipervisor2*
  3. Técnicas virtualización
     1. Virt. completa del hardware o nativa // IE. arquitectura_x86 exclusiva etc.
     2. Virt. de emulación de hardware o no nativa // IE. otras arquitecturas (eg. N64)
     3. Virt. a nivel de OS // *NULL*
      - **Ejemplos Hipervisores2:** VMware, Microsoft Hyper-V Server, VirtualBox, KVM
  4. Ventajas-inconvenientes...
  5. Creación-personalización (**Conexiones de red:** NAT - Bridge - host only)

## ud-LinuxFilesystem

- **Estructura de Directorios Linux**
  - INTRO
    - Permite múltiples *Sistemas de Archivos*
    - Distingue mayúsuculas y minúsculas
    - Ruta relativa VS Ruta absoluta
    - Comandos básicos: `cd` `ls` `cat`
  - **FHS...**

| Directorio | Info                                                                          | Destacan |
| ---        | ---                                                                           | ---      |
| /          | root
| **/bin**   | Programas fundamentales del sistema                                           | `cat` `chmod` `cp` `echo` `hostname` `ls` `mount` `pwd` `uname` ...
| **/boot**  | Archivos necesarios para el arranque del sistema, kernel y gestor de arranque | `vmlinuz` `initrd` `config` `system.map`
| **/dev**   | Nodos de dispositivos, permiten interactuar hardware con software             | `/dev/sda` `/dev/sda1` `/dev/sda2` `/dev/sdb`...
| **/etc**   | Archivos de configuración del sistema                                         | `/etc/fstab` `/etc/hosts` `/etc/passwd` `/etc/group`
| /home      | Directorio de los usuarios, configuraciones de usuarios y sus archivos
| /lib       | Librerías necesarias para los ejecutables de /bin                             | `/lib/module/<kernel_version>`
| /media     | Puntos de montaje para dispositivos extraíbles (CD, DVD, USB)                 | NOTA: En Suse, RedHat y otras se montan en `/run/media/<user>`
| **/mnt**   | Sistemas de archivos montados temporalmente (sistemas de red especialmente)
| /opt       | Software opcional, ciertos programas externos (Google, Skype)
| /proc      | 'Sistema de archivos virtual, info del sistema y procesos activos'            | `/proc/mounts` `/proc/meminfo` `/proc/partitions` `/proc/cpuinfo` `/proc/filesystems` `/proc/sys` `/proc/mdstat`
| /sys       | '...'
| /root      | Directorio del usuario root. Administrador del sistema
| /tmp       | 
| **/usr**   | Aplicaciones, herramientas y datos para TODOS usuarios
| /var       | Archivos variables como logs, colas impresión, colas email... webs, ftps...   | `/var/ftp` `/var/log` `/var/mail` `/var/run` `/var/spool` `/var/tmp` `/var/www`
| /run       | Información del tiempo de ejecución (reescritos)



## ud2-LinuxComandos01

```bash
pwd

cd || cd ..

ls || ls -t || ls -S

cat

cp

mv

mkdir || mkdir -pv

rmdir

ps || ps aux 

kill    

ping | ping google.com || ping 8.8.8.8 || ping localhost

wget

uname

top || htop
```
