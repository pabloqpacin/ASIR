# Redes — UD5: Nivel de Enlace

## ud5-teoria

```markdown
1. Concepto de Capa de Enlace
2. FUNCIONES
   1. Formación y Delimitación de las TRAMAS
      1. Campos de Trama `802.3` Ethernet
      2. Campos de Trama `802.11` Wi-Fi
   2. Acceso al Medio
      1. División Estática: Multiplexación
      2. División Dinámica
   3. Control de Errores
      1. Detección de Errores
      2. Corrección de Errores
   4. Control de Flujo
      1. Parada - espera
      2. Ventana deslizante
```


1. *Concepto* de Capa de Enlace
    - OSI.2 - PDU=Trama &emsp; // errores > delimitaciónTramas &emsp; // MACs + datos + CRC + SecuenciaControl
2. FUNCIONES
    - *Ethernet* == **MAC** (delimitación + direccionamiento + protocoloAccesoMedio) + **LLC** (errores + flujoDatos)
   2. **Formación y Delimitación de las TRAMAS** (Ob.)
      1. Campos de Trama `802.3` **Ethernet**
          - *Preámbulo y SDF* == `10101010` x7 + `10101011` x1
          - *Direcciones MACs* == Destino (x6) + Origen (x6)
          - *Etiqueta 802.1Q* == [VLAN] x4
          - *Longitud-Protocolo* == define tamaño Datos - protoclo (`0080`=IPv4) x2
          - *Datos* == (MTU = 1500 bytes || *jumbo* MTU = 9000 bytes) min. 46 bytes
          - *CRC* == x4 &emsp; // ídem Receptor Emisor
          - *GAP entre frames* == (x12)
      2. Campos de Trama `802.11` **Wi-Fi**
          - *DIFF* == nº MACs && ~~CRC~~ > MIC
   3. **Acceso al Medio**
      1. **División Estática**: Multiplexación (Ob.) <!--ancho de banda-->
          - *TDM* == intervalos mismo canal; secuencias
          - *FDM* == filtro frecuencias
          - *SDM* == espacio/señal
          - *CDM* == código/señal
          - ~~WDM~~
      2. **División Dinámica**
          - *CSMA/CD* == escucha > transmisión >? colisión > *jam* - backoff.algo (2^col) --max 2^10 || 16 colisiones--
          - *Token Ring* == (`802.5`) topología anillo; turno
   4. Control de Errores (Op.)
      1. **Detección de Errores**
          - *CRC* == polinomio(default+datos).0-31bits 
      2. **Corrección de Errores**
          - *Tramas perdidas* == confirmacionesPositivas `ACK` --reenviar--
          - *Tramas dañadas* == (CRC) `neg ACK` --reenviar--
          - *ARQ* == parada-espera, vueltaAtrás, rechazoSelectivo
   5. **Control de Flujo** (Op.)
      1. *Parada-espera* == trama1 > ACK1 > trama2 > ACK2 (tiempo) &emsp; // error == `1` cabecera --reenviar-- 
      2. *Ventana deslizante* == buffer simultáneo n tramas + ACK --desplazamiento buffer-- (controladorTarjetaRed)
          - *ARQ* == vueltaAtrás && retransmisiónSelectiva

