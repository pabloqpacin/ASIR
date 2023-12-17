# https://www.youtube.com/watch?v=pG-WRahZ8lI

# Import the DHCP Server module
Import-Module DhcpServer

# Specify DHCP server and scope information
$DhcpServerIp = "192.168.100.1"
$ScopeName = "MyScope"
$ScopeStartRange = "192.168.100.5"
$ScopeEndRange = "192.168.100.35"
$SubnetMask = "255.255.255.0"
$Router = "192.168.1.1"

# Install DHCP role if not already installed
Install-WindowsFeature -Name DHCP -IncludeManagementTools -IncludeAllSubFeature

# Authorize DHCP server if not already authorized
Add-DhcpServerInDC

# Create DHCP scope
Add-DhcpServerv4Scope -Name $ScopeName -StartRange $ScopeStartRange -EndRange $ScopeEndRange -SubnetMask $SubnetMask -State Active

# Set DHCP options (optional)
Set-DhcpServerv4OptionValue -OptionId 3 -Value $Router

# Display DHCP server configuration
Get-DhcpServerv4Scope -ComputerName $DhcpServerIp
