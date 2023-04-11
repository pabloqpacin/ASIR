# Markup A3 - XML: XSD



## Ejercicio 1

```xml
<?xml version="1.0" encoding="UTF-8"?>

<edadTrabajador
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

xsi:noNamespaceSchemaLocation="ej1_validador.xsd"
>31
</edadTrabajador>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xs:element name="edadTrabajador" type="xs:integer"/>

</xs:schema>
```


## Ejercicio 2

```xml
<?xml version="1.0" encoding="UTF-8"?>


<!-- <peso>28.88</peso> -->
<!--IE. Elemento Simple-->

<!--ahora a validar-->


<peso xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej2_validador.xsd"
>28.88</peso>

```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <!-- <xs:element name="peso" type="xs:double"/> -->
    <xs:element name="peso" type="tipoPeso"/>

    <xs:simpleType name="tipoPeso">
        <xs:restriction base="xs:double">
            <xs:minInclusive value="0"/>
            <xs:maxInclusive value="1000"/>
        </xs:restriction>
    </xs:simpleType>


</xs:schema>
```

## Ejercicio 3

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Crea un esquema que permita validar un único elemento dni
que valide el patrón de 8 cifras + letra que suelen tener los DNI en España. -->

<dni xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej3_validador.xsd"

>12345678H</dni>

<!-- xsd = elemento SIMPLE -->
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xs:element name="dni" type="tipoDNI"/>

<xs:simpleType name="tipoDNI">
    <xs:restriction base="xs:string">
    <xs:pattern value="[0-9]{8}[A-Z]{1}"/>

    </xs:restriction>
</xs:simpleType>


</xs:schema>
```

## Ejercicio 4

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Crea un esquema que permita validar un elemento pago
en el cual puede haber cantidades
enteras de entre 0 y 3000 euros (NO INCLUIDOS). -->

<pago xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej4_validador.xsd"
>2000</pago>
```

```xml

<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xs:element name="pago" type="tipoPAGO"/>
        
    <xs:simpleType name="tipoPAGO">
            
        <xs:restriction base="xs:integer">
            <xs:minExclusive value="0"/>
            <xs:maxExclusive value="3000"/>

        </xs:restriction>

    </xs:simpleType>

</xs:schema>
```

## Ejercicio 5

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Crea un esquema que permita validar una matricula
de un coche que valide el patrón de
4 dígitos seguidos de 3 letras mayúsculas . -->

<matricula xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej5_validador.xsd"
>1234ABC</matricula>

```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xs:element name="matricula" type="tipoMatricula">
</xs:element>

<xs:simpleType name="tipoMatricula">
    <xs:restriction base="xs:string">
        <xs:pattern value="[0-9]{4}[A-Z]{3}"/>
    </xs:restriction>
</xs:simpleType>

</xs:schema>
```

## Ejercicio 6

```xml
<?xml version="1.0" encoding="UTF-8"?>  

<!-- Crea un esquema que permita validar los meses del año. -->

<mes xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej6_validador.xsd"
>Febrero</mes>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xs:element name="mes" type="tipoMes"/>

    <xs:simpleType name="tipoMes">
        <xs:restriction base="xs:string">
            <xs:enumeration value="Enero"/>
            <xs:enumeration value="Febrero"/>
            <xs:enumeration value="Marzo"/>
            <xs:enumeration value="Abril"/>
            <xs:enumeration value="Mayo"/>
            <xs:enumeration value="Junio"/>
            <xs:enumeration value="Julio"/>
            <xs:enumeration value="Agosto"/>
            <xs:enumeration value="Septiembre"/>
            <xs:enumeration value="Octubre"/>
            <xs:enumeration value="Noviembre"/>
            <xs:enumeration value="Diciembre"/>
            <xs:pattern value="(Enero|Febrero|Marzo|Diciembre)"></xs:pattern>
        </xs:restriction>
    </xs:simpleType>

</xs:schema>
```

## Ejercicio 7

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!--
Crea un esquema que permita validar la fecha en formato. dd/mm/aaaa
Estando el dia entre 1-31, el mes 1-12 y anyo 1000-2999
-->

<fecha xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej7_validador.xsd"

>12/12/2012</fecha>
```

```xml

<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

<xs:element name="fecha" type="tipoFecha"/>

<xs:simpleType name="tipoFecha">
    <!-- not INT but STRING-->
    <xs:restriction base="xs:string">
        <xs:pattern value="([0-2][0-9]|3[0-1])/(0[1-9]|1[0-2])/([1-2][0-9]{3})"/>

    </xs:restriction>
</xs:simpleType>


</xs:schema>
```

## Ejercicio 8

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!--
Se desea crear un esquema que permita validar la edad de una persona.
Donde el elemento es persona y el atributo edad 
-->

<persona xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej8_validador.xsd"

