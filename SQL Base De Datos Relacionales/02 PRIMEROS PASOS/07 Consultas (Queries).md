<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Consultas (Queries)***

---

## ***Operaciones CRUD***

- *CRUD son las siglas de **Crear, Leer, Actualizar y Eliminar**. Estas son las operaciones básicas que se pueden realizar en una base de datos:*

- **Crear (Create):** *Inserción de nuevos registros.*
- **Leer (Read):** *Consultas para recuperar datos.*
- **Actualizar (Update):** *Modificación de registros existentes.*
- **Eliminar (Delete):** *Eliminación de registros.*

---

## ***Consulta Básica***

**Para recuperar todos los registros de la tabla `usuarios`, utiliza la siguiente consulta:**

```sql
SELECT * FROM usuarios;
```

```sql
sqlite> SELECT * FROM usuarios;
```

**Ejemplo de resultado:**

```bash
Danna|Perez|21
```

---

### ***Añadiendo Más Datos***

**Para insertar múltiples registros en la tabla `usuarios`, puedes usar la siguiente instrucción:**

```sql
INSERT INTO usuarios (name, apellido, age) VALUES 
("Daniel", "Perez Morales", 18), 
("Luna", "Morales", 16), 
("Coby", "Morales", 17);
```

```sql
sqlite> INSERT INTO usuarios (name, apellido, age) VALUES 
("Daniel", "Perez Morales", 18), 
("Luna", "Morales", 16), 
("Coby", "Morales", 17);
```

---

#### ***Verificando los Datos Insertados***

- **Después de agregar nuevos registros, puedes ejecutar nuevamente la consulta para ver todos los usuarios:**

```sql
SELECT * FROM usuarios;
```

```sql
sqlite> SELECT * FROM usuarios;
```

**Ejemplo de resultado actualizado:**

```bash
Danna|Perez|21
Daniel|Perez Morales|18
Luna|Morales|16
Coby|Morales|17
```

---

### ***Consideraciones***

- *Asegúrate de que los nombres de las columnas en la instrucción `INSERT` coincidan con las definiciones en la tabla.*
