# UD1 Seguridad: Introducción a la Seguridad Informática

- [UD1 Seguridad: Introducción a la Seguridad Informática](#ud1-seguridad-introducción-a-la-seguridad-informática)
  - [TEORÍA](#teoría)
  - [PRÁCTICA](#práctica)
    - [MCGrawHill](#mcgrawhill)
      - [1](#1)
        - [Caso práctico 1 -- Mecanismos de seguridad](#caso-práctico-1----mecanismos-de-seguridad)
        - [Ponte a prueba 1 -- Estudio de la autenticación](#ponte-a-prueba-1----estudio-de-la-autenticación)
        - [Estudio de caso -- `zenmap`](#estudio-de-caso----zenmap)
        - [Ejercicios x -- test](#ejercicios-x----test)
      - [2](#2)
        - [Caso práctico 2 -- `nmap`](#caso-práctico-2----nmap)
        - [Ponte a prueba 2 -- CONAN](#ponte-a-prueba-2----conan)
        - [Estudio de caso -- Nessus](#estudio-de-caso----nessus)
        - [Ejercicios x -- test](#ejercicios-x----test-1)
      - [3](#3)
        - [Caso práctico 3 -- Estudio de las amenazas](#caso-práctico-3----estudio-de-las-amenazas)
        - [Ponte a prueba 3 -- Escaneo online](#ponte-a-prueba-3----escaneo-online)
        - [Ejercicios 3 -- test](#ejercicios-3----test)
      - [4](#4)
        - [Caso práctico 4 -- PhotoRec TestDisk](#caso-práctico-4----photorec-testdisk)
        - [Ponte a prueba 4 -- `tar`](#ponte-a-prueba-4----tar)
        - [Estudio de caso -- `rsnapshot`](#estudio-de-caso----rsnapshot)
        - [Ejercicios 4 -- test (**OJO**)](#ejercicios-4----test-ojo)
      - [5](#5)
        - [Caso práctico 5 -- PSI En SGSI (`ISO 27001`)](#caso-práctico-5----psi-en-sgsi-iso-27001)
        - [Ponte a prueba 5 -- PSI](#ponte-a-prueba-5----psi)
        - [Ejercicios 5 -- test](#ejercicios-5----test)
  - [QUIZ](#quiz)


## TEORÍA

> apuntes.md

- Contenido del profesor
  - [@DLTCode en RTVE](https://www.linkedin.com/posts/dlt-code_emprende-ciberseguridad-ciberdelincuentes-activity-7117388324465500160-2rPF)
  - [incibe.es](https://incibe.es)
  - [Cyberwall Academy](https://c1b3rwall.policia.es/)

## PRÁCTICA

### MCGrawHill

#### 1

##### Caso práctico 1 -- Mecanismos de seguridad

```md
**Introducción**
El punto 1.5 del apartado hace una descripción de diferentes mecanismos de seguridad con objetivos muy concretos. Se habla de autenticación, autorización, administración, auditoría, registro, etc. Cada uno de ellos implica el uso de determinadas herramientas que garanticen la seguridad que pretenden preservar. Ahora proponemos algo diferente: vamos a centrarnos en objetivos más genéricos.

**Enunciado**
Se pide que el alumnado intente realizar una clasificación de los mecanismos de seguridad atendiendo a su función, que podrán incluir uno o varios de los mecanismos descritos en el apartado o incorporar otros nuevos. Es una tarea de investigación, reflexión y síntesis.
```
```md
**Solución**
Los mecanismos de seguridad en base a su función se pueden clasificar en tres grandes grupos:
 
1. Preventivos
Los mecanismos de seguridad preventivos son todas aquellas acciones que van encaminadas a prevenir cualquier amenaza a la confidencialidad, la integridad y la disponibilidad de los elementos importantes del sistema. 
Actúan antes de que el incidente de seguridad se produzca y su función consiste en ‘detener o disuadir’ a los agentes causantes. Dentro de este grupo están los siguientes:
- Mecanismos de autenticación e identificación.
- Mecanismos de control de acceso.
- Mecanismos de seguridad en las comunicaciones.
- Criptografía de clave pública.
- Certificados digitales.

2. Detectivos
Actúan antes de que el incidente de seguridad se produzca y su función consiste en ‘revelar o descubrir’ la presencia de agentes no deseados en el sistema. Son mecanismos defensivos. Dentro de este grupo se encuentran los sistemas de detección de intrusiones o IDS. Estos sistemas constan de elementos de escucha y análisis de la información que circula por la red e intentan identificar posibles ataques. Este tipo de mecanismo se estudiará más adelante.

3. Correctivos
Actúan después de que el incidente de seguridad se produzca y su función consiste en ‘corregir o mitigar’ las consecuencias. Estos mecanismos se encargan de poner solución a los posibles daños causados por un ataque, intentando recuperar el estado del sistema antes de que se produjese dicho ataque. Dentro de este grupo se encuentran las copias de seguridad, ya estudiadas en el módulo ISO del primer curso.
```

##### Ponte a prueba 1 -- Estudio de la autenticación

```md
**Estudio de la autenticación**
Se pide que el alumnado lea y analice el documento “Los siete métodos de autenticación más utilizados” y elabore un pequeño resumen.  En concreto, se pide diferenciar entre autenticación e identificación del usuario. El archivo está disponible en https://www.evidian.com/pdf/wp-strongauth-es.pdf. 


```

##### Estudio de caso -- `zenmap`

> - [ ] ojísimo

##### Ejercicios x -- test

1. De los siguientes, indicar cuál es el activo más importante de una empresa: **los datos**
2. Indicar cuál de las siguientes afirmaciones es correcta: **La seguridad informática se engloba dentro de la seguridad de la información.**
3. En relación al ciclo de Deming, indicar la afirmación correcta: **Consiste en planificar, hacer, verificar y actuar.**
4. Respecto a las bases de la seguridad informática, indicar cuál de las siguientes afirmaciones es correcta: **La confidencialidad protege de la divulgación indiscriminada de la información.**
5. Indicar cuál de los siguientes no es un mecanismo de autenticación del usuario: **Lo que el usuario hace.**


#### 2

##### Caso práctico 2 -- `nmap`

Escribir las órdenes nmap para obtener los siguientes datos:

1. Realizar un escaneo de puertos con detección del sistema operativo para la IP  108.177.127.94.

```bash
sudo nmap -O 108.177.127.94
```

2. Realizar un sondeo básico para puertos UDP de la IP 108.177.127.94.

```bash
sudo nmap -sU 108.177.127.94
```

3. Realizar un sondeo silencioso (SYN) de la IP 108.177.127.94.

```bash
sudo nmap -sS 108.177.127.94
```

4. Realizar un sondeo silencioso a toda una red con detección del sistema operativo.

```bash
nmap -sS -O 192.168.1.0/24
```

5. Realizar un sondeo silencioso al host 74.125.230.216 con detección de los puertos (-p) 25 y 53, enmascarando el origen de la exploración (-D) con la IP 108.177.127.94.

```bash
nmap -Pn -p 25,53 -D 108.177.127.94 74.125.230.216
```

<!-- Para realizar la tarea es imprescindible estudiar el documento nmap.pdf, incluido en la sección Material de trabajo/Descarga de documentos, situada al final de la unidad. -->


##### Ponte a prueba 2 -- CONAN

```md
Comprueba las vulnerabilidades de tu móvil con CONAN

**Introducción**
CONAN es una herramienta gratuita de análisis de la configuración del sistema para sistemas Android creada por el INCIBE (Instituto Nacional de Ciberseguridad).
Entre otras funcionalidades, CONAN Mobile te indica si tienes instalada alguna aplicación maliciosa, verifica si tienes las aplicaciones correctamente actualizadas y comprueba si la configuración de tu dispositivo es correcta. Y todo ello, en una única herramienta: CONAN Mobile, que es una aplicación de comprobación integral de seguridad para teléfono y tableta Android.

**Enunciado**
- Descarga la herramienta desde Google Store e instálala en tu teléfono o tableta con Android.
- Realiza un ejemplo de análisis de vulnerabilidades. Observa la parte resumen del informe generado. ¿Tienes alguna vulnerabilidad?
```
##### Estudio de caso -- Nessus

> - [ ] TODO

```bash
# ...

sudo netstat -atunp | grep nessus

sudo /opt/nessus/sbin/nessuscli adduser
# ...

xdg-open http://localhost:8834 || xdg-open https://localhost:8834
```

##### Ejercicios x -- test

1. La posibilidad de que se materialice o no una amenaza es: **Una definición de riesgo**
2. Un análisis de las vulnerabilidades del sistema: **Es la valoración que el impacto de un ataque causaría.**
3. En un análisis de las vulnerabilidades del sistema: **Se valoran las posibles amenazas.** 
4. En relación a un sistema informático (SI): **Aunque no haya vulnerabilidades sigue habiendo amenazas.**
5. Indica cuál es la opción falsa de las siguientes afirmaciones: **Riesgo para un sistema informático es lo mismo que amenaza.**


#### 3

##### Caso práctico 3 -- Estudio de las amenazas

```md
**Introducción**
Las amenazas más comunes están estrechamente relacionadas con el tipo de uso que se hace del sistema informático. En la actualidad, la gran mayoría de los usuarios utilizan los sistemas informáticos para conectarse a redes sociales y  estas son un foco de infección para todos los sistemas que intervienen.
La lista siguiente ilustra algunas de las principales amenazas contra las que los creadores de soluciones de seguridad están trabajando:
1. Uso indebido de las redes sociales (servicios de abreviación de URL, servicios de geolocalización, etc.).
2. Uso de dispositivos móviles en entornos empresariales.
3. Imitación de la legitimidad: Koobface.
4. Redes zombis: Botnet.

**Enunciado**
Se pide que el alumnado realice una tarea de búsqueda de información sobre las amenazas indicadas y haga un breve resumen de cada una de ellas.
```
```md
**Solución**

**Paso 1. Uso indebido de las redes sociales**
El auge de las redes sociales es tal que hoy en día casi todos los usuarios de productos informáticos están o han estado presentes en algún tipo de red social. En muchas ocasiones, las direcciones URL empleadas son demasiado largas y dejan poco espacio para escribir la información que se quiere intercambiar. Para solucionar esto, en muchos portales se ofrece el **servicio de abreviación de URL**. Con este servicio se puede convertir una dirección larga en otra más corta y más fácil de manejar. Las siguientes son webs que ofrecen este servicio:
- https://acortar.link/
- https://cutt.ly/es
- https://bitly.com/
- https://tiny.cc/

Estas direcciones son equivalentes; se pueden utilizar indistintamente porque llevan al mismo sitio. La amenaza de este tipo de servicios consiste en que al traducir las URL originales, puede haber un ataque que convierta la dirección resumida en una dirección de un sitio web con contenidos maliciosos no deseados.

El poder introducir más caracteres hace que este tipo de servicio sea atractivo para el usuario y, al tiempo, para los desarrolladores de malware, porque ven en él un hueco para poder captar información, sobre todo en las redes sociales.

La **geolocalización** utilizada tanto en redes sociales como en dispositivos móviles, dependiendo del dispositivo y de los servicios disponibles, utiliza una combinación de red de telefonía, Wi-Fi y GPS para averiguar dónde se encuentra una persona, qué redes sociales utiliza, cuáles son sus intereses y qué sistema operativo y aplicaciones usa.
Los usuarios que publican información con estos servicios, sin analizar con  quiénes la comparten, están expuestos a una doble amenaza: ser víctimas de delitos informáticos y de ataques físicos.

**Paso 2. Uso de dispositivos móviles en entornos empresariales**
Otro agujero de seguridad derivado del uso de estos dispositivos lo constituye la conexión a Internet utilizando la red del lugar de trabajo. Con esta práctica se pueden mostrar datos que hagan peligrar la seguridad de la red. 
Visitar el enlace siguiente en el que se detallan los riesgos asociados a esta práctica tan generalizada. https://softwarecontrolempleados.com/navegar-por-internet-en-el-trabajo/ 

**Paso 3. Imitación de la legitimidad**
Los mensajes atractivos imitando la legitimidad entre usuarios que son confiables, en el caso de las redes sociales o entre amigos, pueden llevar consigo un malware como el Koobface,  que puede robar datos personales del usuario infectado. Estos mensajes suelen llevar como asunto alguna noticia conocida, de actualidad o muy atractiva.
Visitar el enlace siguiente en el que se explica en qué consiste el gusano Koobface, cómo infecta y cuáles son los riesgos que conlleva. https://protecciondatos-lopd.com/empresas/koobface/

**Paso 4. Redes zombis o Botnet**
Las redes zombis, o Botnet, son equipos infectados por un malware que permite a los creadores manejarlos a distancia sin que los propietarios se den cuenta. Los equipos infectados se manejan como una red utilizando un software llamado bot. La infección se lleva a cabo a través de envíos de spam ofreciendo vídeos o descargas de archivos en los que se pide que se descargue además un códec especial para poder utilizarlo.
Las direcciones de origen de estos ataques son las de los equipos infectados, que no se corresponden con el causante del daño. Cuando las autoridades investigan el origen de dicho ataque, lo que van a encontrar son víctimas que no sabían lo que sus equipos estaban realizando.
Se recomienda consultar la *guia_glosario_ciberseguridad_2021.pdf* del INCIBE (ver enlace en la webgrafía de esta unidad, situada en la sección Material de trabajo/Descarga de documentos), para conocer una definición oficial. 
En el portal de la *Oficina de Seguridad del Internauta* (http://OSI.es) se puede realizar una búsqueda similar a “identificar todas las webs en las que hay redes zombis o botnet“ para conocer las diferentes botnet activas en la actualidad: https://www.osi.es/es/search/node/identificar%20todos%20web%20en%20que%20hay%20redes%20zombies%20o%20botnet.
```
##### Ponte a prueba 3 -- Escaneo online

```md
**Introducción**
Existen páginas webs dedicadas a la exploración remota de puertos. De forma automática, desde estas páginas pueden indicarnos cuál es nuestra IP y cuáles son los puertos que tiene nuestro equipo abierto. Entre ellas tenemos:
- https://www.testdevelocidad.es/test-de-puertos
- https://www.internautas.org/w-scanonline.php
- https://free.proxy-sale.com/es/skaner-portov

**Enunciado**
1. Realiza un escaneo remoto de los puertos de tu equipo utilizando las páginas indicadas. Adjunta capturas que muestren los resultados; una captura para cada web.
2. Si tienes algún puerto abierto que se corresponda con un servicio que no estás utilizando, por seguridad ciérralo. Accede a la interfaz de administración de tu router, localiza el puerto y ciérralo.

**Claves de resolución**
El ejercicio es muy sencillo, se trata de acceder a estas webs (o a otras con funcionalidad similar) y analizar el estado de los puertos más usuales en el router doméstico. Si no se tiene ningún equipo expuesto (servidor web o FTP) deberían estar todos cerrados.
¡¡¡OJO con los juegos en red!!! Al finalizar el juego se debe comprobar que los puertos abiertos han sido cerrados o hacerlo manualmente. Un puerto abierto en el router es un agujero de seguridad muy importante (si no se tiene controlado).
```

##### Ejercicios 3 -- test

1. Si alguien descubre la contraseña de acceso al sistema de un usuario, constituye una amenaza: **De interceptación.**
2. Indicar, de las siguientes consecuencias, cuál tiene más probabilidad de ser la materialización de una *amenaza física*: **El equipo no arranca.**
3. Las redes sociales generan un gran número de vulnerabilidades de seguridad porque: **Almacenan mucha información personal de cada usuario.**
4. Las amenazas pueden ser: **De interceptación y fabricación.**
5. Indica cuál es la opción falsa de las siguientes afirmaciones relacionadas con posibles ataques realizados a personas: **La ingeniería social es un acto tipificado como delito por la ley.**

#### 4

##### Caso práctico 4 -- PhotoRec TestDisk

```md
**Introducción**
PhotoRec (TestDisk) es una herramienta para recuperar archivos borrados en GNU/Linux y Windows.
En Windows se puede descargar desde https://www.filehorse.com/es/descargar-photorec/.
En Ubuntu está disponible en el Centro de software bajo el nombre de TestDisk y hay que instalar normalmente.

**Enunciado**
Se pide instalar la herramienta en Ubuntu y ejecutarla desde una terminal buscando archivos eliminados.

**Resolución**
> ...
```

##### Ponte a prueba 4 -- `tar`

```md
**Enunciado**
El ejercicio consiste en la utilización de un script modelo que realiza una copia de seguridad de una carpeta determinada. 
Copiar este código utilizando gedit y guardarlo como `copiatotal.sh`. 
Crear previamente el usuario ‘usuario1’ y los directorios carpeta y copia. Dentro de carpeta, incluir algunos archivos para copiar.

<!-- script -->
<!-- scp $backup/copiatotal_$fecha.tar   usuario1@IP:/home/usuario1 -->

Se pide:
1. Reproducir todos los pasos haciendo una copia de seguridad de una carpeta.
2. Realizar la restauración en una carpeta diferente, comprobando que los contenidos restaurados sean idénticos a los originales.

**Claves de resolución**
- Se recomienda repasar los comandos tar y date vistos en el módulo ISO del primer curso de ASIR.
- Utilizar el editor Gedit para copiar los comandos que componen el script.
- Recordar la definición y el uso de variables en Linux.
```

##### Estudio de caso -- `rsnapshot`

> - [ ] TODO: `rsnapshot`

##### Ejercicios 4 -- test (**OJO**)

1. El acceso a un CPD de una persona no autorizada es: **una amenaza física**
2. La diferencia entre un SAI y un grupo electrógeno es: **El grupo electrógeno es capaz de generar electricidad a partir de energía mecánica y el SAI no.**
3. De las siguientes medidas, indicar cuál es de seguridad pasiva: **Medidas de carácter preventivo.**
4. ¿En qué tipo de SAI no hay un tiempo de conmutación y las baterías están constantemente trabajando? **On line.**
5. Indicar, de las siguientes, cuál es una función del SAI: **Todas son válidas.**

#### 5

##### Caso práctico 5 -- PSI En SGSI (`ISO 27001`)

```md
**Introducción**
Hemos estudiado el ciclo de Deming, que ejemplifica cómo implementar un sistema de seguridad de la información, que conocemos como PDCA, y que se debe aplicar sobre cada uno de los objetivos que comprenden las distintas políticas de seguridad.

**Enunciado**
Se pide averiguar qué dice la norma ISO 27001 sobre las políticas de seguridad respecto a las bases sobre las que se sustenta la seguridad, así como algunas de las políticas que se deben tener en cuenta de forma especial. La norma ISO 27001 está disponible en https://normaiso27001.es/ Explicar brevemente.
```
```md
**Solución**

**Políticas de seguridad en ISO 27001**
Las políticas de seguridad son preceptos que debe cumplir todo el personal de una compañía, de manera que se asegure su:
- **Integridad**: garantizando que la información y sus métodos de proceso son exactos y completos.
- **Disponibilidad**: garantizando que los usuarios autorizados tengan acceso a la información y a sus activos asociados cuando lo requieran.
- **Privacidad**: garantizando que solamente los usuarios autorizados acceden a la información que precisan dentro de su ámbito de trabajo.
A grandes rasgos, podemos distinguir entre dos tipos de políticas de seguridad:
- Las que indican qué no debemos hacer.
- Las que indican lo que tenemos que hacer siempre.
Es importante que todas las políticas de seguridad definidas estén alineadas con los objetivos del negocio de la organización y sean acordes con la estrategia de seguridad de esta.

Algunas políticas de seguridad según la norma ISO 27001, son las siguientes:
1. Clasificación de la información.
2. Continuidad del negocio.
3. Uso aceptable de los activos/equipos.
4. Gestión documental.
5. Copias de seguridad.
6. Gestión de accesos.
7. Gestión de vulnerabilidades (vulnerabilidades, parches e incidentes).
```

##### Ponte a prueba 5 -- PSI

```md
**Ejemplos de políticas de seguridad**
Disponemos de estos dos ejemplos de políticas y se pide reflexionar sobre ellas. ¿Son útiles tal y como están redactadas?, ¿habría que detallar más?, ¿les falta algo?, ¿les sobra algo? 

Políticas:
1. El acceso a las áreas o zonas controladas solo se permite al personal autorizado.
2. El acceso a los medios informáticos será expresamente autorizado por el jefe facultado.
```

##### Ejercicios 5 -- test

1. La determinación del nivel aceptable de seguridad corresponde a una política de: **Evitar el riesgo.**
2. La política de seguridad de la organización: **Debe describir qué se intenta proteger y por qué se debe hacer, sin entrar en detalles acerca del cómo.**
3. En relación con las políticas de seguridad, indicar qué norma o procedimiento no deben establecer: **Temas salariales.**
4. Respecto al nivel de riesgo de los datos, indicar cuál de los siguientes no sería un criterio de clasificación: **Uso particular.**

## QUIZ

> ...

