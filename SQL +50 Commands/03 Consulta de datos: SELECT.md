<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Consulta de Datos: `SELECT` Statements***

> [!IMPORTANT]
> *En SQL, la instrucción `SELECT` se utiliza para consultar datos de una base de datos. Por convención, es recomendable escribir las sentencias SQL en mayúsculas para mejorar la legibilidad.*

---

## ***Componentes Básicos de una Consulta SQL***

1. **`SELECT`:** *Especifica las columnas que se desean recuperar.*
2. **`*`:** *Indica que se deben seleccionar todas las columnas de la tabla.*
3. **`FROM`:** *Especifica la tabla desde la cual se recuperarán los datos.*
4. **`;`:** *Se utiliza para finalizar la instrucción SQL (no siempre necesario, pero recomendable).*

---

### ***Ejemplo: Recuperar Todos los Datos***

```sql
SELECT * FROM `hello_mysql`.`users`;
```

- **`SELECT *`:** *Recupera todas las columnas de la tabla.*
- **`FROM hello_mysql.users`:** *Indica que los datos se deben recuperar de la tabla `users` en la base de datos `hello_mysql`.*

**Resultado:**

```sql
+---------+----------+----------------+------+------------+----------------------+
| user_id | name     | surname        | age  | init_date  | email                |
+---------+----------+----------------+------+------------+----------------------+
|       1 | Daniel   | Perez Morales  |   18 | 2005-12-13 | d4nitrix13@gmail.com |
|       2 | Benjamin | NULL           |   21 | 2000-10-18 | NULL                 |
|       3 | Danna    | NULL           |   13 | 2003-02-04 | NULL                 |
|       4 | Luna     | Morales        |   23 | NULL       | NULL                 |
|       5 | Isabella | NULL           |   31 | NULL       | isabella@gmail.com   |
|       6 | Raquel   | Morales Gamboa |   28 | 1985-09-02 | raquel@gmail.com     |
+---------+----------+----------------+------+------------+----------------------+
6 rows in set (0.00 sec)
```

---

#### ***Ejemplo: Recuperar Solo Nombres***

```sql
SELECT name FROM `hello_mysql`.`users`;
```

- **`SELECT name`:** *Recupera únicamente la columna `name`.*

**Resultado:**

```sql
+----------+
| name     |
+----------+
| Daniel   |
| Benjamin |
| Danna    |
| Luna     |
| Isabella |
| Raquel   |
+----------+
6 rows in set (0.00 sec)
```

---

#### ***Ejemplo: Recuperar ID y Nombre***

```sql
SELECT user_id, name FROM `hello_mysql`.`users`;
```

- **`SELECT user_id, name`:** *Recupera solo las columnas `user_id` y `name`.*

**Resultado:**

```sql
+---------+----------+
| user_id | name     |
+---------+----------+
|       1 | Daniel   |
|       2 | Benjamin |
|       3 | Danna    |
|       4 | Luna     |
|       5 | Isabella |
|       6 | Raquel   |
+---------+----------+
6 rows in set (0.00 sec)
```

---

### ***Consultas en PostgreSQL***

- **Cuando trabajas con PostgreSQL, puedes realizar varias operaciones básicas para consultar datos de la base de datos. Aquí está una descripción detallada de cómo conectar, consultar y trabajar con datos en PostgreSQL:**

#### ***Conectar a una Base de Datos***

- **Para conectarte a una base de datos específica, usa el comando `\connect` (o `\c` como abreviatura). Por ejemplo:**

```sql
\connect hello_postgresql;
```

```sql
postgres=# \connect hello_postgresql;
You are now connected to database "hello_postgresql" as user "postgres".
```

- **Este comando cambia la conexión al `hello_postgresql`, permitiéndote ejecutar consultas sobre esta base de datos.**

---

#### ***Consultar Todos los Datos de una Tabla***

- **Para recuperar todos los datos de una tabla, usa el comando `SELECT * FROM` seguido del nombre de la tabla:**

