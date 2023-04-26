# Markup A3 - XML: XSD

<p align="center">
  <img src="/img/Markup/ud3-esquema_tipos_xsd.png" alt="esquema_tipos_XSD" width="900"/>
</p>

<hr>

## 1. simpleType

### Ejercicio 1

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="edadTrabajador" type="xs:integer"/>
</xs:schema>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<edadTrabajador
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej01_validador.xsd"
>31</edadTrabajador>
```


### Ejercicio 2

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <!-- <xs:element name="peso" type="xs:double"/> -->
    <xs:element name="peso" type="tipoPeso"/>
    <xs:simpleType name="tipoPeso">
        <xs:restriction base="xs:double">
            <xs:minInclusive value="0"/>
            <xs:maxInclusive value="255"/>
        </xs:restriction>
    </xs:simpleType>
</xs:schema>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<peso
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej02_validador.xsd"
>28.88</peso>
```

### Ejercicio 3

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

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Crea un esquema que permita validar un único elemento dni
que valide el patrón de 8 cifras + letra que suelen tener los DNI en España. -->

<dni
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej03_validador.xsd"
>12345678J</dni>
```

### Ejercicio 4

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xs:element name="pago" type="tipoPago"/>      
    <xs:simpleType name="tipoPago">
        <xs:restriction base="xs:integer">
            <xs:minExclusive value="0"/>
            <xs:maxExclusive value="3000"/>
        </xs:restriction>
    </xs:simpleType>
</xs:schema>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Valida un elemento pago en el cual puede haber
cantidades enteras de entre 0 y 3000 euros (NO INCLUIDOS). -->

<pago
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej04_validador.xsd"
>2000</pago>
```

### Ejercicio 5

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="matricula" type="tipoMatricula"/>
    <xs:simpleType name="tipoMatricula">
        <xs:restriction base="xs:string">
            <xs:pattern value="[0-9]{4}[A-Z]{3}"/>
        </xs:restriction>
    </xs:simpleType>
</xs:schema>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Valida una matricula de un coche según un
patrón de 4 dígitos seguidos de 3 letras mayúsculas -->

<matricula
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej05_validador.xsd"
>1234ABC</matricula>
```

### Ejercicio 6

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="mes" type="tipoMes"/>
    <xs:simpleType name="tipoMes">
        <xs:restriction base="xs:string">
            <xs:pattern value="(
                Enero|Febrero|Marzo|Abril|Mayo|Junio|Julio|
                Agosto|Septiembre|Octubre|Noviembre|Diciembre)"/>
            <!-- <xs:enumeration value="Enero"/>
            <xs:enumeration value="Febrero"/>
            <xs:enumeration value="Marzo"/>
            ...
            <xs:enumeration value="Diciembre"/> -->
        </xs:restriction>
    </xs:simpleType>
</xs:schema>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>  

<!-- Crea un esquema que permita validar los meses del año. -->

<mes
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej06_validador.xsd"
>Marzo</mes>
```

### Ejercicio 7

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="fecha" type="tipoFecha"/>
    <xs:simpleType name="tipoFecha">
        <xs:restriction base="xs:date">
            <xs:minInclusive value="1000-01-01"/>
            <xs:maxInclusive value="2999-12-31"/>
        </xs:restriction>
        <!-- <xs:restriction base="xs:string">
            <xs:pattern value="([0-2][0-9]|3[0-1])/(0[1-9]|1[0-2])/([1-2][0-9]{3})"/>
        </xs:restriction> -->
    </xs:simpleType>
</xs:schema>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Valida la fecha en formato dd/mm/aaaa, estando
el dia entre 1-31, el mes 1-12 y año 1000-2999 -->

<fecha
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej07_validador.xsd"
>2012-12-12</fecha>
<!-- >12/12/2012</fecha> -->

<!-- REWORKED WRONGFUL EXERCISE -->
```

<hr>

## 2. complexType: simpleContent

### Ejercicio 8

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="persona" type="tipoPersona"/>
    <xs:complexType name="tipoPersona">
        <xs:simpleContent>
            <xs:extension base="xs:string">
                <xs:attribute name="edad" type="xs:integer"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>
</xs:schema>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Valida la edad de una persona, donde
'persona' es el elemento y la 'edad' su atributo. -->

<persona
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej08_validador.xsd"
edad="28"
>Pablo</persona>
```

### Ejercicio 9

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="numero" type="tipoNumero"/>
    <xs:complexType name="tipoNumero">
        <xs:simpleContent>
            <xs:extension base="xs:integer">
                <xs:attribute name="primo" type="xs:boolean"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>
</xs:schema>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Valida si un número es primo. El elemento es número
y el atributo es primo. Tomará los valores verdadero o falso. -->

