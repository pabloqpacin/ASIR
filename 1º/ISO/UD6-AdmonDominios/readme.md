# ISO — UD6: Administración de dominios


## Campus Virtual

- Teoría
  - ud6-teoria
  - ud6-presentacion
- Material Complementario <!--WinServer, AD...-->
- Cuestionario

> [apuntes-ud6](/ISO/UD6/apuntes-ud6.md)


### Cuestionario

| index | cuestionario |
| ---   | --- |
| Q1    | ¿Es necesario tener en servidor DNS configurado y activado para poder promover un equipo a controlador de dominio? 
| A1    | — Sí, pero se instalará normalmente **durante** la promoción. <br> ~~Sí, pero se instalará necesariamente antes de la promoción.~~ <br> ~~Sí, pero se instalará necesariamente después de la promoción.~~
| Q2    | ¿Qué nombré de los siguientes es correcto para un dominio/subdominio Windows Server? 
| A2    | — Subdominio **.** dominioprincipal.com <br> ~~Subdominio */* dominioprincipal.com~~ &emsp;~~Dominioprincipal.subdominio.com~~
| Q3    | ¿Se puede *cambiar el nombre del equipo* una vez promovido a controlador de dominio? 
| A3 !  | — **No** <br>  ~~Sí, siempre y cuando el equipo que promovemos forme parte de un dominio existente.~~ <br> ~~Sí, solamente en versiones de Windows Server 2000.~~
| Q4    | ¿Es necesario que el usuario Administrador tenga *contraseña* para poder promover el equipo a controlador de dominio? 
| A4    | — **No** &emsp; ~~Sí~~ &emsp;~~Sí, pero después de promover el equipo se puede eliminar.~~
| Q5    | ¿ Qué grupo de los siguientes no corresponde según el ámbito?
| A5    | — Distribución &emsp; ~~Global~~ &emsp; ~~Universal~~
| Q6    | ¿ De que tipo puede ser los grupos de usuarios en Windows Server ?
| A6 ?  | — Grupos de distribución y grupos de seguridad. <br> ~~*Grupos locales de dominio, globales de dominio y universales.*~~ <br> ~~Grupos locales y de dominio.~~ 
| Q7    | ¿ Qué es el **FQDN** de un equipo?
| A7 !! | — Indica el nombre del equipo y el nombre DNS del dominio asociado. <br> ~~Referencia el nombre DNS del dominio.~~ &emsp; ~~El nombre que recibe el servidor de directorio una vez instalado.~~
| Q8    | Para que un dominio funcione es imprescindible que contenga:
| A8 ?  | — Un controladorde dominio. <br> ~~Un servidor DHCP.~~ &emsp; ~~Un controlador de dominio de respaldo.~~
| Q9    | En un red, los equipos … son los que se conectan a otros equipos llamados …
| A9    | — Clientes/servidores.
| Q10   | Cuando instalamos el primer dominio en un ordenador de nuestra red, estamos creando:
| A10   | — Las dos son correctas. <br> ~~La raíz de un nuevo árbol.~~ &emsp; ~~La raíz de un nuevo bosque.~~


