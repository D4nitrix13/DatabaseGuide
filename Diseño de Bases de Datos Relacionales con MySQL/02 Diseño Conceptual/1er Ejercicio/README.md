<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Entidades Relaciones y atributos***

- *El diagrama de Chen es un tipo de modelo de entidad-relación (ER) utilizado en el diseño de bases de datos. Este tipo de diagrama se usa para representar de manera gráfica las entidades, relaciones y atributos de un sistema de base de datos. Fue propuesto por el profesor Peter Chen en 1976 y es fundamental en la creación de modelos conceptuales para bases de datos relacionales.*

---

## ***Componentes del Diagrama de Chen***

1. **Entidades:** *Representan objetos o conceptos del mundo real que tienen una existencia independiente. En un diagrama de Chen, las entidades se representan con rectángulos.*

2. **Atributos:** *Son las propiedades o características de las entidades. Se representan con óvalos conectados a sus respectivas entidades.*

3. **Relaciones:** *Indican cómo están asociadas las entidades entre sí. Se representan con rombos conectados a las entidades implicadas en la relación.*

4. **Cardinalidades:** *Definen la cantidad de instancias de una entidad que pueden estar asociadas con instancias de otra entidad. Se representan mediante anotaciones en las líneas de relación.*

- **Representación de Cardinalidad**

- *La cardinalidad se refiere a la cantidad de instancias de una entidad que pueden estar asociadas con instancias de otra entidad en una relación. Existen varias formas de representar la cardinalidad:*

1. **Notación de Dos Puntos:**
   - **1:1:** *Indica que una instancia de la primera entidad se relaciona con exactamente una instancia de la segunda entidad, y viceversa.*

2. **Notación de Paréntesis:**
   - **(1,1):** *Representa la misma relación, especificando que se requiere exactamente una instancia de cada entidad en la relación.*

3. **Notación de Fracción:**
   - **1/1:** *Otra forma de mostrar que cada instancia de una entidad se asocia con una única instancia de la otra entidad.*

4. **Otras Notaciones:**
   - **1:N (uno a muchos):** *Una instancia de la primera entidad puede relacionarse con varias instancias de la segunda.*
   - **M:N (muchos a muchos):** *Varias instancias de la primera entidad pueden relacionarse con varias instancias de la segunda.*

5. **Notaciones No Tan Comunes**

   - **0:N (cero a muchos):** *Indica que una instancia de la primera entidad puede no estar relacionada con ninguna instancia de la segunda, o bien estarlo con muchas.*
     - *Ejemplo:* *Un cliente puede no tener ningún pedido (0), o puede tener varios pedidos (N).*

   - **1:13 (Uno A Trece):** *Es una notación menos habitual que especifica un límite exacto o un rango máximo de relaciones. Aquí significa que una instancia de la primera entidad debe relacionarse con al menos **una** y como máximo con **trece** instancias de la segunda.*
     *Ejemplo:* *Una selección de fútbol debe tener **como mínimo un jugador** y **como máximo trece jugadores inscritos** en una competencia.*

*Cada una de estas notaciones tiene su utilidad en el diseño de diagramas de entidad-relación, y la elección de una sobre otra puede depender del contexto o de las preferencias del diseñador.*

*![Image CardinalidadExample](/Images/CardinalidadExample.jpg "/Images/CardinalidadExample.jpg")*

---

### ***Uso del Diagrama de Chen***

- **Diseño Conceptual:** *Ayuda a crear una representación abstracta del sistema de base de datos sin preocuparse por los detalles de implementación.*
- **Comunicación:** *Facilita la comunicación entre los diseñadores de bases de datos y los usuarios finales, permitiendo una comprensión compartida del modelo.*
- **Documentación:** *Sirve como una herramienta de documentación para el diseño de la base de datos.*

---

### ***Editores para Diagramas de Chen***

