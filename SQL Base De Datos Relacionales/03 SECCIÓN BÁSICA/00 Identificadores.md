<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Identificadores***

---

## ***¿Qué son los Identificadores?***

- **Descripción:**
  - **Un identificador en bases de datos es un campo que se utiliza para distinguir de manera única cada registro en una tabla. Los identificadores comúnmente se implementan como claves primarias (`PRIMARY KEY`). En SQLite3, los identificadores se suelen crear como números enteros autoincrementales, que evitan la duplicación de datos y facilitan las referencias entre tablas relacionadas.**

- **Problema que Soluciona:**
  **Sin identificadores únicos, no habría una manera eficiente de diferenciar registros que podrían contener información similar o incluso idéntica. Por ejemplo, si se añaden varias filas con los mismos datos, los identificadores garantizan que cada fila sea única, lo que facilita las actualizaciones, eliminaciones y consultas.**

---

### ***Repetición de Datos sin Identificador***

- **En el siguiente ejemplo, se muestra cómo los datos se repiten cuando no hay un identificador adecuado:**

```sql
INSERT INTO usuarios (name, apellido, age) VALUES ("Daniel", "Perez Morales", 18);
```

```sql
sqlite> INSERT INTO usuarios (name, apellido, age) VALUES ("Daniel", "Perez Morales", 18);
```

```sql
sqlite> SELECT * FROM usuarios;
Danna|Perez|21
Daniel|Perez Morales|18
Luna|Morales|16
Coby|Morales|17
Daniel|Perez Morales|18
```

- *Aquí, el mismo registro de **"Daniel Perez Morales"** se repite sin una manera clara de diferenciarlos. **¿Cómo identificamos cuál es cuál?** Esto se soluciona con la adición de un identificador único para cada registro.*

---

#### ***Creación de una Tabla con Clave Primaria Autoincremental***

**Borramos la tabla original:**

```sql
DROP TABLE usuarios;
```

```sql
sqlite> DROP TABLE usuarios;
```

- *Para evitar la duplicación de datos y mejorar la identificación de registros, es una buena práctica utilizar un campo de **clave primaria autoincremental**.*

```sql
CREATE TABLE "usuarios" (
    "id_user" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,  -- ID del usuario, clave primaria y autoincremental
    "name" TEXT DEFAULT "Batman",                          -- Nombre del usuario, con valor por defecto "Batman"
    "apellido" TEXT,                                       -- Apellido del usuario, campo opcional
    "age" INTEGER                                          -- Edad del usuario, almacenada como número entero
);
```

```sql
sqlite> CREATE TABLE "usuarios" (
    "id_user" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,  -- ID del usuario, clave primaria y autoincremental
    "name" TEXT DEFAULT "Batman",                          -- Nombre del usuario, con valor por defecto "Batman"
    "apellido" TEXT,                                       -- Apellido del usuario, campo opcional
    "age" INTEGER                                          -- Edad del usuario, almacenada como número entero
);
```

- *El campo **`id_user`** es la clave primaria, y su valor será generado automáticamente para cada registro nuevo, garantizando que cada fila sea única.*

---

#### ***Insertando Registros con Identificadores Autoincrementales***

- **A continuación, se insertan registros con valores `NULL`, lo que permite ver cómo los identificadores se autoincrementan automáticamente:**

```sql
INSERT INTO usuarios (name, apellido, age) VALUES (NULL, NULL, NULL);
INSERT INTO usuarios (name, apellido, age) VALUES (NULL, NULL, NULL);
INSERT INTO usuarios (name, apellido, age) VALUES (NULL, NULL, NULL);
INSERT INTO usuarios (name, apellido, age) VALUES (NULL, NULL, NULL);
```

```sql
sqlite> INSERT INTO usuarios (name, apellido, age) VALUES (NULL, NULL, NULL);
sqlite> INSERT INTO usuarios (name, apellido, age) VALUES (NULL, NULL, NULL);
sqlite> INSERT INTO usuarios (name, apellido, age) VALUES (NULL, NULL, NULL);
sqlite> INSERT INTO usuarios (name, apellido, age) VALUES (NULL, NULL, NULL);
```

**Resultado:**

```sql
sqlite> SELECT * FROM usuarios;
1|||
2|||
3|||
4|||
```

**Luego, se agrega un registro con datos completos:**

```sql
INSERT INTO usuarios (name, apellido, age) VALUES ("Daniel", "Perez Morales", 18);
```

```sql
sqlite> INSERT INTO usuarios (name, apellido, age) VALUES ("Daniel", "Perez Morales", 18);
```

**Resultado:**

```sql
SELECT * FROM usuarios;
```

```sql
sqlite> SELECT * FROM usuarios;
1|||
2|||
3|||
4|||
5|Daniel|Perez Morales|18
```

---

#### ***Actualización de Registros con Identificadores***

- **Una vez que los identificadores están presentes, puedes utilizar el campo `id_user` para hacer referencia y actualizar registros específicos. Por ejemplo:**

```sql
UPDATE usuarios
SET name = 'Danna', apellido = 'Morales', age = 16
WHERE id_user = 1;

UPDATE usuarios
SET name = 'Benjamin', apellido = 'Perez', age = 19
WHERE id_user = 2;

UPDATE usuarios
SET name = 'Raquel', apellido = 'Morales Gamboa', age = 33
WHERE id_user = 3;

UPDATE usuarios
SET name = 'Matias', apellido = 'Morales', age = 21
WHERE id_user = 4;

UPDATE usuarios
SET name = 'Luna', apellido = 'Morales', age = 22
WHERE id_user = 5;
```

