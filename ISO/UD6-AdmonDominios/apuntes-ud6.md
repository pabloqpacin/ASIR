# ISO — UD6: Admon. Dominios (APUNTES)

## ud6-teoria + ud6-presentacion

```markdown
# UD6: Administración de dominios
1. Estructura Cliente-Servidor
2. Concepto de directorio
3. Protocolo LDAP
4. Dominios
   1. Estructura Lógica
   2. Servicios de dominio en Windows Server [WS]: Active Directory [AD]
      1. Instalación de función de servidor de AC en WS
      2. Administración de AC en WS
      3. Usuarios & Equipos de AC
5. Admon. Cuentas Usuario en AD de Windows: Tipos & Usuarios predeterminados
6. Perfiles de red de las Cuentas de Usuarios de un Dominio
7. Admon. Grupos de Usuarios en AD de Windows: Tipos & Grupos predeterminados
```

1. **Estructura Cliente-Servidor**
    - *GrupoDeTrabajo:* P2P, noCentralización; PC==preferenciasUsuario; 'WorkGroup'
    - *Cliente-Servidor:* servicioDistribuido, protocolosAsimétricos, recursosLógicosFísicos-integridad/escalabilidad
    - *TIPOS-Servidor:* archivos impresión comunicaciones e-mail web proxy
2. ~~Concepto de directorio~~
3. **Protocolo LDAP** //  *Ofrece:* métodos conexión/gestión información, cifrado y auth, estructura jerárquica.
4. **DOMINIOS:** conjunto de equipos en estructura cliente-servidor (usuarios-acceso)
   1. **Estructura Lógica:** Equipo-Servidor con BaseDatos usuarios-accesos + auth clientes
5. Servicios de dominio en Windows Server [WS]: **Active Directory** [AD]
    - **INTRO**
      - AD Domain Services == LDAP + DNS // ÁrbolJerárquico accesoUsuarios recursosCompartidos
      - **ControladorDominio [CD]:** servidorCentral: fuenteInformación centralSeguridadAuth
      - Estructuras Lógica VS Física == Dominio VS TopologíaRed
      - *MiembrosDominio:* clientes != equipos
      - **FUNCIONES ADDS:** ResoluciónNombres (IPs según convenciones DNS), EspacioNombres, NombreDominio
      - *Objetos:* usuarios recursos servicios <!--según CLASES-->
      - **ÁrbolDeDominios:**
        - *árbol:* 1+Dominio(Bosque) con CatálogoGlobal+EspacioNombresDNS comunes
        - *bosque:* 1+Árboles con CatálogoGlobal común PERO NO EspacioNombresDNS // 1ªDominio==DominioRaízBosque+Bosque+1ºÁrbol
      - OTROS CONCEPTOS
        - *UnidadOrganizativa:* jerarquíaObjetos == adminRecursos/Autoridad
        - *Sitio:* equiposRelacionadosRed != geográficamente
      <!-- - Planificación-Requisitos: WindowsServer=GUI+CLI;  -->
   1. **INSTALACIÓN**
       - ConsideracionesPrevias: nºServidores, nombreEquipo, red, contraseñaSegura
       - *AgregarRoles* + ADDS + **CD**(Existente-Nuevo) + NTDS/SYSVOL + Passwd
   2. **ADMON.:** Servicios UsuariosGruposEquipos DominiosBosquesÁrboles DirectivasGrupoSEG EditorADSI
   3. ~~Usuarios & Equipos de AC~~
6. Admon. Cuentas Usuarios [CUs] en AD de Windows: Tipos & Usuarios predeterminados
    - *Funciones CUs:* authUsuario, accesoRecursosDominio, adminSeguridad, auditarAccionesUsuarios
    - Cuentas Dominio != Locales // SID-CUs
    - **TIPOS**
      - **Globales/deDominio:** (ADDS) accesoRecursos cualquierEquipoAsociado // según CD
      - *Predefinidas:* admin - usuarioInvitado(deshabilitada)
    - CREACIÓN CUs: UnidadOrganizativa>Nuevo // Herramientas>Usuarios // opciones PASSWD // *copiar* OK
      - *DATOS CUs:* General - Cuenta - Perfil - MiembroDe - Sesiones - EscritorioRemoto
      - HabilitarDeshabilitarCuentas + Eliminar // ModificarGrupoPrincipal