```sql
SELECT * FROM users;
```

```sql
hello_postgresql=# SELECT * FROM users;
 user_id |   name   |    surname     | age | init_date  |        email
---------+----------+----------------+-----+------------+----------------------
       1 | Daniel   | Perez Morales  |  18 | 2005-12-13 | d4nitrix13@gmail.com
       2 | Benjamin |                |  21 | 2000-10-18 |
       3 | Danna    |                |  13 | 2003-02-04 |
       4 | Luna     | Morales        |  23 |            |
       5 | Isabella |                |  31 |            | isabella@gmail.com
       6 | Raquel   | Morales Gamboa |  28 | 1985-09-02 | raquel@gmail.com
(6 rows)
```

- **`SELECT *`:** *Recupera todas las columnas de la tabla.*
- **`FROM users`:** *Indica la tabla `users` de la cual se recuperan los datos.*

---

#### ***Consultar Una Columna Específica***

- **Para recuperar solo una columna de la tabla, usa el comando `SELECT` seguido del nombre de la columna:**

```sql
SELECT name FROM users;
```

```sql
hello_postgresql=# SELECT name FROM users;
   name
----------
 Daniel
 Benjamin
 Danna
 Luna
 Isabella
 Raquel
(6 rows)
```

- **`SELECT name`:** *Recupera solo la columna `name` de la tabla.*

---

#### ***Consultar Varias Columnas***

- **Para recuperar varias columnas, separa los nombres de las columnas con comas:**

```sql
SELECT user_id, name FROM users;
```

```sql
hello_postgresql=# SELECT user_id, name FROM users;
 user_id |   name
---------+----------
       1 | Daniel
       2 | Benjamin
       3 | Danna
       4 | Luna
       5 | Isabella
       6 | Raquel
(6 rows)
```

- **`SELECT user_id, name`:** *Recupera las columnas `user_id` y `name` de la tabla.*

---

### ***Consultas en SQLite***

- **SQLite es un sistema de gestión de bases de datos ligero y fácil de usar. A continuación, se describe cómo realizar consultas básicas para obtener datos de una tabla en SQLite.**

---

#### ***Consultar Todos los Datos de una Tabla:***

- **Para recuperar todos los datos de una tabla, usa el comando `SELECT * FROM` seguido del nombre de la tabla:**

```sql
SELECT * FROM users;
```

```sql
sqlite> SELECT * FROM users;
1|Daniel|Perez Morales|18|2005-12-13|d4nitrix13@gmail.com
2|Benjamin||21|2000-10-18|
3|Danna||13|2003-02-04|
4|Luna|Morales|23||
5|Isabella||31||isabella@gmail.com
6|Raquel|Morales Gamboa|28|1985-09-02|raquel@gmail.com
```

- **`SELECT *`:** *Recupera todas las columnas de la tabla.*
- **`FROM users`:** *Especifica la tabla `users` de la cual se están recuperando los datos.*
- **`|`:** *En SQLite, los resultados se muestran separados por barras verticales `|` en lugar de columnas tabulares.*

---

#### ***Consultar Una Columna Específica:***

- **Para recuperar solo una columna de la tabla, usa el comando `SELECT` seguido del nombre de la columna:**

```sql
SELECT name FROM users;
```

```sql
sqlite> SELECT name FROM users;
Daniel
Benjamin
Danna
Luna
Isabella
Raquel
```

- **`SELECT name`:** *Recupera solo la columna `name` de la tabla `users`.*

---

#### ***Consultar Varias Columnas:***

- **Para recuperar varias columnas, separa los nombres de las columnas con comas:**

```sql
SELECT user_id, name FROM users;
```

```sql
sqlite> SELECT user_id, name FROM users;
1|Daniel
2|Benjamin
3|Danna
4|Luna
5|Isabella
6|Raquel
```

- **`SELECT user_id, name`:** *Recupera las columnas `user_id` y `name` de la tabla `users`.*

---

