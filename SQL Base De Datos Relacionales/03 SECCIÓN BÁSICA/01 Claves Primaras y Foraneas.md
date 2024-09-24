<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Claves Primarias (Primary Keys) y Claves Foráneas (Foreign Keys)***

---

## ***Claves Primarias (PK)***

- *Una **clave primaria (PK)** es un campo o conjunto de campos que se utiliza para identificar de manera única cada registro en una tabla. Cada valor en una clave primaria debe ser único y no puede ser nulo. Es fundamental para asegurar la integridad de los datos, ya que evita que existan registros duplicados en la base de datos.*

- **Reglas para una Clave Primaria:**
  - *Debe ser única para cada registro.*
  - *No puede contener valores nulos.*
  - *Generalmente, se utiliza para identificar de manera inequívoca una fila en la tabla.*

---

### ***Ejemplo de tabla con clave primaria (`usuarios`)***

```sql
SELECT * FROM usuarios;
```

```sql
sqlite> SELECT * FROM usuarios;
```

| id | nombre  | apellido             | edad |
|----|---------|----------------------|------|
| 1  | Danna   | Morales              | 16   |
| 2  | Benjamin| Perez                | 19   |
| 3  | Raquel  | Morales Gamboa       | 33   |
| 4  | Matias  | Morales              | 21   |
| 5  | Luna    | Morales              | 22   |
| 6  | Daniel  | Perez Morales        | 18   |

- *En esta tabla, el campo `id` es la clave primaria (PK) que identifica de manera única a cada usuario.*

---

### ***Claves Foráneas (FK)***

- *Una **clave foránea (FK)** es un campo en una tabla que hace referencia a la clave primaria de otra tabla. Sirve para establecer una relación entre dos tablas, garantizando la integridad referencial. Es decir, asegura que los datos en una tabla coincidan con los datos de otra tabla.*

- **Reglas para una Clave Foránea:**
  - *Debe contener valores que coincidan con una clave primaria de otra tabla.*
  - *Puede contener valores nulos si la relación lo permite.*
  - *Establece relaciones como "uno a muchos" o "uno a uno" entre tablas.*

---

#### ***Ejemplo de tabla con clave foránea (`turnos_medicos`)***

```sql
SELECT * FROM turnos_medicos;
```

```sql
sqlite> SELECT * FROM turnos_medicos;
```

| id  | doctor      | usuario_id | motivo           | hora   |
|-----|-------------|------------|------------------|--------|
| 1   | Dr. Ramirez | 6          | Dolor de Panza    | 12:30 |
| 2   | Dr. Ramirez | 3          | Dolor de Cabeza   | 11:30 |

- *En esta tabla, el campo `usuario_id` es una clave foránea (FK) que hace referencia al campo `id` en la tabla `usuarios`. Esto significa que el usuario con `id = 6` (Daniel Perez Morales) tiene una cita con el Dr. Ramirez por "Dolor de Panza" a las 12:30.*

---

### ***Relación entre las Tablas***

- *En este ejemplo, la relación entre las tablas `usuarios` y `turnos_medicos` es de "uno a muchos", donde un usuario puede tener varios turnos médicos, pero cada turno médico está asociado con un único usuario.*
