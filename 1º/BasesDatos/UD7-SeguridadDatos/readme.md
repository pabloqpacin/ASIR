# BasesDatos — UD7: Seguridad de los datos

## Campus Virtual

- Teoría
  - ud7-teoria
- Cuestionario

> [apuntes-ud7](/BasesDatos/UD7-SeguridadDatos/apuntes-ud7.md)


### Cuestionario

| index | cuestionario |
| ---   | --- |
| Q1    | ¿Qué sentencia permite denegar a un usuario la posibilidad de acceder, manipular o ejecutar objetos concretos?
| A1    | — `REVOKE`
| Q2    | Si un cambio en la dirección de un cliente se refleja en la tabla CLIENTES pero no en sus facturas, es un fallo de:
| A2    | — *Integridad* de los datos
| Q3    | Si todos los usuarios de una BD pueden acceder a todos los datos, puede deberse a un problema de:
| A3    | — Seguridad
| Q4    | ¿Qué principio de seguridad se ve violado si un usuario sin autorización accede a la base de datos y lee algunos datos personales de un cliente?
| A4    | — Principio de Confidencialidad
| Q5    | El que una sala de servidores donde está contenida la información de una base de datos esté situada al lado de un baño y pueda sufrir una inundación, se considera:
| A5    | — Una amenaza de seguridad accidental
| Q6    | ¿Cuál es el sublenguaje SQL en el que se engloban las sentencias que permiten la creación y modificación de usuarios y permisos de la base de datos?
| A6    | — DCL
| Q7    | ¿Qué hace la siguiente sentencia? `GRANT SELECT, INSERT ON HOSPITAL.MEDICOS TO user109;`
| A7    | — Concede permisos de selección y de inserción sobre la tabla MEDICOS de la Base de Datos HOSPITAL al usuario user109 <!-- NO CREA???? -->
| Q8    | Después de lanzar la siguiente sentencia: `GRANT SELECT, INSERT, UPDATE ON MITIENDA.* TO user11 WITH GRANT OPTION;` ¿Cuál de estas sentencias podría lanzar el usuario user11?
| A8    | — `GRANT SELECT ON MITIENDA.CLIENTES TO user12`
| Q9    | ¿Cuál de estos soportes sería válido para hacer copias de seguridad?
| A9    | — Disco duro externo
| Q10   | ¿Qué sentencias SQL permiten crear copias de seguridad y recuperarlas?
| A10   | — BACKUP y RESTORE

