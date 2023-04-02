# Redes — UD6: Dispositivos Interconexión Red

## ud6-teoria

```markdown
1. Elementos básicos de interconexión
2. Dispositivos de interconexión a nivel físico
   1. Módems
   2. Repetidores y amplificadores
   3. Concentradores (Hubs)
3. Dispositivos de interconexión a nivel de enlace
   1. Puntos de Acceso
   2. Puentes
   3. Conmutadores (Switches)
4. Dominios de colisión y dominios de broadcast
5. Tecnologías específicas de los conmutadores
   1. Redes de área local virtuales (VLAN)
   2. Tratamiento de bucles en la red: Protocolos Spanning Tree
```

1. **Elementos básicos de interconexión**
    - *Puertos I/O* == serie(`RS-232`: `DB-25`||`DB-9`) - paralelo(impresoras) - USB - Fireware - expansión(`ISA`||`PCI`) - RJ45
2. **Dispositivos** de interconexión a **nivel físico**
   1. *Módems* == puertos serie||USB &emsp; // modulación digital<>analógica
       - *ESTÁNDARES* == modem-terminal (normativas X RS) || modem-red (normativa V)
       - **TECNOLOGÍAS**
         - *DSL* == canal teléfono: datos digitales (frecuencias altas) -- subida VS bajada (simétrico||asimétrico)
         - *Cable* == WAN via Coaxial TV -- 300Kbps-10~40Mbps
   2. *Repetidores y amplificadores* == (cascada.ruido) digital-replicar-10Base2>10BaseT... || analógica-magnificar
   3. *Concentradores* == centralizar conexiones (topología Estrella) .. pasivos || activos &emsp; // Hub x2 == puerto normal + (crossover) puerto cruzado OR latiguillo-cruzado
       - **HUB** == difusión-all > *+ dominio difusión*
       - **MAU** == "Token-Ring"
3. **Dispositivos** de interconexión a **nivel de enlace** <!-- Entienden MACs // redirigen bien-->
   1. *Puntos de Acceso* == red inalámbrica (MAC propia!) &emsp; // Varios == solapamiento 20-30%; misma red-frecuencia (SSID) distintos canales
   2. *Puentes* == (tabla MACs) unir segmentosRed||dosLAN (diff topología||cableado||techEnlace)
       - FASES == almacenarTramaMemoria - comprobarCRC - retocarFormato - redirigir(MAC||**flooding**)
       - TIPOS == 802.X-802.Y(formatoTramas,velocidad,accesoMedio) - Transparentes(aceptaTodo) - Remotos(1cadaRed=LAN+WAN)
   3. *Conmutadores (Switches)* == SEGMENTAR red // soloLAN, velocidad, protocolos SNMP RMON
       - Tabla MACs/Puertos > floodingInicial > redirigirTrama
       - Switch x2 == crossover aka MDI||MDIX
       - CONFIG == WEB(GUI) || CONSOLA(CLI) :: modo usuario||**ADMIN**...
         - *conf Global* == tablaMACs, IP-subnetMask, enlaceTelnetSSH...
         - *conf Interfaz* == puertoShut, duplex||halfDuplex, velocidad[10,100,1000mb/s], spanTree!
         - *conf RedesVirtuales* == VLANs
         - *conf Línea* == prep conxiones para admin remota
4. **Dominios de colisión y dominios de broadcast** <!--medio compartido = desafíos-->
    - *Dominio de Colisiones* == segmento físico red (CSMA/CD) => colisiones Tramas &emsp; // Más segmentos, mejor rendimiento ... `Rendimiento(%) = (1 - Colisiones/PaquetesTotales) * 100`
    - *Dominio de Broadcast* == área lógica red => `FF.FF.FF.FF.FF.FF`
    - SEGÚN DISPOSITIVO
      - **Hub** == 1 DdC - 1 DdB
      - **Switch** == 1 DdC PUERTO - 1 DbB !VLAN
      - **Router** == 1 DdC PUERTO - 1 DdB PUERTO
5. Tecnologías específicas de los conmutadores
   1. **Redes de área local virtuales (VLAN)**
       - políticas de conexión Red Lógicas != ubicación/cableado físico &emsp; // estática || dinámica (`GVRP`)
       - *Ventajas* == flexibilizar/dividir red (criterios) - velocidad - anchoBanda - seguridadAislamiento - gruposDispositivos - adminSimple - dominiosBroadcastIndependientes
       - *MÉTODOS* == **VLAN Tagging** (NIC.MAC>`802.1Q`>Switch:\<tag>) - **VLAN Untagging** (Switch.Puerto.\<untag>) - Switch x2 = conexión cable "uplink" > **"trunk"**
   2. Tratamiento de bucles en la red: Protocolos **Spanning Tree**
       - redundancia <!--varios caminos--> = ok || *tormentasBroadcast* (broadcast xN)
       - *SPT* == protocolo dinámico bloquear enlaces Bucles &ensp; - &ensp; rootBridge(Switch) > bloqueoLógicoRedundancia+selecciónCortosIdóneos > tramasPuertosSeleccionados > fallo=recalcular &ensp; - &ensp; [`RSTP` `IEEE 802.1w`]

