<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Update en MongoDB***

- **El método `.updateOne()` en MongoDB se utiliza para actualizar el primer documento que coincida con un filtro específico. La sintaxis es la siguiente:**

```bash
.updateOne(filter, update)
```

- **`filter`:** *Define el criterio de búsqueda para seleccionar el documento a actualizar.*
- **`update`:** *Especifica los cambios que se aplicarán al documento.*

---

## ***Uso de `$set`***

*El operador `$set` se utiliza para modificar un campo existente o agregar uno nuevo si no existe.*

**Ejemplo:**

```bash
db.students.updateOne({name: "Spongebob"}, {$set: {fullTime: true}})
```

```bash
school> db.students.updateOne({name: "Spongebob"}, {$set: {fullTime: true}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
```

- **Descripción:** *Actualiza el campo `fullTime` a `true` para el documento donde `name` es `"Spongebob"`.*

**Verificamos la actualización:**

```bash
db.students.find({name: "Spongebob"})
```

```bash
school> db.students.find({name: "Spongebob"})
[
  {
    _id: ObjectId('66ec92f51ccdd73d3f964033'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2,
    fullTime: true
  }
]
```

---

### ***Recomendación: Buscar por `_id`***

- **Es recomendable utilizar el campo `_id` para asegurar que se actualiza el documento correcto, ya que es único.**

**Ejemplo:**

```bash
db.students.updateOne({ _id: ObjectId('66ec92f51ccdd73d3f964033') }, { $set: { fullTime: false } })
```

```bash
school> db.students.updateOne({ _id: ObjectId('66ec92f51ccdd73d3f964033') }, { $set: { fullTime: false } })
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
```

- **Verificamos la actualización:**

```bash
db.students.find({_id: ObjectId('66ec92f51ccdd73d3f964033')})
```

```bash
school> db.students.find({_id: ObjectId('66ec92f51ccdd73d3f964033')})
[
  {
    _id: ObjectId('66ec92f51ccdd73d3f964033'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2,
    fullTime: false
  }
]
```

---

### ***Eliminar un Campo con `$unset`***

- **Para eliminar un campo de un documento, utilizamos el operador `$unset`, el cual establece el valor del campo como `""`.**

**Ejemplo:**

```bash
db.students.updateOne({_id: ObjectId('66ec92f51ccdd73d3f964033')}, {$unset: {fullTime: ""}})
```

```bash
school> db.students.updateOne({_id: ObjectId('66ec92f51ccdd73d3f964033')}, {$unset: {fullTime: ""}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
```

- **Verificamos la eliminación:**

```bash
db.students.find({_id: ObjectId('66ec92f51ccdd73d3f964033')})
```

```bash
school> db.students.find({_id: ObjectId('66ec92f51ccdd73d3f964033')})
[
  {
    _id: ObjectId('66ec92f51ccdd73d3f964033'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  }
]
```

---

### ***Actualización Masiva con `updateMany()`***

- *El método `.updateMany()` se utiliza para aplicar actualizaciones a todos los documentos que coincidan con el filtro especificado.*

**Ejemplo:**

```bash
db.students.updateMany({}, {$set: {fullTime: false}})
```

```bash
school> db.students.updateMany({}, {$set: {fullTime: false}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 5,
  modifiedCount: 4,
  upsertedCount: 0
}
```

- **Verificamos los cambios:**

```bash
db.students.find()
```

```bash
school> db.students.find()
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
    fullTime: false
  },
  {
    _id: ObjectId('66ec94111ccdd73d3f964036'),
    name: 'Gary',
    age: 18,
    gpa: 2.5,
    fullTime: false
  },
  {
    _id: ObjectId('66ec99ad1ccdd73d3f96403b'),
    name: 'Larry',
    age: 32,
    gpa: 2.8,
    fullTime: false,
    register: ISODate('2024-09-19T21:37:49.559Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123. Fake St.', city: 'Bikini Bottom', zip: 1234 }
  }
]
```

---

### ***Eliminar Campos Específicos en Múltiples Documentos***

- *Eliminamos el campo `fullTime` en los documentos de `"Gary"` y `"Sandy"`.*

