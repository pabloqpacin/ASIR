# REDES - SIMULACRO 2

<!-- > - NOTA 1: EXAMEN: se entregarán los dos ejercicios prácticos en un solo documento
> - NOTA 2: misma subred & dominio para todos los ejercicios

```md
Simulacro 2
Esta prueba de conocimiento consiste en un cuestionario tipo test de preguntas, con 4 opciones de respuesta donde solo 1 es verdadera y en tres preguntas de desarrollo, donde tenéis que hacer dos de ellas.
La puntuación obtenida puede variar entre 0 y 10 puntos (correspondiendo 3 puntos al tipo test y 7 puntos a las preguntas de desarrollo).
El tiempo de realización de la prueba es de 90 minutos. Se debe tener en cuenta el siguiente criterio para la parte tipo test:
• Las preguntas correctas puntúan 0,20 puntos.
• Las preguntas incorrectas restan 0,10 puntos de la puntuación final.
• Las preguntas no contestadas no puntúan ni quitan puntos.
Uso de Máquinas virtuales, Ubuntu Server y cliente linux.
¡Mucha suerte!
``` -->

## TEST


## Desarrollo

### Desarrollo 1

<!-- ```md
Dada la dirección IP 192.168.100.0 crear 8 subredes. Quedaros con la segunda subred para asignar rango.  Tienes que instalar y configurar los servicios DHCP, DNS y HTTP.
- Haz una reserva a un cliente Linux.
- Crea el dominio simulacro.es. Crea el host y alias de los servicios web, ftp y correo.
- Crea un servidor web para dar gestión a la página web
``` -->

#### 0. Misc

- Necesario para que la máquina virtual Ubuntu Server gestione dos interfaces de red, una Bridged y la otra en Red Interna (o Red NAT):

```bash
sudo apt update && sudo apt install -y \
    openvswitch-switch net-tools
```

#### 1. Subnetting

<!-- - Cálculo

```bash
# X Subnets:
#     - 2^n >= x
#     - /mask + n

# 192.168.100.-0/24: 10 subredes
2^n >= 8: 2³ >= 10: 8 >= 8:
/24 + 3 = /27:
    192.168.100.-000-00000          # 1: 192.168.100.0/27
    192.168.100.-001-00000          # 2: 192.168.100.32/27 -- !!
    192.168.100.-010-00000          # 3: 192.168.100.64/27
    192.168.100.-011-00000          # 4: 192.168.100.96/27
```

- Subred

```yaml
Direccion red:  192.168.100.32/27
Primer host:    192.168.100.33        # en nuestro caso, el servidor DHCP+DNS+etc.
Ultimo host:    192.168.100.62
Broadcast:      192.168.100.63
``` -->

#### 2. DHCP

- Instalación de paquetes necesarios

```bash
sudo apt update && sudo apt install -y \
    isc-dhcp-server
```

<!-- - Asignar direccionamiento estático en red interna (segundo adaptador de red)

```bash
sudo mv /etc/netplan/00-installer-config.yaml{,.bak}

cat<<EOF | sudo tee /etc/netplan/00-installer-config.yaml
# This is the network config written by '@pabloqpacin'
network:
  ethernets:
    enp0s3:
      dhcp4: true
    enp0s8:
      dhcp4: false
      addresses: [192.168.100.33/27]
      nameservers:
        addresses: [192.168.100.33]
  version: 2

EOF

sudo netplan try || \
sudo netplan apply
```

- Definir interfaz para servicio DHCP

```bash
sudo sed -i '/^INTERFACESv4/s/""/"enp0s8"/' /etc/default/isc-dhcp-server
```

- Configuración servicio DHCP

