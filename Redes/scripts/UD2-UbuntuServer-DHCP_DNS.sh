#!/bin/bash

dir_ip=$(hostname -I | awk -F ' ' '{print $1}')
interfaz=$(ip -o link show | grep 'noop' | awk -F ': ' '{print $2}' | head -n1)        # enp0s8

########## FUNCIONES ##########

config_estado_red_VBox() {
    echo -e "Dirección IPv4 asignada ---> $dir_ip"
    case $dir_ip in
        '192.168.100.129') echo -e "Configuración de red actual: interna gestionada\n" && estado_conexion='OK' ;;
        '') echo -e "Configuración de red actual: interna NO gestionada\n" && estado_conexion='READY' ;;
        *) echo -e "Configuración de red actual: NAT o Bridged (aka connected to DHCP)\n" && estado_conexion='INOP' ;;
    esac
}

install_packages() {
    sudo apt update && sudo apt upgrade -y
    if ! command -v named; then
        sudo apt install isc-dhcp-server bind9 grc nmap whois       # dig nslookup
    fi
    echo -e "\n== Change VM to Internal Network to continue... =="
}

edit_netplan() {
    case $(grep -s dhcp4 /etc/netplan/00-installer-config.yaml | awk -F ': ' '{print $2}') in
        true)
            sudo mv /etc/netplan/00-installer-config.yaml{,.bak}
            echo "# DHCP server network configuration by @pabloqpacin
network:
    version: 2
    renderer: networkd
    ethernets:
        $interfaz:
            dhcp4: false
            addresses: [192.168.100.129/27]
            gateway4: 192.168.1.1
            nameservers:
                addresses: [192.168.100.129]" | sudo tee /etc/netplan/00-installer-config.yaml
            yes | sudo netplan apply &>/dev/null
        ;;
        false) echo "== netplan hecho ==" ;;
        *) echo wtf ;;
    esac
}

edit_interfaces() {
    if ! grep -qs "$interfaz" /etc/default/isc-dhcp-server; then
        sudo sed -i "s/INTERFACESv4=\"\"/INTERFACESv4=\"$interfaz\"/" /etc/default/isc-dhcp-server
    else
        echo "== interfaces hecho =="
    fi
}

edit_dhcpd() {
    if ! grep -qs "asir" /etc/dhcp/dhcpd.conf; then
        echo -e '
option domain-name "asir.com";
option domain-name-servers ns1.asir.com, ns2.asir.com;

default-lease-time 600;
max-lease-time 7200;
ddns-update-style none;

subnet 192.168.100.128 netmask 255.255.255.224 {
    range 192.168.100.132 192.168.100.158;
    option subnet-mask 255.255.255.224;
    option routers 192.168.100.129;
    option domain-name-servers 192.168.100.129;
    option domain-name "asir.com";
}

host www_cliente_linux {
    hardware ethernet 08:00:27:9c:6a:c1;
    fixed-address 192.168.100.130;
}

host ftp_cliente_windows {
    hardware ethernet 08:00:27:58:d0:b7;
    fixed-address 192.168.100.131;
}'  | sudo tee -a /etc/dhcp/dhcpd.conf
    else
        echo "== interfaces hecho =="
    fi
}

edit_named_options() {
    if ! grep -qa "129" /etc/bind/named.conf.options; then
        sudo sed -i -e "s|// forwarders {|forwarders {\n\t\t192.168.100.129;\n\t};|g" /etc/bind/named.conf.options
        sudo sed -i -e '/0.0.0.0/,/};/d' /etc/bind/named.conf.options
    else
        echo "== named.conf.options hecho =="
    fi
}

edit_named_local() {
    if ! grep -qa "asir" /etc/bind/named.conf.local; then
        echo '
zone "asir.com" {
        type master;
        file "/etc/bind/db.asir.com";
};

zone "100.168.192.in-addr.arpa" {
       type master;
       file "/etc/bind/db.192";
};' | sudo tee -a /etc/bind/named.conf.local
        # named-checkconf
    else
        echo "== named.conf.local hecho =="
    fi
}

# might change: asir.com. > ns.asir.com.; @ A + @ AAAA > comment out
edit_zona_directa() {
    if [ ! -f /etc/bind/db.asir.com ]; then
        echo "
\$TTL    604800
@       IN      SOA     asir.com.   root.asir.com. (
                            2        ; Serial
                       604800        ; Refresh
                        86400        ; Retry
                      2419200        ; Expire
                       604800 )      ; Negative Cache TTL
;     
@       IN      NS        asir.com.
@       IN      A         192.168.100.129
@       IN      AAAA      ::1

ns      IN      A         192.168.100.129   ; self
www     IN      A         192.168.100.130   ; Arch
ftp     IN      A         192.168.100.131   ; Windows

;Dns    IN      CNAME     ns.asir.com.
;Web    IN      CNAME     www.asir.com.
;Ftp    IN      CNAME     ftp.asir.com.
"   | sudo tee /etc/bind/db.asir.com
    else
        echo "== db.asir.com hecho =="
    fi
}

edit_zona_inversa() {
    if [ ! -f /etc/bind/db.192 ]; then
        echo "
\$TTL    604800
@       IN      SOA  asir.com.     root.asir.com. (
                          1          ; Serial
                     604800          ; Refresh
                      86400          ; Retry
                    2419200          ; Expire
                     604800 )        ; Negative Cache TTL
;

@        IN     NS      asir.com.
129      IN     PTR     ns.asir.com.
130      IN     PTR     www.asir.com.
131      IN     PTR     ftp.asir.com.
"   | sudo tee /etc/bind/db.192
    else
        echo "== db.192 hecho =="
    fi
}

restart_all() {
    read -p "Reiniciar servicios DHCP y DNS? [Y/n] " opt
    case opt in 'y'|'Y'|' ')
        sudo systemctl restart isc-dhcp-server
        sudo systemctl restart named
    esac
}

verify_services() {
    sleep 2
    if nslookup www.asir.com | grep -qs 130
        then echo "Resolución DNS Directa funciona!"
        else echo "Resolución DNS Directa NO funciona... Reinicia la máquina."
    fi
    if nslookup 192.168.100.130 | grep -qs www
        then echo "Resolución DNS Inversa funciona!"
        else echo "Resolución DNS Inversa NO funciona... Reinicia la máquina."
    fi
}

########## RUNTIME ##########

config_estado_red_VBox

case $estado_conexion in
    'INOP') install_packages ;;
    'READY'|'OK')
        edit_netplan
        edit_interfaces
        edit_dhcpd
        edit_named_options
        edit_named_local
        edit_zona_directa
        edit_zona_inversa
        restart_all
        verify_services
        ;;
    # 'OK') echo yay! ;;
    *) echo "something broken"
esac


