# Materia UD5: OpenLDAP

- [Materia UD5: OpenLDAP](#materia-ud5-openldap)
  - [TEORÍA](#teoría)
  - [PRÁCTICA (McGrawHill)](#práctica-mcgrawhill)
    - [1](#1)
      - [Caso práctico 1 -- Métodos de autenticación](#caso-práctico-1----métodos-de-autenticación)
      - [Ponte a prueba 1 -- Usos de OpenLDAP](#ponte-a-prueba-1----usos-de-openldap)
      - [Ejercicios 1 -- test](#ejercicios-1----test)
    - [2](#2)
      - [Caso práctico 2 -- Cambiar usuario de un grupo a otro](#caso-práctico-2----cambiar-usuario-de-un-grupo-a-otro)
      - [Ponte a prueba 2 -- Modificación de un registro (`ldapmodify`)](#ponte-a-prueba-2----modificación-de-un-registro-ldapmodify)
      - [Estudio de caso -- Creación cuenta usuario](#estudio-de-caso----creación-cuenta-usuario)
      - [Estudio de caso -- Creación perfil semimóvil](#estudio-de-caso----creación-perfil-semimóvil)
      - [Ejercicios 2 -- test](#ejercicios-2----test)
    - [3](#3)
      - [Caso práctico 3 -- Unir cliente Linux al dominio](#caso-práctico-3----unir-cliente-linux-al-dominio)
      - [Ponte a prueba 3 -- Permitir que los usuarios puedan cambiar la contraseña](#ponte-a-prueba-3----permitir-que-los-usuarios-puedan-cambiar-la-contraseña)
      - [Ejercicios 3 -- test](#ejercicios-3----test)
  - [QUIZ](#quiz)


## TEORÍA

> apuntes.md

## PRÁCTICA (McGrawHill)

<!-- ### foo -->
<!-- ### bar -->

### 1

#### Caso práctico 1 -- Métodos de autenticación

```md
**Métodos de autenticación**
LDAP es un protocolo de comunicación independiente de la plataforma. Lo que se instala en el equipo cliente o servidor es la implementación de este protocolo; sin embargo, la cuestión de cómo almacenar o tratar los datos se deja para los proveedores de la aplicación de la norma final.
Existen varias implementaciones del protocolo LDAP por parte de diferentes compañías. En esta unidad didáctica se trabajará con la implementación de OpenLDAP para Ubuntu (existen implementaciones para diferentes plataformas), que es una implementación libre del estándar. Os proponemos la búsqueda de información de otras implementaciones del estándar.
Y estas implementaciones se caracterizan por varios modelos, tales como el modelo de información, de nomenclatura, nombre distintivo (DN), sufijo de directorio, alias, referencias, raíz DSE, funcional y de seguridad. Con respecto a este último, hay que señalar que está recogido en el RFC 4513 y que refleja el proceso de autenticación y autorización.
A partir de lo anterior, se te pide que describas brevemente estos métodos de autenticación y autorización.
---
Implementaciones: Podemos encontrar otras implementaciones como:
- Directorio Activo (Active Directory): implementación de Microsoft en sus sistemas operativos Windows Server.
- RedHat Directory Server o 389 Directory Server: implementación realizada por RedHat/Fedora.
- ApacheDS: un servicio de directorio que ofrece la Apache Software Foundation.
- OpenDS: una implementación Java del protocolo LDAP.
- NDS (Novell Directory Services): implementación de Novell utilizada para manejar el acceso a recursos en diferentes servidores y ordenadores de una red.
- iPlanet Directory Server: implementación de iPlanet, la antigua Netscape que desarrolló software para servidores junto con Sun Microsystems.

Autenticación:
La autenticación es el proceso que asegura que las identidades de los usuarios y las máquinas (servidores o clientes) están correctamente validadas.
Normalmente, su función se reduce a verificar la identidad del usuario antes de permitirle el acceso al sistema. Este control permite definir el nivel de acceso de cada usuario y objeto del directorio.
Los servicios de directorio se utilizan habitualmente como herramientas de autenticación que almacenan credenciales de manera centralizada, no solo contraseñas para autenticar los usuarios del mismo directorio, sino también mecanismos para verificar contraseñas que autentiquen usuarios a otros sistemas.
Aun así, el protocolo no impone que las contraseñas asociadas con un usuario estén ubicadas dentro del servidor, sino que permite que estas se integren con servicios de autenticación externos (por ejemplo, SASL).


Autenticación anónima:
Todos los servidores LDAP tienen que aceptar un tipo de autenticación para usuarios anónimos, sin autentificación en absoluto, puesto que el servidor no sabe quién está pidiendo una conexión. Este tipo de autentificación tendrá asociada una autorización de tipo anónima.

Autenticación básica:
La autenticación básica también se utiliza en otros protocolos como HTTP. El cliente simplemente envía las credenciales de usuario por la red en formato claro.
El servidor busca un atributo denominado user-Password en la entrada correspondiente al nombre distintivo y lo compara con la entrada enviada por el cliente. Si la contraseña coincide, se establece la conexión con el servidor LDAP. Si no, se envía un mensaje de error y se cierra la conexión.

SASL:
Es el método recomendado por el protocolo LDAP. SASL separa los mecanismos de autenticación de los protocolos de aplicación (permitiendo ser utilizado por cualquier aplicación que lo necesite). Una vez el servidor y el cliente están conectados, establece un acuerdo sobre el mecanismo de seguridad. Algunos de estos mecanismos pueden ser:
- EXTERNAL (IPSec o TLS, entre otros).
- ANONYMOUS
- PLAIN (texto en claro)
- OTP (One Time Password)
- SKEY
- CRAM-MD5
- DIGEST-MD5
- NTLM
- GSSAPI
- GATEKEEPER
```

#### Ponte a prueba 1 -- Usos de OpenLDAP

```md
**Usos de OpenLDAP**
Con mucha frecuencia, nos encontramos con infraestructuras empresariales en las que se ha implementado un Directorio Activo LDAP con OpenLDAP para la autenticación de los usuarios que se conectan desde sus equipos unidos al dominio. Sin embargo, también se pueden encontrar otros usos en relación con la autenticación de los usuarios en el dominio. Investiga cuáles son estos usos distintos que podemos encontrar.
---
...
```

#### Ejercicios 1 -- test

1. ¿LDAP (Lightweight Directory Access Protocol) es un protocolo ideado para acceder a una base de datos? **Sí, pero sigue un modelo especial para albergar información basada en atributos.**
2. Indica cuál de las siguientes afirmaciones no es una ventaja de LDAP: **Es muy rápido en la escritura de registros.**
3. Indica cuál de las siguientes afirmaciones es una ventaja de LDAP: **Dispone de un modelo de nombres globales que asegura que todas las entradas son únicas.**
4. En relación con la arquitectura de LDAP, cabe afirmar que... **… es de tipo cliente-servidor, donde el servidor es el único que accede a la base de datos y acepta peticiones de los clientes. Además, el servidor puede actuar como cliente de otro servidor de nivel superior.**
5. En cuanto al funcionamiento de LDAP, los clientes hacen una petición a un servidor, el cual devuelve la respuesta tras consultar la base de datos… **…o tras consultar directamente la base de datos.** <!--WTF-->


### 2

#### Caso práctico 2 -- Cambiar usuario de un grupo a otro

```md
**Cambiar usuario de un grupo a otro**
Uno de los casos más típicos de implementación podría producirse al cambiar un usuario de un grupo a otro (perteneciente al grupo primario, se entiende), o bien al añadir un usuario a otro grupo.
Para el primer caso, modificaremos el atributo gidNumber en el objeto del usuario en cuestión, mientras que para el segundo caso, modificaremos el atributo member del objeto del grupo.

---
**Creación de usuario**
Imaginemos que hemos creado un usuario clacuesta con gidNumber 5001 del grupo admins y queremos que pertenezca al grupo users con gidNumber 5002.
Crearemos el archivo LDIF Cambia-gidNumber.ldif con el siguiente contenido:
  dn: uid=clacuesta,ou=People,dc=ejemplo,dc=com
  changetype: modify
  replace: gidNumber
  gidNumber: 5002

Y ahora lanzaremos este comando:
  $ ldapmodify -x -D cn=admin,dc=ejemplo,dc=com -W -f Cambia-gidNumber.ldif
  Enter LDAP Password:
  modifying entry "uid=clacuesta,ou=People,dc=ejemplo,dc=com"

Como podemos observar, se registra una marca temporal correspondiente a la creación del registro, al igual que se registra otra por la modificación. Por este motivo, ese campo aparece al final.
Pero si, además de este cambio, queremos que este mismo usuario pertenezca también al grupo admins pero no como grupo primario, tendremos que modificar la entrada del grupo y añadirle al usuario como miembro. Para ello, crearemos el LDIF Anyade-usuario-a-grupo.ldif.
  dn: cn=admins,ou=Group,dc=ejemplo,dc=com
  changetype: modify
  add: memberuid
  memberuid: clacuesta

De esta forma, la entrada del grupo admins adoptará el siguiente aspecto:
```

#### Ponte a prueba 2 -- Modificación de un registro (`ldapmodify`)

```md
**Modificación de un registro**
Una de las cosas más habituales que podemos encontrar al dar de alta nuevos elementos como usuarios en nuestro dominio es la creación de una cuenta con un nombre o un login incorrecto. Si lo acabamos de crear, simplemente podemos eliminar el registro y volverlo a crear, pero si la cuenta ya tiene un tiempo, posiblemente almacene datos personales o de configuración que tendremos que respetar. Para ello, emplearemos un mecanismo que nos permita modificar estos parámetros.
```

#### Estudio de caso -- Creación cuenta usuario

```bash
cat <<EOF | sudo tee /etc/ldap/ejemplo/CrearUsuarioAmozart.ldif
dn: uid=amozart,ou=People,dc=ejemplo,dc=com
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: amozart
sn: Mozart
givenName: Amadeus
cn: Amadeus Mozart
displayName: Amadeus Mozart
uidNumber: 10005
gidNumber: 5002
userPassword: amozart
gecos: Amadeus Mozart
loginShell: /bin/bash
homeDirectory: /home/users/amozart
EOF

ldapadd -xD cn=admin,dc=ejemplo,dc=com -Wf /etc/ldap/ejemplo/CrearUsuarioAmozart.ldif

ldapsearch -xLLL -b ou=People,dc=ejemplo,dc=com | bat -l yaml
```
#### Estudio de caso -- Creación perfil semimóvil

- Servidor

```bash
sudo apt install nfs-kernel-server

sudo mkdir /DatosPerfilesLDAP
sudo chown nobody:nogroup /DatosPerfilesLDAP
sudo chmod 777 /DatosPerfilesLDAP

cat <<EOF | sudo tee -a /etc/hosts.allow
portmap: 192.168.1.0/24
nfs: 192.168.1.0/24
EOF

cat <<EOF | sudo tee -a /etc/exports
/DatosPerfilesLDAP 192.168.1.0/24(rw,sync,no_root_squash,no_subtree_check)
EOF
```
```bash
cat <<EOF | tee /DatosPerfilesLDAP/CrearCarpetaUsuario.sh
#!/usr/bin/env bash
if [ ! -d /DatosPerfilesLDAP/\$1 ]; then
  mkdir /DatosPerfilesLDAP/\$1
  chown \$1:\$2 /DatosPerfilesLDAP/\$1
fi
EOF

sudo chown nobody:nogroup /DatosPerfilesLDAP/CrearCarpetaUsuario.sh
sudo chmod 755 /DatosPerfilesLDAP/CrearCarpetaUsuario.sh
```

```bash
apt install libnss-ldap
  # LDAP URI:                       ldap:///
  # DN of search base:              dc=example,dc=com
  # LDAP version:                   3
  # Make local root Database admin: No
  # Does LDAP db requrie login:     No

sudo sed -i '/passwd/s/files/files ldap/' /etc/nsswitch.conf
sudo sed -i '/group/s/files/files ldap/' /etc/nsswitch.conf
sudo sed -i '/^shadow/s/files/files ldap/' /etc/nsswitch.conf
```

- Clientes

```bash
sudo apt install nfs-common

cat <<EOF | sudo tee -a /etc/fstab
192.168.1.205;/DatosPerfilesLDAP  /PerfilSemiMovil  nfs default.sync
EOF
```
```bash
{
  GRUPO=$(groups | cut ' ' -f1)
  /PerfilSemiMovil/CrearCarpetaUsuario.sh \$USER \$GRUPO

  if [ ! -L \$HOME/DatosEnServidor ]; then
    ln -s -d /perfilSemiMovil/\$USER \$HOME/DatosEnServidor
  fi
}
```

#### Ejercicios 2 -- test

1. A la hora de construir el árbol LDAP... **… se puede construir tal como ocurre con los dominios DNS, pero siguiendo las recomendaciones RFC 2307bis.**
2. ¿Es necesario cumplir con algún requisito previo a la instalación de OpenLDAP? **Sí, con el nombre de la máquina, el nombre del dominio y una dirección IP estática (¡y disponer de conexión a Internet, claro!).**
3. ¿Cuáles son los paquetes necesarios para instalar OpenLDAP en Ubuntu 22.04? **Los paquetes slapd (comandos del servicio) y ldap-utils (comando de las utilidades).**
4. Tras la instalación de OpenLDAP... **… tendremos que ejecutar el comando `dpkg-reconfigure` para crear la estructura inicial del dominio de nuestra organización.**
5. De entre los comandos empleados para trabajar con OpenLDAP, ¿cuáles de ellos son los más utilizados? **slapcat, ldapadd, ldapsearch y ldapmodify.**


### 3

#### Caso práctico 3 -- Unir cliente Linux al dominio

```md
**Unir cliente Linux al dominio**
En este caso práctico, debes unir un cliente Linux al dominio (preferiblemente Ubuntu 22.04, que es el cliente más compatible con la versión de nuestro servidor LDAP y es la versión que se encuentra documentada en los apuntes, aunque se podría unir cualquier distribución Linux). 
A continuación, se te pide comprobar que tienes acceso al dominio iniciando sesión con un usuario, verificar que este se ha creado y consultar si el usuario tiene acceso a su home directory.

---

1. Verificación del nombre
Verificamos el nombre que tendrá el equipo cliente mostrando el fichero /etc/hostname y lo editamos en caso de querer darle otro nombre.
Otro paso sería indicar en el archivo /etc/hosts el nombre del equipo y el dominio al que pertenece en la entrada del equipo local con IP 127.0.1.1, así como otra entrada con los mismos nombres si la IP de este equipo se ha asignado de forma estática (como se puede apreciar en el apartado de la teoría).

2. Verificación de acceso
Verificamos que tenemos acceso por red al servidor LDAP, haciendo un ping, por ejemplo. El servidor tendrá que estar accesible por la red, claro. Y también verificamos que tenemos acceso a Internet para poder descargar el software necesario.

3. Instalación de Software
Instalación del software para unir el equipo al dominio, es decir, los paquetes libnss-ldap y nslcd (que instalarán los paquetes adicionales que necesiten), para lo que habrá que ejecutar el siguiente comando desde un terminal:
  $ sudo apt install libnss-ldap nslcd
En el proceso de instalación, el sistema nos solicitará
- la dirección IP del servidor LDAP (recordad eliminar la **i** del protocolo quedando **ldap://<IP>**),
- el nombre distintivo del dominio (*dc=<organización>,dc=<tipo organización>*),
- versión **3** (por defecto),
- Sí en crear la base de datos de administración del root local,
- No en el requerimiento de login para la base de datos de LDAP e 
- indicar el usuario administrador (*cn=<usuario administrador>dc=<organización>,dc=<tipo organización>*) y
- la contraseña cuando la solicite.

4. Modificación de fichero
Modificamos el fichero /etc/nsswitch.conf para añadirle el parámetro ldap entre files y systemd de las tres primeras líneas.

5. Actualización de autenticación
Actualizar la autenticación por pam para que se cree el home de los usuarios la primera vez que inicien sesión. Ejecutar el comando:
  $ sudo pam-auth-update
y activar la casilla para la creación del directorio home en el inicio de sesión.

6. Reinicio del equipo

7. Paso final
Una vez inicie el equipo, como no se ha iniciado sesión con ningún usuario del dominio anteriormente, estos no aparecerán en el listado (en el próximo inicio de sesión ya aparecerán). Seleccionar ¿No está en la lista? y de esta forma indicaremos las credenciales del usuario del dominio para iniciar sesión en el equipo (que creará la carpeta home de forma automática).
```

#### Ponte a prueba 3 -- Permitir que los usuarios puedan cambiar la contraseña

```md
**Permitir que los usuarios puedan cambiar la contraseña**
Este objetivo es muy importante, pues permite que no nos veamos obligados a emplear el teclado del administrador a la hora de crear el usuario. Esto es aún más relevante cuando el proceso de creación se va a realizar de forma masiva y automática con ayuda de un script. O, más aún, si en el futuro el usuario decide cambiar la contraseña por tener la sospecha de que esta ha sido desvelada.
> Para permitir que los usuarios puedan cambiar su contraseña —por defecto, deshabilitada—, basta con añadir las líneas pertinentes que hemos visto en la teoría de este apartado.
```

#### Ejercicios 3 -- test

1. A la hora de añadir un equipo cliente al dominio LDAP… **… la dirección IP puede ser dinámica o estática, pero lo importante es que pertenezca a la misma red que el servidor LDAP, para que el equipo pueda ser localizado (o, si está en otra red, para que pueda ser encaminado correctamente).**
2. Para unir a un equipo cliente (Ubuntu 22.04 Desktop) al dominio, instalaremos los paquetes siguientes: **Se instalarán los paquetes libnss-ldap y ldap-utils junto con sus dependencias, que pedirán información de dónde se encuentra el servidor LDAP, el dominio y el usuario administrador del dominio (y su contraseña), entre otras cosas.**
3. Si, tras instalar los paquetes necesarios para unir un equipo cliente Ubuntu 22.04 Desktop al dominio, nos damos cuenta de que no hemos indicado bien los parámetros solicitados, ¿qué tendremos que hacer? **Lanzaremos la orden dpkg-reconfigure ldap-auth-config, que nos permite ver la configuración actual y cambiar aquello que no sea correcto.**
4. Después de añadir un equipo cliente Ubuntu 22.04 Desktop al dominio, ¿tenemos que hacer algo para que los usuarios puedan ser buscados en la base de datos LDAP? **Ninguna de las opciones anteriores es correcta.**
5. Por defecto, en esta versión del cliente LDAP para Ubuntu 22.04 Desktop, ¿se creará el home del usuario en el equipo cliente? **Lo creará de forma automática si está habilitado en la configuración PAM. En caso de no estar habilitado, tenemos la opción de habilitarlo ejecutando el comando pam-auth-update.**


## QUIZ