```bash
sudo sed -i '/^option domain-name\s/s/example.org/simulacro.es/' /etc/dhcp/dhcpd.conf
sudo sed -i 's/^option domain-name-servers .*/option domain-name-servers ns.simulacro.es;/' /etc/dhcp/dhcpd.conf    # TODO: avoid repetition

cat<<EOF | sudo tee -a /etc/dhcp/dhcpd.conf

subnet 192.168.100.32 netmask 255.255.255.224 {
  range 192.168.100.40 192.168.100.60;
  option subnet-mask 255.255.255.224;
  option routers 192.168.100.33;
  option domain-name-servers 192.168.100.33;
  option domain-name "simulacro.es";
}

host cliente_linux {
  hardware ethernet 08:00:27:9c:6a:c1;
  fixed-address 192.168.100.36;
}

# host cliente_windows {
#   hardware ethernet 08:00:27:58:d0:b7;
#   fixed-address 192.168.100.35;
# }

EOF
```

- Aplicamos la configuración

```bash
sudo systemctl restart isc-dhcp-server
``` -->


#### 3. DNS

- Instalación de paquetes necesarios

```bash
sudo apt update && sudo apt install -y \
    bind9 bind9-utils
```

<!-- - Definimos zonas de resolución

```bash
cat<<EOF | sudo tee -a /etc/bind/named.conf.local

// Resolución Directa
zone "simulacro.es" {
        type master;
        file "/etc/bind/db.simulacro.es";
};

// Resolución Inversa
zone "100.168.192.in-addr.arpa" {
       type master;
       file "/etc/bind/db.192";
};

EOF
```

- Configuración de zona Directa

```bash
cat<<EOF | sudo tee /etc/bind/db.simulacro.es

\$TTL    604800
@       IN      SOA     simulacro.es.   root.simulacro.es. (
                              2        ; Serial
                         604800        ; Refresh
                          86400        ; Retry
                        2419200        ; Expire
                         604800 )      ; Negative Cache TTL
;     
@       IN      NS        simulacro.es.
@       IN      A         192.168.100.33
@       IN      AAAA      ::1
@       IN      MX  10    correo.simulacro.es.

ns      IN      A         192.168.100.33
www     IN      A         192.168.100.33
ftp     IN      A         192.168.100.33
correo  IN      A         192.168.100.33

Dns     IN      CNAME     ns.simulacro.es.
Web     IN      CNAME     www.simulacro.es.
Nas     IN      CNAME     ftp.simulacro.es.
Mail    IN      CNAME     correo.simulacro.es.

EOF
```

- Configuración de zona Inversa

```bash
cat<<EOF | sudo tee /etc/bind/db.192

\$TTL    604800
@       IN      SOA  simulacro.es.     root.simulacro.es. (
                          1          ; Serial
                     604800          ; Refresh
                      86400          ; Retry
                    2419200          ; Expire
                     604800 )        ; Negative Cache TTL
;

@        IN     NS      simulacro.es.
33       IN     PTR     ns.simulacro.es.
33       IN     PTR     www.simulacro.es.
33       IN     PTR     ftp.simulacro.es.
33       IN     PTR     correo.simulacro.es.

EOF
```

```bash
# Verificar sintaxis configuración
named-checkconf
named-checkzone simulacro.es /etc/bind/db.simulacro.es
named-checkzone 100.168.192.in-addr.arpa. /etc/bind/db.192
```

- Aplicamos la configuración

```bash
sudo systemctl restart named
``` -->

#### 4. HTTP

