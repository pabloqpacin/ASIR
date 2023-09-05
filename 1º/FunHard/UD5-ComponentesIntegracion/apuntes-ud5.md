# UD5 Componentes Integración + Cableado Estructurado (+ GRUB!!)


- [UD5 Componentes Integración + Cableado Estructurado (+ GRUB!!)](#ud5-componentes-integración--cableado-estructurado--grub)
  - [ud5-teoria (componentes PC)](#ud5-teoria-componentes-pc)
  - [sistemasCableadoEstructurado](#sistemascableadoestructurado)
  - [GRUB stuff (!)](#grub-stuff-)


<details>
<summary>ChatGPT on Cableado Estructurado</summary>

```markdown
¡Hola! Con gusto podemos hablar sobre cableado estructurado y los distintos tipos de distribuidores.

El cableado estructurado es un sistema de cableado diseñado para proporcionar una infraestructura de telecomunicaciones que pueda soportar múltiples aplicaciones y servicios en un edificio o una planta. El objetivo principal es proporcionar un entorno flexible y escalable que pueda adaptarse a los cambios en la tecnología y las necesidades de la empresa.

Los distribuidores son componentes clave en un sistema de cableado estructurado, y su función es distribuir los servicios de red, voz y datos desde el equipo de comunicaciones a los puntos de conexión en las diferentes áreas del edificio o planta. Los principales tipos de distribuidores son:

Distribuidor principal (MDF): Es el punto de entrada del servicio de telecomunicaciones al edificio o planta, y es el lugar donde se concentran las conexiones de los proveedores de servicios de telecomunicaciones. El MDF también es el lugar donde se interconectan los distintos distribuidores secundarios o IDF (Intermediate Distribution Frame) que están ubicados en cada piso o sección del edificio.

Distribuidor secundario (IDF): Es el punto intermedio entre el MDF y las áreas de trabajo del edificio o planta. Los IDF están diseñados para manejar una gran cantidad de conexiones y proporcionar una mayor flexibilidad en la distribución de los servicios de telecomunicaciones a las diferentes áreas.

Distribuidor de zona (ZD): Es un distribuidor que se encuentra en una zona específica del edificio o planta, y está diseñado para manejar un número menor de conexiones que los IDF. Los ZD proporcionan una mayor flexibilidad en la distribución de los servicios de telecomunicaciones a las áreas de trabajo específicas, como oficinas individuales o áreas de trabajo compartidas.

Distribuidor de equipo (ED): Es un distribuidor que se utiliza para conectar el equipo de telecomunicaciones, como los servidores, routers y switches, a la red de telecomunicaciones del edificio o planta.

Cada tipo de distribuidor cumple una función específica en un sistema de cableado estructurado y debe ser seleccionado y ubicado de manera adecuada para proporcionar un sistema eficiente y escalable.
```

</details>


## ud5-teoria (componentes PC)

- **Componentes PC**
  - **Caja**
    - material==chapa-plástico-aluminio
    - formato==estándarATX-miniITX-grandeEATX
  - **PlacaBase**
    - formato==ATX
    - zócaloCPU==socketPGA_AMD-socketLGA_Intel
  - **Chipset:** conectividad CPU-RAM-GPU-SSD w/ USB-Ethernet-WiFi-Bluetooth
  - **Microprocesador-CPU:** circuitos_integrados, núcleos, rendimiento-consumo; **disipador de calor**
  - **RAM**: celdas; DDR4, SODIMM... [almacenamiento-volátil]
  - **Tarjeta Gráfica** & **GPU** <!--antialiasing, ...-->
  - **Unidades Almacenamiento** [almacenamiento-persistente]
    - *Discos Duros*
      - componentes==cabezas-platos-carcasa-brazos
      - zonas==pista-sector-cilindro
    - *Dispositivos Ópticos*
    - *Memorias Sólidas* (flash)
      - *SSD:* contienen memoria flash no volátil, memoria volátil SDRAM (buffer rápido) y controlador
      - *SSD M2:* modelos SATA y NVMe
  - **Conectores-Puertos**: USB, ATX, SATA, M2, audio... // **Periféricos I/O**


## sistemasCableadoEstructurado

- **Sistemas de Cableado Estructurado**
  - **INTRO**
    - 'Conjunto de componentes, cables, canalizaciones, conectores, espacios que conforman una red de datos'
    - Elementos funcionales:
      - *Área de trabajo:* terminal y entorno
      - *Subsistema Horizontal:* elementos planta centralizados en...
        - DISTRIBUIDOR de PLANTA
      - *Subsistema Vertical:* comunica todos los Distribuidores de Planta con el...
        - DISTRIBUIDOR de EDIFICIO
    - **CABLES**
      - Distancias de cableado estructurado: 5 metros // 90 metros
      - Tipos de cables:
        - Coaxial
        - Par trenzado: UTP (Cat5 Cat6), FTP, STP
        - Fibra óptica
      - Elementos distribución:
        - Canaletas
        - Suelo técnico
        - Paredes


![Categorías - Cable Par Trenzado](/FunHard/UD5-ComponentesIntegracion/parTrenzadoCATS.png)


## GRUB stuff (!)