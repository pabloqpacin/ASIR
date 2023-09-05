# ISO — UD2: Máquinas Virtuales


## Campus Virtual

- Teoría
  - ud2-teoriaVMs
  - ud2-VBoxConfig
  - ud2-LinuxFilesystem
  - ud2-comandosLinux01
- Material Complementario <!--VBox-->
- Prácticas
  - [ ] ejer-mountDiskUbuntu
- Cuestionarios
  - C1
  - C2
  - C3

> [apuntes-ud2](/ISO/UD2-MaquinasVirtuales/apuntes-ud2.md)


### Cuestionarios 

### C1

| index | cuestionario |
| ---   | --- |
| Q1    | ¿Es necesaria la memoria virtual?
| A1 ?  | — No es obligatorio tenerla,  pero nos permite ejecutar programas de gran tamaño superando el tamaño de la memoria física de nuestra máquina
| Q2    | ¿Qué podemos hacer para mejorar la comunicación entre el S.O.  real y el virtual?
| A2    | — Instalar las VMwaretolos en caso de VMware o Guest Adition en caso Virtualbox.
| Q3    | ¿Cuál de estas afirmaciones es correcta?
| A3    | — Los programas que se ejecutan sobre el host utiliza el hardware real.
| Q4    | Elegir como *configuración de red NAT* quiere decir:
| A4    | — Utilizar la misma IP y configuraciónque el host para acceder al exterior.
| Q5    | La implementación de la máquina virtual:
| A5    | — Se puede hacer desde un *cd* de instalación.
| Q6    | ¿Cuál de estas afirmaciones es cierta?
| A6    | — La máquina real utiliza el llamado ¨hardware real¨ mientras la máquina virtual utiliza el ¨hardware emulado¨
| Q7    | Si una máquina virtual la dotamos de mucha RAM ¿qué puede pasar?
| A7    | — Puede que el sistema host se quede colgado. 
| Q8    | Llamamos ¨host¨:
| A8    | — Al anfitrión de las máquinas virtuales.
| Q9    | ¿Cuál de estas posibilidades no es de las más usuales para que el sistema operativo host se relacione con el sistema operativo Guest?
| A9 ?  | — Utilizando el mismo programa a la vez en S.O. guest y el en S.O. host.
| Q10   | El tamaño del disco y del archivo de la máquina virtual aumenta a medida que se usa el disco hasta alcanzar un tamaño máximo especificado cuando se creó el disco:
| A10   | — Disco duro virtual de expansión dinámica.


### C2

| index | cuestionario |
| ---   | --- |
| Q1    | ¿Qué definición es correcta?
| A1 ?  | — La máquina real es el host (anfitrión) de las máquinas virtuales.
| Q2    | Los programas que se ejecutan sobre el host:
| A2    | — Utilizan el hardware real.
| Q3    | Los programas que se ejecutan sobre el …………… utilizan el hardware emulado y por tanto suelen ofrecer un menor rendimiento.
| A3    | — Guest
| Q4    | Máquinas virtuales de software libre:
| A4 !  | — VirtualBox y *VMware Workstation* <!--for real?-->
| Q5    | ¿Es posible ejecutar una máquina virtual de Windows 10 en una máquina virtual de Linux por ejemplo?
| A5    | — Sí
| Q6    | Una máquina virtual:
| A6 ?  | — Es un software que emula un ordenador físico, que puedo tener las mismas características que el hardware físico en el que está instalado (anfitrión)
| Q7    | El apartado de configuración donde podemos cambiar la memoria RAM y el número de núcleos de una máquina virtual en virtualBox es:
| A7    | — Sistema
| Q8    | Una de las características  de las máquinas  virtuales es que:
| A8 ?? | — Al reiniciarse son más rápidas que los de las máquinas reales
| Q9    | Si no sabemos el tamaño del disco duro que vamos a usar es recomendable:
| A9    | — Crear discos duros de expansión dinámica.
| Q10   | El término hipervisor  es equivalente a:
| A10   | — Monitor de Máquina Virtual.



### C3

| index | cuestionario |
| ---   | --- |
| Q1    | El sistema operativo que instalamos para su virtualización  en la máquina virtual se conoce como:
| A1    | — Sistema operativo huésped o invitado
| Q2    | ¿Cuál es el formato genuino de los disco duros virtualizados en VirtualBox?
| A2    | — ~~VHD~~ *VDI*
| Q3    | Cuando las máquinas virtuales también pueden actuar como emuladores de hardware, permitiendo que aplicaciones y sistemas operativos concebidos para otras arquitecturas de procesador se puedan ejecutar sobre un hardware que en teoría no soportan se conoce como:
| A3    | — Virtualización de emulación de hardware o no nativa
| Q4    | La máquina que simula una máquina real se llama.
| A4    | — Virtual
| Q5    | La virtualización se hace mediante ... 
| A5    | — Software
| Q6    | Una distribución de máquinas virtuales de tipo propietario es:
| A6 ?  | — ~~Virtual PC~~ VMware Workstation <!--contradice C2 wtf-->
| Q7    | En relación a las maquinas virtuales di cual de estas afirmaciones es correcta:
| A7    | — Permite hacer pruebas de aplicaciones informáticas de una manera segura
| Q8    | La virtualización que permite que aplicaciones y sistemas operativos concebidos para otras arquitecturas de procesador se puedan ejecutar sobre un hardware que en teoría no soportan, se conoce como:
| A8 !  | — Virtualización de emulación de hardware o no nativa
| Q9    | El tipo de comunicación  que crea una red dentro del equipo host con lo cual todos los sistemas operativos de las máquinas virtuales ubicadas en el anfitrión se pueden comunicar entre ellos, pero no con máquinas que están fuera del anfitrión, es decir, con ordenadores de la red física se denomina: 
| A9    | — **Comunicación host-only**
| Q10   | Comunicación en la que se asigna una IP al sistema operativo de la máquina virtual dentro del mismo rango de IP del ordenador anfitrión.
| A10   | — **Comunicación puente (bridge)**