# UT1. Comparativa de Servidores de Bases de Datos

<!--
```md
# Practica UT1. Comparativa de Servidores de Base de Datos
Esta práctica ayudará a los estudiantes a desarrollar habilidades de investigación, análisis y toma de decisiones en el contexto de la administración de bases de datos, lo que es fundamental en el campo de la informática y la gestión de datos.

## Objetivo:
El objetivo de esta práctica es que los estudiantes investiguen y comparen tres servidores de bases de datos distintos y analicen sus características más importantes, como rendimiento, escalabilidad, seguridad y facilidad de uso. Al finalizar la práctica, los estudiantes deben ser capaces de tomar decisiones informadas sobre la elección de un servidor de base de datos en función de las necesidades de un proyecto específico.

## Descripción de la Práctica:
1. **Selección de Servidores**: Cada estudiante o grupo deberá seleccionar tres servidores de bases de datos distintos. Pueden elegir entre servidores de código abierto (por ejemplo, MySQL, PostgreSQL), servidores comerciales (por ejemplo, Oracle Database, Microsoft SQL Server) o soluciones en la nube (por ejemplo, Amazon RDS, Azure SQL Database).
2. **Investigación y Documentación**: Los estudiantes deberán investigar y recopilar información sobre cada uno de los servidores seleccionados. Deben centrarse en las siguientes áreas:
   - Arquitectura y modelo de datos.
   - Rendimiento y capacidad de carga.
   - Escalabilidad y capacidades de replicación.
   - Características de seguridad y autenticación.
   - Facilidad de administración y herramientas disponibles.
   - Compatibilidad con lenguajes de programación y frameworks.
   - Costos y licenciamiento (si es aplicable).
   - Casos de uso recomendados.

3. **Comparativa**: Con la información recopilada, los estudiantes deben elaborar una comparativa detallada de los tres servidores de bases de datos. Pueden utilizar tablas, gráficos u otros formatos visuales para destacar las diferencias y similitudes entre los servidores en cada una de las áreas mencionadas.
4. **Conclusiones y Recomendaciones**: Los estudiantes deben concluir su práctica con una sección de conclusiones donde resuman las ventajas y desventajas de cada servidor en función de los criterios de comparación. Además, deben hacer recomendaciones sobre cuál de los servidores sería más adecuado para un proyecto hipotético que se les proporcionará.

## Entrega:
Los estudiantes deberán entregar un documento en PDF que incluya la investigación, la comparativa y las conclusiones (2 pág. aprox.).
```
-->


<!-- <p align="justify">foo</p> PROBLEMA: <a href="">bar</a> -->
<p style="text-align: justify;">
El objetivo de esta práctica es investigar y comparar tres sistemas gestores de bases de datos ("SGBD").
Para ampliar nuestra perspectiva frente al imperante SQL, cada uno de nuestros tres SGBD, siendo todos <i>open source</i>, adopta un <a href="https://www.lucidchart.com/pages/es/que-es-un-modelo-de-base-de-datos">modelo de base de datos</a> diferente (o incluso varios). Destacaremos sus características, diferencias, fortalezas, flaquezas y casos de uso.


## 1. Selección de Servidores

<!-- - cassandra -->
<!-- - mongodb -->

