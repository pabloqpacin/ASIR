# ISO UD3 - EJER - LinuxComandos02

> En VM 'Pop!_OS Clone'

## 1. 
```bash
mkdir -p ~/Actividades/Actividad01/Ejercicio01 && cd $_
ls -lt /etc/ > ./etc-portiempo.log
```

## 2. 
```bash
mkdir ~/Actividades/Actividad01/Ejercicio02 && cd $_
echo $HOSTNAME > vb_hostname.txt
echo $USER > vb_nombreuser.txt
which $SHELL > vb_shellactual.txt
echo $PATH > vb_pathactual.txt
```

## 3. 
```bash
mkdir ~/Actividades/Actividad01/Ejercicio03
mkdir ~/Documents/mis_scripts && cd $_
vi listaComandos.sh

# Write this script:
    #!/bin/bash
    ls /bin/ -la

chmod +x listaComandos.sh || chmod 777 listaComandos.sh
./listaComandos.sh

mkdir ~/Documents/borrame && cd $_
/home/pabloqp/Documents/mis_scripts/listaComandos.sh > resultado10.txt
    # ALT == ../mis_scripts/listaComandos.sh
mv resultado10.txt ~/Actividades/Actividad01/Ejercicio03/
```

## 4.

> absolute torture and bullshite

```bash
mkdir ~/Actividades/Actividad01/Ejercicio04 && cd $_
mkdir mis_ficheritos
cd .. && touch Ejercicios04/mis_ficheritos/fich1 (...) Ejercicios04/mis_ficheritos/fich4
cd Ejercicios04/mis_ficheritos && ls
rm fich2 fich3
rmdir ~/Actividades/Actividad01/Ejercicio03/borrame
```

## 5.
```bash
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