# Hardware - Resumen Total

<details>
<summary>Table of Contents</summary>

- [Hardware - Resumen Total](#hardware---resumen-total)
  - [101](#101)
  - [UD1: Software Configuración](#ud1-software-configuración)
  - [UD2: Software Respaldo](#ud2-software-respaldo)
    - [1. Intro | BIOS](#1-intro--bios)
    - [2. Particionamiento (MBR ~~GPT~~)](#2-particionamiento-mbr-gpt)
    - [3. Formateo \& Clonación](#3-formateo--clonación)
    - [4. Copias de seguridad](#4-copias-de-seguridad)
    - [5. RAID](#5-raid)
  - [UD3: Modelo Lógico](#ud3-modelo-lógico)
    - [1. Modelo Von Neumann](#1-modelo-von-neumann)
    - [2. Generaciones Históricas en Computación](#2-generaciones-históricas-en-computación)
  - [UD4: Estructura CPD](#ud4-estructura-cpd)
    - [1. Intro](#1-intro)
    - [2. Organización CPD](#2-organización-cpd)
    - [3. Cloud](#3-cloud)
  - [UD5: Componentes Integración](#ud5-componentes-integración)
  - [UD6: Ensamblaje Equipos](#ud6-ensamblaje-equipos)

</details>

## 101

- **Proceso Encendido PC:** POST > BIOS > arranque
- [ ] *Cableado Estructurado* ? ud4|5
  - Subsistemas horizontal|vertical + Distribuidores edificio|planta
    - CABLES RED!!

<hr>

## UD1: Software Configuración

- ...

<hr>

## UD2: Software Respaldo

### 1. Intro | BIOS

- **BIOS:** secuencia arranque, avisos fallo hardware, memoria no-volátil (16bit)
  - *UEFI:* secureBoot (32/64bit)

### 2. Particionamiento (MBR ~~GPT~~)

- **Particiones:** sectorArranque (1) | primarias (3|4) | extendida (0|1) | lógicas (0|*)
  - *Sector Arranque:* tablaParticiones + gestorArranque

### 3. Formateo & Clonación

- **Formateo:** Físico | Lógico
- **Clonación:** con|sin OS

### 4. Copias de seguridad

- *Completas:* se copia todo
- *Incrementales:* lo nuevo desde la última copia
- *Diferenciales:* lo nuevo desde la última copia completa
- *Espejo:* se copia todo + OS

### 5. RAID

- **Definición:** varios discos duros que funcionan como uno
- **Tipos:**
  - *RAID 0:* min 2 // sin redundancia // mejor velocidad lectura y escritura
  - *RAID 1:* min 2 // redundancia // mejor lectura, igual escritura
  - *RAID 5:* min 3 // redundancia + paridad // mejor escritura
  - *RAID 6:* min 4 // redundancia + paridad*2
- *RAID anidados:* 0+1, 1+0, 5+0...

<!-- PRÁCTICA: Clonezilla -->

<hr>

## UD3: Modelo Lógico

### 1. Modelo Von Neumann

- **Modelo:** procesador (CU + ALU + regs.) + almacenamiento + buses + IO
- **Instrucciones:** `fetch` > `decode` > `execute` > `store`
- *EXTRA:* SoC, GPU, CISC/RISC, AI (ML,DL)

### 2. Generaciones Históricas en Computación

| Gen. | Fechas    | Características
| :-:  | ---       | ---
| 0    | —         | ábaco, logaritmos, punchcards, sistema binario
| 1    | 1940_1956 | válvulas vacío, ENIAC
| 2    | 1956_1963 | transistores, batch processing, primeros lenguajes programación
| 3    | 1964_1971 | circuitos integrados, lenguajes alto nivel
| 4    | 1971_1981 | microprocesadores, uso doméstico
| 5    | 1982_1991 | Ley de Moore, abaratamiento, multimedia, redes
| 6    | 1992_hoy  | Internet

<hr>

## UD4: Estructura CPD

### 1. Intro

- **Principios:** fiabilidad, disponibilidad, eficiencia e integración
- **Tendencias:** cómputo en la nube & virtualización ( hipervisores )

### 2. Organización CPD

- **Requisitos:** diseñoPrevio, seguridadFísica, suministroEléctrico, aislamientoAcústico,  temperaturaHumedad, dimensiones (2000kg/m2 & 2.5m altura)
- *Control de Acceso:* cerrojos, códigos de acceso, bandas magnéticas, RFID, Biométrico
- *EXTRA:* planContinencia, mecanismosVigilancia (`SAI`), ...
  - *ServidoresAlmacenamientoEmpresarial:* SAN, Flash, VVOLS

### 3. Cloud

- **Según despliegue ([doc](https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary/what-are-private-public-hybrid-clouds)):**
  - *Pública:* varios usuarios/clientes
  - *Privada:* 1 cliente final, 1 red
  - *Híbrida:* on-premise + abierta

- **Según Servicios:**
  - *On-Premise*: —
  - *IaaS*: se proporciona red y hardware (virtual)
  - *PaaS*: se proporciona OS
  - *SaaS*: se proporciona todo

<hr>

## UD5: Componentes Integración

- **Caja:**
  - *Material:* chapa,plástico | aluminio
  - *Formato:* ATX, microATX, mini|picoITX, EATX
- **Placa Base:**
  - *Formato:* ATX, ITX...
  - **Zócalo CPU:** LGA (Intel, pines CPU) | PGU (AMD, pines MOBO)
- **Microprocesador:** circuitos integrados; disipación calor
- **Memoria RAM:** RAM > SDRAM > DDR > DDR2 > DDR3 > DDR4 // SO-DIMM
- **Tarjeta Gráfica & GPU:** ...
- **Unidades Almacenamiento:**
  - *Discos Mecánicos:* carcasa + platos + cabezas + brazos // pista + sector (512 bytes) + cilindro
  - *Memorias Sólidas:* SSD (+SDRAM) // ~~SATA~~ M2: PCIe | NVMe
- **Conectores:** USB, ATX, SATA|M2, ventiladores, altavoz|sonido, HDMI...

<hr>

## UD6: Ensamblaje Equipos

- **Chequeo & Diagnóstico**
    - *Monitorización del sistema BIOS/UEFI:* voltaje, temperatura, velocidad ventiladores...
  - *Chequeo de memoria:* ...
  - *Conectividad a redes:* `ping`
- **Precauciones Manipulación Componentes Electrónicos:** descargarse energíaEstática, bordes componentes, no fuenteAlimentación, cuidado bolsaElectrostática, justa pastaTérmica
