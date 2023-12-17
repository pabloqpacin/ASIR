# Windows Server 2022 - DHCP (GUI)

## Subnetting

 dirección de red 192.168.100 realizar 10 subredes y quedaros con la última subred disponible para hacer el direccionamiento de red.

- Cálculo

```yaml
# X Subredes:
#    - 2^n >= x
#    - /mask + n

# ...

# 192.168.100.-0/24: 10 subredes
2^n >= 10: 2⁴ >= 10: 16 >= 10:
/24 + 4 = /28:
    192.168.100.-0000-0000          # 1: 192.168.100.0/28
    192.168.100.-0001-0000          # 2: 192.168.100.16/28
    192.168.100.-0010-0000          # 3: 192.168.100.32/28
    192.168.100.-0011-0000          # 4: 192.168.100.48/28
    192.168.100.-0100-0000          # 5: 192.168.100.64/28
    192.168.100.-0101-0000          # 6: 192.168.100.80/28
    192.168.100.-0111-0000          # 7: 192.168.100.96/28
    192.168.100.-1000-0000          # 8: 192.168.100.112/28
    192.168.100.-1001-0000          # 9: 192.168.100.128/28
    192.168.100.-1011-0000          # 10: 192.168.100.144/28
```

- Última subred de 10 para servicios DHCP/DNS

```yaml
Dirección de red:   192.168.100.144/28
Primer host:        192.168.100.145
Último host:        192.168.100.158
Broadcast:          192.168.100.159
```

## Instalar servicio DHCP

> **Configuración de red VM**: bridged o NAT

```yaml
Administrador del servidor: Administrar:
    Agregar roles y caracteristicas

- Tipo de instalacion: Caracteristicas o roles
- Seleccion de servidor: VM (192.168.1.47)
- Roles de servidor: DHCP + DNS
    - Incluir herramientas de administracion: si
    # AVISO NO DIRECCION ESTATICA == OK
    - Caracteristicas: ...
    - Servidor DHCP: ...
    - Servidor DNS: ...
    - Confirmacion: no reiniciar - instalar

Completar configuracion de DHCP: confirmar crear grupos de seguridad 'Admin DHCP' y 'Usuarios DHCP'
```

> **Configuración de red VM**: red interna

- Configurar IP estática

```yaml
Panel de control: Redes e internet:
    Centro de redes y recursos compartidos: Ethernet

Propiedades:
    Protocolo de Internet version 4 TCP/IPv4: Propiedades:
        Usar siguiente direccion IP:
            - Direccion IP:         192.168.100.145
            - Mascara de subred:    255.255.255.240
            - Default gateway:      192.168.100.145
            
            # - Default gateway:      192.168.0.1         # Advertencia: la puerta de enlace predeterminada no está en el mismo segmento de red (subred) que definen la dirección IP y la máscara de subred. ¿Desea guardar esta configuración?
        
        Usar siguientes direcciones DNS:
            - 192.168.100.145
            - 8.8.8.8
```

- Configurar servicio DHCP

```yaml
Administrador del servidor: Herramientas:
    DHCP

IPv4: Ambito nuevo:
    - Nombre: WinSer_DHCP_DNS
    - Direccion IP inicial: 192.168.100.146
    - Direccion IP final: 192.168.100.158
    - Longitud: 28
    - Mascara subred: 255.255.255.240
    - Intervalo de direcciones excluido: 192.168.100.146 a 192.168.100.149
    - Duracion de concesion: 8 horas
    - Enrutador/Puerta de enlace: 192.168.100.145
    - DNS: 192.168.100.145, 8.8.8.8                     # europea.org ????
    # - WINS: ...
    - Activar ambito: si
        # 'Para proporcionar alta disponibilidad ...configurar "conmutación por error"'
```
```yaml
Administrador del servidor: Herramientas:
    DHCP

IPv4: Ambito 192.168.100.144:
    Reservas: Reserva Nueva:
        - Nombre: ftp-win11
        - Direccion IP: 192.168.100.146
        - Direccion MAC: 08-00-27-58-d0-b7

IPv4: Ambito 192.168.100.144:
    Reservas: Reserva Nueva:
        - Nombre: web-arch
        - Direccion IP: 192.168.100.148
        - Direccion MAC: 08-00-27-9c-6a-c1
```
---

## DNS

```yaml
Administrador del servidor: Herramientas:
    DNS

Zona Inversa: Zona nueva:
    - Tipo de zona: zona principal
    - Protocolo: IPv4
    - Id. de red: 192.168.100
    - Crear archivo: 100.168.192.in-addr.arpa
    - Actualizacion dinamica: no
    - Finalizar

Zona Directa: Zona nueva:
    - Tipo de zona: zona principal
    - Nombre de zona: europea.org
    - Crear archivo: europea.org.dns
    - Actualizacion dinamica: no
    - Finalizar
```
```yaml
Zona Directa: europea.org: Host nuevo (A o AAAA):
    - Nombre: ns
    - FQDN: ns.europea.org.
    - Direccion IP: 192.168.100.145
    - Crear PTR: si   

Zona Directa: europea.org: Host nuevo (A o AAAA):
    - Nombre: ftp
    - FQDN: ftp.europea.org.
    - Direccion IP: 192.168.100.146
    - Crear PTR: si                     # zona inversa

Zona Directa: europea.org: Host nuevo (A o AAAA):
    - Nombre: www
    - FQDN: www.europea.org.
    - Direccion IP: 192.168.100.148
    - Crear PTR: si                     # zona inversa

Zona Directa: europea.org: Alias nuevo (CNAME):
    - Nombre: web
    - FQDN: web.europea.org.
    - Host destino: www.europea.org

Zona Directa: europea.org: Alias nuevo (CNAME):
    - Nombre: transfer
    - FQDN: transfer.europea.org.
    - Host destino: ftp.europea.org

```



---

- Comprobación en servidor

```yaml
Administrador del servidor: Herramientas:
    DHCP

IPv4: Ambito 192.168.100.0: Concesiones de direcciones:
    - 192.168.100.3: ArchClient
    - 192.168.100.16: Win11ProES
```



- Comprobación en clientes

```ps1
# Windows
ping 192.168.100.1
(get-netipadress -interfacealias 'ethernet' -addressfamily ipv4).ipaddress  # 192.168.100.16
# (get-netipconfiguration -interfacealias 'ethernet').ipv4address
```

```bash
# Linux
ping -c2 192.168.100.1
```

---

<!-- - Demostración en clientes

```ps1
ipconfig /release

ipconfig /renew
```
 -->



