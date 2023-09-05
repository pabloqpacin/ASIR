# Markup B: HTML CSS JavaScript

## Campus Virtual

- Teoría...
- Actividades [13]
- Cuestionarios

### Actividades

| file             | + files | info
| ---              | ---     | ---
| 01_htmlcss       | —       | HTML & CSS 101
| 02_html_css      | css     | **HTML:** `link rel='style' href='/path/'`
| 03_margins       | css     | **CSS:** `margin` `padding`
| 04_enlaces_a     | css     | **CSS:** `link` `active` `hover` `visited`
| 05_enlaces_b     | css     | **CSS:** `box-shadow`
| 06_lista_a       | css     | **HTML:** listas `class` <br> **CSS:** `cursor` `display`
| 07_lista_b       | css     | ...
| 08_blogJS        | css     | **HTML:** `nav` `aside` lorem <br> **CSS:** box-like! <br> **JS:** `onclick` & `alert` `console.log`
| 09_formulario_a  | css     | **HTML:** `label` `input` (text,radio,checkbox;submit,reset), `select` `option`, `textarea`
| 10_formulario_b  | —       | **HTML:** `input` (password,URL/time,date,week,month/TEL,number,color)
| 11_formulario_c  | —       | **HTML:** `form`>`fieldset`>`legend` / [name]; `input` (file)
| 12_formulario_d  | —       | **HTML:** `form`>`select`>`option`>`optgroup`>`option` `input` (range)
| 13_formulario_JS | js      | **HTML:** `input` (button,search) <br> **JS:** `document.getElementById("foo").bar = baz`


#### *quickref*

- **HTML**

| - *SELF-CLOSING TAGS* | `<meta>` | `<link>` | `<hr>` |`<img>` | `<input>` | `<br>` |
| ---                   | ---      | ---      | ---    | ---       | ---    | ---

- **CSS**

| item    | info
| ---     | ---
| foo {}  | given tag
| .foo {} | class
| #foo {} | id

