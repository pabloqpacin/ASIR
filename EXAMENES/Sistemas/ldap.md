# [🐧Instalar y configurar OpenLDAP en SERVIDOR y CLIENTE en Ubuntu Server & Desktop 22.04](https://www.youtube.com/watch?v=Rl032gHFu88)

## Intro

- Ubuntu Server con 2 interfaces de red: bridged y red interna
- Otros servicios: DHCP (192.168.100.0/24) y DNS (asir.local)

<details>
<summary>DHCP + DNS</summary>

<!--simulacro_SRI-->

- DHCP

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
      addresses: [192.168.100.1/24]
      nameservers:
        addresses: [192.168.100.1]
  version: 2

EOF

sudo netplan try || \
sudo netplan apply
```

```bash
sudo sed -i '/^INTERFACESv4/s/""/"enp0s8"/' /etc/default/isc-dhcp-server
```

```bash
sudo sed -i '/^option domain-name\s/s/example.org/asir.com/' /etc/dhcp/dhcpd.conf
sudo sed -i 's/^option domain-name-servers .*/option domain-name-servers ns.asir.com;/' /etc/dhcp/dhcpd.conf

cat<<EOF | sudo tee -a /etc/dhcp/dhcpd.conf

subnet 192.168.100.0 netmask 255.255.255.0 {
  range 192.168.100.30 192.168.100.199;
  option subnet-mask 255.255.255.0;
  option routers 192.168.100.1;
  option domain-name-servers 192.168.100.1;
  option domain-name "asir.com";
}

host cliente_linux_desktop {
  hardware ethernet 08:00:27:2F:93:03;
  fixed-address 192.168.100.10;
}

EOF
```

```bash
sudo systemctl restart isc-dhcp-server
```

- DNS


```bash
cat<<EOF | sudo tee -a /etc/bind/named.conf.local

// Resolución Directa
zone "asir.com" {
        type master;
        file "/etc/bind/db.asir.com";
};

// Resolución Inversa
zone "100.168.192.in-addr.arpa" {
       type master;
       file "/etc/bind/db.192";
};

EOF
```

```bash
cat<<EOF | sudo tee /etc/bind/db.asir.com

\$TTL    604800
@       IN      SOA     asir.com.   root.asir.com. (
                              2        ; Serial
                         604800        ; Refresh
                          86400        ; Retry
                        2419200        ; Expire
                         604800 )      ; Negative Cache TTL
;     
@       IN      NS        asir.com.
@       IN      A         192.168.100.1
@       IN      AAAA      ::1
@       IN      MX  10    correo.asir.com.

ns      IN      A         192.168.100.1
www     IN      A         192.168.100.1
ftp     IN      A         192.168.100.1
correo  IN      A         192.168.100.1

Dns     IN      CNAME     ns.asir.com.
Web     IN      CNAME     www.asir.com.
Nas     IN      CNAME     ftp.asir.com.
Mail    IN      CNAME     correo.asir.com.

EOF
```

```bash
cat<<EOF | sudo tee /etc/bind/db.192

\$TTL    604800
@       IN      SOA  asir.com.     root.asir.com. (
                          1          ; Serial
                     604800          ; Refresh
                      86400          ; Retry
                    2419200          ; Expire
                     604800 )        ; Negative Cache TTL
;

@        IN     NS      asir.com.
33       IN     PTR     ns.asir.com.
33       IN     PTR     www.asir.com.
33       IN     PTR     ftp.asir.com.
33       IN     PTR     correo.asir.com.

EOF
```

```bash
# Verificar sintaxis configuración
named-checkconf
named-checkzone asir.com /etc/bind/db.asir.com
named-checkzone 100.168.192.in-addr.arpa. /etc/bind/db.192
```

```bash
sudo systemctl restart named
```

- IPtables (so that the DHCP/DNS clients in Internal Network can access the internet)

```bash
# On the server
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o enp0s3 -j MASQUERADE
sudo iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i enp0s8 -o enp0s3 -j ACCEPT

sudo iptables -A INPUT -i enp0s8 -p udp --dport 53 -j ACCEPT
sudo iptables -A INPUT -i enp0s8 -p udp --dport 67:68 -j ACCEPT
sudo iptables-save | sudo tee /etc/iptables/rules.v4
```

</details>

- Aliases

```bash
alias scat='sudo slapcat | bat -pl yaml'
# alias foo='bar'
```

## Servidor
### Instalación

- Cambiar el hostname

```bash
sudo sed -i "s/$(hostname)/ldapserver.asir.local \n192.168.100.1 ldapserver.asir.local/" /etc/hosts
sudo hostnamectl set-hostname ldapserver.asir.local
```
```bash
sudo apt update && sudo apt install -y \
    slapd ldap-utils
    # Admin pass: changeme
```

```bash
sudo dpkg-reconfigure slapd
    # Omit: No
    # DNS: asir.local
    # Organization name: asir
    # Admin pass: changeme
    # Remove DB if slapd purged: Yes
    # Move old DB: Yes
```

### Configuración

#### Crear unidad organizativa

```bash
mkdir ~/ldap_ads

