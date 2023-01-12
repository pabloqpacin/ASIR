# Markup UD1-XML + UD2-DTD


- Contenidos **UD1-XML + UD2-DTD**
  - [Ejercicios](#ejercicios)
    - [Tasks](#tasks)
    - [Corrección Errores](#corrección-errores)
    - [Ejercicios DTD (UD2)](#ejercicios-dtd-ud2)
  - [Docs-Apuntes](#docs-apuntes)
  - [Campus Virtual](#campus-virtual)
    - [material complementario](#material-complementario)
    - [cuestionarios](#cuestionarios)



## Ejercicios

| SELECCIÓN | [T05](#t05-) | [T07](#t07-) | [T09](#t09-) | [T10](#t10-) | [T12](#t12-) | [T14](#t14-) | [C08](#C08-) |
| --- | --- | --- | --- | --- | --- | --- | --- |

- UD1 - XML
    <!-- - Clase \<numero> :: actividades -->
    - C3 :: Ejer.#1-4 ;; T01-04
    - C4 :: T05 + CoEr.#1-4 ;; C01-04
    - C5 :: T05-9
    - C6 :: T10-12 + T05-7
    - C7 :: T13-14 + T08-11 + LITERALES

- UD2 - DTD
  - C8  :: T01-03, T06, T08-09
  - C9  :: T04-05, T13, C08, D01 (!)
  - C10 :: D02-06
  - C11 :: 


### Tasks

<!--
standalone="yes"
CUÁNDO ?????
-->


#### T01

| UD1 | UD2 |
| --- | --- |

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Pedido para el señor Juan Delgado Martínez.
El pedido se compone de una bicicleta A2023,
a entregar en la calle Barco 4, tercer piso, letra A,
el día 19-5-2000. -->

<!DOCTYPE pedido [
    <!ELEMENT pedido (destinatario, articulo, direccion, fechaEntrega)>
    <!ELEMENT articulo (#PCDATA)>
    <!ELEMENT articulo (#PCDATA)>
    <!ELEMENT direccion (#PCDATA)>
    <!ELEMENT fechaEntrega (#PCDATA)>
]>

<pedido>
    <destinatario>JDM</destinatario>
    <articulo>A2023</articulo>
    <direccion>Calle tal cual</direccion>
    <fechaEntrega>2000</fechaEntrega>
</pedido>
```

#### T02

| UD1 | UD2 |
| --- | --- |

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Personas que constituyen un colegio,
tenemos un alumno con
- un nombre y que 
- cursa dos tipos de asignaturas,
un profesor y un director. -->

<!DOCTYPE persona [
    <!ELEMENT persona (director, profesor, alumno)>
    <!ELEMENT director (#PCDATA)>
    <!ELEMENT profesor (#PCDATA)>
    <!ELEMENT alumno (nombre, asignatura+)>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT asignatura (programacion, ofimatica)>
    <!ELEMENT programacion (#PCDATA)>
    <!ELEMENT ofimatica (#PCDATA)>
]>

<persona>
    <director>tal</director>
    <profesor>cual</profesor>
    <alumno>
        <nombre>dawg</nombre>
        <asignatura>
            <programacion>LM</programacion>
            <ofimatica>Excel10x</ofimatica>
        </asignatura>
    </alumno>
</persona>
```
<!--
```xml
MAL:
    <nombre>dawg</nombre>
    <asignatura01>program.</asignatura01>
    <asignatura02>ofim.</asignatura02>

BIEN:
    <nombre>dawg</nombre>
    <asignatura>
        <programacion>LM</programacion>
        <ofimatica>Excel10x</ofimatica>
    </asignatura>
```
-->

#### T03

| UD1 | UD2 |
| --- | --- |

<!-- ATRIBUTO... opcional ;) -->

![img/T03](/Markup/img/T03.png)

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE equipos [
    <!ELEMENT equipos (equipo)+>
    <!ELEMENT equipo (futbolista, entrenador, presidente)>
    <!ATTLIST equipo nombre ID #OPTIONAL>
    <!ELEMENT futbolista (#PCDATA)>
    <!ELEMENT entrenador (#PCDATA)>
    <!ELEMENT presidente (#PCDATA)>
]>

<equipos>
    
    <equipo nombre="">
        <futbolista>Leo Messi</futbolista>
        <entrenador>Valverde</entrenador>
        <presidente>Bartomeu</presidente>
    </equipo>

    <equipo nombre="clubTal">
        <futbolista>Ronaldo</futbolista>
        <entrenador>Sarri</entrenador>
        <presidente>Agnelli</presidente>
    </equipo>

</equipos>
```


#### T04

| UD1 | UD2 |
| --- | --- |

<!-- DTD below takes 'nombre' as both 'element' and
'attribute' to showcase such SYNTAX.
Tbf it should be EITHER element OR attribute,
and REQUIRED indeed! -->


![img/T04](/Markup/img/T04.png)

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- fairly custom 'nombre' layout-->

<!DOCTYPE cientificosImportantes [
    <!ELEMENT cientificosImportantes (cientifico)*> <!-- somewhat better -->
    <!-- <!ELEMENT cientificosImportantes (cientifico)+> -->
    <!ELEMENT cientifico (nombre?, fechaNacimiento)>
    <!ATTLIST cientifico nombre CDATA #OPTIONAL>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT fechaNacimiento (dia, mes, anyo)>
    <!ELEMENT dia (#PCDATA)>
    <!ELEMENT mes (#PCDATA)>
    <!ELEMENT anyo (#PCDATA)>
]>

<cientificosImportantes>
    
    <cientifico>
        <nombre>Einstein</nombre>
        <fechaNacimiento>
            <dia>14</dia>
            <mes>03</mes>
            <anyo>1879</anyo>
        </fechaNacimiento>
    </cientifico>

    <!--Está bien con/sin atributos en tanto que no hay DTD-->
    <cientifico nombre="Newton">
        <fechaNacimiento>
            <dia>04</dia>
            <mes>01</mes>
            <anyo>1643</anyo>
        </fechaNacimiento>
    </cientifico>

</cientificosImportantes>
```

#### T05 (DTD aside)

| UD1 | UD2 |
| --- | --- |

<!-- OJO
- DTD aside
- element EMPTY
-->


```xml
<!--En este caso el DTD es un archivo aparte -->
<!ELEMENT equiposBasket (equipo)+>
<!ELEMENT equipo (nombre, ciudad, entrenador, jugador+)>
<!ELEMENT jugador (nombre, nacionalidad)>
<!ATTLIST jugador posicion CDATA #REQUIRED>
<!ELEMENT nombre (#PCDATA)>
<!ELEMENT nacionalidad (#PCDATA)>
<!ELEMENT entrenador EMPTY>
<!ELEMENT ciudad (#PCDATA)>
```


```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Dos equipos  de  baloncesto  (nombre, ciudad y entrenador)
con  dos jugadores (nombre,  posición  y  nacionalidad)  cada  uno.

La posición  (base, alero,  escolta, ala-pivot, pivot)
deberá representarse mediante un atributo del jugador.

Utilizar datos reales para los equipos y jugadores.
No obstante, no deberá indicarse el nombre del entrenador. -->

<!DOCTYPE equiposBasket SYSTEM "DTD/T05.dtd">

<equiposBasket>

    <equipo>
        <nombre>ALFA</nombre>
        <ciudad>Budapest</ciudad>
        <entrenador/>
        <jugador posicion="pivot">
            <nombre>Fulanito</nombre>
            <nacionalidad>España</nacionalidad>
        </jugador>
        <jugador posicion="base">
            <nombre>Manos</nombre>
            <nacionalidad>Grecia</nacionalidad>
        </jugador>
    </equipo>

    <equipo>
        <nombre>OMEGA</nombre>
        <ciudad>Estambul</ciudad>
        <entrenador/>
        <jugador posicion="escolta">
            <nombre>Menganito</nombre>
            <nacionalidad>España</nacionalidad>
        </jugador>
        <jugador posicion="ala-pivot">
            <nombre>Silvio</nombre>
            <nacionalidad>Italia</nacionalidad>
        </jugador>
    </equipo>

</equiposBasket>
```


#### T06 <!-- SHUCKS!!! -->

| UD1 | ~~UD2~~ |
| --- | --- |

![img/T06](/Markup/img/T06.png)

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!--AWFUL exercise,
I refuse to burn me brain-->

<!DOCTYPE animales [
    <!ELEMENT animales ... >
]>


<animales>

    <cuadrupedos>
        <herbivoros>
            <comida>Plantas</comida>
            <ejemplo>Vaca</ejemplo>
        </herbivoros>
        <omnivoros>
            <comida>Carne y plantas</comida>
            <ejemplo>Zorro</ejemplo>
        </omnivoros>
        <carnivoros>
            <comida>Carne</comida>
            <ejemplo>Leon</ejemplo>
        </carnivoros>
    </cuadrupedos>

    <reptiles>
        <serpiente>Roky</serpiente> <!--No debería ser ejemplo-serpiente??-->
    </reptiles>

    <bipedos>
        <herbivoros>
            <frugivoros/>
            <folivoros/>
        </herbivoros>
        <carnivoros>
            <dosPatas/>
            <comida>Carne</comida>
            <ejemplos>
                <ejemplo>Gaviota</ejemplo>
                <ejemplo>Buitre</ejemplo>
            </ejemplos>
        </carnivoros>
    </bipedos>

</animales>
```


#### T07

| UD1 | UD2 |
| --- | --- |

![img/T07](/Markup/img/T07.png)

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE ciudades [
    <!ELEMENT ciudades (ciudad)*>
    <!ELEMENT ciudad (nombre, pais)>
    <!ATTLIST ciudad continente CDATA #REQUIRED>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT pais (#PCDATA)>
]>

<ciudades>

    <ciudad continente="Asia">
        <nombre>Nueva Delhi</nombre>
        <pais>India</pais>
    </ciudad>

    <ciudad continente="Africa">
        <nombre>El Cairo</nombre>
        <pais>Egipto</pais>
    </ciudad>

</ciudades>
```

#### T08

| UD1 | UD2 |
| --- | --- |

<!-- OJO
- (foo)*
- change '#PCDATA'?
-->


```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- 
2 clientes. Cada cliente almacena
- un nombre
- apellidos (por apellido1 y apellido2)
- y un nif. 
El segundo cliente tiene el campo apellido2 vacío.
-->

<!DOCTYPE clientes [
    <!ELEMENT clientes (cliente)*>
    <!ELEMENT cliente (nif, nombre, apellidos)>
    <!ELEMENT nif (#PCDATA)>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT apellidos (ape1, ape2)>
    <!ELEMENT ape1 (#PCDATA)>
    <!ELEMENT ape2 (#PCDATA)>
]>

<clientes>

    <cliente>
        <nif>01</nif>
        <nombre>Fulano</nombre>
        <apellidos>
            <ape1>Tal</ape1>
            <ape2>Cual</ape2>
        </apellidos>
    </cliente>

    <cliente>
        <nif>10</nif>
        <nombre>Mengano</nombre>
        <apellidos>
            <ape1>Original</ape1>
            <ape2/>
        </apellidos>
    </cliente>

</clientes>
```

#### T09 (!)

| UD1 | UD2 |
| --- | --- |

<!-- version CAMPUS VIRTUAL
tiene EMPTY como para asunto tusae-->

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- 
Crea un documento XML bien formado que almacene
la bandeja de entrada de un programa de correo electrónico
en el que cada correo posea la siguiente información: 
- remitente (con nombre e email),
- destinatario (con nombre e email),
- asunto y
- cuerpo (por párrafos).

Todos los campos son obligatorios.
Debes añadir 3 correos,
- el primer correo contiene  2  párrafos,
- el  segundo  correo  3  párrafos
- y el  tercer  correo  tiene  un  párrafo vacío. -->

<!DOCTYPE bandejaEntrada [
    <!ELEMENT bandejaEntrada (correo)*>
    <!ELEMENT correo (remitente, destinatario, asunto, cuerpo)>
    <!ELEMENT remitente (nombre, email)>
    <!ELEMENT destinatario (nombre, email)>
    <!ELEMENT asunto (#PCDATA)>
    <!ELEMENT cuerpo (parrafo?)+>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT email (#PCDATA)>
    <!ELEMENT parrafo (#PCDATA)>
]>

<bandejaEntrada>

    <correo>
        <remitente>
            <nombre>Alfa</nombre>
            <email>alfa@itep.com</email>
        </remitente>
        <destinatario>
            <nombre>Bravo</nombre>
            <email>bravo@itep.com</email>
        </destinatario>
        <asunto>first email</asunto>
        <cuerpo>
            <parrafo>Mucha info</parrafo>
            <parrafo>Muchisima info</parrafo>
        </cuerpo>
    </correo>

    <correo>
        <remitente>
            <nombre>Charlie</nombre>
            <email>charlie@itep.com</email>
        </remitente>
        <destinatario>
            <nombre>Delta</nombre>
            <email>delta@itep.com</email>
        </destinatario>
        <asunto>second email</asunto>
        <cuerpo>
            <parrafo>Tremendo correo</parrafo>
            <parrafo>Mazo weno</parrafo>
            <parrafo>Ta luego</parrafo>
        </cuerpo>
    </correo>
    
    <correo>
        <remitente>
            <nombre>Echo</nombre>
            <email>echo@itep.com</email>
        </remitente>
        <destinatario>
            <nombre>Foxtrot</nombre>
            <email>foxtrot@itep.com</email>
        </destinatario>
        <asunto>guess what</asunto>
        <cuerpo>
            <parrafo/>
        </cuerpo>
    </correo>
    
</bandejaEntrada>
```


#### T10 (C6)

| UD1 | UD2 |
| --- | --- |

```xml
<!--
Evento 1: 
- Señal de accidente 
- Punto kilométrico 545 
- Nombre de la vía: A-6 
- Sentido: Lugo 
- Corte de la vía: 1 carril 
- Fecha y hora del evento 
- Retención: Sí 
- Kilómetros de retención: 1.5 
Evento 2: 
- Señal de retención 
- Punto kilométrico: 3,5 
- Nombre de la vía: AC-10 
- Sentido: Coruña 
- Fecha y hora del evento 
- Retención: Sí 
- Kilómetros de retención: 1
-->

<!DOCTYPE eventos [
    <!ELEMENT eventos (evento)*>
    <!ELEMENT evento (
        tipoSenyal, puntoKM, nombreVia, sentido,
        corteVia?, fechaHora?, retencion, kmRetencion)>
    <!ELEMENT tipoSenyal (#PCDATA)>
    <!ELEMENT puntoKM (#PCDATA)>
    <!ELEMENT nombreVia (#PCDATA)>
    <!ELEMENT sentido (#PCDATA)>
    <!ELEMENT corteVia (#PCDATA)>
    <!ELEMENT fechaHora (#PCDATA)>
    <!ELEMENT retencion (#PCDATA)>
    <!ELEMENT kmRetencion (#PCDATA)>
]>

<eventos>

    <evento>
        <tipoSenyal>Accidente</tipoSenyal>
        <puntoKM>545</puntoKM>
        <nombreVia>A-6</nombreVia>
        <sentido>Lugo</sentido>
        <corteVia>1 carril</corteVia>
        <fechaHora/>
        <retencion>SI</retencion>
        <kmRetencion>1.5</kmRetencion>
    </evento>

    <evento>
        <tipoSenyal>Retencion</tipoSenyal>
        <puntoKM>3,5</puntoKM>
        <nombreVia>AC-10</nombreVia>
        <sentido>Coruña</sentido>
        <corteVia/>
        <fechaHora/>
        <retencion>SI</retencion>
        <kmRetencion>1</kmRetencion>
    </evento>

</eventos>
```

#### T11

| UD1 | UD2 |
| --- | --- |

![img/T11](/Markup/img/T11.png)

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE empresa [
    <!ELEMENT empresa (empleado)*>
    <!ELEMENT empleado (nombre, apellido, email, direccion)>
    <!ELEMENT direccion (ciudad, provincia, codigoPostal)>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT apellido (#PCDATA)>
    <!ELEMENT email (#PCDATA)>
    <!ELEMENT ciudad (#PCDATA)>
    <!ELEMENT provincia (#PCDATA)>
    <!ELEMENT codigoPostal (#PCDATA)>
]>

<empresa>

    <empleado>
        <nombre>Fulano</nombre>
        <apellido>Sinapellido</apellido>
        <email>fulano@sinapellido.com</email>
        <direccion>
            <ciudad>Asaber</ciudad>
            <provincia>Ninguna</provincia>
            <codigoPostal>13200</codigoPostal>
        </direccion>
    </empleado>

</empresa>
```

#### T12 (!!)

| UD1 | UD2 |
| --- | --- |

![img/T12](/Markup/img/T12.png)

```xml
<!-- 
TEMPLATE:

    <asignatura>
        <nombre></nombre>
        <diasSemana>
            <dia>
                <nombre></nombre>
                <horario>
                    <inicio>
                        <horas></horas>
                        <minutos></minutos>
                    </inicio>
                    <fin>
                        <horas></horas>
                        <minutos></minutos>
                    </fin>
                </horario>
            </dia>
        </diasSemana>
    </asignatura>
-->

<!DOCTYPE asignaturas [
    <!ELEMENT asignaturas (asignatura)+>
    <!ELEMENT asignatura (nombre, diasSemana)>
    <!ELEMENT diasSemana (dia)+>
    
    <!ELEMENT dia (nombre, horario)>
    <!ELEMENT horario (inicio, fin)>
    <!ELEMENT inicio (horas, minutos)>
    <!ELEMENT fin (horas, minutos)>

    <!ELEMENT horas (#PCDATA)>
    <!ELEMENT minutos (#PCDATA)>
    <!ELEMENT nombre (#PCDATA)>
    ]>


<asignaturas>

    <!-- entornos -->
    <asignatura>
        <nombre>Entornos</nombre>
        <diasSemana>
            <dia>
                <nombre>Lunes</nombre>
                <horario>
                    <inicio>
                        <horas>08</horas>
                        <minutos>30</minutos>
                    </inicio>
                    <fin>
                        <horas>11</horas>
                        <minutos>00</minutos>
                    </fin>
                </horario>
            </dia>
            <dia>
                <nombre>Martes</nombre>
                <horario>
                    <inicio>
                        <horas>10</horas>
                        <minutos>10</minutos>
                    </inicio>
                    <fin>
                        <horas>11</horas>
                        <minutos>00</minutos>
                    </fin>
                </horario>
            </dia>

        </diasSemana>
    </asignatura>

    <!-- ISO -->
    <asignatura>
        <nombre>Sistemas</nombre>
        <diasSemana>
            <dia>
                <nombre>Lunes</nombre>
                <horario>
                    <inicio>
                        <horas>13</horas>
                        <minutos>00</minutos>
                    </inicio>
                    <fin>
                        <horas>14</horas>
                        <minutos>40</minutos>
                    </fin>
                </horario>
            </dia>
            <dia> <!-- (...) --> </dia>
            <dia> <!-- (...) --> </dia>
        </diasSemana>
    </asignatura>

</asignaturas>
```

#### T13 (!)

| UD1 | UD2 |
| --- | --- |

![T13](/Markup/img/T13.png)

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE canciones [
    <!ELEMENT canciones (cancion)*>
    <!ELEMENT cancion (titulo, artista, compositores, productores, sello)>
    <!ATTLIST cancion
        duracion CDATA #REQUIRED
        anyo CDATA #REQUIRED
    >
    <!ELEMENT titulo (#PCDATA)>
    <!ELEMENT artista (#PCDATA)>
    <!ELEMENT compositores (compositor)+>
    <!ELEMENT compositor (nombre, apellidos)>
    <!ELEMENT productores (productor)+>
    <!ELEMENT productor (nombre, apellidos)>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT apellidos (#PCDATA)>
    <!ELEMENT sello (#PCDATA)>
]>

<canciones>

    <cancion duracion="4:47" anyo="2008">
        <titulo>Give it 2 me</titulo>
        <artista>Madonna</artista>
        <compositores>
            <compositor>
                <nombre>Pharrell</nombre>
                <apellidos>Williams</apellidos>
            </compositor>
        </compositores>
        <productores>
            <productor>
                <nombre>Pharrell</nombre>
                <apellidos>Williams</apellidos>
            </productor>
        </productores>
        <sello>Warner Bros. Records</sello>
    </cancion>

</canciones>
```

#### T14

![img/T14](/Markup/img/T14.png)

- [XML-T14.xml](XML-T14.xml)

###  Corrección Errores


#### C01

| UD1 | UD2 |
| --- | --- |

<details>
<summary>Errores</summary>

```xml
<<?xml version="1.0" encoding="UTF-8"> 
< frutas > 
 < fruta > 
  < nombre >cereza< nombre \> 
 < fruta \> 
 < fruta > 
  < nombre >naranja< nombre \> 
 < fruta \> 
< frutas \>
```
</details>

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE frutas [
    <!ELEMENT frutas (fruta)+>
    <!ELEMENT fruta (nombre)>
    <!ELEMENT nombre (#PCDATA)>
]>

<frutas>
    <fruta>
        <nombre>Cereza</nombre>
    </fruta>
    <fruta>
        <nombre>Naranja</nombre>
    </fruta>
</frutas>
```

#### C02 <!--funny :D -->

| UD1 | UD2 |
| --- | --- |

<details>
<summary>Errores</summary>

```xml
<? xml versión="1.0" encodin = "UTF-8" > 
<terrestres> 
   <vehiculo>bicicleta<vehiculo> 
   <vehiculo>coche<vehiculo> 
   <vehiculo>tractor<vehiculo> 
<acuaticos> 
   <vehiculo>canoa<vehiculo> 
<aereos> 
   <vehiculo>avioneta<vehiculo> 
   <vehiculo>helicóptero<vehiculo>
```

</details>

```xml
<?xml version="1" encoding="UTF-8"?>

<!DOCTYPE vehiculos [
    <!ELEMENT vehiculos (terrestres, acuaticos, aereos)>
    <!ELEMENT terrestres (vehiculo)+>
    <!ELEMENT acuaticos (vehiculo)+>
    <!ELEMENT aereos (vehiculo)+>
    <!ELEMENT vehiculo (#PCDATA)>
]>

<vehiculos>
    <terrestres>
        <vehiculo>Bicicleta</vehiculo>
        <vehiculo>Coche</vehiculo>
        <vehiculo>Tractor</vehiculo>
    </terrestres>
    <acuaticos>
        <vehiculo>Canoa</vehiculo>
    </acuaticos>
    <aereos>
        <vehiculo>Avioneta</vehiculo>
        <vehiculo>Helicoptero</vehiculo>
    </aereos>
</vehiculos>
```


#### C03 (!)

| UD1 | UD2 |
| --- | --- |

<details>
<summary>Errores</summary>

```xml
<!-- VERSION CON ERRORES -->
<?xml version="1.0" encoding="UTF-8"?> 
<figuras> 
  <figura plana=""> 
    <nombre>cuadrado</nombre> 
    </lados 4> 
  </figura> 
  <figura plana=""> 
    <nombre>triángulo</nombre> 
    </lados 3> 
  </figura> 
  <figura tridimensional=""> 
    <nombre>cubo</nombre> 
    </aristas 12> 
    </caras 6> 
  </figura> 
</figuras>
```

</details>

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!--seems like a great situation for an If-statement-->
<!DOCTYPE figuras [
    <!ELEMENT figuras (figura)+>
    <!ELEMENT figura (nombre, lados?, aristas?, caras?)>
    <!ATTLIST figura forma CDATA #REQUIRED>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT lados (#PCDATA)>
    <!ELEMENT aristas (#PCDATA)>
    <!ELEMENT caras (#PCDATA)>
]>

<figuras>

    <figura forma="plana">
        <nombre>Cuadrado</nombre>
        <lados>4</lados>
    </figura>
    <figura forma="plana">
        <nombre>Triángulo</nombre>
        <lados>3</lados>
    </figura>

    <figura forma="tridimensional">
        <nombre>Cubo</nombre>
        <aristas>12</aristas>
        <caras>6</caras>
    </figura>

</figuras>
```


#### C04

| UD1 | UD2 |
| --- | --- |

<details>
<summary>Errores</summary>

```xml
<!-- CORRIGE: -->
<?Xml version="1,0" encoding="UTF8"?> 
<triangulo base="7"altura="5"> 
  <triangulo base="2"altura="6"> 
    <triangulo base="3"altura="3"> 
```

</details>

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE triangulos [
    <!ELEMENT triangulos (triangulo)+>
    <!ELEMENT triangulo EMPTY>
    <!ATTLIST triangulo base CDATA #REQUIRED>
    <!ATTLIST triangulo altura CDATA #REQUIRED>
]>

<triangulos>
    <triangulo base="7" altura="5"/>
    <triangulo base="2" altura="6"/>
    <triangulo base="3" altura="3"/>
</triangulos>
```

#### C05 (!!)

| UD1 | UD2 |
| --- | --- |

<!--ChatGPT helped-->

<details>
<summary>Errores</summary>

```xml
<!-- CORRIGE -->
<?xml version="1.0" encoding="UTF-8"?> 
<numeros> 
  <1 letra="u" letra="n" letra="o"> 
    1</> 
    <2 letra="d" letra="o" letra="s"> 
      22</> 
      <6 letra="s" letra="e" letra="i" letra="s"> 
        666666</> 
      </numeros>
```

</details>

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE numeros [
    <!ELEMENT numeros (num1, num2, num6)>
    <!ELEMENT num1 (#PCDATA)>
    <!ATTLIST num1
        letra1 CDATA #REQUIRED
        letra2 CDATA #REQUIRED
        letra3 CDATA #REQUIRED
    >
    <!ELEMENT num2 (#PCDATA)>
    <!ATTLIST num2
        letra1 CDATA #REQUIRED
        letra2 CDATA #REQUIRED
        letra3 CDATA #REQUIRED
    >
    <!ELEMENT num6 (#PCDATA)>
    <!ATTLIST num6 
        letra1 CDATA #REQUIRED
        letra2 CDATA #REQUIRED
        letra3 CDATA #REQUIRED
        letra4 CDATA #IMPLIED
    >
]>

<numeros>
        <num1 letra1="u" letra2="n" letra3="o">1</num1>
        <num2 letra1="d" letra2="o" letra3="s">22</num2>
        <num6 letra1="s" letra2="e" letra3="i" letra4="s">666666</num6>
</numeros>
```


#### C06

| UD1 | UD2 |
| --- | --- |

<details>
<summary>Errores</summary>

```xml
<!--CORRIGE-->
<?xml version="1.0" encoding="UTF-8"?> 
<deportistas> 
<deportista> 
<deporte Atletismo /> 
<nombre>Jesse Owens</nombre> 
<deportista> 
<deporte Natación /> 
<nombre>Mark Spitz</nombre> 
</deportista> 
</deportistas>
```

</details>

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE deportistas [
    <!ELEMENT deportistas (deportista)+>
    <!ELEMENT deportista (deporte, nombre)>
    <!ELEMENT deporte (#PCDATA)>
    <!ELEMENT nombre (#PCDATA)>
]>

<deportistas>
    <deportista>
        <deporte>Atletismo</deporte>
        <nombre>Jesse Owens</nombre>
    </deportista>
    <deportista>
        <deporte>Natación</deporte>
        <nombre>Mark Spitz</nombre>
    </deportista>
</deportistas>
```


#### C07

| UD1 | UD2 |
| --- | --- |

<details>
<summary>Errores</summary>

```xml
<!--CORRIGE-->
<?xml version="1.0" encoding="UTF-8"?> 
<pelicula> 
<titulo>Con faldas y a lo loco</titulo> 
<director>Billy Wilder</director> 
</pelicula> 
<pelicula> 
<director>Leo McCarey</director> 
<titulo>Sopa de ganso</titulo> 
</pelicula> 
<autor />barto</autor>
```

</details>

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE peliculas [
    <!ELEMENT peliculas (pelicula+, autor)>
    <!ELEMENT pelicula (titulo, director)>
    <!ELEMENT titulo (#PCDATA)>
    <!ELEMENT director (#PCDATA)>
    <!ELEMENT autor (#PCDATA)>
]>

<peliculas>
    <pelicula>
        <titulo>Con faldas y a lo loco</titulo>
        <director>Billy Wilder</director>
    </pelicula>
    <pelicula>
        <titulo>Sopa de ganso</titulo>
        <director>Leo McCarey</director>
    </pelicula>

    <autor>Barto</autor>
</peliculas>
```


#### C08 (!!)

| UD1 | UD2 |
| --- | --- |

<!-- WTF '(#PCDATA | abreviatura)*
why no '?' ... -->

<details>
<summary>Errores</summary>

```xml
<!--CORRIGE-->
<?xml version="1.0" encoding="UTF-8"?> 
<texto> 
<Titulo>XML explicado a los niños</titulo> 
<párrafo>El <abreviatura>XML</abreviatura>define cómo crear 
lenguajes de marcas.</párrafo> 
<párrafo>Las marcas se añaden a un documento de texto 
para añadir información.</párrafo> 
<http://>www.example.org</http://> 
</texto> 
```

</details>

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE texto [
    <!ELEMENT texto (titulo, parrafos, link)>
    <!ELEMENT titulo (#PCDATA)>
    <!ELEMENT parrafos (parrafo+)>
    <!-- <!ELEMENT parrafo ANY> -->
    <!ELEMENT parrafo (#PCDATA | abreviatura)*>
    <!ELEMENT abreviatura (#PCDATA)>
    <!ELEMENT link (#PCDATA)>
]>

<texto>
    <titulo>XML explicado a los niños</titulo>
    <parrafos>
        <parrafo>El
            <abreviatura>XML</abreviatura>
            define cómo crear lenguajes de marcas.</parrafo>
        <parrafo>Las marcas se añaden a un documento de texto
            para añadir información.</parrafo>
    </parrafos>
    <link>https://example.org</link>
</texto>

```


#### C09

| UD1 | UD2 |
| --- | --- |

<details>
<summary>Errores</summary>

```xml
<!--CORRIGE-->
<?xml version="1.0" encoding="UTF-8"?> 
<geografia mundial> 
<pais> 
<pais>España</pais> 
<continente>Europa</continente> 
<capital></capital nombre="Madrid"> 
</pais> 
</geografia mundial>
```

</details>

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE geografiaMundial [
    <!ELEMENT geografiaMundial (pais)*>
    <!ELEMENT pais (nombre, continente, capital)>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT continente (#PCDATA)>
    <!ELEMENT capital EMPTY>
    <!ATTLIST capital nombre CDATA #REQUIRED>   
]>

<geografiaMundial>
    <pais>
        <nombre>España</nombre>
        <continente>Europa</continente>
        <capital nombre="Madrid"/>
    </pais>
</geografiaMundial>
```

#### C10

| UD1 | UD2 |
| --- | --- |

<!-- notice IMPLIED dawg-->

<details>
<summary>Errores</summary>

```xml
<!--CORRIGE-->
<?xml version="1.0" encoding="UTF-8"?> 
<programas> 
<programa nombre="Firefox" licencia="GPL" licencia="MPL" /> 
<programa nombre="LibreOffice" licencia="LGPL" /> 
<programa nombre="Inkscape" licencia=GPL /> 
</programas>
```
</details>

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE programas [
    <!ELEMENT programas (programa)*>
    <!ELEMENT programa EMPTY>
    <!ATTLIST programa
        nombre CDATA #REQUIRED
        licencia1 CDATA #REQUIRED
        licencia2 CDATA #IMPLIED
    >
]>

<programas> 
    <programa nombre="Firefox" licencia1="GPL" licencia2="MPL"/> 
    <programa nombre="LibreOffice" licencia1="LGPL"/> 
    <programa nombre="Inkscape" licencia1="GPL"/> 
</programas>
```

#### C11

| UD1 | UD2 |
| --- | --- |

<details>
<summary>Errores</summary>

```xml
<!--CORRIGE-->
<?xml version="1.0" encoding="UTF-8"?> 
<mundiales-de-futbol> 
<mundial> 
<pais="España" /> 
<1982 /> 
</mundial> 
</mundiales-de-futbol>
```
</details>

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE mundialesFutbol [
    <!ELEMENT mundialesFutbol (mundial)*>
    <!ELEMENT mundial (pais, fecha)>
    <!ELEMENT pais EMPTY>
    <!ATTLIST pais nombre CDATA #REQUIRED>
    <!ELEMENT fecha (#PCDATA)>
]>

<mundialesFutbol>
    <mundial>
        <pais nombre="España"/>
        <fecha>1982</fecha>
    </mundial>
</mundialesFutbol>
```

### Ejercicios DTD (UD2)

#### D01 <!--C9-->

| UD2 |
| --- |

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- 
Un supermercado desea tener un formato de fichero para que
sus distintas APPs puedan saber las transacciones llevadas a cabo.
El XML debería tener esta estructura:

- El elemento raíz será <transacciones>
- Toda <transacciones> tiene una o más transaccion.
- Toda <transaccion> tiene los siguientes datos:

Importe.
Comprador.
Vendedor.
Fecha (optativa).
Un codigo de factura. -->

<!DOCTYPE transacciones [
    <!ELEMENT transacciones (transaccion)+>
    <!ELEMENT transaccion (importe, comprador, vendedor, fecha?, codigoFactura)>
    <!ELEMENT importe (#PCDATA)>
    <!ELEMENT comprador (#PCDATA)>
    <!ELEMENT vendedor (#PCDATA)>
    <!ELEMENT fecha (#PCDATA)>
    <!ELEMENT codigoFactura (#PCDATA)>
]>

<transacciones>
    <transaccion>
        <importe></importe>
        <comprador></comprador>
        <vendedor></vendedor>
        <fecha/>
        <codigoFactura></codigoFactura>
    </transaccion>
    <transaccion>
        <importe></importe>
        <comprador></comprador>
        <vendedor></vendedor>
        <fecha/>
        <codigoFactura></codigoFactura> 
    </transaccion>
</transacciones>
```


#### D02

| UD2 |
| --- |

<!-- SO NOW I UNDERSTAND!!
(foo+)? == (foo?)+ == (foo)*
ie. '*' means like 'any' LMAO
-->

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Crear un XML de ejemplo y la DTD asociada para
unos diseñadores que realizan una aplicación de compras donde hay
- una lista de compras con
- 0 o más compras.
Cada compra tiene
- un número de serie,
- una cantidad y 
- un peso que puede ser opcional. -->

<!DOCTYPE listaCompras [
    <!ELEMENT listaCompras (compra)*>  <!--(...)* porque '0 o +', ie. (foo?)+-->
    <!ELEMENT compra (numeroSerie, cantidad, peso?)>
    <!ELEMENT numeroSerie (#PCDATA)>
    <!ELEMENT cantidad (#PCDATA)>
    <!ELEMENT peso (#PCDATA)>
]>

<listaCompras>
    <compra>
        <numeroSerie></numeroSerie>
        <cantidad></cantidad>
        <peso/>
    </compra>
    <compra>
        <numeroSerie></numeroSerie>
        <cantidad></cantidad>
        <peso></peso>
    </compra>
</listaCompras>

```

#### D03 (!)

| UD2 |
| --- |

<!-- apuntes clases (
raiz productosInformaticos
y dentro como mínimo
- raton
- teclado
- monitor

todos ellos llevan
- un código
todos ellos PUEDEN llevar
- nombre
- descripcion
(...)
OPERADORES (tabla de verdad): 'OR'^['AND', 'XOR'] = '|' ie por lo menos uno!
) -->


```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Se desea crear una gramática para ficheros de datos
    en los que se ha decidido contemplar lo siguiente:
El fichero debe llevar una raíz <productosInformaticos> y 
    dentro de productosInformaticos
como mínimo debe haber alguno de estos productos
<raton>, <teclado> o <monitor>.
Todo ratón, teclado o monitor tiene siempre un código.
Todo ratón, teclado o monitor puede llevar un nombre.
Todo ratón, teclado o monitor puede llevar una descripción. -->

<!DOCTYPE productosInformaticos [
    <!ELEMENT productosInformaticos (raton | teclado | monitor)+> <!--(foo|foo)+ porque '1 o +'-->
    <!ELEMENT raton (codigo, nombre?, descripcion)>
    <!ELEMENT teclado (codigo, nombre?, descripcion?)>
    <!ELEMENT monitor (codigo, nombre?, descripcion?)>
    <!ELEMENT codigo (#PCDATA)>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT descripcion (#PCDATA)>
]>

<productosInformaticos>
    <raton>
        <codigo></codigo>
        <nombre/>
        <descripcion/>
    </raton>
    <teclado>
        <codigo></codigo>
        <nombre></nombre>
        <descripcion/>
    </teclado>
    <monitor>
        <codigo></codigo>
        <nombre></nombre>
        <descripcion></descripcion>
    </monitor>
</productosInformaticos>
```

#### D04

| UD2 |
| --- |


<!-- APUNTES CLASE (
La raíz debe ser el elemento <compras>
Dentro uno o más elementos <venta>

venta uno de estos dos elementos: 
<ventaacredito> o <ventainmediata>

Un elemento <ventaacredito> consta de: 
-  <fechafinpago> que es optativo y
-  <cantidad> que es obligatorio.

Un elemento <ventainmediata> lleva dentro dos cosas: 
- <cantidad> que es obligatorio y
- <divisa> que también es obligatorio.
) -->

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- En una tienda se ha decidido la siguiente estructura para
ficheros de datos que se tengan que mover de unos software a otros.

- La raíz debe ser el elemento <compras>
- Dentro de <compras> debe haber uno o más elementos <venta>
- Una venta puede llevar dentro uno de estos dos elementos: 
<ventaacredito> o <ventainmediata>

Un elemento <ventaacredito> consta de:
- un elemento <fechafinpago> que es optativo y
- un elemento <cantidad> que es obligatorio.

Un elemento <ventainmediata> lleva dentro dos cosas: 
- un elemento <cantidad> que es obligatorio y
- un elemento <divisa> que también es obligatorio. -->

<!DOCTYPE compras [
    <!ELEMENT compras (venta)+>
    <!ELEMENT venta (ventaCredito | ventaInmediata)>
    <!ELEMENT ventaCredito (fechaFinPago?, cantidad)>
    <!ELEMENT ventaInmediata (cantidad, divisa)>
    <!ELEMENT fechaFinPago (#PCDATA)>
    <!ELEMENT cantidad (#PCDATA)>
    <!ELEMENT divisa (#PCDATA)>
]>

<compras>
    <venta>
        <ventaCredito>
            <fechaFinPago/>
            <cantidad></cantidad>
        </ventaCredito>     
    </venta>
    <venta>
        <ventaInmediata>
            <cantidad></cantidad>
            <divisa></divisa>
        </ventaInmediata>
    </venta>
</compras>
```
#### D05
#### D06
#### D07
#### D08
#### D09
#### D10

## Docs-Apuntes

### XML -  Literales (C7)

> see [XML-T14.xml](/Markup/xml-T14.xml)

<!--operadores/ASCII-->

| Signo            | Representación |
| ---              | ---            |
| Comillas dobles  | `&quot;`       |
| Comillas simples | `&apos;`       |
| Menor que        | `&lt;`         |
| Mayor que        | `&gt;`         |
| Igual que        |          |
| Ampersand        |          |
| Euro             |          |


<details>
<summary>Example</summary>

```xml
<?xml version="1.0" encoding="UTF-8"?>

<literales>
    <!-- comillas dobles -->
    <literal>&quot; hola mundo 1&quot;</literal>
    <!-- comillas simples -->
    <literal>&apos; hola mundo 2 &apos;</literal>
    <!-- menor que -->
    <literal>7 &lt; 9</literal>
    <!-- mayor que -->
    <literal>9 &gt; 7</literal>
</literales>
```
</details>



### DTD

<!-- 
- EXPLICACIONES
- REFERENCIA
- TAL
-->

#### Modificadores

- `+` :: many
- `?` :: optional
- `*` :: (...)
  - see **D02** above; '* == any'
  - ie. mejor no usarlo porque acepta todo y es como cheating


#### tipos de elementos

- `#PCDATA`: 
- `EMPTY`
- ...


#### atributos

```xml
<!ATTLIST cientifico nombre CDATA #REQUIRED>
<!ATTLIST cientifico nombre CDATA #OPTIONAL>
<!ATTLIST cientifico nombre CDATA #IMPLIED>
<!ATTLIST cientifico nombre ID #REQUIRED>
```

<!--diff CDATA vs ID...-->



## Campus Virtual


### material complementario

> UD2

- docs .pdf
  - [x] ~~DTD xml copy editor~~ <!--BS-->
  - [x] [DTD guía referencia rápida](docs/DTD-guide.pdf)
- youtube (...)
- webs dudas
  - [DTD ikastaroak](https://ikastaroak.birt.eus/edu/argitalpen/backupa/20200331/1920k/es/ASIRDAMDAW/LMSGI/LMSGI04/es_ASIRDAMDAW_LMSGI04_Contenidos/website_index.html)
  - [DTD w3schools](https://www.w3schools.com/xml/xml_dtd_intro.asp)


### cuestionarios
- [ ] UD1
- [ ] UD2
- [ ] UD2_1


