# Redes — UD4: Capa Física

## ud5-teoria .pdf

```markdown
1. Concepto de Capa Física
2. Características de las Señales
3. Los Medios de Transmisión
4. Infraestructura Física de una Red
   1. Tarjetas de Red
   2. Tipos de Cables
      1. Cables de Par Trenzado
      2. Cables Coaxiales
      3. Cables de Fibra Óptica
   3. El Cableado Estructurado
   4. Los Medios Inalámbricos
```

1. Concepto de Capa Física
    - Características == **mecánicas** VS **eléctricas** &emsp; // Protocolo: **Ethernet** (`IEEE 802.3`)
2. Características de las Señales
    - Ondas Electromagnéticas == amplitud && frecuencia && fase &emsp; // Señales *analógicas* || *digitales* (`0`,`1`)
    - Teorema de Fourier (armónicos) ... **ancho de banda** ... *NRZ* ... **modulación**
    - *Perturbaciones* == atenuación || distorsión || ruido (térmico - intermodulación - diafonía - **impulsivo**)
3. Los Medios de Transmisión
    - TIPOS == Cableados (velocidadTransmisión, anchoBanda, distanciaRepetidores, fiabilidad, coste, facilidadInstalación) || Inalámbricos
    - **COMUNICACIÓN** == ED || PaP-multipunto || simplex-halfDuplex-duplex
4. Infraestructura Física de una Red
   1. **Tarjetas de Red**
       - NIC == pc -x- red  &emsp; // **MAC** == OUI + NIC <!--24+24 bits--> &emsp; // Drivers
       - velocidadTransmisión - cantidadInfo - protocolos - parámetrosFísicos
       - *Componentes* == procesador - bus - zócaloROM.BIOS - conectorWakeOnLan - transceptor(CSMA/CD) - indicadoresEstado(LEDs LNK||ACT||COL) - salidaRed(RJ45||antena)
       - WINDOWS == **CentroDeRedesRecursosCompartidos** || `ipconfig`
   2. Tipos de Cables
      1. **Cables de Par Trenzado**
          - *Definición* == 8 hilos = 4 pares trenzados (naranja,verde,azul,marrón) &emsp; // ~~568-A || 568-B~~ &ensp; RJ45
          - Directos || Cruzados ... 'auto-negociación'
          - *TIPOS* == UTP || STP || FTP 
          - *Clasificación* == Categoría (1-8) VS Clase (A-F)
          - Nomenclatura Ethernet == `10BASE-T`, `100BASE-T` ...
      2. **Cables Coaxiales**
          - *Definición* == (componentes + BNC) &emsp; // TV
          - *Características* == capacidad(pF/m) - velocidadPropagación(+80%) - potenciaTransmisible(W) - tensiónTrabajo(kv) - *impedancia*(50||75Ω) - atenuación(dB/m)
          - **TIPOS**...
            - *Banda Base* == (50Ω - 1km - 10mb/s) **Grueso** (10BASE-5... RG100||150) || Fino (10BASE-2... 0.5cm ...'BNC')
            - *Banda Ancha* == (70Ω - 100km - 150Mbs/300MHz) TV
            - *Nomenclatura Ethernet* == `10BASE-5` `10BASE-2` `10BROAD-32`
      3. **Cables de Fibra Óptica**
          - *Definición* == (luz+medio+detector)
          - *TIPOS* == monomodo SMF (10μm) || multimodo MMF (100μm) || multimodo de índice gradual &emsp; // Cable holgado || recubrimiento ajustado
          - *Características* == velocidades 1-10Gb/s, distancias 30-40km &emsp; // **Coste Instalación** ... conectores 'SC' || 'ST'
          - *Nomenclatura Ethernet* == `100BASE-SX` `1000BASE-LH` `1000BASE-LX10`
   3. **El Cableado Estructurado**
       - *TAREAS* == tomasCorriente - rosetasJacks - tendidoCables - conexiónCablesPanelesRosetas - probadoCables - etiquetadoDocumentación - adaptadoresRed - dispositivosRed - softwareRed
       <!-- - APPROACH == "dividir la instalación de red en subsistemas independientes pero integrados" -->
       - **NIVELES**
         - *Subsistema Horizontal* == localización equipos + creación latiguillos (crimpado 568A||B > RJ45 [DIRECTO]) + Rosetas RJ45 + Canalización cables (suelo-techo-paredes > patch panel + hub/switch .. rack)
         - *Subsistema Vertical* == [...]
         - *Cuarto de servidores || servicios red* == servidor central + backups + Routers ( + proxy  + cortafuegos) + **SAI**
       - *PoE* == eg. webcam
       - **Certificación-Comprobación Instalación** == `EIA/TIA 568`: requerimientosMínimosCableado + topologíaDistancias + parámetrosRendimiento &emsp; // *TESTS* == comprobadoresContinuidadCable + verificadoresCable + analizadoresRedes
   4. **Los Medios Inalámbricos**
       - antenas + ondas electromagnéticas // +frecuencia == +sensible
       - *Desafíos* == reflexión || difracción || dispersión
       - ámbitos == WPAN - WLAN - WMAN - WWAN
       - *Tecnologías*
         - **Bluetooth** == ISM 2.4GHz; Clase 1-3, Versión 1-4
         - **Wi-Fi** == `IEEE 802.11` = estación, medio, puntoAcceso, sistemaDistribución, modoConexión, conjuntoServicioExtendido, áreaServicioBásico, movilidad, cobertura
           - IEEE `802.11a` (5GHz, 20-54Mbps, 12[8+4]) &ensp; - &ensp; `802.11b` (2.4GHz, 3-11Mbps, 14, 60/120m) &ensp; - &ensp; `802.11g` (2.4GHz, 20-54Mbps, 14, 20-75m) &ensp; - &ensp; `802.11n` (2.4 & 5GHz, 150-600Mbps, MIMO, 80-250m)
            - Canales = 5MHz ...  &emsp; // **SSID** || **BSS**
            - *SEGURIDAD* == ocultarSSID + encriptación (WEP || WPA2 || WPA-PSK) + auth.RADIUS + filtrado MAC



---

> [4.2.1] Cables de Par Trenzado

<!-- ![Cats...](/img/Redes/ud4-twisted_pair_cable_types.png) -->

<!-- <p align="center"> -->
  <!-- <img src="/img/Redes/ud4-twisted_pair_cable_types.png" alt="Cable Cats" width="400"/> -->
<!-- </p> -->

![Cable Cats](/img/Redes/ud4-twisted_pair_cable_types.png)