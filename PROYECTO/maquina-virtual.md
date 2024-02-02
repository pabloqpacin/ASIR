# Máquina Virtual para Desarrollo

- [Máquina Virtual para Desarrollo](#máquina-virtual-para-desarrollo)
  - [1. Descargar ISO](#1-descargar-iso)
  - [2. Configurar Máquina Virtual (VM) en VirtualBox](#2-configurar-máquina-virtual-vm-en-virtualbox)
  - [3. Instalación de Pop!\_OS](#3-instalación-de-pop_os)
  - [4. Configuración inicial del sistema](#4-configuración-inicial-del-sistema)
  - [5. Instalación de Docker y primeros contenedores](#5-instalación-de-docker-y-primeros-contenedores)
    - [mysql](#mysql)
    - [ubuntu](#ubuntu)
    - [apache](#apache)
    - [nginx](#nginx)
    - [archlinux](#archlinux)
    - [Docker pa rato](#docker-pa-rato)


## 1. Descargar ISO

- Descargar ISO del sistema operativo [Pop!_OS](https://pop.system76.com/) basado en Ubuntu (da igual ISO normal o NVIDIA ya que solo incluye drivers extra y debería dar igual en una VM)

## 2. Configurar Máquina Virtual (VM) en VirtualBox

- Crear VM en VirtualBox con los parámetros adecuados según la especificaciones del host

```md
Hardware:
    - Base Memory:
        Recomendado: 4096 MB
             Mínimo: 2048 MB
    - Processors: 
        Recomendado: 4
             Mínimo: 2
    - Virtual Hard Disk:
        Recomendado: 50 GB
             Mínimo: 20 GB
Settings:
    - Network: Bridged
    - Shared Clipboard: Bidirectional
    - Display: Video Memory: max
    # - Enable EFI: yes
```

## 3. Instalación de Pop!_OS

- Como es una VM, no nos complicamos:
  - usamos todo el disco virtual, sin cifrado.
  - establecemos contraseña `changeme` o cualquiera fácil de recordar
- Reiniciar la VM al terminar la instalación.


## 4. Configuración inicial del sistema

- Actualizar el sistema

```bash
# Hacer los mensajes de APT más verbose
echo 'APT::Get::Show-Versions "true";' | sudo tee /etc/apt/apt.conf.d/99show-versions

# Actualizar el sistema
sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get autoremove -y && \
    sudo apt-get autoclean -y

# Consultar neofetch
sudo apt-get install neofetch --no-install-recommends && neofetch
```

- Aplicar **VirtualBox Guest Additions** y tomar **snapshot** de la VM

```md
En VirtualBox: Devices -> Insert CD
En VM: cd /media/$USER/... -> sudo ./autorun.sh
APAGAR VM
**TOMAR SNAPSHOT**
```

- Configurar entorno de trabajo

```bash
# Instalar paquetes básicos
sudo apt-get install \
    code git grc mycli nmap openssh-server tldr tmux zsh

# Cambiar bash por zsh (con la configuración de https://ohmyz.sh) -- se recomienda instalar zsh-syntax-highlight & zsh-autosuggestions)
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Crea un par de aliases
echo "alias docker='grc docker'" >> $HOME/.zshrc
echo "alias nmap='grc nmap'" >> $HOME/.zshrc
echo "alias ip='ip -c'" >> $HOME/.zshrc

# Iniciar tldr (MAN majete)
tldr --update &&
    tldr tldr

# Instalar anydesk
flatpak update -y &&
    flatpak install anydesk
```
```bash
# Instalar neovim
sudo apt-get update &&
    sudo apt-get install build-essential cmake gettext ninja-build unzip
git clone --depth 1 https://github.com/neovim/neovim /tmp/neovim && \
    cd /tmp/neovim && make CMAKE_BUILD_TYPE=Release && \
    sudo make install

# Configurar neovim
# ...
```

## 5. Instalación de Docker y primeros contenedores

- Instalamos **Docker Engine** siguiendo la [documentación](https://docs.docker.com/engine/install/ubuntu/) para Ubuntu

```bash
# 1. Set up Docker's apt repository.

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# 2. Install the Docker packages.
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
```bash
# Activar el servicio docker desde el arranque del sistema
sudo systemctl enable --now docker

# Incluir nuestro usuario en el grupo `docker`
sudo usermod -aG docker $USER   # && newgrp docker
```

### mysql

- Levantar contenedor `mysql` siguiendo info de [DockerHub](https://hub.docker.com/_/mysql)

```bash


# Contenedor nº1: versión breve
docker run -d --name mysql1 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=changeme -e MYSQL_ROOT_HOST='%' mysql

# Contenedor nº2: versión verbose
docker run --env MYSQL_ROOT_PASSWORD=changeme --env MYSQL_ROOT_HOST='%' \
    --detach --publish 3307:3306 --name mysql2 mysql
```

- Manejar, apagar y encender contenedores

```bash
# Listar contenedores
docker ps -a

# Apagar contenedor
docker stop mysql1 mysql2

# Encender contenedor
docker start mysql1 mysql2
```

- Conectarnos al contenedor

```bash
# Conectarse a localhost:3306 por defecto
mycli -u root -pchangeme

# Conectarse al servidor/contenedor que escucha en un puerto determinado
mycli -u localhost -P 3307 -u root -pchangeme
```

### ubuntu

```bash
docker run -it --name ubuntu1 ubuntu
# apt-get update && apt-get install neofetch --no-install-recommends && neofetch
```

### apache

```bash
docker run -d --name apache1 -p 9000:80 httpd
xdg-open http://localhost:9000
```

### nginx

```bash
docker run -d --name nginx1 -p 8080:80 nginx
xdg-open http://localhost:8080
```

### archlinux

```bash
docker run -it --name arch1 archlinux
# pacman-key --init
# pacman-key --populate archlinux
# pacman -Syu neofetch && neofetch
```

### Docker pa rato

```bash
# Escanear puertos & servicios con NMAP
nmap -sV -p- localhost

# Listar imágenes en local
docker image ls

# Investigar movidas
docker inspect <name>

# Encontrar ayuda
docker <comando> --help

# Eliminar movidas
docker rm <name>
```