<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***UNION y UNION ALL***

> [!TIP]
> *Los operadores `UNION` y `UNION ALL` se utilizan para combinar los resultados de dos o más consultas. Aunque ambos realizan una unión, tienen diferencias en cuanto a cómo manejan los valores duplicados.*

---

## ***Diferencias entre UNION y UNION ALL***

1. **UNION:** *Combina los resultados de dos o más subconsultas y **elimina los duplicados**. Esto es útil cuando quieres una lista de valores únicos entre varias tablas o consultas.*
2. **UNION ALL:** *Combina los resultados de dos o más subconsultas **sin eliminar duplicados**. Este operador es más rápido que `UNION` porque no requiere verificar y filtrar los valores duplicados, por lo que puede ser preferible cuando no es necesario eliminar duplicados.*

---

### ***Requisitos para usar UNION y UNION ALL***

**Para que `UNION` y `UNION ALL` funcionen correctamente:**

- *Las subconsultas deben tener el **mismo número de columnas**.*
- *Las columnas correspondientes en cada subconsulta deben ser del **mismo tipo de datos**.*

---

### ***Ejemplo Práctico***

- **Supongamos que tenemos dos tablas, `Alumnos Primaria` y `Alumnos Secundaria`, que almacenan los nombres y notas de estudiantes en distintos niveles educativos. Queremos obtener una lista combinada de los alumnos de ambas tablas.**

---

#### *Creación de las Tablas y Datos de Ejemplo*

```sql
CREATE TABLE "Alumnos Primaria" (
    "AlumnoID" INTEGER NOT NULL,
    "Nombre" TEXT NOT NULL,
    "Nota" DOUBLE NOT NULL,
    PRIMARY KEY("AlumnoID" AUTOINCREMENT)
);

CREATE TABLE "Alumnos Secundaria" (
    "AlumnoID" INTEGER NOT NULL,
    "Nombre" TEXT NOT NULL,
    "Nota" DOUBLE NOT NULL,
    PRIMARY KEY("AlumnoID" AUTOINCREMENT)
);

-- Insertar datos en Alumnos Primaria
INSERT INTO "Alumnos Primaria" ("Nombre", "Nota")
VALUES ("Daniel", 85.0), ("Benjamin", 65.0), ("Carol", 95.0), ("Ruby", 90.0), ("Adriana", 75.0);

-- Insertar datos en Alumnos Secundaria
INSERT INTO "Alumnos Secundaria" ("Nombre", "Nota")
VALUES ("keyling", 55.0), ("Matias", 70.0), ("Danna", 100.0), ("Elizabeth", 80.0), ("Adriana", 75.0);
```

---

#### *Consulta con UNION ALL*

- **La siguiente consulta combina los datos de ambas tablas usando `UNION ALL`, que mantendrá todos los valores, incluyendo duplicados:**

```sql
SELECT "Alumnos Primaria".Nombre,
    "Alumnos Primaria".Nota
FROM "Alumnos Primaria"
UNION ALL
SELECT "Alumnos Secundaria".Nombre,
    "Alumnos Secundaria".Nota
FROM "Alumnos Secundaria"
LIMIT 100;
```

**Salida**:

```sql
Daniel|85.0
Benjamin|65.0
Carol|95.0
Ruby|90.0
Adriana|75.0
keyling|55.0
Matias|70.0
Danna|100.0
Elizabeth|80.0
Adriana|75.0
```

**En este caso, `Adriana` aparece dos veces en el resultado porque `UNION ALL` no elimina duplicados.**

---

#### *Consulta con UNION*

**A continuación, usamos `UNION`, que elimina duplicados en el conjunto de resultados:**

```sql
SELECT "Alumnos Primaria".Nombre,
    "Alumnos Primaria".Nota
FROM "Alumnos Primaria"
UNION
SELECT "Alumnos Secundaria".Nombre,
    "Alumnos Secundaria".Nota
FROM "Alumnos Secundaria"
LIMIT 100;
```

**Salida**:

```sql
Adriana|75.0
Benjamin|65.0
Carol|95.0
Daniel|85.0
Danna|100.0
Elizabeth|80.0
Matias|70.0
Ruby|90.0
keyling|55.0
```

- **En este caso, `Adriana` solo aparece una vez en el resultado, ya que `UNION` elimina los valores duplicados.**

---

### ***Resumen***

- **UNION:** *Se utiliza para obtener un conjunto único de resultados combinados, eliminando duplicados.*
- **UNION ALL:** *Combina todos los resultados, incluyendo duplicados, y es más rápido al no tener que procesar valores únicos.*

- *Este tipo de consultas es útil cuando necesitas consolidar datos de varias tablas que comparten estructura, como en este ejemplo con estudiantes de primaria y secundaria.*
