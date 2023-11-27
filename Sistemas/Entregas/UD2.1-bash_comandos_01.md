# EJERCICIOS REPASO LINUX (ISO)

1. Realizar el siguiente archivo de texto, en mi directorio de trabajo:

```txt
Garcia Lopez Aarón 7986821
Muñoz Lopez Carlos Antonio 4568756
Moreno Ramos Alvaro 1239083
Sanchez Perez Ramon 7643434
Santiago Jimenez Noemi 4221336
Moreno Perera Carolina 3423444
Galan Fernandez Jorge 1234123
Fernandez Perez Iker 3344334
```
```bash
# 1. Ordenar el listado de alumnos por orden alfabético y redirigirlo a OrdAlf.txt.
sort listado.txt > OrdAlf.txt

# 2. Visualiza OrdAlf.txt.
cat OrdAlf.txt

# 3. Cuenta el número de palabras, caracteres y líneas y redirígelo a Num.txt
echo "Líneas: $(wc -l listado.txt | awk '{print $1}')" >> Num.txt
echo "Palabras: $(wc -w listado.txt | awk '{print $1}')" >> Num.txt
echo "Caracteres: $(wc -c listado.txt | awk '{print $1}')" >> Num.txt

# 4. Visualiza Num.txt
less Num.txt

# 5. Obtener los nombres y los números identificativos y redirigirlos a NomyNum.txt
awk 'BEGIN { print "Nombre\tID" } { for (i = 3; i <= NF; i++) printf "%s ", $i; print "" }' listado.txt >> NomyNum.txt
# awk '{print $(NF-1), $NF}' listado.txt

# 6. Visualiza NomyNum.txt
cat NomyNum.txt
```

2. Obtener los procesos en ejecución y guardarlos en process.txt. Obtener los procesos en forma jerárquica y guardarlo en jerar.txt.

```bash
ps aux > process.txt
pstree > jerar.txt
```

3. En el archivo mysystem.txt, guardar la información: nombre del equipo y sistema operativo en uso.

```bash
echo "Nombre del equipo: $(hostname)" >> mysystem.txt
cat /etc/os-release | grep 'PRETTY_NAME' | awk -F'"' '{print "Sistema Operativo: " $2}' >> mysystem.txt
# cat /etc/os-release; lsb_release -a; hostnamectl
```

4. En el archivo partitions.txt, guardar la información de las particiones existentes en el sistema.

```bash
lsblk > partitions.txt
# df > partitions.txt
```

5. En una sola línea de terminal, guardar en el archivo msj.txt el texto: “Estamos a tope con ASO desde YA”.

```bash
echo “Estamos a tope con ASO desde YA” > msj.txt
```

6. Mediante redirección de entrada, realizar los siguientes ejercicios:

```bash
# 1. Mostrar las 3 primeras líneas de OrdAlf.txt.
head -n 3 OrdAlf.txt

# 2. Mostrar las 5 primeras líneas de NomyNum.txt
head -n 6 NomyNum.txt

# 3. Mostrar las 2 ultimas líneas de mysystem.txt
tail -n 2 mysystem.txt

# 4. Mostrar las 2 ultimas líneas de partitions.txt
tail -n 2 partitions.txt

# 5. Mostrar TODA la info de msj.txt
cat msj.txt || less msj.txt
```
7. Vamos a trabajar con los comandos sleep y kill. Repasa cómo funcionan o consulta los primeros ejercicios del tema y realiza estas pequeñas tareas:

```bash
# 1. Utiliza el comando ps para ver la información de los procesos
ps --user $(id -u) -F | less

# 2. Lanza el comando sleep y que el terminal este inactivo durante 100 segundos
sleep 100

# 3. Observa lo que ocurre. ¿Cómo podríamos revertir la situación? Reviértela
pkill sleep || kill $(ps aux | grep "sleep" | awk '{print $2}')

# 4. Ahora, lanza el mismo comando, pero en segundo plano. ¿Cómo se hace? ¿Que implica?
sleep 100 &; fg || bg

# 5. Lanza otros procesos como nano (nano &) o vi (vi &) ; y el contenido de ps, redirígelo a un archivo llamado procesos.txt y visualiza su contenido
nano &; ps aux | tee procesos.txt
```

8. Usa el comando mount, redirige su información a un archivo y visualiza su contenido. Una vez veas el contenido, renombra el archivo según la información que te encuentres.

```bash
mount | tee mount.log
```

