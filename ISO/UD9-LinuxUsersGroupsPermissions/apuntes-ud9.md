# ISO UD9: Admon. Linux: Usuarios Grupos Permisos

# ud9-teoria

> [ud9-userSystemMgmt.sh](/ISO/UD9-LinuxUsersGroupsPermissions/user-sys-mgmt.sh)

```markdown
1. Usuarios
   1. Comandos
   2. Creación via GUI
   3. Creación via CLI
      1. Ficheros `passwd` `group` `shadow` y `gshadow`
      2. Creación modificando ficheros de config
      3. Creación via comandos específicos
   4. Eliminación
2. Grupos
   1. Creación
   2. Creación via CLI
   3. Agregar Usuarios a Grupos secundarios
   4. Eliminar grupos
3. Permisos
   1. Visualizar Permisos ficheros/directorios
   2. TIPOS
      1. Permisos sobre ficheros
      2. Permisos sobre directorios
   3. Gestión de Permisos
4. Ficheros importantes Inicio Sesión
5. Instalación aplicaciones en Ubuntu
   1. Tipos de programas
   2. Gestores de paquetes
6. Monitor del sistema
7. Comprobación del sistema
```


1. Usuarios
   1. Comandos
       - `whoami` &emsp; `who` &emsp; `id` &emsp; `finger` &emsp; `passwd`
       - `mesg` &emsp; `write` &emsp; `wall` &emsp; `talk`
   2. Creación via GUI
       - Settings > Users > 'passwd'
   3. Creación via CLI
      1. Ficheros `/etc`
          - `passwd` == username : passwd : UID : GID : info : home : shell
          - `shadow` == username : hash : UltCambio : min : max : aviso : inactivo : caducidad
          - `group` == group-name : passwd : GID : members
          - `gshadow` == group-name : passwd : admin : members <!--OJO tema passwd (* ! !! ...)-->
      2. Creación modificando ficheros de config
          - Edit `/etc/passwd` + `mkdir /home/newUser` + `passwd`
      3. Creación via comandos específicos
          - [ ] `adduser` == + group + home
          - [ ] `useradd` == ([-k1](https://askubuntu.com/questions/983649/programmatically-clone-etc-skel-for-new-users), [-k2](http://www.escomposlinux.org/lfs-es/blfs-es-1.0/postlfs/skel.html) [-p](https://askubuntu.com/questions/668129/password-does-not-work-with-useradd-p), ...)
          - [ ] ... ([vipw](https://ostechnix.com/the-right-way-to-edit-etc-passwd-and-etc-group-files-in-linux/) & [env-editor](https://stackoverflow.com/questions/54160242/how-do-i-change-default-editor-for-sudo-vipw-from-vi-to-vim-by-tcsh-in-freeb)<!--sudo vim /root/.bashrc > https://unix.stackexchange.com/questions/73484/how-can-i-set-vi-as-my-default-editor-in-unix-->)
   4. Eliminación == `deluser`
2. Grupos -- (*primario* VS *secundario*)
   1. Creación (GUI == 'gnome-system-tools')
   2. Creación via CLI == `groupadd`
   3. Agregar Usuarios a Grupos secundarios == `usermod`
   4. Eliminar grupos == `delgroup`
3. Permisos
    - MOD = only **OWNER**!
    - [x] **SEE [APUNTES-UD4](https://github.com/pabloqpacin/ASIR/blob/main/ISO/UD4-AdmonOSsPropietarios/apuntes-ud4.md) + [PRACTICAS-UD5](https://github.com/pabloqpacin/ASIR/blob/main/ISO/UD5-AdmonInformacion/practicas-ud5.md)!!**
   1. Visualizar Permisos ficheros/directorios == `ls -l` // (...)
   2. ~~TIPOS~~
      1. ~~Permisos sobre ficheros~~
      2. ~~Permisos sobre directorios~~
   3. Gestión de Permisos
    - [ ] `chmod` // **PermisosEspeciales** == *SUID* + *SGID* 
    - `chown`
    - `chgrp`
4. Ficheros importantes Inicio Sesión
    - (root off>on) - `sudo apt upgrade` - `/etc/netplan/*.yaml` - `/etc/hosts`
5. Instalación aplicaciones en Ubuntu
   1. ~~Tipos de programas~~
   2. *Gestores de paquetes:* funciones == gestiónDependencias + actualizacionesLocalRepos + verificaciónFirmas // ventajas == noWebsExternas + garantíasSoftwareLegítimo + facilidadActualizar
6. Monitor del sistema
    - GUI == 'gnome-system-monitor'
    - CLI == `htop` `pstree` ...
7. **Comprobación del sistema**
    - `/var/log/*` VS `gnome-logs`

---

> (3.) Permisos `chmod`

| chmod  | octal |
| :-:    | :-:   |
| - - -  | 0
| - - x  | 1
| - w -  | 2
| - w x  | 3
| r - -  | 4
| r - x  | 5
| r w -  | 6
| r w x  | 7