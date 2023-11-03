#!/bin/bash

echo -e "\n----################################################################----"
echo -e "#########~~~~~{     UD1-DHCP.sh v0.1  by @pabloqpacin    }~~~~~#########"
echo -e "----################################################################----"

### Tested successfully on Ubuntu Server 22.04.3 LTS (VirtualBox)
### CONFIGURACION DE RED: NAT/Bridged --> instalación paquete
### CONFIGURACION DE RED: Red Interna --> configuración DHCP

########## VARIABLES ##########
estado_conexion=''
interfaz=$(ip -o link show | grep -v 'lo' | awk -F ': ' '{print $2}')           # maybe array needed??      # enps03
netplan_configfile='/etc/netplan/00-installer-config.yaml'
iscdhcp_configfile='/etc/default/isc-dhcp-server'
dhcpd_configfile='etc/dhcp/dhcpd.conf'

RESET='\e[0m'
BOLD='\e[1m'
RED='\e[31m'
CYAN='\e[36m'
GREEN='\e[32m'
YELLOW='\e[33m'

########## FUNCTIONS ##########

# Probar ping para comprobar si VM está conectada a alguna red o en red interna
determine_netstatus() {
    echo -e "\n${YELLOW}#########################################################${RESET}"
    echo -e "${YELLOW}ping 192.168.1.1${RESET}: comprobando si ya existe servidor DHCP"
    ping -c1 192.168.1.1 &>/dev/null
    case $? in
        '0')
            echo -e "${YELLOW}-- ${BOLD}ÉXITO${RESET}: se asume configuración de red -> ${BOLD}NAT o bridged${RESET}"
            echo -e "${YELLOW}#########################################################${RESET}"
            estado_conexion='nat_o_bridged'
            ;;
        *)
            echo -e "${YELLOW}-- ${BOLD}ERROR${RESET}: se asume configuración de red -> ${BOLD}Red Interna${RESET}"
            echo -e "${YELLOW}#########################################################${RESET}"
            # echo -e "${YELLOW}### ${GREEN}ERROR${RESET}: configuración de red -> Red Interna ${YELLOW}###${RESET}"
            estado_conexion='red_interna'
            ;;
    esac
}

install_dhcp_server_pkg() {
    echo -e "\n${YELLOW}########## Actualizando paquetes e instalando '${RED}${BOLD}isc-dhcp-server${RESET}${YELLOW}' ##########${RESET}"
    if [ ! -e "/etc/apt/apt.conf.d/99show-versions" ]; then
        echo 'APT::Get::Show-Versions "true";' | sudo tee /etc/apt/apt.conf.d/99show-versions
    fi
    # echo -e "\n== Instalando paquetes y terminando script\n== Cambia la configuración de red de la VM a\n== ${GREEN}${BOLD}red interna${RESET} para poder completar el script."
    sudo apt-get update
    sudo apt-get install isc-dhcp-server -y
    echo -e "\n${YELLOW}########## Cambia la configuración de la VM a '${RED}${BOLD}red interna${RESET}${YELLOW}' para poder continuar ##########${RESET}"
}

edit_netplan_configfile() {
    sudo mv $netplan_configfile{,.bak}
    sudo ...
}

edit_interfaces_dhcpserver_configfile() {
    if [ -e $iscdhcp_configfile ]; then
        grep "INTERFACESv4" $iscdhcp_configfile
        sed -i "s/INTERFACESv4=\"\"/INTERFACESv4=\"$interfaz\"/" $iscdhcp_configfile
        grep "INTERFACESv4" $iscdhcp_configfile
    fi
}

edit_subnet_dhcpd_configfile() {
    if [ -e $dhcpd_configfile ]; then
        tail $dhcpd_configfile
        echo -e "subnet 192.168.1.0 netmask 255.255.255.0 {\n\trange 192.168.1.10 192.168.1.20;\n}" \
            | sudo tee -a $dhcpd_configfile
        tail $dhcpd_configfile
    fi
}


########## RUNTIME ##########

# echo -e "== ${BLUE}PING 192.168.1.1${RESET} ==\n"
determine_netstatus

case $estado_conexion in
    'nat_o_bridged')
        install_dhcp_server_pkg
        exit 0
        ;;
    'red_interna')
            # echo -e "\tAplicando configuración.\nSi ocurren errores, comprueba\n que 'isc-dhcp-server' está instalado."
        echo "supdawg"
    #     edit_netplan_configfile
    #     edit_interfaces_dhcpserver_configfile
    #     edit_subnet_dhcpd_configfile
        ;;
esac
