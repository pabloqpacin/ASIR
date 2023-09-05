# Wiki XSD

```xml
<!-- Datatypes to be declared where -->
<xs:element name="foo"
    type="xs:date"
    type="xs:boolean"
    type="xs:string"
    type="xs:double"
    type="xs:integer"
    type="xs:positiveInteger"
>
<xs:restriction
    base="xs:datatype"
>
```
```xml
<!-- 1. simpleType -->
<schema>
    <element name="foo" type="tFoo"/>
    <simpleType name="tFoo">
        <restriction base="datatype">
            <whatever value="something"/>

<!-- 2. complexType: simpleContent -->
<schema>
    <element name="foo" type="tFoo"/>
    <complexType name="tFoo">
        <simpleContent>
            <extension base="datatype">
                <attribute name="bar" type="datatype"/>

<!-- 3. complexType: complexContent -->
<schema>
    <element name="foo" type="tFoo">
    <complexType name="tFoo">
        <complexContent>
            <restriction base="xs:anyType">
                <sequence>
                    <element name="bar" type="datatype"/>
                <attribute name="baz" type="datatype"/>
```
```xml
<!-- 0. Bare XSD -->
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xs:element name="foo" type="xs:datatype"/>
</xs:schema>
```
```xml
<!-- 1. simpleType + common restrictions -->
<xs:element name="foo" type="tipoFoo"/>
<xs:simpleType name="tipoFoo">
    <xs:restriction base="xs:datatype">
        <xs:minExclusive value="0"/>
        <xs:minInclusive value="1"/>
        <xs:maxInclusive value="99"/>
        <xs:maxExclusive value="100"/>
        <xs:minInclusive value="1970-01-01">
        <xs:pattern value="[0-9]{8}[A-Z]{1}"/>
        <xs:pattern value="(fixed1|fixed2)"/>
        <xs:enumeration value="fixed1">
        <xs:enumeration value="fixed2">
    </xs:restriction>
</xs:simpleType>
```
```xml
<!-- 2. complexType: simpleContent -->
<xs:element name="foo" type="tipoFoo"/>
<xs:complexType name="tipoFoo">
    <xs:simpleContent>
        <xs:extension base="xs:datatype-ELEM">
            <xs:attribute name="bar" type="xs:datatype-ATT1"/>
            <xs:attribute name="baz" type="xs:datatype-ATT2"/>
        </xs:extension>
    </xs:simpleContent>
</xs:complexType>

<!-- Valid XML -->
<?xml version="1.0" encoding="UTF-8"?>
<foo
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:noNamespaceSchemaLocation="myfile.xsd"
bar="datatype" baz="z"
>x</foo>

<!-- RESTRICTIONS!! -->
<xs:element name="foo" type="tipoFoo"/>
<xs:simpleType name="restrictFoo">
    <xs:restriction base="xs:datatype-ELEM">
        <xs:pattern value="x|y"/>
    </xs:restriction>
</xs:simpleType>
<xs:complexType name="tipoFoo">
    <xs:simpleContent>
        <xs:extension base="restrictFoo">
            <xs:attribute name="bar" type="xs:datatype-ATT1"/>
            <xs:attribute use="optional" name="baz" type="restrictBaz"/>
        </xs:extension>
    </xs:simpleContent>
    <xs:simpleType name="restrictBaz">
        <xs:restriction base="xs:datatype-ATT2">
            <xs:pattern value="z|a"/>
        </xs:restriction>
    </xs:simpleType>
</xs:complexType>
```
```xml
<!-- 3. complexType: complexContent -->
<element name="foo" type="tipoFoo">
<xs:complexType name="tipoFoo">
    <xs:complexContent>
        <xs:restriction base="xs:anyType">
            <xs:sequence>
                <xs:element maxOccurs="unbounded" name="bar" type="xs:datatype"/>
                <xs:element minOccurs="0" name="baz" type="xs:datatype"/>
            </xs:sequence>
            <xs:attribute name="sum" type="xs:datatype">
        </xs:restriction>
    </xs:complexContent>
</xs:complexType>
```
```xml
<!-- REGEX SHOWCASE -->
<!-- DNI: 12345678J -->
<xs:pattern value="[0-9]{8}[A-Z]{1}"/>
<!-- Matrícula: 1234ABC -->
<xs:pattern value="[0-9]{4}[A-Z]{3}"/>
<!-- AB12xyZ -->
<xs:pattern value="[A-Z]{2}[0-9]{2}[A-Z|a-z]{3}"/>
<!-- Date (BAD IDEA!) -->
<xs:pattern value="
    ([0-2][0-9]|3[0-1])/
    (0[1-9]|1[0-2])/
    ([1-2][0-9]{3})"/>
```