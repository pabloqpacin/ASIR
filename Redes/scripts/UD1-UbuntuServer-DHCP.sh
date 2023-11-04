#!/bin/bash

echo -e "\n----################################################################----"
echo -e "#########~~~~~{     UD1-DHCP.sh v0.3  by @pabloqpacin    }~~~~~#########"
echo -e "----################################################################----"

### Probado con éxito en Ubuntu Server 22.04.3 LTS (VirtualBox)
### CONFIGURACION DE RED: NAT/Bridged --> instalación paquete
### CONFIGURACION DE RED: Red Interna --> configuración DHCP

########## VARIABLES ##########

session_log="/tmp/dhcp-$(date +%T).log"
dir_ip=$(hostname -I | awk -F ' ' '{print $1}')
estado_conexion=''

netplan_configfile='/etc/netplan/00-installer-config.yaml'
netplan_estado_dhcp=$(grep -s dhcp4 $netplan_configfile | awk -F ': ' '{print $2}')   # true OR false
tmplog_netplanapply='/tmp/log-netplan_apply.log'

interfaz=$(ip -o link show | grep -v 'lo' | awk -F ': ' '{print $2}')       # enp0s3
iscdhcp_configfile='/etc/default/isc-dhcp-server'
dhcpd_configfile='/etc/dhcp/dhcpd.conf'

RESET='\e[0m'
BOLD='\e[1m'
RED='\e[31m'
CYAN='\e[36m'
GREEN='\e[32m'
YELLOW='\e[33m'

########## FUNCIONES ##########

config_estado_red_VBox() {
    echo -e "Dirección IPv4 asignada ---> ${YELLOW}$dir_ip${RESET}"
    case $dir_ip in
        '192.168.1.254') estado_conexion='OK'
        echo -e "Configuración de red actual: ${YELLOW}interna gestionada${RESET}" ;;
        '') estado_conexion='READY'
        echo -e "Configuración de red actual: ${YELLOW}interna ${RED}NO${YELLOW} gestionada${RESET}" ;;
        *) estado_conexion='INOP'
        echo -e "Configuración de red actual: ${YELLOW}NAT o Bridged${RESET} (aka connected to DHCP)" ;;
    esac
}

install_dhcp_server_pkg() {
    echo -e "\n${YELLOW}########## Actualizando paquetes e instalando '${RED}${BOLD}isc-dhcp-server${RESET}${YELLOW}' ##########${RESET}"
    if [ ! -e "/etc/apt/apt.conf.d/99show-versions" ]; then
        echo 'APT::Get::Show-Versions "true";' | sudo tee /etc/apt/apt.conf.d/99show-versions
    fi
    sudo apt-get update && sudo apt-get install isc-dhcp-server    # grc nmap -y
    echo -e "\n${YELLOW}########## Cambia la configuración de la VM a '${RED}${BOLD}red interna${RESET}${YELLOW}' para poder continuar ##########${RESET}"
}

edit_netplan_configfile() {
    if [[ $netplan_estado_dhcp = 'true' ]]; then
        echo -e "\n${YELLOW}########## Actualizando '${RED}${BOLD}$netplan_configfile${RESET}${YELLOW}' ##########${RESET}"
        echo -e "\n${YELLOW}###${RESET} Creando copia de seguridad '${BOLD}$netplan_configfile.bak${RESET}'" && \
            cat $netplan_configfile && \
            sudo mv $netplan_configfile{,.bak}
        echo -e "\n${YELLOW}###${RESET} Editando config de red en '${BOLD}$netplan_configfile${RESET}'" && \
            echo "# DHCP server network configuration by @pabloqpacin
network:
    version: 2
    renderer: networkd
    ethernets:
        enp0s3:
            dhcp4: false
            addresses: [192.168.1.254/24]
            gateway4: 192.168.1.1
            nameservers:
                addresses: [8.8.8.8, 8.8.4.4]" | sudo tee $netplan_configfile && \
            echo -e "\n${YELLOW}###${RESET} Aplicando config netplan ('${RED}$tmplog_netplanapply${RESET}')" && \
            yes | sudo netplan apply &>>$tmplog_netplanapply
        netplan_estado_dhcp=$(grep -qs dhcp4 $netplan_configfile | awk -F ': ' '{print $2}')   # true OR false   
    elif [[ $netplan_estado_dhcp = 'false' ]]; then
        echo -e "\n${YELLOW}########## '${GREEN}${BOLD}$netplan_configfile${RESET}${YELLOW}' ya contiene la línea '${RED}${BOLD}dhcp4: $netplan_estado_dhcp${RESET}${YELLOW}' ##########${RESET}"
    else
        echo -e "PROBLEMA CON $netplan_configfile"
    fi
}

