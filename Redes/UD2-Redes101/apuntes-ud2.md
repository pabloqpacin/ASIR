# Redes - UD2: Redes 101s


## (I) Teoría

### 1. Definición
- Características
  - Conectividad
  - Escalabilidad
  - Seguridad
- Ventajas
  - Compartir recursos -hardware & software-
  - Gestión centralizada
  - Reducción costes

### 2. "Comunicación"
- Fuente > Emisor > Canal (codificación mensaje + gestión ruido) > Receptor > Destino // protocolos

### 3. Componentes
Una red informática está formada por un **conjunto de nodos o hosts** (dispositivos informáticos) y software **conectados entre sí** por medio de dispositivos físicos que envían y reciben impulsos eléctricos, ondas electromagnéticas o cualquier otro medio para el transporte de datos.

#### 3.1 Hardware
1. **Nodos:** clientes VS servidores (impresión, archivos, aplicación, web, correo, proxy <!--diferentes PUERTOS!!-->) 
2. Tarjeta de red
3. **Cables:** coaxial, par-trenzado, fibra
4. Cableado estructurado
5. **Elementos interconexión:** hub, repetidor, switch, bridge, access-point, router, firewall

#### 3.2 Software
1. Adaptador red
2. **Software en Sistema Operativo:** cliente VS server

### 4. Clasificación

#### 4.1 Según 'canal transmisión'
1. **Punto-a-punto:** redes conmutadas (conmutación paquetes —conexión VS datagramas—)
2. **Multipunto:** 1 línea compartida == competición nodos // red difusión (+broadcast)

#### 4.2 Según direccionalidad
Simplex VS Half-Duplex VS Full-Duplex

#### 4.3 Según cobertura
PAN < LAN < CAN < MAN < WAN

#### 4.4 Según topología
- **Diferenciación:** topología FÍSICA vs LÓGICA
- **Tipos:** bus, anillo, malla, estrella, jerárquica

#### 4.5 Según 'medio transmisión'
Cableadas VS Inalámbricas —infraestructura VS ad-hoc == PoA VS P2P—

#### 4.6 Según relación nodos
Cliente-servidor VS Peer-to-peer

#### 4.7 Según privacidad
Públicas VS Privadas —internet VS intranet—


## (II) Subnetting

### Conceptos

- **Subnetting:** subdividir red IP física en varias redes lógicas más pequeñas; redes individuales (transmisión paquetes) dentro de red principal y mismo dominio.
- Broacast
- Dirección IP
- Dirección de red
- Dirección de host
- Subred
- Dirección subred
- **Fórmulas subnetting:** `2^n=x` para subredes, `2^n-2=x` para hosts

> Explicación lamentable, lucky me I learnt with David Bombal in Udemy!