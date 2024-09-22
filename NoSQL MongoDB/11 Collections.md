<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Collections en MongoDB***

---

## ***Cómo medir los bytes***

- **Para medir el tamaño de los datos en bytes, puedes usar la siguiente fórmula para convertir entre diferentes unidades de medida:**

- **`1 Kilobyte (KB)` = 1024 Bytes**
- **`1 Megabyte (MB)` = 1024 KB = 1,048,576 Bytes**
- **`1 Gigabyte (GB)` = 1024 MB = 1,073,741,824 Bytes**
- **`1 Terabyte (TB)` = 1024 GB = 1,099,511,627,776 Bytes**

---

### ***Ejemplo: Convertir 100 GB a Bytes***

- **Para convertir 100 GB a bytes, usa la fórmula:**

```bash
100 GB * 1024 MB/GB * 1024 KB/MB * 1024 Bytes/KB = 107,374,182,400 Bytes
```

- **Esto significa que 100 GB son equivalentes a 107,374,182,400 Bytes.**

---

### ***Capped Collections***

- **Puedes crear colecciones limitadas (capped collections) en MongoDB, que tienen un tamaño fijo y pueden limitar la cantidad de documentos que pueden contener. Para crear una colección con parámetros adicionales como `capped`, `size` y `max`, utiliza el siguiente comando:**

```sql
db.createCollection("teachers", { capped: true, size: 10000000, max: 100 }, { autoIndexId: true })
```

```sql
school> db.createCollection("teachers", { capped: true, size: 10000000, max: 100 }, { autoIndexId: true })
{ ok: 1 }
```

- **`capped: true`:** *Indica que la colección es limitada.*
- **`size: 10000000`:** *Especifica el tamaño máximo de la colección en bytes.*
- **`max: 100`:** *Establece el número máximo de documentos en la colección.*

---

### ***Visualización de Colecciones***

**Puedes ver las colecciones en la base de datos usando el comando:**

```sql
show collections
```

```sql
school> show collections
```

**Esto mostrará una lista de todas las colecciones disponibles, como:**

```bash
students
teachers
```

---

## ***Crear y Eliminar Colecciones***

**Para crear una nueva colección:**

```sql
db.createCollection("courses")
```

```sql
school> db.createCollection("courses")
{ ok: 1 }
```

**Para eliminar una colección existente:**

```sql
db.courses.drop()
```

```sql
school> db.courses.drop()
true
```

- **Luego, puedes verificar las colecciones nuevamente:**

```sql
show collections
```

```sql
school> show collections
```

- **Esto mostrará las colecciones restantes:**

```bash
students
teachers
```
