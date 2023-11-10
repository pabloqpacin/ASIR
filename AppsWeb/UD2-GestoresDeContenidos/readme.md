# AppsWeb UD2: Gestores de contenidos

- [AppsWeb UD2: Gestores de contenidos](#appsweb-ud2-gestores-de-contenidos)
  - [TEORÍA](#teoría)
  - [PRÁCTICA](#práctica)
    - [foo](#foo)
    - [bar](#bar)
    - [McGrawHill](#mcgrawhill)
      - [Caso práctico 1 -- Evolución CMS](#caso-práctico-1----evolución-cms)
      - [Ponte a prueba 1 -- Blogger](#ponte-a-prueba-1----blogger)
      - [Estudio de caso -- Instalación WordPress (Ubuntu)](#estudio-de-caso----instalación-wordpress-ubuntu)
      - [Ejercicios 1 -- test](#ejercicios-1----test)
      - [Caso práctico 2 -- permalinks](#caso-práctico-2----permalinks)
      - [Ponte a prueba 2 -- política de privacidad](#ponte-a-prueba-2----política-de-privacidad)
      - [Ejercicios 2 -- test](#ejercicios-2----test)


## TEORÍA

> apuntes.md

## PRÁCTICA

### foo
### bar
### McGrawHill

#### Caso práctico 1 -- Evolución CMS

```md
- Busca información sobre la evolución de Blogger y WordPress, desde sus inicios hasta la actualidad, y haz una comparativa de los aspectos que te parezcan más relevantes de cada uno de ellos. Puedes utilizar Wikipedia o sitios web especializados y realizar una comparativa con la herramienta Google Trends para comparar el volumen de utilización que tienen.
  - La evolución de los dos CMS, que nacieron para la creación de blogs, ha sido muy distinta. En los últimos quince años WordPress ha evolucionado mucho gracias a que es de código abierto y que se han desarrollado muchos plugins que le añaden funcionalidades extra. Ahora mismo es una herramienta con la que poder montar casi cualquier tipo de sitio web. Blogger se sigue utilizando como una herramienta para blogs. Gráfica comparativa del uso de ambos CMS: <br> ...
```


#### Ponte a prueba 1 -- Blogger

```md
- Piensa en un tema que te interese y luego crea un blog que hable sobre él; para ello utiliza la herramienta Blogger. Tu nuevo blog deberá tener al menos dos entradas y dos páginas. Las entradas han de tener texto, alguna imagen y algún enlace a un sitio web externo. En las páginas puedes incluir el contenido que quieras. También deberás añadir un menú con tus páginas y algún gadget.
- Para ello debes iniciar sesión con tu cuenta de Google, dirigirte a la herramienta Blogger y crear un nuevo blog, indicar el título y la URL. <br> Investiga las opciones que tiene para cambiar el tema por defecto por otro que te guste, añadir un menú y algún gadget desde el apartado de diseño. <br> Puedes consultar el manual de Blogger en la URL: https://support.google.com/blogger/answer/1623800?hl=es
```


#### Estudio de caso -- Instalación WordPress (Ubuntu)

> meh

#### Ejercicios 1 -- test

1. Un CMS: Es un tipo de aplicación web que permite organizar información con dos partes diferenciadas, el back-end y el front-end.
2. Desde www.wordpress.com se puede: Descargar los archivos necesarios para poder instalar y configurar un sitio web en un servidor propio.
3. WordPress es un CMS de código abierto: **VERDADERO**
4. WordPress se puede ejecutar para cualquier propósito, estudiar y cambiar para hacer lo que se quiera, redistribuir y distribuir copias modificadas: **VERDADERO**

#### Caso práctico 2 -- permalinks

```md
Como se ha comentado en el contenido teórico, la opción que viene por defecto sobre los enlaces no es la más recomendable. Realiza lo siguiente:
1. Habilita las URL amigables en el servidor web.
2. Modifica su configuración y marca la opción recomendada.
```
- Para habilitar las URL amigables en el servidor web hay que seguir estos pasos desde la consola:
  1. Ejecutar: `sudo a2enmod rewrite`
  2. Editar el archivo de configuración **000-default.conf** y añadir (antes de la etiqueta de cierre `</VirtualHost>`) las siguiente líneas.
  3. Ejecutar: `sudo systemctl restart apache2`

```conf
<Directory “/var/www/html”>
AllowOverride All
</Directory>
```

- Para cambiar la configuración en WordPress, debes dirigirte al menú de administración Ajustes > Enlaces Permanentes y activar la opción Nombre de la entrada como se ve en la siguiente captura:

```yaml
Nombre de la entrada: https://foo/pagina-ejemplo/
```

#### Ponte a prueba 2 -- política de privacidad

```md
**Política de privacidad**
Busca la página de Política de privacidad, complétala aunque sea con datos ficticios y publícala. Después entra en el menú de administración > Ajustes > Privacidad y asegúrate de que en el desplegable Cambia tu página de política de privacidad aparezca esta página.

> Debes dirigirte primero al menú de administración > Páginas y luego al menú de administración > Ajustes > Privacidad.
```

#### Ejercicios 2 -- test

1. En un sitio web hecho con WordPress, las actualizaciones pueden ser: **De WordPress, de los temas, de los plugins y de las traducciones.**
2. En la página de inicio de un sitio web: **Se puede elegir entre mostrar todas las entradas que se publican o mostrar una página estática.**
3. Para indicar a los buscadores que no indexen el contenido del sitio web hay que ir a: **Ajustes > Lecturas.**
4. Es conveniente tener WordPress actualizado: **VERDADERO**
5. Es conveniente eliminar temas y plugins que no se utilizan: **VERDADERO**

<!-- #### Caso práctico x -- foo
#### Ponte a prueba x -- foo
#### Estudio de caso x -- foo
#### Ejercicios x -- test

1. foo
2. foo
3. foo
4. foo
5. foo

## QUIZ -->
