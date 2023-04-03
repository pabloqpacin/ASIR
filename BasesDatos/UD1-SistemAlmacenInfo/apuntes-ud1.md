# BasesDatos — UD1: Sistemas Almacenamiento Información

```markdown
1. Ficheros de Información
   1. Definición de fichero
   2. Tipos de ficheros y formatos
2. Bases de Datos
   1. Conceptos
   2. Usos
   3. TIPOS
3. SGBD — Sistemas Gestores Bases Datos
   1. Funciones
   2. Componentes
   3. TIPOS
```

1. Ficheros de Información
   1. **Definición de fichero** == conjunto de datos relacionados entre sí y organizados de forma estructurada; secuencia de dígitos binarios que organiza información relacionada con un mismo aspecto
   2. **Tipos de ficheros y formatos**
       - *según Organización* == secuenciales || acceso directo || indexados
       - *según Contenido* == texto (config-código-web-enriquecidos) || binarios (imagen-vídeo-comprimidos-ejecutables/compilados-procesadorTexto)
       - *según Temporalidad* == permanentes (maestros - constantes - históricos) || temporales (intermedios - maniobras - resultados)
2. **Bases de Datos**
   1. *Conceptos*
       - *ÁMBITOS* == mundo real || mundo conceptual || mundo representaciones
       - *ELEMENTOS* == Datos - Entidad - Relación - Metadatos &ensp; - &ensp; Tabla - Campo - Clave primaria - Registro/Tupla &ensp; - &ensp; TipoDato - Consulta - Índice- Vista -Informe &ensp; - &ensp; Guiones/Scripts - Procedimientos
   2. *Usos* == DBA || Diseñadores || Programadores || Usuarios
   3. *TIPOS* == Relacionales ... SQL ... Distribuidas
3. **SGBD — Sistemas Gestores Bases Datos**
   1. *Funciones* == DDL - DML - DCL - integridad - concurrencia - recuperación - diccDatos - encriptado
   2. **Componentes**
       - *Gestor Almacenamiento* == autorizaciones-integridad + transacciones + archivos + búfer &emsp; // archivos + diccionarios + índices
       - *Procesador Consultas* ==intérprete DDL + compilador DML + motor evaluación consultas
   3. *TIPOS* == libres||comerciales - monousuario||multiusuario - jérarquico||relacional||OO||O-Relacional - centralizado||distribuido

<br>

![Componentes-SGBD](/img/BasesDatos/ud1-SGBD-componentes.png)