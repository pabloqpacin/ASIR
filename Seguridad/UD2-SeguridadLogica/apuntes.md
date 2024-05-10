# Unidad 2 McGrawHill <br> Seguridad Lógica

```md
# Objetivos

1. Conocer las listas de control de acceso y justificar su necesidad, como ampliación de permisos y sus propiedades.
2. Estudiar las políticas de contraseñas de los usuarios.
3. Conocer el concepto de criptografía y su función como mecanismo de seguridad, y estudiar los diferentes tipos de criptografía y sus usos más comunes.
4. Estudiar y trabajar con la firma digital y el certificado digital.
5. Comprender la importancia de la biometría como método de autenticación y sus tipos.
6. Analizar y comprender el análisis forense y sus diferentes fases como mecanismo de control y prevención de ataques.
```
- [Unidad 2 McGrawHill  Seguridad Lógica](#unidad-2-mcgrawhill--seguridad-lógica)
  - [1. Listas de control de acceso: ACL](#1-listas-de-control-de-acceso-acl)
    - [1.1 Listas de control de acceso ACL (en ext4 GNU/Linux Ubuntu)](#11-listas-de-control-de-acceso-acl-en-ext4-gnulinux-ubuntu)
      - [A. Requerimientos del sistema](#a-requerimientos-del-sistema)
      - [B. Tipos de entrada en una ACL](#b-tipos-de-entrada-en-una-acl)
      - [C. Utilización de ACL (ext4)](#c-utilización-de-acl-ext4)
    - [1.2 foo](#12-foo)
  - [2. Establecimiento de políticas de contraseña](#2-establecimiento-de-políticas-de-contraseña)
    - [2.1 Ataque por diccionario](#21-ataque-por-diccionario)
    - [2.2 Ataque por fuerza bruta](#22-ataque-por-fuerza-bruta)
  - [3. Criptografía: simétrica y asimétrica. Sistemas híbridos](#3-criptografía-simétrica-y-asimétrica-sistemas-híbridos)
    - [3.1 Tipos de criptosistemas](#31-tipos-de-criptosistemas)
    - [3.2 Criptografía simétrica](#32-criptografía-simétrica)
      - [A. Cifrado en bloque](#a-cifrado-en-bloque)
      - [B. Cifrado en flujo (stream cipher)](#b-cifrado-en-flujo-stream-cipher)
      - [C. Comparación entre cifrado en bloque y flujo](#c-comparación-entre-cifrado-en-bloque-y-flujo)
    - [3.3 Métodos mixtos y múltiples](#33-métodos-mixtos-y-múltiples)
    - [3.4 Funciones hash](#34-funciones-hash)
    - [3.5 Criptografía asimétrica o de clave pública](#35-criptografía-asimétrica-o-de-clave-pública)
    - [3.6 Comparación entre criptografía simétrica y asimétrica](#36-comparación-entre-criptografía-simétrica-y-asimétrica)
    - [3.7 Sistemas de cifrado híbridos](#37-sistemas-de-cifrado-híbridos)
      - [A. PGP (pretty good privacy)](#a-pgp-pretty-good-privacy)
      - [B. GPG (gnu privacy guard)](#b-gpg-gnu-privacy-guard)
  - [4. Firma digital. Certificados digitales](#4-firma-digital-certificados-digitales)
    - [4.1 Identidad digital](#41-identidad-digital)
      - [A. Necesidad de la identificación digital](#a-necesidad-de-la-identificación-digital)
      - [B. Tarjeta o dispositivo](#b-tarjeta-o-dispositivo)
    - [4.2 Firma digital](#42-firma-digital)
      - [A. Funcionamiento de la firma digital](#a-funcionamiento-de-la-firma-digital)
      - [B. Firma electrónica](#b-firma-electrónica)
    - [4.3 Certificados digitales](#43-certificados-digitales)
      - [A. Certificado digital: tecnología](#a-certificado-digital-tecnología)
  - [5. Sistemas biométricos de identificación](#5-sistemas-biométricos-de-identificación)
    - [5.1 Sistemas biométricos actuales](#51-sistemas-biométricos-actuales)
    - [5.2 Ejemplos de sistemas biométricos](#52-ejemplos-de-sistemas-biométricos)
      - [A. Emisión de calor](#a-emisión-de-calor)
      - [B. Huella digital](#b-huella-digital)
      - [C. Verificación de voz](#c-verificación-de-voz)
      - [D. Verificación de patrones oculares](#d-verificación-de-patrones-oculares)
  - [6. Análisis forense en sistemas informáticos](#6-análisis-forense-en-sistemas-informáticos)
    - [6.1 Incidente de seguridad informática](#61-incidente-de-seguridad-informática)
    - [6.2 Evidencia digital](#62-evidencia-digital)
      - [Regla de oro de la investigación forense: proteger el original](#regla-de-oro-de-la-investigación-forense-proteger-el-original)


## 1. Listas de control de acceso: ACL

```md
En esta unidad introducimos el concepto de seguridad lógica y pasamos a estudiar diferentes medidas o procedimientos que protejan a activos de la organización tan importantes como son los datos, el software que los procesa y, en general, los accesos no autorizados al sistema informático. 

El objetivo siempre es intentar evitar o minimizar el impacto que tendría sobre el sistema cualquier amenaza de tipo lógico (malware, accesos no autorizados, pérdida de integridad, entre otras). 

Comenzamos con las listas de control de acceso, o ACL, que añaden flexibilidad a la gestión de los permisos que los usuarios y los grupos tienen sobre los recursos del sistema.
```

- **Seguridad Lógica**: conjunto de procedimientos existentes para controlar el acceso lógico no autorizado a la información, tanto si se intenta realizar mientras se encuentra almacenada como durante su transmisión
  - *AKA*: aplicación de barreras y procedimientos de autenticación y autorización -- "todo lo que no está permitido debe estar prohibido"
  - *Objetivos*: restringir acceso a programas/archivos, asegurar uso correcto software, integridad

### 1.1 Listas de control de acceso ACL (en ext4 GNU/Linux Ubuntu)

- **ACL**: proporcionan nivel adicional de seguridad a los archivos, extendiendo el clásico esquema de permisos en Unix (POSIX -interfaz estándar del OS y entorno-), permitiendo asignar/denegar permisso a usuarios/grupos concretos <!-- `umask` -->
  - *Se distingue*: ACL mínima (usuario, grupo, otros) & ACL extendida (máscara, named user, named group)
  - *Se pueden configurar*: por usuario, grupo o máscara de permisos

#### A. Requerimientos del sistema

- *Comprobar*:
  - kernel: `grep ACL /boot/config-$(uname -r)`
  - sistema de archivos: `grep acl /etc/fstab`
  - utilidades: `getfacl file.md && setfacl --help`

#### B. Tipos de entrada en una ACL

| Tipo de entrada       | Forma en texto    | Mecanismo
| ---                   | ---               | ---
| Owner                 | `u::rwx`          | POSIX
| Named user            | `u:name:rwx`      | ACL
| Owning group          | `g::rwx`          | POSIX
| Named group           | `g:name:rwx`      | ACL
| Mask                  | `m::rwx`          | POSIX
| Others                | `o::rwx`          | ACL

- **...**: POSIX == obligatorio, ACL == no obligatorio
- [ ] TODO: ensure ACL is on in some VM


#### C. Utilización de ACL (ext4)

- ...
- [ ] mucho `getfacl` & `getfacl`...

### 1.2 foo

## 2. Establecimiento de políticas de contraseña

```md
En este apartado abordamos el establecimiento de políticas de contraseñas como mecanismo de protección de accesos no autorizados al sistema informático. 
Dentro de las políticas de seguridad de la organización se deben establecer cuantas normas sean necesarias para garantizar que las contraseñas utilizadas por los usuarios para acceder a los recursos del sistema sean seguras y robustas, capaces de soportar ataques típicos de contraseña, como son los ataques de diccionario y de fuerza bruta.
Por otro lado, también se deben proveer políticas o normas para el almacenamiento seguro de las contraseñas, establecer períodos de caducidad de estas y realizar el adiestramiento necesario a los usuarios para que tomen conciencia de la importancia de la salvaguarda de sus contraseñas.
```

- **Contraseña**: primer mecanismo de control de acceso, previo a la escalada de privilegios
  - *Consideraciones*: la complejidad y que sea secreta/privada (almacenarlas en lugares seguros, cambiarlas periódicamente)
  - *Políticas*: tamaño mínimo, caducidad, núm. intentos, no repetir en histórico, calidad y robustas, formación
  - *Ataques*: diccionario & de fuerza bruta
  - *Requerimientos*: contraseñas fuertes (...) VS contraseñas débiles (...)
  - *Tendencias*: Single Sign-On, MultiFactor Authentication
  - *Ubicación*:
    - Linux: `/etc/shadow`
    - Windows: `PanelControl > AdmonCredenciales > CredencialesWeb > CredencialesWindows`

### 2.1 Ataque por diccionario

- **Ataque por diccionario**: mecanismo utilizado por intrusos para intentar averiguar una contraseña probando una lista de palabras contenidas en un diccionario
  - *Defensa*: contraseña robusta, máx. intentos
  - *Herramienta*: `JohnTheRipper`

### 2.2 Ataque por fuerza bruta

- **Ataque por fuerza bruta**: se realiza probando todas las combinaciones posibles de letras, números y caracteres especiales hasta encontrar aquella que permite el acceso
  - *Notas*: también usan diccionarios...; tema texto/cifrado -> necesario saber algoritmo...; número de claves posibles == `2^n`...
  - *Herramientas*: `JohnTheRipper`, `Ophcrack`, `Medusa`


## 3. Criptografía: simétrica y asimétrica. Sistemas híbridos

```md
Nos adentramos en el mundo de la criptografía y sus usos dentro de la seguridad informática. Conoceremos diferentes algoritmos criptográficos pero sin llegar a sus fundamentos matemáticos, que están fuera de nuestros objetivos.
Estudiaremos los diferentes tipos de criptografía moderna incidiendo en las fortalezas de cada una de ellas y en sus debilidades, así como en sus ámbitos de uso.
Por último veremos los sistemas híbridos, los cuales consiguen aunar las propiedades y características de los sistemas criptográficos implicados.  Están de plena actualidad y son el pilar en el que descansa la seguridad, por ejemplo, en el envío seguro de correos electrónicos, ya que permiten su firma y encriptación.
```

- `Criptología = Criptografía + Criptoanálisis`
  - **Criptología**: disciplina que trata los problemas teóricos relacionados con la seguridad en la transmisión de mensajes en clave[, entre un emisor y un receptor, a través de un canal de comunicación]
  - **Criptografía**: disciplina que engloba diferentes técnicas capaces de transformar datos legibles en datos no legibles y viceversa, por medio de funciones matemáticas (algoritmos)
  - **Criptoanálisis**: disciplina que compromete la seguridad de un criptosistema
  - *Funcionamiento*: algoritmos tranforman texto plano en texto cifrado mediante **clave**
  - **Criptosistema**: conjunto de todos los mensajes planos, cifrados (criptogramas), claves, transformaciones/funciones de cifrado, t/f de desifrado
  - *Objetivos criptosistema*: encarecer la 'deencriptación' maliciosa & que lleve mucho tiempo

### 3.1 Tipos de criptosistemas

- DOS TIPOS
  - **Simétricos o de clave privada**: misma clave para encriptar y desencriptar
  - **Asimétricos o de clave pública**: utiliza dos claves distintas (computacionalmente más costosa)
- *Robustez*: determinada por el algoritmo usado & el tamaño de la clave
- "En el mundo real se codifican los mensajes (largos) mediante <u>algoritmos simétricos</u>, que suelen ser muy eficientes, y luego se hace uso de la <u>criptografía asimétrica</u> para codificar las claves simétricas (cortas)

### 3.2 Criptografía simétrica

- **Criptografía simétrica**:
  - *Condición*: Si tenemos un mensaje, lo ciframos empleando una clave y luego lo desciframos empleando la misma clave (debe ser transmitida), debemos obtener de nuevo el mensaje original
  - *Ventajas*: simple, rápida y eficiente; 40+ bits
  - *Desventajas*: distribución de claves, 'dificultad de almacenar y proteger muchas claves diferentes; cada par de usuarios debe tener su clave secreta particular'
  - *Tipos*: de bloques o de flujo (block VS stream cipher)
  - **Principales algoritmos**: DES, TDES O 3DES, IDEA, RC5, `AES`

#### A. Cifrado en bloque

- **Block cipher**: el texto plano se cifra en bloques de tamaño fijo
  - *Condición cifrado*: 'nunca deben cifrarse los bloques individual e independientemente, sino encadenados, de manera que el cirado de cada bloque dependa de todos los bloques que lo preceden
  - *Propiedades buen algoritmos (**CDC**)*: confusión (no dar pistas sobre cuán parecido es el input a la clave real), difusión (ocultar estadísticas relación texto plano con cifrado), completitud (...)

#### B. Cifrado en flujo (stream cipher)

- **Stream cipher**: el texto en claro se cifra bit a bit
  - *Funcionamiento*:
    - clave de modificación (secuencia cifrante) diferente para cada bit del texto
    - la secencia cifrante se crea mediante un algoritmo determinista de generación de números pseudoaleatorios a partir de una <u>**semilla**</u>, que constituye la clave secreta
    - cirado muy rápido, usado en aplicaciones en tiempo real (como las de audio y vídeo)
  - *Info*: versión moderna del cifrado por sustitución de la criptografía clásica
  - **Algoritmos relevantes**: RC4 e la RSA Security (Rivest Cipher #4), desarrollado en 1987

#### C. Comparación entre cifrado en bloque y flujo

- Ambos rápidos pero FLUJO más
- FLUJO puede cifrar a ráfagas, sin esperar a que estén los bloques completos
- FLUJO nunca reutilizar claves
- longitudes oscilan entre 32 y 256 bits
- ambos comparten problema: ¿Cómo transmitir la clave de forma segura?

### 3.3 Métodos mixtos y múltiples

...

### 3.4 Funciones hash

- aka funcinoes unidireccionales
- Usadas principalmente para resolver el problema de <u>la integridad de los mensajes</u>, así como <u>la autenticación de estos y de su origen</u>
- no es cifrado (porque no se puede revertir al original)

---

### 3.5 Criptografía asimétrica o de clave pública

- 1976; clave pública + clave privada
- 'El texto claro codificado con una clave privada necesita su correspondiente clave pública par ser descifrado, y viceversa, el texto codificado con una clave pública solo puede ser descifrado con su clave privada. La **clave privada** solo debe ser conocida por su propietario; la **clave pública** es abierta y se puede conocer libremente.
- Se garantiza la **confidencialidad**
- Uso en firmas digitales...
- **Compañías Certificadoras (CA)**: certifican que una clave pública pertenece a tal o cual usuario|organización
- Los protocolos de encriptación SET y PGP utilizan claves generadas con números prrimos de un tamaño que los hace prácticamente intocables (de 1024 bits o más)
- El PROBLEMA de la criptografía asimétrica es que, cuando el texto a cifrar es muy largo, el proceso de cifrado es muy lento. <u>Lo que se hace en los actuales protocolos en utilizar criptografía simétrica (tipo AES o IDEA) para el cifrado de textos y **criptografía asimétrica** para la comunicación de la clave simétrica utilizada</u>
- Un algoritmo de clave pública debe cumplir lo siguiente:
   1. foo
   2. bar
   3. baz
- Ventajas
   1. foo
   2. bar
   3. baz
- Inconvenientes
   1. foo
   2. bar
   3. baz 


### 3.6 [Comparación entre criptografía simétrica y asimétrica](https://drive.google.com/file/d/1G582j78xd-Y8oJOCXjP7gkhRDyofg4Ei/view)

| Atributo                | Clave simétrica                 | Clave asimétrica
| ---                     | ---                             | ---
| Años en uso             | Miles                           | Menos de 50
| Velocidad               | Rápida                          | Lenta
| Uso principal           | Cifrado grandes volúmenes datos | Intercambio de claves, firma digital
| Claves                  | Compartidas entre Em. y Re.     | Privada: solo yo; Pública: pública
| Intercambio de claves   | Difícil por canal inseguro      | Pública por cualquier cana; Privada nunca
| Longitud de claves      | 56 bits (vuln.), 256 (seg.)     | 1024 bits mínimo
| Algoritmos              | DES, 2DES, BLowfish, IDEA, AES  | Diffie-Hellman, RSA, DSA, EIG amal
| Servicios de seguridad  | Confidenc. Integr. Autentic.    | Confidenc. Integr. Autentic. No repudio

- SEGURIDAD
  - **Criptografía simétrica**: una única clave para cifrar en el emisor y descifrar en el destino: la seguridad del sistema reside en lo segura que sea dicha clave
  - **Criptografía asimétrica**: cada usuario tiene un par de calves pública y privada (lo que una hace, la otra lo deshace)


### 3.7 Sistemas de cifrado híbridos

> 'La seguridad del sistema reside en la dificultad computacional de encontrar la clave privada a partir de la clave pública'

#### A. PGP (pretty good privacy)

- Criptosistema híbrido de 5 fases:
  1.  **Compresión**: menor tamaño y más protección (eg. patrones) sobre el texto plano
  2.  **Clave de sesión**: clave simétrica para cifrar el texto plano, resultante de mover ratón o teclear xd
  3.  **Cifrado de la clave de sesión**: mediante clave pública del receptor (asimétrica)
  4.  **Envío del texto**: se adjunta clave de sesión cifrada + texto cifrado
  5.  **Descifrado**: receptor usa clave privada para recuperar la clave de sesión, con la que PGP descifra el texto

#### B. GPG (gnu privacy guard)

- Sustituye a PGP siendo open source, utiliza el estándar OpenPGP; disponible por defecto en muchas distros
- Características: ...


## 4. Firma digital. Certificados digitales

```md
En relación a la criptografía asimétrica, en el apartado anterior se explicó que la clave pública generada puede ser publicada para su disponibilidad por parte de terceros. Pero llegados a este punto, se plantea la duda de cómo saber si la clave pública realmente pertenece a quien dice ser su propietario.
Y es en este punto donde entran la firma digital y los certificados digitales. Su objetivo es garantizar la identidad del firmante y la del mensaje respecto a la firma digital y, con la creación de las autoridades de certificación, tener la certeza de que la clave pública utilizada es de quien dice ser su propietario, mediante la emisión de certificados digitales. 
```

### 4.1 Identidad digital

- "Conjunto de elementos necesarios para garantizar la identidad a través de medios elecrónicos, así como los que permiten gestionar y proporcionar funcionalidad en este medio"
- Legislación España: Proyecto EMODEL, Plan AVANZA 1|2 (2005-10|2011-15), PITL (2016), agenda España Digital 2025: 5G, ciberseguridad y digitalización Administración|empresas

#### A. Necesidad de la identificación digital

- Garantizar autenticación, autorización, integridad y confidencialidad
- Mecanismos: contraseñas, huellas, tarjetas, firma digital, certificados digitales

#### B. Tarjeta o dispositivo

- Se autoriza la tarjeta (no la persona), se puede falsificar, generalmente + código/contraseña (eg. PIN)
- Tipos de tarjetas: RFID (radio), contactless, USB
- DNIe: acreditar identidad de persona, firmar documentos digitalmente

### 4.2 Firma digital

- "Conjunto de datos asociados a un mensaje que permiten asegurar la identidad del firmante y la integridad del mensaje" [; 1976 Diffie y Hellman]
- Motivos de firma en el mundo real: autenticación, inalterabilidad, autoría, adhesión, no repudio
- **"Firmar digitalmente un documento es cifrar un resumen de él, obtenido mediante una funcińo hash, con la clave privada"**

#### A. Funcionamiento de la firma digital

- Modo de funcionamiento:
  1. Cada participante tiene un par de claves, una para encriptar y otra para desencriptar
  2. Se comparte la pública
  3. E emisor hace una función hash de los datos
  4. El emisor encripta el hash con la clave privada (firma digital)
  5. El destinatario recibe el mensaje y calcula el hash, desencripta la firma con la clave pública del emisor y compara ambos hashes: si coinciden, la firma es válida
- Basta con encriptar el hash, no el mensaje entero

#### B. Firma electrónica

- "Una firma electrónica es una firma digital que se ha almacenado en un soporte hardware no modificable"
- 'La firma digital contenida en soportes de tiop ROM tiene un uso muy extendido y se utiliza en gran cantidad de tarjetas de acceso, tarjetas de telefonía, RFID y ~~otras actividades en las que es necesario identificar de forma inequívoca a una persona u objeto. Un ejemplo especial y destacado es~~ el DNIe'

### 4.3 Certificados digitales

- "Un certificado digital es un documento digital mediante el cual un tercero confiable (CA, Autoridad de Certificación) garantiza la correspondencia entre la identidad de un sujeto, entidad u organización y una clave pública"
- Soluciona el problema de la <u>suplantación de claves</u> pero se necesita depositar la confianza en un tercerto
- La CA tiene sus propias claves pública y privada
- Algunas CA:
  - nacionales: FNMT, ACCV
  - internacionales: Verisign, Thawte

<!-- ```md
Estas CA están pensadas para certificar claves públicas en una conexión segura mediante el navegador. Sus claves públicas (necesarias para que el navegador pueda verificar los certificados emitidos por estas CA) se pueden descargar de la red, para lo cual hay que ir a la página web de dicha CA. Pero algunas de estas claves públicas ya se encuentran en el navegador, ya que fueron entregadas por la CA directamente al fabricante. El certificado y la clave pública se consideran información no sensible que puede distribuirse a terceros. Por tanto, el certificado, sin más, no puede ser utilizado como medio de identificación, pero es la pieza impres- cindible en los protocolos usados para autenticar a las partes de una comunicación digital, al garantizar la relación entre una clave pública y una identidad.
En la documentación complementaria situada al final de la unidad tienes disponible el archivo Protocolos_ seguros.pdf, en el que se detallan las principales características de los protocolos utilizados en las conexio- nes seguras a través del navegador.
Existen variados formatos para los certificados digitales, pero los más usuales se rigen por el estándar UIT-T X.509. Y una implementación de X.509 es Secure Sokets Layer (SSL), otra es IPSec (Internet Protocol security). Un certificado emitido por una entidad de certificación autorizada (CA), además de estar firmado digitalmen- te por esta, debe contener la siguiente información:
1. Número de versión y serie.
2. Información sobre la entidad de certificación (CA) que expide y firma el certificado.
3. Identidad del propietario del certificado (identidad a certificar).
4. Fecha de emisión y expiración del certificado.
5. Clave pública del usuario.
6. Algoritmo criptográfico usado para firmar el certificado.
7. Firma digital del certificado por parte de la CA.
8. Otros contenidos.
Los puntos 3 y 5 son el contenido fundamental del certificado (identidad y clave pública asociada), el resto son datos imprescindibles para poder validar el certificado e información general. Esta información es firmada digitalmente por la autoridad emisora del certificado con su clave privada; de esa forma el receptor puede verificar que la CA ha establecido realmente la asociación.
En la documentación complementaria tienes disponible el archivo Gestion_Certificados_Digitales.pdf, que contiene información general sobre los tipos y usos de los certificados digitales.
``` -->

#### A. Certificado digital: tecnología

- (Estándar X.509) "Una PKI (Public Key Infraestructure) engloba todo el software y componentes del hardware junto con los usuarios, políticas y procedimientos que permiten la creación y gestión de certificados digitales basados en riptografía asimétrica o de clave pública"
- Objetivo de PKI: getsión eficiente y confiable de claves criptográficas y certificados digitales
- Componentes: CA, RA, repositorios, titulares de certificados, VA
- Formatos...: DER (binario) .cer o .der, PEM base64 .cer .crt .pem o .key

## 5. Sistemas biométricos de identificación

```md
En este apartado se aborda uno de los mecanismos de identificación más importantes en la actualidad: la biometría. Su función es permitir el reconocimiento de la persona en base a alguna de sus características biológicas o de comportamiento.
Existen técnicas biométricas que son capaces de digitalizar patrones tan específicos como el calor emitido por el rostro o su forma, las venas de las manos o la forma de caminar. Existen dispositivos electrónicos capaces de tomar las muestras correspondientes y almacenarlas en binario para su posterior comprobación de identidad.
```

| Técnicas                  | Ventajas                                                | Desventajas
| ---                       | ---                                                     | ---
| Reconocimiento facial     | Seguro, fácil, rápido, sin contacto                     | Iluminación y accesorios alteran autenticación
| Lectura de huella digital | Bajo costo y seguro                                     | Posibilidad de burla, difícil lectura potencialmente
| Reconocimiento de firma   | Bajo costo, más registro que auth                       | Alterado según estado emocional, posibilidad burla
| Lectura de iris o retina  | Muy seguro                                              | Molesto para el usuario, alto costo
| Reconocimiento de voz     | Bajo costo, útil para accesos remotos, estado emocional | Alterado por estado emocional, fácilmente reproducible, autenticación limitada

- **Biometría**: reconocimiento automático de los individuos en función de sus características biológicas y de comportamiento (autenticación persona vs patrón conocido almacenado)
- "Tecnología qeu realiza mediciones en forma electrónica, guarda y compara características únicas para la identificación de personas. Las características biométricas de una persona son no transferibles a otra"
- Tipos:
  - Biometría *conductual*: uso de un teclado, firma manuscrita
  - Biometría *fisiológica*:  huellas dactilares, iris, mano, rostro

### 5.1 Sistemas biométricos actuales

- 9 indicadores: reconocimiento rostro, termograma rostro, huellas dactilares, geometría mano, venas manos, lectura iris, patrones retina, reconocimiento de voz, reconocimiento de firma
- Combinación == biometría multimodal (eg. iris + huella + rostro, huella + firma electrónica)
- Funcionamiento: captura > extracción > comparación > decisión
- Ventajas e inconvenientes: ...

### 5.2 Ejemplos de sistemas biométricos
#### A. Emisión de calor
- Termogramas

#### B. Huella digital
- Según minucias y posición relativa (30/8)

#### C. Verificación de voz
- 3 formas de reconocimiento: dependencia, texto aleatorio, independencia del texto (sistema sensible...)

#### D. Verificación de patrones oculares
- 2 formas: escáner de retina (patrón de venas proyectando luz infrarroja a través de la pupila) o escáner de iris (videocámara para patrones de color únicos)


## 6. [Análisis forense en sistemas informáticos](https://drive.google.com/file/d/1yiPO84yvLCFxAXT-mhVYsfGN88QBQ7se/view)

> [Fases del análisis forense (McGraw)](https://drive.google.com/file/d/1DdyoQTc-tLBuo2l4CLxKIdEmTEaSmU5d/view)

```md
El objetivo de este apartado es estudiar la herramienta o herramientas generalmente utilizadas para realizar un análisis una vez se ha detectado la amenaza y esta se ha materializado. Estas herramientas constituyen lo que se conoce como el análisis forense informático.
Por lo tanto, el análisis forense informático permite analizar las consecuencias que se han producido en los sistemas informáticos de la organización, averiguar quién ha sido el autor, las causas y la metodología empleada, así como detectar las debilidades de nuestros sistemas informáticos que han ocasionado el ataque.
```
- **Análisis forense digital**: conjunto de principios y técnicas qeu comprenden el proceso de adquisición, conservación, documentación, análisis y presentación de datos que han sido procesados de forma electrónica y guardados en un sistema informático y que, llegado el caso, puedan ser aceptados legalmente en un proceso judicial
- Principio de Locard (persona-escena_crimen); formación interdisciplinaria (derecho, criminología, informática, psicología, seguridad...); España: esCERT-UPC
- Fases:
  - Identificación del incidente
  - Captura de las evidencias
  - Preservación de las evidencias
  - Análisis de la información obtenida
  - ELaboración de un informe con las conclusiones del análisis forense
- Objetivos
  - Recrear lo que ha ocurrido en un dispositivo digital durante el incidente de seguridad
  - Analizar las incidencias para impedir que se repitan en el futuro


### 6.1 Incidente de seguridad informática

- "Violación o intento de violación de la política de seguridad, de la política de uso adecuado o de las buenas prácticas de utilización de los sistemas informáticos"
- Clasificación:
  - *Incidentes DDoS*: impedir acceso mediante el agotamiento de recursos
  - *Código malicioso*: virus, troyano...
  - *Acceso no autorizado*: por hardware o software a un sistema|red|aplicación sin permiso
  - *Uso inapropiado*: saltarse política de uso adecuado del sistema
  - *Mútiple*: varios tipos
- Proceso de respuesta: Preparación > Identificación > ANÁLISIS FORENSE > Recuperación > Seguimiento
- **Norma ISO 27002:2005**: 4 roles ante incidencias: asistente administrativo en delitos de alta tecnología, investigador asociado (externo), analista de delitos, ingeniero de seguridad certificado

### 6.2 Evidencia digital

- **Evidencia digital**: conjunto de datos en formato binario, como archivos, su contenido o referencias a estos (metadatos), que se encuentran en los soportes físicos o lógicos del sistema atacado
- Modificable así que no alterar bajo ningún concepto, preservar siempre; 'la captura de la evidencia no debe alterar la prueba ni el entorno'; 
- "Las marcas de la evidencia son la fecha y la hora, el número de caso, el número de la marca de la evidencia, la firma de la persona que posee la información y quién tenía la información o por quién fue provista"
- <u>Normas de alcance global ISO/IEC 27037:2016 & 27042:2015</u>: ...

#### Regla de oro de la investigación forense: proteger el original

- Se debe proteger el original en orden descendente de volatilidad, se deben tomar fotos de los equipos, usar medios estériles para no contaminar las pruebas y, finalmente, se debe usar software con licencia o mejor, software libre.
- **Ejemplos de evidencias digitales**: registro de acceso a un archivo, cookie de navegación web, tiempo que lleva el sistema sin apagarse, contenido de un archivo, proceso en ejecución, archivo temporal, metadatos de archivos
- La preservación de evidencias supone: creación de copias digitales, creación de firmas digitales para comprobar integridad evidencias, programas para examinar el estado del sistema, programas para realizar copias bit a bit



<!-- ---

OJO extra/algoritmos -->