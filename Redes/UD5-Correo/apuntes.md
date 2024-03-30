# Unidad 5 McGrawHill <br> Servicio de Correo Electrónico



```md
# Objetivos
1. Instalar y configurar un servicio completo de correo electrónico: MUA, MTA y MDA.
2. Enviar y recibir correo desde las cuentas creadas en el servidor.
3. Aplicar técnicas para impedir usos indebidos del servidor.
4. Administrar servicios de mensajería instantánea y listas de distribución.
```

- [Unidad 5 McGrawHill  Servicio de Correo Electrónico](#unidad-5-mcgrawhill--servicio-de-correo-electrónico)
  - [1. Elementos del servicio. Estructura de los mensajes. MUA.](#1-elementos-del-servicio-estructura-de-los-mensajes-mua)
    - [1.1 Un poco de historia](#11-un-poco-de-historia)
    - [1.2 Formato de un correo electrónico](#12-formato-de-un-correo-electrónico)
    - [1.3 Elementos del servicio](#13-elementos-del-servicio)
    - [1.4 ¿Qué hace el MTA cuando le llega un correo?](#14-qué-hace-el-mta-cuando-le-llega-un-correo)
    - [1.5 Recepción de correo](#15-recepción-de-correo)
  - [2. MTA: instalación y configuración](#2-mta-instalación-y-configuración)
    - [2.1 foo](#21-foo)
    - [2.2 foo](#22-foo)
  - [3. MDA: instalación y configuración](#3-mda-instalación-y-configuración)
    - [3.1 foo](#31-foo)
    - [3.2 foo](#32-foo)
  - [4. Correo seguro](#4-correo-seguro)
    - [4.1 foo](#41-foo)
    - [4.2 foo](#42-foo)
  - [5. Listas de distribución y servicios de mensajería instantánea](#5-listas-de-distribución-y-servicios-de-mensajería-instantánea)
    - [5.1 foo](#51-foo)
    - [5.2 foo](#52-foo)


## 1. Elementos del servicio. Estructura de los mensajes. MUA.

```md
El correo electrónico es un servicio que permite a sus usuarios intercambiar mensajes consistentes en texto o cualquier contenido multimedia a través de la red. Es el principal medio de comunicación entre personas a través de Internet, y está totalmente basado en estándares libres y abiertos, lo que garantiza su acceso universal, ya que cualquiera puede implementar su propio cliente o servidor basándose en dichos estándares.
Cuando un usuario quiere enviar o recibir correo electrónico, utiliza un cliente de correo, que puede ser una aplicación local, como Outlook Express o Mozilla Thunderbird, o web, como Gmail.com o Outlook.com. El cliente, a su vez, se comunica con dos tipos de servidor en la red: el de transporte, para el envío de correos, y el de entrega, para su recepción. Para poder enviar un correo electrónico, el usuario debe contar con una dirección propia y, además, conocer la de su destinatario o destinatarios.
En este apartado vamos a conocer en detalle la *comunicación entre los agentes de usuario, transporte y entrega*, y la información que contiene un correo electrónico.
```

### 1.1 Un poco de historia

- Primer email: 1971, Ray Tomlinson, ARPANET
  - SNDMSG: plataforma cliente-servidor, usuario@servidor
  - 1977: RFC 733 (*Arpa Network text messages*): de describe formato de email. Evolución hasta 2008: RFC 5322 (*Internet message format*)
  - RFC: 791==IP 959==FTP 2616==HTTP. [Documentación recomendada](#)


### 1.2 Formato de un correo electrónico

- Formato de direcciones: `identificador@dominio`

| Apartado      | Keyword       | Ejemplo
| ---           | ---           | ---
| Remitente     | From/De       | alice@mercurio.test
| Destinatario  | To/A          | bob@venus.test
| Copia         | Cc            | carlos@tierra.test
| Copia oculta  | Cco/Bcc       | david@marte.test
| Asunto        | Subject       | ¡buenos días!
| Cuerpo        | Body          | QWERTYUIOP

### 1.3 Elementos del servicio

- 3 aplicaciones:
  - **MUA** (*Mail User Agent*)
    - Cliente de correo: aplicación local en móvil o escritorio (Outlook, Thunerbird), o aplicación web (Gmail, Proton).
    - El usuario interactúa directamente con el MUA para redactar y escribir correos electrónicos.
  - **MTA** (*Mail Transport Agent*)
    - Servidor SMTP (protocolo): recibe el correo del MUA y determina el MTA de destino.
    - **Necesario asociado en cada dominio**.
  - **MDA** (*Mail Delivery Agent*)
    - Entrega el correo al MUA relevante para que el usuario lo lea.
    - Protocolos POP3 y IMAP4
- Sobre los DOMINIOS:
  - 'Cada dominio que desee enviar/recibir corroes, necesita tener asociado al menos un MTA encargado de gestionar correos entrantes y salientes del dominio'.
  - 'Para indicar el MTA asociado a cada dominio se utiliza el registro MX (*mail exchange*) del DNS: **si resolvemos el registro MX de un nombre de dominio, el resultado es el servidor SMTP/MTA de dicho dominio**. En consecuencia, un dominio que no tenga definido su registro MX no podrá recibir correo'.
- Protocolos:
  - **SMTP** (*Simple Mail Transfer Protocol*): puertos 25==envío-entre-MTA 465|587==envío-desde-MUA (465 cifrado TLS, otros opcionalmente mediante comando `STARTTLS`)
  - **POP3** (*Post Office Protocol 3*): recepción, puertos 995==cifrado-TLS y 110==text-plano
  - **IMAP4** (*Internet Message Access Protocol 4*): recepción, puertos 993==TLS y 143==text-plano

### 1.4 ¿Qué hace el MTA cuando le llega un correo?

- 'La misión del MTA es recibir correos mediante SMPT y hacerlos llegar a sus destinatarios. Cada dominio debe tener asociado un MTA, así que, en función de cada destinatario, se presentan dos casos distintos':
  - Destinatario y remitente pertenecen al mismo dominio
    - El MTA almacena el correo en el propio servidor, a la espera de que el usuario lo **lea** con un cliente de correo local o se lo descargue vía POP3/IMAP4.
  - Destinatario y remitente pertenecen a distintos dominios
    - OPCIÓN 1: 'intentar enviarlo directamente al MTA de destino: consulta DNS del registro MX para averiguar MTA e intentar enviarlo por SMTP'.
    - OPCIÓN 2: 'enviarlo a MTA intermediario/*relay host*/smarthost. Útil frente a spam de ordenadores infectados'. <!-- Se hace pasar todo el correo por un único servidor, que es donde se implementan todas las medidas de seguridad contr aspam, virus u otras amenazas -->

### 1.5 Recepción de correo

- 'Cuando el correo llega al MTA de destino, se queda almacenado en el servidor a la espera de que el usuario lo lea por alguno de estos 3 medios':
  - En local mediante terminal: cliente en modo texto, como `alpine`
  - En remoto mediante POP3 (descarga): se descargan al ordenador cliente y luego se pueden borrar o no del servidor
  - En remoto mediante IMAP4 (acceso remoto): igual pero más completo/complejo (sync,carpetas,...); recomendado


## 2. MTA: instalación y configuración

```md
El intercambio de correo electrónico se realiza entre servidores llamados agentes de transporte de correo, *mail transfer agents* o MTA. De forma simplificada, cuando el usuario escribe un correo electrónico en un MUA, ya sea Mozilla Thunderbird, Outlook, Gmail o la aplicación en modo texto *mail*, el mensaje se transmite desde el MUA a un MTA mediante el protocolo SMTP. Por este motivo, también nos referimos habitualmente a los MTA como servidores SMTP.
En este apartado vamos a conocer en detalle cómo se comunican los MTA entre sí y configuraremos un entorno virtual con dos MTA y dos usuarios, Alice y Bob, que al finalizar los casos prácticos serán capaces de enviarse correos el uno al otro.
```

- SMPT es un protocolo basado en comandos de texto legible, tan sencillo que incluso con las herramientas `telnet` o `nc` podríamos enviar mensajes sin necesidad de instalar un cliente específico.

### 2.1 El protocolo SMTP

- MTA recibe correo y los dominios de destino y origen coinciden, la entrega se hace en el propio servidor. Pero si el correo va dirigido a un dominio distinto, el MTA de origen debe intentar hacérselo llegar al MTA de destino: (1) bien directamente, o (2) bien a través de otro MTA intermediario (*smarthost*)
- Protocolo sencillo. RFC 5321. **Comandos** enviados en modo texto desde el cliente al servidor:
  - `HELO/EHLO`: identifica al cliente y tipo de protocolo (básico VS extensiones)
  - `MAIL FROM`: remitente
  - `RCPT TO`: destinatario (un comando por cada destinatario)
  - `DATA`: contenido + **cabecera**: incluye `From` `To` `Cc` `Bcc` `Date` y `Subject` (los últimos 2 son obligatorios). Formato en RFC 5322
  - `. final`: indica el final del contenido del correo
  - `QUIT`: finaliza la conexión
- Comunicación SMTP:
  - \<tabla>


### 2.2 foo

## 3. MDA: instalación y configuración
### 3.1 foo
### 3.2 foo

## 4. Correo seguro
### 4.1 foo
### 4.2 foo

## 5. Listas de distribución y servicios de mensajería instantánea
### 5.1 foo
### 5.2 foo

---

```foo
```

