# Seguridad UD2: Seguridad Lógica

- [Seguridad UD2: Seguridad Lógica](#seguridad-ud2-seguridad-lógica)
  - [TEORÍA](#teoría)
  - [PRÁCTICA](#práctica)
    - [foo](#foo)
    - [bar](#bar)
    - [McGrawHill](#mcgrawhill)
      - [1](#1)
        - [Caso práctico 1 -- Creación ACL](#caso-práctico-1----creación-acl)
        - [Ponte a prueba 1 -- Interpretar ACL (TODO)](#ponte-a-prueba-1----interpretar-acl-todo)
        - [Ejercicios 1 -- test](#ejercicios-1----test)
      - [2](#2)
        - [Caso práctico 2 -- Diccionarios (`pydictor`)](#caso-práctico-2----diccionarios-pydictor)
        - [Ponte a prueba 2 -- Contraseñas (`pwgen`, `apg`)](#ponte-a-prueba-2----contraseñas-pwgen-apg)
        - [Estudio de caso -- `john` \& `medusa`](#estudio-de-caso----john--medusa)
        - [Ejercicios 2 -- test](#ejercicios-2----test)
      - [3](#3)
        - [Caso práctico 3 -- Utilización de `GPG`](#caso-práctico-3----utilización-de-gpg)
        - [Ponte a prueba 3 -- VeraCrypt](#ponte-a-prueba-3----veracrypt)
        - [Estudio de caso -- Seahorse, interfaz gráfica de GPG](#estudio-de-caso----seahorse-interfaz-gráfica-de-gpg)
        - [Ejercicios 3 -- test](#ejercicios-3----test)
      - [4](#4)
        - [Caso práctico 4 -- Creación de certificados con EasyRSA](#caso-práctico-4----creación-de-certificados-con-easyrsa)
        - [Ponte a prueba 4 -- Sistema cl@ve](#ponte-a-prueba-4----sistema-clve)
        - [Estudio de caso -- Creación de una infraestructura de clave pública con XCA (Ubuntu)](#estudio-de-caso----creación-de-una-infraestructura-de-clave-pública-con-xca-ubuntu)
        - [Ejercicios 4 -- test](#ejercicios-4----test)
      - [5](#5)
        - [Caso práctico 5 -- Legislación sobre biometría](#caso-práctico-5----legislación-sobre-biometría)
        - [Ponte a prueba 5 -- Amenazas vigentes sobre la biometría](#ponte-a-prueba-5----amenazas-vigentes-sobre-la-biometría)
        - [Ejercicios 5 -- test](#ejercicios-5----test)
      - [6](#6)
        - [Caso práctico 6 -- Análisis forense con DEFT Zero](#caso-práctico-6----análisis-forense-con-deft-zero)
        - [Ponte a prueba 6 -- Prep. dispositivo para almacenamiento evidencias digitales](#ponte-a-prueba-6----prep-dispositivo-para-almacenamiento-evidencias-digitales)
        - [Ejercicios 6 -- test](#ejercicios-6----test)
  - [QUIZ](#quiz)


## TEORÍA

> apuntes.md

## PRÁCTICA

### foo
### bar
### McGrawHill

#### 1

##### Caso práctico 1 -- Creación ACL

<details>

```md
**Introducción**
Simular un caso real de aplicación de las ACL sobre archivos y directorios de una partición.

**Preparación de la tarea**
Eres el usuario alumno. Crea en tu equipo GNU/Linux los usuarios operador1 y jefe, con la contraseña que quieras, y los grupos contables y directores. Puedes utilizar la herramienta Usuarios y grupos del entorno gráfico.
Asigna operador1 al grupo contables y jefe al grupo directores.
	$ sudo adduser operador1 contables
	$ sudo adduser jefe directores
Crea en tu directorio home un directorio llamado contabilidad y asegúrate de que tiene permisos rwx para el propietario y el grupo, y ningún permiso para el resto, y que pertenece al usuario alumno y al grupo alumno:
	$ chmod 0770 contabilidad

Dentro del directorio contabilidad, crea tres archivos: arch1, arch2 y arch3, y cambia los permisos para que tengan permisos rwx el propietario y el grupo, y ningún permiso el resto:
	$ touch arch1 arch2 arch3
	$ chmod 0770 arch* 
Comprueba que es correcto con ls -l:
    $ ls -l
	-rwxrwx--- 1 alumno alumno 0 abr 29 19:31 arch1
	-rwxrwx--- 1 alumno alumno 0 abr 29 19:31 arch2
	-rwxrwx--- 1 alumno alumno 0 abr 29 19:31 arch3


**Enunciado**

**A.** Escribir los comandos utilizados para:
1. Asignar permisos de lectura, escritura y ejecución al grupo contables para el directorio contabilidad y todos sus archivos.
2. Asignar permisos de lectura y ejecución al grupo directores para el directorio contabilidad y todos sus archivos.
3. Asignar permisos de lectura, escritura y ejecución al usuario jefe para los archivos arch1 y arch2. El usuario jefe no puede leer ni escribir ni ejecutar el arch3.
4. Comprueba que los permisos se cumplen suplantando la identidad de los usuarios e intentando escribir o leer algunos de los archivos o entrar en el directorio contabilidad.

**B**. Añade ahora un nuevo usuario llamado operario2 al grupo contables y comprueba que puede entrar en el directorio contabilidad y leer o modificar los archivos.
Una vez comprobado, quita los permisos de lectura y ejecución al directorio contabilidad a este usuario y comprueba que no puede entrar en el directorio. Escribe el comando que has usado para denegar los permisos al usuario operario2.

**C**. Crea una máscara acl en el directorio contabilidad que indique que los permisos máximos que va a tener cualquier usuario que no sean el propietario o el resto (other) sean de lectura o ejecución.

Escribe el comando que has usado. Ahora comprueba si el usuario operador1, operador2 o jefe pueden crear archivos en el directorio contabilidad. ¿Por qué?
```
```md
**Solución**
Es muy importante tener todos los usuarios, grupos, archivos y directorios creados y con los permisos indicados en el apartado Preparación de la tarea.

**A.1**. Asignar permisos de lectura, escritura y ejecución al grupo contables para el directorio contabilidad y todos sus archivos.
Primero comprobamos los permisos del directorio contabilidad:
	$ getfacl contabilidad/
	# file: contabilidad/
	# owner: alumno
	# group: alumno
	user::rwx
	group::rwx
	other::---
Ahora creamos la ACL pedida (-R recursivo, -m para los permisos):
	$ setfacl -R -m g:contables:rwx ~/contabilidad

Comprobamos de nuevo los permisos de contabilidad:
	$ getfacl contabilidad/
	# file: contabilidad/
	# owner: alumno
	# group: alumno
	user::rwx
	group::rwx
	group:contables:rwx
	mask::rwx
	other::---

> ...
```

</details>

##### Ponte a prueba 1 -- Interpretar ACL (TODO)

```md
**Interpretar las listas de control de acceso**
Dadas las siguientes ACL, ejecutarlas y explicar su significado.
1. $ setfacl –k dir1
2. $ setfacl –b dir1
3. $ setfacl -R -b ~/dir1
4. $ setfacl -R -d -m group:grupo1:rwx ~/dir1
5. $ setfacl -m g:grupo2:rx  ~/dir/subdir
6. $ setfacl -m g::rx ~/dir/subdir
7. $ getfacl fich1 | setfacl --set-file=- fich2 
El valor de umask del sistema es 022.
```

##### Ejercicios 1 -- test

1. En una ACL los permisos por defecto sobre un directorio: **Afectan a los archivos que se creen en el directorio.**
2. Las ACL se pueden utilizar: **Requieren soporte en el núcleo del sistema operativo.**
3. En relación con los objetivos de la seguridad lógica, indicar cuál de las siguientes afirmaciones es falsa: **La información recibida proviene de un solo emisor.** <!--WTF-->
4. En relación con la ACL extendida, indicar cuál de las siguientes afirmaciones es cierta: **Contiene una entrada mask.**
5. En relación con la ACL por defecto, indicar cuál de las siguientes afirmaciones es cierta: **Los permisos se heredan desde el directorio padre.**

#### 2

##### Caso práctico 2 -- Diccionarios (`pydictor`)

```md
**Introducción**
Vamos a trabajar con la herramienta Pydictor, que permite la creación de diccionarios para fuerza bruta. Sus principales características son las siguientes:
- Pydictor se utiliza para crear diccionarios para fuerza bruta.
- Esta herramienta crea la lista de palabras tanto en palabras normales como en diferentes tipos de cifrado, como el cifrado base64.
- Pydictor está escrito en Python.
- Hay dos métodos para romper la contraseña usando esta herramienta:
  - crear una lista de palabras normales.
  - crear la lista de palabras en formato base64.

**Enunciado**
Se pide instalar las herramientas Pydictor y Dimerge y crear dos diccionarios de palabras con Pydictor: uno con números y otro con una lista de palabras con letras en mayúsculas (-base L), así como fusionarlos con Dimerge.
```
```bash
# RESOLUCIÓN

### A. Pydictor

# 1. Instalar Pydictor
git clone --depth=1 --branch=master https://www.github.com/landgrey/pydictor.git
cd pydictor/
chmod +x pydictor.py
python pydictor.py

# 2. Generar diccionario de números
./pydictor.py --len 4 4 -base d -o /tmp/pydict.txt
  # less /tmp/pydict.txt    --> 0000 0001 0002 ... 9997 9998 9999

# 3. Generar diccionario con palabras...
  # ./pydictor.py --len 4 4 -base d -o --encode base64 /tmp/pydict.txt

### B. Dymerge -- req. Python 2 -- F*IT

# # 1. Instalar Dymerge
# git clone --depth 1 https://github.com/k4m4/dymerge.git /tmp/dymerge
# python dymerge.py /root/Escritorio/diccionario1.txt /root/Escritorio/diccionario2.txt –s –o /root/Escritorio/elvira.txt
```

##### Ponte a prueba 2 -- Contraseñas (`pwgen`, `apg`)

```md
**Comprobación de contraseñas**
Existen diferentes procedimientos de generación de contraseñas válidas y de comprobación de la fortaleza de nuestras contraseñas.

Se pide utilizar las herramientas `pwgen` y `apg` y que se pruebe la fortaleza de las contraseñas generadas en la web http://www.passwordmeter.com/ u otra que conozca el alumnado.
```
```bash
sudo apt-get install pwgen apg
# ...
```


##### [Estudio de caso -- `john` & `medusa`](https://drive.google.com/file/d/1jx7hOtklVIq61UUXs9q0loldaQjeoBsj/view)

> - [ ] OJO


##### Ejercicios 2 -- test

1. Ocultar los caracteres cuando se introduce una contraseña es una medida: **De seguridad activa.**
2. En un ataque por 'fuerza bruta': **La longitud de la clave sí importa.**
3. El ataque por diccionario: **Depende de la robustez de la contraseña.**
4. En relación con la autenticación con varios factores, indica cuál de las siguientes afirmaciones es verdadera: **Mejora el control de acceso.**
5. Indicar en GNU/Linux Ubuntu cómo o dónde se almacenan las contraseñas de los usuarios del sistema: **Cifradas en `/etc/shadow`**

#### 3

##### Caso práctico 3 -- [Utilización de `GPG`](https://drive.google.com/file/d/1jWeG6QsPKZBaz6TEq_qPilHSn9P5Upl_/view)

```md
**Introducción**
GPG cifra los mensajes usando pares de claves individuales asimétricas generadas por los usuarios. Las claves públicas pueden ser compartidas con otros usuarios de muchas maneras, un ejemplo de ello es depositándolas en los servidores de claves. Siempre deben ser compartidas cuidadosamente para prevenir falsas identidades por la corrupción de las claves públicas.
También es posible añadir una firma digital criptográfica a un mensaje; de esta manera la totalidad del mensaje y el remitente pueden ser verificados en caso de que se desconfíe de una correspondencia en particular.
GPG en GNU/Linux Ubuntu viene instalado por defecto. En Windows está disponible el software *gpg4win*, que realiza las mismas funciones.

---
**Enunciado**
Dada la herramienta GPG y utilizando la página del manual de la misma ($ man gpg) como apoyo, se pide realizar las siguientes tareas: 
1. Generación de claves.
2. Certificados de revocación de clave pública. 
3. Exportar la clave pública propia. 
4. Importar una clave pública de otro usuario.
5. Utilización de servidores de claves.
6. Cifrado y descifrado de archivos.
7. Firmar archivos.
8. Verificación de firmas.

NOTAS.
- Trabajar con archivos creados por el alumno.
- Una vez finalizada la práctica, eliminar todos los archivos de trabajo del equipo.
- Se recomienda consultar todas las opciones utilizadas de GPG en la página man de la orden. 
```

1. Generación de claves

<!--

- openpgp-revocs.d: almacena la certificación de revocación que ha generado.
- private-keys-v1.d: directorio con las claves privadas.
- pubring.kbx: almacena las claves públicas propias y las recopiladas de otros usuarios (anillo de claves públicas).
- trustdb.gpg: base de datos de confianza.
-->

```bash
gpg --full-generate-key
  # Kind: RSA and RSA (default)
  # Keysize: 3072
  # Validity: 0
  # Real name: pabloqpacin
  # Email: pquevedo267@gmail.com
  # Comment: ASIR_Seguridad_UD2.3
  # Passphrase: susodicho881;;
# gpg: key 3405E178BEFDCF22 marked as ultimately trusted
# gpg: directory '/home/pabloqpacin/.gnupg/openpgp-revocs.d' created
# gpg: revocation certificate stored as '/home/pabloqpacin/.gnupg/openpgp-revocs.d/19594AFF30BEED66E58E09ED3405E178BEFDCF22.rev'
# public and secret key created and signed.
# pub   rsa3072 2024-04-22 [SC]
#       19594AFF30BEED66E58E09ED3405E178BEFDCF22
# uid                      pabloqpacin (ASIR_Seguridad_UD2.3) <pquevedo267@gmail.com>
# sub   rsa3072 2024-04-22 [E]

tree .gnupg
  # .gnupg
  # ├── crls.d
  # │  └── DIR.txt
  # ├── openpgp-revocs.d
  # │  └── 19594AFF30BEED66E58E09ED3405E178BEFDCF22.rev
  # ├── private-keys-v1.d
  # │  ├── 242B9A3C63350D2065DD6C4695F6FDE462EF436B.key
  # │  └── 74525AD6385E220F0099E4C7434258F53A447AFA.key
  # ├── pubring.kbx
  # ├── pubring.kbx~
  # └── trustdb.gpg

gpg --list-keys
gpg --list-secret-keys --keyid-format LONG 
```
2. Certificados de revocación de clave pública. 

Por defecto se crea un certificado de revocación (.rev) de la clave pública generada por si en un futuro se ve comprometida y es necesario propagar de forma fiable el aviso de su revocación.

El certificado irá firmado con nuestra clave privada.

Está disponible en el directorio `openpgp-revocs.d`.

Si se necesitara volver a crear por cualquier motivo la sintaxis de la orden, es la siguiente:

```bash
gpg --output <fich. destino> --gen-revoke <id. de la clave>
```

3. Exportar la clave pública propia. 

```bash
gpg --export -a > mi_clavepublica_gpg.txt
# gpg --export-secret-key -a pabloqpacin > mi_clavesecreta_gpg.txt
```

4. Importar una clave pública de otro usuario.

```bash
gpg --import una_clavepublica_gpg.txt
```

5. Utilización de servidores de claves.

```bash
gpg --foo-keys --keyserver foo.foo.foo <CLAVE>

ls $HOME/.gnupg/gpg.conf
```

6. Cifrado y descifrado de archivos.

> Se pide **passphrase**

```bash
mkdir /tmp/claves && cd $_
echo 'supdawg' > plano.txt

gpg --encrypt --sign --output cifrado.txt -r pabloqpacin plano.txt

file cifrado.txt
  # cifrado.txt: PGP RSA encrypted session key - keyid: 0E7CCA07 D4953819 RSA (Encrypt or Sign) 3072b .
```

<details>
<summary>--armor</summary>

```txt
pabloqpacin•/tmp/claves» file plano.txt.asc
plano.txt.asc: PGP message Public-Key Encrypted Session Key (old)
pabloqpacin•/tmp/claves» bat $_            
───────┬───────────────────────────────────
       │ File: plano.txt.asc
───────┼───────────────────────────────────
   1   │ -----BEGIN PGP MESSAGE-----
   2   │
   3   │ hQGMAw58ygfUlTgZAQv/RUw6PdebLV2j6BdZr4inaJfK3Le61Hp9Ka8OnlwHhkQJ
   4   │ vKN2htF2rKzZ+f/HrsdgGfPWzMUkHOZcatZ0g5hzVRCFOyq8GPErOtIoFH0OZNwo
   5   │ HRs/y03xrkrDf9YecNxcB125qQJoWLMEPkIG/q+EMLzwacA/vfRsZXahlEhHBThH
   6   │ 4AzVo0ochgZRQTXsnjUxrUqrB0jdstYFhQN1INwA8JVQC0fN6WB0eijlAp5wyqu8
   7   │ P3FrwknT6plTRrQCPrmD10Kpc22RGWuEpSHgFzU8O9lc0wr/qeQSErBeEE8z8O1s
   8   │ Tw3mgpDHavyDBvotidVIYFk6kPCamKJkvnWJpYZuPF+XPQqeNYiMUhxYkuZIuVRG
   9   │ NTkLTLNp8o+0vP+hbtNVqmruCj5KJD6Rr2zXse78X2U3IxRiqCePninLDb/VGdMp
  10   │ ab/QEKM+UyDho3y3RQHQsy+/yHATdfTtutLwcxjHgVSUOu2fDK5z1x66GG62YnmX
  11   │ HdkSJyFc4/N3ODcLcuCR0ukBJBYDiMD84Uvuev4kAyxIEGjm6hU0rwYz+/nsgY5i
  12   │ AubnWgMigWXCk1+6DJmWYeiL9bjXD9L6TyGTcZUMcs0ereo9axbAI6XK9EOrC1cj
  13   │ H/71N7rp+52G78qYIxnSPDSdAgAOo4tjy2mbIG7pELxB8zu3WxvHA902yZD8lqbV
  14   │ TN1aU8XWei1cGpQA34YXFL+PMTnDsgfS9HuYv7t9w/ZyCHHsxUgsaGVA8lC5dW3n
  15   │ sypUcZTgOreIRdlX6KK+VOM6xBpLPmWqw2MMq1UMQxhL6FJxi4OU32U0psAJ79+f
  16   │ TA1uyPl5k/trG+KWfv9A6wJKAUA2jE+UUIPe41oAu22p+YdNyN/Cc9ECU8pPr0+X
  17   │ YPNEF2adbQzN6iy5CQ35tJ6w/NAqAAHBc3FSm1RIE0DvvASSdVma/3gomE8/aiAD
  18   │ 2EN/6mx5izwR8GqQolCOK3fI5EjT0KWL4tlgk1j8QSODCy/hKRPineBppOqaiy2e
  19   │ DPwWHlXSgRTThZjQAZfATVHPJ/JLOov3OGYZHfUj9HAUXnOMmfGqY0an/V7/NLoR
  20   │ jbyAFOvhSmaqtdaAubugv2CHUHeXAKEKCNPDhqtW9gdkTLMRUt4V2+HQLx77aynW
  21   │ psYX1bwzKyCq9RukVcsm8ox1mwaVyl6fAZepmFil0wNQx7HRKfSgHg0UYwj9xMSH
  22   │ NBSGABWt1d9DgCxzlg5BEpICBEAegw==
  23   │ =v0f7
  24   │ -----END PGP MESSAGE-----
```

</details>


```bash
gpg --output plano2.txt --decrypt cifrado.txt
  # gpg: encrypted with 3072-bit RSA key, ID 0E7CCA07D4953819, created 2024-04-22
  #       "pabloqpacin (ASIR_Seguridad_UD2.3) <pquevedo267@gmail.com>"
  # gpg: Signature made Mon 22 Apr 2024 06:56:14 PM CEST
  # gpg:                using RSA key 19594AFF30BEED66E58E09ED3405E178BEFDCF22
  # gpg: Good signature from "pabloqpacin (ASIR_Seguridad_UD2.3) <pquevedo267@gmail.com>" [ultimate]
```

7. Firmar archivos.

Una de las medidas de seguridad básicas al enviar un documento es asegurarnos de que el emisor es quien dice ser. Para ello se utiliza la firma digital.

En el ejemplo siguiente, primero firmaremos el documento y luego lo cifraremos. De esta forma primero nos aseguramos de que es nuestro y segundo, al cifrarlo con la clave pública del destinatario, nos aseguramos de la confidencialidad del documento (ya firmado por nosotros).

```bash
PRIVATE_KEY=$(gpg --list-secret-keys | grep -Eo '[0-9A-F]{40}' | grep -v '^$')
gpg --local-user $PRIVATE_KEY --output plano_firmado.txt --sign plano.txt

{
  bat plano_firmado.txt
    #  File: plano_firmado.txt   <BINARY>
  file plano_firmado.txt
    # plano_firmado.txt: data
  strings plano_firmado.txt
    # b       plano.txtf&
    # Nsupdawg
    # AkSx
    # w1f#
    # RW}xG
    # R\<Y
    # *$TO
}

gpg --encrypt --sign --output cifradoyfirmado.txt -r pabloqpacin plano_firmado.txt
```

8. Verificación de firmas.

```bash
gpg --verify plano_firmado.txt
  # gpg: Signature made Mon 22 Apr 2024 07:15:58 PM CEST
  # gpg:                using RSA key 19594AFF30BEED66E58E09ED3405E178BEFDCF22
  # gpg: Good signature from "pabloqpacin (ASIR_Seguridad_UD2.3) <pquevedo267@gmail.com>" [ultimate]

gpg --output planoyfirmado.txt --decrypt cifradoyfirmado.txt
```

##### Ponte a prueba 3 -- VeraCrypt

```md
**VeraCrypt**
VeraCrypt es un software de código abierto para cifrar archivos, carpetas, unidades USB extraíbles, discos duros completos e, incluso, el disco duro donde se encuentra el propio sistema operativo instalado. 
VeraCrypt es multiplataforma y existen versiones para Windows, cualquier distribución basada en GNU/Linux y/o macOS. 
Está basado en TrueCrypt 7.1a, cuyo proyecto acabó, e incorpora muchas mejoras en cuanto a la seguridad y el rendimiento.
Algunas de las principales características de VeraCrypt son las siguientes:
- Creación de discos cifrados virtuales en un archivo.
- Cifra de dispositivos de almacenamiento extraíble, como USB, tarjetas SD y discos duros. En este caso, todo el dispositivo de almacenamiento extraíble estará completamente cifrado.
- Cifra cualquier partición de estos dispositivos de almacenamiento extraíble.
- Cifra la partición o el disco completo en el que el sistema operativo esté instalado. 
- El cifrado y el descifrado son automáticos y se hacen en tiempo real, siendo completamente transparentes para el usuario.
- El cifrado y el descifrado se pueden acelerar si el procesador del equipo soporta AES-NI.
- Posibilidad de crear un volumen «oculto».
La versión para Windows está disponible en https://veracrypt.uptodown.com/windows

Utiliza la herramienta para establecer un volumen o contenedor en el que se guardarán archivos encriptados. Explica el proceso seguido para su creación y para no dejarlo disponible sin contraseña.

> Se puede consultar información sobre la herramienta en la página oficial del proyecto: https://www.veracrypt.fr/en/Documentation.html
```

---

```bash
# 1. Install Veracrypt
{
  mkdir /tmp/veracrypt && cd $_
  wget https://launchpad.net/veracrypt/trunk/1.26.7/+download/veracrypt-1.26.7-Ubuntu-22.04-amd64.deb
  sudo dpkg -i veracrypt-1.26.7-Ubuntu-22.04-amd64.deb
  sudo apt --fix-broken-install
  cd -
}

# 2. Create a Volume (2GB, AES)
sudo veracrypt -t --create /VeraCrypt --volume-type normal --size 2147483648 --encryption AES --hash SHA-512 --filesystem FAT --pim 420
  # password==susodicho881;;
  # Keyfile==non

# 3. Mount the volume
{
  sudo mkdir /mnt/VeraCrypt
  sudo veracrypt -t --mount /VeraCrypt /mnt/VeraCrypt
  veracrypt -l
}

# 4. Copy files
for i in {1..5}; do echo $i > /mnt/VeraCrypt/$i.txt; done

# 5. Unmount the Volume
veracrypt -t --dismount /mnt/VeraCrypt || umount /mnt/VeraCrypt
veracrypt -l
```
- [ ] probar a montar el volumen tal cual en otra máquina...


##### Estudio de caso -- [Seahorse, interfaz gráfica de GPG](https://drive.google.com/file/d/1uOGpm3BuuJNz80utehU_n2hEGflVH6Jm/view)

<!-- ```bash
sudo apt install kleopatra
``` -->
```md
**Seahorse, interfaz gráfica de GPG**
En este caso práctico extendido vamos a cifrar archivos con información que no queremos que esté visible utilizando para ello una herramienta gráfica incluida en Ubuntu llamada Seahorse. El acceso a estos archivos requerirá una contraseña. La página del proyecto es la siguiente: https://wiki.gnome.org/Apps/Seahorse. Esta interfaz gráfica de GNOME en Ubuntu 22.04 se llama Contraseñas y Claves (Seahorse) y viene instalada por defecto.
Con esta herramienta podremos cifrar archivos utilizando las claves generadas.
Recordemos que GPG o GnuPG es un sistema híbrido y utiliza el método de cifrado denominado criptografía asimétrica para la clave se sesión; es decir, cada usuario tiene dos claves: una clave privada y una clave pública. Utiliza criptografía simétrica para encriptar los datos.
La clave privada es la que el propietario usa para descifrar aquello que nos envían cifrado con nuestra clave pública; además, la clave privada solo debe conocerla el propietario, con el fin de que sea el único que pueda cifrar con dicha clave.
En cambio, la clave pública es la clave que daremos a terceros para que nos envíen archivos o mensajes cifra- dos. Esta clave la utilizarán para cifrar los archivos o mensajes que nos quieran enviar.

---
Enunciado
Se pide:
- Utilizar la herramienta Contraseñas y Claves para cifrar archivos y directorios completos.
- Utilizar las claves para el descifrado de los mismos.
- Exportar la clave privada y descifrar algún archivo en un equipo diferente al que se realizó la cifra.
```
---
```bash
sudo apt update && sudo apt install seahorse-nautilus
```
```yaml
Seahorse:
  Add: GPG Key:
    - Name: pabloqpacin
    - Email: 'no@thankyou.com'
    - Encryption Type: RSA
    - Key Strength: 4096
    - Expiration Date: Never
    - Passphrase: susodicho881;;
  # view...

# mkdir $HOME/Desktop/pacifrar && cd $_
# for i in {1..5}; do echo $i > $i.txt; done

Desktop/pacifrar:
  Select all: Encrypt:
    pabloqpacin: passphrase

Exportar clave.asc:
  gpg --import foo/clave.asc:
    gpg foo.gpg
```


##### Ejercicios 3 -- test

1. Si ciframos en forma local un documento con GPG obtenemos un texto cifrado. Si volvemos a cifrar el mismo documento con la misma clave, indicar si: **Los dos criptogramas serán distintos.**
2. En los criptosistemas asimétricos, la confidencialidad y la autenticidad se logran: **Por separado.**
3. Los criptosistemas se clasifican en: **Clave privada y asimétrico.**
4. Para firmar un mensaje usando criptografía de clave pública: **Se cifra un resumen del mensaje usando la clave privada.**
5. El algoritmo Diffie-Hellman: **Se utiliza en criptosistemas de clave pública.**


#### 4

##### Caso práctico 4 -- Creación de certificados con EasyRSA

```md
**Creación de certificados con EasyRSA**
EasyRSA es una aplicación para la creación de certificados digitales y claves RSA. Vamos a ver esta funcionalidad.
Se pide instalar EasyRSA desde GitHub y generar una autoridad de certificación en un equipo que hará las veces de servidor. Esta CA emitirá un certificado para un equipo cliente que podría conectarse con el servidor, por ejemplo, para establecer un túnel VPN.
```
----
```bash
### 1. Instalación y configuración básica
sudo git clone --depth=1 https://github.com/OpenVPN/easy-rsa.git /opt/easy-rsa
# if true; then sudo chown $USER -R /opt/easy-rsa; fi
cd /opt/easy-rsa/easyrsa3/vars.example /opt/easy-rsa/easyrsa3/vars
{
  sudo sed -i '/EASYRSA_REQ_COUNTRY/s/.*/set_var EASYRSA_REQ_COUNTRY    "ES"/' /opt/easy-rsa/easyrsa3/vars
  sudo sed -i '/EASYRSA_REQ_PROVINCE/s/.*/set_var EASYRSA_REQ_PROVINCE   "Pontevedra"/' /opt/easy-rsa/easyrsa3/vars
  sudo sed -i '/EASYRSA_REQ_CITY/s/.*/set_var EASYRSA_REQ_CITY   "Baiona"/' /opt/easy-rsa/easyrsa3/vars
  sudo sed -i '/EASYRSA_REQ_ORG/s/.*/set_var EASYRSA_REQ_ORG    "Prueba Certificado"/' /opt/easy-rsa/easyrsa3/vars
  sudo sed -i '/EASYRSA_REQ_EMAIL/s/.*/set_var EASYRSA_REQ_EMAIL  "no@thankyou.com"/' /opt/easy-rsa/easyrsa3/vars
  sudo sed -i '/EASYRSA_REQ_OU/s/.*/set_var EASYRSA_REQ_OU     "Ejemplo OpenVPN"/' /opt/easy-rsa/easyrsa3/vars
}

### 2. Iniciar la PKI
sudo /opt/easy-rsa/easyrsa3/easyrsa init-pki

### 3. Clave RSA y certificado dela CA
sudo /opt/easy-rsa/easyrsa3/easyrsa build-ca nopass
  # Common Name: <Enter>
sudo /opt/easy-rsa/easyrsa3/easyrsa gen-req servidor nopass
  # Common Name: <Enter>
sudo /opt/easy-rsa/easyrsa3/easyrsa sign-req server servidor
  # Confirm: yes

### 4. Clave RSA y certificado del cliente
sudo /opt/easy-rsa/easyrsa3/easyrsa gen-req cliente nopass
  # Common Name: <Enter>
sudo /opt/easy-rsa/easyrsa3/easyrsa sign-req client cliente
  # Confirm: yes

### 5. Mover las claves
{
  sudo scp /opt/easy-rsa/pki/private/cliente.key $USER@<ip_cliente>:/tmp/keys/
  sudo scp /opt/easy-rsa/pki/issued/cliente.crt $USER@<ip_cliente>:/tmp/keys/
  sudo scp /opt/easy-rsa/pki/ca.crt $USER@<ip_cliente>:/tmp/keys/
  # if true; then cp /tmp/keys/* /etc/openvpn/keys; fi
}
```

##### Ponte a prueba 4 -- Sistema cl@ve

```md
**Sistema cl@ve**
Es posible que hayas oído hablar del sistema cl@ve, pero no tienes muy claro qué es ni para qué sirve. Este ejercicio propone que busques información sobre este sistema de identificación electrónica y hagas un breve resumen del mismo.
Puedes acceder a la web oficial del proyecto cl@ve, que es https://clave.gob.es. 
```

##### Estudio de caso -- [Creación de una infraestructura de clave pública con XCA (Ubuntu)](https://drive.google.com/file/d/1yleAtIGteAS2aTuMS56SladAKZvoMz8x/view)

- [ ] ...

##### Ejercicios 4 -- test

1. De las siguientes afirmaciones, indica cuál de ellas es correcta. **La firma electrónica requiere la firma digital.**
2. En relación a la autoridad de certificación (CA): **Guarda la clave pública del certificado digital emitido.**
3. El DNI electrónico: **Contiene una firma electrónica.**
4. Indicar cuál de las siguientes posibilidades es el principal problema que intentan resolver los sistemas de clave pública (Public Key Infrastructure, PKI). **La suplantación de identidad entre usuarios.**
5. Firmar digitalmente un documento es: **Cifrar el documento (o parte) con la clave privada.**


#### 5

##### Caso práctico 5 -- Legislación sobre biometría

<details>

```md
**Introducción**
La Unión Europea (EU) en la ley de privacidad de datos define los datos biométricos como "categorías especiales de datos personales" y prohíbe que sean procesados sin consentimiento de las personas. Es decir, prohíbe el procesamiento de estos datos con la finalidad de identificar de forma única a una persona física.
Toda esta información está recopilada en el Reglamento General de Protección de Datos (RGPD) y contiene toda la normativa que regula el tratamiento de los datos personales en el ámbito geográfico de la Unión Europea. Fue publicado el 17 de abril de 2016, derogando a la antigua Directiva 95/46/CE.
Esta normativa es una ley general y no impide que cada país miembro de la UE pueda desarrollar su propia normativa nacional (por ejemplo, en España se ha desarrollado la LOPDGDD (Ley de Protección de Datos Personales y Garantía de Derechos Digitales, que sustituye a la antigua LOPD), siempre y cuando no contravenga lo indicado por la ley RGPD).
**Enunciado**
Se pide extraer y resumir los artículos relativos a:
1. Objetivos del reglamento.
2. Su aplicación en España.
3. Cómo cumplir con el RGPD: requisitos.
4. Diferencias entre LOPD y RGPD.
Esta normativa es general, pero en sus artículos quedan embebidas las normas aplicables a los datos personales biométricos.

---
**Solución**
1. Objetivos del reglamento
El artículo 1 del reglamento RGPD indica que “establece las normas relativas a la protección de las personas físicas en lo que respecta al tratamiento de los datos personales y las normas relativas a la libre circulación de tales datos“.
Añade que el reglamento “protege los derechos y libertades fundamentales de las personas físicas y, en particular, su derecho a la protección de los datos personales“. Además, indica que “la libre circulación de los datos personales en la Unión Europea no podrá ser restringida ni prohibida por motivos relacionados con la protección de las personas físicas en lo que respecta al tratamiento de los datos personales“.
2. Su aplicación en España
El Reglamento General de Protección de Datos (RGPD) se aplica a todas aquellas organizaciones, profesionales, instituciones o entidades públicas que realicen un tratamiento de los datos personales de terceros. Por ejemplo, organizaciones que manejen datos de clientes, empleados o proveedores. El RGPD hace referencia a determinados casos en los que la ley no se aplica:
- Cuando los archivos mantenidos por personas físicas son para un uso exclusivamente personal o doméstico; por ejemplo, las agendas personales, los contactos personales del correo electrónico, etc.
- Archivos sometidos a la normativa sobre protección de materias clasificadas. Estos archivos se rigen por una normativa diferente, más específica.
- No se aplica a los archivos establecidos para la investigación del terrorismo y de otras formas graves de delincuencia organizada.
4. Diferencias entre LOPDGDD y RGPD
La Ley de Protección de Datos Personales y Garantía de Derechos Digitales (LOPDGDD) y el Reglamento General de Protección de Datos (RGPD) son dos normativas similares, ya que la primera es la adaptación española del RGPD.
La LOPDGDD profundiza en algunas cuestiones que el RGPD solo nombra, como son:
- Datos de contacto de empresarios y profesionales liberales.
- Sistemas de información crediticia.
- Operaciones mercantiles.
- Videovigilancia en el trabajo.
- Exclusión publicitaria.
- Denuncias internas.
- Función de estadística pública.
- Archivo de interés público.
- Infracciones y sanciones administrativas.
Además, la LOPDGDD detalla las características de la figura del delegado de protección de datos y  establece las empresas que están obligadas a  contar con esta figura.
```
</details>

##### Ponte a prueba 5 -- Amenazas vigentes sobre la biometría

```md
**Amenazas vigentes sobre la biometría**
La biometría, como técnica de identificación personal, no es infalible; tiene agujeros de seguridad y sobre ella existen amenazas importantes.
Muchas características biométricas humanas pueden ser falsificadas por intrusos, y copiar datos biométricos digitalizados es relativamente sencillo. Recordar que se almacenan en bases de datos.
Además, hay que tener en cuenta que los datos biométricos, una vez comprometidos, están comprometidos para siempre. Los usuarios no pueden cambiar sus huellas dactilares de la misma forma que lo harían con las contraseñas comprometidas. 
Se pide averiguar cuáles son los riesgos más relevantes sobre los datos biométricos.
> Es un ejercicio de investigación y el alumnado puede consultar en Internet estudios y estadísticas realizados sobre sistemas que han visto comprometidos los datos biométricos.
```

##### Ejercicios 5 -- test

1. Indicar cuál de los siguientes no es un rasgo biométrico identificativo. **Firma manuscrita.**
2. De los siguientes, cuál crees que sería rechazado por los sistemas biométricos. **Una persona autorizada no puede entrar en una sala.**
3. De los siguientes elementos, cuál se puede afirmar que identifica de forma inequívoca a una persona. **El iris.**
4. De las siguientes opciones, cuál representa la posibilidad de que un dispositivo biométrico no reconozca a la persona autorizada. **Falso negativo.**
5. Indicar cuál de los siguientes no es un rasgo de comportamiento biométrico. **La contraseña.**


#### 6

##### Caso práctico 6 -- Análisis forense con DEFT Zero

```md
**Introducción**
DEFT (Digital Evidence & Forensic Toolkit) es una distribución basada en Linux (Lubuntu) y su versión actual es la 8.2. Es una de las distribuciones más completas para el análisis forense de datos de redes y dispositivos. 
Esta distribución fue creada en la Universidad de Bolonia, publicada por primera vez en el año 2005, y es utilizada principalmente en el área forense digital.
La web de descarga de Sourceforge es: 
https://sourceforge.net/projects/archiveos/files/d/deft/deftZ-2018-2.iso/download.  
También se puede descargar desde http://www.deftlinux.it/iso/index.html.
DEFT Zero contiene un conjunto de herramientas de análisis forense digital y permite la adquisición de imágenes forenses, la verificación de la integridad, el análisis de malware, la recuperación de información y la gestión de discos duros, entre otras.
La versión 8.2 de DEFT Zero incorpora un conjunto de herramientas agrupadas bajo el nombre de Digital Advanced Response Toolkit (DART), que permiten trabajar con herramientas en Windows.
Este sistema, además, es compatible con todo tipo de unidades y dispositivos, aunque por motivos de seguridad estos vienen desmontados y habrá que montarlos manualmente para poder utilizarlos.
Este sistema dispone, entre otras, de dos tipos de herramientas: herramientas de cálculo de HASH, que nos pueden servir para verificar la integridad de los elementos del sistema a analizar, es decir, que no han sido alterados, y herramientas para la obtención de imágenes, clonado de discos y recuperación de datos.

**Enunciado**
Se pide crear una máquina virtual con esta distribución, arrancar en modo interfaz cargado  100 % en RAM y analizar la herramienta. 
Utilizar las herramientas desde el entorno gráfico de clonado y verificación de hash, como son Dhash y Guymager.

> ddrescue, 
Otros servicios de DEFT-Zero:
- La herramienta dcfldd, que es una versión mejorada de dd que puede calcular hashes durante el proceso y mostrar el progreso de este, entre otras funciones.
- Dispone de herramientas para el análisis forense digital en dispositivos móviles.
- Recuperación de datos.
- Herramientas para el análisis forense digital en la red.
- Análisis de malware.
```

##### Ponte a prueba 6 -- Prep. dispositivo para almacenamiento evidencias digitales

```md
**Preparación del dispositivo para el almacenamiento de evidencias digitales**
Se propone realizar la preparación para la correcta salvaguarda de evidencias digitales.
Se pide preparar un disco o lápiz externo USB para guardar evidencias de computación forense. Es suficiente uno de pequeña capacidad.

En este ejercicio se recomienda repasar las unidades de implantación de sistemas operativos (ISO) en las que se explica cómo realizar un formateo a bajo nivel sobre un dispositivo.
Antes de hacer la toma de datos el medio utilizado debe estar limpio.
Previamente nos habremos descargado y grabado en un USB la herramienta Kali Linux. 
De las opciones disponibles, seleccionar Live.
Conviene disponer de un USB multiarranque para ir grabando en las diferentes distribuciones que se van a utilizar a lo largo del curso. Para ello, desde Ubuntu se puede utilizar MultiBootUSB y desde Windows está disponible la herramienta WinSetupFromUSB, entre otras.
```

- [ ] USB lab

##### Ejercicios 6 -- test

1. Respecto a SHA-1, indicar cuál de las siguientes afirmaciones es correcta. **Es un algoritmo para obtener un hash o un resumen digital. Se utiliza en relación con la integridad de la evidencia digital.**
2. En relación con el proceso de análisis forense, indicar cuál de las siguientes secuencias de fase es correcta. **Evaluar, adquirir, analizar e informar.**
3. La normativa ISO/IEC 27042 se utiliza para: **Analizar e interpretar evidencias.**
4. Indicar cuál de las siguientes no es una fase del análisis forense. **Análisis de la nube.**
5. Indicar cuál es la regla de oro del análisis forense. **Proteger el original de la evidencia.**



## QUIZ