**Ejemplo:**

```bash
db.students.updateOne({name: "Gary"}, {$unset: {fullTime: ""}})
```

```bash
school> db.students.updateOne({name: "Gary"}, {$unset: {fullTime: ""}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
```

```bash
db.students.updateOne({name: "Sandy"}, {$unset: {fullTime: ""}})
```

```bash
school> db.students.updateOne({name: "Sandy"}, {$unset: {fullTime: ""}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
```

**Verificamos los resultados:**

```bash
db.students.find({})
```

```bash
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
    gpa: 4
  },
  {
    _id: ObjectId('66ec94111ccdd73d3f964036'),
    name: 'Gary',
    age: 18,
    gpa: 2.5
  },
  {
    _id: ObjectId('66ec99ad1ccdd73d3f96403b'),
    name: 'Larry',
    age: 32,
    gpa: 2.8,
    fullTime: false,
    register: ISODate('2024-09-19T21:37:49.559Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123. Fake St.', city: 'Bikini Bottom', zip: 1234 }
  }
]
```

---

### ***Agregar Campos Usando `$exists`***

- *Podemos agregar el campo `fullTime` solo a los documentos donde no existe usando `$exists`.*

**Ejemplo:**

```bash
db.students.updateMany({fullTime: {$exists: false}}, {$set: {fullTime: true}})
```

```bash
school> db.students.updateMany({fullTime: {$exists: false}}, {$set: {fullTime: true}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 2,
  modifiedCount: 2,
  upsertedCount: 0
}
```

- **Descripción:** *El operador `$exists` busca documentos donde el campo `fullTime` no existe y lo agrega con el valor `true`.*

**Verificamos los resultados:**

```bash
db.students.find().pretty()
```

```bash
school> db.students.find().pretty()
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
    fullTime:

 true
  },
  {
    _id: ObjectId('66ec99ad1ccdd73d3f96403b'),
    name: 'Larry',
    age: 32,
    gpa: 2.8,
    fullTime: false,
    register: ISODate('2024-09-19T21:37:49.559Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123. Fake St.', city: 'Bikini Bottom', zip: 1234 }
  }
]
```

---

### ***¿Qué hace exactamente `.pretty()`?***

> [!NOTE]
> *El método `.pretty()` en MongoDB sirve para hacer que los resultados de una consulta se muestren en un formato más legible. Normalmente, cuando ejecutas una consulta usando `find()`, MongoDB devuelve los documentos en una sola línea de texto, lo que puede ser difícil de leer si el documento es extenso o tiene una estructura compleja.*

**Cuando usas `.pretty()`, MongoDB:**

1. **Formatea el JSON:** *Inserta saltos de línea y sangría (indentación) para mostrar cada campo y su valor en líneas separadas.*
2. **Mejora la legibilidad:** *Hace que sea más fácil visualizar la estructura de los documentos, especialmente cuando contienen objetos anidados o listas largas.*

### ***Ejemplo sin `.pretty()`***

```json
{
    "_id": ObjectId("66ec92f51ccdd73d3f964033"), 
    "name": "John Doe", 
    "age": 25, 
    "address": { "city": "New York", "zip": 10001 }
}
```

- *Sin `.pretty()`, todo aparece en una sola línea.*

### ***Ejemplo con `.pretty()`***

```json
{
    "_id": ObjectId("66ec92f51ccdd73d3f964033"),
    "name": "John Doe",
    "age": 25,
    "address": {
        "city": "New York",
        "zip": 10001
    }
}
```

- *Con `.pretty()`, los resultados se muestran con mejor formato: campos alineados, objetos anidados claramente indentados, y los elementos de las listas se presentan de manera más organizada.*

### ***¿Cuándo usar `.pretty()`?***

- *Cuando trabajas con documentos grandes o con muchos datos anidados.*
- *Para facilitar la revisión de la estructura de los documentos en la salida del shell.*
- *Durante la depuración, cuando necesitas observar claramente la forma y el contenido de tus datos.*

- *En resumen, `.pretty()` es útil cuando deseas que los resultados de tus consultas sean más fáciles de leer y entender.*
