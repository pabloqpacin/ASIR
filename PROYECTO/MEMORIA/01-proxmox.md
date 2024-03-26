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
    - [3.0 Preparar las Plantillas para contenedores e ISOs para VMs](#30-preparar-las-plantillas-para-contenedores-e-isos-para-vms)
      - [A. Plantillas para Contenedores LXC](#a-plantillas-para-contenedores-lxc)
      - [B. ISOs para VMs](#b-isos-para-vms)
    - [3.1 101 CT Ubuntu para Docker Compose (webapp PROYECTO `lamp_docker`)](#31-101-ct-ubuntu-para-docker-compose-webapp-proyecto-lamp_docker)
      - [A. Creación](#a-creación)
      - [B. Inicio y uso](#b-inicio-y-uso)
    - [3.2 102 CT Docker LXC (https://tteck.github.io/Proxmox/) para PROYECTO](#32-102-ct-docker-lxc-httpstteckgithubioproxmox-para-proyecto)
    - [3.n ... Ubuntu con Helper-Script ~~para Kubernetes (minikube)~~](#3n--ubuntu-con-helper-script-para-kubernetes-minikube)
    - [3.4 Arch Linux para Kubernetes (minikube o kubeadm?)](#34-arch-linux-para-kubernetes-minikube-o-kubeadm)
      - [A. Creación](#a-creación-1)
      - [B. Configuración inicial](#b-configuración-inicial)
      - [C. Setup Docker + Kubernetes](#c-setup-docker--kubernetes)
    - [3.201 VM Archlinux para K8S](#3201-vm-archlinux-para-k8s)
      - [A. Creación](#a-creación-2)
      - [B. Instalación y configuración](#b-instalación-y-configuración)
      - [C. Kubernetes](#c-kubernetes)
        - [Instalación](#instalación)
        - [PRUEBA 1: nginx para buenardas](#prueba-1-nginx-para-buenardas)
        - [PRUEBA 2: php-apache para webapp](#prueba-2-php-apache-para-webapp)
  - [4. NFS en /dev/sda](#4-nfs-en-devsda)

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

<!-- - Verificar configuración de APT

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
``` -->


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

### 3.0 Preparar las Plantillas para contenedores e ISOs para VMs

#### A. Plantillas para Contenedores LXC

```bash
# https://192.168.1.200:8006/pve-docs/chapter-pct.html#pct_container_images

# Mirar plantillas disponibles localmente
pveam list local
# ninguna

# Plantillas que pueden ser descargadas
pveam update &&
pveam available --section system

# Descargamos las de Debian 12 y ubuntu 22.04 (y Arch)
pveam download local debian-12-standard_12.2-1_amd64.tar.zst
pveam download local ubuntu-22.04-standard_22.04-1_amd64.tar.zst
pveam download local archlinux-base_20230608-1_amd64.tar.zst

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

#### B. ISOs para VMs

- En la GUI web de Proxmox, vamos a `Almacenamiento 'local' en el nodo 'pve'` > `Imágenes ISO` > Cargar > lo seleccionamos de nuestro ordenador local
- Cargamos:
  - `archlinux-2023.11.01-x86_64.iso`
  - ...

<!-- ```log
starting file import from: /var/tmp/pveupload-e63807e9e7f47a381685a410b7906984
target node: pve
target file: /var/lib/vz/template/iso/archlinux-2023.11.01-x86_64.iso
file size is: 846540800
command: cp -- /var/tmp/pveupload-e63807e9e7f47a381685a410b7906984 /var/lib/vz/template/iso/archlinux-2023.11.01-x86_64.iso
finished file import successfully
``` -->


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
| ostemplate        | local:vztmpl/debian-12-standard_12.2.1_amd64.tar.zst
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

> https://tteck.github.io/Proxmox/

- Scripts invocados:
  - Resumen de las acciones: https://github.com/tteck/Proxmox/blob/main/ct/docker.sh
  - Creación del contenedor: https://github.com/tteck/Proxmox/blob/main/misc/build.func
    - TUI mediante [whiptail](https://atareao.es/tutorial/dialogos-para-scripts/whiptail-dialogos-para-el-terminal/)
  - Instalación de Docker: https://github.com/tteck/Proxmox/blob/main/install/docker-install.sh

<!-- ```bash
# Instalación de Docker
# ---

msg_info() {
  local msg="$1"
  echo -ne " ${HOLD} ${YW}${msg}   "
  spinner &
  SPINNER_PID=$!
}

get_latest_release() {
  curl -sL https://api.github.com/repos/$1/releases/latest | grep '"tag_name":' | cut -d'"' -f4
}

DOCKER_LATEST_VERSION=$(get_latest_release "moby/moby")

if [ "$VERBOSE" = "yes" ]; then
  STD=""
else STD="silent"; fi
silent() { "$@" >/dev/null 2>&1; }

# ---

msg_info "Installing Docker $DOCKER_LATEST_VERSION"
DOCKER_CONFIG_PATH='/etc/docker/daemon.json'
mkdir -p $(dirname $DOCKER_CONFIG_PATH)
echo -e '{\n  "log-driver": "journald"\n}' >/etc/docker/daemon.json
$STD sh <(curl -sSL https://get.docker.com)
msg_ok "Installed Docker $DOCKER_LATEST_VERSION"
``` -->

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

### 3.n ... Ubuntu con Helper-Script ~~para Kubernetes (minikube)~~

- Helper-Script para ubuntu

```bash
# En la consola del propio nodo Proxmox
bash -c "$(wget -qLO - https://github.com/tteck/Proxmox/raw/main/ct/ubuntu.sh)"
```
```yaml
Proxmox VE Helper Scripts - Docker LXC:
    Settings: Advanced:
        Default distro: ubuntu 23.10    # VS 22.04
        Type: 1 (Unpriviledged)
        Root password: changeme
        Container ID: 103
        Hostname: ubuntu-103
        Disk size: 8GB
        CPU Cores: 2
        RAM: 4096
        Bridge: vmbr0
        # IP Address: dhcp
        IP Address: 192.168.1.213/24
        Gateway IP: 192.168.1.1
        # APT-Cacher IP: -
        # Disable IPv6: no
        # MTU Size: -
        # DNS Search Domain: -
        # DNS Search IP: -
        # MAC Address: -
        # VLAN: -
        # Enable SSH Access: no
        # Verbose mode: no
        Create Docker LXC: yes

# Creación del contenedor + actualización e instalaciones automatizadas

Añadir Portainer: yes
Añadir Docker Compose: yes
```

- Actualización y configuración inicial

```bash
bash -c "$(https://github.com/pabloqpacin/lamp_docker/scripts/lxc-base.sh)"
```


### 3.4 Arch Linux para Kubernetes (minikube o kubeadm?)

#### A. Creación

```yaml
Crear CT:
    General:
        Nodo: pve
        CT ID: 104
        Nombre del host: arch-k8s-104
        # Contenedor sin privilegios: yes
        # Nesting: yes
        # Conjunto de recursos: -
        Contraseña: changeme
        # Clave pública SSH: -
    Plantilla:
        Almacenamiento: local
        Plantilla: archlinux-base_20230608-1_amd64.tar.zst
    Discos:
        Almacenamiento: local-lvm
        Tamaño de disco (GiB): 20
        # Opciones de montaje: -
        # ACLs: Por defecto
        # Saltar replicación: no
    CPU:
        Núcleos: 2
    Memoria:
        Memoria (MiB): 4096
        Swap (MiB): 0     # KUBERNETES!!
    Red:
        # Nombre: eth0
        # Dirección MAC: auto
        # Puente: vmbr0
        # Etiqueta VLAN: Ninguna VLAN
        # Cortafuego: yes
        IPv4: Estático
        IPv4/CIDR: 192.168.1.214/24
        Puerta de enlace (IPv4): 192.168.1.1
        # IPv6: Ninguna
        # Desconectar: no
        # MTU: Igual que el puente
        # Tasa límite: unlimited
    DNS:
        # Dominio DNS: usar configuraciones del Host
        # Servidores DNS: usar configuraciones del Host
    Confirmar:
```

| Key               | Value
| ---               | ---
| cores             | 2
| features          | nesting=1
| hostname          | arch-k8s-104
| memory            | 4096
| net0              | name=eth0,bridge=vmbr0,firewall=1,ip=192.168.1.214/24,gw=192.168.1.1
| nodename          | pve
| ostemplate        | local:vztmpl/archlinux-base20230608-1_amd64.tar.zst
| pool              | 
| rootfs            | local-lvm:20
| ssh-public-keys   | 
| swap              | 0
| unpriviledged     | 1
| vmid              | 104

<!-- ```log
  Logical volume "vm-104-disk-0" created.
Creating filesystem with 5242880 4k blocks and 1310720 inodes
Filesystem UUID: 8bc01a0a-3eae-4c13-8f98-9bd7866b240b
Superblock backups stored on blocks: 
	32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654208, 
extracting archive '/var/lib/vz/template/cache/archlinux-base_20230608-1_amd64.tar.zst'
Total bytes read: 585113600 (559MiB, 205MiB/s)
Detected container architecture: amd64
Creating SSH host key 'ssh_host_rsa_key' - this may take some time ...
done: SHA256:9rnmL7dsaGNnI7w+FT2VHCfwlXnWzdO9iTywLdfR0fw root@arch-k8s-104
Creating SSH host key 'ssh_host_dsa_key' - this may take some time ...
done: SHA256:MNIwBKNwsbN7nQD1CMSs8lBz96Y63aRv7TAQp7ha8+s root@arch-k8s-104
Creating SSH host key 'ssh_host_ed25519_key' - this may take some time ...
done: SHA256:9KXr4cMRy+zoqoxXYWhI4B9vsr+BN9+RNbWi41kJh3g root@arch-k8s-104
Creating SSH host key 'ssh_host_ecdsa_key' - this may take some time ...
done: SHA256:cuikHUcu0BNyjI2mrSThrpDMrOzcOTpja4+pcZqKPsg root@arch-k8s-104
TASK OK
``` -->


#### B. Configuración inicial

```bash
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime

pacman-key --init
pacman-key --populate archlinux
pacman -Sy --noconfirm archlinux-keyring

sed -i '/Verbose/s/^#//' /etc/pacman.conf
sed -i '/Parallel/s/^#//' /etc/pacman.conf
sed -i -e '/^#Color/s/^#//' -e '/^Color/a ILoveCandy' /etc/pacman.conf
pacman -Syu --noconfirm

pacman -Sy base-devel bat bottom eza fzf git git-delta grc inetutils jq lf \
           man man-pages neofetch neovim nmap openbsd-netcat openssh python-pip \
           python ripgrep sudo tmux unzip whois zsh --noconfirm

sudo systemctl enable --now sshd

useradd -mg users -G wheel pabloqpacin
passwd pabloqpacin
EDITOR=nvim visudo
    # descomentar primera instancia de: %wheel ALL=(ALL:ALL) ALL

reboot
```
```bash
# Login como nombre_usuario, no root
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay && makepkg -si --noconfirm && cd ~

yay -S --noconfirm --cleanmenu=false --diffmenu=false dnslookup-bin mycli nvim-packer-git   # termshark

git clone --depth 1 https://github.com/pabloqpacin/dotfiles.git ~/dotfiles

yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh) $USER
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~
bash ~/dotfiles/scripts/setup/omz*
bash ~/dotfiles/zsh/plugins/clone-em.sh

ln -s ~/dotfiles/.myclirc ~/
ln -s ~/dotfiles/.gitconfig ~/
ln -s ~/dotfiles/.config/lf ~/.config
ln -s ~/dotfiles/.config/bat ~/.config
ln -s ~/dotfiles/.config/bottom ~/.config
ln -s ~/dotfiles/.config/nvim ~/.config
ln -s ~/dotfiles/.config/tmux ~/.config   # PROBLEMA para seleccionar y copiar

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
if ! command -v node &>/dev/null && ! command -v npm &>/dev/null; then
    [ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"
    nvm install node
fi

# https://stackoverflow.com/questions/2610115/why-is-sed-not-recognizing-t-as-a-tab
sed -i $'/romgrk/a \t--[[' ~/.config/nvim/lua/pabloqpacin/packer.lua
sed -i $'/elkowar/i \t]]--' ~/.config/nvim/lua/pabloqpacin/packer.lua 
rm -r ~/.config/nvim/after/plugin/debug

cd ~/.config/nvim && nvim lua/pabloqpacin/packer.lua
    # comment out the 'nvim-dap' lines...
    # $ :so && :PackerSync && :PackerCompile && :MasonUpdate

sudo reboot
```

> SNAPSHOT: BASE


#### C. Setup Docker + Kubernetes

<!-- ```bash
git clone https://github.com/pabloqpacin/lamp_docker $HOME/PROYECTO
cd ~/PROYECTO
docker compose up -d
reboot
```
```log
``` -->

```bash
sudo pacman -Syu --noconfirm docker docker-buildx docker-compose
sudo systemctl enable --now docker
sudo usermod -aG docker $USER

sudo pacman -Syu --noconfirm helm kubectl minikube
yes | sudo pacman -Syu kubelet
sudo systemctl enable --now kubelet

reboot
```
```bash
# watch df -h
# bat /proc/swaps

minikube start    # TODO: take more than 2200MB Memory
  # ERRORS!!
minikube start --extra-config=kubelet.cgroup-driver=systemd
mk start --fail-swap-on

# minikube addons enable metrics-server
```


### 3.201 VM Archlinux para K8S

#### A. Creación

```yaml
Crear VM:
  General:
    Nodo: pve
    VM ID: 201
    Nombre: arch-k8s-201
    # Iniciar al arranque: no
  SO:
    Almacenamiento: local
    Imagen ISO: archlinux-2023.11.01-x86_64.iso
    # Tipo: Linux
    # Versión: 6.x - 2.6 Kernel
  Sistema:
    Tarjeta gráfica: Por defecto
    Máquina: q35
    BIOS: OVMF
    Almacenamiento EFI: local-lvm
    Controlador SCSI: VirtIO SCSI single
    # Qemu Agent: no
    # Agregar TPM: no
  Discos:
    Bus/Dispositivo: SCSI 0
    Almacenamiento: local-lvm
    Tamaño (GiB): 32
    Caché: Por defecto (No hay memoria caché)
    # Emulacioń de SSD: no
    # Respaldo: yes
  CPU:
    Zócalos: 1
    Núcleos: 4
    Tipo: x86-64-x2-AES
  Memoria:
    Memoria (MiB): 4096
    Dispositivo Ballooning: yes
  Red:
    Puente: vmbr0
    Modelo: VirtIO
```

| Key               | Value
| ---               | ---
| bios              | ovmf
| cores             | 4
| cpu               | x86-64-v2-AES
| efidisk0          | local-lvm:1,efitype=4m,pre-enrolled-keys=1
| ide2              | local:iso/archlinux-2023.11.01-x86_64.iso,media=cdrom
| machine           | q35
| memory            | 4096
| name              | arch-k8s-201
| net0              | virtio,bridge=vmbr0,firewall=1
| nodename          | pve
| numa              | 0
| ostype            | l26
| scsi0             | local-lvm:32,iothread=on
| scsihw            | virtio-scsi-single
| sockets           | 1
| vmid              | 201

<!-- ```log
snapshotting 'drive-scsi0' (local-lvm:vm-201-disk-1)
  Logical volume "snap_vm-201-disk-1_Pre-Install" created.
snapshotting 'drive-efidisk0' (local-lvm:vm-201-disk-0)
  Logical volume "snap_vm-201-disk-0_Pre-Install" created.
``` -->

#### B. Instalación y configuración

- Si no arranca, acceder a la BIOS de la VM y **desactivar Secure Boot**
- https://github.com/pabloqpacin/dotfiles/blob/main/docs/linux/Arch_Hypr.md
- Para IP estática: 

```bash
# https://serverfault.com/questions/1006634/nmcli-set-static-ip-address-without-the-dhcp
nmcli con show
nmcli con mod 'Wired connection 1' ipv4.addresses "192.168.1.221/24"
nmcli con mod 'Wired connection 1' ipv4.gateway "192.168.1.1"
nmcli con mod 'Wired connection 1' ipv4.method manual
nmcli con mod 'Wired connection 1' connection.autoconnect yes
reboot
```

<!-- 
```yaml 
Proxmox pve: 201 (arch-k8s-201):
  Cortafuegos:
    Opciones: Editar DHCP: Editar: No
    IPSet:
      Crear: k8s:
        IP/CIDR: Agregar: 192.168.1.221/24
``` -->


#### C. Kubernetes

<!-- ```bash
sudo pacman -S docker docker-buildx docker-compose
sudo pacman -S helm kubectl minikube      # yes | sps kubelet ???
sudo systemctl enable --now docker
sudo usermod -aG docker $USER
reboot

minikube start
kubectl get node -o wide
```

```bash
git clone https://github.com/pabloqpacin/lamp_docker $HOME/PROYECTO

mkdir ~/k8s && cd $_
nvim webapp.yaml
# ...
# whatever, with minikube i cant see the svc from my network i dunno
``` -->

##### Instalación

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/pabloqpacin/k8s-bs/main/scripts/INSTALL.sh)"
sudo systemctl enable --now containerd
{
  echo 'net.bridge.bridge-nf-call-iptables = 1'
  echo 'net.ipv4.ip_forward = 1'
} | tee -a /etc/sysctl.conf
sudo sysctl -p
bash -c "$(curl -fsSL https://raw.githubusercontent.com/pabloqpacin/k8s-bs/main/scripts/INSTALL.sh)"

kubectl taint nodes --all node-role.kubernetes.io/control-plane-
```
```bash
mkdir -p ~/k8s/metrics && cd $_
wget -q https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
sed -i $'/secure-port/a\\ \ \ \ \ \ \ \ \- --kubelet-insecure-tls' components.yaml
kubectl apply -f components.yaml
watch kubectl -n kube-system get pods -o wide
kubectl top nodes
kubectl top pod <pod>
```


##### PRUEBA 1: nginx para buenardas

```bash
git clone https://github.com/pabloqpacin/ASIR /tmp/ASIR
sudo cp -r /tmp/ASIR/Redes/Entregas/web /mnt/web
# git clone https://github.com/pabloqpacin/lamp_docker $HOME/PROYECTO
```
```bash
mkdir ~/k8s && cd $_
nvim foo.yaml
```
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-volume
  labels:
    type: local
spec:
  storageClassName: sistemaficheros     # ojo
  capacity:
    storage: 2Gi
  accessModes:                          # 1+ ok
    - ReadWriteMany
  hostPath:                             # DRIVER
    path: "/mnt/web"                   # en el nodo!!

---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pv-claim
spec:
  storageClassName: sistemaficheros
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Gi                      # se asocian los 2 del PV, desaprovechado por diseño

---
apiVersion: v1
kind: Pod
metadata:
  name: pv-pod
  labels:
    app: www
spec:
  volumes:
    - name: pv-storage
      persistentVolumeClaim:
        claimName: pv-claim
  containers:
    - name: task-pv-container
      image: nginx
      ports:
        - containerPort: 80
          name: "http-server"
      volumeMounts:
        - mountPath: "/usr/share/nginx/html"
          name: pv-storage
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  type: NodePort
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30080  # Choose a port number within the allowed range
  selector:
    app: www  # Assuming your pod has a label "app: nginx"
```

```bash
kubectl apply -f foo.yaml

# Desde otro ordenador en la red
xdg-open http://192.168.1.221:30080
```


##### PRUEBA 2: php-apache para webapp

```bash
sudo git clone https://github.com/pabloqpacin/lamp_docker /mnt/PROYECTO

mkdir ~/k8s/webapp && cd $_
nvim pv-pvc.yaml
```
```yaml
###########################
# VOLUMES: local, no NFS #
#########################

apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-apachephp
spec:
  storageClassName: apachephp
  capacity:
    storage: 2Gi
  accessModes:
    - ReadWriteMany
  hostPath:
    path: /mnt/PROYECTO/helpdesk-core-php
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-apachephp
spec:
  storageClassName: apachephp
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Gi

---
apiVersion: v1
kind: PersistentVolume
metadata:
  name: pv-mysql
spec:
  capacity:
    storage: 2Gi
  accessModes:
    - ReadWriteMany
  persistentVolumeReclaimPolicy: Recycle
  storageClassName: mysql
  hostPath:
    path: /mnt/PROYECTO/helpdesk-core-php/database
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: pvc-mysql
spec:
  storageClassName: mysql
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Gi
```
```bash
kubectl apply -f pv-pvc.yaml
kubectl get pv && kubectl get pvc

nvim mysql.yaml
```
```yaml
###########################
# ConfigMap VS Secret... #
#########################
apiVersion: v1
kind: ConfigMap
metadata:
  name: datos-mysql-env
  namespace: default
data:
  MYSQL_USER: admin
  MYSQL_PASSWORD: password
  MYSQL_ROOT_PASSWORD: password
  MYSQL_DATABASE: helpdesk_core_php
  MYSQL_ROOT_HOST: '%'
  TZ: Europe/Madrid
---

apiVersion: v1
kind: Service
metadata:
  name: mysql
  labels:
    app: webapp
spec:
  ports:
    - port: 3306
      targetPort: 3306
      nodePort: 30306
  selector:
    app: webapp
    tier: mysql
  # clusterIP: None
  type: NodePort
---

apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql
  labels:
    app: webapp
spec:
  selector:
    matchLabels:
      app: webapp
      tier: mysql
  strategy:
    type: Recreate
  template:
    metadata:
      labels:
        app: webapp
        tier: mysql
    spec:
      containers:
      - name: mysql
        image: mysql:8.0.35
        envFrom:
        - configMapRef:
            name: datos-mysql-env
        ports:
        - containerPort: 3306
          name: mysql
        volumeMounts:
        - name: mysql-persistent-storage
          # mountPath: /var/lib/mysql
          mountPath: /docker-entrypoint-initdb.d
        resources:
          requests:
            memory: "500Mi"
            cpu: "100m"
          limits:
            memory: "1Gi"
            cpu: "200m"
      volumes:
      - name: mysql-persistent-storage
        persistentVolumeClaim:
          claimName: pvc-mysql
```
<!-- ```log
[pabloqpacin:~]$ kc logs mysql-fd694c5c4-hqzvx
2024-03-23 21:43:43+01:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.35-1.el8 started.
2024-03-23 21:43:44+01:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
2024-03-23 21:43:44+01:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 8.0.35-1.el8 started.
2024-03-23 21:43:46+01:00 [Note] [Entrypoint]: Initializing database files
2024-03-23T20:43:46.553552Z 0 [Warning] [MY-011068] [Server] The syntax '--skip-host-cache' is deprecated and will be removed in a future release. Please use SET GLOBAL host_cache_size=0 instead.
2024-03-23T20:43:46.553763Z 0 [System] [MY-013169] [Server] /usr/sbin/mysqld (mysqld 8.0.35) initializing of server in progress as process 79
2024-03-23T20:43:46.556033Z 0 [ERROR] [MY-010457] [Server] --initialize specified but the data directory has files in it. Aborting.
2024-03-23T20:43:46.556044Z 0 [ERROR] [MY-013236] [Server] The designated data directory /var/lib/mysql/ is unusable. You can remove all files that the server added to it.
2024-03-23T20:43:46.556135Z 0 [ERROR] [MY-010119] [Server] Aborting
2024-03-23T20:43:46.556392Z 0 [System] [MY-010910] [Server] /usr/sbin/mysqld: Shutdown complete (mysqld 8.0.35)  MySQL Community Server - GPL.
``` -->

```bash
kubectl apply -f mysql.yaml
kubectl get service
mycli -h 192.168.1.221 -P 30306 -u root -ppassword

nvim www.yaml
```

```yaml

```

```bash
```


```
```



---

## 4. NFS en /dev/sda

- Setup inicial: TrueNAS

```log
root@pve:~# lsblk
NAME                         MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda                            8:0    0 223.6G  0 disk 
├─sda1                         8:1    0     1M  0 part 
├─sda2                         8:2    0   512M  0 part 
├─sda3                         8:3    0 207.1G  0 part 
└─sda4                         8:4    0    16G  0 part 
sdb                            8:16   0 447.1G  0 disk 
├─sdb1                         8:17   0  1007K  0 part 
├─sdb2                         8:18   0     1G  0 part /boot/efi
└─sdb3                         8:19   0 446.1G  0 part 
  ├─pve-swap                 252:0    0     8G  0 lvm  [SWAP]
  ├─pve-root                 252:1    0    96G  0 lvm  /
  ├─pve-data_tmeta           252:2    0   3.3G  0 lvm  
  │ └─pve-data-tpool         252:4    0 319.6G  0 lvm  
  │   ├─pve-data             252:5    0 319.6G  1 lvm  
  │   ├─pve-vm--101--disk--0 252:6    0     8G  0 lvm  
  │   └─pve-vm--102--disk--0 252:7    0     4G  0 lvm  
  └─pve-data_tdata           252:3    0 319.6G  0 lvm  
    └─pve-data-tpool         252:4    0 319.6G  0 lvm  
      ├─pve-data             252:5    0 319.6G  1 lvm  
      ├─pve-vm--101--disk--0 252:6    0     8G  0 lvm  
      └─pve-vm--102--disk--0 252:7    0     4G  0 lvm  
```


- Utilidad: NFS

> https://github.com/pabloqpacin/k8s-bs/blob/main/docs/curso-parte2.md#ejemplo-con-nfs-aplicaci%C3%B3n-wordpress-con-mysql