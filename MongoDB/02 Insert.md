<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Sintaxis de Insert MongoDB***

---

## ***Seleccionar la base de datos***

- **Para cambiar a la base de datos `school`, utiliza el siguiente comando:**

```sql
use school
```

```sql
test> use school
switched to db school
```

- **Descripción:** *Cambia la base de datos activa a `school`. Si la base de datos `school` no existiera, se crearía.*

---

### ***Crear una colección e insertar un documento***

- **Para crear la colección `students` (si no existe) e insertar un documento, utiliza:**

```sql
db.students.insertOne({"name": "Spongebob", age: 30, gpa: 3.2})
```

```sql
school> db.students.insertOne({"name": "Spongebob", age: 30, gpa: 3.2})
{
  acknowledged: true,
  insertedId: ObjectId('66ec92f51ccdd73d3f964033')
}
```

- **Descripción:** *Inserta un documento en la colección `students`. Cada documento en MongoDB se identifica por un campo `_id`, que es asignado automáticamente si no se proporciona uno. El campo `_id` es único para cada documento.*

---

#### ***Formato de los documentos***

- **Un documento en MongoDB se compone de pares clave-valor. La clave puede ser proporcionada con comillas dobles (`""`) o simples (`''`), o sin comillas si no tiene espacios. Los valores siempre deben estar entre comillas si son cadenas.**

- **Ejemplos:**

  - Con comillas dobles en la clave:

    ```sql
    db.students.insertOne({"name": "Spongebob", age: 30, gpa: 3.2})
    ```

  - Con comillas simples en la clave:

    ```sql
    db.students.insertOne({'name': "Spongebob", age: 30, gpa: 3.2})
    ```

  - Sin comillas en la clave (solo si no hay espacios):

    ```sql
    db.students.insertOne({name: 'Spongebob', age: 30, gpa: 3.2})
    ```

- **Descripción:** *Puedes usar diferentes estilos para las claves en un documento, pero los valores deben ser siempre entre comillas si son cadenas.*

---

#### ***Listar documentos en la colección***

- **Para listar todos los documentos en la colección `students`, utiliza:**

```sql
db.students.find()
```

```sql
school> db.students.find()
[
  {
    _id: ObjectId('66ec92f51ccdd73d3f964033'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  }
]
```

- **Descripción:** *Muestra todos los documentos en la colección `students`. Cada documento está representado como un objeto JSON con campos y valores.*

---

#### ***Insertar múltiples documentos***

- **Para insertar varios documentos en la colección `students`, utiliza:**

```sql
db.students.insertMany([
  {name: "Patrick", age: 38, gpa: 1.5},
  {name: "Sandy", age: 27, gpa: 4.0},
  {name: "Gary", age: 18, gpa: 2.5}
])
```

```sql
school> db.students.insertMany([
  {name: "Patrick", age: 38, gpa: 1.5},
  {name: "Sandy", age: 27, gpa: 4.0},
  {name: "Gary", age: 18, gpa: 2.5}
])
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('66ec94111ccdd73d3f964034'),
    '1': ObjectId('66ec94111ccdd73d3f964035'),
    '2': ObjectId('66ec94111ccdd73d3f964036')
  }
}
```

- **Descripción:** *Inserta múltiples documentos en la colección `students` en una sola operación. La respuesta incluye los identificadores únicos asignados a cada documento.*

---

#### ***Listar documentos después de insertar***

- **Para ver todos los documentos después de insertar varios, utiliza:**

```sql
db.students.find()
```

```sql
school> db.students.find()
[
  {
    _id: ObjectId('66ec92f51ccdd73d3f964033'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ec94111ccdd73d3f964034'),
    name: 'Patrick',
    age: 38,
    gpa: 1.5
  },
  {
    _id: ObjectId('66ec94111ccdd73d3f964035'),
    name: 'Sandy',
    age: 27,
    gpa: 4.0
  },
  {
    _id: ObjectId('66ec94111ccdd73d3f964036'),
    name: 'Gary',
    age: 18,
    gpa: 2.5
  }
]
```

- **Descripción:** *Muestra todos los documentos en la colección `students` después de realizar las inserciones, incluyendo el documento previamente insertado y los nuevos documentos.*

---