- Con docker ya instalado, ejecutamos un [contenedor Apache](https://hub.docker.com/r/pabloqpacin/sonda-web)

```bash
# sh <(curl -sSL https://get.docker.com)
docker pull pabloqpacin/sonda-web:v1
# docker run -d --name web1 -p 80:80 --restart always pabloqpacin/sonda-web:v1
```

<!-- > Captura (Cliente Linux: Brave + dnslookup && nmap) -->


### Desarrollo 2

<!-- ```md
Utilizando la misma red del ejercicio anterior y el mismo dominio instala y configura los servicios DHCP, DNS y FTP.
- Crea dos usuarios, uno se llamará como tú nombre y el otro como tú primer apellido para darles acceso a sus carpetas personales con el servidor FTP. Cada una tendrá acceso a su carpeta.
``` -->

#### 5. FTP

- Instalamos paquetes necesarios en el server (en los clientes se instala **Filezilla**)

```bash
sudo apt install -y \
    vsftpd
```

<!-- - Configuración del servicio vsfptd

```bash
sudo cp /etc/vsftpd.conf{,.bak}

sudo sed -i '/^#write_enable=YES/s/^#//' /etc/vsftpd.conf
sudo sed -i 's/#ftpd_banner=.*/ftpd_banner=Buenardas/' /etc/vsftpd.conf
sudo sed -i '/^#chroot_local_user=YES/s/^#//' /etc/vsftpd.conf
sudo sed -i '/^#chroot_list_enable=YES/s/^#//' /etc/vsftpd.conf
sudo sed -i '/^#chroot_list_file=.*/s/^#//' /etc/vsftpd.conf
```

- Creación de usuarios

```bash
cat<<EOF | tee ~/usuarios.sh
#!/usr/bin/env bash

new_users=('pablo' 'quevedo')
user_list=/etc/vsftpd.chroot_list

for user in \${new_users[@]}; do
    echo \$user | tee -a \$user_list && \
    useradd -mg users \$user -s \$(which bash) && \
    passwd \$user     # 1234
    su -u \$user mkdir /home/\$user/simulacro
done

EOF

sudo bash ~/usuarios.sh
```

- Aplicamos la configuración

```bash
sudo systemctl restart vsftpd
``` -->

<!-- > Captura (Cliente Linux: Filezilla + CLI) -->


### Desarrollo 3

<!-- ```md
Utilizando la misma red del ejercicio anterior y el mismo dominio que el primer ejercicio, instala y configura el servicio DHCP, DNS y correo electrónico.
- Crea sus correos electrónicos y prueba que funciona correctamente.
``` -->

#### 6. Correo

<!-- ##### Servidor

- Previamente hemos definido el recurso MX en el DNS

```bash
grep 'MX 10' /etc/bind/db.simulacro.es
```

- Instalación de postfix (MTA)

```bash
sudo apt install -y \
  postfix
  # Internet site: simulacro.es
```

- Configuración del servicio postfix

```bash
sudo cp /etc/postfix/main.cf{,.bak}
sudo vim /etc/postfix/main.cf
```
```c
myhostname = correo.simulacro.es
mynetworks = 192.168.100.32/27 ...
// home_mailbox = Maildir/      // NO!!!
```
```bash
sudo systemctl restart postfix
```

- Instalación de dovecot (MDA)

```bash
sudo apt install -y \
  dovecot-core dovecot-pop3d dovecot-imapd
```


##### Clientes

- Se instala thunderbird (MUA)

```bash
sudo pacman -Syu thunderbird || \
sudo apt install thunderbird || \
winget install mozilla.thunderbird
```

- Nos autenticamos en thunderbird

```yaml
cliente_linux:
  - Nombre completo: pablo
  - Dirección de correo electrónico: pablo@simulacro.es
  - Contraseña: 1234

cliente_linux:
  - Nombre completo: quevedo
  - Dirección de correo electrónico: quevedo@simulacro.es
  - Contraseña: 1234
```

- Enviamos un correo con la cuenta de [pablo@simulacro.es](#) desde el Cliente Linux, respondemos desde la cuenta de [quevedo@simulacro.es](#) en el mismo equipo

```yaml
Enviar:
  Remitente: pablo@simulacro.es
  Para: quevedo@simulacro.es
  Cc: pabloqpacin@simulacro.es
  Asunto: prueba
  Cuerpo: ¡hola!

Responder a todos:
  Remitente: quevedo@simulacro.es
  Para: pablo@simulacro.es
  Cc: pabloqpacin@simulacro.es
  Asunto: Re: prueba
  Cuerpo: ¡recibido!
``` -->

<!-- > Captura (Cliente Linux: Filezilla + CLI) -->
