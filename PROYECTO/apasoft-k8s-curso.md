# Curso [Kubernetes al completo](https://www.udemy.com/course/kubernetes-al-completo/)

> Solo lo importante. Cheatsheets

<details>
<summary>Table of Contents</summary>


- [Curso Kubernetes al completo](#curso-kubernetes-al-completo)
  - [NOTAS](#notas)
  - [1. Introducción](#1-introducción)
  - [2. Kubectl: trabajar con clusters](#2-kubectl-trabajar-con-clusters)
  - [3. Minikube: trabajar en local](#3-minikube-trabajar-en-local)
  - [4. Docker Desktop: trabajar en local](#4-docker-desktop-trabajar-en-local)
  - [5. VSCode](#5-vscode)
  - [6. PODS](#6-pods)
    - [PODs con Manifest](#pods-con-manifest)
    - [reboot policy](#reboot-policy)
  - [7. LABELS, Selectors, Anotaciones -- Etiquetar objetos](#7-labels-selectors-anotaciones----etiquetar-objetos)
  - [8. Deployments](#8-deployments)
  - [9. Servicios](#9-servicios)
  - [10. Ejemplo Aplicación PHP-REDIS con Servicios (!)](#10-ejemplo-aplicación-php-redis-con-servicios-)
  - [11. Namespaces -- agrupar objetos](#11-namespaces----agrupar-objetos)
  - [12. Rolling Updates](#12-rolling-updates)
  - [13. Variables, ConfigMaps y Secrets](#13-variables-configmaps-y-secrets)
      - [Secrets ](#secrets-)
  - [14. Kubeconfig: configuración del cluster](#14-kubeconfig-configuración-del-cluster)
  - [15. Crear un cluster real con Kubeadm con VMs (!)](#15-crear-un-cluster-real-con-kubeadm-con-vms-)
  - [16. Scheduler -- Asignar Pods a Nodos](#16-scheduler----asignar-pods-a-nodos)
  - [17. Asignación de recursos y Autoescalado](#17-asignación-de-recursos-y-autoescalado)
  - [18. Almacenamiento en Kubernetes](#18-almacenamiento-en-kubernetes)
  - [19. Storage Class -- almacenamiento dinámico](#19-storage-class----almacenamiento-dinámico)
  - [20. Otros Worklokind: Podads -- más allá de los Deployments](#20-otros-worklokind-podads----más-allá-de-los-deployments)
  - [21. Sondas -- PODS monitoring](#21-sondas----pods-monitoring)
  - [22. RBAC -- Seguridad en clusters](#22-rbac----seguridad-en-clusters)
  - [23. Ingress -- conectar servicios al exterior](#23-ingress----conectar-servicios-al-exterior)
  - [24. Amazon EKS. Amazon Elastic Kubernetes](#24-amazon-eks-amazon-elastic-kubernetes)
  - [25. Azure AKS. Azure Kubernetes Services](#25-azure-aks-azure-kubernetes-services)
  - [26. Próximas secciones](#26-próximas-secciones)
  - [27. Cierre y despedida](#27-cierre-y-despedida)


</details>

Destacan las secciones: <!--10,--> 12, 15,

## NOTAS

- sudo apt-get install [golang-k8s-utils-dev](https://packages.debian.org/unstable/golang/golang-k8s-utils-dev)
- [Access Services Running on Clusters](https://kubernetes.io/docs/tasks/access-application-cluster/access-cluster-services/)
  - [Use an HTTP Proxy to Access the Kubernetes API](https://kubernetes.io/docs/tasks/extend-kubernetes/http-proxy-access-api/)
  - [How to use minikube with a VPN or HTTP/HTTPS Proxy](https://minikube.sigs.k8s.io/docs/handbook/vpn_and_proxy/)
- [minikube start --static-ip](https://minikube.sigs.k8s.io/docs/tutorials/static_ip/)
- `kubectl get pod foo -o yaml`
  - **KUBERNETES QUIERE QUE EL `STATUS` COINCIDA CON LA `SPEC`**
- [minikube LAN access...](https://stackoverflow.com/questions/66873437/access-minikube-cluster-on-the-same-network)
- LOG stuff: `kubectl get events -n <ns> -w` <!-- kubectl get events --field-selector reason="Failed" -w -->
- Check rollout: `kcaf <foo.yaml> && kubectl rollout status deploy <deploy> -w`
- para pods con OS, meterles `command: [ "/bin/sh", "-c", "sleep 1000000" ]` para que no 'se apaguen'
- secrets
  - https://www.reddit.com/r/kubernetes/comments/17px983/if_secrets_are_encoded_in_base64_format_why_to/

---

- [Google's Artifact Registry](https://cloud.google.com/artifact-registry/docs?hl=es-419)


## 1. Introducción

- Intro a Kubernetes

```md
- **Definición**: k8s container orchestrator (2015 - CNCF)
- **Características**: alta disponibilidad, tolerante a fallos, permite escalar cuando se quda corto, trabaja de forma eficiente, se pueden realizar cambios y operaciones en caliente, etc.
- **Alternativas**: DockerSwarm, MesosMarathon, Nomad, Shipyard ~~Podman?~~
```

- Estándares para los contenedores

```md
> [OCI](https://opencontainers.org/)
<!-- contenedores independientes del hardware y sistema -->

- **OCI Runtime Filesystem Bundle**
  1. image-spec: cómo deben ser las imágenes
    - Sistema y Archivos: contenido en forma de capas que se van agregando para construir la imagen final
    - Archivo de configuración: info eg. tiempo de ejecución, variables de entorno, parámetros...
    - Archivo de tipo `manifest`
    - Archivo de índice
  2. runtime-spec: cómo ejecutar los contenedores
    - Estados: creación, ejecución, borrado

- **OCI runC**: Runtime Container universal ligero
    - Diseñado por Docker y utilizado por `containerd` para generar y ejecutar contenedores (Docker Engine > Containerd > runc1 runc2 runc3)

> [CNCF](https://www.cncf.io/projects/)
```

- Arquitectura

```md
- Componentes
    0. **Clientes**
        - mandan POST YAML (llamadas HTTP tipo REST) indicando estado de despliegue deseado
        - ... que recibirá el API-SERVER del Maestro
    1. **Maestro (Control Plane)** (múltiples)
        - API-SERVER recibe la info
        - CONTROLLER MANAGER: múltiples componentes (como daemons) que gestionan las características del cluster
            - *Node Controller*: estado de vida de los nodos, qué hacer si se caen...
            - *Replication Controller*: conseguir que las copias estén correctas y activas...
            - *Endpoints Controller*: ligar servicios (despliegue apps) con pods
            - *Service Account & Token Controllers*: acceso y autenticación al entorno
        - SCHEDULER: determina dónde mandar lo que se pide (dónde [nodo] colocar pods dentro del cluster...)
        - Base de datos ETCD (almácen clave-valor || key-value pairs store)
        - CLOUD Controller Manager (opt.): intérprete entre K8S y el proveedor de servicios Cloud
    0. **Kubernetes DNS**
        - DNS Interno que todos los nodos conocen (hard-coded...); localizar servicios
    2. **Nodos (Data Plane)** (múltiples -- esclavos)
        - CONTAINER RUNTIME: eg. Docker, Containerd, CRIO, Kubernetes CRI; despliega pods (no contenedores)
            - PODs: objeto más pequeño en K8S; se constituye por uno o más contenedores (si varios conforman una unidad de trabajo)
        - KUBELET: se comunica con el Maestro, corasón K8S en POD
        - KUBE-PROXY: permite conectividad de todos los componentes dentro del nodo con el resto del cluster, que PODs accedan unos a otros, que se acceda a ellos desde el exterior
```

- Tipos de Instalación

```md
- Local o de un solo nodo -- Desarrollo, pruebas -- eg. **miniKube**, **Kind** (Docker), **K3S** (IoT), **Microk8s**, **DockerDesktop**
- Manual con herramientas como **Kubeadm**
- Automática con herrami. como **Kubespray** (playbook tipo Ansible), **Kops**
- Gestionada por proveedor [CLOUD](https://kubernetes.io/docs/setup/production-environment/turnkey-solutions/)
- Directamente sin herramientas (from scratch)
```

- Distribuciones

```md
- *Populares*: Red Hat Openshift, **Suse Rancher**, Canonical K8S, VMware Tanzu (Pivotal), Platform9 Managed K8S, Giant Swarm, Portainer, Mirantis
- *Cloud*: Amazon EKS, Azure AKS, Google GKE, IBM IKS, Oracle KS, Alibaba KS
```

## 2. Kubectl: trabajar con clusters

- Intro

```md
- **kubectl**: cliente multiplataforma
```

- [Install and Set Up kubectl on Linux](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management)


```bash
# Arch
sudo pacman -Syu kubectl
```
```bash
kubectl version --output=yaml
```
```bash
# Deb
sudo apt-get install -y apt-transport-https ca-certificates curl
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update && sudo apt-get install -y kubectl
```

<!-- ```bash
# Download the latest release with the command:
# if x86-64
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# elif ARM64
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"

# To download a specific version, replace the $(curl -L -s https://dl.k8s.io/release/stable.txt) portion of the command with the specific version.
# For example, to download version 1.29.1 on Linux x86-64, type:
curl -LO https://dl.k8s.io/release/v1.29.1/bin/linux/amd64/kubectl
# And for Linux ARM64, type:
curl -LO https://dl.k8s.io/release/v1.29.1/bin/linux/arm64/kubectl

# ...
``` -->

## 3. Minikube: trabajar en local

> [minikube]((https://minikube.sigs.k8s.io/docs/start/))

<details>

- Intro
  - Permite ejecutar un entorno/cluster Kubernetes de forma local
  - Soporta distintos tipos de Container Runtimes: rkt, containerd, CRI-O
  - Dispone de casi todas las características de sus 'hermanos mayores': DNS Dashboards ConfigMaps y Secrets etc
  - Requisitos: ...
  - Parámetro `driver` según entorno (`--driver=docker` `--driver=virtualbox` etc) [ojo VTx/AMDv (BIOS)]

> Ojo [drivers](https://minikube.sigs.k8s.io/docs/drivers/)

- Instalación

```bash
# Arch
sudo pacman -Syu minikube  # kubeadm

sudo systemctl enable --now docker
```
```bash
# Deb
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
# rm minikube_latest_amd64.deb
```

```bash
# # x86-64 Linux (Pop!_OS) - Debian package
# curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_arm64.deb
# sudo dpkg -i minikube_latest_arm64.deb

# # ARM64 Linux (Pi5) - Debian package
# curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_arm64.deb
# sudo dpkg -i minikube_latest_arm64.deb
```

```bash
minikube version

minikube start      # --driver=docker
```

- Comandos básicos y archivos de config. de `kubectl`

```bash
minikube status

minikube logs     # troubleshoot

minikube dashboard
# minikube addons enable metrics-server

minikube ssh
```
```bash
# Info de conexión a los clusters de K8S (kubectl??)
bat ~/.kube/config -l yaml
grep 'current-context' ~/.kube/config
  # wtf 192.168.49.2; ip a

# Tema de minikube
tree ~/.minikube
```

- Tema cluster: crear y cambiar config

```bash
# Listar clusters disponibles en minikube
minikube profile list

# Crear OTRO cluster
minikube start --driver=docker -p clusterDesa --nodes=2

minikube profile list

docker ps -a
```
```bash
minikube config
# minikube config set memory 4G -p minikube     # nuevo 'por defecto'
# minikube config get memory                    # solo funciona si hacemos cambios previamente (no con defaults)
less ~/.minikube/config/config.json
```
<!-- > **TROUBLESHOOT**

```bash
sudo swapoff -a
# sudo systemctl enable --now kubelet
``` -->

```bash
minikube profile || \
grep 'current-context' ~/.kube/config

minikube profile clusterDesa
minikube profile || \
grep 'current-context' ~/.kube/config

kubectl get nodes
```

- Dashboard

```bash
# Realmente se carga un contenedor que soporta la webapp
minikube dashboard
```
```yaml
# 'Carpeta donde guardar objetos'
Namespace:
  default

Crear nuevo recurso:
  - Crear desde entrada
  - Crear desde un fichero
  - Crear desde un formulario

# Recursos que se pueden crear y lanzar con K8S
Workloads: ...

# Conectarse a los objetos del cluster
Servicios: ...

Config: ...

# Admin
Cluster:
  ...
  Nodos
  Cluster Roles
```

- Cambiar **container runtime**

```md
OPCIONES
- *containerd*
- cri-o
- docker
```

```bash
minikube start --container-runtime=cri-o -p cluster2
  # Done! kubectl is now configured to use "cluster2" and "default" namespace by default
```

- Borrar cluster

```bash
minikube profile list

minikube delete -p <nombre_cluster>
```

</details>


## 4. Docker Desktop: trabajar en local

> ...


## 5. VSCode

```bash
extensions=(
'ms-azuretools.vscode-docker'
'ms-kubernetes-tools.vscode-kubernetes-tools'
)

for i in "${!extensions[@]}"; do
    codium --install-extension "${extensions[i]}"
done
```
```bash
# VSCode obtiene la info de K8S de...
bat ~/.kube/config -l yaml
```

## 6. PODS

- Intro

```md
REPASO CICLO VIDA APP CONTENERIZADA
- app > imagen-container > deploy > modo (imperativo [comandos] | declarativo [MANIFEST])    # estado deseado (manifest VS real)
- app -. deploy .-> POD (contenedores) con IP (direcciones, puertos, hostnames, sockets, memoria, volumenes) -> nodo del cluster
- STATELESS: no se debe guardar información en ellos
- Concepto de MICROSERVICIOS: recursos/servicios independientes
```
<!-- ```yaml
# MOCK MANIFEST
apiVersion: v1
kind: Pod
metadata:
  name: nginx
spec:
  containers:
  - name: nginx
    image: nginx
``` -->

- Primer POD: `run` `get` `describe` `exec` `logs`

```bash
kubectl run nginx1 --image=nginx

kubectl get pods
kubectl get -o wide
```
```bash
kubectl describe pod/nginx1
```
```bash
kubectl exec nginx1 -- ls
kubectl exec nginx1 -it -- bash
```
```bash
kubectl run apache1 --image=httpd --port=8080

kubectl logs apache1
kubectl logs -f apache1
kubectl logs apache1 --tail=30

kubectl exec nginx1 -it -- bash
  # apt-get update
  # apt-get install curl
  # curl localhost
```

- Kubectl Proxy

>  **Brave/Chrome Extension**: [JSON Formatter](https://chromewebstore.google.com/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa)

```bash
kubectl proxy

curl localhost:8001 | jq
curl localhost:8001/version | jq
curl localhost:8001/healthz | jq

curl localhost:8001/api/v1/namespaces/default/pods/nginx1/proxy
  # Forma natural de EXPONER serían los SERVICIOS
```
```bash
# OJARDO

# https://stackoverflow.com/questions/47173463/how-to-access-local-kubernetes-minikube-dashboard-remotely
kubectl proxy --address='0.0.0.0' --disable-filter=true
# curl http://192.168.1.40:8001/api/v1/namespaces/kube-system/services/http:kubernetes-dashboard:/proxy/
```

- Probar el POD con un Servicio

```bash
kubectl get pods -o wide
kubectl expose pod nginx1 --port=80 --name=nginx1-svc --type=LoadBalancer

SERVICE_IP=$(kubectl get svc | grep -Eo '\b3[0-9]{4}\b')

curl $(minikube ip):$SERVICE_IP

# https://minikube.sigs.k8s.io/docs/handbook/accessing/
curl $(minikube service nginx1-svc --url)
```

- Acceso mediante port-forwarding

> [Use Port Forwarding to Access Applications in a Cluster](https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/)

```bash
kubectl port-forward nginx1 9999:80

curl localhost:9999

# doesn't seem to grant access for other hosts on the LAN
```

- Ver los PODs mediante Nodo en Cluster

```bash
minikube ssh
  # docker ps
  # docker ps | grep 'apache'
```

- Introducción a YAML

```md
- Serialización de datos
- Forma legible/humana de elaborar ficheros de configuración
- Componentes clave-valor
```
<details>

```yaml
# Las cadenas no requieren comillas
Titulo: Introduccion a YAML

# Perso se pueden usar
title-w-quotes: 'Introduccion a YAML'

# Las cadenas multilínea comienzan con |
ejecutar: |
  npm ci
  npm build
  prueba npm

# Secuencias
# Nos permiten definir listas
# Usando guiones
numeros:
  - uno
  - dos
  - tres

# Versión en línea
numeros: [uno, dos, tres]

# Valores anidados
# Podemos usar todos los tipos anteriores para crear un objeto con valores anidados
1984:
  autor: George Orwell
  publicado en: 1949-06-08
  recuento de páginas: 328
  descripción: |
    Una novela ...
    Fue publicada ...

# Lista de objetos
# Combinando secuencias y valores anidados, crear lista de objetos
- 1984:
    autor: George Orwell
    publicado en: 1949-06-08
    recuento de páginas: 328
    descripción: |
      Una novela ...
      Fue publicada ...

- El Hobbit:
    autor: JRR Tolkien
    publicado en: 1937-09-21
    recuento de páginas: 310
    descripción: |
      The Hobbit ...
```
</details>


### PODs con Manifest

> - [ ] Registros privados/locales para docker images + kubelet

- Ciclo de vida completo para crear imágenes etc

```bash
mkdir -p ~/K8S/pod-manifest && cd $_
touch Dockerfile nginx.yaml
```
```dockerfile
FROM ubuntu:noble-20240127.1
RUN apt-get update

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get install -y nginx
RUN echo 'Ejemplo de POD con K8S y YAML' > /var/www/html/index.html

ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]
EXPOSE 80
```
```bash
docker image ls
# docker build -t setenova/k8s-nginx:v1 .
# # TODO: dockerhub commands
#   # docker login        # 'Docker ID'
#   # docker push setenova/k8s-nginx:v1
#   # ... REGISTRO privado

docker build -t pabloqpacin/nginx4k8s:v1 .

docker login
docker push pabloqpacin/nginx4k8s:v1

docker run -d --rm --name nginx1 -p 80:80 pabloqpacin/nginx4k8s:v1
curl localhost
```
```bash
nvim nginx.yaml
  # `spec` serán las características DESEADAS que se guardarán en etcd (?)
```
```yaml
apiVersion: v1              # según versiones instaladas, compatibilidad, consultar documentación
kind: Pod
metadata:
  name: nginx
  labels:
    zone: prod
    version: v1
spec:
  containers:
    - name: nginx
      image: pabloqpacin/nginx4k8s:v1
    # - podría haber más
```
```bash
kubectl get pods
kubectl create -f nginx.yaml
kubectl logs nginx
kubectl describe pod/nginx  # grep 'Name' 'Node' 'Labels' 'IP' 'Containers'
```

- Demo servicio

```bash
kubectl expose pod nginx --name=nginx-svc --port=80 --type=LoadBalancer
kubectl get svc nginx-svc
minikube ip

# curl $(minikube ip):$(kubectl get svc --all-namespaces -o go-template='{{range .items}}{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}{{end}}')       # https://stackoverflow.com/questions/37648553/is-there-anyway-to-get-the-external-ports-of-the-kubernetes-cluster
curl $(minikube ip):$(kubectl get svc nginx-svc -o go-template='{{range .spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}')

# kubectl delete service nginx-svc
# # kubectl delete pod nginx
```

- Extraer info con `get`

```bash
kubectl get pods
kubectl get pod/nginx
kubectl get pod/nginx -o yaml
kubectl get pod/nginx -o json
```

- Minikube dashboard

```bash
minikube dashboard
# minikube addons enable metrics-server

# Workloads > Pods
# Service > Services
# Cluster > Nodos
```
```bash
# OJO Namespace selección

# Pods
  # View logs
  # Exec (terminal)
  # Editar: Labels: Responsable: Pablo :D
```
```yaml
# Crear objetos: *input* | file | form

apiVersion: v1              # según versiones instaladas, compatibilidad, consultar documentación
kind: Pod
metadata:
  name: apache1
  labels:
    zone: desarrollo
    version: v1
spec:
  containers:
    - name: apache1
      image: httpd

# ...
```

- Borrar un POD

```bash
kubectl get pods

# kubectl delete pod/nginx
# kubectl delete pod nginx,apache1
# kubectl delete pod nginx,apache1 --now    # si problemas
kubectl delete pod nginx,apache1 --grace-period=5
# kubectl delete pods --all                 # peligoroso
```

- Pods multicontenedores

> EJEMPLO, malas prácticas

```bash
mkdir -p ~/K8S/multicon && cd $_
nvim multi.yaml
```
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: multi
spec:
  containers:
    - name: web
      image: nginx
      ports:
      - containerPort: 80
    - name: frontal
      image: alpine
      command: ["watch", "-n5","ping","localhost"]    # localhost: IP pod, no cont.
      # command: ["watch","-n2","ping","-c1","localhost"]
```
```bash
# kubectl delete all --all

kubectl apply -f multi.yaml

kubectl get pods

kubectl describe pod multi
```
```bash
kubectl logs multi
kubectl logs -f multi -c frontal

kubectl exec multi -c frontal -- date
```

```bash
minikube dashboard
# pods...
```

- Comando `apply` (VERSÁTIL) -- trabajando de forma declarativa

```bash
# cd ~/K8S/pod-manifest
kubectl create -f nginx.yaml

kubectl get pods
kubectl describe pod nginx
kubectl get pod nginx -o yaml
  # metadata == información objeto
  # spec    == configuración deseada
  # status == runtime info
```
> **KUBERNETES QUIERE QUE EL `STATUS` COINCIDA CON LA `SPEC`**

```bash
kubectl delete pod nginx

kubectl apply -f nginx.yaml

kubectl get pod nginx -o yaml | grep -A2 'last-applied-configuration'

nvim nginx.yaml     # añadir etiqueta 'otra: mi_etiqueta'

# > El estado deseado ahora es otro; con el siguiente comando se actualiza

kubectl apply -f nginx.yaml
```

> Normalmente no se trabaja con pods directamente (sino `deployments`)

### reboot policy

- Rebotar Pods (reboot) -- *always* (predefinida), onfailure, never

```bash
mkdir ~/K8S/pod-restart && cd $_
nvim restart-always.yaml
```
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: tomcat
  labels:
    app: tomcat
spec:
  containers:
    - name: tomcat
      image: tomcat
  restartPolicy: Always
```
```bash
kubectl apply -f restart-always.yaml
kubectl get pods
kubectl describe pod tomcat

kubectl exec -it tomcat -- bash
  # ps -ef
  # catalina.sh stop
# tomcat terminated with exit code 137

kubectl get pods                                # Running
kubectl describe pod tomcat | grep 'Restart'    # 1

kubectl delete pod tomcat
nvim restart-always.yaml
```
```yaml
# ...
  restartPolicy: OnFailure
```
```bash
kubectl apply -f restart-always.yaml

kubectl exec -it tomcat -- bash
  # catalina.sh stop

kubectl get pods                                # Completed
kubectl describe pod tomcat | grep 'Restart'    # 0

# > No ha habido error -- ¿¿¿ Qué es lo que constituye un error ???
```
---

```bash
cd ~/K8S/pod-restart
nvim restart-onfailure.yaml
```
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: on-failure
  labels:
    app: app1
spec:
  containers:
    - name: on-failure
      image: busybox
      command: ['sh','-c','echo Ejemplo de pod fallado && exit 1']
      # command: ['sh','-c','echo "Ejemplo de pod fallado" && exit 1']
  restartPolicy: OnFailure
```
```bash
kubectl apply -f restart-onfailure.yaml

kubectl get pod on-failure              # Status Error, Restart <many>

kubectl logs on-failure                 # 'Ejemplo de pod fallado'

kubectl describe pod on-failure
```
```bash
nvim restart-never.yaml
```
```yaml
# ...
  restartPolicy: Never
```
```bash
kubectl delete pod on-failure
kubectl apply -f restart-onfailure.yaml

kubectl get pod on-failure              # Status Error Terminated, Restart 0
```

- vscode

```bash
codium --install-extension 'ms-kubernetes-tools.vscode-kubernetes-tools'

mkdir ~/K8S/trabajo
codium $_

mkdir pods && touch pods/nginx.yaml

# ESCRIBIR pod Y TIRAR DE PLANTILLA
# MUY BUENA INTEGRACIÓN: buenos warnings, autocompletado, etc etc

kubectl apply -f nginx.yaml

# EXTENSION > Minikube > Workloads > Pods > apache1
  # Click on pod == kubectl get pod apache1 -o yaml
  # Click derecho on pod > get, delete, terminal (exec), debug attach, port forward, describe, logs [menu]
```


## 7. LABELS, Selectors, Anotaciones -- Etiquetar objetos

> Localizar, relacionar y buscar objetos y componentes

```bash
# CHEATSHEET
kubectl get pod <pod> --show-labels -L <label>

```


- Introducción
  - Componente importante: se establecen relaciones entre objeto a través de labels
  - Los nombres pueden ser inventados (ojo etiquetas reservadas)

```bash
mkdir ~/K8S/labels && cd $_
nvim tomcat.yaml
```
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: tomcat
  labels:
    estado: "desarrollo"
spec:
  containers:
    - name: tomcat
      image: tomcat
```
```bash
kubectl apply -f tomcat.yaml
kubectl get pod tomcat

kubectl get pod tomcat --show-labels
kubectl get pod tomcat --show-labels -L estado
```
- Trabajar con labels

```bash
# Añadir
kubectl label pod tomcat responsable=pablo

# Consultar
kubectl get pods --show-labels
kubectl get pods -L estado,responsable

# Modificar
kubectl label --overwrite pod/tomcat estado=test
kubectl get pods -L estado,responsable

# Eliminar
kubectl label pod/tomcat responsable-
kubectl get pods --show-labels
```
> Pero mejor de forma declarativa: editar archivo y `kc apply`

- Selectores
  - para encontrar objetos (deployments y servicios se relacionarán a través de S.)

```bash
cd ~/K8S/labels
for i in {1..3}; do cp tomcat.yaml "tomcat$i.yaml"; done
for file in $(ls tomcat*); do nvim $file; done
```
<details>

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: tomcat
  labels:
    estado: "desarrollo"
    responsable: "juan"
spec:
  containers:
   - name: tomcat     
     image: tomcat
```
```yaml
# ...
  name: tomcat1
  labels:
    estado: "desarrollo"
    responsable: "juan"
```
```yaml
# ...
  name: tomcat2
  labels:
    estado: "testing"
    responsable: "pedro"
```
```yaml
# ...
  name: tomcat3
  labels:
    estado: "produccion"
    responsable: "pedro"
```

</details>


```bash
kubectl apply -f .
kubectl get pods --show-labels
kubectl get pods -L estado,responsable

# Usando Selectores
kubectl get pods --show-labels -l estado
kubectl get pods --show-labels -l estado=produccion

# Condiciones tipo AND
kubectl get pods --show-labels -l estado=desarrollo,responsable=juan
kubectl get pods --show-labels -l responsable!=juan
kubectl get pods --show-labels -l estado!=testing

# Conjuntos
kubectl get pods --show-labels -l 'estado in(desarrollo)'
kubectl get pods --show-labels -l 'estado in(desarrollo,testing)'
kubectl get pods --show-labels -l 'estado notin(desarrollo,testing)'

kubectl delete pods -l 'estado=desarrollo'
```

- Anotations
  - labels identifican a los componentes y permiten relaciones entre ellos (implementación interna de Kubernetes...)
  - anotaciones similares a los labels (clave-valor), pero orientadas a **comentarios** (describen y documentan)

```bash
cd ~/K8S/labels
cp tomcat3.yaml tomcat4.yaml && nvim $_
```
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: tomcat4
  labels:
    estado: "produccion"
    responsable: "pedro"
  # ---
  annotations:
    doc: "Se debe compilar con gcc"
    adjunto: "ejemplo de anotacion"
  # ---
spec:
  containers:
   - name: tomcat     
     image: tomcat
```
```bash
kubectl apply -f tomcat4.yaml
kubectl get pod tomcat4
kubectl describe pod tomcat4 | grep -A2 'Annotations'

# OJARDO
kubectl get pod tomcat4 -o jsonpath={.metadata.annotations}
```

- Dashboard y labels

```bash
minikube dashboard

# Worloads > Pods > Tomcat4 > ...
```


## 8. Deployments

- Workloads y Controllers (Controller en ControlPlane...)
  - Workloads: Pods... deployment, replica set, stateful set, daemon set, job, cron job... controllers

...

- Deployments
  - Contenedores van dentro de Pods. Problemas: no escalan, no se recuperan ante caídas, updates y rollbacks complicados. Solución: no trabajar con Pods de forma directa sino a través de **deployments** (entorno para Pods con updates y rollbacks, recuperación ante caídas, escalabilidad...)
  - Crean **replicaset** para envolver los Pods y garantizar la integridad, estado actual para con estado deseado
  - Unidad de trabajo adecuada

...

- Creación deployments de forma imperativa

```bash
kubectl create deployment apache1 --image=httpd     # Se crean deployment, replicaset y pods

kubectl get deployments -o wide
kubectl get replicaset -o wide
kubectl get pods -o wide
```

- Ver información de deployments

```bash
kubectl describe deployment apache1

kubectl get deployment apache1 -o yaml
# kubectl get deployment apache1 -o json
```

- Dashboard

```bash
minikube dashboard

# Workloads > 
```

- Crear Deployments de forma declarativa

```bash
mkdir ~/K8S/deploy && cd $_
nvim deploy_nginx.yaml
```
<!-- ```yaml
apiVersion:
kind:
metadata:
spec:
``` -->

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-d
spec:
  selector:               # permite seleccionar un conjunto de objetos que cumplan las condiciones
    matchLabels:
      app: nginx
  replicas: 2             # ejecutar 2 pods
  template:               # plantilla que define los containers
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:1.7.9
          ports:
            - containerPort: 80
```
```bash
# kubectl create -f deploy-nginx.yaml
kubectl apply -f deploy-nginx.yaml

kubectl get pods
kubectl get deploy
kubectl get rs
kubectl get rs -o wide

# label search
kubectl get pods -l app=nginx
kubectl get pods -l app=nginx -L app
kubectl get pods -L app

kubectl get deploy,rs,pods
kubectl get deploy,rs,pods -l app=nginx
```

- Comando EDIT (cuidado con cambios no documentados/versionados)

```bash
kubectl describe deploy nginx-d
kubectl get deploy nginx-d            # 2 pods

sed -i 's/replicas: 2/replicas: 3/' deploy-nginx.yaml 
kubectl apply -f deploye-nginx.yaml

kubectl get deploy nginx-d            # 3 pods
kubectl get rs                        # 3 rs
```
```bash
kubectl edit deploy nginx-d
  # cambiar replicas de 3 a 5

kubectl get deploy,rs,pods -l app=nginx

kubectl get deploy nginx-d -o yaml > deploy-vcs-bak.yaml
```

- **Escalar** un deployment (+ réplicas)

```bash
kubectl get deploy nginx-d            # 5 pods

kubectl scale deploy nginx-d --replicas=6

kubectl get deploy nginx-d            # 6 pods
kubectl get rs
```
---
```bash
cd ~/K8S/deploy
nvim deploy-nginx.yaml
```
```yaml
# ...
metadata:
  name: nginx-d
  labels:
    estado: 1
spec:
  # ...
```
```bash
kubectl apply -f deploy-nginx.yaml
kubectl get deploy -l estado=1
  # OJO: al aplicar la config, se reinstauran las 3 replicas (no 5 ni 6)

kubectl scale deploy -l estado=1 --replicas=10
kubectl scale deploy -l estado=1 --replicas=2
```

- Consideraciones sobre el escalado
  - un pod webserver puede ser duplicado, todos compartiendo un mismo único volumen (con webapp html etc) -- escalabilidad fácil
  - un pod mysql, al escalar, duplica la BD: no es 1 compartida, sino 1 por cada pod ((mysql solo soporta 1 motor para cada bd...)) -- necesario recurrir a otro productor para CLUSTERING mysql, eg. mysql-cluster, mysql-galera
  <!-- - Impactos de la clonación de pods: -->

...

- VSCODE

...

## 9. Servicios

- Intro
  - Entre clientes y deployments; ip fija, nombre fijo, puerto fijo
  - Se vale de **selectors** asociados a **labels** de los pods

```md
# TIPOS
- `ClusterIP`: accesible solo desde dentro del cluster; IP, nombre, puerto
- `NodePort`: accesible desde fuera; IP, nombre, puerto, nodeport
- `LoadBalancer`: solo accesible desde fuera... integrado con loadbalancers de terceros (aws, google cloud, azure)
```

- Crear servicio tipo `NodePort`

```bash
# mkdir ~/K8S/services && cd $_

kubectl create deployment apache1 --image=httpd

kubectl get all   # rs, deployment, pod

# Expose (deployment o pod); DEFAULT == ClusterIP
kubectl expose deploy apache1 --port=80 --type=NodePort

kubectl get svc
```
> - [ ] `minikube ip` == máquina con nombre según DNS

```bash
minikube ip             # 192.168.49.2
minikube service list

curl $(minikube ip):$(kubectl get svc apache1 -o go-template='{{range .spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}')
# curl 192.168.49.2:30646
```

- Escalar un deploy

```bash
kubectl get svc

kubectl describe svc apache1 | grep 'Endpoint'    # 1
kubectl get pods -o wide

kubectl describe svc apache1 | grep 'Selector'
kubectl get pods --show-labels
```
```bash
kubectl scale deploy apache1 --replicas=3
kubectl get pods -o wide
kubectl describe svc apache1 | grep 'Endpoint'    # 3

kubectl delete pod <apache1-pod>
# SE CREA AUTOMÁTICAMENTE NUEVO POD... CON NUEVA IP
```

- Crear servicio tipo `LoadBalancer`


```bash
kubectl create deployment apache2 --image=httpd
kubectl expose deploy apache2 --port=80 --type=LoadBalancer

kubectl get svc -l app=apache2    # ojo EXTERNAL-IP debería ser de un Cloud
```

- Crear servicio tipo `ClusterIP` (Redis)
  - ClusterIP: *por defecto*; solo accesibles desde dentro del cluster


```bash
kubectl create deployment redis-master --image=redis
kubectl create deployment redis-cliente --image=redis
kubectl get all -o wide

kubectl expose deploy redis-master --port=6379 --type=ClusterIP
kubectl get svc -o wide
```
```bash
kubectl get pods
kubectl exec redis-cliente-<hash> -it -- bash
  # redis-cli -h redis-master
    # set v1 10
    # get v1

kubectl exec redis-master-<hash> -it -- bash
  # redis-cli
    # info keyspace
    # get v1
```

- Dashboard

...

- PRÁCTICA: Servicio de forma declarativa (Dockerfile + ...)
  - DockerfileAppWeb > Imagen Docker > Despliegue > Servicio
  - separar componentes: `---`

```bash
# unzip foo.zip -d ~/K8S/Practica1 && cd $_

ls Dockerfile
tree web
ls deploy_web.yaml
ls web-svc.yaml
# ls completo.yaml

nvim Dockerfile
```
```Dockerfile
FROM ubuntu
RUN apt-get update
RUN apt-get install -y apache2
ADD web /var/www/html
EXPOSE 80
CMD /usr/sbin/apachectl -D FOREGROUND
```
```bash
docker build -t apasoft/web .
docker image ls

docker run -d --name web1 -p 9090:80 apasoft/web
curl localhost:9090
docker stop web1 && docker rm web1 -v
```
---

```bash
nvim completo.yaml
```
```yaml
#############
# DEPLOYMENT  
#############
apiVersion: apps/v1 
kind: Deployment
metadata:
  name: web-d
spec:
  selector:   #permite seleccionar un conjunto de objetos que cumplan las condicione
    matchLabels:
      app: web
  replicas: 2 # indica al controlador que ejecute 2 pods
  template:   # Plantilla que define los containers
    metadata:
      labels:
        app: web
    spec:
      containers:
      - name: apache
        image: apasoft/web:latest
        ports:
        - containerPort: 80
---

#############
# SERVICIO  
#############
apiVersion: v1
kind: Service
metadata:
  name: web-svc
  labels:
     app: web
spec:
  type: NodePort  #que salga al exterior
  ports:
  - port: 80
    nodePort: 30002
    protocol: TCP
  selector:
     app: web
```
```bash
kubectl apply -f completo.yaml

curl $(minikube ip):30002
```

- Endpoints
  - los **servicios** apuntan a **endpoints**
  - son objetos en sí mismos

```bash
cd ~/K8S/Practica1

kubectl describe svc web-svc | grep "Endpoints"   # PODS!!

kubectl get endpoints                 # OJO!
kubectl describe endpoints web-svc
kubectl get endpoints web-svc -o yaml
```
---

- Variables de entorno del svc

```bash
kubectl get pods

kubectl exec -it <pod> -- bash
  # env

kubectl describe svc <foo>
```


## 10. Ejemplo Aplicación PHP-REDIS con Servicios (!)

- Enunciado
  - PHP (NodePort) + Redis Clientes (ClusterIP) + Redis Master (ClusterIP)
  - tenemos Deployment, Servicios, IP expuestas...
  - [K8S OP](https://kubernetes.io/docs/tutorials/stateless-application/guestbook/)

...

- Creación Redis master

```bash
mkdir ~/K8S/RedisPHP
nvim redis-master.yaml
```
```yaml
apiVersion: apps/v1 # for versions before 1.9.0 use apps/v1beta2
kind: Deployment
metadata:
  name: redis-master
  labels:
    app: redis
spec:
  selector:
    matchLabels:
      app: redis
      role: master
      tier: backend
  replicas: 1
  template:
    metadata:
      labels:
        app: redis
        role: master
        tier: backend
    spec:
      containers:
      - name: master
        image: redis # or just image: redis
        ports:
        - containerPort: 6379
```
```bash
kubectl apply -f redis-master.yaml
kubectl get pods && kubectl get deploy && kubectl get rs
kubectl get all -l app=redis

nvim redis-master-service.yaml
```
```yaml
apiVersion: v1
kind: Service
metadata:
  name: redis-master-svc
  labels:
    app: redis
    role: master
    tier: backend
spec:
  ports:
  - port: 6379
    targetPort: 6379
  selector:
    app: redis
    role: master
    tier: backend
# ClusterIP por omisión
```
```bash
kubectl apply -f redis-master-service.yaml
kubectl get svc && \
kubectl describe svc redis-master-svc

  # IP       == IP Servicio
  # Endpoint == IP Pod

kubectl get pods
kubectl exec -it redis-master-<hash> -- bash
  # cat /etc/hosts | grep 'redis-master'
  # ping redis-master-svc || apt install iptutils-ping
  # nslookup redis-master-svc || apt install dnsutils
  # cat /etc/resolv.conf      # Servidor DNS Kubernetes
```

- Creación Redis esclavos

```bash
nvim redis-slave.yaml
```
```yaml
apiVersion: apps/v1 # for versions before 1.9.0 use apps/v1beta2
kind: Deployment
metadata:
  name: redis-slave
  labels:
    app: redis
spec:
  selector:
    matchLabels:
      app: redis
      role: slave
      tier: backend
  replicas: 2
  template:
    metadata:
      labels:
        app: redis
        role: slave
        tier: backend
    spec:
      containers:
      - name: slave
        # image: gcr.io/google_samples/gb-redisslave    # ...
        image: us-docker.pkg.dev/google-samples/containers/gke/gb-redis-follower:v2     # https://kubernetes.io/docs/tutorials/stateless-application/guestbook/
        env:
        - name: GET_HOSTS_FROM
          value: dns
```
```bash
kubectl apply -f redis-slave.yaml

nvim redis-slave-service.yaml
```
```yaml
apiVersion: v1
kind: Service
metadata:
  name: redis-slave
  labels:
    app: redis
    role: slave
    tier: backend
spec:
  # type: ClusterIP
  ports:
  - port: 6379
  selector:
    app: redis
    role: slave
    tier: backend
```
```bash
kubectl apply -f redis-slave-service.yaml

kubectl describe svc redis-slave

kubectl exec -it redis-master-<hash> -- bash
  # nslookup redis-slave
  # nslookup redis-master-svc 1
```
- Creación Frontend PHP

```bash
nvim frontend.yaml
```
```yaml
apiVersion: apps/v1 # for versions before 1.9.0 use apps/v1beta2
kind: Deployment
metadata:
  name: frontend
  labels:
    app: guestbook
spec:
  selector:
    matchLabels:
      app: guestbook
      tier: frontend
  replicas: 3
  template:
    metadata:
      labels:
        app: guestbook
        tier: frontend
    spec:
      containers:
      - name: php-redis
        # image: gcr.io/google-samples/gb-frontend
        image: us-docker.pkg.dev/google-samples/containers/gke/gb-frontend:v5
        env:
        - name: GET_HOSTS_FROM
          value: dns
```
```bash
kubectl apply -f frontend.yaml

kubectl get all -o wide
kubectl get all -l tier=frontend
kubectl get all -l app=guestbook

nvim frontend-service.yaml
```
```yaml
apiVersion: v1
kind: Service
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:  
  type: NodePort 
  #type: LoadBalancer   # en Cloud
  ports:
  - port: 80
  selector:
    app: guestbook
    tier: frontend
```
```bash
kubectl apply -f frontend-service.yaml

kubectl describe svc frontend | grep 'NodePort'

curl $(minikube ip):31942     # FAIL
```

## 11. Namespaces -- agrupar objetos

- Intro
  - Como particiones del cluster para poner objetos (división lógica en zonas)
  - Entornos independientes

```bash
kc get namespaces
# default                # namespace predefinido para nuevos objetos
# kube-system            # contiene todos los objetos creados durante la instalación
# kube-public            # disponible para todos los usuarios (no necesario permisos especiales)
# kubernetes-dashboard   # se activa al abrir el (minikube) dashboard
# kube-node-lease        # 

kubectl describe namespace <namespace>

kubectl get all -n kube-system

# NAME                                   READY   STATUS    RESTARTS       AGE
# pod/coredns-5dd5756b68-r7fxc           1/1     Running   8 (112m ago)   6d5h
# pod/etcd-minikube                      1/1     Running   8 (112m ago)   6d5h
# pod/kube-apiserver-minikube            1/1     Running   8 (112m ago)   6d5h
# pod/kube-controller-manager-minikube   1/1     Running   8 (112m ago)   6d5h
# pod/kube-proxy-9hrt2                   1/1     Running   8 (112m ago)   6d5h
# pod/kube-scheduler-minikube            1/1     Running   8 (112m ago)   6d5h
# pod/metrics-server-7c66d45ddc-5rw28    1/1     Running   9 (14m ago)    6d2h
# pod/storage-provisioner                1/1     Running   17 (14m ago)   6d5h

# NAME                     TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE
# service/kube-dns         ClusterIP   10.96.0.10      <none>        53/UDP,53/TCP,9153/TCP   6d5h
# service/metrics-server   ClusterIP   10.98.228.101   <none>        443/TCP                  6d2h

# NAME                        DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE
# daemonset.apps/kube-proxy   1         1         1       1            1           kubernetes.io/os=linux   6d5h

# NAME                             READY   UP-TO-DATE   AVAILABLE   AGE
# deployment.apps/coredns          1/1     1            1           6d5h
# deployment.apps/metrics-server   1/1     1            1           6d2h

# NAME                                        DESIRED   CURRENT   READY   AGE
# replicaset.apps/coredns-5dd5756b68          1         1         1       6d5h
# replicaset.apps/metrics-server-7c66d45ddc   1         1         1       6d2h
```

- Crear y borrar namespaces

```bash
# Forma imperativa
kubectl create namespace n1
kubectl describe namespace n1 && \
kubectl get all -n n1
```
```bash
# Forma declarativa
mkdir ~/K8S/namespaces && cd $_
nvim namespace.yaml
```
```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: dev1
  labels:
    tipo: desarrollo
```
```bash
kubectl apply -f namespace.yaml
kc get namespaces | grep 'dev1'
kubectl describe namespace dev1 && \
kubectl get all -n dev1

kubectl delete namespace n1
```

- Crear objetos en un namespace

```bash
cd ~/K8S/namespaces
nvim deploy_elastic.yaml
```
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: elastic
  labels:
    tipo: desarrollo
spec:
  selector:
    matchLabels:
      app: elastic
  replicas: 2
  strategy:
    type: RollingUpdate
  minReadySeconds: 2
  template:
    metadata:
      labels:
        app: elastic
    spec:
      containers:
        - name: elastic
          image: elasticsearch:7.6.0
          # image: docker.elastic.co/elasticsearch/elasticsearch:7.11.1 # https://stackoverflow.com/questions/63642042/install-elastic-search-in-docker
          ports:
            - containerPort: 9200   # descriptivo, no necesario (como en los Dockerfile...)
```
```bash
kubectl apply -f deploy_elastic.yaml -n dev1

# kubectl rollout history deploy elastic -n dev1
```

- Establecer un namespace por defecto

> Nuevo tipo de objeto (`kind`): `LimitRange`

```bash
# bat ~/.kube/config

kubectl config view | grep 'namespace'

kubectl config set-context --current --namespace dev1
kubectl config view | grep 'namespace'

# kcga
```

- Poner CPU y memoria a los namespaces

```bash
cd ~/K8S/namespaces
nvim limites.yaml
```
```yaml
apiVersion: v1
kind: LimitRange
metadata:
  name: recursos
spec:
  limits:
  - default:
      memory: 512Mi
      cpu: 1
    defaultRequest:
      memory: 256Mi
      cpu: 0.5
    max:
      memory: 1Gi
      cpu: 4
    min:
      memory: 128Mi
      cpu: 0.5
    type: Container
```
```bash
kubectl create namespace n1

kubectl apply -f limites.yaml -n n1

kubectl describe namespace n1
```

- Controlar eventos (creación pods, descarga imágenes...) dentro de un namespace

```bash
# kubectl create namespace desarrollo
# kubectl config set-context --current --namespace=desarrollo

kubectl get events -n desarrollo
kubectl get events --field-selector type="Warning"
kubectl get events --field-selector reason="Scheduled"
kubectl get events -w
kubectl get events --field-selector reason="Failed" -w
```

## 12. Rolling Updates

- Aplicar cambios sin reinciar contenedores (`strategy`)
  - `RollingUpdate`: los pods se modifican poco a poco
  - `Recreate`: borra y construye los pods (pérdida momentánea de servicio)
- Cambiar una label no sería un rollout, cambiar puertos o algo más sustancial sí

```bash
mkdir ~/K8S/rollout && cd $_
nvim deploy_nginx.yaml
```
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-d
  labels:
    estado: "1"
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 10
  strategy:
    type: RollingUpdate
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:1.7.9
          ports:
            - containerPort: 80
```
```bash
kubectl apply -f deploy_nginx.yaml

kubectl describe deploy nginx-d | grep 'Image'
kubectl rollout history deploy nginx-d

  kubectl rollout history deploy nginx-d --revision 1 | grep 'hash'
  kubectl get rs
```
```bash
sed -i 's/nginx:1.7.9/nginx:1.17.8/' deploy_nginx.yaml
kubectl apply -f deploy_nginx.yaml

kubectl describe deploy nginx-d | grep 'Image'
kubectl rollout history deploy nginx-d

  kubectl rollout history deploy nginx-d --revision 1 | grep 'hash'
  kubectl rollout history deploy nginx-d --revision 2 | grep 'hash'
  kubectl get rs
```

---

```bash
mkdir ~/K8S/rollout && cd $_
nvim deploy_nginx.yaml
```
<!-- obligamos a tener n pods siempre corriendo (10 - 1) -->
```yaml
# ...
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 1
      maxSurge: 1
  minReadySeconds: 2
# ...
```

```bash
nvim nginx-svc.yaml
```
```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-svc
  labels:
    app: nginx
spec:
  type: NodePort
  ports:
    - port: 80
      nodePort: 31000
      protocol: TCP
  selector:
    app: nginx
```
```bash
kubectl apply -f nginx-svc.yaml

kubectl describe svc nginx-svc | grep 'Endpoints'

sed -i 's/nginx:1.17.8/nginx:1.16.1/' deploy_nginx.yaml
kubectl apply -f deploy_nginx.yaml

kubectl rollout history deploy nginx-d
kubectl describe svc nginx-svc | grep 'Endpoints'
```

- Deshacer cambios, rolling back

```bash
kubectl rollout history deploy nginx-d
kubectl rollout history deploy nginx-d --revision=2

sed -i 's/nginx:1.16.1/nginx:1.foo/' deploy_nginx.yaml

kubectl apply -f deploy_nginx.yaml && \
  kubectl rollout status deploy nginx-d -w

kubectl rollout undo deploy nginx-d --to-revision=2 && \
  kubectl rollout status deploy nginx-d -w
```

- Recreate (VS rollout)

```bash
sed -i 's/nginx:1.foo/nginx:1.16.1/' deploy_nginx.yaml
nvim deploy_nginx.yaml
```
```yaml
# ...
  strategy:
    type: Recreate
  minReadySeconds: 2
# ...
```
```bash
kubectl apply f deploy_nginx.yaml && \
  kubectl rollout status deploy nginx-d -w

kubectl describe deploy nginx-d | grep 'Strategy'

kubectl rollout history deploy nginx-d
```

## 13. Variables, ConfigMaps y Secrets

- Variables (variables normales de Docker, gestionadas por K8S)

```bash
mkdir ~/K8S/VarConSec && cd $_
nvim var1.yaml
```
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: var-ejemplo
  labels:
    app: variables
spec:
  containers:
    - name: contenedor-variables
      # image: gcr.io/google.samples/node-hello:1.0
      image: pabloqpacin/nginx4k8s:v1
      env:
        - name: NOMBRE
          value: "CURSO DE KUBERNETES"
        - name: PROPIETARIO
          value: "Apasoft Training"
```
```bash
kubectl apply -f var1.yaml
kubectl get pods

kubectl exec -it var-ejemplo -- printenv
```
- Ejemplo con mysql

```bash
nvim deploy_mysql.yaml
```
```yaml
apiVersion: apps/v1
kind: Deploy
metadata:
  name: mysql-deploy
  labels:
    app: mysql
    type: db
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mysql
      type: db
  template:
    metadata:
      labels:
        app: mysql
        type: db
    spec:
      containers:
        - name: mysql57
          image: mysql:5.7
          ports:
            - containerPort: 3306
              name: db-port
          env:
            - name: MYSQL_ROOT_PASSWORD
              value: kubernetes
            - name: MYSQL_USER
              value: usudb
            - name: MYSQL_PASSWORD
              value: usupass
            - name: MYSQL_DATABASE
              value: kubernetes
```
```bash
kubectl apply -f deploy_nginx.yaml
kubectl exec -it <mysql-pod> -- mysql -u usudb -pusupass
```

- ConfigMaps (forma imperativa)

```bash
kubectl create configmap cf1 --from-literal=usuario=usu1 --from-literal=password=pass1

kubectl get confimap
kubectl describe cm cf1
kubectl get cm cf1 -o yaml

```
- ConfigMaps (forma declarativa)

> ojo `--from-file` VS `--from-env-file`

```bash
nvim mysql.properties
```
```properties
MYSQL_ROOT_PASSWORD=kubernetes
MYSQL_USER=usudb
MYSQL_PASSWORD=usupass
MYSQL_DATABASE=kubernetes
```
```bash
kubectl create cm datos-mysql --from-file=mysql.properties
kubectl get cm datos-mysql -o yaml || kubectl describe cm datos-mysql

nvim pod1.yaml
```
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod1
spec:
  containers:
    - name: test-container
      image: nginx          # mysql won't recognize the env vars... because array ig
      env:
        - name: DATOS_MYSQL
          valueFrom:
            configMapKeyRef:
              name: datos-mysql
              key: mysql.properties
  restartPolicy: Never
```
```bash
kubectl apply -f pod1.yaml

kubectl exec -it pod1 -- printenv

kubectl exec -it pod1 -- bash
  # echo $DATOS_MYSQL
```

- Cargar variables bien

```bash
kubectl create cm datos-mysql-env --from-env-file=mysql.properties
kubectl get cm datos-mysql-env -o yaml || kubectl describe cm datos-mysql-env

nvim pod2.yaml
```
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod2
spec:
  containers:
    - name: test-container
      image: mysql
      envFrom:
        - configMapRef:
            name: datos-myql-env
  restartPolicy: Never
```
```bash
kubectl apply -f pod2.yaml

kubectl describe pod pod2
```

> - [ ] `ERROR: configmap "datos-mysql-env" not found`
> - https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/#create-configmaps-from-files

- PRACTICA: Configurar MySQL con ConfigMaps

> TODO: two kinds in same file


```bash
nvim datos-mysql-env.yaml
```
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: datos-mysql-env
  namespace: default
data:
  MYSQL_DATABASE: kubernetes
  MYSQL_PASSWORD: usupass
  MYSQL_ROOT_PASSWORD: kubernetes
  MYSQL_USER: usudb
```
```bash
kubectl apply -f datos-mysql-env.yaml
kubectl get cm -n default

nvim mysql.yaml
```
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql-deploy
  labels:
    app: mysql
    type: db
spec:
  replicas: 1
  selector: 
    matchLabels:
      app: mysql
      type: db
  template:
    metadata:
      labels:
        app: mysql
        type: db
    spec:
      containers:
        - name: mysql57
          image: mysql:5.7
          ports:
            - containerPort: 3306
              name: db-port
          # envFrom: ...
          env:
            - name: MYSQL_ROOT_PASSWORD
              valueFrom:
                configMapKeyRef:
                  name: datos-mysql-env
                  key: MYSQL_ROOT_PASSWORD

            - name: MYSQL_USER
              valueFrom:
                configMapKeyRef:
                  name: datos-mysql-env
                  key: MYSQL_USER
            
            - name: MYSQL_DATABASE
              valueFrom:
                configMapKeyRef:
                  name: datos-mysql-env
                  key: MYSQL_DATABASE

            - name: MYSQL_PASSWORD
              valueFrom:
                configMapKeyRef:
                  name: datos-mysql-env
                  key: MYSQL_PASSWORD
```
```bash
kubectl apply -f mysql.yaml

kubectl get all
# kubectl get deploy && kubectl get rs && kubectl get pod

kubectl exec -it <pod> -- printenv                  # ÉXITO!
kubectl exec -it <pod> -- mysql -u usudb -pusupass  # -D kubernetes -e "show tables;"
```
<!-- ¿puedo conectarme con mycli desde otro host aunque no haya svc? -->

- **ConfigMaps y Volúmenes**



```bash
cd ~/K8S/VarConSec && nvim pod1.yaml
```
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: config-volumen
  namespace: default
data:
  ENTORNO: "desarrollo"
  VERSION: "1.0"

---
apiVersion: v1
kind: Pod
metadata:
  name: pod1
spec:
  containers:
    - name: contenedor1
      image: k8s.gcr.io/busybox
      command: [ "/bin/sh", "-c", "sleep 1000000" ]
      volumeMounts:
      - name: volumen-config-map
        mountPath: /etc/config-map
  volumes:
    - name: volumen-config-map
      configMap:
        name: config-volumen
  restartPolicy: Never
```
```bash
kubectl apply -f pod1.yaml

kubectl get cm && \
kubectl get cm config-volumen -o yaml

kubectl get all && \
kubectl describe pod pod1

kubectl exec -it pod1 -- printenv && \
kubectl exec -it pod1 -- sh
  # ls -la /etc/config-map
  # cat /etc/config-map/ENTORNO
  # cat /etc/config-map/VERSION
```

#### Secrets <!--configmap encriptado-->

- Teoría

```md
- Almacenar contraseñas, tokens, claves ssh...
- *Autenticación* para acceder a recursos del cluster
- Distintos tipos según recurso
- Forma directa de uso: *asociarlos a pods*
- Tipos:
  - **Opaque**: (estándar) ConfigMap cifrado
  - **Service Account token**: capacidad de ejecutar procesos en un pod (rollo ACL)
  - **Docker config**: autenticación para Registro privado
  - **Basic authentication**: username + password (multiusos)
  - **SSH**: ssh-privatekey (clave-valor)
  - **TLS**: certificado + clave (recurso tipo ingres, desde fuera del cluster) (`tls.key` + `tls.crt`)
  - **Bootstrap**: proceso bootstrap del *nodo*
```

- Creación imperativa

> haremos las pass en los secrets y el resto en el cm...

```bash
# Crear secret con nombre 'passwords'
kubectl create secret generic passwords --from-literal=pass-root=kubernetes --from-literal=pass-usu=kubernetes

kubectl get secrets
kubectl get secrets -o yaml   # se ve cifrado

nvim mysql_cm_secret.yaml
```
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: datos-mysql-env
  namespace: default
data:
  MYSQL_DATABASE: kubernetes
  # MYSQL_PASSWORD: usupass
  # MYSQL_ROOT_PASSWORD: kubernetes
  MYSQL_USER: usudb

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql-deploy
  labels:
    app: mysql
    type: db
spec:
  replicas: 1
  selector: 
    matchLabels:
      app: mysql
      type: db
  template:
    metadata:
      labels:
        app: mysql
        type: db
    spec:
      containers:
        - name: mysql57
          image: mysql:5.7
          ports:
            - containerPort: 3306
              name: db-port
          env:
            - name: MYSQL_ROOT_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: passwords
                  key: pass-root

            - name: MYSQL_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: passwords
                  key: pass-usu

            - name: MYSQL_USER
              valueFrom:
                configMapKeyRef:
                  name: datos-mysql-env
                  key: MYSQL_USER
            
            - name: MYSQL_DATABASE
              valueFrom:
                configMapKeyRef:
                  name: datos-mysql-env
                  key: MYSQL_DATABASE
```
```bash
kubectl apply -f mysql_cm_secret.yaml

kubectl exec -it <pod> -- printenv
kubectl exec -it <pod> -- mysql -u usudb -pkubernetes -e "show databases like 'kubernetes';"
```

- Crear secrets desde ficheros

> En contenedor: 1 clave (nombre fichero) + 1 valor (contenido fichero)

```bash
cd ~/K8S/VarConSec
echo "Este es un ejemplo de secrets
incorporados desde un fichero
dentro de un contenedor" > datos.txt

kubectl create secret generic datos --from-file=datos.txt
kubectl get secret
kubectl describe secret datos
kubectl describe get datos -o yaml

nvim pod1.yaml
```
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod1
spec:
  containers:
    - name: test-container
      image: ubuntu
      command: [ "/bin/sh", "-c", "sleep 1000000" ]
      env:
        - name: DATOS
          valueFrom:
            secretKeyRef:
              name: datos
              key: datos.txt
  restartPolicy: Never
```
```bash
kubectl apply -f pod1.yaml

kubectl exec -it <pod> -- printenv
kubectl exec -it <pod> -- bash
  # echo $DATOS
  # echo $DATOS | od -c | grep '\n'
```

- Creación declarativa (`base64`)

> Anteriormente K8S hace el encriptado; ahora nosotros la definimos

```bash
echo -n 'usu1' | base64                   # dXN1MQ==
echo -n 'password-usu1' | base64          # cGFzc3dvcmQtdXN1MQ==
```
```yaml
# El apartado 'data' debe estar ya encriptado (en base64)
apiVersion: v1
kind: Secret
metadata:
  name: secreto1
type: Opaque
data:
  usuario1: dXN1MQ==
  usu1-pass: cGFzc3dvcmQtdXN1MQ==

---
apiVersion: v1
kind: Secret
metadata:
  name: secreto2
type: Opaque
stringData:
  usuario2: 'usu2'
  usu2-pass: 'password-usu2'

---
apiVersion: v1
kind: Pod
metadata:
  name: pod1
spec:
  containers:
    - name: test-container
      image: ubuntu
      command: [ "/bin/sh", "-c", "sleep 1000000" ]
      envFrom:
        - secretRef:
            name: secreto1
        - secretRef:
            name: secreto2
  restartPolicy: Never
```
```bash
kubectl apply -f pod1.yaml

kubectl exec -it <pod> -- printenv
```

- Secrets y volúmenes

> (!) Asociar a un secret, un directorio, donde cada componente del secret es un fichero

```bash
nvim pod1.yaml
```
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: secreto-volumen
  namespace: default
type: Opaque
stringData:
  DATO1: "dato1"
  DATO2: "dato2"

---
apiVersion: v1
kind: Pod
metadata:
  name: pod1
spec:
  containers:
    - name: test-container
      image: ubuntu
      command: [ "/bin/sh", "-c", "sleep 1000000" ]
      volumeMounts:
      - name: volumen-secretos
        mountPath: /tmp/datos
  volumes:
    - name: volumen-secretos
      secret:
        secretName: secreto-volumen     # aquí se asocia con el secret
  restartPolicy: Never

```
```bash
kubectl apply -f pod1.yaml

kubectl get secrets
kubectl get secrets secreto-volumen -o yaml

kubectl exec -it pod1 -- ls -la /tmp/datos
kubectl exec -it pod1 -- sh -c 'for file in /tmp/datos/*; do more "$file"; done'
```

- Secrets de tipo Docker (Registros privados)

<!-- https://hub.docker.com/repository/docker/pabloqpacin/db-movidas/general -->

> Primero demo de Error por Registro privado

```bash
cd ~/K8S/VarConSec
nvim pod-docker.yaml
```
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: ejemplo
spec:
  containers:
    - name: ejemplo
      # image: apasoft/web1
      image: pabloqpacin/db-movidas:v1

```
```bash
kubectl apply -f pod-docker.yaml
kubectl get pods
kubectl describe pod ejemplo | grep -C5 ErrImagePull
kubectl delete pod ejemplo
```
> Ahora sí

```bash
# Crear secreto 'midockerjab' con credenciales de DockerHub
kubectl create secret docker-registry midockerjab \
  --docker-server=docker.io \
  --docker-username=pabloqpacin \
  --docker-password=<password> \
  --docker-email=<email>
```
```bash
kubectl get secret
kubectl get secret midockerjab -o yaml

nvim pod-docker.yaml
```
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: ejemplo
spec:
  containers:
    - name: ejemplo
      # image: apasoft/web1
      image: pabloqpacin/db-movidas:v1
  imagePullSecrets:
    - name: midockerjab
```
```bash
kubectl apply -f pod-docker.yaml

kubectl exec -it ejemplo -- sh -c 'mysql -u topuria -p"topuria420;" -D topuria -e "select * from users;"'
```

## 14. Kubeconfig: configuración del cluster

> `kubectl config view && kubectl config --help`

- Intro
  - Fichero yaml que usa `kubectl` para autenticarse con los cluster
  - Contiene: Certificado, Servidor, Nombre, Usuario, Token de usuario
  - Kubeconfig:
    - Cluster:
      - Contiene EndPoints de un cluster de kubernetes
      - Incluye la URL completa para servidor apiserver de kubernetes + autoridad de certificación del cluster
      - Se puede configurar la propiedad `insecure-skip-tls-verify: true` (si el cert de servicio del cluster no está firmado por una entidad de certificación de confianza del sistema)
      - Se pueden agregar o modificar entradas de cluster mediante `kubectl config set-cluster`
    - Users:
      - Un usuario define las credenciales de cliente para autenticarse en un cluster de kubernetes
      - Un usuario tiene un nombre que actúa como clave
      - Las **credenciales** disponibles son certificado de cliente, clave de cliente, token y nombre de usuario/contraseña (nombre/contraseña y token son mutuamente excluyentes, pero los certs y claves se pueden combinar con ellos)
      - Se pueden agregar o modificar entradas de usuario mediante `kubectl config set-credentials`
    - Contextos:
      - Definen conjunto de cluster, usuario y namespace usados para enviar solicitudes al cluster
      - Cada uno de los 3 es opcional: es válido especificar un contexto con un solo valor de cluster, usuario, namespace o no especificar ninguno
      - Los valores no especificados o los valores con nombre que no tengan las entradas correspondientes en el kubeconfig se reemplazarán por el valor predeterminado
      - Se pueden agregar o modificar entradas de contexto con `kubectl config set-context`
  - *Contexto actual*
    - Permite identificar el contexto concreto que se utilizará cuando no se indique ningún otro valor
    - Se puede cambiar el contexto actual con el comando`kubectl config use-context`
    - Ver la configuración actual: `kubectl config view`

```bash
# Indicar fichero explícitamente (que usar para la autenticación)
kubectl <foo> --kubeconfig <file>

# Indicar env. var.
export KUBECONFIG='/path/to/config'

# Default
ls ~/.kube/config

# Current
kubectl config view
```
```yaml
# Ejemplo...
apiVersion: v1
kind: Config
preferences: {}

clusters:
- cluster:
    certificate-authority: /fichero-ca
    server: https://produccion.empresa:4443
  name: produccion
- cluster:
    insecure-sip-tls-verify: true
    server: https://desarrollo:4443
  name: desarrollo

users:
- name: desarrollo1
  user:
    token: token1
- name: desarrollo2
  user:
    client-certificate: path/al/certificado
    client-key: path/a/clave

contexts:
- context:
    cluster: produccion
    namespace: trabajo
    user: desarrollo1
  name: context-desarrollo
```
```yaml
# minikube vanilla
apiVersion: v1
clusters:
- cluster:
    certificate-authority: /home/pabloqpacin/.minikube/ca.crt
    extensions:
    - extension:
        last-update: Mon, 04 Mar 2024 11:40:37 CET
        provider: minikube.sigs.k8s.io
        version: v1.32.0
      name: cluster_info
    server: https://192.168.49.2:8443
  name: minikube
contexts:
- context:
    cluster: minikube
    extensions:
    - extension:
        last-update: Mon, 04 Mar 2024 11:40:37 CET
        provider: minikube.sigs.k8s.io
        version: v1.32.0
      name: context_info
    namespace: default
    user: minikube
  name: minikube
current-context: minikube
kind: Config
preferences: {}
users:
- name: minikube
  user:
    client-certificate: /home/pabloqpacin/.minikube/profiles/minikube/client.crt
    client-key: /home/pabloqpacin/.minikube/profiles/minikube/client.key
```
```bash
# Comandos de ejemplo
kubectl config set-credentials myself --username=admin --password=secret
kubectl config set-cluster local-server --server=http://localhost:8080
kubectl config set-context default-context --cluster=local-server --user=myself
kubectl config use-context default-context
kubectl config set contexts.default-context.namespace the-right-prefix
kubectl config view
```
```yaml
# Resultado con comandos de ejemplo
apiVersion: v1
clusters:
- cluster:
    server: http://localhost:8080
  name: local-server
contexts:
- context:
    cluster: local-server
    namespace: the-right-prefix
    user: myself
  name: default-context
current-context: default-context
kind: Config
preferences: {}
users:
- name: myself
  user:
    password: secret
    username: admin
```

- Ejemplo con `minikube`

```bash
bat ~/.kube/config -l yaml

minikube profile list

  minikube start --driver=docker -p desarrollo1 --nodes=2
    # kubectl is now configured to use "desarrollo1" cluster and "default" namespace by default
  minikube profile desarrollo1
  # minikube stop minikube

  grep 'current-context' ~/.kube/config && kubectl config view
  kubectl get nodes

kubectl config view
  # 2 clusters: minikube & desarrollo1
  # certificados: en prod. cada cluster tendrá el suyo
  # 2 usuarios: cada cual, su certificado
  # contextos: ... en despliegue real, los nombres serían distintos para cada compomente

  # TODO: crear namespace para cluster
```

- Ver y modificar **contexto**

```bash
kubectl config --help

kubectl config view || kubectl config view -o json
kubectl config current-context || kubectl config view | grep current

# Cambiar contexto
kubectl config use-context minikube   # or else
```
- Añadir datos cluster (modificar fichero para poder acceder al cluster)

```bash
# vim ~/.kube/config    # error-prone

# Si ya existe, lo modifica, si no lo crea
# kubectl config set-cluster cluster2 --server=https://1.2.3.4
kubectl --kubeconfig=$HOME/.kube/config_alt config set-cluster cluster2 --server=https://1.2.3.4
kubectl --kubeconfig=$HOME/.kube/config_alt config set-cluster cluster2 --certificate-authority=/tmp/cert.crt
kubectl get pods --kubeconfig=$HOME/.kube/config_alt
```

- Añadir usuarios y credenciales

> https://jamesdefabia.github.io/docs/user-guide/kubectl/kubectl_config_set-credentials/

```bash
kubectl config --kubeconfig=config_alt set-credentials usu1 --username=usu1 --password=$(echo secret | base64)
kubectl config --kubeconfig=config_alt set-credentials usu2 --client-certificate=/tmp/usercert.crt --client-key=/tmp/userkey.key
```
- Añadir contextos

```bash
kubectl config --kubeconfig=config_alt set-context context-cluster2 --cluster=cluster2 --user=usu1 --namespace=desarrollo
kubectl config --kubeconfig=config_alt use-context context-cluster2
```


<!-- ---
```bash
```
```yaml
```
```bash
``` -->

---

## 15. Crear un cluster real con Kubeadm con VMs (!)
## 16. Scheduler -- Asignar Pods a Nodos
## 17. Asignación de recursos y Autoescalado
## 18. Almacenamiento en Kubernetes
## 19. Storage Class -- almacenamiento dinámico
## 20. Otros Worklokind: Podads -- más allá de los Deployments
## 21. Sondas -- PODS monitoring
## 22. RBAC -- Seguridad en clusters
## 23. Ingress -- conectar servicios al exterior
## 24. Amazon EKS. Amazon Elastic Kubernetes
## 25. Azure AKS. Azure Kubernetes Services
## 26. Próximas secciones
## 27. Cierre y despedida



<!-- ---
---

- [@PeladoNerd: MANEJA LOS RECURSOS DE TUS PODS EN KUBERNETES - Requests y Limits](https://www.youtube.com/watch?v=xTTJg1aJ4kg)

```bash
kubectl get nodes
kubectl describe node minikube
  # Tema CPU: 200ms será 10% o else según las cores en Capacity

# $ kubectl scale --replicas=10 deployment hello
```
- [ ] servicios internos de DNS (Pods)?
---
> DNS
- [@DigitalOcean: Introducción al servicio DNS de Kubernetes](https://www.digitalocean.com/community/tutorials/an-introduction-to-the-kubernetes-dns-service-es)
- [@Kubernetes: DNS for Services and Pods](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/) -->