cat <<EOF | tee ~/ldap_ads/ou.ldif
dn: ou=informatica,dc=asir,dc=local
objectClass: top
objectClass: organizationalUnit
ou: informatica
EOF

sudo ldapadd -xD cn=admin,dc=asir,dc=local -Wf ~/ldap_ads/ou.ldif
```

#### Crear grupo

```bash
cat <<EOF | tee ~/ldap_ads/grupo.ldif
dn: cn=informatica,ou=informatica,dc=asir,dc=local
objectClass: top
objectClass: posixGroup
gidNumber: 10000
cn: informatica
EOF

sudo ldapadd -xD cn=admin,dc=asir,dc=local -Wf ~/ldap_ads/grupo.ldif
```

#### Crear usuario

```bash
cat <<EOF | tee ~/ldap_ads/usuario.ldif
dn: uid=pablo,ou=informatica,dc=asir,dc=local
objectClass: top
objectClass: posixAccount
objectClass: inetOrgPerson
objectClass: person
cn: pablo
uid: pablo
ou: informatica
uidNumber: 2000
gidNumber: 10000
homeDirectory: /home/pablo
loginShell: /bin/bash
userPassword: changeme
mail: pablo@asir.local
givenName: pablo
sn: Foo
EOF

# userPassword: $(sudo slappasswd)
sudo ldapadd -xD cn=admin,dc=asir,dc=local -Wf ~/ldap_ads/usuario.ldif

cat <<EOF | tee ~/ldap_ads/usuario.ldif
dn: uid=quevedo,ou=informatica,dc=asir,dc=local
objectClass: top
objectClass: posixAccount
objectClass: inetOrgPerson
objectClass: person
cn: quevedo
uid: quevedo
ou: informatica
uidNumber: 2001
gidNumber: 10000
homeDirectory: /home/quevedo
loginShell: /bin/bash
userPassword: changeme
mail: quevedo@asir.local
givenName: quevedo
sn: Foo
EOF

sudo ldapadd -xD cn=admin,dc=asir,dc=local -Wf ~/ldap_ads/usuario.ldif
```

#### Buscar en el directorio

```bash
ldapsearch -xLLL -b 'dc=asir,dc=local' uid=pablo uidNumber cn
```

#### Modificar usuario

```bash
cat <<EOF | tee ~/ldap_ads/cambios.ldif
dn: uid=pablo,ou=informatica,dc=asir,dc=local
changetype: modify
replace: mail
mail: foobar@asir.local
EOF

sudo ldapmodify -xD cn=admin,dc=asir,dc=local -Wf ~/ldap_ads/cambios.ldif
```

#### Eliminar usuario

```bash
sudo ldapdelete -xWD 'cn=admin,dc=asir,dc=local' 'uid=quevedo,ou=informatica,dc=asir,dc=local'
```

## Clientes

### Instalación

```bash
sudo apt update && sudo apt install -y \
    libnss-ldap libpam-ldap ldap-utils
    # ldap-auth-config:
    #   LDAP server URI: ldap://192.168.100.1
    #   DN: dc=asir,dc=local
    #   LDAP Version: 3
    #
    #   Make local root DB admin: Yes
    #   LDAP DB requires login: No
    #   LDAP root account: cd=admin,dc=asir,dc=local
    #   LDAP root pass: changeme

# sudo dpkg-reconfigure ldap-auth-config
```

### Configuración

```bash
sudo sed -i 's/systemd/ldap/' /etc/nsswitch.conf
sudo sed -i '/^shadow/s/files/files ldap/' /etc/nsswitch.conf

sudo getent passwd | grep '2000'
```

```bash
sudo sed -i '/^# end/i session optional    pam_mkhomedir.so    skel=/etc/skel    umask=077' /etc/pam.d/common-session

ldapsearch -xH ldap://192.168.100.1 -b 'dc=asir,dc=local'
```

```bash
sudo apt update && sudo apt install -y \
    nslcd
    # LDAP server URI: ldap://192.168.100.1/
    # LDAP base: dc=asir,dc=local

reboot
```

## Conexión

```yaml
Login: No esta en la lista:
    usuario: pablo
    contra: changeme
```

---

## Apache Directory Studio (desde cliente)

```bash
mkdir /tmp/foo && cd $_

URL='https://dlcdn.apache.org/directory/studio/2.0.0.v20210717-M17/'
PKG='ApacheDirectoryStudio-2.0.0.v20210717-M17-linux.gtk.x86_64.tar.gz'

curl -o $(xdg-user-dir DOWNLOAD)/${PKG} ${URL}${PKG}
tar -xvf $(xdg-user-dir DOWNLOAD)/${PKG}
sudo ln -s $(xdg-user-dir DOWNLOAD)/ApacheDirectoryStudio/ApacheDirectoryStudio /usr/local/bin/


sudo apt update && sudo apt install -y \
    default-jre default-jdk

cat <<EOF | tee ~/.local/share/applications/apache-directory-studio.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Apache Directory Studio
Comment=A full-featured LDAP tooling platform
Exec=/home/pabloqpacin/Downloads/ApacheDirectoryStudio/ApacheDirectoryStudio
Icon=/home/pabloqpacin/Downloads/ApacheDirectoryStudio/icon.xpm
Terminal=false
Categories=Development;
EOF
```