edit_interfaces_dhcpserver_configfile() {
    if ! grep -qs $interfaz $iscdhcp_configfile; then
        echo -e "\n${YELLOW}########## Actualizando '${RED}${BOLD}$iscdhcp_configfile${RESET}${YELLOW}' ##########${RESET}"
        echo -e "\n${YELLOW}###${RESET} Añadiendo '${BOLD}$interfaz${RESET}' a 'INTERFACESv4'" && \
            grep "INTERFACESv4" $iscdhcp_configfile && \
            sudo sed -i "s/INTERFACESv4=\"\"/INTERFACESv4=\"$interfaz\"/" $iscdhcp_configfile && \
            grep "INTERFACESv4" $iscdhcp_configfile
    elif grep -qs $interfaz $iscdhcp_configfile; then
        echo -e "\n${YELLOW}########## '${GREEN}${BOLD}$iscdhcp_configfile${RESET}${YELLOW}' ya contiene la interfaz '${RED}${BOLD}$interfaz${RESET}${YELLOW}' ##########${RESET}"
    else
        echo -e "PROBLEMA CON $iscdhcp_configfile"
    fi
}

edit_subnet_dhcpd_configfile() {
    if ! grep -qs "192.168" $dhcpd_configfile ]; then
        echo -e "\n${YELLOW}########## Actualizando '${RED}${BOLD}$dhcpd_configfile${RESET}${YELLOW}' ##########${RESET}"
        echo -e "\n${YELLOW}###${RESET} Añadiendo ${BOLD}subnet 192.168.x.x${RESET} al final" && \
            tail -n5 $dhcpd_configfile && \
            echo -e "subnet 192.168.1.0 netmask 255.255.255.0 {\n\trange 192.168.1.180 192.168.1.200;\n}" \
                | sudo tee -a $dhcpd_configfile
        echo -e "\n${YELLOW}###${RESET} Reiniciando el servicio ${BOLD}DHCP${RESET}" && \
            sudo systemctl restart isc-dhcp-server && sleep 3 && \
            echo "systemctl status isc-dhcp-server" && eval $_ | grep Active
    elif grep -qs "192.168" $dhcpd_configfile ]; then
        echo -e "\n${YELLOW}########## '${GREEN}${BOLD}$dhcpd_configfile${RESET}${YELLOW}' ya contiene la subnet '${RED}${BOLD}192.168.x.x${RESET}${YELLOW}' ##########${RESET}"
    else
        echo -e "PROBLEMA CON $dhcpd_configfile"
    fi
}

encourage_client_config() {
    echo -e "\n${CYAN}Este servidor DHCP ya puede ofrecer direccionamiento IP a clientes en esta Red Interna.${RESET}"
    echo -e "${CYAN}Verificación en el SERVIDOR:${RESET}"
    echo -e "${CYAN}-${RESET} systemctl status isc-dhcp-server"
    echo -e "${CYAN}-${RESET} dhcp-lease-list"
    echo -e "${CYAN}-${RESET} less /var/lib/dhcp/dhcpd.leases"
    echo -e "${CYAN}-${RESET} grep dhcpd /var/log/syslog"
    echo -e "${CYAN}Verificación en los CLIENTES:${RESET}"
    echo -e "${CYAN}-${RESET} ip route"
    echo -e "${CYAN}-${RESET} ping -c4 192.168.1.254"
    echo -e "${CYAN}-${RESET} grc nmap 192.168.1.0/24\n"
    # OJO: ufw (puertos 67 68 ...)
}

########## EJECUCION ##########

    # Loguear cada ejecución / sesión TTY
exec > >(tee $session_log)
exec 2>&1

echo -e "\n${YELLOW}##################################################################${RESET}"
config_estado_red_VBox
echo -e "${YELLOW}##################################################################${RESET}"

case $estado_conexion in
    'INOP') install_dhcp_server_pkg ;;
    'READY' | 'OK')             # READY==DO, OK==DO_NOTHING (DEMO ERROR HANDLING)
        edit_netplan_configfile
        edit_interfaces_dhcpserver_configfile
        edit_subnet_dhcpd_configfile
        encourage_client_config
        ;;
    *)
        echo "something broken"
esac

echo -e "${YELLOW}########## SCRIPT TERMINADO. Puedes consultar la sesión en '${RED}${BOLD}$session_log${RESET}${YELLOW}' #######"
