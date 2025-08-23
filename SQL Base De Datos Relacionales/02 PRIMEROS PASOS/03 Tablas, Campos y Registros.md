<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

<!-- https://youtu.be/DFg1V-rO6Pg?t=2191 -->

# ***Tablas, Campos y Registros en SQLite3***

---

## ***Tablas en SQLite3***

- **Una tabla en SQLite3** *es una estructura que organiza los datos en filas y columnas. Cada tabla debe tener un name único dentro de la base de datos y puede contener múltiples registros. Los datos en una tabla se almacenan en un formato similar a una hoja de cálculo.*

- **Ejemplo de creación de una tabla en SQLite3:**

```sql
CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER
);
```

- **Descripción:** **Aquí se crea una tabla llamada `students` con tres columnas: `id`, `name` y `age`. La columna `id` actúa como clave primaria, asegurando que cada registro tenga un identificador único. La columna `name` está configurada como `NOT NULL`, lo que significa que debe contener un valor.**

---

### ***Campos en SQLite3***

- **Un campo** *es cada una de las columnas que forman parte de una tabla. Cada campo tiene un tipo de datos asociado que define qué tipo de información puede almacenar (texto, números, fechas, etc.).*

- **Ejemplo de campos en la tabla `students`:**

  - **`id`:** **Campo entero que sirve como clave primaria.**
  - **`name`:** **Campo de tipo texto que almacena el name del estudiante.**
  - **`age`:** **Campo de tipo entero que almacena la age del estudiante.**

- **Tipos de datos comunes en SQLite3:**

  - **`INTEGER`:** **Almacena números enteros.**
  - **`TEXT`:** **Almacena cadenas de texto.**
  - **`REAL`:** **Almacena números de punto flotante.**
  - **`BLOB`:** **Almacena datos binarios, como imágenes o ficheros.**
  - **`NUMERIC`:** **Almacena números en formato decimal, permitiendo precisión en cálculos.**
  - **`NULL`:** **Campo sin valor asignado.**

- **Descripción:** **Cada fila en la tabla `students` estará formada por los valores que correspondan a los campos `id`, `name` y `age`.**

---

#### ***Registros en SQLite3***

- **Un registro** *(o fila) es una entrada individual en una tabla que contiene valores específicos para cada uno de los campos definidos en la estructura de la tabla.*

- **Ejemplo de un registro en la tabla `students`:**

```sql
INSERT INTO students (name, age) VALUES ('Daniel', 18);
```

```sql
sqlite> SELECT * FROM students;
1|Daniel|18
```

- **Descripción:** **El comando `INSERT INTO` agrega un registro a la tabla `students` con los valores `'Daniel'` y `18` para los campos `name` y `age`, respectivamente. El campo `id` se asigna automáticamente debido a su función como clave primaria.**

---

#### ***Ver Tablas y sus Estructuras en SQLite3***

- **Para listar todas las tablas en la base de datos, utiliza:**

```sql
.tables
```

```sql
sqlite> .tables
students
```

- **Descripción:** **Muestra todas las tablas en la base de datos actual.**

- **Para mostrar la estructura de una tabla específica, utiliza:**

> [!NOTE]
> *En SQLite, para ver los nombres de los campos (columnas) de una tabla, puedes usar el comando `PRAGMA table_info`. Aquí tienes un ejemplo para obtener los nombres de las columnas de una tabla llamada `Products`:*

```sql
PRAGMA table_info(students);
```

- *Esto devolverá una lista con los detalles de cada columna, incluyendo su nombre, tipo de datos, si puede ser `NULL`, si es clave primaria, etc.*

**El resultado típico incluye columnas como:**

- **`cid`:** *El índice de la columna.*
- **`name`:** *El nombre de la columna.*
- **`type`:** *El tipo de datos de la columna.*
- **`notnull`:** *Indica si la columna puede ser `NULL` (0 significa que puede ser `NULL`, 1 significa que no puede ser `NULL`).*
- **`dflt_value`:** *El valor predeterminado de la columna, si existe.*
- **`pk`:** *Indica si la columna es clave primaria (1 significa que es clave primaria, 0 significa que no lo es).*

```sql
sqlite> PRAGMA table_info(students);
0|id|INTEGER|0||1
1|name|TEXT|1||0
2|age|INTEGER|0||0
```

- **Descripción:** **Este comando muestra la estructura de la tabla `students`, con detalles sobre cada campo (columna), su tipo de dato, si permite valores `NULL`, y si es clave primaria.**

**Por ejemplo, para ver solo los nombres de las columnas en la tabla `students`, puedes hacer algo como esto:**

```sql
SELECT name FROM pragma_table_info('students');
```

```sql
sqlite> SELECT name FROM pragma_table_info('students');
id
name
age
```

- *Este comando devolverá una lista con los nombres de las columnas de la tabla `students`.*