1. **draw.io (ahora diagrams.net):** *Una herramienta gratuita en línea para crear diagramas, incluidos los diagramas ER.*
   - *[diagrams.net](https://www.diagrams.net/ "https://www.diagrams.net/")*

- *Estos editores proporcionan interfaces gráficas que facilitan la creación y modificación de diagramas ER, lo que permite a los diseñadores de bases de datos trabajar de manera más eficiente.*

---

### ***Instalación de Draw.io***

- **GitHub:** *[https://github.com/jgraph/drawio-desktop](https://github.com/jgraph/drawio-desktop "https://github.com/jgraph/drawio-desktop")*
- **GitHub Release:** *[https://github.com/jgraph/drawio-desktop/releases/tag/v24.7.8](https://github.com/jgraph/drawio-desktop/releases/tag/v24.7.8 "https://github.com/jgraph/drawio-desktop/releases/tag/v24.7.8")*
- **Descarga de instalación:** *[drawio-amd64-24.7.8.deb](https://github.com/jgraph/drawio-desktop/releases/download/v24.7.8/drawio-amd64-24.7.8.deb "https://github.com/jgraph/drawio-desktop/releases/download/v24.7.8/drawio-amd64-24.7.8.deb")*

**Para instalar, utiliza el siguiente comando en la terminal:**

```bash
sudo dpkg -i drawio-amd64-24.7.8.deb
```

**Para verificar la instalación, ejecuta:**

```bash
drawio --version
```

- *Salida esperada:*

  ```bash
  Checking for beta autoupdate feature for deb/rpm distributions
  Found package-type: deb
  24.7.8
  ```

- **Para abrir la aplicación:**

```bash
drawio >/dev/null 2>&1 &
```

---

### ***Ejercicio 1: Lista de Tareas***

**Objetivo:** *Diseñar una aplicación en la que los usuarios puedan crear y gestionar tareas personales. Cada usuario se registra mediante correo electrónico y contraseña, y puede tener varias tareas asignadas, cada una con título, descripción, estado y fecha límite.*

---

#### ***Entidades y Relaciones:***

1. **Entidades:**

   - **Usuario (User):**
     *Representa a cada persona que se registra en la aplicación.*

     - *`id`: Identificador único del usuario (clave primaria).*
     - *`name`: Nombre completo del usuario.*
     - *`email`: Correo electrónico del usuario (dato único para registro).*
     - *`password`: Contraseña cifrada del usuario para acceder al sistema.*
   - **Tarea (Task):**
     *Representa una actividad que el usuario debe realizar.*

     - *`id`: Identificador único de la tarea (clave primaria).*
     - *`title`: Título breve de la tarea.*
     - *`description`: Descripción detallada de lo que debe hacerse en la tarea.*
     - *`status`: Estado de la tarea (ejemplo: *pendiente*, *en progreso*, *completada*).*
     - *`due_date`: Fecha límite para completar la tarea.*

2. **Relación:**

   - **Crear (Create):**
     *Define la relación entre un usuario y las tareas que este genera.*

     - **Cardinalidad:**

       - *Un **usuario** puede crear de `cero a muchas` tareas (0..n).*
       - *Cada **tarea** debe ser creada por un único usuario (1..1).*
     - **Significado: *Un usuario crea una o varias tareas, pero una tarea no puede existir sin pertenecer a un usuario.***

---

#### ***Atributos Únicos:***

- *`id` en **User** y en **Task** → Sirven como claves primarias, identifican de forma única cada registro.*
- *`email` en **User** → No puede repetirse, ya que es el medio principal de autenticación.*

---

#### ***Cardinalidades:***

- **Tareas creadas por un usuario:**
  - *Mínimo: 0 (el usuario puede no tener tareas al registrarse).*
  - *Máximo: N (sin límite superior).*

- **Relación entre tareas y usuarios:**
  - *Cada tarea pertenece a **un único usuario** (1:1).*
  - *Una tarea no puede ser creada por más de un usuario.*

---

### ***Explicación***

- **Un usuario puede crear muchas tareas** *(mínimo 0, máximo N). Esto indica que un usuario puede estar asociado a ninguna o muchas tareas.*
- **Cada tarea pertenece a un único usuario,** *lo que implica que una tarea solo puede tener un creador, es decir, no puede estar asociada a más de un usuario.*

- *Esto describe una relación **uno a muchos** (**1:N**), donde:*

- **Usuario -> User (1)** *→ Puede crear muchas tareas (**N**).*
- **Tarea -> Task (N)** *→ Pertenece a un único usuario (**1**).*

- *Es decir, cada usuario puede tener múltiples tareas, pero cada tarea solo puede tener un único usuario como creador.*

*![/Images/ImageRelacionesAtributos](/Images/ImageRelacionesAtributos.png "/Images/ImageRelacionesAtributos.png")*

---

### ***Combinación de Atributos para Identificadores Únicos***

- *En ocasiones, la combinación de dos o más atributos puede generar un identificador único para una entidad. Este enfoque es útil cuando ningún atributo individual es lo suficientemente distintivo por sí solo. Al fusionar los valores de estos atributos, se crea un identificador que garantiza la unicidad, permitiendo así una identificación precisa de cada registro en una base de datos.*
- *Por ejemplo, en una tabla de usuarios, la combinación de los atributos "nombre" y "apellido" podría formar un identificador único, siempre que no existan duplicados. Esto es especialmente valioso en situaciones donde los identificadores naturales no son adecuados por sí mismos.*

---

### ***Notas sobre los Ficheros Generados por Draw.io***

- **`.bkp`:** *Este tipo de fichero representa una copia de seguridad (backup) del diagrama. Se utiliza para restaurar el estado anterior del fichero en caso de que se necesite recuperar información perdida o revertir cambios no deseados.*
- **`.dtmp`:** *Este fichero es un fichero temporal creado por Draw.io durante el proceso de edición. Su propósito es almacenar información provisional mientras trabajas en el diagrama. Normalmente, estos ficheros se eliminan automáticamente al cerrar la aplicación, pero pueden ser útiles en caso de un cierre inesperado o error.*

---

### ***Data: Existe la relación de "muchos a uno" (N:1)**, y de hecho, es simplemente el enfoque inverso de la relación "uno a muchos" (1:N). Ambas descripciones son válidas y representan la misma relación, solo que desde diferentes perspectivas.***

---

### ***Ejemplo con la relación entre usuarios y tareas:***

- **Uno a muchos (1:N):**
  - *Desde el punto de vista de **un usuario**, un usuario puede crear muchas tareas.*
  
- **Muchos a uno (N:1):**
  - *Desde el punto de vista de **una tarea**, muchas tareas pueden estar relacionadas con un único usuario (su creador).*

---

### ***Relación muchos a uno `(N:1)`***

- **Tareas -> Task (N):** *Muchas tareas pueden ser creadas por un solo usuario.*
- **Usuario -> User (1):** *Un único usuario puede ser el creador de muchas tareas.*

> [!IMPORTANT]
> **Ambas descripciones son correctas y solo varían en cómo se describe la relación: si se enfoca desde el usuario hacia las tareas o desde las tareas hacia el usuario.**

### ***Resumen***

- **1:N (uno a muchos):** *Un usuario crea muchas tareas.*
- **N:1 (muchos a uno):** *Muchas tareas pertenecen a un único usuario.*

- *Ambas expresan lo mismo, solo cambia la perspectiva.*

---

### ***Recomendaciones de Nomenclatura***

*En el modelado de bases de datos y desarrollo de aplicaciones es importante mantener una convención clara y consistente para los nombres de entidades, atributos y relaciones. Generalmente se recomienda lo siguiente:*

#### **1. Entidades (Tablas / Clases) → PascalCase**

- *Se escriben en **PascalCase** (cada palabra inicia con mayúscula, sin guiones ni guiones bajos).*
- *Ejemplos:*

  - *`User`*
  - *`Task`*
  - *`OrderDetail`*

🔹 *Motivo:* **Se diferencian claramente de los atributos y son fáciles de identificar como objetos principales en el modelo.**

---

#### **2. Atributos (Columnas / Campos) → snake_case**

- *Se escriben en **snake_case** (todo en minúscula, palabras separadas con guion bajo).*
- **Ejemplos:**

  - *`id`*
  - *`full_name`*
  - *`email_address`*
  - *`due_date`*

🔹 *Motivo:* **Es el estándar más usado en SQL y facilita la lectura, sobre todo en nombres largos.**

---

#### **3. Relaciones → verbo en PascalCase o snake_case**

- *Si se representan como entidades intermedias (tablas puente), se suelen usar en **PascalCase**.*
- *Ejemplo en tu caso: `Create`.*
- *Alternativamente, en bases de datos más complejas se recomienda snake_case: `user_task`.*

---

#### **4. Otras buenas prácticas:**

- *Usar nombres descriptivos pero no demasiado largos.*
- *Evitar acentos, eñes o caracteres especiales.*
- *Los booleanos suelen empezar con `is_`, `has_` o `status`. Ejemplo: `is_active`.*
- *Las claves primarias casi siempre se llaman `id`.*
- *Las claves foráneas se nombran como `<entidad>_id`. Ejemplo: `user_id`, `task_id`.*

---

## **Aplicando a tu modelo:**

- *Entidades: `User`, `Task`.*
- *Relación: `Create`.*
- *Atributos:*

  - *En `User`: `id`, `name`, `email`, `password`.*
  - *En `Task`: `id`, `title`, `description`, `status`, `due_date`.*
  - *En relación: `user_id`, `task_id` (si se materializa como tabla puente).*
