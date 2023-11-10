# Sistemas UD2: Scripts para la administración de sistemas GNU/Linux


- [Sistemas UD2: Scripts para la administración de sistemas GNU/Linux](#sistemas-ud2-scripts-para-la-administración-de-sistemas-gnulinux)
  - [TEORÍA](#teoría)
  - [PRÁCTICA](#práctica)
    - [Entregas](#entregas)
    - [bar](#bar)
    - [McGrawHill](#mcgrawhill)
      - [Caso práctico 1 -- Editores de texto](#caso-práctico-1----editores-de-texto)
      - [Ponte a prueba 1 -- Primer script.sh](#ponte-a-prueba-1----primer-scriptsh)
      - [Ejercicios 1 -- test](#ejercicios-1----test)
      - [(!) Caso práctico 2 -- Tutorial (agenda)](#-caso-práctico-2----tutorial-agenda)
      - [Ponte a prueba 2 -- Recursión en los scripts](#ponte-a-prueba-2----recursión-en-los-scripts)
      - [Ejercicios 2 -- test](#ejercicios-2----test)
      - [Caso práctico 3 -- Contenido carpeta](#caso-práctico-3----contenido-carpeta)
      - [Ponte a prueba 3 -- Mejorar script (copias de seguridad incrementales)](#ponte-a-prueba-3----mejorar-script-copias-de-seguridad-incrementales)
      - [Ejercicios 3 -- test](#ejercicios-3----test)
      - [Caso práctico 4 -- Creando tareas](#caso-práctico-4----creando-tareas)
      - [Ponte a prueba 4 -- Admin almacenamiento disponible](#ponte-a-prueba-4----admin-almacenamiento-disponible)
      - [Ejercicios x -- test](#ejercicios-x----test)
      - [Caso práctico 5 -- Creando una calculadora](#caso-práctico-5----creando-una-calculadora)
      - [Ponte a prueba 5 -- Script recursivo en entorno gráfico](#ponte-a-prueba-5----script-recursivo-en-entorno-gráfico)
      - [Estudio de caso -- Copias de seguridad desatendidas creadas con scripts desde el entorno gráfico](#estudio-de-caso----copias-de-seguridad-desatendidas-creadas-con-scripts-desde-el-entorno-gráfico)
      - [Ejercicios x -- test](#ejercicios-x----test-1)
  - [QUIZ](#quiz)


## TEORÍA

> apuntes.md

## PRÁCTICA

<!-- ### Descargas

> do i need to sign up somewhere? GOTTA TRYYYYYYYYYYYYYIE
> it might be Brave/Linux tho

EXPECTED file: https://fpltimhe.3ip.eu/pluginfile.php/81778/mod_scorm/content/2/content/assets/mc-4a90823760cd36fe7156476b9cf06ee9.zip
but FAIL
and get redirected to: https://fpltimhe.3ip.eu/login/index.php -- MOODLE!!!!!!!!!!!!!!!!!!!!!!!!!!

> ¡¡¡¡¡¡¡¡¡¡¡ BROKEN -- should be zip but it's html !!!!!!!!!!! -->

### Entregas

- [bash_comandos_01.md](/Sistemas/UD2-Scripts_Linux/Entregas/bash__01.sh)
- [bash_scripting_01.sh](/Sistemas/UD2-Scripts_Linux/Entregas/bash_scripting_01.sh)
- [bash_scripting_02.sh](/Sistemas/UD2-Scripts_Linux/Entregas/bash_scripting_02.sh)

### bar

### McGrawHill


#### Caso práctico 1 -- Editores de texto

```md
Para programar de forma cómoda, emplearemos un editor de texto que reconozca el léxico y la sintaxis. De esta forma, resaltará las palabras reservadas del lenguaje y los símbolos especiales que acotan o delimitan bloques de sentencias dentro de la secuencia de código.
Otro valor añadido es la numeración de las líneas, que permite una mayor trazabilidad o seguimiento del código en la depuración de este. Para ello, elige un editor de texto que cumpla con estas características y opta por la configuración que tendríamos que aplicar.
```

```bash
gedit script.sh

nvim .
code repo
```

#### Ponte a prueba 1 -- Primer script.sh

```md
Uso del editor de textos para ejecutar un primer script
La mayoría de comandos que ejecuta un administrador de sistemas son repetitivos, ya que solo cambian unos parámetros. Por ello, se suelen crear scripts a medida, para luego utilizarlos en multitud de circunstancias. Investiga los comandos de que dispone el sistema actual.
¿Qué podría ejecutar un administrador? Crea un script que se llame *comandos.sh* con un editor de texto, para lanzarlo cuando se necesite.

Como los comandos son al fin y al cabo programas que residen en un carpeta determinada, para este ejercicio bastará con listarlos con el comando ls. Actuará sobre la carpeta en la que se encuentra, que es /bin.
```

```bash
#!/bin/bash

while true; do
    echo "Pulsa Ctrl+C!"
    echo "Pulsa Ctrl+C!!"
    echo "Pulsa Ctrl+C!!!"
    echo "Pulsa Ctrl+C!!"
done
```

#### Ejercicios 1 -- test

1. De entre todos los intérpretes de comandos de GNU/Linux, ¿cuál es el más utilizado?: **bash**
2. ¿Qué es un Shell en un sistema Linux?: **Un intéprete de órdenes en línea de comandos, que además incorpora un lenguae de programación que permite crear programas denominados guiones**
3. ¿Cuál es el lenguaje que entienden las computadoras?: **El lenguaje o código máquina**
4. ¿Cómo se llama al programa o utilidad que convierte un lenguaje entendible por el ser humano a otro entendible por la máquina? **Compilador e intérprete**
5. Los inconvenientes del código... **interpretado son que la traducción es poco eficiente y la velocidad de ejecución lenta**

#### (!) Caso práctico 2 -- Tutorial (agenda)

```md
# Generar una agenda básica
Una buena actividad para poner en práctica todo lo visto en la teoría sería crear un script para administrar una agenda básica, que utilice la mayoría de los elementos de programación del Shell. Y una de las tareas clave como administrador de sistemas es la comprensión de lo que nos pueda demandar un usuario.

1. Creación de agenda.sh
Crea un Shell script llamado **agenda.sh**, al que se le pasará un argumento (opcional), que será el nombre del fichero, que se usará para almacenar la información. Si se omite el argumento, el fichero será **agenda.dat**, creándose en blanco si no existe. Cada línea del fichero tendrá el siguiente formato:
   nombre:localidad:saldo:teléfono

2. Opciones disponibles
Cuando se ejecute el Shell script, mostrará un prompt para poder introducir las distintas opciones disponibles:
   AGENDA (Introduzca opción. ’h’ para ayuda) >>
   Las opciones que debe soportar son:
   - **h**: mostrará ayuda de todas las opciones.
   - **q**: para salir de la agenda.
   - **l**: listará el fichero de la agenda en columnas:

3. Agenda.dat
El fichero de agenda que creará (agenda.dat) tendrá un aspecto como el siguiente:
   ----------------- AGENDA -----------------------
   Nombre Localidad Saldo Teléfono
   -------- --------- ------- ---------
   Juan Ruiz Cartagena 134 968507765
   Jaime López Málaga 95 952410455
   …
   Ana Martínez Madrid 945 914678984

3. Y las siguientes opciones que deberá soportar son la descripción, que se mostrará cuando se solicite su ayuda:
   - **on**: ordenará la agenda por nombre, de forma ascendente. La ordenación no se mostrará y quedará en el fichero. Para ver la ordenación, habrá que ejecutar de nuevo el script con la opción l después.
   - **os**: ordenará la agenda por saldo, de forma descendente (¡ojo!, numéricamente). La ordenación no se mostrará y quedará en el fichero. Para ver la ordenación, habrá que ejecutar de nuevo el script, con la opción l después.
   - **a**: añadirá una entrada (línea). Para ello el Shell script debe preguntar por el nombre, localidad, saldo y teléfono, comprobando que ninguno de los campos quede en blanco. Una vez introducidos todos los datos de una nueva línea, debe añadirse al final del fichero de la agenda. Como mejora, antes de introducir la nueva línea, se puede comprobar que no existe ninguna otra con el mismo nombre y apellidos de persona.
   - **b**: borrará una entrada (línea). Para ello el Shell script debe preguntar el nombre y apellidos de la persona correspondiente. Una vez introducido éste, se debe eliminar la línea o líneas que tengan ese nombre exactamente (pueden ser varias si en el punto anterior se permiten líneas con el mismo nombre). Antes de proceder con el borrado, debe pedir confirmación.

> Scripts que proporcionen solución a esta tarea hay muchos, unos más eficientes y otros menos, pero lo más importante es que se entienda gracias a unos buenos comentarios y una buena organización del código. Nada nuevo en los entornos de programación.
```
```bash
supdawg() {
   echo 'not much wbu'
}
```

#### Ponte a prueba 2 -- Recursión en los scripts

```md
**Recursión en los scripts**
Uno de los recursos de programación que simulan el comportamiento natural de algunos procesos es la recursión. La recursión no es más que una función que se llama a sí misma, hasta llegar a la base de la recursión. La recursión se puede implementar de forma iterativa, como en la búsqueda de un fichero dentro de un árbol de directorios.
Para este caso, y a modo de introducción os planteamos el reto de crear la función recursiva que calcula el factorial de un número o n!. Posteriormente puedes crear la misma función, pero de forma iterativa.

> Para poder abordar la resolución de este ejercicio tendréis que apoyaros en el material complementario del apartado 2 de esta unidad. Intentando traducir a lenguaje del Shell el pseudocódigo de muestra. Fijaos en la base de la recursión, que son los casos base de la función factorial. Y en el caso iterativo, al estar la solución acotada, podemos emplear una secuencia en orden creciente (comando seq).
```
```bash
supdawg() {
   echo 'not much wbu'
}
```


#### Ejercicios 2 -- test

1. foo
2. foo
3. foo
4. foo
5. foo


#### Caso práctico 3 -- Contenido carpeta

```md
Conocer el contenido de una carpeta
Puede que, en un momento dado, nos interese saber qué tipo de ficheros y qué número de cada tipo tenemos contenido en una carpeta determinada. Os proponemos que desarrolléis un script que mire dentro de una carpeta y nos indique, por un lado, el tipo de archivos que alberga (esto vendrá determinado por la extensión de los mismos) y, por otro, la cantidad de archivos de cada tipo.
> Descarga el código con una posible solución. Primero recorremos todos los ficheros de una determinada carpeta para almacenar la extensión de estos en un fichero auxiliar. 
> Después, copiaremos de forma ordenada y sin repeticiones el contenido de este fichero en otro, obteniendo así un listado de las diferentes extensiones encontradas. Por último, para cada extensión encontrada, contaremos cuántos ficheros tendremos de ese tipo.
```

#### Ponte a prueba 3 -- Mejorar script (copias de seguridad incrementales)

```md
Copia de seguridad con marca temporal o timestamp
El script ASO_U02_A03_TEO_09.sh que aparece en el apartado 3.4 de teoría realiza una copia de seguridad básica. Una forma de mejorarlo sería que no borrara las copias de seguridad anteriores e incremente las copias, pero para diferenciar las distintas copias, tendríamos que añadirle al nombre un sufijo con una marca de tiempo.
> Tomando como referencia el script citado anteriormente y utilizando el comando date con un formato apropiado, podremos añadir la marca temporal apropiada.
```

#### Ejercicios 3 -- test

1. foo
2. foo
3. foo
4. foo
5. foo



#### Caso práctico 4 -- Creando tareas

```md
Una tarea que tal vez un administrador requiera, para que sea realizada de forma periódica, sin necesidad de interactividad, podría ser la limpieza de archivos temporales. 
Os proponemos que confeccionéis una tarea encargada de limpiar (o eliminar), cada vez que haya transcurrido una hora, los archivos temporales que estén vacíos.

1. Creación de Script
Para llevar a cabo la resolución de este ejercicio, crearemos un script con el comando y los argumentos que realizará la tarea solicitada, para luego albergarlo en el lugar apropiado, para que sea lanzado a ejecución por el sistema.

2. Verificar tarea
Lo siguiente que haremos será verificar que, en el fichero /etc/crontab, existe la entrada de las tareas que se deben realizar cada hora (/etc/cron.hourly). En caso de que no existan, las tendremos que añadir.

3. Crear Script en carpeta
Y procedemos a crear el script, como el que aparece en la figura anterior, dentro de la carpeta /etc/cron.hourly, que podemos llamar limpia_temp.sh.
   #!/bin/bash
   find /tmp/ -type f -empty

4. Permisos de ejecución
Y sólo nos queda dar permiso de ejecución.
   sudo chmod +x /etc/cron.hourly/limpia_temp.sh

```

#### Ponte a prueba 4 -- Admin almacenamiento disponible

```md
Informar al administrador via e-mail del espacio en disco
Uno de los puntos críticos del sistema es el espacio en disco.  Por ello, no estaría mal que el administrador tenga conocimiento, de forma periódica (cada semana, por ejemplo), del espacio libre y ocupado del sistema que administra. Con esta finalidad, se tendrá que crear una tarea y programarla.

> Para la realización de este ejercicio, podemos fijarnos en el ponte a prueba anterior. Nuestra referencia será el timestamp empleado para desarrollar un script, que creará un archivo de log con marca temporal bajo su nombre y contendrá la fecha actual (en el momento de crearlo), junto con la información del espacio libre y ocupado de todos los sistemas de almacenamiento montados en el sistema (orden df -h). Una vez hecho esto, se enviará como archivo adjunto por correo electrónico al administrador del sistema (podemos asumir que dirección es admin@local.com). Y una vez creado, bastará con adjuntarlo al crontab del sistema.
> Fijaos en que tendremos que tener instalado en el sistema una aplicación para el envío de correos desde línea de comandos como sendmail.
```

#### Ejercicios x -- test

1. foo
2. foo
3. foo
4. foo
5. foo



#### Caso práctico 5 -- Creando una calculadora

```md
Creando una calculadora
Ahora nos planteamos un script concreto que puede ser utilizado muchas veces, de forma repetitiva y según la demanda del usuario: una simple calculadora.
Para programarlo, deberás realizar un script que pedirá al usuario la operación que se quiere realizar por medio de un menú gráfico, lo que nos devolverá el resultado (también en el entorno gráfico) y volverá a preguntar al usuario qué otra operación quiere realizar, hasta que el usuario opte por la opción de salir.

> Fijaos en los diálogos empleados. Primero se ejecutará un bucle, que mostrará el diálogo de lista a modo de menú, para que el usuario seleccione una opción por realizar (u opte por salir). Dependiendo de la opción elegida, se nos pedirán, por medio del diálogo de formulario los operandos, para finalmente mostrar el resultado con un diálogo de información. Después, de nuevo se mostrará el diálogo de lista del menú, por si el usuario quiere realizar otra operación hasta que decida salir.
```

#### Ponte a prueba 5 -- Script recursivo en entorno gráfico

```md
Script recursivo en entorno gráfico
Todos los scripts se pueden rediseñar para que utilicen la librería gráfica y así la interacción con el usuario sea a través del entorno gráfico. En este caso, se propone que rediseñéis el script de un ponte a prueba anterior, con sentencias de Zenity para calcular el factorial de un número.
> Para rediseñar un script con la funcionalidad gráfica que proporciona Zenity, simplemente tenemos que localizar los argumentos de entrada, tanto globales al script como los locales en la llamada a la función, así como la información que mostraría por pantalla, para cambiarlos por diálogos de Zenity.
```

#### Estudio de caso -- Copias de seguridad desatendidas creadas con scripts desde el entorno gráfico

```md
# SCRIPTS PARA LA ADMINISTRACIÓN DE SISTEMAS GNU/LINUX

## Caso práctico extendido 1

### Introducción
Dentro de la administración del sistema, a la hora de realizar copias de seguridad, podemos emplear utilida- des existentes o implementarlas nosotros mismos. Con independencia de la opción que utilicemos, es muyimportante que estas tareas se desempeñen de forma desatendida y que se repitan de acuerdo con unaperiodicidad prestablecida. Y para que sea posible su uso por parte de usuarios comunes, es decir, de usuariosno administradores que no posean o no tengan por qué contar con grandes conocimientos del sistema, utili- zaremos herramientas gráficas, que permiten interoperar con el sistema de una forma más intuitiva.

### Enunciado
Para facilitar la tarea del administrador de una asesoría, sería interesante gestionar su política de copias deseguridad. Para ello, el administrador tendrá que crear un Script en Shell Bash para programarlas comotareas. El mencionado script solicitará (mediante un formulario gráfico con Zenity) el nombre de la tarea, la carpeta de origen de los archivos para los que se quiere realizar la copia de seguridad, la carpeta de destino(para almacenar la copia de seguridad, que será un archivo comprimido en formato tgz del contenido de lacarpeta origen), el día de la semana y la hora en que se tendrán que llevar a cabo las copias.
La idea es que esta tarea se repita de forma periódica todas las semanas, en el día de la semana y a la horaindicados. Si no se indica día u hora, la copia se realizará, por defecto, el viernes (en el caso de no indicar día),a las 14:00 horas (en el caso de no indicar hora).
Este script, tras pedir los datos a través del formulario, creará otro script para asociarlo a la tarea en elmomento de registrarla. Este subscript se llamará igual que la tarea (con extensión sh de Shell Bash) y conten- drá los comandos necesarios para realizar la copia de seguridad. Asimismo, el archivo comprimido resultanteque se creará tendrá como nombre el de la tarea, al que añadiremos un sufijo con una marca temporal paradiferenciar las distintas copias. Por ejemplo, si queremos realizar una tarea que se llame “Office” para lanzarlalos lunes a las 13:30 horas que comprima el contenido de la carpeta /Datos/Office en un archivo tar.gz (o tgz)en la carpeta /Backups, tendremos que indicarlo.
Como se muestra en el formulario de la imagen, lo indicado permitirá crear un script llamado “Office.sh”, que se ejecutará según la programación de la tarea registrada creando un archivo compri- mido “Office_2021_05_24_13_30.tgz” en la carpeta “/Backups”. La siguiente semana creará el archivo“Office_2021_05_31_13_30.tgz”, y así sucesivamente hasta que el programa se pare o hasta que deje de estarregistrada la tarea “Office”.
También tendrá que guardarse dentro de este subscript, a modo de comentario, la programación de la tarea:el día de la semana y la hora en que se realizará el backup.

## SOLUCIÓN
El primer script (ASO_U02_CPE_01_A04_A05_01.sh) será el encargado de crear un segundo script con la tareaque realiza la copia de seguridad y que habrá que programar. Y todo ello se puede realizar con la siguientesecuencia de pasos:
1. Pide los datos para la confección de la tarea de copia de seguridad al usuario, mediante un diálogo deformulario.
2. Tras leer los datos con el formulario, se efectúa la asignación de estos datos a las diversas variables quese emplearán para la confección de la tarea.
3. Si existe un script con el mismo nombre que la tarea, se elimina.
4. Crea el script (ASO_U02_CPE_01_A04_A05_02.sh) de la tarea objetivo, con las sentencias concretas parala realización de la copia de seguridad.
5. Una vez tenemos el script de la tarea creado, lo programamos en cron con el crontab
6. En el segundo script tendremos la muestra del script de la tarea creado.En el vídeo que encontrarás a continuación puedes ver la resolución del caso práctico extendido.
```


```md
# SCRIPTS PARA LA ADMINISTRACIÓN DE SISTEMAS GNU/LINUX

## Caso práctico extendido 1

### Introducción
Dentro de la administración del sistema, a la hora de realizar copias de seguridad, podemos emplear utilida- des existentes o implementarlas nosotros mismos. Con independencia de la opción que utilicemos, es muyimportante que estas tareas se desempeñen de forma desatendida y que se repitan de acuerdo con unaperiodicidad prestablecida. Y para que sea posible su uso por parte de usuarios comunes, es decir, de usuariosno administradores que no posean o no tengan por qué contar con grandes conocimientos del sistema, utili- zaremos herramientas gráficas, que permiten interoperar con el sistema de una forma más intuitiva.

### Enunciado
Para facilitar la tarea del administrador de una asesoría, sería interesante gestionar su política de copias deseguridad. Para ello, el administrador tendrá que crear un Script en Shell Bash para programarlas comotareas. El mencionado script solicitará (mediante un formulario gráfico con Zenity) el nombre de la tarea, la carpeta de origen de los archivos para los que se quiere realizar la copia de seguridad, la carpeta de destino(para almacenar la copia de seguridad, que será un archivo comprimido en formato tgz del contenido de lacarpeta origen), el día de la semana y la hora en que se tendrán que llevar a cabo las copias.
La idea es que esta tarea se repita de forma periódica todas las semanas, en el día de la semana y a la horaindicados. Si no se indica día u hora, la copia se realizará, por defecto, el viernes (en el caso de no indicar día),a las 14:00 horas (en el caso de no indicar hora).
Este script, tras pedir los datos a través del formulario, creará otro script para asociarlo a la tarea en elmomento de registrarla. Este subscript se llamará igual que la tarea (con extensión sh de Shell Bash) y conten- drá los comandos necesarios para realizar la copia de seguridad. Asimismo, el archivo comprimido resultanteque se creará tendrá como nombre el de la tarea, al que añadiremos un sufijo con una marca temporal paradiferenciar las distintas copias. Por ejemplo, si queremos realizar una tarea que se llame “Office” para lanzarlalos lunes a las 13:30 horas que comprima el contenido de la carpeta /Datos/Office en un archivo tar.gz (o tgz)en la carpeta /Backups, tendremos que indicarlo.
Como se muestra en el formulario de la imagen, lo indicado permitirá crear un script llamado “Office.sh”, que se ejecutará según la programación de la tarea registrada creando un archivo compri- mido “Office_2021_05_24_13_30.tgz” en la carpeta “/Backups”. La siguiente semana creará el archivo“Office_2021_05_31_13_30.tgz”, y así sucesivamente hasta que el programa se pare o hasta que deje de estarregistrada la tarea “Office”.
También tendrá que guardarse dentro de este subscript, a modo de comentario, la programación de la tarea:el día de la semana y la hora en que se realizará el backup.

## SOLUCIÓN
El primer script (ASO_U02_CPE_01_A04_A05_01.sh) será el encargado de crear un segundo script con la tareaque realiza la copia de seguridad y que habrá que programar. Y todo ello se puede realizar con la siguientesecuencia de pasos:
1. Pide los datos para la confección de la tarea de copia de seguridad al usuario, mediante un diálogo deformulario.
2. Tras leer los datos con el formulario, se efectúa la asignación de estos datos a las diversas variables quese emplearán para la confección de la tarea.
3. Si existe un script con el mismo nombre que la tarea, se elimina.
4. Crea el script (ASO_U02_CPE_01_A04_A05_02.sh) de la tarea objetivo, con las sentencias concretas parala realización de la copia de seguridad.
5. Una vez tenemos el script de la tarea creado, lo programamos en cron con el crontab
6. En el segundo script tendremos la muestra del script de la tarea creado.En el vídeo que encontrarás a continuación puedes ver la resolución del caso práctico extendido.
```

<!-- #### Estudio de caso -- Gestión (listado y eliminación) de tareas de copias de seguridad con scripts desde el entorno gráfico

```md
...
``` -->

#### Ejercicios x -- test

1. foo
2. foo
3. foo
4. foo
5. foo



## QUIZ

