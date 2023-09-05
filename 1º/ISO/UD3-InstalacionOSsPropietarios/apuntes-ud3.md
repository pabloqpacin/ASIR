# ISO UD3: Instalación OSs Propietarios

## ud3-teoria + ud3-presentacion

- Instalación de OSs Propietarios
  1. Consideraciones previas a la instalación
      - Equipo nuevo, actualización, migración, dual-boot...
      - Objetivos y necesidades // Compatibilidad, soporte drivers...
      - *ELSE:* Requisitos hardware + Idioma, clave, nombreEquipo, cuentaUsuario, **particiones, mediosInstalación**
  2. OSs en equipos de Escritorio VS Servidores (unUsuarioPorSesión VS sistemaDominios)
  3. ~~Instalación en Escritorio sobre VMs~~
  4. ~~Instalación en Server sobre VMs~~
  5. Actualización de OS y aplicaciones
      - **IMPORTANTE:** mejoras rendimiento + resolución vulnerabilidades
      - Config *Windows Update:* horasActivas, reinicioProgramado, opcionesAvanzadas(OS+apps, desactivarUpdatesNoCríticas...)
  6. ~~Instalación/desinstalación aplicaciones~~
  7. **Proceso de arranque; Ficheros de inicio**
      - **PROCESO:** electricidad > CPU inicia contadores y registros > ROMBIOS & POST > find MBR > Bootstrap
        - **MBR:** primer sector (512 bytes) del disco duro // contiene *tabla de particiones* // 'cede control al sector de arranque de la partición marcada como activa (contiene OS)'
        - ~~*Bootstrap:* BCD > bootmgr.exe/bootmgfw.efi > winload.exe > ntoskrnl.exe > smss.exe > winlogon // **'BCDEdit'**~~
  8. **Registro del sistema**
      - BaseDatos configOS (hardware, usuario, aplicaciones...) {PanelControl>WinReg}
      - ***REGEDIT:*** claves administrativas

| Keys                | Info |
| ---                 | ---  |
| HKEY_CLASSES_ROOT   | (`HKCR`) Archivos registrados, sus extensiones y programas asociados.
| HKEY_CURRENT_USER   | (`HKCU`)
| HKEY_LOCAL_MACHINE  | (`HKLM`) Config general del equipo, programas y dispositivos conectados.
| HKEY_USERS          | (`HKU`)
| HKEY_CURRENT_CONFIG | (`HKCC`) Configuración actual del sistema, dispositivos instalados.

```markdown
# ChatGPT
El sistema de registro de Windows es una base de datos jerárquica que almacena configuraciones y opciones para el sistema operativo y las aplicaciones instaladas en el equipo. Los cinco tipos de claves del registro de Windows son:
1. Clave de raíz (HKEY-CLASSES-ROOT): Contiene información sobre las extensiones de archivo, los tipos de archivo y las aplicaciones que manejan esos tipos de archivo.
2. Clave de configuración (HKEY-CURRENT-CONFIG): Almacena información sobre la configuración de hardware actual del equipo.
3. Clave de usuario actual (HKEY-CURRENT-USER): Almacena información sobre la configuración del usuario actual, como la configuración de escritorio, las preferencias de la aplicación y las contraseñas guardadas.
4. Clave de usuario local (HKEY-USERS): Contiene información sobre todos los usuarios que han iniciado sesión en el equipo.
5. Clave de máquina local (HKEY-LOCAL-MACHINE): Almacena información sobre el hardware, el software y la configuración del sistema operativo del equipo.
La diferencia principal entre estas claves es la información que contienen. La clave de raíz almacena información sobre las extensiones de archivo y los tipos de archivo, mientras que la clave de configuración almacena información sobre la configuración de hardware del equipo. La clave de usuario actual almacena información sobre la configuración del usuario actual, mientras que la clave de usuario local almacena información sobre todos los usuarios que han iniciado sesión en el equipo. La clave de máquina local almacena información sobre el hardware, el software y la configuración del sistema operativo del equipo.
```


## ud3-WinRegistry

- **Sistema de Registros de Windows**
  - INTRO
    - 'Delicado, cambios erróneos == catastróficos'
    - Cambios config exclusivos
    - Dos formas: Regedit VS *archivos REG o INF*
      - archivo > exportar > editar > guardar > doble click!
  - REGEDIT (ejemplos)