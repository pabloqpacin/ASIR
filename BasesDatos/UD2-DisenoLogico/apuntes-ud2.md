# BasesDatos — UD2: Diseño Lógico

## ud2-teoria

```markdown
1. Diseño de una Base de Datos [BD]
   1. Modelo de Datos
2. Conceptos del Modelo Entidad-Relación
   1. Entidades y Atributos
      1. Dominio de los Atributos
      2. Valor nulo de los Atributos
      3. Atributos simples y compuestos
      4. Atributos monovalentes y polivalentes
      5. Cardinalidad de los Atributos
      6. Atributos derivados
      7. Clave Primaria
      8. Notación
   2. Relaciones
      1. Atributos de las Relaciones
      2. Grado de las Relaciones
      3. Participación de las Entidades en una Relación
      4. Cardinalidad de las Relaciones
      5. Relaciones ternarias y n-arias
      6. Relaciones unarias o reflexivas
      7. Notación
   3. Entidades fuertes y débiles
3. Diseño del Diagrama Entidad-Relación
   1. El modelo E/R ampliado
      1. Especialización y generalización
      2. Tipos de especialización
4. Modelo Relacional
   1. Estructuración de los datos
      1. Dominio
      2. Esquema y extensión
      3. Grado y cardinalidad
      4. Claves candidatas, Clave Primaria y claves alternativas
      5. Claves foráneas
      6. Operaciones con relaciones
   2. Reglas de integridad
      1. Unidad de Clave Primaria
      2. Entidad de la Clave Primaria
      3. Integridad referencial
      4. Integridad del dominio
   3. Traducción del modelo E/R al modelo Relacional
      1. Entidades
      2. Relaciones
         1. Binarias: 1:1 - 1:N - N:M
         2. Ternarias: M:N:P - 1:M:N - 1:1:N - 1:1:1
         3. N-arias
         4. Reflexivas 1:N
      3. Entidades débiles
      4. Generalización y especialización
5. Normalización
   1. Relación universal
   2. Dependencias funcionales
   3. Primera forma normal (1FN)
   4. Segunda FN (2FN)
   5. Tercera FN (3FN)
   6. FN de Boyce-Codd
   7. Otras formas normales
```