edad="27">Pablo</persona>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <xs:element name="persona" type="tipoPersona"/>

    <xs:complexType name="tipoPersona">
        <xs:simpleContent>
            <xs:extension base="xs:string">
                <xs:attribute name="edad" type="xs:integer"></xs:attribute>
            </xs:extension>
        </xs:simpleContent>

    </xs:complexType>

</xs:schema>
```

## Ejercicio 9

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!--
Se desea crear un esquema que permita validar si un numero es primo.
Donde el elemento es numero y el atributo es Primo.
Tomará los valores verdadero o falso.
-->

<numero xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej9_validador.xsd"

esPrimo="true">12</numero>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="numero" type="tipoNumero"/>

    <xs:complexType name="tipoNumero">
        <xs:simpleContent>
            <xs:extension base="xs:integer">
                <xs:attribute name="esPrimo" type="xs:boolean"></xs:attribute>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>

</xs:schema>
```

## Ejercicio 10

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!--
Se desea crear un esquema que permita validar la fecha de un aniversario.
Donde el elemento es aniversario y el atributo fecha.
-->

<aniversario xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej10_validador.xsd"

fecha="2023-02-14">San Valentin</aniversario>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="aniversario" type="tipoAniversario"/>

    <xs:complexType name="tipoAniversario">
        <xs:simpleContent>
            <xs:extension base="xs:string">
                <xs:attribute name="fecha" type="xs:date"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>
</xs:schema>
```

## Ejercicio 11

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!--
Se desea crear un esquema que permita validar el elemento persona
que tiene los atributos nombre y sexo.
-->

<persona xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej11_validador.xsd"

nombre="Pablo" sexo="M">p1</persona>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="persona" type="tipoPersona"/>

    <xs:complexType name="tipoPersona">
        <xs:simpleContent>
            <xs:extension base="xs:string">
                <xs:attribute name="nombre" type="xs:string"/>
                <xs:attribute name="sexo" type="xs:string"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>

</xs:schema>
```

## Ejercicio 12

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!--
Se desea crear un esquema que permita validar el elemento coche
que tiene los atributos color y kilometros.
-->

<coche xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej12_validador.xsd"

color="rojo" kilometros="50000">Corsa</coche>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="coche" type="tipoCoche"/>

    <xs:complexType name="tipoCoche">
        <xs:simpleContent>
            <xs:extension base="xs:string">
                <xs:attribute name="color" type="xs:string"/>
                <xs:attribute name="kilometros" type="xs:integer"/>
            </xs:extension>
        </xs:simpleContent>

    </xs:complexType>

</xs:schema>
```

## Ejercicio 13

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- 
Se desea crear un esquema que permita validar el elemento curso
que debe tomar solo los valores "DAW", "DAM", "ASIR"
y tiene el atributo obligatorio año (entero)
-->

<curso
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej13_validador.xsd"

anyo="2023"
>ASIR</curso>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="curso" type="tipoCurso"/>


    <xs:complexType name="tipoCurso">
        <xs:simpleContent>
            <xs:extension base="restriccionCurso">
                <xs:attribute name="anyo" type="xs:integer"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>

    <xs:simpleType name="restriccionCurso">
        <xs:restriction base="xs:string">
            <!-- 1. -->
            <xs:enumeration value="ASIR"/>
            <xs:enumeration value="DAW"/>
            <xs:enumeration value="DAM"/>
            <!-- 2. -->
            <xs:pattern value="ASIR|DAW|DAM"></xs:pattern>
        </xs:restriction>
    </xs:simpleType>


</xs:schema>
```

## Ejercicio 14

```xml
<?xml version="1.0" encoding="UTF-8"?> 

<!-- 
Se necesita tener un esquema que valide
un fichero en el que hay un solo elemento llamado codigo.
Dentro de código hay una cadena con una estructura rígida:
2 letras mayúsculas, seguidas de 2 cifras, seguidas a su vez de 3 letras.
El elemento código debe llevar un atributo "sede" que será de tipo cadena. 
-->

<codigo xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej14_validador.xsd"

sede="Madrid"
>AB12xyZ</codigo>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="codigo" type="tipoCodigo"/>

    <xs:complexType name="tipoCodigo">
        <xs:simpleContent>
            <xs:extension base="restriccionCodigo">
                <xs:attribute name="sede" type="xs:string"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>


    <xs:simpleType name="restriccionCodigo">
        <xs:restriction base="xs:string">
            <xs:pattern value="[A-Z]{2}[0-9]{2}[A-Za-z]{3}"/> <!--permite intercalar-->
        </xs:restriction>
    </xs:simpleType>

</xs:schema>
```

