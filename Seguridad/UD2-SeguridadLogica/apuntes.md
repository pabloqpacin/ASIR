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
  - [4. Firma digital. Certificados digitales](#4-firma-digital-certificados-digitales)
    - [4.1 foo](#41-foo)
    - [4.2 foo](#42-foo)
  - [5. Sistemas biométricos de identificación](#5-sistemas-biométricos-de-identificación)
  - [6. Análisis forense en sistemas informáticos](#6-análisis-forense-en-sistemas-informáticos)


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
### 3.4 Funciones hash
### 3.5 Criptografía asimétrica o de clave pública






## 4. Firma digital. Certificados digitales
### 4.1 foo
### 4.2 foo

## 5. Sistemas biométricos de identificación
## 6. Análisis forense en sistemas informáticos

---

OJO extra/algoritmos