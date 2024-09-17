<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Inicialización de datos***

**Convenciones de nombres:**

- **CamelCase:** *Estilo de escritura donde cada palabra dentro de una frase comienza con mayúscula, excepto la primera (ej. `initDate`). Se usa comúnmente en programación para nombres de variables.*
- **lowercase:** *Todo en minúsculas (ej. `email`), típico para nombres de columnas en bases de datos.*

**Abreviaturas:**

- **PK:** *`PRIMARY KEY` – Identificador único para cada fila en una tabla.*
- **NN:** *`NOT NULL` – Significa que un campo no puede contener valores nulos, es decir, debe ser obligatorio.*

**Definición de la tabla `users`:**

- **user_id:** *Tipo `INT`, es la clave primaria (`PK`) y no puede ser nula (`NN`).*
- **name:** *Tipo `VARCHAR(50)`, no puede ser nula (`NN`).*
- **surname:** *Tipo `VARCHAR(50)`, puede ser nula.*
- **age:** *Tipo `INT`, puede ser nula.*
- **init_date:** *Tipo `DATE`, puede ser nula.*
- **email:** *Tipo `VARCHAR(100)`, no puede ser nula (`NN`).*

## ***Sintaxis de la creación de tabla en MySQL:***

- *El siguiente comando SQL crea una tabla llamada `users` en la base de datos `hello_mysql` con las columnas definidas anteriormente:*

```sql
mysql> CREATE TABLE `hello_mysql`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `surname` VARCHAR(50) NULL,
  `age` INT NULL,
  `init_date` DATE NULL,
  `email` VARCHAR(100) NULL,
  PRIMARY KEY (`user_id`)
);
```

```sql
mysql> CREATE TABLE `hello_mysql`.`users` (
    ->     `user_id` INT NOT NULL AUTO_INCREMENT,
    ->     `name` VARCHAR(50) NOT NULL,
    ->     `surname` VARCHAR(50) NULL,
    ->     `age` INT NULL,
    ->     `init_date` DATE NULL,
    ->     `email` VARCHAR(100) NULL,
    ->     PRIMARY KEY (`user_id`)
    -> );
Query OK, 0 rows affected (0.04 sec)
```

**Explicación del código:**

