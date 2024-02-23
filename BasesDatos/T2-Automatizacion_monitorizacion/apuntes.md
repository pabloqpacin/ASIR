# Unidad 2 McGrawHill <br> Automatización, optimización y monitorización

```md
# Objetivos
1. Conocer las herramientas del sistema gestor para automatizar tareas.
2. Conocer los elementos y las funciones de los guiones.
3. Conocer las herramientas para desarrollar guiones y crear funciones y procedimientos.
4. Conocer las características de un disparador y los eventos susceptibles de activarlo, para poder crearlos y activarlos.
5. Conocer la utilidad de las vistas y las herramientas, para diseñarlas y crearlas.
6. Conocer las herramientas disponibles para monitorizar y optimizar el sistema gestor de bases de datos.
7. Entender el concepto y la utilidad de los índices y crear índices en tablas y vistas.
8. Monitorizar y optimizar el funcionamiento del sistema.
```

<details>


- [Unidad 2 McGrawHill  Automatización, optimización y monitorización](#unidad-2-mcgrawhill--automatización-optimización-y-monitorización)
  - [1. Automatización de tareas](#1-automatización-de-tareas)
    - [1.1 Automatización de tareas](#11-automatización-de-tareas)
    - [1.2 Tipos de datos en MariaDB](#12-tipos-de-datos-en-mariadb)
    - [1.3 Variables definidas por el usuario en MariaDB](#13-variables-definidas-por-el-usuario-en-mariadb)
    - [1.4 Funciones](#14-funciones)
    - [1.5 Estructuras de control y bucles](#15-estructuras-de-control-y-bucles)
    - [1.6 Copias de seguridad](#16-copias-de-seguridad)
  - [2. Construcción de guiones para optimización](#2-construcción-de-guiones-para-optimización)
    - [2.1 Procedimientos almacenados](#21-procedimientos-almacenados)
    - [2.2 Disparadores o triggers](#22-disparadores-o-triggers)
    - [2.3 ~~Cursores y manejadores~~](#23-cursores-y-manejadores)
    - [2.4 Vistas](#24-vistas)
    - [2.5 Eventos](#25-eventos)
  - [3. Optimización](#3-optimización)
    - [3.1 Índices](#31-índices)
    - [3.2 Optimización del diseño de BD](#32-optimización-del-diseño-de-bd)
    - [3.3 Caché de consultas](#33-caché-de-consultas)
    - [3.4 Optimización de consultas](#34-optimización-de-consultas)
    - [3.5 Comandos de mantenimiento de tablas](#35-comandos-de-mantenimiento-de-tablas)
  - [4. Monitorización](#4-monitorización)
    - [4.1 Herramientas de monitorización](#41-herramientas-de-monitorización)
    - [4.2 Diccionario de datos](#42-diccionario-de-datos)
    - [4.3 Monitor de rendimiento](#43-monitor-de-rendimiento)
    - [4.4 Comandos `SHOW`](#44-comandos-show)
    - [4.5 Registro de errores](#45-registro-de-errores)

</details>



## 1. Automatización de tareas

```md
Administrar un SGBD es un proceso tedioso, puesto que comprende gran cantidad de tareas. Una vez que instalamos el SGBD, y lo ponemos a funcionar, es cuando realmente comienza el trabajo del administrador del SGBD. Por esto, para facilitar la labor del administrador del SGBD, todos los SGBD actuales incorporan herramientas para la automatización de tareas, creación de guiones para la administración del SGBD y herramientas de optimización y monitorización para mejorar y controlar el rendimiento del SGBD. Las herramientas para la automatización de tareas consisten en funciones, procedimientos almacenados, disparadores, cursores y eventos, que desarrollará el equipo de administradores del SGBD, de acuerdo con sus necesidades. Aunque todos los SGBD relacionales utilizan como lenguaje de manipulación de datos y lenguaje de definición de datos SQL, cada SGBD tiene su propia sintaxis y sus propios tipos de datos para desarrollar estos guiones o rutinas de administración. También es interesante recalcar que dichas sintaxis y tipos de datos no son muy diferentes de un SGBD a otro.
En este apartado, nos vamos a centrar en las tareas de automatización del SGBD.
```
<!-- tipos de dato; funciones; control y bucles; copias de seguridad -->

### 1.1 Automatización de tareas

- Herramientas de los SBGD: rutinas almacenadas o scripts: procedimientos, funciones, disparadores, cursores, eventos.

### 1.2 Tipos de datos en MariaDB
### 1.3 Variables definidas por el usuario en MariaDB
### 1.4 Funciones
### 1.5 Estructuras de control y bucles
### 1.6 Copias de seguridad

## 2. Construcción de guiones para optimización

```md

La optimización es la mayor prioridad y la principal preocupación de los administradores de sistemas gestores de bases de datos.
Como ya comenzamos a ver en el apartado anterior, una de las herramientas con las que cuenta el administrador del SGBD es la construcción de guiones o scripts. En este apartado vamos a entrar de lleno en todo lo referente a la construcción de scripts. Para ello aprenderemos a construir procedimientos almacenados, disparadores o triggers con la base de programación en MariaDB que vimos en el apartado anterior. Descubriremos qué son cursores, cómo crearlos y trabajar con ellos, y cuál es su potencia, en lo que se refiere a cómo nos pueden simplificar la tarea dentro de los procedimientos almacenados, funciones y disparadores. También analizaremos vistas y cómo crear eventos.
```

### 2.1 Procedimientos almacenados
### 2.2 Disparadores o triggers
### 2.3 ~~Cursores y manejadores~~
### 2.4 Vistas
### 2.5 Eventos

## 3. Optimización

```md
Hasta ahora hemos visto qué herramientas tenía el administrador del SGBD para poder optimizar sus tareas, y reducirlas para así gestionar el sistema más eficientemente, preservando su seguridad.

Ahora vamos a ir un paso más allá en la optimización del sistema: en este apartado veremos cómo podemos optimizar el SGBD para que sea más eficiente para los usuarios, reduciendo los tiempos de ejecución de las consultas, por ejemplo. Para ello aprenderemos a utilizar las herramientas que nos brinda el SGBD con tal fin: índices, optimización del diseño de las consultas y la caché de consultas y comandos de mantenimiento de tablas.
```

### 3.1 Índices
### 3.2 Optimización del diseño de BD
### 3.3 Caché de consultas
### 3.4 Optimización de consultas
### 3.5 Comandos de mantenimiento de tablas

## 4. Monitorización

```md
La monitorización es otra de las tareas importantes del administrador del SGBD, puesto que permite detectar problemas de rendimiento y anomalías de funcionamiento del SGBD. La monitorización debe hacerse frecuentemente, a intervalos, de forma periódica y de la manera más automatizada posible (para evitar más tareas al administrador). El hecho de ser realizada a intervalos y de forma periódica tiene el objeto de detectar cambios en los parámetros de rendimiento del servidor que se repiten periódicamente y poder ajustar el funcionamiento de este para adaptarse mejor a las necesidades en estas situaciones.

En este apartado veremos con qué herramientas cuenta el administrador de MariaDB para poder monitorizar el rendimiento del sistema. Describiremos esas herramientas, y veremos cómo utilizarlas para nuestro cometido. También realizaremos una pequeña reseña de otras herramientas de software propietario que existen para monitorizar el funcionamiento de nuestro servidor MariaDB. Y, por último, veremos el diccionario de datos y cómo podemos obtener información de él.
```

### 4.1 Herramientas de monitorización
### 4.2 Diccionario de datos
### 4.3 Monitor de rendimiento
### 4.4 Comandos `SHOW`
### 4.5 Registro de errores