### ***¿Qué es un Archivo `.sql`?***

> [!NOTE]
> *Un archivo con la extensión `.sql` es un archivo de texto que contiene comandos y sentencias en lenguaje SQL (Structured Query Language). Estos archivos son utilizados para almacenar y ejecutar scripts que realizan diversas operaciones en una base de datos. Los comandos en un archivo `.sql` pueden incluir:*

- **Definición de estructuras de bases de datos:** *Creación y modificación de tablas, índices, y otros objetos de base de datos.*
- **Manipulación de datos:** *Inserción, actualización, eliminación y consulta de datos.*
- **Configuración de la base de datos:** *Definición de permisos, transacciones y otras configuraciones de la base de datos.*

**Los archivos `.sql` son comúnmente utilizados para:**

- **Importar o exportar datos:** *Mover datos entre diferentes sistemas de bases de datos.*
- **Automatizar tareas:** *Ejecutar una serie de comandos SQL de manera secuencial para configurar o actualizar una base de datos.*
- **Documentar:** *Guardar scripts y comandos SQL para referencia futura.*

---

### ***Ejemplo de Archivo `.sql`***

- **A continuación, se muestra un ejemplo de un archivo `.sql` con comentarios que explican su contenido y propósito.**

```sql
-- Sintaxis Comentarios MySQL
-- Este comando selecciona todos los registros y columnas de la tabla `users` en la base de datos `hello_mysql`.
SELECT * FROM `hello_mysql`.`users`;

-- Este comando selecciona solo la columna `name` de la tabla `users` en la base de datos `hello_mysql`.
SELECT name FROM `hello_mysql`.`users`;

-- Este comando selecciona las columnas `user_id` y `name` de la tabla `users` en la base de datos `hello_mysql`.
SELECT user_id, name FROM `hello_mysql`.`users`;
```

---

### ***Explicación de las Sentencias SQL***

1. **`SELECT * FROM`hello_mysql`.`users`;`**
   - **`SELECT *`:** *Esta parte del comando indica que se deben seleccionar todas las columnas disponibles.*
   - **`FROM 'hello_mysql'.'users'`:** *Especifica la tabla `users` en la base de datos `hello_mysql` desde la cual se deben recuperar los datos.*
   - **`*`:** *Significa "todas las columnas".*

2. **`SELECT name FROM`hello_mysql`.`users`;`**
   - **`SELECT name`:** *Indica que solo se debe recuperar la columna `name`.*
   - **`FROM 'hello_mysql'.'users'`:** *Especifica la tabla `users` en la base de datos `hello_mysql`.*

3. **`SELECT user_id, name FROM`hello_mysql`.`users`;`**
   - **`SELECT user_id, name`:** *Indica que se deben recuperar las columnas `user_id` y `name`.*
   - **`FROM 'hello_mysql'.'users'`:** *Especifica la tabla `users` en la base de datos `hello_mysql`.*

- **Estos comandos SQL son ejemplos básicos de cómo consultar datos de una base de datos utilizando el lenguaje SQL. Los comentarios en el archivo `.sql` proporcionan explicaciones sobre lo que cada comando hace, facilitando su comprensión y mantenimiento.**

---

### ***Sintaxis y Comentarios para PostgreSQL***

- **Un archivo `.sql` para PostgreSQL puede incluir tanto comandos SQL como comandos específicos de PostgreSQL que no son parte del estándar SQL. A continuación, se explica cada parte de un archivo `.sql` con comentarios sobre su propósito y sintaxis.**

```sql
-- Sintaxis Comentarios PostgreSQL

-- Conecta a la base de datos `hello_postgresql` como el usuario actual.
\connect hello_postgresql;

-- Este comando selecciona todos los registros y columnas de la tabla `users`.
SELECT * FROM users;

-- Este comando selecciona solo la columna `name` de la tabla `users`.
SELECT name FROM users;

-- Este comando selecciona las columnas `user_id` y `name` de la tabla `users`.
SELECT user_id, name FROM users;
```

