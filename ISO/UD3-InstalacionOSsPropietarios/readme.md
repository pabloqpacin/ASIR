# ISO — UD3: Instalación OSs Propietarios

## Campus Virtual

- Teoría
  - ud3-teoria
  - ud3-presentacion
- Material Complementario <!--Windows Server-->
  - **ud3-WindowsRegistry**
- Prácticas
  - ud3-LinuxComandos02
  - ud3-WServer_01
- Cuestionario
- Cuestionario UDS1,2,3


> [apuntes-ud3](/ISO/UD3-InstalacionOSsPropietarios/apuntes-ud3.md)
>
> [practicas-ud3](/ISO/UD3-InstalacionOSsPropietarios/practicas-ud3.md)


### Cuestionario

| index | cuestionario |
| ---   | --- |
| Q1    | ¿Qué tipo de arquitectura soporta Windows 10?
| A1    | — Arquitectura de 32 y 64 bits.
| Q2    | ¿Qué cantidad de memoria RAM es recomendada para instalar Windows 10?
| A2    | — 2 GB.
| Q3    | ¿ Es necesario asignar memoria RAM a la hora de crear una maquina virtual en VirtualBox?
| A3    | — Sí
| Q4    | El formato del disco duro creado para la instalación de una maquina virtual  recomendado por VirtualBox es:
| A4    | — VDI
| Q5    | Cuando configuramos una maquina virtual en VirtualBox, ¿podemos elegir el tamaño del disco duro?
| A5    | — Sí
| Q6    | En función de la licencia con la que hayamos adquirido el sistema operativo, ¿podemos encontrar diferentes versiones a la hora de elegir el sistema operativo para instalar?
| A6    | — Sí
| Q7    | ¿ Qué significa Versión GUI?
| A7    | — Interfaz gráfica de usuario.
| Q8    | Los archivos, configuración y aplicaciones se migran a Windows con la opción:
| A8    | — ~~Avanzada~~ Actualización ~~Personalizada~~
| Q9    | ¿Cuándo instalamos un sistema operativo Windows es necesario particionar y formatear el disco duro?
| A9    | — Sí
| Q10   | ¿ Qué tipo de usuario se crea automáticamente cuando instalamos Windows Server ?
| A10   | — Administrador

### Cuestionario UDS1,2,3


| index | cuestionario |
| ---   | --- |
| Q1    | Se dan dos procesos, P1 con tiempo de ejecución de 20 y P2 con tiempo de ejecución de 15. Realiza la gráfica para el algoritmo de rueda (también llamado Round Robin RR) con quantum 10.
| A1    | — P1, P2, P1, P2 terminando en el momento 35 // En clase no se ha visto cómo realizar tal gráfica. El enunciado tiene al menos 4 errores ortográficos, un poquito de por favor.
| Q2 !  | La diferencia entre memoria virtual y Swapping:
| A2    | — La memoria virtual se compagina con la paginación o la segmentación y no aloja todo el proceso en la memoria secundaria *mientras que en el swapping* el gestor de memoria sacará de memoria algunos procesos y los llevara a un área de disco secuandario. ~~El swapping se compagina con la paginación o la segmentación y no aloja todo el proceso en la memoria secundaria *mientras que en la memoria vrtual* el gestor de memoria sacará de memoria algunos procesos y los llevara a un área de disco secundario. + En la técnica de memoria virtual siempre se asigna una zona de memoria virtual en el disco duro que siempre estará disponible para el intercambio de programas con la memoria principal.~~
| Q3    | Selecciona la opción correcta:
| A3    | — Un demonio es un proceso que se ejecuta en segundo plano sin necesidad alguna de interacción con el usuario para llevar a cabo su tarea.
| Q4    | En una máquina virtual Virtual Box o VMWare el archivo de disco duro virtual aumenta a medida que se usa el disco duro hasta llegar a su máximo especificado. Esto es:
| A4    | — Disco duro virtual reservado dinámicamente.
| Q5    | ¿Qué tipo de sistema Operativo se necesita para hacer funcionar una máquina virtual?
| A5    | — Cualquier sistema el cual tenga soporte para el software que hace funcionar la máquina
| Q6    | Selecciona las verdaderas, puede haber varias, sobre las instantáneas:
| A6    | — Exportar Vbox VM = .ova + Instantánea = nuevo disco + Se utilizan para conseguir congelar el estado actual de una máquina virtual creando un punto de restauración de la maquina en un momento dado.
| Q7    | Indica la falsa sobre las actualizaciones de los sistemas operativos:
| A7    | — En un equipo Microsoft no podremos administrar las actualizaciones manualmente siendo siempre Windows el encargado de actualizarnos el equipo automáticamente.
| Q8    | Indícame el proceso de arranque de un ordenador desde que se le da al botón de encendido.
| A8    | — (Asumiendo que el sistema es Windows) Llega corriente eléctrica a la placa base, el procesador inicia sus registros, se activa la ROMBIOS y se envía señal POST, que llega al MBR alojado en los primeros 512 bytes del primer disco duro, con lo que empieza el arranque del Sistema Operativo alojado en tal disco duro.
| Q9    | Indica la correcta:
| A9    | — El MBR es el primer sector del disco duro que contiene la tabla de particiones y de un programa llamado Master Boot
| Q10   | Selecciona la verdadera sobre La clave del registro HKEY_LOCAL_MACHINE (**HKLM**):
| A10   | — Contiene la configuración general del equipo, así como información de los programas y dispositivos conectados a la computadora.
| Q11   | Selecciona la verdadera sobre La clave del registro HKEY_CLASSES_ROOT (**HKCR**):
| A11   | — ~~Esta clave contiene la configuración actual del sistema.~~ En esta clave se encuentra los archivos registrados, sus extensiones y los programas asociados 
| Q12   | En la instalación de Windows server encontraremos diferentes versiones:
| A12   | — ~~Versión Core y Versión Gui siendo la versión Gui la versión sin interfaz gráfica.~~ ~~Versión Core, Versión Gui y versión desatendida~~ ~~Versión Core y Versión desatendida siendo la versión desatendida una creada por nosotros mismos.~~ Ninguna de las anteriores
| Q13   | Un proceso puede variar su estado por ejemplo de bloqueado a preparada infinitas veces independientemente del algoritmo de ejecución.
| A13   | — VERDADERO
| Q14   | Se tienen 2 procesos P1 y P2 con tiempo de ejecución de 28 y 35. Si actúa el algoritmo RR (q = 10) determinar el orden en que se encuentra en la lista de preparados
| A14   | — p1,p2,p1,p2,p1,p2,p2 terminando en el momento 63.
| Q15   | Elegir como configuración de red NAT en maquinas virtuales quiere decir:
| A15   | — Utilizar la misma IP y configuración que el host para acceder al exterior.