- **JS**
    - @w3schools: [Variables: var || const || let](https://www.w3schools.com/js/js_variables.asp)
    - @Microsoft [WSL for Javascript web development](https://learn.microsoft.com/en-us/windows/dev-environment/javascript/)


### Cuestionarios

| index | cuestionario — UD4 |
| ---   | --- |
| Q1    | Algunas características que aporta HTML en su versión de HTML 5:
| A1    | — Se permiten las mayúsculas en las etiquetas. La etiqueta de cierre es opcional en los elementos vacios. <br> — Las comillas son opcionales en los atributos. Es opcional establecer un valor a los atributos.
| Q2    | En cuánto a los formularios en HTML 5:
| A2    | — El elemento `<input>` incorpora nuevos tipos de atributos type y nuevos atributos que facilitan la validación de los datos de entrada. <br> — Han sido mejorados con respecto a versiones anteriores.
| Q3    | Entre los elementos de sección de HTML 5, podemos encontrar:
| A3    | — `<header>` & `<nav>` & `<section>`
| Q4    | Indicar la afirmación correcta con relación a XHTML:
| A4    | — Surge de forma oficial en 1998, y su objetivo era mejorar las deficiencias que tenía HTML. <br> — Trata de incorporar las ventajas que aporta un lenguaje como XML. <br> — Pretendía ser una reformulación de HTML.
| Q5    | Los elementos de sección de HTML 5:
| A5    | — Tratan de evitar el uso indiscriminado de etiquetas `<div>` para hacer secciones de página. <br> — Facilitan la comprensión del código. <br> — Permiten a los navegadores y buscadores clasificar las secciones de la página según su utilidad e importancia. <br> — Todas las opciones son correctas.
| Q6    | La versión actual de HTML es:
| A6    | — 5
| Q7    | La etiqueta `<header>` se utiliza para:
| A7    | — Para insertar información introductoria como el título, el logo ó enlaces secundarios.
| Q8    | El atributo `type`:
| A8    | — Puede tomar también los valores search, number, time, url, email etc.
| Q9    | Para dar un salto de línea se utiliza la etiqueta:
| A9    | — `<br>`
| Q10   | ¿Qué afirmación es correcta?
| A10 ! | — Las etiquetas, se pueden anidar.

<hr>

| index | cuestionario — UD5 |
| ---   | --- |
| Q1    | CSS:
| A1    | — Es un lenguaje de estilos. No es un lenguaje de marcas. <br> — Su objetivo principal es manejar el aspecto y el formato de los documentos y liberar a HTML de las tareas de presentación. <br> — Su estructura y sintaxis no es como la de HTML.
| Q2    | Las formas de aplicar un estilo CSS a un archivo HTML son:
| A2    | — Atributo: Mediante el atributo style de HTML. <br> — Etiqueta: Mediante la etiqueta `<style>` en la que incluimos el código CSS en la cabecera del documento. <br> — Enlace: Creando un enlace mediante la etiqueta `<link>` a una hoja de estilos externa, en un fichero con extensión .css.
| Q3    | Para los archivos CSS, la sintaxis básica de cualquier declaración de estilo está compuesta por 3 elementos:
| A3    | — Selector: especifica el elemento ó elementos (etiquetas) a los que les vamos a definir un estilo. Propiedad: es el atributo de la etiqueta que se desea modificar. Valor: es el valor que queremos asignar a esa propiedad.
| Q4    | Un línea de ejemplo de sintaxis básica de CSS podría ser:
| A4    | — `body { background-color: #d8da3d; }`
| Q5    | Las siglas CSS significan:
| A5    | — Hojas de estilo en cascada.
| Q6    | Se puede llamar a un selector de tipo id llamado "informacion" desde un fichero CSS de la siguiente forma:
| A6    | — `#informacion{}`
| Q7    | La extensión de un fichero css es:
| A7    | — .css
| Q8    | El siguiente código está mal porque:
| A8    | — Ninguna respuesta es correcta.
| Q9    | La etiqueta `<link>` puede tener estos atributos:
| A9    | — `type` & `rel` & `href`
| Q10   | Se puede llamar a un selector de tipo clase llamado "navegacion" desde un fichero CSS de la siguiente forma:
| A10   | — `.navegacion{}`

```html
<!-- Q8 -->
<body style="background-color: #FF0000"
    >Esto no tiene formato solo hace que salga el fondo del cuerpo rojo
    <p style="font-family: Comic sans ms; font-size: 16px; color: blue;"
    >Este párrafo saldrá letra tipo Comic, con tamaño 16 y color azul </p>
</body>
```

<hr>

| index | cuestionario — UD6 |
| ---   | --- |
| Q1    | En Javascripts para comentar una línea de código podemos utilizar:
| A1    | — `// Esto es un comentario`
| Q2    | Para mostrar un mensaje por consola utilizamos:
| A2    | — `console.log("Hola mundo");`
| Q3    | La etiqueta que utilizamos para añadir nuestro código JavaScripts al fichero HTML es:
| A3    | — `<script>`
| Q4    | Con el método `alert`:
| A4    | — Mostramos una ventana emergente.
| Q5    | En una variable de tipo `var` podemos almacenar:
| A5    | — Valores numéricos & Valores booleanos & Cadenas de caracteres
| Q6    | En Javascripts el operador de asignación es:
| A6    | — `=`
| Q7    | Para eliminar el contenido de la consola podemos utilizar la sentencia:
| A7    | — `console.clear();`
| Q8    | Para incluir información dentro del fichero HTML a través de Javascripts utilizamos:
| A8 !  | — `document.write("<p>Hola mundo</p>");`
| Q9    | En Javascripts el operador de comparación es:
| A9    | — `==`
| Q10   | En Javascripts para comentar una línea de código podemos utilizar:
| A10   | — `/* Esto es un comentario */`



<!--
## notas -- hide

### 2022-03-01

- intro
  - Relación con **w3 consortium**
  - *HTML v5*
    - mejorar presentación, formularios, audios+vídeos
    - valores opcionales *atributos*
  - CSS v3
  - JavaScript
- etiquetas HTML
  - muchas, aprenderlas poco a poco
- **diseño web**
  - friendly interfaz-navegación (asequible para 'muggles', sencilla)
  - **maquetado web**
    1. ~~Sketching~~: diseño en papel 
    2. ~~Wireframing~~: mezcla papel-digital
    3. Prototipado: diseño previo de las interfaces web, etc. (EJEMPLOS?!)
    - CMS // Gestores de Contenido: WordPress, Joomla... No hay que saber programar sino conocer componentes (mover elementos) 

```markdown
- Cabecera --------------------- <header>
- Barra de navegación ----------- <nav>
- section / aside
- footer
```

De JS veremos: botones **formularios** (habilitar determinada info, control tiempo real)


### 2022-03-08

- 02
  - html última versión == doctype
  - atributo LANG
  - meta
    - charset
    - *SEO*

> NO CERRAR `meta` ni `link` // solo apertura, sin cierre

- 03
  - auto-select `html:5`
  - `div`
    - color fondo
    - **padding** left-right-up-bottom // margen externo
    - margin ...                       // margen interno
- 04
  - "establecer relaciones entre dos recursos (descargar archivos, enlazar otras partes de la web u otras webs)"
  - elemento `a` con `href`
  - **4 ESTADOS ENLACES**
    - `link` (no visitado)
    - `visited`
    - `active` (al hacer click)
    - `hover`
- 05
    - BOTONES
    - transformar ENLACES en BOTONES => `box-shadow`

### 2022-03-15
—

### 2022-03-22

- 08
  - need LU in nav??
  - hr
  - lorem100
  - javaScript DENTRO de html (SOLO HOY)
    - `script` justo antes del **Cierre del Body**
    - ALERT
  - tema cuadros artículos en pantalla... RESPONSIVENESS... > **bootstrap**

-->