## Ejercicio 15

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- 
Se desea crear un esquema que permita validar el elemento matriculaCoche
que tiene el patrón de 4 dígitos, seguidos de un guión y seguidos 3 letras.
Además este elemento tiene los atributos color y el atributo numPuertas
cuyo valor solo podrá ser 2 y 4; ambos atributos son optativos.
-->

<matriculaCoche
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej15_validador.xsd"

color="rojo" numPuertas="4"
>1234-ABC</matriculaCoche>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="matriculaCoche" type="tipoMatriculaCoche"/>

    <xs:complexType name="tipoMatriculaCoche">
        <xs:simpleContent>
            <xs:extension base="restriccionMC">
                <xs:attribute name="color" type="xs:string" use="optional"/>
                <xs:attribute name="numPuertas" type="restriccionNP" use="optional"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>

    <xs:simpleType name="restriccionMC">
        <xs:restriction base="xs:string">
            <xs:pattern value="[0-9]{4}-[A-Z]{3}"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="restriccionNP">
        <xs:restriction base="xs:integer">
            <xs:enumeration value="2"/>
            <xs:enumeration value="4"/>
        </xs:restriction>

    </xs:simpleType>

</xs:schema>
```

## Ejercicio 16

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- 
Se desea crear un esquema que permita validar el elemento codigoEmpleado
que tiene el patrón de 2 dígitos que pueden ir del 3 al 6
seguidos de la cadena AB. Además este elemento tiene
los atributos cargo cuyo valor solo podrá ser "Junior", "Senior o "Analista"
y el atributo numEmpleadosCargo haciendo referencia al numero de empleados
que tiene ese empleado a su cargo, este atributo
puede estar en el rango de valores de entre 0 y 10. 
-->

<codigoEmpleado
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej16_validador.xsd"

cargo="Senior" numEmpleadosCargo="2"
>36AB</codigoEmpleado>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="codigoEmpleado" type="tipoCE"/>

    <xs:complexType name="tipoCE">
        <xs:simpleContent>
            <xs:extension base="restriccionCE">
                <xs:attribute name="cargo" type="restriccionCargo"/>
                <xs:attribute name="numEmpleadosCargo" type="restriccionNEC"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>


    <xs:simpleType name="restriccionCE">
        <xs:restriction base="xs:string">
            <xs:pattern value="[3-6]{2}AB"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="restriccionCargo">
        <xs:restriction base="xs:string">
            <xs:enumeration value="Junior"/>
            <xs:enumeration value="Senior"/>
            <xs:enumeration value="Analista"/>
            <xs:pattern value="Junior|Senior|Analista"/>
        </xs:restriction>
    </xs:simpleType>

    <xs:simpleType name="restriccionNEC">
        <xs:restriction base="xs:integer">
            <xs:minInclusive value="0"/>
            <xs:maxInclusive value="10"/>
        </xs:restriction>

    </xs:simpleType>

</xs:schema>
```

## Ejercicio 17

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- 
Elabora un documento XML que almacene la información de un cliente.
Dicho cliente tiene un elemento nombre.
Se desea crear un esquema que permita validar el documento XML.
-->

<cliente

xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej17_validador.xsd"
>
    <nombre>Nelson</nombre>
</cliente>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="cliente" type="tipoCliente"/>

    <xs:complexType name="tipoCliente">
        <xs:complexContent>
            <xs:restriction base="xs:anyType"> <!--PORQUE NO TIENE CONTENIDO SINO HIJOS-->
                <xs:sequence>
                    <xs:element name="nombre" type="xs:string"/>
                </xs:sequence>
            </xs:restriction>
        </xs:complexContent>
    </xs:complexType>

</xs:schema>
```

## Ejercicio 18

```xml
<?xml version="1.0" encoding="UTF-8"?>  

<!-- 
Añade al ejercicio anterior el elemento apellido1, apellido2
y edad del cliente 
-->

<cliente

xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej18_validador.xsd"
>
    <nombre>Nelson</nombre>
    <apellido1>Pérez</apellido1>
    <apellido2>Varona</apellido2>
    <edad>31</edad>
</cliente>

```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="cliente" type="tipoCliente"/>

    <xs:complexType name="tipoCliente">
        <xs:complexContent>
            <xs:restriction base="xs:anyType"> <!--PORQUE NO TIENE CONTENIDO SINO HIJOS-->
                <xs:sequence>
                    <xs:element name="nombre" type="xs:string"/>
                    <xs:element name="apellido1" type="xs:string"/>
                    <xs:element name="apellido2" type="xs:string"/>
                    <xs:element name="edad" type="xs:integer"/>
                </xs:sequence>
            </xs:restriction>
        </xs:complexContent>
    </xs:complexType>

</xs:schema>
```

## Ejercicio 19

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- 
Elabora un documento XML que almacene la información
de los trabajadores de un colegio.
El colegio tiene elemento director, jefe de estudios y profesor.
Además tiene un atributo nombre.
Crea un esquema que permita validar el documento XML.
-->


