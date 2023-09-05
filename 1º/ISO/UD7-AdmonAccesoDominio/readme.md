# ISO — UD7: Administración de Acceso al Dominio


## Campus Virtual

- Teoría
  - ud7-teoria
  - ud7-presentacion
- Material Complementario <!--WindowsServer-->
- Prácticas
  - ud7-comandosLinux
- Cuestionario


### Cuestionario

| index | cuestionario |
| ---   | --- |
| Q1    | ¿En qué lugar podemos comprobar si un equipo cliente se ha unido correctamente al dominio?
| A1    | — En Usuarios y equipos de Active Directory y haciendo clic en la unidad organizativa Computers <br> ~~En usuarios y equipos de Active Directory y haciendo clic en la unidad organizativa Users.~~ <br> ~~En dominios y confianzas de Active Directory > computers.~~
| Q2    | Indica la respuesta correcta:
| A2    | — Las relaciones de confianza permiten a los usuarios de un dominio autenticarse en otro. <br> ~~El dominio que confía es el que están autenticados los usuarios.~~ <br> ~~El dominio de confianza es el que ofrece los recursos.~~
| Q3    | La característica de Active Directory que facilita los usuarios dominio tener acceso a los recursos de un dominio diferente se conoce como:
| A3    | — Relaciones de confianza. &emsp; ~~Relaciones de dominio~~ ~~Relaciones entre bosques~~
| Q4    | Si una relación es transitiva entre A,B y C.
| A4    | — El dominio A  confía en el dominio B y a la vez que el dominio B confía en el dominio C. <br> ~~El camino más corto para los usuarios  es C-> B-> A.~~ <br> ~~Los usuarios del dominio C solo se pueden autenticar en los otros dominios.~~
| Q5    | ¿*Siempre* necesitamos  autenticar la identidad del equipo para que este acceda al dominio?
| A5 !  | — Sí &emsp; ~~No~~ &emsp; ~~No, solo es necesario autorizar~~
| Q6    | Indica la respuesta incorrecta:
| A6    | — Una cuenta de equipo no se puede crear sede forma manual <br> ~~Una cuenta de equipo se puede crear en el momento en el que el equipo se une al dominio~~ <br> ~~Las cuentas de equipo deben ser únicas en el dominio.~~
| Q7    | Uno o varios dominios que comparten el mismo esquema y  catálogo global se conoce como:
| A7    | — Bosque &emsp; ~~Árbol~~ &emsp; ~~Relaciones de confianza~~
| Q8    | ¿Cuáles de las siguientes afirmaciones sobre vínculos de GPO no es correcta?
| A8    | — El vínculo de un GPO con un contenedor es único y permanente. <br> ~~Se puede crear un vínculo de un GPO al contenedor en el mismo momento que se crea el GPO.~~ <br> ~~Se puede crear un GPO por un lado, un contenedor por otro y posteriormente vincularlos~~
| Q9    | Señala la afirmación incorrecta:
| A9 ?? | — Se pueden auditar aciertos o errores, pero no ambas cosas simultáneamente. <br> ~~La DACL contiene información sobre los usuarios que tienen acceso a un objeto.~~ <br> ~~La auditoría de acceso a un objeto se establece desde su propia GPO.~~
| Q10   | Las directivas de seguridad se clasifican en dos grandes grupos:
| A10 !!| — Configuración del equipo y Configuración del usuario. <br> ~~Default Domain Policy y Default Controller Domain Policy.~~ <br> ~~Configuración de software y Configuración de Windows.~~