<numero
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej09_validador.xsd"
primo="true"
>13</numero>
```

### Ejercicio 10

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

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Valida la fecha de un aniversario.
El elemento es aniversario y el atributo fecha. -->

<aniversario
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej10_validador.xsd"
fecha="2023-02-14"
>San Valentin</aniversario>
```

### Ejercicio 11

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

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Valida el elemento persona
con los atributos nombre y sexo. -->

<persona
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej11_validador.xsd"
nombre="Müge" sexo="F"
>aquella mujer</persona>
```

### Ejercicio 12

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

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Validar el elemento coche con los atributos color y kilometros. -->

<coche
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej12_validador.xsd"
color="rojo" kilometros="50000"
>Corsa</coche>
```

### Ejercicio 13

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="curso" type="tipoCurso"/>
    <xs:simpleType name="restriccionCurso">
        <xs:restriction base="xs:string">
            <xs:pattern value="(ASIR|DAW|DAM)"></xs:pattern>
            <!-- <xs:enumeration value="ASIR"/>
            <xs:enumeration value="DAW"/>
            <xs:enumeration value="DAM"/> -->
        </xs:restriction>
    </xs:simpleType>
    <xs:complexType name="tipoCurso">
        <xs:simpleContent>
            <xs:extension base="xs:string">
                <xs:attribute name="anyo" type="xs:integer"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>
</xs:schema>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Valida el elemento curso,
que debe tomar solo los valores "DAW", "DAM", "ASIR"
y tiene el atributo obligatorio año (entero) -->

<curso
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej13_validador.xsd"
anyo="2023"
>ASIR</curso>
```

### Ejercicio 14

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="codigo" type="tipoCodigo"/>
    <xs:simpleType name="restrictCodigo">
        <xs:restriction base="xs:string">
            <xs:pattern value="[A-Z]{2}[0-9]{2}[A-Z|a-z]{3}"/>
        </xs:restriction>
    </xs:simpleType>
    <xs:complexType name="tipoCodigo">
        <xs:simpleContent>
            <xs:extension base="restrictCodigo">
                <xs:attribute name="sede" type="xs:string"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>
</xs:schema>
```

```xml
<?xml version="1.0" encoding="UTF-8"?> 

<!-- Validar un solo elemento llamado codigo. Dentro hay
una cadena rígida: 2 mayúsculas, 2 cifras, 3 letras.
Atributo "sede" que será de tipo cadena. -->

<codigo
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej14_validador.xsd"
sede="Budapest"
>AB12xyZ</codigo>
```

### Ejercicio 15

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="matriculaCoche" type="tipoMatricula"/>
    <xs:simpleType name="restrictMatricula">
        <xs:restriction base="xs:string">
            <xs:pattern value="[0-9]{4}-[A-Z]{3}"/>
        </xs:restriction>
    </xs:simpleType>
    <xs:complexType name="tipoMatricula">
        <xs:simpleContent>
            <xs:extension base="restrictMatricula">
                <xs:attribute use="optional" name="color" type="xs:string"/>
                <xs:attribute use="optional" name="numPuertas" type="restrictNumPuertas"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>
    <xs:simpleType name="restrictNumPuertas">
        <xs:restriction base="xs:integer">
            <xs:pattern value="2|4"/>
            <!-- <xs:enumeration value="2"/>
            <xs:enumeration value="4"/> -->
        </xs:restriction>
    </xs:simpleType>
</xs:schema>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Validar el elemento matriculaCoche que tiene el
patrón de 4 dígitos, un guión y 3 letras. Además,
atributos optativos color y numPuertas (2 o 4) -->

<matriculaCoche
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej15_validador.xsd"
color="rojo" numPuertas="4"
>1234-ABC</matriculaCoche>
```

### Ejercicio 16

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="codigoEmpleado" type="tipoCodigo"/>
    <xs:simpleType name="restrictCodigo">
        <xs:restriction base="xs:string">
            <xs:pattern value="[3-6]{2}AB"/>
        </xs:restriction>
    </xs:simpleType>
    <xs:complexType name="tipoCodigo">
        <xs:simpleContent>
            <xs:extension base="restrictCodigo">
                <xs:attribute name="cargo" type="restrictCargo"/>
                <xs:attribute name="numEmpleadosCargo" type="restrictNumEmpleados"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>
    <xs:simpleType name="restrictCargo">
        <xs:restriction base="xs:string">
            <xs:pattern value="Junior|Senior|Analista"/>
        </xs:restriction>
    </xs:simpleType>
    <xs:simpleType name="restrictNumEmpleados">
        <xs:restriction base="xs:integer">
            <xs:minInclusive value="0"/>
            <xs:maxInclusive value="10"/>
        </xs:restriction>
    </xs:simpleType>
</xs:schema>
```
```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Valida el elemento codigoEmpleado que tiene el patrón
de 2 dígitos que pueden ir del 3 al 6 seguidos de la cadena AB.
Atributos 'cargo' ("Junior", "Senior o "Analista") 
y 'numEmpleadosCargo' entre 0 y 10. -->

<codigoEmpleado
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej16_validador.xsd"
cargo="Senior" numEmpleadosCargo="2"
>63AB</codigoEmpleado>
```

