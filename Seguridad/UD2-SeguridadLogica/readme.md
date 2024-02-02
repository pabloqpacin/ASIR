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
        - [Caso práctico 2 -- Diccionarios](#caso-práctico-2----diccionarios)
        - [Ponte a prueba 2 -- Contraseñas](#ponte-a-prueba-2----contraseñas)
        - [Estudio de caso -- `john` \& `medusa`](#estudio-de-caso----john--medusa)
        - [Ejercicios 2 -- test](#ejercicios-2----test)
      - [x](#x)
        - [Caso práctico x -- foo](#caso-práctico-x----foo)
        - [Ponte a prueba x -- foo](#ponte-a-prueba-x----foo)
        - [Estudio de caso -- foo](#estudio-de-caso----foo)
        - [Ejercicios x -- test](#ejercicios-x----test)
      - [x](#x-1)
        - [Caso práctico x -- foo](#caso-práctico-x----foo-1)
        - [Ponte a prueba x -- foo](#ponte-a-prueba-x----foo-1)
        - [Estudio de caso -- foo](#estudio-de-caso----foo-1)
        - [Ejercicios x -- test](#ejercicios-x----test-1)
      - [x](#x-2)
        - [Caso práctico x -- foo](#caso-práctico-x----foo-2)
        - [Ponte a prueba x -- foo](#ponte-a-prueba-x----foo-2)
        - [Estudio de caso -- foo](#estudio-de-caso----foo-2)
        - [Ejercicios x -- test](#ejercicios-x----test-2)
      - [x](#x-3)
        - [Caso práctico x -- foo](#caso-práctico-x----foo-3)
        - [Ponte a prueba x -- foo](#ponte-a-prueba-x----foo-3)
        - [Estudio de caso -- foo](#estudio-de-caso----foo-3)
        - [Ejercicios x -- test](#ejercicios-x----test-3)
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

##### Caso práctico 2 -- Diccionarios

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

##### Ponte a prueba 2 -- Contraseñas

```md
**Comprobación de contraseñas**
Existen diferentes procedimientos de generación de contraseñas válidas y de comprobación de la fortaleza de nuestras contraseñas.

Se pide utilizar las herramientas `pwgen` y `apg` y que se pruebe la fortaleza de las contraseñas generadas en la web http://www.passwordmeter.com/ u otra que conozca el alumnado.
```
```bash
sudo apt-get install pwgen apg
# ...
```


##### Estudio de caso -- `john` & `medusa`

> - [ ] OJO


##### Ejercicios 2 -- test

1. Ocultar los caracteres cuando se introduce una contraseña es una medida: **De seguridad activa.**
2. En un ataque por 'fuerza bruta': **La longitud de la clave sí importa.**
3. El ataque por diccionario: **Depende de la robustez de la contraseña.**
4. En relación con la autenticación con varios factores, indica cuál de las siguientes afirmaciones es verdadera: **Mejora el control de acceso.**
5. Indicar en GNU/Linux Ubuntu cómo o dónde se almacenan las contraseñas de los usuarios del sistema: **Cifradas en `/etc/shadow`**

#### x

##### Caso práctico x -- foo
##### Ponte a prueba x -- foo
##### Estudio de caso -- foo
##### Ejercicios x -- test

1. foo
2. foo
3. foo
4. foo
5. foo

#### x

##### Caso práctico x -- foo
##### Ponte a prueba x -- foo
##### Estudio de caso -- foo
##### Ejercicios x -- test

1. foo
2. foo
3. foo
4. foo
5. foo

#### x

##### Caso práctico x -- foo
##### Ponte a prueba x -- foo
##### Estudio de caso -- foo
##### Ejercicios x -- test

1. foo
2. foo
3. foo
4. foo
5. foo

#### x

##### Caso práctico x -- foo
##### Ponte a prueba x -- foo
##### Estudio de caso -- foo
##### Ejercicios x -- test

1. foo
2. foo
3. foo
4. foo
5. foo


## QUIZ
