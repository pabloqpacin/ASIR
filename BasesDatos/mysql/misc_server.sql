/* USERS */

-- Print all the users in the server
SELECT user, host FROM mysql.user;

-- Create new user with foo permissions
CREATE DATABASE foo;
CREATE USER whoami@localhost IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER ON foo.* TO whoami@localhost


/* MISC */

-- Print currently selected/using database
select database();


/* TABLES */

-- Print existing PK/FKs (edit 'database')
SELECT
  CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME,
  REFERENCED_TABLE_NAME, REFERENCED_COLUMN_NAME
FROM
  INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  REFERENCED_TABLE_SCHEMA = 'database';