<hr>

## 3. complexType: complexContent

### Ejercicio 17

- ...

### Ejercicio 18

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="cliente" type="tipoCliente"/>
    <xs:complexType name="tipoCliente">
        <xs:complexContent>
            <xs:restriction base="xs:anyType">
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

```xml
<?xml version="1.0" encoding="UTF-8"?>  

<!-- Añade al ejercicio anterior los elementos apellido1, apellido2 y edad -->

<cliente
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej18_validador.xsd"
>   <nombre>Sup</nombre>
    <apellido1>Dawg</apellido1>
    <apellido2>Aye</apellido2>
    <edad>28</edad>
</cliente>
```

### Ejercicio 19

- ...

### Ejercicio 20

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="colegio" type="tipoColegio"/>
    <xs:complexType name="tipoColegio">
        <xs:complexContent>
            <xs:restriction base="xs:anyType">
                <xs:sequence>
                    <xs:element name="director" type="xs:string"/>
                    <xs:element name="jefeDeEstudios" type="xs:string"/>
                    <xs:element maxOccurs="unbounded" name="profesor" type="xs:string"/>
                </xs:sequence>
                <xs:attribute name="nombre" type="xs:string"/>
                <xs:attribute name="numAlumnos" type="xs:integer"/>
            </xs:restriction>
        </xs:complexContent>
    </xs:complexType>
</xs:schema>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Añade al ejercicio anterior el atributo numero de alumnos
y que el elemento profesor se pueda repetir más de una vez
(como mínimo se debe repetir una vez) -->

<colegio
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej20_validador.xsd"
nombre="" numAlumnos="50"
>   <director/>
    <jefeDeEstudios/>
    <profesor/>
    <profesor/>
</colegio>
```

### Ejercicio 21

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="factura" type="tipoFactura"/>
    <xs:simpleType name="restrictCodigo">
        <xs:restriction base="xs:string">
            <xs:pattern value="[A-Z]{3}[0-9]{2}"/>
        </xs:restriction>
    </xs:simpleType>
    <xs:complexType name="tipoFactura">
        <xs:complexContent>
            <xs:restriction base="xs:anyType">
                <xs:sequence>
                    <xs:element name="codigo" type="restrictCodigo"/>
                    <xs:element minOccurs="0" name="fechaFactura" type="xs:date"/>
                    <xs:element name="precio" type="xs:double"/>
                </xs:sequence>
            </xs:restriction>
        </xs:complexContent>
    </xs:complexType>
</xs:schema>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Valora el elemento factura, que contiene
un elemento precio que puede almacenar decimales,
un elemento fechaFactura que es optativo y
un elemento codigo (3 mayúsculas seguidas de dos digitos. -->

<factura
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej22_validador.xsd"
>   <codigo>ABC12</codigo>
    <fechaFactura>2023-02-22</fechaFactura>
    <precio>2.99</precio>
</factura>
```

### Ejercicio 22

```xml
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="compra" type="tipoCompra"/>
    <xs:simpleType name="restrictPeso">
        <xs:restriction base="xs:double">
            <xs:minInclusive value="0"/>
            <xs:maxInclusive value="50"/>
        </xs:restriction>
    </xs:simpleType>
    <xs:complexType name="tipoCompra">
        <xs:complexContent>
            <xs:restriction base="xs:anyType">
                <xs:sequence>
                    <xs:element name="numSerie" type="xs:string"/>
                    <xs:element name="cantidad" type="xs:positiveInteger"/>
                    <xs:element name="nombreRepartidor" type="xs:string"
                        minOccurs="0" maxOccurs="unbounded"/>
                </xs:sequence>
                <xs:attribute name="peso" type="restrictPeso"/>
            </xs:restriction>
        </xs:complexContent>
    </xs:complexType>
</xs:schema>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>

<!-- Valida un elemento compra que contiene un elemento número de serie,
una cantidad que no puede tomar valores negativos,
los nombres de repartidores (varios o ninguno)
y un atributo peso que que puede ser de 0 a 50. -->

<compra
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="ej23_validador.xsd"
peso="20">
    <numSerie>A5920</numSerie>
    <cantidad>1337</cantidad>
    <nombreRepartidor>Sup</nombreRepartidor>
    <nombreRepartidor>Dawg</nombreRepartidor>
</compra>
```