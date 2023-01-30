# ISO 2. Máquinas Virtuales

## Campus Virtual

- [ ] UD2-MaquinasVirtuales.pdf
- [x] Material Complementario
- [x] VirtualBox-Configuracion.pdf
- [x] LinuxFilesystem.pdf
- [ ] EJER-ParticionesMontajeDiscos.pdf
- [x] LinuxComandos01.pdf
- [x] **AUTOEVALUACIÓN UD2**
  - [x] CUESTIONARIO-01 UD2
  - [x] CUESTIONARIO-02 UD2
  - [x] CUESTIONARIO-03 UD2




### Material Complementario

<details>
<summary>VBox Tutoriales</summary>

- [x] [Cómo descargar e instalar VirtualBox en Windows10](https://www.youtube.com/watch?v=UZQS5S2GBcs&t=1s&ab_channel=WebsorTech)
- [x] Realizar una instantánea en VBox
- [x] Instalar Guest Additions y primeros pasos para compartir carpeta
- [x] Configurar VirtualBox y crear una VM en Windows10
- [x] Carpeta compartida, portapapeles, arrastrar y soltar
- [x] [Solución Error al Crear Máquina VIRTUAL en sistemas de 64 bits en Windows (VirtualBox y VMWare)](https://youtu.be/ePXWjUIN0VY&ab_channel=CellSnake007)

> Learnt all this from @Cyberspatial: [Virtualbox Tutorial: How to Build Virtual Machines](https://www.youtube.com/watch?v=lzRMYTf6X2o&ab_channel=Cyberspatial)

</details>


### VirtualBox-Configuracion .pdf

<details>
<summary>Notas</summary>

- [x] Ajustes > Procesador, etc.
- [x] Guest Additions
- [ ] **Configuración de red en entornos virtuales**

- modelo de tarjeta de red (AMD/Intel)
- NAT default IP: 10.0.2.15
- Red NAT:
    
"Se	agrupan	los	sistemas	en	una	red	y	se	impide	que	los	sistemas	ajenos	a	ella (más	allá	del	router)	puedan	acceder	directamente	a	ellos.	Los	sistemas	que	se	encuentran	conectados	mediante	esta	red	pueden	utilizar	TCP	y	UDP	sobre	IPv4	e	IPv6	para	comunicarse."

- Adaptador Puente:

"La	configuración	de	adaptador	puente	nos	permite	interactuar	con	el	entorno	de	red	del	
Hipervisor	como	si	la	Máquina	Virtual	se	encontrara	en	la	misma	Red.	Genera	una	nueva	interfaz	
de	red	por	software,	accediendo	a	la	red	de	manera	física.

Si	en	nuestra	red	del	Hipervisor	tenemos	un	servidor	de	DHCP	este	le	asignará	IPs	a las	máquinas	
que	se	encuentren	conectadas	de	este	modo,	permitiendo	trabajar	de	manera	conjunta	a	todas	las	
máquinas,	estén	virtualizadas	o	no,	ya	que	para	la	red	se	encontrarán	todas	al	mismo	nivel."

- (...)

- [ ] Recursos Compartidos 
- [ ] **Clonación** de VMs
- [x] Instantáneas (Snapshots)
- [ ] *Añadir un disco duro virtual adicional.*
- [ ] **Exportar**/importar una VM
- [ ] *Grupos* de VMs: "VirtualBox ermite	que	las	maquinas virtuales	se	organicen	en grupos,	y	a	estos	se	les	pueden	aplicar	las	operaciones	típicas	que	se	encuentran	en	el	menú	Máquina		y	afectarían	a	todas	las	maquinas	virtuales	del	grupo."
- [ ] Captura de vídeo
- [ ] **Administrador de Medios Virtuales**
- [ ] *Carpetas compartidas* + Portapapeles + Dispositivos USB



</details>





### Sistema de Ficheros en Linux .pdf

<details>
<summary>Linux Filesystem</summary>

FHS - Filesystem Hierarchy Standard
- administrado por la Linux Foundation, define directorios fundamentales (https://www.pathname.com/fhs)
- las distros lo respetan en su gran mayoría

Directorios
- `/` == ninguna aplicación debe crear directorios aquí
- `/bin` == comandos fundamentales (**binarios del sistema**) (eg. cat, chmod, cp, date, echo, hostname, kill, ln, login, ls, mkdir, mount, mv, ping, pwd, rm, sh, su, uname...)
- `/boot` == archivos necesarios para el arranque del sistema, kernel y gestor de arranque
  - `vmlinuz` == kernel comprimido
  - `initrd` == sistemas de archivos de RAM inicial
  - `config` == puede ser utilizado para compilar el kernel
  - `System.map` == tabla de símbolos del kernel, útil en la FHS depuración de programas
- `/dev` == nodos de dispositivos nos permiten interactuar con hardware y software
  - `/dev/sda` == primer disco duro del sistema
  - `/dev/sda1`== primera partición del primer disco duro
  - `/dev/sda2`== segunda partición del primer disco duro
  - `/dev/sdb` == segundo disco duro del sistema
- `/etc` == archivos de **CONFIGuración** del sistema
  - `/etc/fstab` == puntos de montaje al inicio
  - `/etc/hosts` == asocia nombres de dominio a direcciones IP
  - `/etc/passwd` == usuarios del sistema
  - `/etc/group` == grupos y sus miembros
- `/home` == directorios de los usuarios, conguraciones de usuarios y sus archivos
- `/lib`, `lib64`, ... == librerías necesarias para los ejecutables de `/bin`
  - Los módulos del kernel (drivers o sistemas de archivos) se encuentran en `lib/modules/<kernel-version>`
- `/media` == puntos de montaje para dispositivos extraíbles CD, DVD, Flashdrive...
  - En SUSE, RedHat y otras se montan en `/run/media/<usuario>`
- `/mnt` == sistemas de archivos montados temporalmente
  - Se usa normalmente para sistemas de red como: "NFS, Samba, CIFS, AFS"
- `/opt` == software opcional, instalación de programas externos (eg. Google, Skype)
- `/proc` == sistema de archivos virtual, contiene información del sistema y de los PROCesos que están funcionando
  - `/proc/mounts` == info de puntos de montajes
  - `/proc/meminfo` == info de RAM
  - `/proc/partitions` == de particiones
  - `/proc/cpuinfo` == del procesador
  - `/proc/filesystems` == de archivos soportados
  - `/proc/sys` == info y config del sistema
  - `/proc/mdstat` == info del estado de los discos en **RAID**
- `/sys` == sistema de archivos virtual, contiene info del sistema y de los procesos que están funcionando RAM^[(Wrong copypaste of `/proc`?)]
  - A veces se usa para modificar el sistema, es com un árbol de dispositivos
  - Parte del nuevo modelo Unifcado de Disposivos (UDM)
- `/root` == directorio del usuario root, ADMINistrador del sistema
- `/sbin` == comandos esenciales del sistema (eg. fdisk, fsck, getty, halt, init, mksf, mkswap, reboot, route, swapon, swapoff)
- `/srv` == datos específicos usados por el sistema
- `/tmp` == archivos TEMPorales, puede ser un 'ramdisk en memoria'
- `/usr` == aplicaciones, herramientas y datos para el conjunto de los usuarios, suele ser de *solo lectura*
  - Dentro hay un árbol secundario con los archivos que no son necesarios para el inicio del sistema
- `/var` == archivos variables como logs, colas de impresión o email, archivos de caché...
  - "Aquí se suelen alojar los archivos que sirven algunos servidores FHS como las páginas web o los ftps"
  - eg. /var/... (ftp, log, mail, run, spool, tmp, www)
- `/run` == almacena archivos que contienen info del tiempo de ejecución (runtime), escritos al principio del inicio del sistema y que no requieren ser conservados al reiniciar
- Puede haber más directorios como `/ftpboot`, `/misc`, etc.





</details>



### EJER - ParticionesMontajeDiscos

<!-- > ver [particionesMontajeDiscos.md](/ISO/UD2/particionesMontajeDiscos.md) -->

- [ ] (...) (`lsblk`, `fdisk`, `mount`)

> instructions are WRONG!


### LinuxComandos01.dpf


```bash
# 1
pwd

# 2
cd
cd ..

# 3
ls
ls -t   # ordenar por última modificación
ls -S   # ordenar por tamaño de archivo

# 4
cat     # 10x --> pipes '|'

# 5
cp file dir/

# 6
mv

# 7
mkdir
mkdir -pv   # 10x

# 8
rmdir

# 9 to 21 NOT IN TEACHER'S MATERIALS

# 22 (!)
ps
ps -aux 
    # 10x --> add GREP

# 23 (!)
kill

# 24 (!)
ping
ping google.com
ping 8.8.8.8    # ip de un servidor popular de DNS
ping localhost  # 10x

# 25 (!)
wget

# 26 (!)
uname

# 27
top
```


```markdown
# ps    <!--AWFUL TEACHER MATERIALS-->
`ps -a`
Muestra los procesos que se están ejecutando en el momento.
Funciona también en mac.
`ps -aux`
Muestra los procesos que se están ejecutando con mucho más
detalle. Recuerda que puedes filtrar.
aquí usamos pipe grep para filtrar sólo procesos que tengan la
palabra “palabra”.
```

```markdown
# kill
El comando `kill` es una utilidad de línea de comandos de Unix que se utiliza para
finalizar procesos. Se puede utilizar para eliminar procesos en
ejecución, enviar señales a procesos en ejecución o finalizar todos
los procesos asociados con un usuario determinado. Es muy útil
cuando una aplicación se bloquea y no se cierra sola.

`kill -9 12345`
aquí matamos un proceso que se quedo pegado. El número del
proceso se puede obtener con el comando anterior ps. Recuerda
que no puedes matar algunos procesos como el de la base de datos
ya que se pueden corromper los índices y perderías tus datos.
```

```markdown
# wget
wget es una maravillosa herramienta de línea de comandos que se
puede usar para descargar archivos de Internet. Tiene algunas
características realmente ingeniosas, como la descarga recursiva,
la configuración del agente de usuario, etc.

`wget https://www.midominio.com/copiaderespaldo.tar.gz`
aquí descargaremos un archivo tar.gz con nuestra copia y
posteriormente podríamos usar `tar -xzvf copiaderespaldo.tar.gz`
para descomprimirla y desentarrarla.
`wget -b https://www.midominio.com/copiaderespaldo.tar.gz`
wget es una navaja suiza, puedes por ejemplo bajar un archivo en
segundo plano, y posteriormente verificar cualquier registro de la
operación con el comando `tail -f wget-log`
`wget -c https://www.midominio.com/copiaderespaldo.tar.gz`
Si experimenta un corte de energía o pierde su conexión a
Internet, su descarga puede interrumpirse. Esto puede suceder al
descargar archivos grandes como videos, así que para continuar
con la descarga, use la función `-c`.
```




### UD2.pdf

<details>
<summary>Cuestionarios 01, 02 y 03</summary>


### Autoevaluación UD2

#### Cuestionario 01

1. ¿Es necesaria la memoria virtual?
   1. [ ] *Si es obligatorio tenerla,  porque permite ejecutar programas de gran tamaño superando el tamaño de la memoria física de nuestra máquina*
   2. [ ] Sí, por si perdemos la memoria RAM.
   3. [x] **No es obligatorio tenerla,  pero nos permite ejecutar programas de gran tamaño superando el tamaño de la memoria física de nuestra máquina**

2. ¿Qué podemos hacer para mejorar la comunicación entre el SO real y el virtual?
   1. [ ] Configurar la tarjeta de red virtual como Bridge,
   2. [ ] Tener el disco duro de la máquina virtual siempre desfragmentado.
   3. [x] Instalar las VMwaretolos en caso de VMware o Guest Adition en caso Virtualbox.

3. ¿Cuál de estas afirmaciones es correcta?
   1. [ ] Los programas que se ejecutan sobre el host utiliza el software simulado.
   2. [x] Los programas que se ejecutan sobre el host utiliza el hardware real.
   3. [ ] Los programas que se ejecutan sobre el host utiliza el software real

4. Elegir como configuración de red NAT quiere decir:
   1. [ ] Utiliza la misma IP que el host pero cambia la configuración.
   2. [ ] Intenta conseguir una IP Nueva e independiente de la del host por DHCP.
   3. [x] Utilizar la misma IP y configuraciónque el host para acceder al exterior

5. La implementación de la máquina virtual
   1. [ ] Implica formatear el disco duro.
   2. [ ] No precisa que seleccionemos componentes
   3. [x] Se puede hacer desde un cd de instalación.

6. ¿Cuál de estas afirmaciones es cierta?
   1. [ ] La máquina real utiliza este llamado ¨hardware real¨ mientras la máquina virtual no utiliza ningún tipo de hardware.
   2. [x] La máquina real utiliza el llamado ¨hardware real¨ mientras la máquina virtual utiliza el ¨hardware emulado
   3. [ ] La máquina real utiliza el llamado ¨hardware real “ mientras la máquina virtual utiliza un hardware secundario que se encuentra la computadora real conectada ala de sistema principal¨.

7. Si una máquina virtual la dotamos de mucha RAM ¿qué puede pasar?
   1. [ ] No pasa  nada ya que el sistema host nunca se quedará colgado por un sistema  virtual.
   2. [ ] El sistema virtual se quedara colgado ya que tiene demás RAM que el host.
   3. [x] Puede que el sistema host  se quede colgado.

8. ¿Cuál de estas posibilidades no es de las más usuales para que el sistema operativo host se relacione con el sistema operativo Guest?
   1. [ ] Mapeo en el S.O. Guest de unidades físicas como unidades de red,  es decir, por carpetas compartidas.
   2. [x] Utilizando el mismo programa a la vez en S.O. guest y el en S.O. host.
   3. [ ] Copiar y pegar, en este caso se comporte el portapapeles.

9. El tamaño del disco y del archivo de la máquina virtual aumenta a medida que se usa el disco hasta alcanzar un tamaño máximo especificado cuando se creó el disco:
   1. [ ] Disco duro virtual fijo
   2. [ ] Disco duro virtual de diferenciación.
   3. [x] Disco duro virtual de expansión dinámica.


#### Cuestionario 02

1. Máquinas virtuales de software libre:
   1. [x] VirtualBox y VMware Workstation
   2. [ ] VMware Workstation y Parallels desktop.
   3. [ ] Virtualbox y virtual PC

2. ¿Es posible ejecutar una máquina virtual de Windows 10 en una máquina virtual de Linux por ejemplo?
   1. [x] Sí
   2. [ ] No

3. Una máquina virtual:^[WTF?!]
   1. [X] **Es un software que emula un ordenador físico, que puedo tener las mismas características que el hardware físico en el que está instalado ( anfitrión)**
   2. [ ] Es un software que simula un ordenador que tiene las características del  hardware ya definido
   3. [ ] *Es un programa que simula un ordenador, pero con características muy inferiores al anfitrión*

4. Una de las características  de las máquinas  virtuales es que:
   1. [ ] Deben proveer un juego de instrucciones igual que el que posee  la máquina real.
   2. [X] **Al reiniciarse son más rápidas que los de las máquinas reales**
   3. [ ] *No permiten que coexistan varios sistemas operativos en la misma máquina.*

5. El término hipervisor  es equivalente a:
   1. [ ] VirtualBox
   2. [x] Monitor de Máquina Virtual.
   3. [ ] Anfitrión


#### Cuestionario 03

1. Cuando las máquinas virtuales también pueden actuar como emuladores de hardware, permitiendo que aplicaciones y sistemas operativos concebidos para otras arquitecturas de procesador se puedan ejecutar sobre un hardware que en teoría no soportan se conoce como:
   1. [x] Virtualización de emulación de hardware o no nativa
   2. [ ] Virtualización completa del hardware o nativa
   3. [ ] Virtualización a nivel de sistema operativo

2. La virtualización se hace mediante ... 
   1. [ ] Periféricos
   2. [x] Software
   3. [ ] Dispositivos

4. Una distribución de máquinas virtuales de tipo propietario es:^[(...)]
   1. [ ] *Virtual PC*
   2. [ ] KVM
   3. [x] **VMware Workstation**

5. En relación a las maquinas virtuales di cual de estas afirmaciones es correcta:
   1. [ ] No influye en la utilización de la memoria principal
   2. [x] Permite hacer pruebas de aplicaciones informáticas de una manera segura
   3. [ ] No permite la ejecución de entornos completos sin instalación y configuración

6. La virtualización que permite que aplicaciones y sistemas operativos concebidos para otras arquitecturas de procesador se puedan ejecutar sobre un hardware que en teoría no soportan, se conoce como:
   1. [x] Virtualización de emulación de hardware o no nativa
   2. [ ] Virtualización completa del hardware o nativa
   3. [ ] Virtualización a nivel de Sistema Operativo.

7. El tipo de comunicación  que crea una red dentro del equipo host con lo cual todos los sistemas operativos de las máquinas virtuales ubicadas en el anfitrión se pueden comunicar entre ellos, pero no con máquinas que están fuera del anfitrión, es decir, con ordenadores de la red física se denomina: 
   1. [ ] Comunicación puente (bridge)
   2. [x] Comunicación host-only
   3. [ ] Comunicación NAT

8. Comunicación en la que se asigna una IP al sistema operativo de la máquina virtual dentro del mismo rango de IP del ordenador anfitrión.^[(...)]
   1. [ ] Host-only
   2. [ ] *NAT*
   3. [x] **Bridge**

</details>