# Markup A1: XML DTD

## Ultimate Cheatsheet...

```xml
<!-- XML Prolog -->
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>

<!-- External DTD -->
<!DOCTYPE mydoc SYSTEM "myfile.dtd">

<!-- All-encompassing DTD -->
<!DOCTYPE mydoc [
    <!ELEMENT mydoc (element1+, element2, element3?)>
    <!ELEMENT element1 (subelement1|subelement2)*>
    <!ELEMENT subelement1 (#PCDATA)>
    <!ELEMENT subelement2 (#PCDATA)>
    <!ELEMENT element2 (#PCDATA)>
    <!ELEMENT element3 (#PCDATA)>
    <!ATTLIST subelement1 id ID #REQUIRED>
    <!ATTLIST subelement2 id IDREFS #REQUIRED>
    <!ATTLIST element2 name NMTOKENS #REQUIRED>
    <!ATTLIST element2 description CDATA #IMPLIED>
    <!ATTLIST element3 color CDATA #FIXED "green">
    <!ELEMENT linebreak EMPTY>
]>

<!-- Valid XML -->
<mydoc>
    <element1>
        <subelement1 id="a69"></subelement1>
    </element1>
    <element1>
        <subelement1 id="a420"></subelement1>
        <subelement2 id="a420"></subelement2>
    </element1>
    <element2 name="sup dawg"></element2>
</mydoc>


<!-- NOTES ---------------------------------------------------------->
<!-- ATTLIST CDATA "green" => default value for ATT ----------------->
<!-- ATTLIST CDATA #FIXED "green" => mandatory value if ATT exists -->
<!-- ELEMENT linebreak => still requires root element in the DTD ---->
<!-- ---------------------------------------------------------------->
```

