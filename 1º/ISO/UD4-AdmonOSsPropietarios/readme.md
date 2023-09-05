# ISO — UD4: Administración OSs Propietarios (+ *Linux: Usuarios & Permisos*)

## Campus Virtual

- Teoría
  - ud4-teoria
  - ud4-presentacion
  - ud4-*Linux*Usuarios
  - ud4-*Linux*Permisos
- Material Complementario <!--accesoAdminRemotaWindows && Redes & lotta BS-->
- Prácticas
  - ejer-usuariosGruposLocalesWindows
  - ejer_Cisco-usuariosGruposLocalesWindows
- Cuestionario

### Prácticas...

> [apuntes-ud4](/ISO/UD4-AdmonOSsPropietarios/apuntes-ud4.md)

> [PracticaCisco-UsuariosGruposPermisos](/ISO/UD4-AdmonOSsPropietarios/EXC-Cisco-WinUsersGroups.pdf)


```markdown
# Win11 ProN VM -- UsuariosGruposPermisos
- Admin login
- `lusrmgr.msc`
  - New users: 'pASIR EstuAsir01 EstuAsir02 pDAW EstuDaw01 EstuDaw02'
  - New groups: 'gASIR gDAW' (Agregar Users)
- Mkdir C:\MODULOS
  - Propiedades > Seguridad > Opciones Avanzadas > __Deshabilitar herencia__ > Quitar todos los permisos
    - Quitar USUARIOS + UsuariosAutenticados > _Agregar gASIR & gDAW_ <!-- + SYSTEM + Administradores -->
- Dentro de 'MODULOS':
    - Mkdir ASIR & DAW
        - Deshabilitar herencia (Permisos Explícitos)
        - Denegar permisos gASIR || gDAW
        - Agregar p* con permisos de __Control Total__
- Verify success!
```



### Cuestionario1

| index | cuestionario |
| ---   | --- |
| Q1    | ¿La autenticación de una cuenta de usuario local siempre es necesario realizarla a la hora de acceder al sistema operativo?
| A1 !  | — Si, siempre. [[What about EscritorioRemoto, TeamViewer, etc. tho??]] <br> ~~Solo cuando el sistema nos facilita el acceso a recursos de éste.~~ <br> ~~Solo es necesario cuando accede a una red.~~ 
| Q2    | Los sistemas operativos Windows asocian una cuenta de usuario con una dirección de e-mail y una contraseña , estas cuentas son conocidas como:
| A2    | — Cuentas de usuario Microsoft.
| Q3    | ¿Podemos inhabilitar temporalmente una cuenta local de usuario?
| A3    | — Si , con la característica “activada”, desactivándola. <br> ~~Si, con la característica “ miembro del sistema”, desactivándola.~~
| Q4    | ¿ Cual de estas afirmaciones es falsa respecto al SID?
| A4    | — Puede ser especificado manualmente. <br> ~~Se trata del identificador seguro de la cuenta de usuario.~~ <br> ~~No pueden existir dos iguales.~~
| Q5    | Para conocer las cuentas de usuarios que hay activas en un equipo con el sistema Windows 10, podemos acceder desde
| A5 ?  | — **Panel de control** <br> ~~Configuración del sistema~~ // ~~El sistema~~ <!--ELSE-->
| Q6    | Desde el “administrador del servidor” ¿podemos acceder a las cuentas de usuarios locales en Windows server 201.?
| A6    | — Sí <br> ~~No~~ // ~~No, solo se puede acceder a los usuario de red.~~
| Q7    | Para llegar a la configuración de cuentas de Windows 10 accedo desde:
| A7    | — **Inicio/configuración.** <br> ~~Inicio/usuarios.~~ // ~~Inicio/sistema.~~
| Q8    | Queremos modificar los permisos NTFS asignados por defecto a un archivo,  pero no podemos porque salen las casillas de permitir desactivadas ¿por qué ocurre esto?
| A8    | — Porque no tenemos permisos para cambiarlos. + *Porque los permisos son heredados y la herencia esta activa.* <br> ~~Porque no hay forma de cambiar los permisos por defecto.~~
| Q9    | Los permisos NTFS se aplican:
| A9    | — Independientemente del tipo de acceso. <!--Local VS Remoto-->
| Q10   | Los permisos que se propagan a un objeto desde un objeto primario se conoce como:
| A10   | — Permisos heredados
