# Markup (a) — XML DTD XSD

## Campus Virtual

- **UD1 — XML**
  - TEORÍA
    - 1.1-XML-teoria.pdf
    - 1.2-XML-evolucion.pdf
  - ACTIVIDADES
    - *clase3 - clase7*
  - [x] Cuestionario
- **UD2 — DTD**
  - TEORÍA
    - 2.1-DTD-teoria.pdf
    - 2.2-DTD-guide.pdf
  - Material complementario
    - [DTD ikastaroak](https://ikastaroak.birt.eus/edu/argitalpen/backupa/20200331/1920k/es/ASIRDAMDAW/LMSGI/LMSGI04/es_ASIRDAMDAW_LMSGI04_Contenidos/website_index.html)
    - [DTD w3schools](https://www.w3schools.com/xml/xml_dtd_intro.asp)
  - ACTIVIDADES
    - *clase8 - clase12*
  - [x] Cuestionario (x2)
- **UD3 — XSD**
  - TEORÍA
    - 3-XSD-teoria.pdf
  - ACTIVIDADES
    - *clase12 - clase16*
  - [x] Cuestionario


## Ejercicios

- Todos disponibles en el directorio [pkg-a](/Markup/a-XML,DTD,XSD/pkg/readme.md)


## Cuestionarios

<details>

### UD1.1

| .   | -
| --- | ---
| Q1  | En la linea `<?xml version="1.0" encoding="UTF-8" standalone=“yes”?>`
| A1  | — xml==version encoding==codificacion standalone="Es opcional e indica si existe un documento DTD"
| Q2  | En XML en cuánto a las marcas o etiquetas...
| A2  | — (todas)
| Q3  | La estructura de un documento XML esta compuesta por:
| A3  | — Prólogo(*OPCIONAL*), Cuerpo(obligatorio) y **Epílogo(opcional)**.
| Q4  | Los Atributos XML...
| A4  | — Nos permiten especificar datos adicionales de los elementos, y pueden formar parte de la marca inicial del elemento. + Solo se pueden colocar en etiquetas de apertura
| Q5  | XML...
| A5  | — Permite la creación de etiquetas propias, y también asignar atributos a esas etiquetas. + se almacena en formato de texto (no binario). + Trabaja con los llamados DTD (definición de tipo de documento), que contienen la estructura de los datos.
| Q6  | El prólogo en un fichero XML:
| A6  | — Es *OPCIONAL*
| Q7  | Los comentarios en el código de un fichero XML, se indican de la siguiente forma:
| A7  | — `<!-- Ésto es un comentario -->`
| Q8  | Los atributos de un elemento los podemos indicar de la siguiente forma:
| A8  | — `<nombre_del_elemento nombre_del_atributo = "valor_del_atributo"/>`
| Q9  | Un fichero XML está bien formado cuando el fichero:
| A9  | — No tiene errores de sintaxis
| Q10 | El estado de fichero XML es válido cuando:
| A10 | — Cumple las reglas establecidas en el DTD.


### UD2.1

| .   | -
| --- | ---
| Q1  | En cuánto a la definición de atributos dentro del contenido DTD:
| A1  | — Se define que atributos va a poder tener los elementos + Se pueden indicar sus valores por defecto. + Se puede indicar el tipo de datos que contendrán (sus posibles valores válidos).
| Q2  | Indicar la afirmación correcta:
| A2  | — ... xml válido = cumplir con DTD {**no necesariamente, podría ser via XSD**}
| Q3  | Indicar la afirmación correcta:
| A3  | — El DTD permite definir los elementos que se van a poder utilizar en el documento XML. + Todo elemento permitido en el documento XML , deberá estar declarado en el DTD. + Un documento XML siempre contiene un elemento raíz o elemento documento, que engloba a los demás. Se llama igual al nombre que hay en DOCTYPE.
| Q4  | Para que un documento XML esté bien formado:
| A4  | — Solamente debe haber un elemento raiz. + Los valores de los atributos deben estar delimitados por comillas (simples o dobles).
| Q5  | El símbolo `*` significa que un elemento se puede repetir:
| A5  | — 0 o muchas veces.


### UD2.2

| .   | -
| --- | ---
| Q1  | En cuánto a la definición de atributos dentro del contenido DTD:
| A1  | — ...
| Q2  | ...
| A2  | — ... xml válido = cumplir con DTD {**no necesariamente, podría ser via XSD**}
| Q3  | ...
| A3  | — ...
| Q4  | Para que un documento XML esté bien formado:
| A4  | — ...
| Q5  | El símbolo `*` significa que un elemento se puede repetir:
| A5  | — ...
| Q6  | La siguiente instrucción `<!ELEMENT letras (a|b)>` se corresponde con el siguiente XML.
| A6  | — `<letras> a </letras>`
| Q7  | El DTD para especificar que un elemento tiene un atributo se utiliza la propiedad:
| A7  | — `ATTLIST`
| Q8  | El símbolo `+` significa que un elemento se puede repetir:
| A8  | — 1 o muchas veces.
| Q9  | Para especificar que un atributo es obligatorio se utiliza:
| A9  | — ~~ATTLIST~~ REQUIRED ~~PCDATA~~ ~~**IMPLIED**~~
| Q10 | El símbolo `?` significa que un elemento se puede repetir:
| A10 | — **0 o una vez.** <!--(!)-->


### UD3.1

| .   | -
| --- | ---
| Q1  | La sintaxis `required` en referencia a los atributos significa que el atributo es:
| A1  | — obligatorio
| Q2  | Un elemento de tipo `string` se utiliza para almacenar:
| A2  | — Una cadena de caracteres.
| Q3  | La propiedad `pattern`:
| A3  | — Nos permite definir un patrón que se corresponde con una **expresión regular** dada.
| Q4  | El siguiente elemento `<nombre> Nelson </nombre>` lo representaremos con:
| A4  | — `SimpleType` <!--OJOO-->
| Q5  | El siguiente elemento `<nombre edad = "31"> Nelson </nombre>` lo representaremos con:
| A5  | — ~~SimpleSchema~~ ~~SimpleType~~ ~~ComplexContent~~ *Ninguna (SimpleContent)* <!--YOOOOO-->
| Q6  | La propiedad `enumeration` se utiliza para:
| A6  | — ~~*Indicar la estructura aceptados por una cadena.*~~ Ninguna opción...
| Q7  | Los tipos de datos booleanos (boolean):
| A7  | — Toman los valores true o false.
| Q8  | Un esquema XSD de un fichero XML puede ser de tipo:
| A8  | — SimpleType + ComplexType (simpleContent) + ComplexType (complexContent)
| Q9  | La propiedad `minOccurs` se utiliza para:
| A9  | — Indicar el mínimo de veces que se puede repetir un elemento.
| Q10 | Con la siguiente expresión regular `[A-Z]{1,3}` puedo validar la siguiente cadena:
| A10 | — `A`

</details>