- @StackOverflow: [What does the 'standalone' directive mean in XML?](https://stackoverflow.com/questions/5578645/what-does-the-standalone-directive-mean-in-xml)

<!--
- Ctrl+ç => comentar
- Alt+Shift+f => indentar
-->

## Ejercicio 1

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>

<!DOCTYPE pedido [
  <!ELEMENT pedido (destinatario, articulo, direccion, fecha)>
  <!ELEMENT destinatario (#PCDATA)>
  <!ELEMENT articulo (#PCDATA)>
  <!ELEMENT direccion (#PCDATA)>
  <!ELEMENT fecha (#PCDATA)>
]>

<pedido>
  <destinatario>Juan Delgado Martinez  </destinatario>
  <articulo> bicicleta A2023</articulo>
  <direccion>calle Barco 4, tercer piso, letra A</direccion>
  <fecha>19-5-2000</fecha>
</pedido>
```

## Ejercicio 2

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Personas que constituyen un colegio, 
tenemos un alumno con un nombre y que cursa 
dos tipos de asignaturas, un profesor y un director. -->

<!DOCTYPE persona [
    <!ELEMENT persona (alumno, profesor, director)>
    <!ELEMENT alumno (nombre,asignatura)>
    <!ELEMENT asignatura (programacion, ofimatica)>
    <!ELEMENT programacion (#PCDATA)>
    <!ELEMENT ofimatica (#PCDATA)>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT profesor (#PCDATA)>
    <!ELEMENT director (#PCDATA)>
]>

<persona>
    <alumno>
        <nombre>Jose Menendez</nombre>
        <asignatura>
            <programacion>LM</programacion>
            <ofimatica>Excel Avanzado</ofimatica>
        </asignatura>
    </alumno>
    <profesor>Maria Rodriguez</profesor>
    <director>Pedro Perez</director>
</persona>
```

## Ejercicio 3

```xml
<?xml version="1.0" encoding="UTF-8" ?>

<!DOCTYPE equipos [
  <!ELEMENT equipos (equipo+)>
  <!ELEMENT equipo (futbolista, entrenador?, presidente)>
  <!ELEMENT futbolista (#PCDATA)>
  <!ELEMENT entrenador (#PCDATA)>
  <!ELEMENT presidente (#PCDATA)>
]>

<equipos>
    <!-- equipo 1 -->
    <equipo>
        <futbolista>Messi</futbolista>
        <entrenador/>
        <presidente>Bartomeu</presidente>
    </equipo>
    <!-- equipo 2 -->
    <equipo>
        <futbolista>Ronaldo</futbolista>
        <entrenador>Sarri</entrenador>
        <presidente>Agnelli</presidente>
    </equipo>
    <!-- equipo 3 -->
    <equipo>
        <futbolista>Silva</futbolista>
        <entrenador>Guardiola</entrenador>
        <presidente>Mubarak</presidente>
    </equipo>
</equipos>
```

## Ejercicio 4

```xml
<?xml version="1.0" encoding="UTF-8" ?>

<!DOCTYPE cientificos_importantes [
    <!ELEMENT cientificos_importantes (cientifico+)>
    <!ELEMENT cientifico (fecha_nac)>
    <!ATTLIST cientifico nombre CDATA #REQUIRED>
    <!ELEMENT fecha_nac (dia, mes, anyo)>
    <!ELEMENT dia (#PCDATA)>
    <!ELEMENT mes (#PCDATA)>
    <!ELEMENT anyo (#PCDATA)>
]>

<cientificos_importantes>
    <cientifico nombre = "Albert Einstein">
          <fecha_nac>
            <dia>14</dia>
            <mes>Marzo</mes>
            <anyo>1879</anyo>
        </fecha_nac>
    </cientifico>
    <cientifico nombre = "Isaac Newton">
          <fecha_nac>
            <dia>4</dia>
            <mes>Enero</mes>
            <anyo>1643</anyo>
        </fecha_nac>
    </cientifico>
    <cientifico nombre="Galileo Galilei">
          <fecha_nac>
            <dia>15</dia>
            <mes>Febrero</mes>
            <anyo>1564</anyo>
        </fecha_nac>
    </cientifico>
</cientificos_importantes>
```

## Ejercicio 5

```xml
<!ELEMENT equipo_de_basket (equipo+)>
<!ELEMENT equipo (nombre, ciudad, entrenador, jugador+)>
<!ELEMENT jugador (nombre, nacionalidad)>
<!ATTLIST jugador posicion CDATA #REQUIRED>
<!ELEMENT nacionalidad (#PCDATA)>
<!ELEMENT nombre (#PCDATA)>
<!ELEMENT ciudad (#PCDATA)>
<!ELEMENT entrenador EMPTY>
```


```xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>

<!-- Escribir un documento XML bien formado que guarde información de
dos equipos de baloncesto (nombre, ciudad y entrenador) con
dos jugadores (nombre, posición y nacionalidad) cada uno. 
La posición (base, alero, escolta, ala-pivot, pivot) 
deberá representarse mediante un atributo del jugador. 
Utilizar datos reales para los equipos y jugadores. 
No obstante, no deberá indicarse el nombre del 
entrenador. -->

<!DOCTYPE equipo_de_basket SYSTEM "ejercicio5.dtd">

<equipo_de_basket>
    <equipo>
        <nombre>Angeles Lakers</nombre>
        <ciudad>Los Angeles</ciudad>
        <entrenador/>
        <jugador posicion = "ala-pivot">
            <nombre>Anthony Davis</nombre>    
            <nacionalidad>estados unidos</nacionalidad>
        </jugador>
        <jugador posicion = "alero">
            <nombre>LeBron James</nombre>    
            <nacionalidad>estados unidos</nacionalidad>
        </jugador>
    </equipo>
    <equipo>
        <nombre>Chicago Bulls</nombre>
        <ciudad>Chicago</ciudad>
        <entrenador/>
        <jugador posicion = "base">
            <nombre>Goran Dragic</nombre>
            <nacionalidad>esloveno</nacionalidad>
        </jugador>
        <jugador posicion = "escolta">
            <nombre>Marko Simonovic</nombre>
            <nacionalidad>montenegrino</nacionalidad>
        </jugador>
    </equipo>
</equipo_de_basket>
```

## Ejercicio 6

—

## Ejercicio 7

```xml
<?xml version="1.0" encoding="UTF-8" ?>

<!DOCTYPE ciudades [
    <!ELEMENT ciudades (ciudad)+>
    <!ELEMENT ciudad (nombre, pais)>
    <!ATTLIST ciudad continente NMTOKENS #REQUIRED>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT pais (#PCDATA)>
]>

<ciudades>
    <ciudad continente="Asia">
        <nombre>Nueva Delhi</nombre>
        <pais>India</pais>
    </ciudad>
    <ciudad continente="Europa">
        <nombre>Lisboa</nombre>
        <pais>Portugal</pais>
    </ciudad>
    <ciudad continente="Africa">
        <nombre>El Cairo</nombre>
        <pais>Egipto</pais>
    </ciudad>
</ciudades>
```

## Ejercicio 8

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Elabora un documento XML que almacene la
información de 2 clientes. Cada cliente almacena
un nombre, apellidos (el cual está formado por
apellido1 y apellido2) y un nif. 
El segundo cliente tiene el campo apellido2 vacío. -->

<!DOCTYPE clientes [
  <!ELEMENT clientes (cliente)+>
  <!ELEMENT cliente (nombre, apellidos, nif)>
  <!ELEMENT apellidos (apellido1, apellido2?)>
  <!ELEMENT apellido1 (#PCDATA)>
  <!ELEMENT apellido2 (#PCDATA)>
  <!ELEMENT nombre (#PCDATA)>
  <!ELEMENT nif (#PCDATA)>
]>

<clientes>
    <cliente>
        <nombre>Daniel</nombre>
        <apellidos>
            <apellido1>Ruiz</apellido1>
            <apellido2>Avarez</apellido2>
        </apellidos>
        <nif>44444444A</nif>
    </cliente>
    <cliente>
        <nombre>Pablo</nombre>
        <apellidos>
            <apellido1>Quevedo</apellido1>
            <apellido2/>
        </apellidos>
        <nif>111111111A</nif>
    </cliente>
</clientes>
```

## Ejercicio 9

- ...

## Ejercicio 10

```xml
<?xml version="1.0" encoding="UTF-8" ?>

<!DOCTYPE eventos [
    <!ELEMENT eventos (evento)+>
    <!ELEMENT evento (senyal, puntoKM,
        nombreVia, sentido, corteVia?,
        fechaHora?, retencion, kmRetencion)>
    <!ELEMENT senyal (#PCDATA)>
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
        <senyal>Accidente</senyal>
        <puntoKM>545</puntoKM>
        <nombreVia>A-6</nombreVia>
        <sentido>Lugo</sentido>
        <corteVia>1 carril</corteVia>
        <fechaHora/>
        <retencion>si</retencion>
        <kmRetencion>1.5</kmRetencion>
    </evento>
    <evento>
        <senyal>Retencion</senyal>
        <puntoKM>3,5</puntoKM>
        <nombreVia>AC-10</nombreVia>
        <sentido>Coruña</sentido>
        <fechaHora/>
        <retencion>si</retencion>
        <kmRetencion>1</kmRetencion>
    </evento>
</eventos>
```

## Ejercicio 11

- ...

## Ejercicio 12

![enunciado-ejercicio12](/img/Markup/ud1-ej12.png)

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Elabora un XML relativo a tu horario de clase. 
El elemento padre debe de ser ASIGNATURAS. 
Cada asignatura tendrá elementos días de semana
(tantos elementos como días de la semana se repita la misma).
El elemento días de semana contendrá
el nombre del día y otro elemento con el horario,
el cual se dividirá en hora y minutos. -->

<!DOCTYPE asignaturas [
    <!ELEMENT asignaturas (asignatura)+>
    <!ELEMENT asignatura (nombre, diasSemana)>
    <!ELEMENT diasSemana (dia)+>
    <!ELEMENT dia (nombre, horario)>
    <!ELEMENT horario (inicio, fin)>
    <!ELEMENT inicio (hora, minutos)>
    <!ELEMENT fin (hora, minutos)>
    <!ELEMENT hora (#PCDATA)>
    <!ELEMENT minutos (#PCDATA)>
    <!ELEMENT nombre (#PCDATA)>
]>

<asignaturas>
    <!-- 1. ENTORNOS -->
    <asignatura>
        <nombre>Entornos</nombre>
        <diasSemana>
            <dia>
                <nombre>Lunes</nombre>
                <horario>
                    <inicio>
                        <hora>8</hora>
                        <minutos>30</minutos>
                    </inicio>
                    <fin>
                        <hora>11</hora>
                        <minutos>00</minutos>
                    </fin>
                </horario>
            </dia>
            <dia>
                <nombre>Martes</nombre>
                <horario>
                    <inicio>
                        <hora>10</hora>
                        <minutos>10</minutos>
                    </inicio>
                    <fin>
                        <hora>11</hora>
                        <minutos>00</minutos>
                    </fin>
                </horario>
            </dia>
        </diasSemana>
    </asignatura>
    <!-- 2. FOL -->
    <asignatura>
        <nombre>FOL</nombre>
        <diasSemana>
            <dia>
                <nombre>Lunes</nombre>
                <horario>
                    <inicio>
                        <hora>11</hora>
                        <minutos>20</minutos>
                    </inicio>
                    <fin>
                        <hora>12</hora>
                        <minutos>10</minutos>
                    </fin>
                </horario>
            </dia>
        </diasSemana>
    </asignatura>
    <!-- 3. SISTEMAS -->
    <!-- 4. PROGRAMACION -->
    <!-- 5. MARCAS -->
    <!-- 6. BASESDATOS -->
</asignaturas>
```

## Ejercicio 13

- ...

## Ejercicio 14

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!DOCTYPE precios [
    <!ELEMENT precios (condicionMenor, condicionMayor, condicionIgual, ampersand)>
    <!ELEMENT condicionIgual (condicion)+>
    <!ELEMENT condicionMenor (#PCDATA)>
    <!ELEMENT condicionMayor (#PCDATA)>
    <!ELEMENT condicion (#PCDATA)>
    <!ELEMENT ampersand (#PCDATA)>
]>

<precios>
    <condicionMenor>6&#8364; &lt; 10&#8364;</condicionMenor>
    <condicionMayor>10&#8364; &gt; 8&#8364;</condicionMayor>
    <condicionIgual>
        <condicion>10&#8364; &#61; &quot;10&#8364;&quot;</condicion>
        <condicion>6&#8364; &#61; &apos;6&#8364;&apos;</condicion>
    </condicionIgual>
    <ampersand>13&#8364; &amp; 8&#8364;</ampersand>
</precios>
```

## Ejercicio 15

- ...

## Ejercicio 16

- ...

## Ejercicio 17

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Se desea crear (...).
El fichero debe llevar una raíz <productosInformaticos> y
dentro debe haber como mínimo alguno de estos productos:
<raton>, <teclado> o <monitor>.
Todo ratón, teclado o monitor tiene siempre un código.
Todo ratón, teclado o monitor puede llevar un nombre.
Todo ratón, teclado o monitor puede llevar una descripción. -->

<!DOCTYPE productosInformaticos[
    <!ELEMENT productosInformaticos (raton|teclado|monitor)+>
    <!ELEMENT raton (codigo, nombre?, descripcion?)>
    <!ELEMENT teclado (codigo, nombre?, descripcion?)>
    <!ELEMENT monitor (codigo, nombre?, descripcion?)>
    <!ELEMENT codigo (#PCDATA)>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT descripcion (#PCDATA)>
]>

<productosInformaticos>
        <teclado>
            <codigo></codigo>
        </teclado>
</productosInformaticos>
```

## Ejercicio 18

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- En una tienda (...).
La raíz debe ser el elemento <compras>.
Dentro debe haber uno o más elementos <venta>.
Una venta puede llevar dentro uno de estos dos elementos: 
<ventaacredito> o <ventainmediata>
Un elemento <ventaacredito> consta de:
un elemento <fechafinpago> que es optativo
y un elemento <cantidad> que es obligatorio.
Un elemento <ventainmediata> lleva dentro dos cosas: 
un elemento <cantidad> que es obligatorio
y un elemento <divisa> que también es obligatorio. -->

<!DOCTYPE compras[
    <!ELEMENT compras (venta+)>
    <!ELEMENT venta (venta_a_Credito|venta_Inmediata)>
    <!ELEMENT venta_a_Credito (fechaFinPago?, cantidad)>
    <!ELEMENT venta_Inmediata (cantidad, divisa)>
    <!ELEMENT fechaFinPago (#PCDATA)>
    <!ELEMENT cantidad (#PCDATA)>
    <!ELEMENT divisa (#PCDATA)>
]>

<compras>
    <venta>
        <venta_a_Credito>
            <fechaFinPago/>
            <cantidad></cantidad>
        </venta_a_Credito>
    </venta>
</compras>
```

## Ejercicio 19

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Un mayorista de productos de librería (...).
El elemento raíz debe ser <inventario>. Dentro de pueden ir 
<lapiz>, <cuaderno> o <boligrafo> repetidos y en cualquier orden.
Todo <lapiz> puede tener un elemento <dureza>.
Todo cuaderno debe llevar dos elementos: <numhojas> y <estilo>.
Todo boligrafo lleva un <precio> y puede o no llevar un elemento <color> -->

<!DOCTYPE inventario [
    <!ELEMENT inventario (lapiz|cuaderno|boligrafo)*>
    <!ELEMENT lapiz (dureza)?>
    <!ELEMENT cuaderno (numHojas, estilo)>
    <!ELEMENT boligrafo (precio, color?)>
    <!ELEMENT dureza (#PCDATA)>
    <!ELEMENT numHojas (#PCDATA)>
    <!ELEMENT estilo (#PCDATA)>
    <!ELEMENT precio (#PCDATA)>
    <!ELEMENT color (#PCDATA)>
]>

<inventario>
    <lapiz/>
    <cuaderno>
        <numHojas/>
        <estilo/>
    </cuaderno>
    <boligrafo>
        <precio/>
    </boligrafo>
</inventario>
```

## Ejercicio 20

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Unos programadores (...).
Los ficheros deben tener un elemento <listafacturas>
Dentro de la lista debe haber una o más facturas.
Las facturas tienen un atributo fecha que es optativo.
Toda factura tiene:
un emisor, que es un elemento obligatorio
y que debe tener un atributo cif (el emisor) que es obligatorio.
Dentro de emisor debe haber un elemento obligatorio nombre
y puede o no haber un elemento volumenventas.
Toda factura debe tener un elemento pagador,
con exactamente la misma estructura que emisor.
Toda factura tiene un elemento importe. -->

<!DOCTYPE listaFacturas [
    <!ELEMENT listaFacturas (factura)+>
    <!ELEMENT factura (emisor, pagador, importe)>
    <!-- <!ATTLIST factura fecha CDATA #IMPLIED> -->
    <!ATTLIST factura fecha (2023|2024) #IMPLIED>
    <!ELEMENT emisor (nombre, volumenVentas?)>
    <!ATTLIST emisor cif NMTOKEN #REQUIRED>
    <!ELEMENT pagador (nombre, volumenVentas?)>
    <!ATTLIST pagador cif NMTOKENS #REQUIRED>
    <!ELEMENT volumenVentas (#PCDATA)>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT importe (#PCDATA)>
]>

<listaFacturas>
    <factura fecha="2023">
        <emisor cif="sup">
            <nombre></nombre>
        </emisor>
        <pagador cif="sup dawg">
            <nombre></nombre>
            <volumenVentas></volumenVentas>
        </pagador>
        <importe></importe>
    </factura>
</listaFacturas>
```

## Ejercicio 21

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Un instituto (...).
Tiene que haber un elemento raíz listacursos. 
Tiene que haber uno o más cursos.
Un curso tiene uno o más alumnos.
Todo alumno tiene un DNI, un nombre y un apellido, 
puede que tenga segundo apellido o no
y tiene una lista de asignaturas donde habrá
una o más asignaturas.
Toda asignatura tiene un nombre, un profesor y un atributo código.
Un profesor tiene un NRP (Número de Registro Personal),un nombre
y un apellido (también puede tener o no un segundo apellido). -->

<!DOCTYPE listaCursos [
    <!ELEMENT listaCursos (curso)+>
    <!ELEMENT curso (alumno)+>
    <!ELEMENT alumno (DNI, nombre, apellido, segApellido?, listaAsignaturas)>
    <!ELEMENT listaAsignaturas (asignatura)+>
    <!ELEMENT asignatura (nombre, profesor)>
    <!ATTLIST asignatura codigo ID #REQUIRED>
    <!ELEMENT profesor (NRP, nombre, apellido, segApellido?)>
    <!ELEMENT segApellido (#PCDATA)>
    <!ELEMENT apellido (#PCDATA)>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT NRP (#PCDATA)>
    <!ELEMENT DNI (#PCDATA)>
]>

<listaCursos>
    <curso>
        <alumno>
            <DNI></DNI>
            <nombre></nombre>
            <apellido></apellido>
            <listaAsignaturas>
                <asignatura codigo="ye">
                    <nombre></nombre>
                    <profesor>
                        <NRP></NRP>
                        <nombre></nombre>
                        <apellido></apellido>
                    </profesor>
                </asignatura>
            </listaAsignaturas>
        </alumno>
    </curso>
</listaCursos>
```

## Ejercicio 22

```xml         
<?xml version="1.0" encoding="UTF-8"?>

<!-- Un mayorista informático (...).
Una entrega consta de uno o más lotes.
Un lote tiene uno o más palés.
Todo palé tiene una serie de elementos: 
número de cajas, contenido, peso
y forma de manipulación que puede ser optativa.
El contenido consta de una serie de elementos: 
nombre del componente,
procedencia que es opcional y contiene 0, 1 o más países, 
número de serie del componente, peso del componente individual
y unidad de peso que puede aparecer o no. -->

<!DOCTYPE entregas [
    <!ELEMENT entregas (lote)+>
    <!ELEMENT lote (pale)+>
    <!ELEMENT pale (numCajas, contenido, peso, formaManipulacion?)>
    <!ELEMENT contenido (nombreComponente, procedencia*,
        numSerieComponente, pesoComponente, unidadPeso?)>
    <!ELEMENT unidadPeso (#PCDATA)>
    <!ELEMENT pesoComponente (#PCDATA)>
    <!ELEMENT numSerieComponente (#PCDATA)>
    <!ELEMENT procedencia (#PCDATA)>
    <!ELEMENT nombreComponente (#PCDATA)>
    <!ELEMENT formaManipulacion (#PCDATA)>
    <!ELEMENT peso (#PCDATA)>
    <!ELEMENT numCajas (#PCDATA)>
]>

<entregas>
    <lote>
        <pale>
            <numCajas></numCajas>
            <contenido>
                <nombreComponente></nombreComponente>
                <numSerieComponente></numSerieComponente>
                <pesoComponente></pesoComponente>
            </contenido>
            <peso></peso>
        </pale>
    </lote>
</entregas>
```

## Ejercicio 23

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- (...)
El elemento raíz es operaciones y las operaciones tienen
uno o más elementos operación. Toda operación puede ser de tipo
«venta», «compra», o cualquier combinación y secuencia de ellas,
pero debe haber al menos una.
Una venta tiene:
uno o más titulos, la cantidad total de libros vendidos, 
puede tener un elemento «entregado» que indique si la entrega se ha realizado
y debe haber un elemento importe con un atributo obligatorio llamado «moneda».
Una compra tiene:
uno o más titulos comprados, el nombre de proveedor
y una fecha de compra, que debe desglosarse en elementos día, mes y año. -->

<!DOCTYPE operaciones [
    <!ELEMENT operaciones (operacion)+>
    <!ELEMENT operacion (venta|compra)+>
    <!ELEMENT venta (titulo+, totalLibrosVendidos, entregado?, importe)>
    <!ATTLIST importe moneda CDATA #IMPLIED>
    <!ELEMENT compra (titulo+, nombreProveedor, fechaCompra)>
    <!ELEMENT fechaCompra (dia,mes,anyo)>
    <!ELEMENT dia (#PCDATA)>
    <!ELEMENT mes (#PCDATA)>
    <!ELEMENT anyo (#PCDATA)>
    <!ELEMENT nombreProveedor (#PCDATA)>
    <!ELEMENT titulo (#PCDATA)>
    <!ELEMENT importe (#PCDATA)>
    <!ELEMENT entregado (#PCDATA)>
    <!ELEMENT totalLibrosVendidos (#PCDATA)>
]>

<operaciones>
    <operacion>
        <venta>
            <titulo></titulo>
            <totalLibrosVendidos></totalLibrosVendidos>
            <entregado/>
            <importe moneda=""></importe>
        </venta>
        <compra>
            <titulo></titulo>
            <nombreProveedor></nombreProveedor>
            <fechaCompra>
                <dia></dia>
                <mes></mes>
                <anyo></anyo>
            </fechaCompra>
        </compra>
    </operacion>
</operaciones>
```

## Ejercicio 24

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Un fabricante de tractores (...)
Un pedido consta de uno o más tractores.
Un tractor consta de uno o más componentes.
Un componente tiene los siguientes elementos:
nombre del fabricante (atributo obligatorio),
fecha de entrega (si es posible, aunque puede que no aparezca;
si aparece el dia es optativo, pero el mes y el año son obligatorios).
También se necesita saber del componente si es frágil o no.
También debe aparecer un elemento peso del componente
y dicho elemento peso tiene un atributo unidad del peso (kilos o gramos),
un elemento número de serie
y puede que aparezca o no un elemento kmmaximos indicando
que el componente debe sustituirse tras un cierto número de kilómetros. -->

<!DOCTYPE pedidos [
    <!ELEMENT pedidos (tractor)+>
    <!ELEMENT tractor (componente)+>
    <!ATTLIST componente nombreFabricante CDATA #REQUIRED>
    <!ELEMENT componente (numSerie, (fragil|noFragil),
        pesoComponente, fechaEntrega?, kilometrosMaximos)>
    <!ELEMENT fechaEntrega (dia?, mes, anyo)>
    <!ELEMENT dia (#PCDATA)>
    <!ELEMENT mes (#PCDATA)>
    <!ELEMENT anyo (#PCDATA)>
    <!ELEMENT kilometrosMaximos (#PCDATA)>
    <!ELEMENT pesoComponente (#PCDATA)>
    <!ATTLIST pesoComponente unidadPeso (kg|g) #REQUIRED>
    <!ELEMENT fragil (#PCDATA)>
    <!ELEMENT noFragil (#PCDATA)>
    <!ELEMENT numSerie (#PCDATA)>
]>

<pedidos>
    <tractor>
        <componente nombreFabricante="supdawg">
            <numSerie></numSerie>
            <noFragil/>
            <pesoComponente unidadPeso="kg"></pesoComponente>
            <fechaEntrega>
                <mes></mes>
                <anyo></anyo>
            </fechaEntrega>
            <kilometrosMaximos></kilometrosMaximos>
        </componente>
    </tractor>
</pedidos>
```

## Ejercicio 25

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Almacenes de productos de librería (...)
Debe haber un elemento raíz pedido que puede constar de
libros, cuadernos o lápices. Pueden aparecer repetidos y en cualquier orden.
Podrían aparecer 4 libros, 2 lápices y luego 4 lápices de nuevo.
Todo libro tiene un atributo obligatorio título.
Los elementos cuaderno tiene un atributo optativo num_hojas.
Todo elemento lápiz debe tener dentro un elemento obligatorio número. -->

<!DOCTYPE pedido [
    <!ELEMENT pedido (libro|cuaderno|lapiz)+>
    <!ATTLIST libro titulo CDATA #REQUIRED>
    <!ATTLIST cuaderno num_hojas CDATA #IMPLIED>
    <!ELEMENT lapiz (numero)>
    <!ELEMENT numero (#PCDATA)>
    <!ELEMENT cuaderno (#PCDATA)>
    <!ELEMENT libro (#PCDATA)>
]>

<pedido>
    <libro titulo=""></libro>
    <cuaderno num_hojas=""></cuaderno>
    <lapiz>
        <numero></numero>
    </lapiz>
</pedido>
```

## Ejercicio 26

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Una multinacional que opera en bolsa (...)
En el listado aparecen siempre uno o varios futuros,
después una o varias divisas,
después uno o varios bonos y una o varias letras.
Todos ellos tienen un atributo precio que es obligatorio.
Las divisas y los bonos tienen un atributo optativo 'estable'.
Un futuro es un valor esperado que tendrá un cierto producto en el futuro...
Se debe incluir este producto en forma de elemento.
También puede aparecer un elemento mercado.
Todo bono tiene un elemento país_de_procedencia. También debe tener
«valor_deseado», «valor_mínimo» y «valor_máximo».
Las divisas tienen siempre un nombre, además pueden incluir
uno o más tipos de cambio para otras monedas.
Las letras tienen siempre un tipo de interés y un país emisor.
El país emisor también debe existir
y puede ser siempre «España», «EEUU», «Alemania» y «Japón» -->

<!DOCTYPE listado [
    <!ELEMENT listado (futuro+, divisa+, bono+, letra+)>
    <!ATTLIST futuro precio CDATA #REQUIRED>
    <!ATTLIST divisa precio CDATA #REQUIRED>
    <!ATTLIST divisa estable CDATA #IMPLIED>
    <!ATTLIST bono precio CDATA #REQUIRED>
    <!ATTLIST bono estable CDATA #IMPLIED>
    <!ATTLIST letra precio CDATA #REQUIRED>
    <!ELEMENT futuro (producto, mercado?)>
    <!ELEMENT bono (paisProcedencia, valorDeseado, valorMinimo, valorMaximo)>
    <!ELEMENT divisa (nombre, tiposCambio*)>
    <!ELEMENT letra (tipoInteres, paisEmisor)>
    <!ELEMENT paisEmisor (Espanya|EEUU|Alemania|Japon)>
    <!ELEMENT Japon (#PCDATA)>
    <!ELEMENT Alemania (#PCDATA)>
    <!ELEMENT EEUU (#PCDATA)>
    <!ELEMENT Espanya (#PCDATA)>
    <!ELEMENT tipoInteres (#PCDATA)>
    <!ELEMENT tiposCambio (#PCDATA)>
    <!ELEMENT nombre (#PCDATA)>
    <!ELEMENT valorDeseado (#PCDATA)>
    <!ELEMENT valorMaximo (#PCDATA)>
    <!ELEMENT valorMinimo (#PCDATA)>
    <!ELEMENT paisProcedencia (#PCDATA)>
    <!ELEMENT mercado (#PCDATA)>
    <!ELEMENT producto (#PCDATA)>
]>

<listado>
    <futuro precio="100">
        <producto></producto>
        <mercado/>
    </futuro>
    <divisa precio="200" estable="1">
        <nombre></nombre>
        <tiposCambio></tiposCambio>
    </divisa>
    <bono precio="300" estable="1">
        <paisProcedencia></paisProcedencia>
        <valorDeseado></valorDeseado>
        <valorMinimo></valorMinimo>
        <valorMaximo></valorMaximo>
    </bono>
    <letra precio="400">
        <tipoInteres></tipoInteres>
        <paisEmisor>
            <Alemania></Alemania>
        </paisEmisor>
    </letra>
</listado>
```

## Ejercicio 27

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Tenemos una empresa que tiene trabajores.
Un trabajador puede ser jefe o empleado
y todo empleado debe tener asignado uno o varios jefes -->

<!DOCTYPE empresa [
    <!ELEMENT empresa (trabajadores)>
    <!ELEMENT trabajadores (jefes | empleados)*>
    <!ELEMENT jefes (#PCDATA)>
    <!ELEMENT empleados (#PCDATA)>
    <!ATTLIST jefes codigo ID #REQUIRED>
    <!ATTLIST empleados codigo IDREFS #REQUIRED>
]>

<empresa>
    <trabajadores>
        <jefes codigo="C001">Manuel</jefes>
        <jefes codigo="C002">Paco</jefes>
        <empleados codigo="C001 C002">Jose</empleados>
    </trabajadores>
</empresa>
```