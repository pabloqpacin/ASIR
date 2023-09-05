# Hardware UD2 — Apuntes

## ud2-teoria

- **UD2 — Software Respaldo...**
  - **PARTICIONES**
    - Dispositivo de almacenamiento TIENE estrucutura de particiones
    - Partición CONTIENE un sistema de archivos independiente
    - **Particionamiento MBR:** tamañoMáximo==2TB particionesPrimarias==4max(3ifExt) particionesExtendidas==1max particionesLógicas==OKifExtendida particiónArranque==Activa
      - sectorArranque==sectorCero --> contiene TablaDeParticiones & GestorDeArranque
      - Reglas particionamiento:
    - **Particionamiento GPT:** versión moderna, más de 4 primarias, tabla de particiones GUID tb en cada partición
    - "Si se necesita particionar un dispositivo de almacenamiento, primero se particiona, luego se formatea lógicamente  para implantar  un sistema  de archivos  determinado. Los sistemas archivo  más  utilizados son HFS Plus en Apple, NTFS en Microsoft Windows, EXT en Linu x, FAT para todo sistema operativo."
  - **CLONACIÓN**
    - Copiar DiscoDuro (partición x?) --> DiscoDuro || Imagen
    <!-- - Herramientas: Clonezilla, G4L, PartitionImage, TrueImage -->
  - **Secure Boot:** disable to Linux
  - **BACKUPS**
    - Tipos
      1. *Totales:* lentas, completas 
      2. *Diferenciales:* menos lentas, incompletas (diff w última total)
      3. *Incrementales:* rápidas, incompletas (diff w última any)
    - Tips&tricks: automatización, calendario, simulacros, protección
  - **RAID**
    - *RAID 0:* min==2 velocidad==OK redundancy==NOT
    - *RAID 1:* min==2 velocidad==OK redundancy==YES usage==n-1
    - *RAID 5:* min==3 velocidad==OK redundancy==YES usage==n-1 // 'paridad distribuida'
    - *RAID 6:* min==4 velocidad==NotOK redundancy=YES usage==n-2 // 'doble paridad'
    - *RAID 1+0:* min==4

## ud2-presentacion

- **Software Respaldo**
  - **BIOS vs UEFI** (POST)
  - **PARTICIONES:** max 4 primarias, max 1 extendida
  - **MBR** (Tabla Particiones) vs **GPT**
  - **FORMATEO**
    - Físico: tamaño, número y ubicación bloques
    - Lógico: integridad bloques, reescritura tabla particiones
  - **BACKUPS**
    - *Completa*
    - *Incremental*
    - *Diferencial*
    - **Imagen**
  - **RAID**
    - RAID 0
    - RAID 1
    - RAID 5
    - RAID 6