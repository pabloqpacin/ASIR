# 01 PROXMOX

- [01 PROXMOX](#01-proxmox)
  - [0. Hardware](#0-hardware)
  - [1. Instalación](#1-instalación)
    - [1.1 Ventoy para bootear la iso del instalador Proxmox-ve\_8.0-2.iso](#11-ventoy-para-bootear-la-iso-del-instalador-proxmox-ve_80-2iso)
    - [1.2 Preparar hardware](#12-preparar-hardware)
    - [1.2 Aplicar](#12-aplicar)
    - [1.3 Habilitar partición efi en BIOS](#13-habilitar-partición-efi-en-bios)
  - [2. Configuración](#2-configuración)
    - [2.1 Primer inicio/encendido del servidor/instalación de Proxmox](#21-primer-inicioencendido-del-servidorinstalación-de-proxmox)
    - [2.2 Primera conexión mediante el navegador](#22-primera-conexión-mediante-el-navegador)
    - [2.3 Repositorios y updates, configuración APT](#23-repositorios-y-updates-configuración-apt)
    - [2.4 Instalación inicial de paquetes para la shell](#24-instalación-inicial-de-paquetes-para-la-shell)
    - [2.5 Cluster / HA / `/dev/sda`](#25-cluster--ha--devsda)
  - [3. CTs (LXC) y VMs](#3-cts-lxc-y-vms)
    - [3.0 Preparar las Plantillas para contenedores](#30-preparar-las-plantillas-para-contenedores)
    - [3.1 101 CT Ubuntu para Docker Compose (webapp PROYECTO `lamp_docker`)](#31-101-ct-ubuntu-para-docker-compose-webapp-proyecto-lamp_docker)
      - [A. Creación](#a-creación)
      - [B. Inicio y uso](#b-inicio-y-uso)
    - [3.2 102 CT Docker LXC (https://tteck.github.io/Proxmox/) para PROYECTO](#32-102-ct-docker-lxc-httpstteckgithubioproxmox-para-proyecto)
    - [3.n ... Kubernetes (minikube)](#3n--kubernetes-minikube)

## 0. Hardware

> Pablo


- Portátil EX2511
  - CPU: foo
  - RAM: bar
  - ALMACENAMIENTO
    - /dev/sda (223.57GiB, WDC WDS240G2G0A-): PROXMOX
    - /dev/sda (447.13GiB, CT480BX500SSD1): ... (NFS??)
  <!-- - CONSUMO: ?? -->
  - INTERFACES DE RED:
    - enp2s0: 54:ab:3a:6a:17:ed (r8169)
    - wlp3s0: a8:a7:95:92:9c:61 (ath9k)

## 1. Instalación

### 1.1 Ventoy para bootear la iso del instalador Proxmox-ve_8.0-2.iso

- Descargar Ventoy
- Instalar Ventoy en un USB
- Copiar la iso de Proxmox al USB

### 1.2 Preparar hardware

- BIOS: desactivar Secure_boot


### 1.2 Aplicar


```yaml
Install Proxmox VE (Graphical):
    End User License Agreement (EULA): Aceptar
    Disco de destino:
        - /dev/sdb (447.13GiB)
        - Opciones:
          Sistema de archivos: ext4
          Swap: no
    Localización y horario:
        País: España
        Zona horaria: Europa/Madrid
        Teclado: Español
    Contraseña y email de administrador:
        Email: no@thankyou.com
        Contraseña: ... # superchangeme882;; -- gestor de contraseñas??
    Configuración de red para la administración:
        Interfaz de red: enp2s0
        Hostname (FQDN): pve.homelab.net
        Dirección IP (CIDR): 192.168.1.200/24   # direccionamiento estático en mi red
        Gateway: 192.168.1.1                    # mi router
        Servidor DNS: 80.58.64.250              # Movistar, por mi router
```

Resumen:

| Option                | Value
| ---                   | ---
| Filesystem:           | ext4
| Disk(s):              | /dev/sdb
| Country:              | Spain
| Timezone:             | Europe/Madrid
| Keymap:               | es
| Email:                | no@thankyou.com
| Management interface: | enp2s0
| Hostname:             | pve
| IP CIDR:              | 192.168.1.200/24
| Gateway:              | 192.168.1.1
| DNS:                  | 80.58.61.250

### 1.3 Habilitar partición efi en BIOS

```yaml
# EX2511
BIOS:
    Boot:
        Secure Boot: enable
    Security:
        Erase all Secure Boot Settings: yes
        Restore Secure Boot to Factory Default: yes
    Exit: Save Changes
BIOS:
    Security:
        Select an UEFI file as trusted for executing:
            - HDD2: EFI: proxmox: grubx64.efi
            Add this file to allowable database, Boot Description: proxmox
    Exit: Save Changes
BIOS:
    Boot:
        Boot priority order: 'EFI File Boot 0: proxmox' arriba, solo debajo del USB
        Secure Boot: disable
    Exit: Save Changes
```

## 2. Configuración

### 2.1 Primer inicio/encendido del servidor/instalación de Proxmox

- Encender el pc con Proxmox
- Se enciende una TTY:

```txt
Welcome to the Proxmox Virtual Environment. Please use your web browser to
configure this server - connect to:
    https://192.168.1.200:8006
```

### 2.2 Primera conexión mediante el navegador

- En otro dispositivo en la misma red (equipo GL76 con sistema Pop!_OS y direccionamiento dhcp 192.168.1.42/24)
- Abrimos el navegador y vamos a `https://192.168.1.200:8006`
- El navegador nos indica que la conexión es insegura (sucede que el certificado SSL no está configurado/verificado)

### 2.3 Repositorios y updates, configuración APT

- Situación inicial

```log
root@pve:~# apt update
Hit:1 http://security.debian.org bookworm-security InRelease
Hit:2 http://ftp.es.debian.org/debian bookworm InRelease                                   
Hit:3 http://ftp.es.debian.org/debian bookworm-updates InRelease                           
Err:4 https://enterprise.proxmox.com/debian/ceph-quincy bookworm InRelease
  401  Unauthorized [IP: 51.91.38.34 443]
Err:5 https://enterprise.proxmox.com/debian/pve bookworm InRelease
  401  Unauthorized [IP: 51.91.38.34 443]
Reading package lists... Done
E: Failed to fetch https://enterprise.proxmox.com/debian/ceph-quincy/dists/bookworm/InRelease  401  Unauthorized [IP: 51.91.38.34 443]
E: The repository 'https://enterprise.proxmox.com/debian/ceph-quincy bookworm InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
E: Failed to fetch https://enterprise.proxmox.com/debian/pve/dists/bookworm/InRelease  401  Unauthorized [IP: 51.91.38.34 443]
E: The repository 'https://enterprise.proxmox.com/debian/pve bookworm InRelease' is not signed.
N: Updating from such a repository can't be done securely, and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.
```

- Desactivar repositorios premium

```bash
sed -i '/enterprise/s/^/# /' /etc/apt/sources.list.d/ceph.list
sed -i '/enterprise/s/^/# /' /etc/apt/sources.list.d/pve-enterprise.list
echo 'deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription' >> /etc/apt/sources.list

```

<!-- - Verificar éxito

```log

    # HADN'T DONE THE pve-no-subscription LINE

root@pve:~# apt update
Ign:1 http://security.debian.org bookworm-security InRelease            
Ign:2 http://ftp.es.debian.org/debian bookworm InRelease                
Hit:3 http://ftp.es.debian.org/debian bookworm-updates InRelease
Hit:1 http://security.debian.org bookworm-security InRelease
Hit:2 http://ftp.es.debian.org/debian bookworm InRelease
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
81 packages can be upgraded. Run 'apt list --upgradable' to see them.
``` -->

- Verificar repositorios activados

```log
root@pve:~# cat /etc/apt/sources.list
deb http://ftp.es.debian.org/debian bookworm main contrib

deb http://ftp.es.debian.org/debian bookworm-updates main contrib

# security updates
deb http://security.debian.org bookworm-security main contrib
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription
```

- Hacer los mensajes de APT más informativos/legibles

```bash
if [ ! -e "/etc/apt/apt.conf.d/99show-versions" ]; then
    echo 'APT::Get::Show-Versions "true";' > /etc/apt/apt.conf.d/99show-versions
fi
```
- Verificar configuración de APT

```log
root@pve:~# for file in /etc/apt/apt.conf.d/*; do echo $file; cat $file; echo ""; done
/etc/apt/apt.conf.d/01autoremove
APT
{
  NeverAutoRemove
  {
        "^firmware-linux.*";
        "^linux-firmware$";
        "^linux-image-[a-z0-9]*$";
        "^linux-image-[a-z0-9]*-[a-z0-9]*$";
  };

  VersionedKernelPackages
  {
        # kernels
        "linux-.*";
        "kfreebsd-.*";
        "gnumach-.*";
        # (out-of-tree) modules
        ".*-modules";
        ".*-kernel";
  };

  Never-MarkAuto-Sections
  {
        "metapackages";
        "tasks";
  };

  Move-Autobit-Sections
  {
        "oldlibs";
  };
};

/etc/apt/apt.conf.d/10pveapthook
DPkg::Pre-Install-Pkgs { "/usr/share/proxmox-ve/pve-apt-hook"; };
DPkg::Tools::Options::/usr/share/proxmox-ve/pve-apt-hook "";
DPkg::Tools::Options::/usr/share/proxmox-ve/pve-apt-hook::Version "2";
DPkg::Tools::Options::/usr/share/proxmox-ve/pve-apt-hook::InfoFD "20";

/etc/apt/apt.conf.d/20listchanges
DPkg::Pre-Install-Pkgs { "/usr/bin/apt-listchanges --apt || test $? -lt 10"; };
DPkg::Tools::Options::/usr/bin/apt-listchanges::Version "2";
DPkg::Tools::Options::/usr/bin/apt-listchanges::InfoFD "20";
Dir::Etc::apt-listchanges-main "listchanges.conf";
Dir::Etc::apt-listchanges-parts "listchanges.conf.d";

/etc/apt/apt.conf.d/70debconf
// Pre-configure all packages with debconf before they are installed.
// If you don't like it, comment it out.
DPkg::Pre-Install-Pkgs {"/usr/sbin/dpkg-preconfigure --apt || true";};

/etc/apt/apt.conf.d/99show-versions
APT::Get::Show-Versions "true";
```



### 2.4 Instalación inicial de paquetes para la shell

<!-- root@pve:~# apt update
Hit:1 http://security.debian.org bookworm-security InRelease
Hit:2 http://ftp.es.debian.org/debian bookworm InRelease                 
Hit:3 http://ftp.es.debian.org/debian bookworm-updates InRelease
Hit:4 http://download.proxmox.com/debian/pve bookworm InRelease
Reading package lists... Done          
Building dependency tree... Done
Reading state information... Done
All packages are up to date.
root@pve:~#  -->

- Actualizar el sistema

```bash
apt update
apt upgrade -y

# System booted in EFI-mode but 'grub-efi-amd64' meta-package not installed!
apt install -y grub-efi-amd64

reboot
```

- Instalar paquetes básicos

```bash
apt install -y neofetch --no-install-recommends
apt install -y bat tmux

if ! command -v bat && command -v batcat; then
    mv $(which batcat) /usr/bin/bat
fi
```
```log
root@pve:~# neofetch 
         .://:`              `://:.            root@pve 
       `hMMMMMMd/          /dMMMMMMh`          -------- 
        `sMMMMMMMd:      :mMMMMMMMs`           OS: Proxmox VE 8.0.3 x86_64 
`-/+oo+/:`.yMMMMMMMh-  -hMMMMMMMy.`:/+oo+/-`   Host: NB-EX2511-55PF V3.72 
`:oooooooo/`-hMMMMMMMyyMMMMMMMh-`/oooooooo:`   Kernel: 6.2.16-3-pve 
  `/oooooooo:`:mMMMMMMMMMMMMm:`:oooooooo/`     Uptime: 1 min 
    ./ooooooo+- +NMMMMMMMMN+ -+ooooooo/.       Packages: 683 (dpkg) 
      .+ooooooo+-`oNMMMMNo`-+ooooooo+.         Shell: bash 5.2.15 
        -+ooooooo/.`sMMs`./ooooooo+-           Resolution: 1366x768 
          :oooooooo/`..`/oooooooo:             Terminal: /dev/pts/0 
          :oooooooo/`..`/oooooooo:             CPU: Intel i5-4210U (4) @ 2.700GHz 
        -+ooooooo/.`sMMs`./ooooooo+-           GPU: Intel Haswell-ULT 
      .+ooooooo+-`oNMMMMNo`-+ooooooo+.         Memory: 1174MiB / 15906MiB 
    ./ooooooo+- +NMMMMMMMMN+ -+ooooooo/.
  `/oooooooo:`:mMMMMMMMMMMMMm:`:oooooooo/`                             
`:oooooooo/`-hMMMMMMMyyMMMMMMMh-`/oooooooo:`                           
`-/+oo+/:`.yMMMMMMMh-  -hMMMMMMMy.`:/+oo+/-`
        `sMMMMMMMm:      :dMMMMMMMs`
       `hMMMMMMd/          /dMMMMMMh`
         `://:`              `://:`
```


```bash
```


### 2.5 Cluster / HA / `/dev/sda`


## 3. CTs (LXC) y VMs

<!-- tmux new-session -s templates -->

### 3.0 Preparar las Plantillas para contenedores


```bash
# https://192.168.1.200:8006/pve-docs/chapter-pct.html#pct_container_images

# Mirar plantillas disponibles localmente
pveam list local
# ninguna

# Plantillas que pueden ser descargadas
pveam update &&
pveam available --section system

# Descargamos las de Debian 12 y ubuntu 22.04
pveam download local debian-12-standard_12.2-1_amd64.tar.zst
pveam download local ubuntu-22.04-standard_22.04-1_amd64.tar.zst

```
<!-- 
root@pve:~# pveam download local debian-12-standard_12.2-1_amd64.tar.zst
downloading http://download.proxmox.com/images/system/debian-12-standard_12.2-1_amd64.tar.zst to /var/lib/vz/template/cache/debian-12-standard_12.2-1_amd64.tar.zst
--2024-03-22 18:17:15--  http://download.proxmox.com/images/system/debian-12-standard_12.2-1_amd64.tar.zst
Resolving download.proxmox.com (download.proxmox.com)... 51.91.38.34, 2001:41d0:203:7470::34
Connecting to download.proxmox.com (download.proxmox.com)|51.91.38.34|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 126129049 (120M) [application/octet-stream]
Saving to: '/var/lib/vz/template/cache/debian-12-standard_12.2-1_amd64.tar.zst.tmp_dwnl.3123'
     0K ........ ........ ........ ........ 26% 43.9M 2s
 32768K ........ ........ ........ ........ 53% 67.6M 1s
 65536K ........ ........ ........ ........ 79% 68.2M 0s
 98304K ........ ........ ........         100% 63.9M=2.1s
2024-03-22 18:17:18 (58.6 MB/s) - '/var/lib/vz/template/cache/debian-12-standard_12.2-1_amd64.tar.zst.tmp_dwnl.3123' saved [126129049/126129049]
calculating checksum...OK, checksum verified
download of 'http://download.proxmox.com/images/system/debian-12-standard_12.2-1_amd64.tar.zst' to '/var/lib/vz/template/cache/debian-12-standard_12.2-1_amd64.tar.zst' finished -->

### 3.1 101 CT Ubuntu para Docker Compose (webapp PROYECTO `lamp_docker`)

#### A. Creación

```yaml
Crear CT:
    General:
        Nodo: pve
        CT ID: 101
        Nombre del host: webapp
        Contenedor sin privilegios: yes
        Nesting: yes
        Conjunto de recursos: -
        Contraseña: changeme
        Clave pública SSH: -
    Plantilla:
        Almacenamiento: local
        Plantilla: debian-12-standard_12.2-1_amd64.tar.zst
    Discos:
        Almacenamiento: local-lvm
        Tamaño de disco (GiB): 8
        Opciones de montaje: lazytime
        ACLs: Por defecto
        Saltar replicación: no
    CPU:
        Núcleos: 2
    Memoria:
        Memoria (MiB): 2048
        Swap (MiB): 512
    Red:
        Nombre: eth0
        Dirección MAC: auto
        Puente: vmbr0
        Etiqueta VLAN: Ninguna VLAN
        Cortafuego: yes
        IPv4: Estático
        IPv4/CIDR: 192.168.1.211/24
        Puerta de enlace (IPv4): 192.168.1.1
        IPv6: Ninguna
        Desconectar: no
        MTU: Igual que el puente
        Tasa límite: unlimited
    DNS:
        Dominio DNS: usar configuraciones del Host
        Servidores DNS: usar configuraciones del Host
    Confirmar:
```

| Key               | Value
| ---               | ---
| cores             | 2
| features          | nesting=1
| hostname          | webapp
| memory            | 2048
| net0              | name=eth0,bridge=vmbr0,firewall=1,ip=192.168.1.211/24,gw=192.168.1.1
| nodename          | pve
| ostemplate        | local:vztmpl&debian-12-standard_12.2.1_amd64.tar.zst
| pool              | 
| rootfs            | local-lvm:8,mountoptions=lazytime
| ssh-public-keys   | 
| swap              | 512
| unpriviledged     | 1
| vmid              | 101


  <!-- Logical volume "vm-101-disk-0" created.
Creating filesystem with 2097152 4k blocks and 524288 inodes
Filesystem UUID: 0e5a27c2-e89d-42d7-bf7f-3e0847319971
Superblock backups stored on blocks: 
	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632
extracting archive '/var/lib/vz/template/cache/debian-12-standard_12.2-1_amd64.tar.zst'
Total bytes read: 519987200 (496MiB, 233MiB/s)
Detected container architecture: amd64
Creating SSH host key 'ssh_host_rsa_key' - this may take some time ...
done: SHA256:Ei40XleUO9sAB6yabN/XKbXFYjM/R/006PDYMBrK2Ag root@webapp
Creating SSH host key 'ssh_host_dsa_key' - this may take some time ...
done: SHA256:ksHrZLoehrz//bSAGvRPyRNR1y1OwPTMj2l8oYTNSuQ root@webapp
Creating SSH host key 'ssh_host_ed25519_key' - this may take some time ...
done: SHA256:2gDhDrwVTTDxo40LRmLXLQ+3TlGU88PUolxTIEODT2U root@webapp
Creating SSH host key 'ssh_host_ecdsa_key' - this may take some time ...
done: SHA256:kkRNig3v9cYP95Av8Cg9fakkAkkbYsCbsbsbyZGkjUA root@webapp
TASK OK -->

#### B. Inicio y uso

> Iniciar > Consola > usuario=root,contraseña=changeme

<!-- ```bash
root@webapp:~# uname -a
Linux webapp 6.5.13-3-pve #1 SMP PREEMPT_DYNAMIC PMX 6.5.13-3 (2024-03-20T10:45Z) x86_64 GNU/Linux
root@webapp:~# cat /etc/os-release 
PRETTY_NAME="Debian GNU/Linux 12 (bookworm)"
NAME="Debian GNU/Linux"
VERSION_ID="12"
VERSION="12 (bookworm)"
VERSION_CODENAME=bookworm
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
root@webapp:~# 
root@webapp:~# apt list --installed | wc -l

WARNING: apt does not have a stable CLI interface. Use with caution in scripts.

267
root@webapp:~# df -h
Filesystem                        Size  Used Avail Use% Mounted on
/dev/mapper/pve-vm--101--disk--0  7.8G  608M  6.8G   9% /
none                              492K  4.0K  488K   1% /dev
udev                              7.8G     0  7.8G   0% /dev/tty
tmpfs                             7.8G     0  7.8G   0% /dev/shm
tmpfs                             3.2G   80K  3.2G   1% /run
tmpfs                             5.0M     0  5.0M   0% /run/lock
root@webapp:~# 
``` -->

```bash
echo 'APT::Get::Show-Versions "true";' > /etc/apt/apt.conf.d/99show-versions
apt update && apt upgrade -y

# dpkg-reconfigure tzdata
echo 'Europe/Madrid' > /etc/timezone
```
- Instalar docker (https://docs.docker.com/engine/install/debian/)

```bash
# Add Docker's official GPG key:
apt-get update
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update


apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

- Preparar lo de la webapp

```bash
apt update
apt install -y bat grc git jq lf mycli tmux
apt install -y --no-install-recommends neofetch

if ! command -v bat && command -v batcat; then
    mv $(which batcat) /usr/bin/bat
fi

echo "alias dps='grc docker ps'" >> ~/.bashrc
```

- Levantar webapp

```bash
git clone https://github.com/pabloqpacin/lamp_docker $HOME/PROYECTO
cd $HOME/PROYECTO
# tmux new

docker compose up -d

grc docker ps
```

- Entrar desde otro navegador

```bash
xdg-open http://192.168.1.211
```

### 3.2 102 CT Docker LXC (https://tteck.github.io/Proxmox/) para PROYECTO

- En la shell principal del nodo/instalación Proxmox

```bash
# script foo        # TODO!!
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/ct/docker.sh)"
```
```yaml
Proxmox VE Helper Scripts - Docker LXC:
    Settings: Advanced:
        Default distro: debian 12
        Type: 1 (Unpriviledged)
        Root password: changeme
        Container ID: 102
        Hostname: docker-102
        Disk size: 4GB
        CPU Cores: 2
        RAM: 4096
        Bridge: vmbr0
        # IP Address: dhcp
        IP Address: 192.168.1.212/24
        Gateway IP: 192.168.1.1
        APT-Cacher IP: -
        Disable IPv6: no
        MTU Size: -
        DNS Search Domain: -
        DNS Search IP: -
        MAC Address: -
        VLAN: -
        Enable SSH Access: no
        Verbose mode: yes
        Create Docker LXC: yes

# Creación del contenedor + actualización e instalaciones automatizadas

Añadir Portainer: yes
Añadir Docker Compose: yes
```

<!-- ```log
# ...
``` -->

- Entramos en Portainer si queremos (desde otro dispositivo)

```bash
xdg-open https://192.168.1.212:9443
```

- En el contenedor 102, hacemos preparativos y desplegamos la movida

```bash
git --version
git clone https://github.com/pabloqpacin/lamp_docker $HOME/PROYECTO

# SCRIPT


cd $HOME/PROYECTO
docker compose up -d
grc docker ps

```




### 3.n ... Kubernetes (minikube)

```yaml

```