---

### ***Explicación de las Sentencias***

1. **`\connect hello_postgresql;`**
   - **`\connect hello_postgresql;`:** *Es un comando específico de PostgreSQL utilizado en el cliente de línea de comandos `psql` para cambiar a la base de datos llamada `hello_postgresql`. Este comando no es parte del lenguaje SQL estándar, sino una característica de la interfaz `psql`.*

2. **`SELECT * FROM users;`**
   - **`SELECT *`:** *Selecciona todas las columnas de la tabla.*
   - **`FROM users`:** *Indica que los datos deben ser recuperados de la tabla `users`.*

3. **`SELECT name FROM users;`**
   - **`SELECT name`:** *Selecciona únicamente la columna `name`.*
   - **`FROM users`:** *Indica que los datos deben ser recuperados de la tabla `users`.*

4. **`SELECT user_id, name FROM users;`**
   - **`SELECT user_id, name`:** *Selecciona las columnas `user_id` y `name`.*
   - **`FROM users`:** *Indica que los datos deben ser recuperados de la tabla `users`.*

---

### ***Explicación Adicional***

- **`SELECT`:** *Es una instrucción en SQL que se utiliza para consultar datos de una base de datos. Los resultados de una consulta `SELECT` se muestran en forma de tabla.*
- **`*`:** *Es un comodín que representa todas las columnas de una tabla.*
- **`FROM`:** *Especifica la tabla desde la cual se deben recuperar los datos.*
- **`user_id`**, **`name`:** *Son nombres de columnas en la tabla `users`.*

- **En resumen, los comentarios en el archivo `.sql` ayudan a entender la función de cada comando SQL y los comandos específicos de PostgreSQL. Estos comentarios son útiles para documentar el propósito de cada instrucción y facilitar la comprensión y el mantenimiento del código.**

---

### ***Sintaxis y Comentarios para SQLite3***

- **Un archivo `.sql` para SQLite3 contiene comandos SQL que se ejecutan en el motor de base de datos SQLite. A continuación, se explican cada una de las sentencias con comentarios.**

```sql
-- Sintaxis Comentarios SQLite3

-- Este comando selecciona todos los registros y columnas de la tabla `users`.
SELECT * FROM `users`;

-- Este comando selecciona solo la columna `name` de la tabla `users`.
SELECT name FROM `users`;

-- Este comando selecciona las columnas `user_id` y `name` de la tabla `users`.
SELECT user_id, name FROM `users`;
```

---

### ***Explicación de las Sentencias:***

1. **`SELECT * FROM users;`**
   - **`SELECT *`:** *El asterisco `*` se usa para seleccionar todas las columnas de la tabla.*
   - **`FROM users`:** *Indica que se deben recuperar los datos de la tabla `users`.*

2. **`SELECT name FROM users;`**
   - **`SELECT name`:** *Selecciona únicamente la columna `name`.*
   - **`FROM users`:** *Indica que los datos deben ser recuperados de la tabla `users`.*

3. **`SELECT user_id, name FROM users;`**
   - **`SELECT user_id, name`:** *Selecciona las columnas `user_id` y `name`.*
   - **`FROM users`:** *Indica que los datos deben ser recuperados de la tabla `users`.*

---

### ***Explicación Adicional:***

- **`SELECT`:** *Es una instrucción en SQL utilizada para consultar datos en una base de datos. Los resultados de una consulta `SELECT` se muestran en forma de tabla.*
- **`*`:** *Un comodín que representa todas las columnas en la tabla.*
- **`FROM`:** *Especifica la tabla de la cual se recuperarán los datos.*
- **`user_id`**, **`name`:** *Son nombres de columnas en la tabla `users`.*

- **En resumen, los comentarios en el archivo `.sql` ayudan a documentar el propósito de cada comando y facilitan la comprensión de las consultas realizadas. Los comentarios son útiles tanto para el mantenimiento del código como para los desarrolladores que revisan el archivo en el futuro.**
