# AppsWeb UD1: Servidores de aplicaciones web


- [AppsWeb UD1: Servidores de aplicaciones web](#appsweb-ud1-servidores-de-aplicaciones-web)
  - [TEORÍA](#teoría)
  - [PRÁCTICA](#práctica)
    - [foo](#foo)
    - [bar](#bar)
    - [McGrawHill](#mcgrawhill)
      - [Caso práctico 1 -- XQ webapps](#caso-práctico-1----xq-webapps)
      - [Ponte a prueba 1 -- navegador preferido](#ponte-a-prueba-1----navegador-preferido)
      - [Ejercicios 1 -- test](#ejercicios-1----test)
      - [Caso práctico 2 -- Bitnami WAMP](#caso-práctico-2----bitnami-wamp)
      - [Ponte a prueba 2 -- Bitnami stack en VM](#ponte-a-prueba-2----bitnami-stack-en-vm)
      - [(!) Estudio de caso -- Usuario www-data para lamp-server^](#-estudio-de-caso----usuario-www-data-para-lamp-server)
      - [Ejercicios x -- test](#ejercicios-x----test)
      - [(!) Caso práctico 3 -- paneles de control](#-caso-práctico-3----paneles-de-control)
      - [Ponte a prueba 3 -- proveedor hosting](#ponte-a-prueba-3----proveedor-hosting)
      - [(!!!) Estudio de caso -- hosting gratis](#-estudio-de-caso----hosting-gratis)
      - [Ejercicios x -- test](#ejercicios-x----test-1)
  - [QUIZ](#quiz)


## TEORÍA

> apuntes.md

## PRÁCTICA

### foo
### bar
### McGrawHill


#### Caso práctico 1 -- XQ webapps

- ¿Por qué crear aplicaciones web frente a otros tipos de aplicaciones?
  - Requieren un equipo ligero con hardware más económico y estándar.
  - No tenemos que estar atados a un fabricante concreto como pasa en las de consola.
  - Funcionan con un cliente ligero preinstalado que es un simple navegador web.
  - El navegador es fácil de actualizar a la última versión desde el propio cliente.
  - Nuestra información esta centralizada y no aparecerán datos duplicados.
  - Podremos escalar nuestros servidores en vertical u horizontal.
  - Podremos balancear la carga o incluso utilizar los servicios de computación en la nube.
  - Podremos centrar todos los esfuerzos de ciberseguridad en nuestros servidores.
  - Podremos hacer copias de seguridad e incluso disponer de equipos de respaldo.

#### Ponte a prueba 1 -- navegador preferido

- ¿Cuál es mi navegador web preferido? <br> Todos tenemos nuestras preferencias a la hora de usar un navegador web u otro. Pero ¿qué criterio técnico utilizamos para elegirlo? <br> Crea una tabla de tu navegador respecto al cumplimiento del estándar de HTML5, CSS3 y JavaScript, entre otros.

> Brave (Chromium)

```md
Existen test estándar para validar las funcionalidades de los navegadores. Prueba estos:
·    Test ACID 3: http://acid3.acidtests.org 
·    Test HTML5: http://html5test.com 
·    Test de CSS3: https://css3test.com 
·    Test de JavaScript: https://webkit.org/perf/sunspider/sunspider.html 
·    Test de carga web: http://www.atc.uniovi.es/atc/3iccp/2011/trabajos/navegadores/CargaWeb.html 
¿Conoces algún test más que pueda mejorar el análisis técnico del navegador web?
```

#### Ejercicios 1 -- test

1. Indica cuáles de las siguientes afirmaciones son verdaderas respecto a las aplicaciones web:
   - Las tecnologías propietarias de IBM o Adobe aún mantienen su parcela del mercado.
   - El estándar HTML5 ha cambiado las reglas de juego convirtiéndose en el ganador al ser el más usado actualmente.
2. La tecnología Flash de Adobe sigue dominando el mercado de las aplicaciones web: **FALSO**
3. Los cinco grandes de Internet, denominados GAFAM, han apostado por el HTML5: **VERDADERO**
4. Las aplicaciones web interactivas mantienen una comunicación fluida entre cliente y servidor: **VERDADERO**
5. Las primeras en surgir fueron las aplicaciones **de consola**, que utilizan una arquitectura cliente-servidor como las aplicaciones **web**. Las aplicaciones **de escritorio** son las que se usan para editar vídeo, crear animaciones 3D u otros usos que requieran mayor nivel de cómputo y, por tanto, mayores prestaciones de hardware.

#### Caso práctico 2 -- Bitnami WAMP

```md
Bitnami es una empresa que ofrece un catálogo de aplicaciones web de código libre que pueden ser instaladas de forma muy sencilla en múltiples entornos. Fue creada en 2004 por el ingeniero sevillano Daniel López Ridruejo. En 2019, fue adquirida por la multinacional VMWare que, como ellos se identifican, son «un proveedor líder en servicios multinube para todas las aplicaciones, lo que hace posible la innovación digital con control empresarial».
Para los desarrolladores de aplicaciones web, el despliegue y la gestión del servidor donde van a realizar sus desarrollos es un paso tedioso y al que dedican mucho de su valioso tiempo.
Bitnami facilita desplegar y gestionar aplicaciones web al proporcionar un entorno fiable, sencillo de instalar y usar, que puedes instalar en tu equipo directamente o a través de máquinas virtuales, así como en plataformas en la nube como S3 de Amazon.
Vamos a descargar la última versión de Bitnami WAMP; lo instalaremos y ejecutaremos por primera vez, teniendo en cuenta la carpeta donde se ha instalado todo por defecto: C:\Bitnami\wampstack, con el número de la versión que hayas descargado.
```

```yaml
# https://bitnami.com/stacks
WAMP:
  Servicios:
    - Apache
    - MariaDB
  phpMyAdmin: ...

```

#### Ponte a prueba 2 -- Bitnami stack en VM

- Investiga qué stack de Bitnami podemos utilizar desde máquinas virtuales <br> Si queremos optimizar nuestro tiempo, puede que nos interese utilizar una máquina virtual preinstalada con el stack sobre un determinado sistema operativo para empezar a trabajar.
  - ...

#### (!) Estudio de caso -- Usuario www-data para lamp-server^

> TODO: ...

#### Ejercicios x -- test

1. Indica cuáles de las siguientes afirmaciones son verdaderas respecto a xAMP:
   - WAMP en Windows
   - LAMP en Linux 
2. Las aplicaciones web híbridas tienen una única parte, son monolíticas: **FALSO**
3. Las aplicaciones web en producción pueden estar desplegadas en dos o en tres capas: **VERDADERO**
4. Según **el tamaño**, podemos indicar si son Fat o Thin cada uno de los extremos. Según **la naturaleza**, tenemos diferentes tipos de servidores. Y según **el reparto de funciones**, entre cliente y servidor deberán gestionar y distribuir las responsabilidades.
5. ¿Por qué etapas pueden pasar las aplicaciones web? **Desarrollo, pruebas, preproducción, producción**


#### (!) Caso práctico 3 -- paneles de control

- Los paneles de control <br> Investiga cuáles son los paneles de control más utilizados por los proveedores de hosting web.

> Existen muchos paneles de control, aunque los más utilizados actualmente suelen ser: **cPanel**, que es el que más se ha empleado históricamente, y **Plesk**, que ahora es muy común entre los proveedores de alojamiento web.


#### Ponte a prueba 3 -- proveedor hosting

- ¿Qué proveedor de hosting contratar? <br> El CEO de la startup donde estás trabajando te ha pedido que le hagas un informe de cuáles son las mejores opciones para contratar un espacio de hosting para publicar la aplicación web que estáis desarrollando.
  - ...

#### (!!!) Estudio de caso -- hosting gratis

> ***https://pabloqpacin.000webhostapp.com***

> TODO: video

#### Ejercicios x -- test

1. Indica cuáles de las siguientes afirmaciones son verdaderas respecto al cloud computing: **...**
2. Ninguno de los proveedores de hosting ha migrado sus servicios a la nube: **FALSO**
3. Los proveedores de hosting nos ofrecen soluciones PaaS o IaaS para nuestro espacio web: **VERDADERO**
4. Los principales proveedores de servicios en la nube son AWS, Microsoft Azure y Google Cloud, entre otros: **VERDADERO**
5. El siglo pasado, antes de empezar a utilizar la computación en la nube, manteníamos nuestros recursos de computación **in-house**. Luego algunos clientes se atrevieron a empezar a migrar a máquinas virtuales que podían gestionar completamente con estos proveedores de la nube con su servicio **IaaS**. Después estos dieron un paso más ofreciendo pagar solo por los recursos que se utilizaban con su servicio **PaaS**. El último paso es delegar todas las tareas al proveedor de la nube para centrarnos solo en el nivel de aplicación con el **SaaS**, que ha supuesto cambiar la tendencia para confiar en estos servicios de computación en la nube para todo.


## QUIZ
