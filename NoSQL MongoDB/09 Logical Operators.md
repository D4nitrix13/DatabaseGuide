<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Logical Operators en MongoDB***

> [!NOTE]
> **Los operadores lógicos en MongoDB permiten combinar múltiples condiciones en las consultas. Los principales operadores lógicos son:**

- **`$and`:** *Permite combinar condiciones que deben cumplirse todas.*
- **`$or`:** *Permite combinar condiciones donde al menos una debe cumplirse.*
- **`$nor`:** *Selecciona documentos que no cumplen ninguna de las condiciones dadas.*
- **`$not`:** *Invierte el resultado de una consulta, seleccionando documentos que no cumplen la condición especificada.*

---

## ***Ejemplo de actualización de documentos***

**Primero, actualizamos algunos documentos en la colección `students`:**

```sql
db.students.updateOne({name: "Gary"}, {$set: {fullTime: true}})
```

```sql
db.students.updateOne({name: "Sandy"}, {$set: {fullTime: true}})
```

```sql
school> db.students.updateOne({name: "Gary"}, {$set: {fullTime: true}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}

school> db.students.updateOne({name: "Sandy"}, {$set: {fullTime: true}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
```

### ***Operador `$and`***

- *El operador `$and` se utiliza para especificar que se deben cumplir **todas** las condiciones.*

**Ejemplo:**

```sql
db.students.find({$and: [{fullTime: true}, {age: {$lte: 22}}]})
```

```sql
school> db.students.find({$and: [{fullTime: true}, {age: {$lte: 22}}]})
```

**Resultado:**

```sql
[
  {
    _id: ObjectId('66ef1df4485b3d91eb96403b'),
    name: 'Gary',
    age: 18,
    gpa: 2.5,
    fullTime: true
  }
]
```

- *En este caso, estamos buscando estudiantes que sean **full-time** y cuya edad sea **menor o igual a 22**.*

---

### ***Operador `$or`***

- *El operador `$or` selecciona documentos que cumplen **al menos una** de las condiciones especificadas.*

**Ejemplo:**

```sql
db.students.find({$or: [{fullTime: true}, {age: {$lte: 22}}]})
```

```sql
school> db.students.find({$or: [{fullTime: true}, {age: {$lte: 22}}]})
```

**Resultado:**

```sql
[
  {
    _id: ObjectId('66ef1df4485b3d91eb96403a'),
    name: 'Sandy',
    age: 27,
    gpa: 4,
    fullTime: true
  },
  {
    _id: ObjectId('66ef1df4485b3d91eb96403b'),
    name: 'Gary',
    age: 18,
    gpa: 2.5,
    fullTime: true
  }
]
```

*Aquí, se obtienen estudiantes que son **full-time** o cuya edad es **menor o igual a 22**.*

---

### ***Operador `$nor`***

- *El operador `$nor` selecciona documentos que **no cumplen** ninguna de las condiciones dadas.*

**Ejemplo:**

```sql
db.students.find({$nor: [{fullTime: true}, {age: {$lte: 22}}]})
```

```sql
school> db.students.find({$nor: [{fullTime: true}, {age: {$lte: 22}}]})
```

**Resultado:**

```sql
[
  {
    _id: ObjectId('66ef1def485b3d91eb964038'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ef1df4485b3d91eb964039'),
    name: 'Patrick',
    age: 38,
    gpa: 1.5
  },
  {
    _id: ObjectId('66ef1dfe485b3d91eb96403c'),
    name: 'Larry',
    age: 32,
    gpa: 2.8,
    fullTime: false,
    register: ISODate('2024-09-21T19:26:54.025Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Bikini Bottom', zip: 1234 }
  }
]
```

- *Este resultado incluye estudiantes que **no son full-time** y cuya edad es **mayor de 22**.*

---

### ***Operador `$not`***

- *El operador `$not` se utiliza para invertir el resultado de una consulta, seleccionando documentos que **no cumplen** con la condición especificada.*

**Ejemplo:**

```sql
db.students.find({ fullTime: { $not: { $eq: true } } })
```

```sql
school> db.students.find({ fullTime: { $not: { $eq: true } } })
```

**Resultado:**

```sql
[
  {
    _id: ObjectId('66ef1def485b3d91eb964038'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ef1df4485b3d91eb964039'),
    name: 'Patrick',
    age: 38,
    gpa: 1.5
  },
  {
    _id: ObjectId('66ef1dfe485b3d91eb96403c'),
    name: 'Larry',
    age: 32,
    gpa: 2.8,
    fullTime: false,
    register: ISODate('2024-09-21T19:26:54.025Z'),
    graduationDate: null,
    courses: [ 'Biology', 'Chemistry', 'Calculus' ],
    address: { street: '123 Fake St.', city: 'Bikini Bottom', zip: 1234 }
  }
]
```

- *En este caso, se obtienen los estudiantes que **no son full-time**.*

---

### ***Otro Ejemplo con `$not`***

- *Este ejemplo muestra cómo se puede usar `$not` para seleccionar documentos cuya edad **no sea mayor o igual a 30**.*

**Ejemplo:**

```sql
db.students.find({age: {$not: {$gte: 30}}}).pretty()
```

```sql
school> db.students.find({age: {$not: {$gte: 30}}}).pretty()
```

**Resultado:**

```sql
[
  {
    _id: ObjectId('66ef1df4485b3d91eb96403a'),
    name: 'Sandy',
    age: 27,
    gpa: 4,
    fullTime: true
  },
  {
    _id: ObjectId('66ef1df4485b3d91eb96403b'),
    name: 'Gary',
    age: 18,
    gpa: 2.5,
    fullTime: true
  }
]
```

- *Aquí, se muestran estudiantes cuya edad es **menor que 30**.*

---

### ***Resumen de Operadores Lógicos***

- **`$and`:** *Todas las condiciones deben ser verdaderas.*
- **`$or`:** *Al menos una de las condiciones debe ser verdadera.*
- **`$nor`:** *Ninguna de las condiciones debe ser verdadera.*
- **`$not`:** *Invierte el resultado de una consulta.*