9.  Con los comandos df -h y du -h, redirígelos a archivos y sobre todo el último, explica su contenido y sobre el archivo, realizar una selección de líneas que contengan la palabra sda en una de sus filas y muestra esa información, además de explicar a qué se refiere.

```bash
df -h
du -sh /home/$USER
```

10.  Utiliza el comando `sudo apt install net-tools` y lanza el comando `route`. Explica la información que obtienes y haz que se visualicen solo las columnas: 1,2,3 y 8 (para ello, edita el archivo, quita los espacios y tabula tu). Redirige esa
información a un archivo llamado con_red.txt.

```bash
route | awk '{print $1, $2, $3, $8}' > con_red.txt
```

11.  Observa como funciona el comando grep: https://www.librebyte.net/cli/12-ejemplos-practicos-del-comando-grep/. Utiliza grep con los archivos de texto de los ejercicios 9.2, y realiza búsquedas con todas las opciones del articulo anterior en cualquiera de los archivos txt de los citados ejercicios.

```bash
# TODO: grep
```

12.   Mostrar cuantos usuarios tiene registrados el sistema (el registro de usuarios está en el archivo /etc/passwd)

```bash
wc -l /etc/passwd
```

13.  Mostrar cuántos usuarios tiene registrados el sistema y que utilizan el intérprete bash (debe aparecer al final de la línea /bin/bash o similar)

```bash
grep -c '/bin/bash' /etc/passwd
```
14.  Ejecuta la siguiente línea y explica lo que hace/sucede: `who > conectados.txt; grep tty conectados.txt; rm conectados.txt`.

```bash
# ...
```

15.  Escribir la frase: ”soy alumno de 2º ASIR” en un archivo de texto llamado ftext y visualizar el contenido; todo en la misma línea.

```bash
echo "Soy alumno de 2º de ASIR" > ftext && cat $_
```

16. Realiza una tubería utilizando `tee`, con echo a la izquierda; para que la frase que queráis se visualice por pantalla y se cree en un archivo al mismo tiempo. Repite el ejercicio, pero ahora consigue que la frase puesta en echo no se vea en el terminal.

```bash
echo "supdawg" | tee supdawg.txt
echo "supdawg" | tee supdawg.txt > /dev/null
```

17. El comando `nl` también es útil, es una herramienta que permite numerar las líneas de un archivo. Crea un archivo de texto con lo siguiente y prueba el comando `nl`:
(LOS NUMEROS NO SE PONEN A MANO, TENDRAN QUE VERSE
CUANDO SE APLIQUE NL Y LUEGO UN CAT)
```txt
1 hola
2 soy
3 un
4 pichon
5 y
6 esto
7 es
8 una
9 prueba
10 para
11 nl
```
```bash
nl pichon.txt
```

18.  Ahora, sabiendo cómo funciona `nl`, realiza una tubería donde crees un archivo con la información devuelta por el comando “ls etc/group”, la numeres y la redirijas a otro archivo de texto, visualizando su información como último paso.

```bash
nl /etc/group | tee nl_group.txt
```

19. Ahora vamos a practicar con el comando: `find`. Nos podemos ayudar de la ayudade la red: https://www.hostinger.es/tutoriales/como-usar-comando-find-locate-en-linux/.

```bash
### SIN tuberías
# 1. Buscar en nuestro directorio de trabajo, todos los archivos de tipo fichero (no directorios) con extensión txt
find . -type f -name "*.txt"

# 2. Buscar todos los archivos de tipo fichero, con los permisos 0775
find . -type f -perm 0775

# 3. Buscar, tanto ficheros como directorios, que se encuentren vacíos. (Tal vez no haya ninguno).
find . -type d,f -empty

# 4. Buscar los ficheros pertenecientes a nuestro usuario; y los ficheros pertenecientes a nuestro grupo
find . -type f -user $USER && \
 find . -type f -group $(id -gn)

### CON tuberías
# 1. Contar los archivos con extensión txt usando el comando find y redirigirlo al archivo numarchtext. Visualizar dicho archivo
find . -type f -name "*.txt" | wc -l > num_arch_text && cat num_arch_text

# 2. Encontrar los archivos de nuestro directorio de trabajo mayores de 0,5MB y listarlos en el archivo masde05.txt. Visualizar dicho archivo
find . -type f +500k > mas_de_05.txt && cat mas_de_05.txt

# 3. En el archivo fichantiguos.txt, listar los archivos que tengan más de 30 días desde su última modificación. Visualizar dicho archivo
find . -type f -mtime +7 > fich_antiguos.txt && cat fich_antiguos.txt
```