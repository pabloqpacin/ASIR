# miWeb -- pabloqpacin.com

- [miWeb -- pabloqpacin.com](#miweb----pabloqpacincom)
  - [PRE-DESARROLLO](#pre-desarrollo)
    - [PLAN](#plan)
    - [ESQUEMA](#esquema)
  - [DESARROLLO](#desarrollo)


<!--
    Ejemplos y documentación
- https://tonytascioglu.com/#portfolio (no WP)
- https://wppusher.com/wordpress-github/

    TODO
- Github Webhook
- Bilingüe
- Markdown

    To Mention
- https://wppusher.com/wordpress-github/
- 
-->

## PRE-DESARROLLO

<details>

### PLAN

1. Dominio
   - quiero que sea 'pabloqpacin.com'
   - contratarlo con:
     - IONOS
     - foo
2. Hosting
   - opciones:
      - en casa: ~~proxmox?~~ ~~RPi5?~~
      - en nube:
          - IONOS
          - Hostinger
   - infraestructura:
     - ~~VPS~~
     - WordPress web-hosting
3. Sitio Web
   - WordPress -- LMS (suscripción)
     - **LOCALHOST**

### ESQUEMA

```mermaid
flowchart LR;

Servicios(Servicios/Cursos/Talleres/Suscripción)

WEBSITE .- SobreMi(Sobre mí <br> _homepage_)
WEBSITE .- Blog .- post_01
            Blog .- post_02
            Blog .- post_03
WEBSITE ..- Servicios .- git
            Servicios .- vim
            Servicios .- inglés
            Servicios .- linux(linux: zsh tmux dotfilesArch)
            Servicios .- scripting
WEBSITE .- Contacto

WP_MISC .- header
WP_MISC .- PPC(Política de privacidad y cookies)
WP_MISC ..- Tienda(Carrito/Tienda)
WP_MISC .- footer

OI(Otras ideas)
OI .-> OI2(Bilingüe)
OI .-> OI1(Plataforma colaborativa: más profesores, gratis para profesores)

```

</details>


---
## DESARROLLO

| arhivos         | contenido
| ---             | ---
| WP-localhost.md | Manual de acciones en WordPress
| servicios/*     | Planificación de servicios/cursos
| 
| 