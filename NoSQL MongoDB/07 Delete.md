<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Delete en MongoDB***

---

## ***Eliminar documentos en MongoDB***

- *MongoDB ofrece los métodos `.deleteOne()` y `.deleteMany()` para eliminar documentos que coincidan con un criterio de búsqueda.*

---

### ***Eliminar un documento con `deleteOne()`***

- *El método `.deleteOne()` elimina el **primer documento** que coincida con el filtro especificado.*

**Ejemplo:**

```sql
db.students.deleteOne({name: "Larry"})
```

```sql
school> db.students.deleteOne({name: "Larry"})
{ acknowledged: true, deletedCount: 1 }
```

- **Descripción:** *Elimina el documento donde `name` es `"Larry"`. El resultado `{ acknowledged: true, deletedCount: 1 }` indica que la operación fue exitosa y se eliminó un documento.*

**Verificamos los documentos restantes:**

```sql
db.students.find({})
```

```sql
school> db.students.find({})
[
  {
    _id: ObjectId('66ec92f51ccdd73d3f964033'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2,
    fullTime: false
  },
  {
    _id: ObjectId('66ec94111ccdd73d3f964034'),
    name: 'Patrick',
    age: 38,
    gpa: 1.5,
    fullTime: false
  },
  {
    _id: ObjectId('66ec94111ccdd73d3f964035'),
    name: 'Sandy',
    age: 27,
    gpa: 4,
    fullTime: true
  },
  {
    _id: ObjectId('66ec94111ccdd73d3f964036'),
    name: 'Gary',
    age: 18,
    gpa: 2.5,
    fullTime: true
  }
]
```

---

#### ***Eliminar múltiples documentos con `deleteMany()`***

- *El método `.deleteMany()` permite eliminar **todos los documentos** que coincidan con un filtro específico.*

**Ejemplo:**

```sql
db.students.deleteMany({fullTime: false})
```

```sql
school> db.students.deleteMany({fullTime: false})
{ acknowledged: true, deletedCount: 2 }
```

- **Descripción:** *Este comando elimina todos los documentos donde el campo `fullTime` es `false`. El valor de `deletedCount` refleja cuántos documentos fueron eliminados, en este caso, 2.*

**Verificamos los documentos restantes después de la eliminación:**

```sql
db.students.find({})
```

```sql
school> db.students.find({})
[
  {
    _id: ObjectId('66ec94111ccdd73d3f964035'),
    name: 'Sandy',
    age: 27,
    gpa: 4,
    fullTime: true
  },
  {
    _id: ObjectId('66ec94111ccdd73d3f964036'),
    name: 'Gary',
    age: 18,
    gpa: 2.5,
    fullTime: true
  }
]
```

---

#### ***Eliminar documentos basados en la existencia de un campo***

- **El operador `$exists` se puede usar para eliminar documentos basados en la existencia o inexistencia de un campo.**

**Ejemplo:**

```sql
db.students.deleteMany({registerDate: {$exists: false}})
```

```sql
school> db.students.deleteMany({registerDate: {$exists: false}})
{ acknowledged: true, deletedCount: 2 }
```

- **Descripción:** *En este ejemplo, todos los documentos que **no tienen el campo** `registerDate` serán eliminados. Esto se controla con el operador `$exists`, que comprueba si un campo existe en los documentos.*

**Verificamos los documentos restantes después de aplicar la eliminación:**

```sql
db.students.find()
```

```sql
school> db.students.find()
```

- **Descripción:** *Todos los documentos han sido eliminados, ya que el filtro especificaba la eliminación de aquellos sin el campo `registerDate`.*

---

### ***Resumen***

- **`deleteOne()`:** *Elimina el primer documento que coincida con un criterio.*
- **`deleteMany()`:** *Elimina todos los documentos que coincidan con un criterio.*
- **Uso de `$exists`:** *Permite eliminar documentos basados en la existencia o ausencia de un campo específico.*
