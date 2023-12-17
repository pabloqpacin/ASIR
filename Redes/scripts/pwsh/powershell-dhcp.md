# Windows Server 20xx - DHCP via PowerShell

- https://woshub.com/how-to-configure-dhcp-server-using-powershell/


## documentation

- [How to configure a network adapter with powershell](https://askme4tech.com/how-configure-network-adapter-powershell)
- [`New-NetIPAddress`](https://learn.microsoft.com/en-us/powershell/module/nettcpip/new-netipaddress?view=windowsserver2022-ps)
- [`Set-NetIPAddress`](https://learn.microsoft.com/en-us/powershell/module/nettcpip/set-netipaddress?view=windowsserver2022-ps)
- [Implementar DHCP desde PowerShell - Windows Server (YT)](https://www.youtube.com/watch?v=pG-WRahZ8lI)
- [Install And Configure DHCP In Windows Server 2022 Using PowerShell](https://www.technig.com/install-and-configure-dhcp-using-powershell-in-windows-server-2022/)
- [How To Install and Configure DHCP Server on Windows Server 2019/2016?](https://woshub.com/how-to-configure-dhcp-server-using-powershell/)
- [Deploy DHCP Using Windows PowerShell](https://learn.microsoft.com/en-us/windows-server/networking/technologies/dhcp/dhcp-deploy-wps)
- [How to Manage DHCP using PowerShell](https://techcommunity.microsoft.com/t5/itops-talk-blog/how-to-manage-dhcp-using-powershell/ba-p/744461)
- [Managing Windows Server Roles & Features with PowerShell](https://woshub.com/install-remove-windows-server-roles-features-powershell/)
- 

---

## LFG

<!-- 
```ps1
Get-WindowsFeature | more               # TODO: BitLocker, Containers, ..., WSL

# Settings: System: About: Windows Server 2022 Standard Evaluation 21H2

systeminfo                              # TODO: C:\pagefile.sys -- +1 NIC
Get-ComputerInfo

Resolve-DnsName (hostname)

Get-WindowsFeature | Where-Object { $_.Name -match 'DHCP' -or $_.Name -match 'DNS' }
    # (Get-WindowsFeature | Where-Object { $_.Name -match 'DHCP' }).Name
```
```ps1
$NetworkInterfaces = Get-NetIPConfiguration | Where-Object { $_.IPv4Address -ne $null }

foreach ($Interface in $NetworkInterfaces) {
    Write-Host "Interface: $($Interface.InterfaceDescription)"
    Write-Host "IPv4 Address: $($Interface.IPv4Address.IPAddress)"
    Write-Host ""


$IPv4Address = (Test-Connection -ComputerName (hostname) -Count 1).ipv4address.IPAddressToString
$IPv4Address.Split('.')[0..3] -join '.'
}

```

-->

- Comprobar que tenemos internet (VM bridged o NAT)

```ps1
# ipconfig /all

```

- Instalación

> **Configuración de red VM**: bridged o NAT

```ps1
Get-WindowsFeature -Name '*DHCP*'   # | Where Installed

Install-WindowsFeature -Name 'DHCP' -IncludeManagementTools
```

<!-- - Abrir GUI

```yaml
Administrador del servidor:
    Herramientas: DHCP
``` -->

- Configuración de red (Red Interna)

> **Configuración de red VM**: red interna

```ps1
$InterfaceIndex = (Get-NetAdapter -Name 'Ethernet').InterfaceIndex
$InterfaceAlias = (Get-NetAdapter).Name                 # Ethernet

Set-NetIPInterface -InterfaceIndex $InterfaceIndex -Dhcp Disabled

# here is 'new' instead of 'set'... should we remove the existing address (169.254.176.110)
New-NetIPAddress -IPAddress 192.168.100.1 `
                 -InterfaceAlias $InterfaceAlias `
                #  -InterfaceIndex $InterfaceIndex -PrefixLength 24

Get-NetIPConfiguration
```

<!--
Changing your IPv4 address via PowerShell typically involves modifying the network adapter settings. Here's a basic example using the `Set-NetIPAddress` cmdlet to change the IPv4 address of a specific network interface. Make sure to run PowerShell with administrative privileges to make these changes.

```powershell
# Get the network interface index (replace 'Ethernet' with your interface name)
$InterfaceIndex = (Get-NetAdapter -Name 'Ethernet').InterfaceIndex

# New IPv4 address configuration
$IPAddress = '192.168.100.1'
$SubnetMask = '255.255.255.0'
$DefaultGateway = '192.168.1.1'

# Set the new IPv4 address
Set-NetIPAddress -InterfaceIndex $InterfaceIndex -IPAddress $IPAddress -PrefixLength 24
    -DefaultGateway $DefaultGateway
Set-NetIPAddress -InterfaceIndex 4 -IPAddress 192.168.0.1 -PrefixLength 24
New-NetIPAddress -InterfaceIndex 4 -IPAddress 192.168.0.1 -PrefixLength 24 -DefaultGateway 192.168.0.5
```

Make sure to replace `'Ethernet'` with the actual name of your network interface. Adjust the `$IPAddress`, `$SubnetMask`, and `$DefaultGateway` variables to match your network configuration.

Keep in mind that changing your IP address might temporarily disrupt your network connectivity, especially if you are doing this on a remote machine.

Additionally, if your network configuration involves DHCP, you might want to disable it first before setting a static IP address. You can use `Set-NetIPInterface -InterfaceIndex $InterfaceIndex -Dhcp Disabled` for that purpose.

Always exercise caution when changing network settings, especially on remote machines, to avoid losing connectivity.
-->



- Autorizar

```ps1
# Add-DhcpServerInDC -DnsName dc01.soporteti.local -IpAddress 192.168.16.100
Add-DhcpServerInDC -DnsName (hostname) -IpAddress 192.168.100.1


# Quitar alerta de panel admin...
Set-ItemProperty -Path registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ServerManager\Roles\12 -Name ConfigurationState -Value 2
```

- Crear ámbitos

```ps1
Get-DhcpServerV4Scope

Add-DhcpServerV4Scope
    # StartRange == 192.168.16.1
    # EndRange ==== 162.168.16.50
    # Name ======== Ambito_16
    # SubnetMask == 255.255.255.0


```

- ...