```sql
sqlite> UPDATE usuarios
SET name = 'Danna', apellido = 'Morales', age = 16
WHERE id_user = 1;

sqlite> UPDATE usuarios
SET name = 'Benjamin', apellido = 'Perez', age = 19
WHERE id_user = 2;

sqlite> UPDATE usuarios
SET name = 'Raquel', apellido = 'Morales Gamboa', age = 33
WHERE id_user = 3;

sqlite> UPDATE usuarios
SET name = 'Matias', apellido = 'Morales', age = 21
WHERE id_user = 4;

sqlite> UPDATE usuarios
SET name = 'Luna', apellido = 'Morales', age = 22
WHERE id_user = 5;
```

---

#### ***Buenas Prácticas: Uso de Nombres de Clave en Tablas Relacionadas***

- *Si planeas hacer referencias entre tablas, es recomendable usar el mismo nombre para la clave primaria en ambas tablas. Esto facilita la comprensión y el mantenimiento del esquema.*

```sql
CREATE TABLE "turnos_medicos" (
    "id_turno" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "profesional" TEXT,
    "id_user" INTEGER,         -- Referencia a la tabla 'usuarios'
    "motivo" TEXT,
    "horario" TEXT
);
```

```sql
sqlite> CREATE TABLE "turnos_medicos" (
    "id_turno" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "profesional" TEXT,
    "id_user" INTEGER,         -- Referencia a la tabla 'usuarios'
    "motivo" TEXT,
    "horario" TEXT
);
```

---

#### ***Insertar datos en la tabla turnos_medicos:***

```sql
INSERT INTO turnos_medicos (profesional, id_user, motivo, horario) VALUES ("Dr. Ramirez", 6, "Dolor de Panza", "12:30");
```

```sql
sqlite> INSERT INTO turnos_medicos (profesional, id_user, motivo, horario) VALUES ("Dr. Ramirez", 6, "Dolor de Panza", "12:30");
```

**Vemos registros:**

```sql
SELECT * FROM turnos_medicos;
```

```sql
sqlite> SELECT * FROM turnos_medicos;
1|Dr. Ramirez|6|Dolor de Panza|12:30
```

- **Insertar datos en la tabla turnos_medicos nuevamente**

```sql
INSERT INTO turnos_medicos (profesional, id_user, motivo, horario) VALUES ("Dr. Ramirez", 3, "Dolor de Cabeza", "11:30");
```

```sql
sqlite> INSERT INTO turnos_medicos (profesional, id_user, motivo, horario) VALUES ("Dr. Ramirez", 3, "Dolor de Cabeza", "11:30");
```

- **Ver registros:**

```sql
SELECT * FROM turnos_medicos;
```

```sql
sqlite> SELECT * FROM turnos_medicos;
1|Dr. Ramirez|6|Dolor de Panza|12:30
2|Dr. Ramirez|3|Dolor de Cabeza|11:30
```

#### ***Consulta Relacionada entre Tablas***

- **Para obtener una vista combinada de los datos de ambas tablas, puedes usar una consulta sinérgica como esta:**

```sql
SELECT * FROM turnos_medicos, usuarios;
```

```sql
sqlite> SELECT * FROM turnos_medicos, usuarios;
```

**Resultado:**

```sql
sqlite> SELECT * FROM turnos_medicos, usuarios;
1|Dr. Ramirez|6|Dolor de Panza|12:30|1|Danna|Morales|16
1|Dr. Ramirez|6|Dolor de Panza|12:30|2|Benjamin|Perez|19
1|Dr. Ramirez|6|Dolor de Panza|12:30|3|Raquel|Morales Gamboa|33
1|Dr. Ramirez|6|Dolor de Panza|12:30|4|Matias|Morales|21
1|Dr. Ramirez|6|Dolor de Panza|12:30|5|Luna|Morales|22
1|Dr. Ramirez|6|Dolor de Panza|12:30|6|Daniel|Perez Morales|18
2|Dr. Ramirez|3|Dolor de Cabeza|11:30|1|Danna|Morales|16
2|Dr. Ramirez|3|Dolor de Cabeza|11:30|2|Benjamin|Perez|19
2|Dr. Ramirez|3|Dolor de Cabeza|11:30|3|Raquel|Morales Gamboa|33
2|Dr. Ramirez|3|Dolor de Cabeza|11:30|4|Matias|Morales|21
2|Dr. Ramirez|3|Dolor de Cabeza|11:30|5|Luna|Morales|22
2|Dr. Ramirez|3|Dolor de Cabeza|11:30|6|Daniel|Perez Morales|18
```

---

#### ***Borrado de Registros***

- *Para eliminar todos los registros en la tabla `usuarios`, puedes ejecutar el siguiente comando:*

```sql
DELETE FROM usuarios;
```

```sql
sqlite> DELETE FROM usuarios;
```

- *Esto vacía la tabla, pero **los identificadores autoincrementales continuarán desde el último valor**. Si se necesita restablecer el contador de autoincremento, habría que recrear la tabla.*

---

### ***Resumen***

- **Identificadores:** *Clave para garantizar la unicidad de registros.*
- **Problema que soluciona:** *Evita duplicaciones, facilita actualizaciones y relaciones entre tablas.*
- **Clave primaria autoincremental:** *Genera automáticamente un identificador único.*
- **Buenas prácticas:** *Usar nombres consistentes de claves primarias para facilitar referencias entre tablas.*

- **Esta estructura permite un control más preciso y robusto sobre los datos.**
