# UD1. Sistemas de almacenamiento de la información

Este módulo se centra en el estudio de las Bases de Datos y su uso en el desarrollo de aplicaciones.

- En esta *primera unidad* comenzaremos conociendo los **primeros sistemas basados en ficheros** para el  almacenamiento y gestión de la información. Después desarrollaremos los
- **conceptos y definiciones** básicas relacionadas con las bases de datos, posteriormente analizaremos sus
- **modelos y tipos**, un poco más adelante, podremos conocer las
- **características y capacidades de los sistemas gestores de bases de datos** para finalmente
- **identificar las herramientas reales** con las que llevar a cabo la gestión dichas bases.

<details>
<summary>Table of Contents</summary>

- [UD1. Sistemas de almacenamiento de la información](#ud1-sistemas-de-almacenamiento-de-la-información)
  - [1 Ficheros de información](#1-ficheros-de-información)
    - [1.1 Definición de fichero](#11-definición-de-fichero)
    - [1.2 Tipos de ficheros y formatos](#12-tipos-de-ficheros-y-formatos)
      - [1.2.1 Según su ORGANIZACIÓN](#121-según-su-organización)
      - [1.2.2 Según su CONTENIDO](#122-según-su-contenido)
      - [1.2.3 Según su TEMPORALIDAD](#123-según-su-temporalidad)
  - [2. Bases de Datos (BD)](#2-bases-de-datos-bd)
    - [2.1 Conceptos](#21-conceptos)
    - [2.2 Usos y AGENTES](#22-usos-y-agentes)
    - [2.3 Tipos de BD](#23-tipos-de-bd)
  - [3. Sistemas Gestores de BD (SGBD)](#3-sistemas-gestores-de-bd-sgbd)
    - [3.1 Funciones](#31-funciones)
    - [3.2 ~~Componentes~~^\[SGBD/Componentes: **REDO**\]](#32-componentessgbdcomponentes-redo)
      - [3.2.1 Gestor de almacenamiento](#321-gestor-de-almacenamiento)
      - [3.2.2 Procesaor de consultas](#322-procesaor-de-consultas)
</details>


## 1 Ficheros de información

### 1.1 Definición de fichero

- En los 70: archivos de papel agrupados y ordenados.
- Informatización: ficheros o archivos digitales:

```markdown
# Fichero o archivo
Conjunto de datos relacionados entre sí,
organizados de forma estructurada.
Es una secuencia de dígitos binarios
que organiza información relacionada con un mismo aspecto.
```

### 1.2 Tipos de ficheros y formatos

- El **tipo y formato** de un fichero determina la *forma de interpretar* la información que contiene.
- En tanto que lo único que se almacena realmente en él es una **secuencia de bits** (ceros y unos), es necesaria su interpretación para dar sentido a la 
información almacenada.
- Los ficheros pueden ser clasificados de varias formas, según la función que vayan a desempeñar:

```markdown
# ORGANIZACIÓN
1. Secuenciales
2. De acceso directo
3. Indexados
# CONTENIDO
1. De texto: configuración, código fuente, páginas web...
2. Binarios: de imagen, vídeo, comprimidos, ejecutables...
# TEMPORALIDAD
1. Permanentes: maestros, constantes, históricos.
2. Temporales: intermedios, de maniobras, de resultados.
```

#### 1.2.1 Según su ORGANIZACIÓN
1. **Ficheros secuenciales**

Sus datos están dispuestos siguiendo una secuencia ordenada (unos detrás de otros). Para llegar a uno en concreto hay que recorrer todos los anteriores.

2. **Ficheros de acceso directo**

Permiten acceder a un dato concreto sin tener que acceder a los anteriores a él.

3. **Ficheros indexados**

Acceden a los datos consultando un *índice*, una estructura de datos que permite acceder a la información rápidamente.

#### 1.2.2 Según su CONTENIDO

1. **Ficheros de texto**

También llamados ficheros planos o *ASCII*. Sus bits son traducidos directametne a caracteres alfanuméricos (por el sistema operativo).

Aunque no necesitan un formato para ser interpretados, suelen tener diferentes extensiones para conocer qué tipo de texto contienen. Por ejemplo:
- **Ficheros de configuración**: contienen configuraciones del sistema operativo o de alguna aplicación (`.ini`, `.inf`, `.conf`)
- **Ficheros de código fuente**: contienen texto con programas informáticos (`.sql`, `.c`, `.java`)
- **Ficheros de páginas web**: contienen texto que interpreta el navegador (`.html`, `.php`, `.css`, `.xml`)
- **Ficheros enriquecidos**: contienen códigos de control para ofrecer una visión del texto más elegante (`.rtf`, `.ps`)

2. **Ficheros binarios**

Son aquellos que no son de texto. Sus bits deben ser tratados como componentes de datos más complejos. Algunos tipos de formatos de ficheros binarios son:
- **De imagen**: `.jpg`, `.gif`...
- **De vídeo**: `.avi`, `.mov`...
- **Comprimidos**: `.zip`, `.tar`...
- **Ejecutables/compliados**: `.exe`...
- **Procesadores de texto**: `.doc`, `.odt`...

#### 1.2.3 Según su TEMPORALIDAD

1. **Ficheros permanentes**

Contienen información relevante para el funcionamiento de una aplicación. Tienen un amplio periodo de permanencia. Se subdividen en:
- **Ficheros maestros**

Contienen el estado actual de los datos que pueden modificarse desde la aplicación. Es la parte central de la aplicación, el núcleo. Eg. un archivo con los datos de los usuarios de una aplicación de mensajería instantáne.

- **Ficheros constantes**:

Incluyen datos fijos para la aplicación. No suelen ser modificados y se accede a ellos para realizar consultas Eg. un archivo con los nombres de las provincias de España.

- **Ficheros históricos**:

Contienen datos que fueron actuales en un periodo anterior. Se utilizan para la reconstrucción de escenarios. Eg. un archivo con los usuarios dados de baja en la aplicación de mensajería.

2. **Ficheros temporales**

Almacenan información útil para una parte de la aplicación. Tienen un *corto periodo de existencia*. Se subdividen en:

- **Ficheros intermedios**: almacenan resultados de una aplicación que serán utilizados por otra.
- **Ficheros de maniobras**: almacenan datos que no pueden ser mantenidos por la memoria principal por falta de espacio.
- **Ficheros de resultados**: almacenan datos que van a ser transferidos a un dispositivo de salida.

## 2. Bases de Datos (BD)

Distinguen tres ámbitos diferenciados y fuertemente interrelacionados: la realidad, su conceptualización y su representación informática. Tres "mundos":

- **Mundo real**: objetos (materiales o no) de la realidad que nos interesan y con los que tendremos que trabajar.
- **Mundo conceptual**: conjunto de conocimienots o informaciones obtenidos gracias a la observación del mundo real que nos interesa. Un mismo *mundo real* puede dar lugar a diferentes *mundos conceptuales*, en función del modo de percibir la realidad o los intereses del observador de ésta. 
- **Mundo de las representaciones**: aquellas representaciones informáticas, o datos, del mundo conceptual, necesarias para poder trabajar.

### 2.1 Conceptos

Una BD es un conjunto de **datos** que pertenecen a un mismo contexto y están relacionados entre sí. Dichos **datos** son *representaciones informáticas* de la información disponible, relativa a los objetos del *mundo real*.

Conceptos básicos para el diseño de bases de datos:
- **Datos**: hechos conocidos que pueden registrarse y tienen un significado
- **Entidad**: aquello sobre lo que se guardan datos
- **Relación**: posible dependencia entre dos *entidades* 
- **Metadatos**: información acerca de los datos presentes en la base de datos
- **Tabla**: conjunto de filas y columnas (!) bajo un mismo nombre que representa el conjunto de valores almacenados para una serie de datos
- **Campo**: cada uno de los datos que se almacena de una entidad; *columnas de una tabla*
- **Campo clave/clave primaria**: campo que identifica unívocamente al conjunto de datos o entidad
- **Registro**: cada una de las *filas* de la tabla (ie *tuplas*) 
- **Tipo de dato**: indica la naturaleza del campo (datos numéricos, alfanuméricos, fechas...)
- **Consulta**: instrucción para hacer peticiones a una BD
- **Índice**: estructura que almacena los camops clave de uan tabla
- **Vista**: tabla virtual (no almacenada) que contiene *el resultado de una consulta de una o varias tablas. No se almacena la vista, pero sí su definición*
- **Informe**: listado ordenado de los campos y registros seleccionados (formato fácil de leer)
- **Guiones o scripts**: instrucciones que, ejecutadas de forma ordenada, realizan operaciones avanzadas o mantenimiento de los datos de una BD
- **Procedimientos**: tipo especial de *script* almacenado en la BD y que forma parte de su esquema

### 2.2 Usos y AGENTES

Ejemplos frecuentes:
- BD administrativas
- BD contables
- BD para motores de búsqueda
- BD científicas
- BD de configuración
- bibliotecas
- censos

4 tipos de personas que pueden hacer uso de las bases de datos:

1. **Administrador (BDA)**
   - Persona encargada de la creación o implementación *física* de la base de datos
   - Escoge los tipos de ficheros, los índices y su ubicación,
   - Toma las decisiones relacionadas con el funcionamiento *físico* del almacenamiento de información, y 
   - Establece la política de seguridad y de acceso para garantizar el menor número de problemas.
2. **Diseñadores**
   - Personas encargadas de diseñar cómo será la base de datos, llevando a cabo la identificación de los datos, las relaciones, las  restricciones, etc.
   - Han de conocer a fondo los datos y procesos a representar.
   - Para obtener un buen resultado, deben implicar en el proceso a los usuarios tan pronto como sea posible.
3. **Programadores**
   -  Personas que se encargarán de implementar los programas de aplicación que servirán a los usuarios finales para realizar consultas de datos, inserción, actualización o eliminación de los mismos.
4. **Usuarios**: clientes finales de la base de datos


### 2.3 Tipos de BD

- **Generación 0** (50s): aplicaciones basadas en sistemas de ficheros (ie.  cintas magnéticas *secuenciales*)
- **BD jerárquicas** & **BD en red** (60s): cintas magnéticas (*de acceso directo*)
- **BD relacionales** (70s, *Codd*): lógica de predicados y teoría de conjuntos
- **SQL - Structured Query Language** (80s, IBM): lenguaje de consultas para manipular BD relacionales
- **BD paralelas** (90s, IBM): varios servidores via DB2
- **BD orientadas a objetos** (90s, IBM-Oracle): se almacenan colecciones de objetos, en lugar de relaciones y tablas
- **BD distribuidas**: multiplican los servidores que controlan una BD (nodos), intercambiando información y actualizaciones via web

## 3. Sistemas Gestores de BD (SGBD)

- Software cuyos objetivos son la gestión y control de las BD
- Aplicación que permite a los usuarios diseñar, crear y mantener una base de datos, y acceder a la información de forma controlada

### 3.1 Funciones

- Permite *definir* la BD mediante el **Data Description Language (DDL)**, especificando la estrucutra, el tipo de los datos y restricciones sobre los datos
- Permite la inserción, consulta, actualización y eliminación de los *datos* mediante el **Data Manipulation Language (DML)**
- Proporciona acceso controlado a la base de datos mediante sistemas de:
  - *seguridad* mediante el **Data Control Language (DCL)** (auth)
  - *integridad* para la consistencia e integridad de los datos
  - *control de recuperación* para recuperar datos en caso de fallo de hardware o software
  - *diccionario de datos* o catálogo, acesible para el usuario y que contiene la descripción de los datos almacenados
  - *encriptado*, almacenando la información mediante códigos secretos

```markdown
# Interfaz de programación
- La principal herramienta de un SGBD es la interfaz de programación con el usuario.
- Esta interfaz es un lenguaje muy sencillo mediante el cual el usuario interactúa con el servidor.
- Este lenguaje se denomina comúnmente SQL y está estandarizado por la ISO, es decir, todas las bases de datos que soporten SQL deben tener la misma sintaxis a la hora de aplicar el lenguaje.
```


### 3.2 ~~Componentes~~^[SGBD/Componentes: **REDO**]





#### 3.2.1 Gestor de almacenamiento

#### 3.2.2 Procesaor de consultas