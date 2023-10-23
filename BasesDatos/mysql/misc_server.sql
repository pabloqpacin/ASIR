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
