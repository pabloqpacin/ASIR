# Markup A: XML DTD XSD

## Campus Virtual

- **UD1: XML**
  - Teoría
    - ud1-historia
    - ud1-teoria
  - Cuestionario
- **UD2: DTD**
  - Teoría
    - ud2-teoria
    - ud2-guia
  - Actividades UD1+UD2 [27]
  - Cuestionario
<!-- - Material complementario
  - @w3schools: [DTD Tutorial](https://www.w3schools.com/xml/xml_dtd_intro.asp)
  - [DTD ikastaroak](https://ikastaroak.birt.eus/edu/argitalpen/backupa/20200331/1920k/es/ASIRDAMDAW/LMSGI/LMSGI04/es_ASIRDAMDAW_LMSGI04_Contenidos/website_index.html) -->
- **UD3: XSD**
  - Teoría
    - ud3-teoria
  - Actividades [22]
  - Cuestionario

### Actividades

> - Actividades 1 - [XML DTD](/Markup/a-XML_DTD_XSD/XML_DTD/)
> - [XSD Cheatsheet!!](/Markup/a-XML_DTD_XSD/XSD_XML/wiki_XSD.md)
> - Actividades 2 - [XSD XML](/Markup/a-XML_DTD_XSD/XSD_XML/)


### Cuestionarios

| index | cuestionario_UD1 |
| ---   | :-- |
| Q1    | En la linea `<?xml version="1.0" encoding="UTF-8" standalone=“yes”?>`
| A1    | — encoding: Indica la codificación en la que está escrito el documento: UTF-8. <br> — version: Indica la versión XML que estamos usando: XML 1.0. <br> — standalone: Es opcional e indica si existe un documento DTD.
| Q2    | En XML en cuánto a las marcas o etiquetas...
| A2    | — El formato de las marcas es: <nombre_elemento atributos_opcionales> … contenido … </nombre_elemento> <br> — Sirven para delimitar a todo elemento que compone un documento tipo XML. <br> — Cada elemento de XML, va a quedar delimitado por una marca inicial y otra final.
| Q3    | La estructura de un documento XML está compuesta por:
| A3    | — Prólogo(opcional), Cuerpo(obligatorio) y Epílogo(opcional).
| Q4    | Los Atributos XML...
| A4    | — Nos permiten especificar datos adicionales de los elementos, y pueden formar parte de la marca inicial del elemento. <br> — Solo se pueden colocar en etiquetas de apertura.
| Q5    | XML...
| A5    | — Permite la creación de etiquetas propias, y también asignar atributos a esas etiquetas. <br> — se almacena en formato de texto (no binario). <br> — Trabaja con los llamados DTD (definición de tipo de documento), que contienen la estructura de los datos.
| Q6    | El prólogo en un fichero XML:
| A6    | — Es opcional.
| Q7    | Los comentarios en el código de un fichero XML, se indican de la siguiente forma:
| A7    | — `<!-- Ésto es un comentario -->`
| Q8    | Los atributos de un elemento los podemos indicar de la siguiente forma:
| A8    | — `<nombreElemento nombreAtributo="valorAtributo"/>`
| Q9    | Un fichero XML está **bien formado** cuando el fichero:
| A9    | — No tiene errores de sintaxis.
| Q10   | El estado de fichero XML es válido cuando:
| A10   | — Cumple las reglas establecidas en el DTD.

<hr>

| index | cuestionario_UD2 |
| ---   | :-- |
| Q1    | En cuánto a la definición de atributos dentro del contenido DTD:
| A1    | — Se define que atributos va a poder tener los elementos. <br> — Se pueden indicar sus valores por defecto. <br> — Se puede indicar el tipo de datos que contendrán (sus posibles valores válidos).
| Q2    | Indicar la afirmación correcta:
| A2    | — "La información estructurada de un archivo XML podrá ser validada de acuerdo con una serie de reglas establecidas en un archivo asociado DTD."
| Q3    | Indicar la afirmación correcta:
| A3    | — Todo elemento permitido en el documento XML, deberá estar declarado en el DTD. <br> — Un documento XML siempre contiene un elemento raíz o elemento documento, que engloba a los demás. Se llama igual al nombre que hay en DOCTYPE. <br> — El DTD permite definir los elementos que se van a poder utilizar en el documento XML.
| Q4    | Para que un documento XML esté bien formado:
| A4    | — Solamente debe haber un elemento raiz. <br> — Los valores de los atributos deben estar delimitados por comillas (simples o dobles).
| Q5    | El símbolo `*` significa que un elemento se puede repetir:
| A5    | — 0 o muchas veces.
| Q6    | La siguiente instrucción `<!ELEMENT letras (a\|b)>` se corresponde con el siguiente XML.
| A6    | — `<letras> a </letras>`
| Q7    | El DTD para especificar que un elemento tiene un atributo se utiliza la propiedad:
| A7    | — `ATTLIST`
| Q8    | El símbolo `+` significa que un elemento se puede repetir:
| A8    | — 1 o muchas veces.
| Q9    | Para especificar que un atributo es obligatorio se utiliza:
| A9    | — `REQUIRED`
| Q10   | El símbolo `?` significa que un elemento se puede repetir:
| A10   | — 0 o una vez.

<hr>

| index | cuestionario_UD3 |
| ---   | :-- |
| Q1    | La sintaxis `required` en referencia a los atributos significa que el atributo es:
| A1    | — "Obligatorio."
| Q2    | Un elemento de tipo `string` se utiliza para almacenar:
| A2    | — Una cadena de caracteres.
| Q3    | La propiedad `pattern`:
| A3    | — Nos permite definir un patrón que se corresponde con una expresión regular dada.
| Q4    | El siguiente elemento `<nombre>Nelson</nombre>` lo representaremos con:
| A4    | — `SimpleType`.
| Q5    | El siguiente elemento `<nombre edad="31">Nelson</nombre>` lo representaremos con:
| A5    | — Ninguna respuesta es correcta (sería `simpleContent`).
| Q6    | La propiedad `enumeration` se utiliza para:
| A6    | — Ninguna es correcta...
| Q7    | Los tipos de datos booleanos (`boolean`):
| A7    | — Toman los valores `true` o `false`.
| Q8    | Un esquema XSD de un fichero XML puede ser de tipo:
| A8    | — `SimpleType` && `ComplexType (simpleContent)` && `ComplexType (complexContent)`
| Q9    | La propiedad `minOccurs` se utiliza para:
| A9    | — Indicar el mínimo de veces que se puede repetir un elemento.
| Q10   | Con la siguiente expresión regular `[A-Z]{1,3}` puedo validar la siguiente cadena:
| A10   | — `A`