<colegio nombre=""

xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej19_validador.xsd"
>
    <director></director>
    <jefeDeEstudios></jefeDeEstudios>
    <profesor></profesor>
</colegio>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="colegio" type="tipoColegio"/>

    <xs:complexType name="tipoColegio">
        <xs:complexContent>
            <xs:restriction base="xs:anyType">
                <xs:sequence>
                    <xs:element name="director" type="xs:string"/>
                    <xs:element name="jefeDeEstudios" type="xs:string"/>
                    <xs:element name="profesor" type="xs:string"/>
                </xs:sequence>
                <xs:attribute name="nombre" type="xs:string"/>
            </xs:restriction>
        </xs:complexContent>
    </xs:complexType>

</xs:schema>
```

## Ejercicio 20

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!--
Añade al ejercicio anterior
el atributo numero de alumnos al colegio
y que el elemento profesor se pueda repetir más de una vez
(como mínimo se debe repetir una vez)
-->

<colegio nombre="" numAlumnos="20"

xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej20_validador.xsd"
>
    <director></director>
    <jefeDeEstudios></jefeDeEstudios>
    <profesor></profesor>
    <profesor></profesor>
</colegio>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="colegio" type="tipoColegio"/>

    <xs:complexType name="tipoColegio">
        <xs:complexContent>
            <xs:restriction base="xs:anyType">
                <xs:sequence>
                    <xs:element name="director" type="xs:string"/>
                    <xs:element name="jefeDeEstudios" type="xs:string"/>
                    <xs:element name="profesor" type="xs:string" maxOccurs="unbounded" />
                </xs:sequence>
                <xs:attribute name="nombre" type="xs:string"/>
                <xs:attribute name="numAlumnos" type="xs:integer"/>
            </xs:restriction>
        </xs:complexContent>
    </xs:complexType>

</xs:schema>
```

## ~~Ejercicio 21~~


## Ejercicio 22

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- 
Elabora un documento XML que almacene la información de una factura.
El elemento factura tiene un elemento precio que puede almacenar decimales,
tiene un elemento fechaFactura que es optativo y
tiene un elemento codigo que debe comenzar
por tres letras mayusculas seguidas de dos digitos.
Crea un esquema que permita validar el documento XML.
-->


<factura

xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej22_validador.xsd"
>
    <precio>2.99</precio>
    <fechaFactura>2023-02-22</fechaFactura>
    <codigo>ABC12</codigo>
</factura>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="factura" type="tipoFactura"/>

    <xs:complexType name="tipoFactura">
        <xs:complexContent>
            <xs:restriction base="xs:anyType">
                <xs:sequence>
                    <xs:sequence>
                        <xs:element name="precio" type="xs:double"/>
                        <xs:element name="fechaFactura" type="xs:date" minOccurs="0" />
                        <xs:element name="codigo" type="tipoCodigo"/>
                    </xs:sequence>
                </xs:sequence>
            </xs:restriction>
        </xs:complexContent>
    </xs:complexType>


    <xs:simpleType name="tipoCodigo">
        <xs:restriction base="xs:string">
            <xs:pattern value="[A-Z]{3}[0-9]{2}"/>
        </xs:restriction>
    </xs:simpleType>

</xs:schema>
```

## Ejercicio 23

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!--
Crear un XML para unos diseñadores que realizan una
aplicación de compras donde cada compra tiene un número de serie,
una cantidad que no puede tomar valores negativos,
los nombres de repartidores que pueden ser o varios o ninguno (de cero a muchos)
y el elemento compra tiene un atributo peso
que puede tomar los valores desde 0 a 50. 
-->

<compra peso="20"

xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej23_validador.xsd"
>
    <numSerie>5</numSerie>
    <cantidad>4</cantidad>
    <nombreRep>Sup</nombreRep>
    <nombreRep>Dawg</nombreRep>
</compra>
```

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="compra" type="tipoCompra"/>

    <xs:complexType name="tipoCompra">
        <xs:complexContent>
            <xs:restriction base="xs:anyType">
                <xs:sequence>
                    <xs:element name="numSerie" type="xs:integer"/>
                    <xs:element name="cantidad" type="xs:positiveInteger"/>
                    <xs:element name="nombreRep" type="xs:string" minOccurs="1" maxOccurs="unbounded" />
                </xs:sequence>
                <xs:attribute name="peso" type="tipoPeso"></xs:attribute>
            </xs:restriction>
        </xs:complexContent>
    </xs:complexType>

    <xs:simpleType name="tipoPeso">
        <xs:restriction base="xs:double">
            <xs:minInclusive value="0"/>
            <xs:maxInclusive value="50"/>
        </xs:restriction>
    </xs:simpleType>

</xs:schema>
```

