# Unidad 2 McGrawHill <br> Servicio de Nombres de Dominio (DNS)

```md
# Objetivos de aprendizaje
1. Conocer qué aporta el servicio DNS a Internet.
2. Aprender los pasos que se dan para resolver un nombre.
3. Entender cómo se organiza la información de la base de datos DNS.
4. Instalar, configurar y administrar los servidores.
5. Descubrir las diferentes opciones del servicio dinámico de DNS.
```

- [Unidad 2 McGrawHill  Servicio de Nombres de Dominio (DNS)](#unidad-2-mcgrawhill--servicio-de-nombres-de-dominio-dns)
  - [1. El servicio DNS](#1-el-servicio-dns)
    - [1.1 Espacio de nombres de dominio](#11-espacio-de-nombres-de-dominio)
    - [1.2 Dominios por niveles](#12-dominios-por-niveles)
      - [1.2.1 Dominio raíz](#121-dominio-raíz)
      - [1.2.2 Dominios de primer nivel](#122-dominios-de-primer-nivel)
      - [1.2.3 Dominios de segundo nivel](#123-dominios-de-segundo-nivel)
      - [1.2.1 Subdominios](#121-subdominios)
    - [1.3 Tipos de dominio](#13-tipos-de-dominio)
  - [2. Resolutores de nombres](#2-resolutores-de-nombres)
  - [3. Base de datos DNS](#3-base-de-datos-dns)
  - [4. Instalación, configuración y administración de servidores](#4-instalación-configuración-y-administración-de-servidores)
  - [5. DDNS](#5-ddns)


## 1. El servicio DNS

```md
DNS o sistema de nombres de dominio (domain name system) es un protocolo de nivel de aplicación de la familia de protocolos TCP/IP que establece las normas de funcionamiento de un servicio de nombres jerárquico basado en dominios.
En 1983, Paul Mockapetris publicó los primeros documentos de solicitud de comentarios relacionados con los nombres de dominio, los RFC (Request for Comments) 882 y 883. No obstante, fue en 1987, con el RFC 1034 y el RFC 1035, cuando se definió lo que hoy conocemos como servicio DNS, que ha sido actualizado con varios documentos RFC que forman las especificaciones actuales del DNS.
El protocolo DNS establece que, dentro de una red (y, por tanto, dentro de Internet también), puede haber varios servidores DNS que prestan el servicio de resolución de nombres DNS para obtener la dirección IP de un equipo a partir de su nombre DNS. Un servidor no tiene por qué resolver todos los nombres de la red. 
Pasemos a ver cómo se ha estructurado el protocolo DNS.
```

- DNS: administración de los **nombres de dominio (NDD)** == servicio de resolución o traducción de IPs correspondientes -- servicio distribuido entre todos los servidores DNS de la red de redes basada en TCP/IP
- En redes TCP/IP: máquinas <u>se identifican según dirección de red o número IP (versión 4 o 6)</u>; pero para las personas, **NOMBRES estáticos** simbólicos
- Necesario traducir 'nombres de máquina de los dominios a direcciones IP únicas para localizar el servidor donde reside un sitio web' == servicio DNS
- **Dominio o nombre**: identifica un sitio web, único en Internet; e.g. 'www.mheducation.es'
- Elementos:
  - organizaicón jerárquica de dominios y subdominios
  - dominio tiene nombre -- todos los miembros de organización comparten ese nombre
  - dominio puede albergar subdominios -- mejor organización
  - cada servidor DNS pueden gestionar 1 o más zonas
  - 'en cada zona disponemos de la información necesaria paa resolver los nombres de las máquinas de tantos dominios como necesitemos, pero al menos de uno'

### 1.1 Espacio de nombres de dominio

- Servicio == baseDatos distribuida WWW == asociaciones de NDD y sus direcciones IP
- ... árboles y subárboles ... == `máquina.subdominio.subdominio...dominio`

### 1.2 Dominios por niveles

#### 1.2.1 Dominio raíz
#### 1.2.2 Dominios de primer nivel
#### 1.2.3 Dominios de segundo nivel
#### 1.2.1 Subdominios 

### 1.3 Tipos de dominio


## 2. Resolutores de nombres
## 3. Base de datos DNS
## 4. Instalación, configuración y administración de servidores
## 5. DDNS