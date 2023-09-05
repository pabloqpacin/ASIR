# ISO UD7: Admon Acceso Dominio (APUNTES)

```markdown
1. Admon. cuentas de equipos [CdE] en dominio Windows Server
   1. Crear CdE
   2. Agregar CdE a Grupo
   3. Eliminar CdE
   4. Mover CdE
   5. Administrar Equipo Remoto
   6. Restablecer CdE
   7. Habilitar/deshabilitar CdE
2. Admon. Dominios
3. Relaciones de confianza
4. Admon. Unidades Organizativas
5. Permisos para Recursos Compartidos
6. Directivas de Seguridad
7. Directivas de Grupos
8. Orden de aplicación de Directivas
```

1. Admon. CdE en dominio Windows Server
    - INTRO
      - *CuentaEquipo* == auth + accesoRecursos + audits
      - AD>CD>Computers(UnidadOrganizativa)
   1. **Crear CdE:** manual || autoAlConectarse (Red -IPfija Servidor- + nombreAuth) // ModificarPropiedadesCdE
   2. Agregar CdE a Grupo
   3. Eliminar CdE
   4. Mover CdE
   5. Administrar Equipo Remoto
   6. Restablecer CdE
   7. Habilitar/deshabilitar CdE
2. **Admon. Dominios**
    - *UnidadesOrganizativas* [UO] == cápsulaConfig (directivas, usuarios-grupos-equipos, admins...)
3. **Relaciones de Confianza** [RC]
     - RC == authEntreDominios // Bosque > Subdominios == rel.Bidireccional
     - Relaciones: unidireccional - bidireccional - transitiva (A->B + B->C = A->C)
     - **Creación:** ConfigDNS > ReenviadorCondicional > IPaltDomain && Herramientas>DominiosConfianzas > NuevaConfianza > auth(bosque/selectiva)
4. Admon. Unidades Organizativas
    - Dominio > **UO** // EstructuraLógica-Jerárquica // *CD default*
    - Creación // DesprotecciónPropiedades:Eliminación-Desplazamiento
    - *DelegaciónControl:* Asistente > TareasDelegar > ...
5. Permisos para Recursos Compartidos
    - SeguridadAcceso: usuariosGrupos / *ARCHIVOS* (r,w,x,...)
    - CompartirRecursos: permisosCarpeta + permisosSeguridadNTFS // SinAcceso - Leer - Cambiar - ControlTotal
    - WindowsServer == accesoLocal **VS** accesoRed :: permisos NTFS(Carp+Arch) vs SHARE(Carp) (másRestrictivoPrevalece!!)
    - **REGLAS:** Derechos > Permisos; permisos acumulativos; archivos > carpetas & herencia; grupos ~~usuarios~~
    - AccesosDirectosOK // RecCompartidos especiales: `Admin$` `IPC$` `NETLOGON` `PRINT$` LetraDeUnidad
6. *Directivas de Seguridad*
    - ConjuntoReglas SeguridadRecursosCompartidos // TIPOS: Local - Dominio - ControladorDominio
7. Directivas de Grupos (`\Windows\SYSVOL\sysvol\<domain>\Policies\GUID`)
    - INTRO 
      - **GPO** (GroupPolicyObjetcs) == via `GPMC` <!--GroupPolicyManagerConsole-->
      - TIPOS según Ámbito: locales VS **no-locales**(dominio, UO, grupos, usuarios/equipos....)
    - `GPMC` == crear-editar importar-exportar copiar-pegar copiasSeguridad-restaurar INFORMES scripts ...
    - Default GPO == DefaultDomainPolicy + DefaultControllerDomainPolicy
    - **ConfigEquipo VS ConfigUsuario**: software - WindowsGUI - PlantillasAdministrativas(`HKLM` vs `HKCU`) - PATH - ConfigPanelControl
    - *VINCULAR GPO-contenedores* == no-exclusivos no-permanentes; manual VS auto
    - **ESTADOS:** no-configurada(defaultORelsewhere) - habilitada(ON) - deshabilitada(OFF)
8. Orden de aplicación de Directivas <!-- local > sitio > dominio > UO > DC -->
    - ObjetosDirectivaGrupoLocal > ODGSitio > ODGDominio > ODG_UnidadesOrganizativas -> CD // (*ÚLTIMO PREVALECE*)
    - Herencia + acumulación // anulación en caso Contradicción
    - EDIT == `AdministraciónDirectivasGrupo` == orden, herencia...