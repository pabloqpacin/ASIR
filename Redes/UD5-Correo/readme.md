# Redes UD5: Correo electrónico

- [Redes UD5: Correo electrónico](#redes-ud5-correo-electrónico)
  - [TEORÍA](#teoría)
  - [PRÁCTICA (McGrawHill)](#práctica-mcgrawhill)
    - [1](#1)
      - [Caso práctico 1 -- Estándares de correo electrónico](#caso-práctico-1----estándares-de-correo-electrónico)
      - [Ponte a prueba 1 -- Envíos masivos](#ponte-a-prueba-1----envíos-masivos)
      - [Ejercicios 1 -- test](#ejercicios-1----test)
    - [2](#2)
      - [Caso práctico 2 -- Hablar con servidor SMTP (telnet)](#caso-práctico-2----hablar-con-servidor-smtp-telnet)
      - [Ponte a prueba 2 -- `venus.test` (1 DNS, 2 MDA)](#ponte-a-prueba-2----venustest-1-dns-2-mda)
      - [Estudio de caso -- Envío de correos entre MTA](#estudio-de-caso----envío-de-correos-entre-mta)
      - [Ejercicios x -- test](#ejercicios-x----test)
    - [3](#3)
      - [Caso práctico 3 -- Hablar con servidor POP3 (telnet)](#caso-práctico-3----hablar-con-servidor-pop3-telnet)
      - [Ponte a prueba 3 -- `venus.test`](#ponte-a-prueba-3----venustest)
      - [Estudio de caso -- Suplantación de identidad](#estudio-de-caso----suplantación-de-identidad)
      - [Ejercicios 3 -- test](#ejercicios-3----test)
    - [x](#x)
      - [Caso práctico x -- foo](#caso-práctico-x----foo)
      - [Ponte a prueba x -- foo](#ponte-a-prueba-x----foo)
      - [Estudio de caso -- foo](#estudio-de-caso----foo)
      - [Ejercicios x -- test](#ejercicios-x----test-1)
  - [QUIZ](#quiz)


## TEORÍA

> apuntes.md

## PRÁCTICA (McGrawHill)

### 1

#### Caso práctico 1 -- Estándares de correo electrónico

```md
**Los estándares del correo electrónico**
Hay muchos aspectos del correo electrónico que los usuarios finales no saben, pero que tú, como *sysadmin*, sí debes conocer. Te proponemos que investigues en Internet la respuesta a las siguientes preguntas. Una pista para discriminar la información: cuanto más cercana a la fuente (p. ej., un RFC o la documentación oficial de una aplicación MTA), más fiable será.
```

- ¿Se pueden incluir varias direcciones de correo como destinatario (cabecera «To:»)? En caso afirmativo, ¿cómo se separan?
  - Sí, mediante comas
  - Los distintos destinatarios de To, Cc y Bcc se separan por una coma (RFC 5322, 3.6.3).
- Le queríamos escribir un correo a alice@mercurio.test, pero nos hemos equivocado tecleando y hemos escrito ALICE@mercurio.net. ¿Le llegará a alice o dará error? ¿Y si escribimos a ALICE@MERCURIO.TEST?
  - En principio debería dar error pero dependerá de la configuración del servidor corregirlo.
  - Sí en ambos casos: los sistemas de correo no distinguen mayúsculas de minúsculas ni en la parte del identificador (RFC 5321, 2.3.11) ni en la del dominio (RFC 1035, 3.1).
- Los correos electrónicos ¿pueden llevar tildes o eñes?
  - Sí, según la configuración del servidor.
  - De nuevo, hay que distinguir en la parte del identificador, donde está permitida la codificación UTF-8 (RFC 6532) y, por tanto, se acepta cualquier carácter internacional, y el dominio, donde también se aceptan, pero codificados con Punycode (RFC 5891). Prueba esto en el navegador: http:// xn--n3h.net y http://☃.net.
- ¿Qué particularidad tiene el dominio .test, que hemos usado en el ejemplo?
  - Que probablemente esté asociado a un dominio local de pruebas.
  - RFC 6761: los dominios .test están reservados para pruebas y no se puede acceder a ellos desde Internet.
- ¿Cómo podemos saber cuáles son los MTA asociados a un dominio cualquiera?
  - Me encantaría saberlo.
  - Con el comando `dig DOMINIO MX`. Por ejemplo: `dig gmail.com MX +short`


#### Ponte a prueba 1 -- Envíos masivos

```md
**Envíos masivos**
Supongamos que tenemos que enviar 5000 archivos a 5000 direcciones de correo distintas (un archivo a cada dirección). Para simplificar nuestra tarea, tenemos los archivos nombrados de la siguiente forma: `correo@dominio.zip`
Por ejemplo: `alice@mercurio.test.zip` es el archivo que debemos mandar a `alice@mercurio.test`.
```

Hay un MUA en modo línea comandos que puede ser muy útil para automatizar el envío de correos electrónicos en línea comandos, mutt, aunque puedes ser creativo y usar cualquier otra cosa.

Por simplicidad, para hacer pruebas puedes usar un par de direcciones propias o de compañeros, pero la solución debe ser escalable a 5000.

```bash
# Instalar mutt
sudo apt-get install -y mutt || sudo pacman -Syu --noconfirm mutt

# TODO: ...
```

#### Ejercicios 1 -- test

1. Los clientes de correo también se denominan... **MUA**
2. Los protocolos que se utilizan para descargar los correos desde un MDA son... **POP3 e IMAP4**
3. Los correos electrónicos permiten enviar... **Texto y contenido multimedia.**
4. Cuando un servidor MTA delega en otro MTA el envío de todo el correo, al segundo MTA se le llama... **Relay host.**
5. ¿Qué comando sirve para averiguar cuál es el MTA del dominio «example.com»? `dig example.com MX`

### 2

#### Caso práctico 2 -- Hablar con servidor SMTP (telnet)

```md
**Habla con un servidor SMTP**

> En la siguiente pantalla encontrarás un tutorial que es necesario seguir antes de abordar esta tarea, en el documento de trabajo **Configuración de un MTA con Postfix**.
Para comprobar que SMTP es realmente un protocolo sencillo, vamos a enviar un correo electrónico sin utilizar ningún cliente, solo con la herramienta **telnet**. Obviamente, nadie envía correos electrónicos así, pero si alguna vez nos enfrentamos a un problema de correo electrónico, el conocimiento a bajo nivel del protocolo nos ayudará a analizar la comunicación entre el cliente y el servidor y nos permitirá diagnosticar el problema con precisión.

Deberíamos poder conectarnos al puerto 25 de nuestro servidor **correo.mercurio.test**, simplemente haciendo
	$ telnet 127.0.0.1 25
	Trying 127.0.0.1...
	Connected to 127.0.0.1.
	Escape character is '^]'.
	220 correo.mercurio.test ESMTP Postfix (Ubuntu)

A partir de aquí, podemos dialogar con el servidor (comandos HELO, MAIL FROM, RCPT TO, etc.). Una vez enviado el correo, comprueba con el comando **mail** que el correo ha llegado a su destinatario.
  $ mail
  "/var/mail/ad": 1 message 1 new
  >N  1 alice@mercurio.tes Thu Jun 23 08:39 14/455  prueba
```

#### Ponte a prueba 2 -- `venus.test` (1 DNS, 2 MDA)

<!-- ```md
**Instalación del MTA en venus.test**

Para completar nuestro entorno de trabajo, vamos a crear una nueva máquina virtual que haga de MTA para el dominio **venus.test**. Durante la instalación, su **hostname** será **correo.venus.test**, y su IP en la red **vboxnet0** será 192.168.56.3. Una vez arrancado Ubuntu, instalaremos Postfix del mismo modo que hicimos en **mercurio**.

- Empieza creando la máquina virtual **correo-venus** con las mismas características que **correo-mercurio**, pero esta vez la IP del interfaz *host-only* será 192.168.56.3.
- No hace falta que configures un nuevo **bind9**: podemos usar el de **mercurio.test**. Añade una zona nueva para el dominio **venus.test** con su registro MX apuntando a **correo.venus.test**; asegúrate de que el servicio DNS de **correo.mercurio.test** escucha en la interfaz 192.168.56.2 y de que **correo.venus.test** usa 192.168.56.2 como servidor DNS.
``` -->
...

#### Estudio de caso -- Envío de correos entre MTA

...

#### Ejercicios x -- test

1. El tipo de registro DNS que identificar al MTA de un dominio es... **MX**
2. El comando SMTP para indicar el destinatario del mensaje es... **RCPT TO**
3. Es posible recibir correos externos dirigidos a nuestro dominio sin haber configurado el registro MX para ese dominio. **Falso**
4. Cuando hay varios registros MX, ¿cuál se usa primero? **El que tiene *menor* prioridad.**
5. ¿Qué MUA podemos utilizar para leer el correo desde la terminal de Linux en modo texto? **Alpine**


### 3

#### Caso práctico 3 -- Hablar con servidor POP3 (telnet)

```md
**Habla con un servidor POP3**

> Antes de dar comienzo a este caso práctico, debes haber realizado el tutorial del documento de trabajo **Configuración de un MDA con Dovecot** que se encuentra en la siguiente pantalla.

Al igual que hicimos con SMTP, vamos a dialogar por el puerto POP3 con nuestro Dovecot recién instalado simulando que somos un MUA. Para ello, utilizaremos nuevamente **telnet** desde **correo.mercurio.test**:

	$ telnet localhost 110
	Trying 127.0.0.1...
	Connected to localhost.
	Escape character is '^]'.
	+OK Dovecot (Ubuntu) ready.

Q: Intenta reproducir la comunicación de la teoría: obtén la lista de mensajes pendientes de ser leídos, muestra alguno de ellos y, posteriormente, bórralo.

A: Usa los comandos USER, PASS, LIST, RETR y DELE, según se explica en la teoría.

Q: Investiga: supón que has borrado por accidente un mensaje, pero aún no has cerrado la sesión con el comando QUIT. ¿Hay alguna manera de recuperarlo?

A: Respecto a la recuperación de correos borrados, una búsqueda de los comandos POP3 nos revelará que el comando RSET recupera todos los mensajes borrados en la sesión actual; es decir, podemos recuperar correos borrados con el comando DELE mientras no hagamos QUIT.
```

#### Ponte a prueba 3 -- `venus.test`

```md
**Instalación de MDA de venus.test**

> Siguiendo las instrucciones del documento Configuración de un MDA con Dovecot, instala Dovecot en el servidor correo.venus.test, del mismo modo que hicimos en correo.mercurio.test.

Thunderbird es un cliente de correo multicuenta, así que vamos a añadir una cuenta nueva para el usuario bob@venus.test que acceda por SMTP e IMAP4 al servidor correo.venus.test.

Vamos a volver a repetir las tres pruebas del caso práctico del apartado anterior, pero esta vez enviaremos los correos desde Thunderbird, de modo que, además de comprobar que los MTA siguen funcionando como deben, los MDA y el MUA también lo hacen:

alice@mercurio.test escribe a bob@venus.test.
bob@venus.test responde.
alice@mercurio.test responde a la respuesta.

Recuerda que, en resumidas cuentas, los pasos que se deben seguir son:

- Instalar Dovecot.
- Activar en Dovecot el servicio SASL, que será utilizado por Postfix para autenticar a los usuarios.
- Activar en Postfix el puerto submission, configurado solo para aceptar correo de usuarios autenticados.
- No olvides pasar las tres pruebas.
```

...

#### Estudio de caso -- Suplantación de identidad

...

#### Ejercicios 3 -- test

1. En el protocolo POP3, el puerto `110` (A) se utiliza por defecto para el tráfico en texto plano (sin cifrar), y el `995` (B), para el tráfico cifrado SSL o TLS
2. ¿Cómo se denomina al servidor encargado de entregar correo al MUA? `MDA`
3. Un MUA utiliza el protocolo `POP3` (A) o `IMAP4` (B) para descargar el correo desde el MDA.
4. El protocolo IMAP4 usa los puertos `143` (A) y `993` (B) por defecto.
5. El tráfico POP3 en texto plano está obsoleto, y se recomienda cifrar las comunicaciones mediante... **TLS 1.2 o superior**


### x

#### Caso práctico x -- foo
#### Ponte a prueba x -- foo
#### Estudio de caso -- foo
#### Ejercicios x -- test

1. foo
2. foo
3. foo
4. foo
5. foo

## QUIZ
