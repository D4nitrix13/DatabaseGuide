<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Modelo ER (Con Notación de Chen)***

> [!NOTE]
> *El Modelo de Entidad-Relación (ER) es una herramienta fundamental en el diseño de bases de datos, utilizado para representar la estructura de una base de datos de manera gráfica. La notación de Chen es una de las formas más tradicionales y reconocibles de representar el modelo ER. Aquí tienes una descripción detallada de la notación de Chen y cómo se utiliza:*

## ***Modelo ER con Notación de Chen***

**1. Entidades:**

- **Definición:** *Una entidad representa un objeto o concepto en el mundo real que tiene una existencia independiente y se distingue de otros objetos. Puede ser una persona, lugar, cosa o evento.*
- **Notación:** *En el diagrama de Chen, una entidad se representa mediante un **rectángulo**. El nombre de la entidad se coloca dentro del rectángulo.*

**2. Atributos:**

- **Definición:** *Los atributos son propiedades o características de una entidad. Cada entidad puede tener uno o más atributos que describen sus características.*
  
- **Notación:** *Los atributos se representan mediante **óvalos** conectados al rectángulo de la entidad mediante líneas. El nombre del atributo se escribe dentro del óvalo.*

- **Tipos de Atributos:**
  - **Atributo Simple:** *No se puede dividir en subpartes (e.g., nombre). Se representa con un solo óvalo conectado a la entidad.*
  - **Atributo Compuesto:** *Se puede dividir en subatributos (e.g., dirección que se divide en calle, ciudad, código postal). El atributo compuesto se representa con un óvalo y los subatributos, que son otros óvalos más pequeños, se conectan al óvalo principal.*
  - **Atributo Derivado:** *Se puede derivar de otros atributos (e.g., edad, que puede derivarse de la fecha de nacimiento). Los atributos derivados se representan con un óvalo punteado.*
  - **Atributo Multivaluado:** *Puede tener múltiples valores (e.g., números de teléfono, hobbies). Los atributos multivaluados se representan con **dos óvalos concéntricos** (uno dentro del otro), indicando que pueden tener más de un valor asociado a la entidad.*

**3. Relaciones:**

- **Definición:** *Una relación representa una asociación entre dos o más entidades. Describe cómo las entidades interactúan entre sí.*
- **Notación:** *Las relaciones se representan mediante **rombos** conectados a los rectángulos de las entidades involucradas mediante líneas. El nombre de la relación se escribe dentro del rombo.*
- **Cardinalidad:** *Indica el número de instancias de una entidad que pueden estar asociadas con instancias de otra entidad. Las cardinalidades comunes son:*
  - **Uno a Uno `(1:1)`**
  - **Uno a Muchos `(1:N)`**
  - **Muchos a Muchos `(M:N)`**

**4. Claves Primarias:**

- **Definición:** *Una clave primaria es un atributo o un conjunto de atributos que identifica de manera única a cada instancia de una entidad.*
- **Notación:** *La clave primaria se indica subrayando el nombre del atributo dentro del óvalo.*

**5. Ejemplo de Diagrama ER con Notación de Chen:**

- *Imagina un sistema de base de datos para una biblioteca. El diagrama ER podría incluir:*

- **Entidades:**
  - **Libro** *(con atributos como Título, Autor)*
  - **Usuario** *(con atributos como Nombre, ID de Usuario, Fecha de Registro)*

- **Relación:**
  - **Préstamo** *(con atributos como Fecha de Préstamo) entre las entidades **Libro** y **Usuario**.*

- *El diagrama ER en notación de Chen para este sistema sería:*

1. *Un rectángulo para la entidad **Libro** conectado a óvalos para sus atributos (Título, Autor).*
2. *Un rectángulo para la entidad **Usuario** conectado a óvalos para sus atributos (Nombre, ID de Usuario, Fecha de Registro).*
3. *Un rombo para la relación **Préstamo** conectado a los rectángulos de **Libro** y **Usuario**, con un óvalo para el atributo adicional **Fecha de Préstamo**.*

**Resumen:**

- **Entidades** *se representan con **rectángulos**.*
- **Atributos** *se representan con **óvalos** conectados a las entidades.*
- **Relaciones** *se representan con **rombos** conectados a las entidades.*
- **Cardinalidad** *se indica mediante símbolos junto a las líneas de relación.*

- **La notación de Chen es útil para diseñar la estructura lógica de bases de datos, proporcionando una representación clara de las entidades, atributos y relaciones dentro del sistema.**
