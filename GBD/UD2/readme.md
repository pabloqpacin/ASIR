# UD2. Diseño Lógico de Bases de Datos

<img src="/img/GBD/ud2-especializacion.png" alt="exclusiva=parcial..." width="500"/>
<img src="/img/GBD/ud2-pieDeGallo.png" alt="notacion-pie de gallo" width="500"/>


<details>
<summary>Table of Contents</summary>

- [UD2. Diseño Lógico de Bases de Datos](#ud2-diseño-lógico-de-bases-de-datos)
  - [1. Diseño de una BD](#1-diseño-de-una-bd)
    - [1.1 Modelo de Datos](#11-modelo-de-datos)
  - [2. Conceptos del Modelo Entidad-Relación (E/R)](#2-conceptos-del-modelo-entidad-relación-er)
    - [2.1 Entidades y atributos](#21-entidades-y-atributos)
      - [2.1.1 **Dominio** de los atributos](#211-dominio-de-los-atributos)
      - [2.1.2 Valor nulo de los atributos](#212-valor-nulo-de-los-atributos)
      - [2.1.3 Atributos **simples** y **compuestos**](#213-atributos-simples-y-compuestos)
      - [2.1.4 Atributos **monovalentes** y **polivalentes**](#214-atributos-monovalentes-y-polivalentes)
      - [2.1.5 **Cardinalidad** de los atributos](#215-cardinalidad-de-los-atributos)
      - [2.1.6 Atributos derivados y base](#216-atributos-derivados-y-base)
      - [2.1.7 Clave primaria](#217-clave-primaria)
      - [2.1.8 Notación (!)](#218-notación-)
    - [2.2 Relaciones](#22-relaciones)
      - [2.2.1 Atributos de las relaciones](#221-atributos-de-las-relaciones)
      - [2.2.2 Grado de las relaciones](#222-grado-de-las-relaciones)
      - [2.2.3 Participación de las entidades en una relación](#223-participación-de-las-entidades-en-una-relación)
      - [2.2.4 Cardinalidad de las relaciones](#224-cardinalidad-de-las-relaciones)
      - [2.2.5 Relaciones ternarias y n-arias](#225-relaciones-ternarias-y-n-arias)
      - [2.2.6 Relaciones unarias o reflexivas](#226-relaciones-unarias-o-reflexivas)
      - [2.2.7 Notación](#227-notación)
    - [2.3 Entidades fuertes y débiles](#23-entidades-fuertes-y-débiles)
  - [3. Diseño del diagrama Entidad-Relación](#3-diseño-del-diagrama-entidad-relación)
    - [3.1 El modelo ER ampliado](#31-el-modelo-er-ampliado)
      - [3.1.1 Especialización y generalización](#311-especialización-y-generalización)
      - [3.1.2 Tipos de especialización](#312-tipos-de-especialización)
  - [4. Modelo relacional](#4-modelo-relacional)
    - [4.1 Estructuración de los datos](#41-estructuración-de-los-datos)
      - [4.1.1 Dominio](#411-dominio)

</details>


## 1. Diseño de una BD

- Las BD representan informática un *problema* (parte del **mundo real** de nuestro interés) que hemos *conceptualizado* mediante *observación* y *abstracción*.
- La estructura de cada BD dependerá del modelo de datos, elegido por el **diseñador** según las necesidades y herramientas disponibles.


El **diseño** convierte las *concepciones* en *datos* mediante un proceso dividido en las siguientes fases:

1. Análisis
   - reuniones entre *informáticos* y *usuarios* para definir las necesidades y el modelo de BD, elaborando el documento **"Especificación de Requisitos Software (ERS)"**
2. Diseño/modelo conceptual
   - se elabora modelo con gran poder *expresivo* para la comprensión de los *usuarios* (eg. **modelo Entidad/Relación**)
3. Diseño/modelo lógico
   - traducción del modelo *conceptua*l al modelo de datos usado por el *SGBD*
   - modelo técnico (eg. **Modelo Relacional**)
4. Diseño/modelo físico
   - resultado de aplicacar el modelo *lógico* a un *SGBD* concreto, generalmente expresado en lenguages de programación de BD (eg. **SQL**)
   - permite modificaciones al equema *lógico* a fin de mejorar la eficiencia en las operaciones de datos.

> La herramienta con la que transformaremos el *Modelo Relacional* en *modelo físico* será en nuestro caso el **sublenguaje DDL de SQL**

### 1.1 Modelo de Datos

Conjuntos de herramientas lógicas para describir... datos, sus interrelaciones, significado y restricciones a aplicar para garantizar su *coherencia*. Tres herramientas fundamentales de cualquier modelo de BD:
1.  **Estructuras de datos**: elementos con los que se construyen las BD (eg. tablas, árboles)
2.  **Reglas de integridad**: restricciones que los datos deberán respetar (eg. tipo de dato, dominios, claves)
3.  **Operaciones** a realizar con los datos: altas, bajas, modificaciones, consultas...


## 2. Conceptos del Modelo Entidad-Relación (E/R)

- Siguiendo esquemas originales del Dr. Peter Pin-Shinc Chen.
- *Diagramas E/R* o *Diagramas Chen*.
- Los elementos más simples (entidades, atributos, interrelaciones, entidades débiles...) facilitan sobremanera la comunicación entre los diseñadores de BD y los usuarios.

### 2.1 Entidades y atributos

> Una entidad es algo que existe en el mundo real, distinguible del resto de cosas, y de la que nos interesan algunas propiedades —ya sea con existencia física (alumnos, productos) o abstracta (seguros, deudas)—
- Se representan con un **rectángulo**
- Tanto objeto *único* como *conjunto* de objetos similares, por lo que se distinguen:
  1. Entidades-instancia: Pablo Quevedo Pacín
  2. Entidades-tipo: alumno

> Llamamos atributos a las características que nos interesan de las entidades.

- Se representan con una **elipse** o rendondel. 

#### 2.1.1 **Dominio** de los atributos

- Los atributos de cada **entidad-instancia (ET)** adoptan valores *concretos*, que deben ser *válidos*.
> Para que un valor de un atributo sea *válido*, debe pertenecer al conjunto de valores *aceptables* para el atributo en cuestión. Este conjunto de valores válidos se denomina **dominio**.

#### 2.1.2 Valor nulo de los atributos

- Atributo de una **ET** sin valor, o con valor nulo (**NULL**). 

#### 2.1.3 Atributos **simples** y **compuestos**

> Un **atributo simple** no se puede dividir en partes más pequeñas sin que ello conlleve la pérdida de su significado (Ej: Nombre).
>
> Un **atributo compuesto** es el que está subdividido en partes más pequeñas (*que también tienen la consideración de atributos*), las cuales tienen un significado propio (Ej: Apellidos).

- Puede resultar interesante utilizar atributos compuestos si nos consta que los *usuarios* se referirán, en ocasiones, *al atributo globalmente considerado, y a veces a sus componentes por separado*.
- Por otra parte, los atributos compuestos agrupan los **atributos relacionados**, estructurándolos *jerárquicamente*, por lo que normalmente contribuyen a la  *comprensibilidad* de los modelos.

#### 2.1.4 Atributos **monovalentes** y **polivalentes**

> Un atributo **monovalente** es aquél que sólo puede almacenar, como máximo, *un solo valor para cada entidad instancia* concreta, en un momento determinado (Ej: **DNI**).
> 
> Un atributo **polivalente** o multivaluado puede almacenar, para cada entidad *instancia concreta, diferentes valores al mismo tiempo* (Ej: **Teléfono**).

-  Los atributos polivalentes se representan en los diagramas ER con una **elipse de doble trazo**.
- En el **modelo relacional** los atributos sólo pueden ser *simples y monovalentes*.
  - Pero el modelo **E/R** también puede servir para hacer derivar el modelo *conceptual* resultante hacia *otros modelos lógicos* que sí acepten los atributos compuestos o los polivalentes.

<!-- ES DECIR
Usaremos E/T vayamos a usar modelo RELACIONAL o no -->


#### 2.1.5 **Cardinalidad** de los atributos

NOMBRE_ATRIBUTO(límite-máximo-de-valores,límite-mínimo)

- ATRIBUTO(1,1): monovalente obligatorio (*predeterminado*), eg. DNI
- ATRIBUTO(0,1): monovalente opcional (*admite NULL*), eg. Apellido-2
- ATRIBUTO(1,n): polivalente obligatorio (*no admite NULL*), eg. direcciones
- ATRIBUTO(0,n): polivalente opcional (*admite NULL*), eg teléfono


#### 2.1.6 Atributos derivados y base

> Se dice que un atributo es **derivado** cuando su valor se puede calcular *a partir* de otros atributos o bien de otras entidades **interrelacionadas** (Ej: Edad). Cuando un atributo sirve para calcular el valor de un atributo derivado, se le considera atributo *base* de éste.

- **Redundancia**, repetición innecesaria de datos.
- Estos datos *no se suelen almacenar* sino que se *calculan* cuando es necesario (sobre todo si traducimos este diagrama E/R al modelo **relacional**).
- **Elipse** de trazo 
discontinuo.


#### 2.1.7 Clave primaria

- Atributo en todo modelo E/R que identifica *cada* ET.
- Se representa **subrayando** el atributo
> El atributo o conjunto de atributos que *identifican unívocamente las entidades-instancia* se denominan **clave primaria de la entidad**.


#### 2.1.8 Notación (!)
 
- Actualmente *no existe ninguna notación estandarizada universalmente* para representar los esquemas del modelo **E/R**. Cada recurso bibliográfico o cada software de diseño presenta, pues, variaciones y ampliaciones sobre la reducida notación propuesta originalmente por Peter Chen.

<!-- OJARDO!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

- El modelo E/R nos permite representar entidades y atributos mediante una sencilla 
notación diagramática. En esta representación respetaremos las características siguientes:

![NOTACION](/ASIR/GBD/UD2-Dise%C3%B1o-logico-BD/img/UD2-Notacion.png)


### 2.2 Relaciones

> Una relación consiste en una *asociación* entre dos o más entidades de un diagrama.

- Representadas con un **rombo**.


#### 2.2.1 Atributos de las relaciones

- Se añaden **atributos** para reflejar algunas características de determinadas relaciones.
- Las **propiedades** de los atributos de las *interrelaciones* son **idénticas** a las descritas previamente en relación a los atributos de las entidades.

#### 2.2.2 Grado de las relaciones

- El grado de una relación depende del *número de entidades* que ésta asocia.
- Las relaciones de *grado dos* también se llaman *binarias*. Y las de grado superior a dos se denominan genéricamente **n-arias**. Las relaciones n-arias de grado tres también 
pueden ser llamadas *ternaria*s, y las de grado cuatro, *cuaternarias*.

![GRADO-RELACIONES](/ASIR/GBD/UD2-Diseño-logico-BD/img/UD2-GradoRelaciones.png)

#### 2.2.3 Participación de las entidades en una relación

- La **participación** de una *instancia* de una entidad en una relación indica, mediante una pareja de números, el *mínimo y máximo número de veces que puede aparecer esa instancia en la relación asociada a otra instancia de entidad*. Se añade como etiqueta sobre la línea que une la entidad a la relación. Las posibles participaciones son:
  - (0,1): Mínimo 0, máximo 1
  - (1,1): Mínimo uno, máximo 1
  - (0,n): Mínimo cero, máximo n (muchos)
  - (1, n): Mínimo uno, máximo n (muchos)

#### 2.2.4 Cardinalidad de las relaciones

> La **cardinalidad** de una *relación* indica el tipo de correspondencia que hay entre las ocurrencias de las *entidades* que ella misma asocia.

- (1:1)
- (1:N)
- (N:M)


#### 2.2.5 Relaciones ternarias y n-arias

- La cardinalidad de las relaciones n-arias expresa el número máximo de instancias de una de las entidades con las que una combinación concreta de instancias de las otras entidades puede estar asociada según la relación en cuestión.

- 1:1:1
- 1:1:N
- 1:M:N
- M:N:P


#### 2.2.6 Relaciones unarias o reflexivas

- Una relación reflexiva asocia las instancias de una entidad con otras instancias de la **misma entidad**.
- Las relaciones reflexivas en los diagramas E/R se representan conectando una misma entidad más de una vez, mediante una única relación.


#### 2.2.7 Notación

![NOTACIÓN-RELACIONES](/ASIR/GBD/UD2-Diseño-logico-BD/img/UD2-NotacionRelaciones.png)



### 2.3 Entidades fuertes y débiles

- Entidades **fuertes**: entidades con atributo *clave primaria*
- Entidades **débiles**: asociadas mediante *relación* a entidad fuerte

- (...)
  - Relación de *cardinalidad* `1:N` entre entidad débil y su fuerte
  - Instancias de ED asociadas con única instancia de EF (ergo `1` y univocidad)
  - ED: atributos NO clave primaria, SÍ **discriminante** 
  - Relación entre ED con EF es *relación débil* (si EF desaparece, también la relación). En estos casos, la relación tiene una **dependencia** que puede ser de dos tipos:
    - **Dependencia de existencia**: ED no tiene sentido en la BD sin la presencia de su correspondiente EF (eg. transacciones bancarias / cuenta asociada)
    - **Dependencia de identificación**: ED necesita de la EF para poder crear una clave y completar así su identificación (eg. libros mismo título pero distinto autor)



--- 

## 3. Diseño del diagrama Entidad-Relación

<!-- Características del modelo ER -->

- Estándar actual en el diseño de BD
- Herramientas gráficas **clave** en tal diseño, confeccionadas sistemática y rigurosamente para un sistema válido y eficiente — pues con tales diagramas se implementa la BD con los SGBD de cada empresa/organismo
- **diseño conceptual** (terminología **modelo ER**) debe especificar:
  - todas las *entidades* necesarias y
  - las *relaciones* entre ellas,
  - con las *cardinalidades* adecuadas,
  - además de los *atributos* que correspondan.

Pasos para crear un modelo ER a partir de un **ERS**:
1. Leer el *problema* y entenderlo
2. Identificar candidatos a *entidades* y *atributos*
3. Establecer *relaciones* entre entidades y atributos
4. Establecer *claves primarias*
5. Establecer las **restriciones de participación** de las entidades
6. Asignar las cardinalidades a las relaciones
7. Crear el diagrama y refinar las categorizaciones

### 3.1 El modelo ER ampliado

Construcciones más complejas: **especialización** y **generalización**.

#### 3.1.1 Especialización y generalización

- Caso de ET con instancias a modelizar aparte de las instancias comunes (ie. ET contiene otra ET, de nivel inferior con características propias)
- **Especialización**: permite reflejar como una entidad **superclase** contiene diferentes entidades **subclase**
  - **Superclase**: características comunes
  - **Subclase**: características propias de las especializaciones (de la entidad superclase)
- instancias de Subclase = instancias Superclase
- se representa mediante *TRIÁNGULO*

> Estas características propias de las **subclases** pueden consistir tanto en la existencia de *atributos* como en la participación en *interrelaciones*, pero en ningún caso pueden ser de aplicación a **todas** las instancias de la **superclase** considerada como tal.

- **Generalización**: diferentes entidades comparten ciertas características comunes (ie. identidad de atributos o interrelaciones en las que participan)
- según las similitudes, se pueden *sintetizar* varias entidades en una sola (**generalización**)
- sirve para:
  - resaltar las *similitudes* entre entidades (no diferencias)
  - simplificar las representaciones de datos (*evitando repetir atributos* copmartidos por *subclases*)

![ESPECIAL-GENERAL](/GBD/UD2-Diseño-logico-BD/UD2-EspecialGeneral.png)


#### 3.1.2 Tipos de especialización

- **Especialización Exclusiva**
  - ocurrencias de la superclase SOLO en una de las especializaciones
  - {TRIANG. arc.}
- **Especialización Inclusiva**
  - ocurrencias de la superclase en VARIAS ocurrencias de las subclases
  - {TRIANG.}
- **Especialización Total**
  - entidad superclase OBLIGATORIAMENTE en una de las especializaciones
  - {TRIANG. circ.}
- **Especializacón Parcial**
  - entidad superclase OPCIONAL en una de las especializaciones {TRIANG.}


--- 

## 4. Modelo relacional

- Propuesto por **Codd** en 1970 ("A Relational Model of Data for Large Shared Data Banks")
- *Lógica de predicados* + *teoría de conjuntos*
- Sistema más popular para modelizar datos



### 4.1 Estructuración de los datos

<!-- Las relaciones se podrían operar mediante el *Álgebra relacional* -->

En el **modelo relacional** de BD, una *relación*^es una *tabla* con filas y columas. Las columnas son **atributos** y las filas **tuplas**.


> **Atributo**: es el *nombre de cada dato* que se almacena en la relación (tabla). El nombre del atributo debe describir el significado de la información que representa. Por ejemplo, en una relación ALUMNO, los atributos o campos podrían ser: nombre, DNI, dirección, teléfono,…
>
> **Tupla**: es *cada uno de los elementos* de la relación (tabla). En la tabla ALUMNO, una tupla o registro sería el nombre, DNI, etc. de un alumno concreto. Tiene que cumplir que:
> - Cada tupla debe corresponderse con un elemento del mundo real.
> - No puede haber dos tuplas iguales (con todos los valores iguales).

Toda relación debe tener un nombre que la identifique unívocamente dentro de la base de datos.


#### 4.1.1 Dominio

- **Conjunto finito de valores indivisibles**. Cada *atributo* de una relación tendrá asociado un *dominio*.
- Definido 