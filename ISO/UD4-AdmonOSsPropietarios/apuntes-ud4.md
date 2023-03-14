# UD4: Admon OSs Propietarios (+Linux: Usuarios & Permisos)

## ud4-teoria + ud4-presentacion

- **Admon de OSs Propietarios**
   1. *Cuentas usuario & grupos locales (CU & GL)*
       - **CU:** info archivosCarpetas accesoPermisos + preferencias OS
         - *Autenticación:* LOGIN sesión == nombre + passwd
         - *Autorización:* x permisos sesión
       - **TIPOS CU**
         - *USER vs ADMIN vs Invitado* [all==SID]
         - *LOCAL vs RED* (authOSlocal VS authServer=recursosLocales+)
   2. " en Windows (~~Home~~ Pro)
      1. **Admin CU locales** (1stUser == Admin)
          - *Win10/11* (!Home) == `PanelControl` || `AdminEquipos`>`lusrmgr.msc` (~~`MMC`~~)
          - **CREAR USERS** --> **opcionesPasswd** // *Propiedades:* General-MiembroDe-Perfil
      2. Admin GL (`lusrmgr.msc`)
   3. **CU & GL predeterminados**
       - *CU:* admin - invitado
       - *GL:* admin - duplicadores - operadores red - op. copiaSeguridad - usuarios - us. escritorioRemoto - us. monitor sistema - (...)
   4. **Seguridad CU y Contraseñas**
      1. `UAC`: ALERTAS — 4 niveles
      2. `gpedit.msc`: <!--Editor Directivas Grupo Local--> (ConfEquipo>ConfWindows>ConfSeg>DirLoc>OpcSeg) elevaciónPrivilegios + instalaciones
   5. **Directivas SegLocal & Directivas GL** <!--Cambiar Contraseñas CU-->
      1. `secpol.msc`
         - Config *Passwd*: 'secpol.msc'>ConfSeg>DirCuenta>`DirContraseñas` // **Historial**+**Complejidad**+**Vigencia**
         - Config *BloqueoCuenta* // [Kerberos](https://learn.microsoft.com/es-es/windows/win32/secauthn/kerberos-policy)
      2.  - `gpedit.msc` (config equiposLocalREMOTE, adminAplicaciones, adminPermisosUsuarios, adminSCRIPTS)
   6. Perfil local de CU
       - `C:\Users\Usuario` == info inicioSesión(accesosDirectos,fondoPantalla,programasInstalados)... // *editSegúnPermisos*
       - *EG.* AppData, NTUSER.DAT, ...
       - CerrarSesión == save `HKCU`
   7. **Admon. Seg. Recursos (Local)**
       - *RECURSOS* == elementos(impresora,carpeta,fichero,conexiónRed) + *PERMISOS*(Usuarios+Grupos)
       - *DERECHOS* == PERMISOS(Usuarios+Grupos) // **Acreditación** `SAT` == [SID](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/understand-security-identifiers),GID,Derechos
          1. *De conexión:* inicioSesiónLocal - accesoRemoto
          2. *Privilegios:* EG. backups, restaurar, horaSistema, poweroff
      1. **Permisos NTFS**
          - SID + [ACL](https://learn.microsoft.com/en-us/windows/win32/secauthz/access-control-lists) (ACEs) Protección + ACL Seguridad <!--audits-->
          - (!) hereditarios, local+Remoto, **acumulativos** (strictestWins + SID=)
          - *PROPIEDAD:* creador=propietario
      2. **TIPOS**
         1. ESPECIALES vs ESTÁNDAR (bundles of ESPECIALES) <!--r w x...-->
         2. *REGLAS:* Explícitos > Heredados // *negativos > positivos* // usuario > grupo // local=compartido(strictestWins)
      3. Gestión permisos NTFS
          - `Acceso efectivo` (PermisosUserGroups)
   8. **Config protocolo TCP/IP** en cliente de red
       - **ControlPanel** > NetworkAndInternet > `NetworkConnections` > Properties > (**Change IP...**)

<img src="/img/ISO/ud4-permisosNTFSavanzados.png" alt="permisosAvanzados" width="500"/>


## ud4-LinuxUsuarios

>  ASIR+/logs/etc-*.log

- **Tipos de Usuarios Linux**
  1. Seguridad Sistema
      - Sistema Usuario-Contraseña VS UsuarioPrivilegios-Contraseña
      - Usuario acceso archivos según **Permisos**
  2. Proceso Login
      - init > getty(login) > user password VS `/etc/passwd` `/etc/shadow` > getty(`/home` + groups + `$USER` `$UID` `$HOME` `$SHELL`) > getty(`/etc/profile`)
  3. Tipos de Usuario
      - **NOTA:** User == Nombre + Passwd + UID + Shell + /home *(Groups==GID)*
     1. *Normal:* permisos=/home // `$` // UID > 1000
     2. *Del Sistema:* auto... task-assigned // UID < 100*
     3. *Root:* UID=0 // `#`
  4. Grupos
      - GID // Permisos easy // 1usuario==1+grupos // ... auto-groups: Hardware
  5. Archivos de Seguridad <!--BELOW-->
     1. `/etc/passwd` — all GIDs // passwd == x || ! || !! == passwd in `/etc/shadow` || blocked || no passwd
     2. `/etc/shadow` — root-only!
     3. `/etc/group` — relación Grupos-Usuarios
     4. `/etc/gshadow` — 
  6. **ROOT**
      - `su <user>`== 'switch user'
      - `sudo su` == 'switch to super-user'
      - `sudo <...>` == 'super-user do <...>' // root puntual // `/usr/bin` & `/etc/sudoers`
      - **sudoers** (`/etc/sudoers`) — quién puede `sudo` (**USAR:** `sudo visudo` [!] )
  7. Herramientas de administración
     1. `who` — usuarios logueados — -b -l -q -a
     2. `w` — usuarios + procesos... — -f
     3. `last` — últimos logins — -F -s -t
     4. `sudo lastb` — logins fallidos
     5. `id` — user info (PID, GID, ...) — -u -g -G

> see [ASIR+/man-pages](https://youtu.be/dQw4w9WgXcQ)

| Archivo          | Info |
| ---              | ---  |
| **/etc/passwd**  | nombre **:** passwd **:** UID **:** GID **:** info **:** directorio **:** shell
| —                | `root:x:0:0:root:/root:/bin/bash`
| —                | `man:x:6:12:man:/var/cache/man:/usr/sbin/nologin`
| —                | `pabloqpacin:x:1000:1000:,,,:/home/pabloqpacin:/usr/bin/zsh`
|                  |
| **/etc/shadow**  | nombre **:** passwd **:** 1970toLastChange **:** DaysMustWait **:** DaysToChange **:** ExpiryWarn **:** ...
| —                | `root:*:19214:0:99999:7:::`
| —                | `man:*:19214:0:99999:7:::`
| —                | `pabloqpacin:$y$j9T$nXkz...hd1b2Ot1:19247:0:99999:7:::`
|                  |
| **/etc/group**   | nombre  **:** passwd(*null*) **:** GID  **:** opcional
| —                | `root:x:0:`
| —                | `sudo:x:27:pabloqpacin`
| —                | `pabloqpacin:x:1000:`
|                  |
| **/etc/gshadow** |
| —                | `root:*::`
| —                | `sudo:*::pabloqpacin`
| —                | `netdev:!::pabloqpacin`


## ud4-LinuxPermisos

- **Permisos-Propietarios-Archivos**
  <!-- - **SistemaDeFicheros**
    - DiscosDuros == /dev/hda /dev/hdb // Particiones == /dev/hda1 /dev/hda2 (VS Windows C: etc.)
    - Archivos relevantes: `/etc/apt/sources.list` `/etc/X11/xorg.conf` `/etc/fstab` `/etc/passwd` -->
  - **INTRO**
    - TIPOS Permisos: Lectura (r) - Escritura (w) - Ejecución (x)
    - ROLES Propietarios: Directorio (d) - Usuario (---) - Grupo (---) - Otros (---)
  - ADMIN:
    - `chmod {a,u,g,o} {-,+,=} {r,w,x} <file>` // EJEMPLOS:
      - chmod og+x file.sh
      - chmod u=rxw,g=rx,o= file.sh
    - **OCTAL** == `chmod 774 <file>` = `chmod u=rwx,g=rwx,o=r <file>` || `chmod a=r,ug+wx <file>`
    - **ELSE**
      - `CHOWN` == change ownership // `chown <user>:<group> <file>`
      - `CHGRP`== change group // `chgrp <group> <file>`

| Octal | r w x |
| ---   | ---   |
| 0     | 0 0 0
| 1     | 0 0 1
| 2     | 0 1 0
| 3     | 0 1 1
| 4     | 1 0 0
| 5     | 1 0 1
| 6     | 1 1 0
| 7     | 1 1 1
