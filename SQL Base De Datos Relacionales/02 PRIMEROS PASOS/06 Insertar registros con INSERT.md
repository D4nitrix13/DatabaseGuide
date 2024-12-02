<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Insertar Registros con `INSERT` en SQLite3***

---

## ***Sintaxis básica***

- **Para insertar un registro en una tabla, utiliza la siguiente sintaxis:**

```sql
INSERT INTO name_table (columna1, columna2, columna3) VALUES (valor1, valor2, valor3);
```

---

### ***Ejemplo de inserción***

- **Para insertar un nuevo registro en la tabla `usuarios`, puedes utilizar el siguiente comando:**

```sql
INSERT INTO usuarios (name, apellido, age) VALUES ("Danna", "Perez", 21);
```

```sql
sqlite> INSERT INTO usuarios (name, apellido, age) VALUES ("Danna", "Perez", 21);
```

---

#### ***Descripción del ejemplo***

- **`INSERT INTO usuarios`:** *Especifica la tabla en la que deseas insertar el nuevo registro.*
- **`(name, apellido, age)`:** *Enumera las columnas donde se insertarán los valores.*
- **`VALUES ("Danna", "Perez", 21)`:** *Proporciona los valores que se insertarán en las columnas especificadas.*

---

#### ***Consideraciones***

- *Asegúrate de que los tipos de datos de los valores coincidan con los tipos de las columnas en la tabla.*
- *Si alguna columna tiene una restricción de `NOT NULL`, deberás proporcionar un valor para esa columna al realizar la inserción.*