<!-- - [**Redis**](https://redis.io): creado en 2009 y escrito en C y notablemente en [Tcl](https://wiki.tcl-lang.org/page/What+is+Tcl), Redis es un almacén de datos clave-valor, es decir, es una [base de datos documental](https://redis.com/nosql/document-databases/), no relacional y NoSQL. -->
- [**PostgreSQL**](https://www.postgresql.org): en desarrollo desde 1986 y escrito en su mayoría en el lenguaje de programación C, se ha consolidado como el SGBD [más popular en 2023](https://survey.stackoverflow.co/2023/#section-most-popular-technologies-databases).
- [**Redis**](https://redis.io/docs/about/): base de datos en memoria no-relacional (NoSQL) donde la información se almacena formando parejas clave-valor. Creada en 2009 y escrita en C y notablemente en [Tcl](https://wiki.tcl-lang.org/page/What+is+Tcl).
- [**SurrealDB**](https://surrealdb.com/): SGBD multi-modelo iniciado en 2016 (Go), *open source* desde 2021 y reescrito en Rust. En 2022 se lanzó una versión beta pública y en Septiembre de 2023 se ha lanzado la versión 1.0.0.


## 2. Investigación y Documentación

<!-- ```md
- Arquitectura y modelo de datos.
- Rendimiento y capacidad de carga.
- Escalabilidad y capacidades de replicación.
- Características de seguridad y autenticación.
- - Control de Transacciones
- Facilidad de administración y herramientas disponibles.
- Compatibilidad con lenguajes de programación y frameworks.
- Costos y licenciamiento (si es aplicable).
- Casos de uso recomendados.
``` -->

> **[ORM](https://www.prisma.io/dataguide/types/relational/what-is-an-orm)**: software que aporta compatibilidad entre estructuras de datos SQL y otras propias de lenguajes de de programación orientada a objetos. Ejemplos: [Prisma](https://www.prisma.io/graphql), [SQLAlchemy](https://www.sqlalchemy.org/), [Django](https://www.djangoproject.com/), [Laravel](https://laravel.com/)...

> **[ACID](https://www.mongodb.com/basics/acid-transactions)**: conjunto de propiedades que garantizan que las transacciones de una base de datos se procesan de manera fiable. Atomicidad, Consistencia, Aislamiento (Isolation) y Durabilidad.

> **[NoSQL](https://www.ibm.com/es-es/topics/nosql-databases)**: aquel SGBD que adopta estructuras de datos alternativos a las tablas relacionales para almacenar la información. Diferentes modelos: documento, grafo, parejas clave-valor...

<!-- > **[GraphQL](https://graphql.guide/background/databases/)**: -->


### 2.1. PostgreSQL

- PostgreSQL sigue una [<u>arquitectura</u> cliente-servidor](https://www.postgresql.org/docs/current/tutorial-arch.html): un motor central gestiona la base de datos y acepta conexiones, y las aplicaciones clientes se conectan al servidor para realizar acciones.
- Su <u>modelo de datos</u> es **objeto-relacional**, organizando la información en tablas con filas y columnas mediante un SQL altamente extensible que admite tipos de datos personalizados, funciones y procedimientos almacenados con polimorfismo e *inheritance*.
- Se destacan extensiones como [PostGIS](https://geoinnova.org/blog-territorio/postgresql-ypostgis-que-son-y-como-se-relacionan/) (datos geo-espaciales), [CITUS](https://www.citusdata.com/) (*sharding*) o [pg_embedding](https://python.langchain.com/docs/integrations/vectorstores/pgembedding) (AI).
- El <u>rendimiento</u> y la <u>capacidad de carga</u> de PostgreSQL son eficientes gracias a su optimizador de consultas y su gestión de índices para acelerar búsquedas.
- PostgreSQL es <u>escalable</u> y admite <u>[replicación](https://www.postgresql.org/docs/current/runtime-config-replication.html)</u> tanto síncrona como asíncrona. Es posible configurar clústeres y [réplicas](https://pgdash.io/blog/horizontally-scaling-postgresql.html) para distribuir la carga y aumentar la disponibilidad.
- La <u>[seguridad](https://www.postgresql.org/docs/7.0/security.htm)</u> se impone a varios niveles: protección interna de archivos críticos, conexiones basadas en sockets UNIX y no TCP/IP, control de acceso basado en roles, permisos, grupos, dirección IP...
- Para el control de <u>concurrencia y transacciones</u>, PostgreSQL incorpora [técnicas](https://www.interdb.jp/pg/pgsql05.html) como la multi-versión y la *serializable snapshot isolation*, permitiendo la ejecución simultánea de varias transacciones.
- PostgreSQL dispone de diversas <u>herramientas</u> de administración, como [pgAdmin](https://www.pgadmin.org/) y [psql](https://www.postgresguide.com/utilities/psql/), de modelaje como [pgModeler](https://pgmodeler.io/), y es compatible con herramientas de respaldo, restauración y [contenerización](https://hub.docker.com/_/postgres).
- PostgreSQL cuenta con un [catálogo](https://www.postgresql.org/download/products/4-procedural-languages/) de módulos que integran Java, PHP, Python y otros <u>lenguajes</u> de programación. Además, constantemente se desarrollan [nuevos <u>ORM</u>](https://steelkiwi.com/blog/top-postgresql-orms-query-builders-databases/) que fortalecen el ecosistema.
<!-- - Costos y licenciamiento (si es aplicable). -->
<!-- - Casos de uso recomendados. -->

> Ejemplo de objeto [pgSQL](https://www.postgresql.org/docs/current/plpgsql.html) como tipo de dato:

<!-- - ACID + multi-version concurrency control: gives each transaction a snapshot of the database (v1, v2...), allowing multiple transactions to run at the same time without traffic jams or locks -->
<!-- > [PostgreSQL in 100 Seconds](https://www.youtube.com/watch?v=n2Fluyr3lbc) -->

```sql
-- Creación de un objeto como tipo de dato
CREATE TYPE Persona AS (
    nombre TEXT,
    fecha_nacimiento DATE,
    bio JSON,
    habilidades hstore             -- hstore: pareja clave-valor
);

-- Aplicación del objeto a una tabla
CREATE TABLE estudiantes (
    id SERIAL PRIMARY KEY,
    informacion Persona
);

-- Añadir información a un objeto
INSERT INTO estudiantes (informacion)
VALUES (
    ROW(
        'Pablo',
        '1995-03-10',
        '{"estado": "ando programando"}'::json, -- casting: 'foo::bar'
        'bash=>avanzado,sql=>principiante'::hstore
    )
);
```
<!-- ```sql
-- Realización consulta
SELECT
    (informacion).bio,
    (informacion).habilidades -> 'bash' as habilidad_bash
FROM estudiantes
WHERE (informacion).nombre = 'Pablo';
``` -->


### 2.2 Redis

- Redis es una base de datos **en memoria** de alto rendimiento muy utilizada como **caché** entre un SGBD relacional en expansión y las aplicaciones clientes (generalmente aplicaciones web).
- Su <u>[arquitectura](https://architecturenotes.co/redis/)</u> cliente-servidor puede implantarse con un único nodo o mediante complejos *[clusters](https://redis.com/redis-enterprise/technology/redis-enterprise-cluster-architecture/)*.
- Su <u>modelo de datos</u> es sencillo y flexible, ya que permite almacenar numerosas [estructuras de datos](https://redis.io/docs/data-types/) como **parejas clave-valor**, donde la clave identifica aquella estructura registrada como valor.
- El <u>rendimiento</u> de Redis es excepcional ya que mantiene todos los datos en la memoria RAM (aunque permite persistencia). Puede manejar una alta <u>capacidad de carga</u>, tanto lecturas como escrituras.
- Redis admite la [<u>replicación</u>](https://redis.io/docs/management/replication/) maestro-esclavo ([principal-réplica](https://developer.redis.com/operate/redis-at-scale/high-availability/basic-replication/)) para garantizar <u>escalabilidad</u> y alta disponibilidad, permitiendo la partición de datos en múltiples instancias.
- La <u>[seguridad](https://redis.io/docs/management/security/)</u> de Redis ha venido siendo [confesadamente](https://university.redis.com/courses/ru330/) elemental, necesitando una barrera externa (e.g. aplicación web) que gestione la <u>autenticación</u> y operaciones del usuario.
- Para su <u>administración</u>, Redis cuenta con la interfaz de comandos RedisCLI y la interfaz gráfica [RedisInsight](https://redis.io/docs/ui/insight/). De forma comercial se ofrece [Redis Entreprise Cloud](https://redis.com/redis-enterprise-cloud/overview/) (DBaaS), que viene incoporando numerosos [módulos](https://redis.com/modules/) especializados para el tratamiento de distintas estructuras de datos.
- Existen bibliotecas y clientes para una amplia gama de <u>lenguajes</u> de programación, incluyendo Python, JavaScript, Java y más, facilitando su integración con diversas aplicaciones y frameworks.
- Redis es ideal para <u>casos de uso</u> que requieren alta velocidad y baja latencia, como almacenamiento en caché, colas de mensajes, contadores en tiempo real y sesiones web.

<br>

> Demostración de RedisCLI

```bash
# Creación y lectura de una clave y su valor -- tipo de dato: string
redislabs.com:17025> set bike:1 Deimos
OK
redislabs.com:17025> get bike:1
"Deimos"

# Creación y lectura de una clave y su valor -- tipo de dato: hash
redislabs.com:17025> hset bike:1 model Deimos brand Ergonom type 'Enduro bikes' price 4972
(integer) 4
redislabs.com:17025> hget bike:1 model
"Deimos"
redislabs.com:17025> hget bike:1 price
"4972"
```

### 2.3 SurrealDB

<!-- - *ACID-compliant* -->
<!-- - SurrealDB ... offering highly-available and highly-scalable system characteristics. Designed from the ground up to run in a distributed environment, SurrealDB makes use of special techniques when handling multi-table transactions, and document record IDs - with no use of table or row locks. -->
- La [<u>arquitectura</u>](https://surrealdb.com/features#architecture) de SurrealDB puede ser distribuida o de nodo-único e implantarse en memoria, en un navegador web, en disco o en la **nube**. Se trata de un SGBD muy <u>escalable</u>, *cloud-native* y [serverless](https://www.mongodb.com/databases/serverless-database).
- SurrealDB es <u>**multimodelo**</u> (relacional, documento y grafo) y [*schemaless*](https://redis.com/blog/schemaless-databases/) por defecto, lo que permite almacenar información "desestructurada" (aunque [SurrealQL](https://surrealdb.com/docs/surrealql/statements/define/table) permite definiciones *schemafull*). Se sustituyen los JOINs y FOREIGN KEYS por *record links* y otros elementos de grafo.
- El <u>rendimiento</u> de SurrealDB [está próximo](https://dev.to/ndrean/testing-surrealdb-1kjl) al de otros SGBD. Se esperan [*benchmarks* oficiales](https://www.reddit.com/r/surrealdb/comments/xfc2p4/comment/iosohwk/?context=3).
- SurrealDB implementa RBAC para la <u>autenticación</u> de [usuarios](https://surrealdb.com/docs/security/authentication) y múltiples [mecanismos](https://surrealdb.com/docs/security/capabilities) de <u>seguridad</u>.
- Para su <u>administración</u> existen una interfaz [CLI](https://surrealdb.com/docs/cli) y numerosas <u>herramientas</u> para su [implantación](https://surrealdb.com/docs/deployment) a través de la nube y su [integración](https://surrealdb.com/docs/integration) con otros <u>lenguajes</u> de programación, APIs, WebSockets y más.
- Producto *open source* grauito, su [<u>licencia</u>](https://surrealdb.com/license) solo coarta su comercialización como [DBaaS](https://www.ibm.com/topics/dbaas).
- Este SGBD es muy joven y muy ambicioso. Parece alineado con las tendencias de *software* actuales pero necesita madurar para que podamos destacar usos de caso sobresalientes.

> Ejemplos de comandos SurrealQL para el modelado de datos 

```sql
-- Con CREATE creamos un registro:uniqueID, con SET le damos contenido
CREATE human:jeff SET
  nickname="Jeff", age=99, sex=true;

-- Creación de tablas schemafull
DEFINE TABLE human SCHEMAFULL;
DEFINE FIELD age ON TABLE human TYPE int;

-- Demo de lo que sustituye a las PKs y FKs ("Fetch from related table")
CREATE human:jeff SET
  Name= 'Jeff',
  friends = [human:chad, human:todd];
SELECT friends.name FROM human:jeff;
```

<!-- ```sql
-- Modelado de datos con CONTENT: sintaxis tipo JSON
CREATE human CONTENT {
    nickname: "Chad",
    age: 28,
    sex: true
};

-- ACID -- Safe transactions across multiple tables
BEGIN TRANSACTION;
UPDATE coin:one SET balance += -23.00;
UPDATE coin:two SET balance += 23.00;
COMMIT TRANSACTION;

-- Graph Traversal
SELECT <- purchased <- person -> purchased -> product
FROM product:plumbus;

-- Events -- Listen real-time updates on frontend when data changes
DEFINE EVENT mail ON TABLE user
WHEN $before.email != $after.email

-- Built-in functions
SELECT count() FROM human       -- Aggregate Queries
    GROUP BY count;
SELECT name, is::email(name);       -- Validation

-- Graph Queries
RELATE human:jeff -> drive -> car:nash
    SET time.written = time::now();
``` -->


## 3. Comparativa

> Tablas, gráficos u otros formatos visuales: destacar las diferencias y similitudes en cada área

<!-- En vista de la extensión de este documento, optamos por no incluir este apartado. -->

<!-- <style>
  td { text-align: center }
  th { text-align: center }
</style> -->
<table style="margin: 0 auto;">
  <thead>
    <tr>
      <th></th>
      <th>PostgreSQL</th>
      <th>Redis</th>
      <th>SurrealDB</th>
    </tr>  
  </thead>
  <tbody>
    <tr>
      <td>Paradigma</td>
      <td>SQL</td>
      <td>NoSQL</td>
      <td>NewSQL</td>
    </tr>
    <tr>
      <td>Relacional</td>
      <td>Sí</td>
      <td>No</td>
      <td>Sí</td>
    </tr>
    <tr>
      <td>Schema-</td>
      <td>full</td>
      <td>less</td>
      <td>less + full</td>
    </tr>
    <tr>
      <td>ACID</td>
      <td>Sí</td>
      <td><a href="https://redis.com/glossary/acid-transactions/">No</a></td>
      <td>Sí</td>
    </tr>
    <tr>
      <td>Serverless</td>
      <td><a href="https://neon.tech/">¿Sí?</a></td>
      <td><a href="https://redis.com/blog/serverless-databases-as-a-service/">Sí</a></td>
      <td>Sí</td>
    </tr>
    <!-- <tr>
      <td>foo</td>
      <td>foo</td>
      <td>foo</td>
      <td>foo</td>
    </tr> -->
  </tbody>
</table>


## 4. Conclusiones y Recomendaciones

<p style="text-align: justify;">
<!-- ARPANET 1970 -->
En 1970 no solo se publicaba el Modelo Relacional de E. Codd, sino también el Protocolo de Control de Red para ARPANET. Aún no existía Internet. Hoy, 53 años después, la industria del software navega tendencias como la computación en la nube, la contenerización, los microservicios, el CI/CD, la integración de IA, el <i>Internet of Things</i>...
Tecnologías y prácticas de lo más reciente e innovador que siguen valiéndose del Modelo Relacional como base para todo tipo de productos y servicios.
Los SGBD relacionales siguen siendo fundamentales por su eficacia para el mantenimiento de la integridad de la información, su capacidad de representar relaciones complejas, un lenguaje de programación (SQL) maduro... Por esto, bases de datos como MySQL, <b>PostgreSQL</b> y Oracle Database prevalecen y es preciso saber trabajar con ellas.
</p>

<p style="text-align: justify;">
El Modelo Relacional implementa las propiedades ACID desde <a href="https://jimgray.azurewebsites.net/papers/theTransactionConcept.pdf?from=https://research.microsoft.com/~gray/papers/theTransactionConcept.pdf&type=path">1981</a>, lo que ha resuelto innumerables problemas para el almacenamiento y la gestión de información. Sin embargo la innovación no se detiene, con lo que surgen nuevos desafíos para los que el Modelo Relacional no tiene respuesta. Es por esto que se desarrollan nuevas bases de datos no solo relacionales (<i>Not only SQL</i>) que priorizan el rendimiento y la escalabilidad, en general adoptando nuevas estrategias y estructuras de datos más flexibles que las del Modelo Relacional. MongoDB almacena la información en formato JSON, usado por prácticamente todas las aplicaciones web. <b>Redis</b> aporta velocidad en cualquier infraestructura web. Apache Cassandra adopta una arquitectura <i>peer-to-peer</i> y pone el acento en la escalabilidad y la alta disponibilidad.

<p style="text-align: justify;">
En definitiva, mientras las grandes empresas de software lanzan sus propias bases de datos relacionales y no relacionales en la nube, siguen surgiendo nuevos proyectos como <b>SurrealDB</b> que apuestan por integrar de forma nativa las tecnologías y convenciones (APIs, GraphQL, React, SQL, wasm...) que dan forma al internet que conocemos. 
Como resultado, las bases de datos SQL, NoSQL y NewSQL siguen en desarrollo, evolucionando y mejorando, a menudo implementando características comunes e implantándose en conjunto en el <i>stack</i> tecnológico de los incontables servicios digitales que pueblan la red informática mundial, ofreciendo innovadoras soluciones para los desafíos del mañana.
</p>

<!-- > https://en.wikipedia.org/wiki/Flag_day_(computing) -->
<!-- @Fireship: Futuristic Databases: https://www.youtube.com/watch?v=jb2AvF8XzII -->
