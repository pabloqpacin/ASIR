# Unidad 2 McGrawHill <br> Gestores de Contenidos

```md
# Objetivos
1.  Instalar diferentes tipos de gestores de contenidos.
2.  Realizar pruebas de funcionamiento.
3. Personalizar y configurar los gestores de contenidos.
4. Publicar los gestores de contenidos.
5. Realizar copias de seguridad de los contenidos.
```

<Table of Contents>

## 1. CMS: Wordpress

```md
Un CMS (Content Management System) o sistema de gestión de contenidos es un entorno para crear y administrar información de sitios web.
Su estructura consta de dos partes: el front-end y el back-end. El front-end es la parte pública que cualquier usuario verá al acceder al sitio web, mientras que el back-end es la parte privada o de administración, accesible mediante usuario y contraseña, desde donde se gestiona la información que se ve en la parte pública y se añaden funcionalidades extra a la plataforma.
Los requisitos para la instalación de la mayoría de CMS son: un servidor web Apache, un sistema gestor de bases de datos MySQL y soporte para programación PHP.
En la base de datos se almacena la información del sitio web, la configuración de funcionalidades y los usuarios con sus permisos de acceso a la parte privada.
El CMS más utilizado en la actualidad es WordPress; por eso esta unidad se centra en su instalación, configuración y manejo.
```

- Usar CMS en lugar para ahorrarse programar la gestión de usuarios, la seguridad o el acceso a las bases de datos

### 1.1 CMS

- Gestión del sitio web a través de un **panel de administración** (backend) para crear contenido etc.
- Complementos o **plugins** para extender funcionalidad (e.g. vender productos, impartir cursos) -- CMSs dedicados al e-commerce o al e-learning (LMS), e.g. Moodle, o wikis (creación colaborativa de contenido)
- **REQUISITOS**: servidor web (Apache), SGBD (MySQL, MariaDB), soporte PHP

### 1.2 WordPress

- CMS de código abierto, 2003, creación de blogs. Gran expansión. Actualmente, 43% de sitios web CMS son WP (licencia GPL).

#### A. Instalación Preconfigurada

- ... wordpress.com ... Bitnami ... XAMPP ...

#### B. Instalación Manual

- ... homelab ...


## 2. Administración básica

```md
Desde la parte de administración de un sitio web WordPress se gestionan los contenidos organizados en páginas y entradas, pero también se manejan muchos otros aspectos, como por ejemplo:
- La apariencia: mediante la instalación y activación del tema que mejor se adapte a las necesidades del sitio.
- Las funcionalidades: a través de la instalación de plugins que van desde simples botones para que los usuarios compartan los contenidos de las páginas o las entradas en redes sociales hasta una tienda on-line.
- La creación de usuarios y sus roles: cada usuario tendrá permisos para realizar unas tareas u otras dentro de la administración del sitio web en función del rol que se le haya asignado.
- La definición de menús y elección de su ubicación: para poder organizar las secciones del sitio web.
- La elección de áreas con información adicional: por ejemplo, en una columna o al pie de página.
- Permitir que los usuarios dejen comentarios en las entradas publicadas y si estos comentarios deben revisarse antes de su publicación.
```

### 2.1 Carpetas y archivos de WordPress

> /srv/www/wordpress

| foo                   | bar
| ---                   | ---
| wp-admin              | Carpeta con archivos para hacer funcionar el backend
| wp-content/languages  | Carpeta con traducciones de archivos a varios idiomas
| wp-content/plugins    | Plugins
| wp-content/themes     | TEmas
| wp-content/uploads    | Imágenes, vídeos etc. includios en entradas o páginas
| wp-includes           | Archivos core
| wp-config.php         | Info conexión BBDD **(!)**
| wp-login.php          | Usuario y contraseña para backend
| .htaccess             | Config de seguridad, redirecciones, URL amigables

### 2.2 Escritorio (Dashboard)

- Presentación herramientas distribuidas en bloques en función de la configuración y de los plugins instalados
- Primeros pasos, personalizar; siguientes pasos, administrar entradas páginas; más acciones, widgets menús comentarios

### 2.2 Ajustes

#### A. Ajustes generales

- *Título del sitio* y *Descripción corta*: siempre se pueden cambiar, visibles en la parte superior de todas las páginas
- *Dirección de WP* y *del Sitio* (URL): pueden coincidir o no dependiendo de la ubicación de los archivos en el servidor...
- *Cualquiera puede registrarse*: según 'Perfil por defecto'
- *Idioma del sitio*: ...
- *Zona horaria, formato fecha, etc*: importante para organización entradas

#### B. Ajustes de escritura

- Opciones de publicación generales: *Categoría por defecto*, *Formato entrada por defecto*, *Publicar por email* (POP3), *Servicios de actualización* (aviso nuevas publicaciones)...

> TODO: Markdown

#### C. Ajustes de lectura

- *Tu página de inicio*, *Número máximo de entradas a mostrar*, *Feeds RSS*, *Visibilidad en los motores de búsqueda*...

#### D. Ajustes de los enlaces permanentes

- 'Un enlace permanente es la URL que enlaza las páginas, entradas, categorías y etiquetas. Para cada uno de estos elementos la URL debe ser siempre igual, por eso se le llama permanente'
- Opción recomendada: **Nombre de la entrada** // personalización

#### E. Ajustes de privacidad

- Aplicar legislación sobre colección de datos personales: **página** informando de la política de privacidad (WP borrador por defecto)


## 3. Personalización

```md
La personalización de un sitio web realizado con WordPress se realiza a través de la instalación de un tema, de la definición y ubicación de uno o varios menús, de la incorporación de widgets y de la instalación de plugins.
Un tema da estilo a WordPress a nivel de estructura y de diseño, la estructura es la ubicación de los elementos y el diseño es lo que da formato a los elementos. 
Los menús contienen los enlaces a las distintas secciones y en WordPress se pueden crear todos los que se quieran, pero sus ubicaciones dependen del tema instalado.
A través de los widgets, cuyas posibles ubicaciones también vendrán determinadas por el tema que está instalado, se pueden añadir al sitio web pequeños bloques de contenido como pueden ser textos, imágenes, enlaces, categorías, calendarios, etc.
Por último, los plugins añaden funcionalidades extra a la base de WordPress como, por ejemplo: sliders de imágenes, conexión con redes sociales, porfolios, testimonios, equipo, funcionalidades para crear una tienda on-line, etc.
```

### 3.1 Usuarios
### 3.2 Menús
### 3.2 Widgets
### 3.2 Temas
#### A. Añadir temas
#### B. Cambiar el tema
#### A. Eliminar un tema
### 3.5 Personalizar
### 3.6 Fondo
### 3.7 Editor de temas
### 3.8 Plugins
### 3.9 El plugin WooCommerce

## 4. Contenidos
### 4.1 foo
### 4.2 foo

## 5. Copias de seguridad
### 4.1 foo
### 4.2 foo