- **`para ...`:** *Los acentos invertidos **\`** se usan en MySQL para delimitar nombres de bases de datos, tablas y columnas. Esto es útil especialmente cuando los nombres podrían ser palabras reservadas o contienen caracteres especiales.*
- **. para:** *El punto **`.`** separa el nombre de la base de datos (`hello_mysql`) del nombre de la tabla (`users`). Indica que estamos creando la tabla `users` dentro de la base de datos `hello_mysql`.*

**Cada campo significa:**

- **`user_id`:** *Es un campo de tipo `INT`, que será autoincrementado (`AUTO_INCREMENT`), único y clave primaria (`PRIMARY KEY`).*
- **`name`:** *Un campo de texto de hasta 50 caracteres (`VARCHAR(50)`), que no puede ser nulo.*
- **`surname`:** *Un campo opcional de texto de hasta 50 caracteres, que puede ser nulo.*
- **`age`:** *Un campo numérico que puede ser nulo.*
- **`init_date`:** *Un campo de tipo `DATE` que almacena fechas en formato `AAAA-MM-DD`.*
- **`email`:** *Un campo de texto de hasta 100 caracteres que no puede ser nulo.*

**Formato `DATE`:**  

- *El tipo de dato `DATE` en MySQL almacena fechas en el formato **`YYYY-MM-DD`** (Año-Mes-Día), que sigue el estándar ISO 8601.*

---

### ***Añadir datos a la tabla `users`***

*Para añadir datos a una tabla en MySQL, utilizamos el comando `INSERT INTO`. A continuación se detallan ejemplos con explicaciones de cada parte.*

---

#### ***Ejemplo 1: Añadir un registro completo***

```sql
mysql> INSERT INTO `hello_mysql`.`users` (`user_id`, `name`, `surname`, `age`, `init_date`, `email`) 
VALUES ('1', 'Daniel', 'Perez Morales', '18', '2005-12-13', 'd4nitrix13@gmail.com');
Query OK, 1 row affected (0.02 sec)
```

**Explicación:**

- **`INSERT INTO`:** *Es el comando que usamos para insertar datos en una tabla.*
- **`hello_mysql`.`users`**:
  - *El **\`** (acento grave) se utiliza para delimitar el nombre de la base de datos y el nombre de la tabla, por si contienen caracteres especiales o coinciden con palabras reservadas.*
  - *El **`.`** (punto) separa la base de datos (`hello_mysql`) de la tabla (`users`).*
- **(`user_id`, `name`, `surname`, `age`, `init_date`, `email`)**:
  - *Estas son las columnas en las que vamos a insertar datos.*
  - *Los nombres de las columnas también están delimitados por **\`**.*
- **`VALUES`:** *Especifica los valores que vamos a insertar para cada columna.*
- **('1', 'Daniel', 'Perez Morales', '18', '2005-12-13', '<d4nitrix13@gmail.com>')**:
  - *Los valores están en el mismo orden que las columnas y entre paréntesis.*
  - *Las cadenas de texto y fechas están entre comillas simples.*

---

### ***Ejemplo 2: Insertar un registro omitiendo algunas columnas***

```sql
mysql> INSERT INTO `hello_mysql`.`users` (`user_id`, `name`, `age`, `init_date`) 
VALUES ('2', 'Benjamin', '21', '2000-10-18');
Query OK, 1 row affected (0.01 sec)
```

- *En este caso, no se ha especificado la columna `email`, lo que significa que el valor predeterminado para esa columna será `NULL` (a menos que se haya definido otro valor predeterminado al crear la tabla).*

---

#### ***Ejemplo 3: Insertar un registro sin especificar `user_id`***

```sql
mysql> INSERT INTO `hello_mysql`.`users` (`name`, `age`, `init_date`) 
VALUES ('Danna', '13', '2003-02-04');
Query OK, 1 row affected (0.01 sec)
```

**Explicación:**

- *No es necesario especificar `user_id` porque la columna está configurada como `AUTO_INCREMENT`. MySQL automáticamente asigna el siguiente valor disponible para esta columna.*

---

#### **Ejemplo 4: Insertar un registro con un ID específico**

```sql
mysql> INSERT INTO `hello_mysql`.`users` (`user_id`, `name`, `age`, `email`) 
VALUES ('5', 'Isabella', '31', 'isabella@gmail.com');
Query OK, 1 row affected (0.01 sec)
```

**Explicación:**

- *En este caso, hemos especificado manualmente el valor de `user_id` como `5`. Aunque el ID generalmente se autogenera, puedes asignar un valor específico mientras no haya conflictos con otros valores existentes.*

---

#### ***Ejemplo 5: El siguiente registro recibirá el ID autogenerado***

```sql
mysql> INSERT INTO `hello_mysql`.`users` (`name`, `surname`, `age`, `init_date`, `email`) 
VALUES ('Raquel', 'Morales Gamboa', '28', '1985-09-02', 'raquel@gmail.com');
Query OK, 1 row affected (0.01 sec)
```

**Explicación:**

- *MySQL asignará el siguiente valor disponible para `user_id`. Si el último ID asignado fue `5`, este registro recibirá el valor `6`.*

---

#### ***Ejemplo 6: Insertar un registro con un `user_id` que no está en uso***

```sql
mysql> INSERT INTO `hello_mysql`.`users` (`user_id`, `name`, `surname`, `age`) 
VALUES ('4', 'Luna', 'Morales', '23');
Query OK, 1 row affected (0.01 sec)
```

**Explicación:**

- *Hemos asignado manualmente el valor `4` a `user_id`. No da error porque el valor `4` no estaba previamente asignado a ningún registro en la tabla.*

---

### ***Uso de comillas simples en SQL***

- *En SQL, usamos **comillas simples ('')** en lugar de comillas dobles para delimitar **cadenas de texto** (como nombres, apellidos, emails, etc.). Esto es un estándar en la mayoría de los sistemas de bases de datos como MySQL, PostgreSQL y SQLite.*

- *Las **comillas simples** se utilizan para valores de tipo texto (VARCHAR, TEXT, DATE, etc.).*
- *Los **números** (tipos como `INT`, `FLOAT`, etc.) pueden ir con o sin comillas simples:*
  - *Ejemplo válido: `'25'` o `25` para el campo `age`.*
  
**¿Por qué no usamos comillas dobles ("")?**

- *En SQL, las comillas dobles se utilizan para delimitar nombres de **identificadores** (como nombres de columnas o tablas) en algunos motores de base de datos. Aunque MySQL permite usar comillas dobles, es más recomendable seguir el estándar que dicta el uso de comillas simples para las cadenas de texto.*
  - *Ejemplo válido: `"25"` o `25` para el campo `age`.*
  - *Ejemplo válido: `"Daniel"` para el campo `name`.*

---

### ***Ejemplo de error por omitir un campo obligatorio (`NOT NULL`)***

- *Si intentas hacer una inserción omitiendo un campo marcado como **NOT NULL** sin un valor predeterminado (como `name` en el siguiente ejemplo), recibirás un error:*

```sql
mysql> INSERT INTO `hello_mysql`.`users` (`surname`, `age`)
    -> VALUES ('Silva', 23);
ERROR 1364 (HY000): Field 'name' doesn't have a default value
```

**Explicación del error:**

- *El campo `name` está marcado como **NOT NULL**, lo que significa que no puede ser omitido ni dejarse vacío.*
- *Si no especificas un valor y el campo no tiene un valor predeterminado, MySQL no podrá completar la operación.*

---

### ***Solución: Incluir el campo obligatorio***

*Para solucionar el error, debes proporcionar un valor para el campo `name`, ya que es obligatorio:*

```sql
mysql> INSERT INTO `hello_mysql`.`users` (`name`, `surname`, `age`) VALUES ("Matias", "Silva", 25);
```

```sql
mysql> INSERT INTO `hello_mysql`.`users` (`name`, `surname`, `age`) 
    -> VALUES ("Matias", "Silva", 25);
Query OK, 1 row affected (0.01 sec)
```

**Explicación:**

- *Hemos añadido el campo `name` en la lista de columnas, y ahora la consulta se ejecuta correctamente.*
