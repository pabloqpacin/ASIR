# BasesDatos — UD7: Seguridad de los datos

```markdown
1. Seguridad de la información
   1. Confidencialidad, integridad y disponibilidad de los datos
      1. Principio de Integridad
      2. Principio de Disponibilidad
      3. Principio de Confidencialidad
   2. Carácter personal y derecho a la intimidad de los datos
      1. Legislación sobre protección de datos
      2. Obligaciones de las empresas y los implicados en los tratamientos
      3. Notificación de violaciones de seguridad
      4. Datos personales
   3. Amenazas a la seguridad
      1. Amenazas accidentales
      2. Amenazas intencionadas
      3. Algunas soluciones
   4. CDL - Lenguaje de Control de Datos
      1. Transacciones
      2. Seguridad
2. Salvaguarda. Recuperación. Transferencia
   1. Concepto de seguridad y recuperación
   2. Seguridad
      1. Planificación
      2. Soportes
      3. Tipos de copias de seguridad
   3. Recuperación de los datos
   4. Utilidades para la seguridad y recuperación
   5. Sentencias para hacer y recuperar copias de seguridad
   6. Transferencia de datos
```

> - @MySQL: [13.7.1.6 GRANT Statement](https://dev.mysql.com/doc/refman/8.0/en/grant.html)
>
> - @DigitalOcean: [How To Create a New User and Grant Permissions in MySQL](https://www.digitalocean.com/community/tutorials/how-to-create-a-new-user-and-grant-permissions-in-mysql)
> 
> - @MySQL: [4.5.4 mysqldump — A Database Backup Program](https://dev.mysql.com/doc/refman/8.0/en/mysqldump.html)

1. **Seguridad de la información** == genérica VS sensible // usos fraudulentos, comerciales, etc.
   1. **Confidencialidad + Integridad + Disponibilidad de los datos** == SEGURIDAD
      1. *Integridad* == entidades (`PK` = `UNIQUE` `NOT NULL`) || referencial (`FK` => `PK`) || semántica (sentido BD ... Triggers)
      2. *Disponibilidad* == prevención física = balanceo carga red + SAI + planesContingencia(backup,clusters...)
      3. *Confidencialidad* == CONTROL DE ACCESO global < discrecional < obligado
   2. **Carácter personal y derecho a la intimidad de los datos**
      1. *Legislación Protección Datos*
          - (AEPD) *LOPD(1999)* == Derechos ARCO [`A`cceso `R`ectificación `C`ancelación `O`posición"]
          - RGPD(2016) + LOPDGDD(2018)
      2. *Obligaciones empresas* == procedimientosSencillos, formulariosInformativos, encriptación, protecciónInicial, registroActividadesTratamiento, notificarInseguridad
      3. *Notificación violaciones seguridad* == notif Autoridad... 72h, naturalezaViolación, categoríasDatosUsuariosAfectados, medidasAdoptadas &emsp; // altoRiesgo = notif usuarios 
      4. *Datos personales* == información id persona &emsp; // nombre, nacimiento, dirección, biométricos, ideología, cuentas, consumos, judiciales
   3. **Amenazas a la seguridad** == ordenadorServidor || red(propia||internet) || sistemaCopiasSeguridad
      1. *Amenazas accidentales* == previsiónBackups, privilegiosMasivos, falloElectricidad, contraseñasSinEncriptar||NoSeguras, accesoFísico, redesNoEncriptadas
      2. *Amenazas intencionadas* == robosDocumentación-Claves, fraude, pérdidaConfidencial, pérdidaIntegridad
      3. *Algunas `soluciones`* == preventivas VS contingencia &emsp; // autenticaciónUsuarios - privilegiosRoles - sistemaBackups - fragmentaciónGeográfica - encriptaciónDatosRed - certificadosDigitales - cortafuegos
   4. **`DCL` - Lenguaje de Control de Datos**  
      1. [Transacciones](/BasesDatos/UD5-EdicionDatos/)
      2. **Seguridad**
          - Acceso Admins VS Users => `GRANT` PRIVILEGIOS Users + Tablas/Vistas &ensp; // `REVOKE`
2. **Salvaguarda. Recuperación. Transferencia**
   1. *Seguridad y Recuperación* == protecciónAccesos + copiaSeguridad // restablecerVersiónEstable
   2. **Seguridad**
      1. *Planificación* == qué, cuándo, dónde, cómo &emsp; // volumenDatos, tipoDatos, tipoCopias, soporteFísico, ubicación, duraciónPeriodicidad, responsabilidad, formaciónUusuariosResponsables, verificación
      2. *Soportes* == discosDuros, DVD, FlashUSB, NAS, RAID
      3. *Tipos de copias de seguridad* == completas VS parciales
   3. *Recuperación de los datos* == rápida y eficiente (noche)
   4. *Utilidades* == (elegir según necesidades)
   5. *Sentencias* == `BACKUP` - `RESTORE`
   6. *Transferencia de datos* == importación VS exportación *across* SGBD


---

```sql
--
-- See all users
-- 

SELECT * FROM mysql.user;


--
-- GRANT
--

-- To add a user and give rights on the given database:
GRANT ALL PRIVILEGES ON database.* TO 'user'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;

-- Granting privileges on a specific database:
GRANT SELECT, INSERT, UPDATE, DELETE ON database_name.* TO 'user'@'host';

-- Granting privileges on all databases:
GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'user'@'host';

-- Granting privileges on a specific table within a database:
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES ON database_name.table_name TO 'user'@'host';

-- Granting privileges on all tables within a database:
GRANT SELECT, INSERT, UPDATE, DELETE ON database_name.* TO 'user'@'host';

-- Granting privileges with the ability to grant/revoke privileges to other users:
GRANT ALL PRIVILEGES ON *.* TO 'user'@'host' WITH GRANT OPTION;

--
-- REVOKE
--

-- Dangerous ramifications!!
REVOKE ALL PRIVILEGES ON database.* FROM 'user'@'localhost' RESTRICT;
    FLUSH PRIVILEGES;