7. **PerfilesRed** CUs en Dominio
    - Perfil Local != Dominio
    - TIPOS:
      - *Móvil:* savedRemotely // usarioOKcambios `NTUSER.DAT` > `HKCU` [> `ntuser.dat.log1` >]
      - *Obligatorio:* usuario!OKcambios `NUTUSER.MAN` (readOnly)
      - *Temporal:* unaSesión if ERROR con anteriores
    - **Propiedades>Perfil:** PATHconfigPerfil(`\\servidor\carpeta_compartida\%UserProfile%`) - ScriptInicioSesión(`\Windows\SYSVOL|sysvol\nombre_dns_dominio\scripts`) - carpetaPersonal
8. Admon. **Grupos** en AD
    - (Buena práctica == permisos a Grupos !Usuarios)
    - TIPOS: <!--ChatGPT-->
      - Distribución VS Seguridad VS Administración
      - *Locales de dominio:* usuarios 1 dominio / recursos servidor-dominio local
      - *Globales de dominio:* usuarios 1 dominio / recursos compartidos Bosque
      - *Universales:* usuarios varios dominios (**1 bosque**) / recursos compartidos
    - ANIDAMIENTO: peligroRecursividad //  *GruposPredeterminados:* (`MMC>Builtin`)
    - **Estrategia AGDLP:** (1) crear-config nº grupos locales según Tipos acceso deseados // (2) meter cuentas globales en cuentas locales según Permisos (...)
    - *ADMON.:* UsuariosGruposAD>Grupo>Propiedades // CreaciónGrupos // AgregarMiembros // ConvertirTIPOSgrupos // Eliminar // Buscar grupos de x usuario

```markdown
# ChatGPT...
Los grupos locales de dominio, los grupos globales de dominio y los grupos universales son diferentes tipos de grupos que se pueden utilizar en Active Directory para administrar el acceso a recursos y delegar tareas administrativas. A continuación, se describen sus diferencias:

- _Grupos locales de dominio:_ estos grupos se utilizan para asignar permisos y derechos de acceso a recursos en un servidor local. Estos grupos sólo son visibles en el dominio local y no se pueden utilizar en otros dominios o bosques. Los usuarios y grupos de seguridad de otros dominios no pueden ser miembros de los grupos locales de dominio.
- _Grupos globales de dominio:_ estos grupos se utilizan para agrupar usuarios que necesitan los mismos permisos y derechos de acceso a los recursos en un solo dominio. Estos grupos se pueden utilizar en todos los servidores y recursos del dominio. Los grupos globales de dominio también pueden contener otros grupos globales de dominio y grupos de usuarios locales. Además, los grupos globales de dominio se pueden utilizar para delegar tareas administrativas a otros usuarios en el dominio.
- _Grupos universales:_ estos grupos se utilizan para agrupar usuarios de múltiples dominios en un bosque. Estos grupos se pueden utilizar en todos los dominios y bosques del bosque. Los grupos universales también se pueden utilizar para asignar permisos y derechos de acceso a recursos en cualquier dominio del bosque. Sin embargo, debido a que los grupos universales se replican a través de todo el bosque, su uso excesivo puede causar un aumento en el tráfico de replicación, lo que puede afectar el rendimiento de Active Directory.

En resumen, los grupos locales de dominio se utilizan para recursos en un servidor local, los grupos globales de dominio se utilizan para recursos en un solo dominio, y los grupos universales se utilizan para recursos en múltiples dominios de un bosque. Cada tipo de grupo tiene sus ventajas y limitaciones, y es importante seleccionar el tipo de grupo adecuado para la tarea que se quiere realizar.
```