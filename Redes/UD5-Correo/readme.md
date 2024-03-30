# Redes UD5: Correo electrónico

- [Redes UD5: Correo electrónico](#redes-ud5-correo-electrónico)
  - [TEORÍA](#teoría)
  - [PRÁCTICA (McGrawHill)](#práctica-mcgrawhill)
    - [1](#1)
      - [Caso práctico 1 -- Estándares de correo electrónico](#caso-práctico-1----estándares-de-correo-electrónico)
      - [Ponte a prueba 1 -- Envíos masivos](#ponte-a-prueba-1----envíos-masivos)
      - [Ejercicios 1 -- test](#ejercicios-1----test)
    - [x](#x)
      - [Caso práctico x -- foo](#caso-práctico-x----foo)
      - [Ponte a prueba x -- foo](#ponte-a-prueba-x----foo)
      - [Estudio de caso -- foo](#estudio-de-caso----foo)
      - [Ejercicios x -- test](#ejercicios-x----test)
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