> @toptal.com: [HTML Arrow Symbol, Arrow Entity and ASCII Arrow Character Code Reference](https://www.toptal.com/designers/htmlarrows/arrows/)
>
> **@LucidChart: [What is an Entity Relationship Diagram (ERD)?](https://www.lucidchart.com/pages/er-diagrams) — [ERD Symbols and Notation](https://www.lucidchart.com/pages/ER-diagram-symbols-and-meaning)**


1. **Diseño** == Fases Análisis (ERS) > D. Conceptual > D. Lógico > D. Físico
   1. *Modelo de Datos* == Estructuras + ReglasIntegridad + Operaciones
2. **Conceptos del Modelo Entidad-Relación**
   1. Entidades y Atributos &emsp; // &ensp; `[▭]` - `[〇]`
       - *ENTIDADES* == INSTANCIA vs TIPO
      1. *Dominio (Atr.)* == marco valores aceptables
      2. *Valor Nulo (Atr.)* == `NULL` ie. válido sin valor
      3. *TIPOS Atr.* == simples || compuestos &emsp; // monovalentes || polivalentes `[◎]` -- (valor/instancia/momento 1 VS +1)
          - Modelo Relacional = ~~compuestos || polivalentes~~
      4. *`Cardinalidad` de los Atributos* == valores mínimos,máximos => (1,1) || (1,n) || (0,1) || (0,n)
         - `--||` || `--|{` || `--O|` || `--O{`
      5. *Atributos derivados* `[◌]` == from Atr. Base (eg. FechaNac > Edad) &emsp; // **[redundancia > EVITAR]**
      6. *Clave Primaria* `[_]`
      7. *Notación* == ~~acentos||caracteresEspeciales~~ - Maýusculas|Singular - PascalCase|!Siglas
   2. **Relaciones** `[◇]`
      1. *Atributos Rel.*
      2. *Grado Rel.* == binarias || ternarias || cuaternarias || n-arias
      3. *`Participación` Ent. Rel.* == mínimo,máximo => (0,1) || (0,n) || (1,1) || (1,n)
      4. *`Cardinalidad` Rel. Bin.* == "nº máximo instancias asociadas (Rel.)" &emsp; // (1:1) || (1:N) `[←:↠]` | (N:M) 
      5. *Rel. ternarias y n-arias* == (1:1:1) || (1:1:N) || (1:M:N) || (M:N:P)
      6. *Rel. unarias o reflexivas* == eg. "[empleado] ← ↞ \<es jefe>"
      <!-- 7. *Notación* ==  -->
   3. **Entidades fuertes y débiles**
       - *Fuertes* == tienen PK
       - *Débiles* == no PK pero 'Discriminante'; necesitan Fuerte (1:N); pueden tener Débiles asociadas y Rel. con otras Ent.
         - *DEPENDENCIA* == Existencia || Identificación &emsp; // `[ <E> ]` || `[ <I> ]` &emsp; EG. CuentaBancaria > Transacción || Autor > Libro
3. **Diseño del Diagrama Entidad-Relación**
   1. El modelo E/R ampliado
      1. **Especialización y generalización** `[▽]`
          - *Especialización* ==  Entidad => Superclase > Subclases
          - *Generalización* == evitar repeticiones Atr. de varias Ent. 
      2. **TIPOS Espec.** == Exclusiva `['⧋']` || Inclusiva &ensp; — &ensp; Total `['⧊']` || Parcial
4. **Modelo Relacional** (Codd, 1970s; lógica+matemáticas)
   1. **Estructuración Datos** == &emsp; Relación = Tabla &ensp; — &ensp; Atributo = Columna &ensp; — &ensp; Tupla = Fila
      1. *Dominio* == nombre + definiciónLógica + tipoDato + formato &emsp; // Custom *>* Default.SGBD
      2. *Esquema-Extensión* == [...]
      3. *Grado || Cardinalidad* == nº  Atr. || Tuplas
      4. **CLAVES** == ~~NULL~~! &emsp; // "Superclaves"
         1.  *Candidatas* == [...]
         2.  *Primaria [PK]* == distinguir Tupla unívocamente &emsp; // +1 Atr
         3.  *Alternativas* == [...]
      5. *Claves foráneas* == 1 Atr. = N Tuplas (Rels.) -- REFERENCIAS - Compatibilidad
      6. *Operaciones con relaciones* == Consulta || Actualización: Inserción - Modificación - Borrado
   2. **Reglas de integridad** &emsp; --modelo VS usuario--
      1. *Unicidad PK* = 1!
      2. *Entidad PK* == ~~NULL~~
      3. [ ] *Integridad referencial* == Restricción.~~edit~~ || Actualización_Cascada.propagar || Anulación.propagar_NULL
          - Borrado == RESTRICCIÓN &emsp; — &emsp; Modificación == CASCADA 
      4. *Integridad del dominio* == no NULL => Dominio OK!
   3. ~~**TRAD. Modelo E/R > Modelo Relacional**~~ <!--Ent. = Rel.; &ensp; Rel.Bin.Ob. = FK; &ensp; Rel.Bin.Op.+N-arias = Rel.-->
      1. ~~Entidades~~
      2. ~~Relaciones~~
         1. ~~Binarias: 1:1 - 1:N - N:M~~
         2. ~~Ternarias: M:N:P - 1:M:N - 1:1:N - 1:1:1~~
         3. ~~N-arias~~
         4. ~~Reflexivas 1:N~~
      3. ~~Entidades débiles~~
      4. ~~Generalización y especialización~~
5. **Normalización**
    - 'validación Buen diseño' = indicadores - condiciones &emsp; (1.mal - 5.bien) &emsp; "descomposición (+) relaciones" => coste/Consultas
   1. *Relación universal* == '1 tabla, todo revuelto'
   2. *Dependencias funcionales* == 1 atributo conduce al resto &emsp; //  EMPLEADO(ID,Nombre,Direccion) VS PRODUCTO(CodProducto,Nombre,PrecioVenta) <!--"para A, B solo puede ser B"-->
   3. *Primera forma normal (1FN)* == 1 Fila = 1 Atributo (eg. no 2 teléfonos 1 persona)
   4. *Segunda FN (2FN)* == N tablas para Dependencia Funcional PK TOTAL
   5. *Tercera FN (3FN)* == NO Dependencias Transitivas (ie. A→B→C)
   6. *FN de Boyce-Codd* == N tablas para Cl. Candidatas
   7. *Otras formas normales* == —


---


> [2.] Modelo Entidad-Relación: SÍMBOLOS ERD


![ERD-Symbols](/img/BasesDatos/ud2-ERD-Symbols.png)