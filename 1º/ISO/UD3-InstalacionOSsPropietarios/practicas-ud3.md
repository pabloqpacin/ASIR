# UD3: Instalación OSs Propietarios (+Linux)


- [UD3: Instalación OSs Propietarios (+Linux)](#ud3-instalación-oss-propietarios-linux)
  - [LinuxComandos02](#linuxcomandos02)
    - [Ejercicio 1](#ejercicio-1)
    - [Ejercicio 2](#ejercicio-2)
    - [Ejercicio 3](#ejercicio-3)
    - [Ejercicio 4](#ejercicio-4)
    - [Ejercicio 5](#ejercicio-5)
  - [WindowsServer2019](#windowsserver2019)



## LinuxComandos02

### Ejercicio 1

```markdown
# Ejercicio 1
1. Crea un directorio en tu home de usuario llamado 'Actividades' y dentro otro directorio llamado 'Actividad 1' y su vez otro dentro llamado 'Ejercicio 1' en el que guardarás los ficheros obtenidos en los puntos 2 y 3 de este ejercicio.
2. Obtén un fichero al que llamarás 'etc-portiempo1' que contendrá el listado de todos los ficheros existentes en el directorio '/etc' ordenados por fecha de modificación (mostrando en primer lugar el primero que fue modificado).
3. Obtén un fichero al que llamarás 'etc-portiempo2' que contendrá el listado de todos los ficheros existentes en el directorio '/etc' ordenados por fecha de modificación (mostrando en primer lugar el que ha sido modificado más recientemente).
(Sugerencia: usar el comando man -ls para obtener la opción adecuada para realizar el ejercicio) 
```
```bash
# Ejercicio 1
mkdir -p ~/Actividades/Actividad01/Ejercicio01 && cd $_
ls -lt /etc/ > ./etc-portiempo.log
```

### Ejercicio 2

```markdown
# Ejercicio 2
1. Crea un directorio llamado 'Ejercicio2' dentro de 'Actividad1'. Guarda dentro todos los ficheros a generar en este ejercicio.
2. Guarda el contenido de la variable de sistema para saber el hostname dentro de un fichero llamado 'vb-hostname.txt'.
3. Guarda el contenido de la variable de sistema para saber el nombre de usuario dentro de un fichero llamado 'vb-nombreusuario.txt'.
4. Guarda el contenido de la variable de sistema para saber el Shell que estamos utilizando dentro de un fichero llamado 'vb-shellactual.txt'.
5. Guarda el contenido de la variable de sistema que incluye las rutas del PATH dentro de un fichero llamado 'vb-pathactual.txt'.
6. Guarda el contenido de la variable de sistema que contiene la ruta de tu home de usuario dentro de un fichero llamado 'vb-pathactual.txt'. 
```
```bash
# Ejercicio 2
mkdir ~/Actividades/Actividad01/Ejercicio02 && cd $_
echo $HOSTNAME > vb_hostname.txt
echo $USER > vb_nombreuser.txt
which $SHELL > vb_shellactual.txt
echo $PATH > vb_pathactual.txt
```

### Ejercicio 3

```markdown
# Ejercicio 3
1. Crea un directorio llamado 'Ejercicio3' dentro de 'Actividad1'.
2. Crea un directorio llamado 'Mis-Scripts' dentro del directorio Documents (o Documentos) incluido en tu home de usuario.
3. Crea dentro de 'Mis-Scripts' un fichero llamado 'listacomandos.sh'. El contenido de dicho fichero será:
> #!/bin/bash
> ls /bin/ -la
4. Prueba a ejecutar el fichero desde el directorio 'Mis-Scripts'. Si da error muestra el error y comenta a qué crees que es debido.
> ./listacomandos.sh
5. Da permiso de ejecución al fichero creado:
> chmod +x listacomandos.sh
6. Prueba a ejecutar de nuevo el script 'listacomandos.sh'
> ./listacomandos.sh 
7. Crea un directorio llamado 'Borrame' dentro del directorio Documents (o Documentos) incluido en tu home de usuario.
8. Ve al directorio 'Borrame'.
9. Ejecuta dentro el script creado anteriormente poniendo solo su nombre, es decir, 'listacomandos.sh'. Si sale algún error comenta que está ocurriendo.
> ./listacomandos.sh o sh listacomandos.sh
10. Ejecuta ahora el script dentro del directorio 'Borrame' utilizando ruta absoluta. Utilizando redirecciones guarda el resultado en el fichero 'resultado10.txt'.
11. Copia el fichero 'resultado10.txt' al directorio 'Ejercicio3'.
12. Cambia el nombre del fichero 'resultado10.txt' existente en el directorio 'Ejercicio3' por [¿?]
```
```bash
# Ejercicio 3
mkdir ~/Actividades/Actividad01/Ejercicio03
mkdir ~/Documents/mis_scripts && cd $_
vi listaComandos.sh

  # #!/bin/bash
  # ls /bin/ -la

chmod +x listaComandos.sh || chmod 777 listaComandos.sh
./listaComandos.sh

mkdir ~/Documents/borrame && cd $_
/home/pabloqp/Documents/mis_scripts/listaComandos.sh > resultado10.txt
    # ALT == ../mis_scripts/listaComandos.sh
mv resultado10.txt ~/Actividades/Actividad01/Ejercicio03/
```

### Ejercicio 4

```markdown
1. Crea un directorio llamado 'Ejercicio4' dentro de Actividad1.
2. Crea un directorio llamado 'MisFicheritos' dentro.
3. Crea desde 'Actividad1' cuatro ficheros vacíos en el directorio 'MisFicheritos' llamados 'fich1.txt' 'fich2.txt' 'fich3.txt' y 'fich4.txt'.
NOTA: No se podrá utilizar un editor de textos para crear los ficheros (usa 'Touch'). Entra el directorio 'MisFicheritos' y borra 'fich2.txt' y 'fich3.txt'
4. Utilizando ruta relativa y desde el directorio 'MisFicheritos' borra el directorio 'Borrame' creado anteriormente.
```
```bash
# Ejercicio 4
mkdir ~/Actividades/Actividad01/Ejercicio04 && cd $_
mkdir mis_ficheritos
cd .. && touch Ejercicios04/mis_ficheritos/fich1 (...) Ejercicios04/mis_ficheritos/fich4
cd Ejercicios04/mis_ficheritos && ls
rm fich2 fich3
rmdir ~/Actividades/Actividad01/Ejercicio03/borrame
```


### Ejercicio 5

```markdown
1. Crea un directorio llamado 'Ejercicio5' dentro de 'Actividad1'.
2. Lista el contenido del directorio /home/ y redirige el resultado a un fichero llamado 'recordatorio.txt' que deberá estar dentro de 'Actividad1'. Realiza esta acción desde el directorio 'Actividad1'.
3. Consulta el contenido del fichero 'recordatorio.txt' para comprobar que la operación del punto anterior se ha realizado correctamente.
4. Añade desde comando utilizando redirecciones dos saltos de línea y luego el texto "Ahora listo el directorio sbin" al fichero 'recordatorio.txt' (el nuevo texto ha de estar después del contenido del fichero, no debe sustituir el contenido ya existente). Posteriormente añade también un salto de línea al contenido ya existente del fichero 'recordatorio.txt'.
5. Lista el contenido del directorio /sbin/ y redirige la salida al fichero 'recordatorio.txt' pero sin borrar el contenido anterior, es decir, la nueva información ha de añadirse a partir de la información ya existente en el contenido de 'recordatorio.txt'.
6. Añade desde comando utilizando redirecciones tres saltos de línea y el texto "FIN" de tal forma que aparezca con una tabulación.
7. Consulta el contenido del fichero 'recordatorio.txt' para comprobar que la operación del punto anterior se ha realizado correctamente.
```
```bash
# Ejercicio 5
mkdir ~/Actividades/Actividad01/Ejercicio05
ls ~ >  recordatorio-home.txt
cat recordatorio-home.txt
    # 10x == batcat

echo -e "\n\nAhora listo el directorio sbin\n" >> recordatorio-home.txt
cat recordatorios-home.txt

ls /sbin >> recordatorio-home.txt
echo -e "\n\n\n\tFIN"

cat recordatorio-home.txt
```

## WindowsServer2019

`NULL`