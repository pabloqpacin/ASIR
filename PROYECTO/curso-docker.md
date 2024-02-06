# Curso

> Solo lo importante. Cheatsheets

- [Curso](#curso)
  - [NOTAS](#notas)
  - [Intro](#intro)
  - [Sección 5: Trabajar con contenedores](#sección-5-trabajar-con-contenedores)
  - [101](#101)
    - [Monitoring](#monitoring)
    - [VSCode](#vscode)
  - [~~Sección 6: Docker en Windows~~](#sección-6-docker-en-windows)
  - [Sección 7: Variables - Pasando argumentos a los contenedores](#sección-7-variables---pasando-argumentos-a-los-contenedores)
  - [Sección 8: Redes en Docker](#sección-8-redes-en-docker)
    - [Puertos](#puertos)
    - [Redes](#redes)
  - [Sección 9: Volúmenes - Almacenamiento persistente](#sección-9-volúmenes---almacenamiento-persistente)
  - [Sección 10: Imágenes](#sección-10-imágenes)
  - [Sección 11: Opciones avanzadas: hardware,](#sección-11-opciones-avanzadas-hardware)
  - [Sección 12: Configurar Docker - Contextos - Distintos entornos Docker](#sección-12-configurar-docker---contextos---distintos-entornos-docker)
  - [Sección 13: Docker Compose (V2) - Entornos complejos](#sección-13-docker-compose-v2---entornos-complejos)
    - [Volúmenes](#volúmenes)
    - [Redes](#redes-1)
    - [misc.](#misc)
  - [Sección 14: Docker Registry - Nuestros propios registros](#sección-14-docker-registry---nuestros-propios-registros)
  - [Sección 15: Docker Swarm - Cluster](#sección-15-docker-swarm---cluster)
  - [Sección 16: Intro a Kubernetes](#sección-16-intro-a-kubernetes)


## NOTAS

- usar `docker stats` para monitorizar recursos hardware
- usar `docker compose logs` && `docker compose events` para monitorizar servicios
- compose
  - [versiones y compatibilidad**](https://forums.docker.com/t/docker-compose-version-3-8-or-3-9-for-latest/102439/2)
  - In 3rd version, we can still use "restart" inside services same as before in v.2 (except for deploy into swarm) [src](https://stackoverflow.com/questions/42216017/docker-compose-restart-policy)
  - en general, cuidado con los paths absolutos o relativos (se recomiendan relativos con respecto al `compose.yaml`)
  - [Q: Quotes on docker-compose.yml ports make any difference? A: better use them to pass as strings and for compatibility](https://stackoverflow.com/questions/58810789/quotes-on-docker-compose-yml-ports-make-any-difference)

## Intro

- OCI: runtime-spec, image-spec, runC
- Alternativas a Docker: **podman** (runtime)
- Versiones de Docker:
  - *Linux*: Docker Engine
  - *Windows*: Docker Desktop

```md
- **Alternativas**: podman, buildah, skopeo... cri-o, rkg, katacontainers
```


## Sección 5: Trabajar con contenedores

## 101

- `docker run` 101

```bash
docker version
docker version --help

docker ps
docker ps --help
```

```bash
docker run --help

docker run hello-world
```

- `docker images` & `docker ps`

```bash
docker images

docker ps
docker ps -a
```

- `docker run` 102

```bash
docker pull ubuntu
docker images
docker run ubuntu
docker ps -a
```

- `docker ps`


```bash
docker ps --help

docker ps -l               # last one created
docker ps -n 4             # last four created
docker ps -a -n 3 -s       # last three amongst all, show size
docke rps -a -f "name=sql"  # filter
```

- *Run interactively*

```bash
docker run --name ubuntu2 ubuntu

docker run --name ubuntu3 -it ubuntu 000bash
  # exit

docker ps     # ubuntu3 is stopped
```

- flag `--rm`: eliminar contenedor automáticamente cuando se apague la primera vez

```bash
docker run -it -d --rm --name ubuntu1 -e V1=10 -e V2='Alberto' ubuntu
```


- `start` y `stop`

```bash
docker start -i ubuntu4
```

> mejor *detached* y conectarnos cuando tal

```bash
docker run -d nginx
docker run --name fedora4 -d -it fedora
# IMPORTANTE: trabajar en modo background, comprobar en DockerHub
```

- **Tags**: normalmente versión...

```bash
docker run --name apache2 -d httpd:alpine
```

- Borrar imágenes y contenedores

```bash
docker rm <container_ID>
docker rm <container_name>

docker rmi <image_ID>
docker rmi <image_name>
```

- `exec`: interactivos y en background

```bash
docker exec ubuntu10 uname -a
docker exec -it ubuntu10 bash
```

- `attach`

```bash
# docker run --name ubuntu1 -d -it ubuntu
# docker attach ubuntu1

docker run --name ubuntu1 -d -it ubuntu top -b

```

### Monitoring

- `logs` & `kill`

```bash
# docker run -d ubuntu sh -c "while true; do date; done"
docker logs mysql-container --tail 5
docker logs mysql-container -f

docker kill <container>    # == stop
```

- **MONITORING**: `top` & `stats`

```bash
docker top mysql-container
docker stats arch-container
```

- `inspect` == *configuración*

```bash
docker inspect mysql-container > log.log
docker inspect <image>
```

- `system` == **IMPORTANTE !!! !!! !!!**

```bash
docker system info
docker system df

docker system events
  # do docker stuff aside, monitor hereo

# poderoso pero peligroso: ELIMINA contenedores, imágenes, redes y build caché NO USADOS
docker system prune

```

- Compartir archivos entre HOST y GUEST

```bash
docker cp text.txt myarchcontainer:/tmp
docker cp mydir myarchcontainer:/tmp

docker cp myarchcontainer:/tmp/dawg /tmp
```

### VSCode

- Extensión `Docker` de Microsoft


## ~~Sección 6: Docker en Windows~~


## Sección 7: Variables - Pasando argumentos a los contenedores

- Buena práctica: nombres de las variales en MAYÚSCULAS

```bash
docker run --name ubuntu1 -d -it -e V1=10 ubuntu

print env && echo $V1

docker run --rm --name ubuntu1 apasoft/ubuntu-variable
  # Has introducido la variable 'Mi primera página HTML'

docker run --rm --name ubuntu1 -e TEXTO="Otro valor" apasoft/ubuntu-variable
  # Has introducido la variable 'Otro valor'
```

- **MariaDB**

```bash
docker pull mariadb

docke run -d --name mariadb1 mariadb
  # ERROR

docker logs

docker run -d --name mariadb1 -e MARIADB_ROOT_PASSWORD=foo mariadb

mycli -u root -p
```


```bash
docker run -d --name mariadb1 \
    -e MYSQL_ROOT_PASSWORD=changeme \
    -e MARIADB_USER='anon' \
    -e MYSQL_ROOT_HOST='%' \
    -e MARIADB_DATABASE='mydb' \
    mariadb:latest

docker exec -it mariadb1 bash
```

- `--env-file`: via *archivo* (mysql.properties)

```txt
MYSQL_ROOT_PASSWORD=changeme
MARIADB_USER='anon'
MYSQL_ROOT_HOST='%'
MARIADB_DATABASE='mydb'
```

```bash
docker run --name mysql10 -d --env-file mysql.properties mysql

docker exec -it mysql10 bash
```


## Sección 8: Redes en Docker

### Puertos

- apache

```bash
docker run --name apache1 -d -p 9000:80 httpd
docker run --name apache2 -d -p 9001:80 httpd

docker cp /tmp/myweb apache1:/usr/local/apache2

docker exec -it apache1 bash

  cd /usr/local/apache2
  cat htdocs/index.html
  rmdir htdocs
  mv myweb htdocs

xdg-open http://localhost:9000
```

- nginx

```bash
docker run --name nginx1 -d -p 8080:80 nginx
docker run --name nginx2 -d -P nginx            # puerto asignado según dispo

docker exec -it nginx2 bash

  cd /usr/share/nginx
  cat html/index.html

xdg-open http://localhost:8080
```

### Redes

- 101
  - name != *driver*
  - redes por defecto
    - **bridge**: DEFAULT, permite comunicación entre docker y la red real
    - **host**: autónomos, 1-1 con el host real (no usaremos mucho) -- mismo direccionamiento IP (`namespace`), ojo con port-mapping.... 
    - **none**: sin red -- itneresante para trabajar con volúmenes, etc...f
  - mejor `network create` y `run --network` en lugar de `run --link foo`

```bash
docker network ls
docker inspect bridge                         # 172.17.0.0/16

docker inspect <container_name> | grep IPAd   # 172.17.0.2, 172.17.0.3
docker inspect <container_name> | bat -l json # Network
```
```bash
docker image inspect <image-name> | grep -C2 ExposedPorts
```

- Crear redes
  - nota: default `bridge` usa `link` feature; en nuestras redes, se exponen TODOS los puertos...........

```bash
docker network create --help                      # -d == bridge, host, none, overlay, custom

docker network create red1  # -d bridge

nmcli con && ip a && docker inspect red1          # 172.18.0.0/16

docker network create --subnet=192.168.0.0/16 red2
```
```bash
docker run -it --rm --name ubuntu1 --network red1 ubuntu

docker network connect red2 ubuntu1

docker inspect ubuntu1              # red 1 + red 2
```

- Configurar redes

```bash
docker network create red3  # 172.19.0.0/26

docker network create --subnet=172.28.0.0/26 --gateway=172.28.0.1 --ip-range=172.28.10.0/24 red4

# Contenedores añadidos a la red: 172.28.10.0, 172.28.10.1, etc
```

- Enlazar contenedores ([BusyBox](https://hub.docker.com/_/busybox))

```bash
docker run -it --rm --name b1 busybox
docker run -it --rm --name b2 busybox

cat /etc/hosts    # 172.17.0.3
ping 172.17.0.2
ping b1           # FAIL

docker run -it --rm --name b3 --link b1:maquina1 busybox

cat /etc/hosts    # 172.17.0.4 + enlace a 0.2
ping b1           # SUCESS
```

```bash
docker run -d --name mysql_server -p 3100:3306 -e MYSQL_ROOT_PASSWORD=changeme --network red1 mysql
docker run -d --name mysql_client -p 3101:3306 -e MYSQL_ROOT_PASSWORD=changeme --network red1 mysql

docker network inspect red1     # containers: mysql_server & mysql_client
docker exec -it mysql_client bash

# mysql -u root -p -h mysql_server
```

> [Wordpress](https://hub.docker.com/_/wordpress) + MySQL (¡¿tema persistencia?!)

```bash
docker run -d --name mysql_wp -p 3100:3306 \
  -e MYSQL_ROOT_PASSWORD=changeme \
  -e MYSQL_USER=wp -e MYSQL_PASSWORD=changeme \
  -e MYSQL_DATABASE=wpdb \
  --network red1 mysql

docker exec -it mysql_wp bash
# mysql -u root -pchangeme
  # show databases;
  # select user from mysql.user;


docker run -d --name wp1 -p 9000:80 \
  -e WORDPRESS_DB_HOST=mysql_wp \
  -e WORDPRESS_DB_NAME=wpdb \
  -e WORDPRESS_DB_USER=wp \
  -e WORDPRESS_DB_PASSWORD=changeme \
  --network red1 wordpress

docker logs wp1


xdg-open http://localhost:9000
```

- Borrar networks

```bash
docker stop foo
docker network rm red1
```


## Sección 9: Volúmenes - Almacenamiento persistente

- Tipos
  - **volume**:
    - `/var/lib/docker/volumes/` -- gestionado por docker
    - ventajas: fáciles de administrar, migrables, se pueden compartir
  - **bind mount**: 'puede asociarse a cualquier directorio'
  - **tmpfs mount**: ...


```bash
# Manipular volumen en contenedor
docker run -it -v /datos --name ubuntu1 ubuntu bash
  # ls datos
  # touch /datos/f1.txt
  # # ls /datos/f2.txt
``
# Manipular volumen en host
sudo ls /var/lib/docker/<hash>/f1.txt
sudo touch /var/lib/docker/<hash>/f1.txt
```

```bash
docker volume ls
docker volume inspect <vol-name>

docker volume create vol1
docker run -it --name arch1 -v vol1:/dir1 archlinux bash
  # cd dir1 && touch f1.txt

sudo ls /var/lib/docker/vol1/f1.txt

docker volume inspect vol1
docker inspect arch1 | grep -C3 "vol1"

docker run -it --name arch2 -v vol1:/dir2 archlinux bash

docker run -it --name arch3 --volumes-from arch1 archlinux bash
```

```bash
cd /var/lib/docker/volumes

docker run -it -v /datos --name ubuntu4 ubuntu bash
  # cd datos

# Necesario borrar contenedores para borrar volumenes correspondientes

docker volume prune
```


## Sección 10: Imágenes

> - [ ] https://docs.docker.com/build/buildkit/

- Intro

```md
Imágenes tienen varias capas de *solo lectura*:
- rootfs : sistema de ficheros de root
- bootfs : sistema de ficheros de arranque
- n capas de imagen (...)
- contenedor: *Thin W/R*
```

- Modificar imagen vanilla

```bash
docker run -it --name ubuntu1 ubuntu bash
  # apt-get update && apt-get install wget

docker diff ubuntu1
```

- Crear imagen manualmente: `commit`

```bash
docker commit ubuntu1 mi_ubuntu
docker images | grep 'mi_ubuntu'
docker run -it mi_ubuntu bash
```
- Imágenes...

```bash
docker image ls
docker image inspect ubuntu | grep 'sha'    # cada capa...

docker image ls         # size...
docker ps -s            # size...

ls /var/lib/docker/image/overlay2
```

- Dockerfile ([instructions](https://docs.docker.com/engine/reference/builder/))

<!-- FROM scratch -->

```yaml
Dockerhub: <image>: supported Tags & Dockerfile
```
```bash
mkdir /tmp/imagen_python && cd $_
nvim Dockerfile
```
```dockerfile
FROM ubuntu
RUN apt-get update
RUN apt-get install python3 -y
RUN echo '1.0' >> /etc/version && apt-get install git -y && \
    apt-get install iputils-ping -y
# CMD echo supdawg
# CMD ["echo", "supdawg"]
# CMD /bin/bash
CMD ["/bin/bash"]
# ENTRYPOINT  ["df"]
# ENTRYPOINT  ["/bin/bash"]

# do docker run without any command (bash, zsh) to have echo supdawg work
```
```bash
# docker build -t imagen_python /tmp/imagen_python
docker build -t imagen_python:v1 .

docker image history imagen_python
``` 
- `entrypoint` + `cmd`

```dockerfile
FROM ubuntu
RUN apt-get update
RUN apt-get install python3 -y
RUN echo '2.0' >> /etc/version && apt-get install git -y && \
    apt-get install iputils-ping -y
  # RUN mkdir /datos
# WORKDIR /datos
# RUN touch f1.txt
ENTRYPOINT  ["ping","-c","3"]
CMD ["localhost"]
```
```bash
docker build -t image:v2 .
docker run -it --rm image:v2            # ping localhost
docker run -it --rm image:v2 nmap.org   # ping wikipedia.org

# Sobreescribir ENTRYPOINT
docker run -it --rm --entrypoint date image:v2
```

- `copy` ~~+ `add`~~

"In most cases, if you don't need the additional features provided by `ADD` (like URL downloads or automatic tar extraction), it's recommended to use `COPY` for clarity and simplicity."



```dockerfile
FROM ubuntu
WORKDIR /app
COPY web .
ENTRYPOINT ["/bin/bash"]
```

- variables de entorno `ENV`

```dockerfile
ENV dir=/data dir1=/data1
RUN mkdir $dir && mkdir $dir1
```

```dockerfile
ENV TEXTO="foo "
CMD echo $TEXTO
```
```bash
docker run -e TEXTO="bar"
```

- scripts...

```bash
#/bin/bash

for ((i=3; i>=1; i--)) do
  echo $i
done
echo "BOOM"
```

```dockerfile
FROM ubuntu
WORKDIR /root
COPY boom.sh .
RUN chmod +x boom.sh
CMD ["/root/boom.sh"]
```

- `ARG` (**build** variables) -- tema argumentos en el `docker build`...

```dockerfile
ARG VERSION=latest
FROM ubuntu:$VERSION
```

```dockerfile
FROM ubuntu
ARG new_user='pabloqpacin'
RUN adduser $user_docker
```

- `EXPOSE` -- pero hace falta `run -p`

```bash
#!/bin/bash
apachectl start
```
```dockerfile
FROM ubuntu
RUN apt-get install apache2 -y
EXPOSE 80
ENV ServerName='myserver'
ADD entrypoint.sh /datos1
CMD /datos1/entrypoint.sh
```
```bash
docker build -t image:v2 .
docker run -it --rm -p 8080:80 image:v2 
```

- [ ] `VOLUME` -- ...

> [Named Volumes in Dockerfile #30647](https://github.com/moby/moby/issues/30647)

```dockerfile
FROM ubuntu
# MAINTAINER ...
# LABEL creador="Apasoft"
RUN apt-get update
RUN apt-get install -y nginx
VOLUME /var/www/html/
COPY web /var/www/html/
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
EXPOSE 80
```

- **DOCKERHUB**

```bash
docker build -t hubusername/ourimage:v1

docker login

# docker commit ...
# docker tag ...

# docker save ...
# docker load ...

docker push hubusername/ourimage:v1
```
```bash
docker search apasoft
docker search redis --filter is-official=true
```

## Sección 11: Opciones avanzadas: [hardware](https://docs.docker.com/config/containers/resource_constraints/), 

- Memoria

```bash
docker run --name apache1 -d -p 9090:80 httpd
docker ps && docker stats

docker run --name apache2 -d -m 256m --memory-swap 256m -it httpd
docker exec -it apache2 bash
  apt-get update && apt-get install stress
  stress --cpu 8 --io 4 --vm 2 --vm-bytes 128M --timeout 10s
  stress -m 2 --vm-bytes 100m --vm-keep
```

- CPU (con **custom image**)

```bash
docker run --name apache1 -d -it httpd

docker exec -it apache1 bash

# apt-get update && apt-get install stress && exit

# Crear imagen a partir de un contenedor que está corriendo atm
docker commit apache1 apache-stress:latest
```
> TODO: imagen desde Dockerfile con `CMD` preparado para lanzar el stress

```bash
# Lanzar apache para cpu nº1 y con 1 unidad de trabajo (1024) aka potencia entera
docker run --name apache1 -d -it --cpu-shares=1024 --cpuset-cpus=0 apache-stress
docker run --name apache2 -d -it --cpu-shares=512 --cpuset-cpus=0 apache-stress
docker run --name apache3 -d -it --cpu-shares=512 --cpuset-cpus=0 apache-stress

docker stats

# Generar competencia por la CPU
docker exec -it apache1 bash        # 100%  - 66%   - 50% CPU
docker exec -it apache2 bash        # 0%    - 33%   - 25% CPU
docker exec -it apache3 bash        # 0%    - 0%    - 25% CPU
  # stress -c 10

docker stats
```

- drivers

```bash
# recomendado: overlay2
# avanzados: btrf & zfs

docker info | grep -A2 Driver
# cat /etc/fstab

# Cambiar driver (usando zfs)...
sudo zpool create -f zpool-docker -m /var/lib/docker /dev/sdb
```

- reboot policies

```bash
# Tener en cuenta reincios del equipo
systemctl is-enabled docker

--restart no
--restart always
--restart unless-stopped    # no arranca automáticamente con el daemon
--restart on-failure:2      # dos intentos si hay fallo (exit code != 0) -- si es 0, se queda parado

# Mirar si hay reinicios
docker inspect <name> | grep Count
```

- configuración interna de los contenedores...

```bash
cd /var/lib/docker/containers/<container_id> && ls -la

# No tocar pero conocer
for file in ./*; do less $file; done
```

- logging drivers ~~([json-file](https://docs.docker.com/config/containers/logging/json-file/), [journald](https://docs.docker.com/config/containers/logging/journald/))~~

```bash
# Consultar Logs
docker logs <name> &&
tail -f /var/lib/docker/containers/<id>/<id>-json.log

docker inspect <name> | grep Log
```


## Sección 12: Configurar Docker - Contextos - Distintos entornos Docker

- cambiar propiedades de docker desde el arranque (`dockerd` con `daemon.json`)

```bash
# sudo systemctl stop docker
# sudo dockerd

nvim /etc/docker/daemon.json
```
```json
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "5m",
    "max-file": "3",
  }
}
```
```bash
sudo systemctl restart docker
docker inspect <name> | grep LogConfig
```

- multiple daemons...

```bash
# docker network create red2
# nmcli con
```
```bash
#!/bin/bash

dockerd \
  -H unix:///var/run/docker-desa.sock \
  -p /var/run/docker-desa.pid \
  --iptables=false \
  --ip-masq=false \
  --bridge=none \
  # --bridge=red2 \
  --date-root=/var/lib/docker-desa \
  --exec-root=/var/lib/docker-desa
```
```bash
./crear_docker.sh

cd /var/lib/docker-desa
ps -ef | grep dockerd   # el estándar + el custom

# CONECTAR A ESE OTRO DAEMON CON NUESTRO CLIENTE MEDIANTE contextos
```

- **contextos** (para conectarnos a servidores docker remotos)

```bash
docker context ls
# NAME                TYPE                DESCRIPTION                               DOCKER ENDPOINT                                        KUBERNETES ENDPOINT   ORCHESTRATOR
# default *           moby                Current DOCKER_HOST based configuration   unix:///var/run/docker.sock
# desktop-linux       moby                Docker Desktop                            unix:///home/pabloqpacin/.docker/desktop/docker.sock

docker context create docker-desa --docker host=unix:///var/run/docker-desa.sock    # COULD BE HTTP ENDPOINT THO

docker context use docker-desa

docker info | grep 'Docker Root Dir'
docker context inspect docker-desa
```´
```bash
# Cliente Arch -> Servidor PopOS

ssh-keygen
ssh-copy-id pabloqpacin@192.168.1.41
  # ssh copy-id -p 22 192.168.1.41 

docker context ls
docker context create docker-remote --docker host=ssh://pabloqpacin@192.168.1.41
docker context ls
docker context use docker-remote
```


## Sección 13: Docker Compose (V2) - Entornos complejos

<!-- - Instalación -->

- `docker-compose.yaml` DEMO ([mejor *compose.yaml*](https://docs.docker.com/compose/compose-application-model/))
  - el nombre del directorio (PROYECTO) raíz es importante...
  - `image` O `build` (**ojo**)
  - [Reference: V3 specification](https://docs.docker.com/compose/compose-file/compose-file-v3/)

```yaml
version: '3.9'

services:

  wordpress:
    image: wordpress
    restart: always
    ports:
      - 8080:80
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: exampleuser
      WORDPRESS_DB_PASSWORD: examplepass
      WORDPRESS_DB_NAME: exampledb
    volumes:
      - wordpress:/var/www/html

  db:
    image: mysql:5.7
    restart: unless-stopped
    environment:
      MYSQL_DATABASE: exampledb
      MYSQL_USER: exampleuser
      MYSQL_PASSWORD: examplepass
      MYSQL_RANDOM_ROOT_PASSWORD: '1'
    volumes:
      - db:/var/lib/mysql

volumes:
  wordpress:
  db:
```

- Proyecto 101 -- Nginx

```bash
mkdir /tmp/pr_nginx && cd $_
nvim docker-compose.yaml
```

```yaml
version: '3'
services:
  nginx:
    image: nginx
    ports:
    - "80:80"
```
```bash
docker-compose up

curl localhost
docker compose ps
docker network ls
docker network inspect pr_nginx_default

# docker compose stop
```

- Proyecto 102 -- Apache & Python yikes

```bash
mkdir /tmp/pr_apache && cd $_
nvim docker-compose.yaml
```
```yaml
version: '3.9'

services:

  apache:
    image: httpd
    ports:
      - "80:80"

  python:
    image: python
```
```bash
docker compose up
# PROBLEMA CON PYTHON: RESULTADO ESPERADO POR EL TUTOR

docker compose ps -a
docker network ls | grep "pr_apache_default"
```

- Para y eliminar Compose -- Apache & Tomcat

```bash
docker compose --help

mkdir -p ~/composes/pr_tomcat && cd $_
nvim docker-compose.yaml
```
```yaml
version: '3.9'

services:

  svc-apache:
    image: httpd
    ports:
      - "80:80"

  svc-tomcat:
    image: tomcat
    ports:
      - "8080:8080"
```
```bash
docker compose up
  # Deberíamos arrancarlo tipo background

docker compose stop
docker compose start

docker compose down   # eliminar red & contenedores
```

- `logs`, `images`, `top`, `events`, `pause`...

```bash
cd ~/composes/pr_tomcat
docker compose up -d

docker compose ps

docker compose ls
docker compose images

docker compose logs <service>
docker compose top <service>
```
```bash
docker compose events
  docker compose stop svc-tomcat
  docker compose start svc-tomcat

docker compose pause svc-tomcat
  docker compose ps

docker compose unpause svc-tomcat
```
```bash
docker compose stop svc-apache
docker compose rm svc-apache

docker compose restart || \
  docker compose up svc-apache -d
```

- `build` -- Ubuntu

```bash
mkdir ~/composes/web-nginx && cd $_
cp ~/web ~/composes/web-nginx/
nvim Dockerfile
```

```Dockerfile
FROM ubuntu
RUN apt-get update
RUN apt-get install -y nginx
COPY web /var/www/html/
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
EXPOSE 80
```
```bash
nvim compose.yaml
```
```yaml
version: '3.9'
services:
  web:
    build: .
    image: trainingdock/web:v1
    container_name: web_frontal
    ports:
    - "80:80"
```
```bash
docker compose up -d
  # build image

docker image ls

docker compose down
docker compose up -d
  # no build image: ya existe
```

- `ENV` -- Mysql

```bash
mkdir ~/compose/mysql && cd $_
nvim compose.yaml
```
```yaml
version: '3.9'
services:
  database:
    image: mysql
    restart: always
    environment:
      MYSQL_DATABASE: db1
      MYSQL_USER: usu
      MYSQL_PASSWORD: lepanto
      MYSQL_PASSWORD: lepanto
    # ports:
    #   - "3306:3306"
```
```bash
docker compose up -d
docker compose ps

docker compose exec $(docker compose ps --format '{{.Service}}') bash || \
  docker compose exec database bash
  
  mysql -u usu -plepanto -D db1

# # Connect from host
# mycli -u usu -plepanto -D db1
```

- `ENV_FILE` -- Mysql

```bash
cd ~/compose/mysql
nvim mysql.properties
```
```bash
MYSQL_DATABASE=db1
MYSQL_USER=usu
MYSQL_PASSWORD=lepanto
MYSQL_ROOT_PASSWORD=lepanto
```
```bash
nvim compose.yaml
```
```yaml
version: '3.9'
services:
  database:
    image: mysql
    restart: always
    env_file: mysql.properties
```

### Volúmenes

- `depends_on` & *named volumes* -- **Wordpress**
  - tipos de volúmenes: normales <u>creados por docker</u> que pueden ser <u>named</u> || bind mounts || tmpfs/npipes

```bash
docker volume prune &&
docker volume ls

mkdir ~/compose/wordpress && cd $_
nvim compose.yaml
```
```yaml
version: '3.9'
services:
  
  wordpress:
    image: wordpress
    restart: always
    ports:
      - "9000:80"
    environment:
      WORDPRESS_DB_HOST: db-wp
      WORDPRESS_DB_USER: wp-user
      WORDPRESS_DB_PASSWORD: lepanto
      WORDPRESS_DB_NAME: wp-db
    depends_on:
      - db-wp
    volumes:
      - wp:/var/www/html
      # - /var/www/html
        # No hay mapping con respecto al host, se crearán volúmenes sin nombre

  db-wp:
    image: mysql
    restart: always
    environment:
      MYSQL_DATABASE: wp-db
      MYSQL_USER: wp-user
      MYSQL_PASSWORD: lepanto
      MYSQL_ROOT_PASSWORD: lepanto
    volumes:
      - db:/var/lib/mysql

volumes:
  wp:
  db:
```
```bash
docker compose up -d

docker volume ls

for container in $(docker compose ps --format '{{.Names}}'); do
  docker inspect $container | grep -A5 Mounts
done

sudo su
cd var/lib/docker && lf volumes
```


- *bind mounts* -- Wordpress

```yaml
version: '3.9'
services:
  
  wordpress:
    image: wordpress
    restart: always
    ports:
      - "9000:80"
    environment:
      WORDPRESS_DB_HOST: db-wp
      WORDPRESS_DB_USER: wp-user
      WORDPRESS_DB_PASSWORD: lepanto
      WORDPRESS_DB_NAME: wp-db
    depends_on:
      - db-wp
    volumes:
      - /root/datos/wp:/var/www/html
      # - wp:/var/www/html

  db-wp:
    image: mysql
    restart: always
    environment:
      MYSQL_DATABASE: wp-db
      MYSQL_USER: wp-user
      MYSQL_PASSWORD: lepanto
      MYSQL_ROOT_PASSWORD: lepanto
    volumes:
      - db:/var/lib/mysql

volumes:
  # wp:
  db:
```
```bash
docker volume ls

sudo ls /root/datos/wp

docker inspect wordpress-db-wp-1 | grep -A10 Mount
docker inspect wordpress-wordpress-1 | grep -A10 Mount

docker volume prune || \
for volume in $(docker volume ls --format '{{.Name}}'); do
    docker volume rm $volume
done

sudo rm -rf /root/datos/wp
```

### Redes

- redes
  - `networks: - foo - bar`: puede haber varias -> indicar como array

```bash
mkdir /tmp/redes && cd $_
nvim compose.yaml
```
```yaml
version: '3.9'

services:

  svc-apache:
    image: httpd
    networks:
     - frontal
    ports:
      - "80:80"
  
  svc-tomact:
    image: tomcat
    networks:
     - frontal
    #  - middleware
    ports:
      - 8080:8080

networks:
  frontal:
    # driver: bridge
  # middleware:

# In Docker Compose files, when defining networks, the colon (:) is used to specify the driver to use for the network. The driver determines how the containers within that network can communicate.
# Here, you have defined a network named frontal using the networks section at the end of the file. The colon after frontal specifies that this network uses the default network driver.
# If you wanted to use a specific driver, you would provide it after the colon. For example, if you wanted to use the bridge driver, you could write it as:
```
```bash
docker compose up -d

docker network ls

docker network inspect redes_frontal | grep -A15 Containers
```

- network aliases...
  - FOR SOME REASON VOLUMES MESS WITH IT

```yaml
version: '3.9'
services:
  
  wordpress:
    image: wordpress
    restart: always
    ports:
      - "9000:80"
    environment:
      # WORDPRESS_DB_HOST: db-wp
      WORDPRESS_DB_HOST: db-host
      WORDPRESS_DB_USER: wp-user
      WORDPRESS_DB_PASSWORD: lepanto
      WORDPRESS_DB_NAME: wp-db
    depends_on:
      - db-wp
    networks:
      - wp-network

  db-wp:
    image: mysql
    restart: always
    environment:
      MYSQL_DATABASE: wp-db
      MYSQL_USER: wp-user
      MYSQL_PASSWORD: lepanto
      MYSQL_ROOT_PASSWORD: lepanto
    networks:
      wp-network:
        aliases:
          - db-host   # alias para el servicio (ie. db-wp)

networks:
  wp-network:
```

### misc.

- proyectos

```bash
docker compose -p proyecto1 up -d

docker compose -p proyecto1 ps
  # docker compose ps           # falla: busca según $PWD y no según -p

# cd && docker compose -p proyecto1 -f /path/to/compose.yaml ps

docker compose -p proyecto1 down
```

- perfiles: lanzar determinados servicios dependiendo de si tengo o no activado un perfil
  - eg. compose que arranca unos servicios u otros según perfil desarrollo, pre. o prod.
  - en nuestro ejemplo, es interesante que no usemos el **nombre del servicio** sino el **alias en la red**
  - ojo: si no hay `profiles`, entra a todo

```yaml
# mysql.properties
MYSQL_DATABASE: wp-db
MYSQL_USER: wp-user
MYSQL_PASSWORD: lepanto
MYSQL_ROOT_PASSWORD: lepanto
```
```yaml
# wordpress.properties
WORDPRESS_DB_HOST: db-host              # alias, otherwise 'db-wp'
WORDPRESS_DB_USER: wp-user
WORDPRESS_DB_PASSWORD: lepanto
WORDPRESS_DB_NAME: wp-db
```
```yaml
version: '3.9'
services:
  wordpress:
    image: wordpress
    container_name: wordpress         # new
    restart: always
    ports:
      - "9090:80"
    env_file: wordpress.properties
    # depends_on:
    #   - db-wp
    networks:
      - wp-network
    profiles:                         # ojo
      - desarrollo                    # ojo
      - produccion                    # ojo

# BBDD DESARROLLO
  db-wp:
    image: mysql
    container_name: desarrollo-bd   # new
    restart: always
    env_file: mysql.properties
    networks:
      wp-network:
        aliases:
          - db-host
    profiles:                       # ojo
      - desarrollo                  # ojo

# BBDD PRODUCCION
  db-wp-prod:
    image: mysql
    container_name: produccion-bd   # new
    restart: always
    env_file: mysql.properties
    networks:
      wp-network:
        aliases:
          - db-host
    profiles:                       # ojo
      - produccion                  # ojo

networks:
  wp-network:
```
```bash
docker compose --profile desarrollo up -d
docker compose --profile desarrollo down

docker compose --profile produccion up -d
docker compose --profile produccion down
```

- lanzar comandos al arrancar los servicios (según perfil...)

```bash
mkdir comando cd $_
nvim Dockerfile
```
```dockerfile
FROM ubuntu
RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y apache2

# Lanzador nginx
COPY nginx.sh /usr/local/bin
RUN chmod +x /usr/local/bin/nginx.sh

# Lanzador apache
COPY apache.sh /usr/local/bin
RUN chmod +x /usr/local/bin/apache.sh

CMD ["echo", "supdawg"]
EXPOSE 80
```
```bash
nvim apache.sh && nvim nginx.sh && nvim compose.yaml
```
```bash
#!/bin/sh
echo "Soy Apache" > /var/www/html/index.html
apachectl -D FOREGROUND
```
```bash
#!/bin/sh
echo "Soy Nginx" > /var/www/html/index.html
nginx -g "daemon off;"
```
```yaml
version: '3.9'
services:
  web-apache:
    build: .
    image: comando:latest
    container_name: apache
    ports:
      - "8080:80"
    command: ["/usr/local/bin/apache.sh"]
    profiles:
      - apache
  web-nginx:
    build: .
    image: comando:latest
    container_name: nginx
    ports:
      - "8090:80"
    command: ["/usr/local/bin/nginx.sh"]
    profiles:
      - nginx
```
```bash
# docker compose build web-apache   # ...
# docker compose build web-nginx    # ...

docker compose --profile apache up -d
docker compose --profile nginx up -d

docker inspect comando_default

docker compose --profile apache down &&
docker compose --profile nginx down
```

- configurar memoria & cpu -- `stress`

> ...


- `restart` policies

```yaml
services:
  contenedor1:
    image: img-reboot
    restart: "no"
  contenedor2:
    image: img-reboot
    restart: on-failure:2
  contenedor3:
    image: img-reboot
    restart: unless-stopped   # systemctl stop docker
  contenedor4:
    image: img-reboot
    restart: always
```
<!-- ```bash
mkdir Workspace/rebotes && cd $_
nvim parar.sh && nvim Dockerfile
```
```bash
#!/bin/bash
sleep 15
exit 1
# exit 0
```
```Dockerfile
# ...
``` -->
```bash
watch docker ps -a
```


## Sección 14: Docker Registry - Nuestros propios registros

> ...

---
## Sección 15: Docker Swarm - Cluster
## Sección 16: Intro a Kubernetes


