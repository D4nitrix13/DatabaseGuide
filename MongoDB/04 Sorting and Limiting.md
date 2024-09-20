<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Sorting And Limiting en MongoDB***

---

## ***Método `.sort()`***

- **El método `.sort()` se utiliza para ordenar los resultados de una consulta. Si no se le pasa ningún argumento, no realizará ninguna ordenación específica. Por lo general, el método requiere que se especifique el campo por el cual se ordenará y la dirección de la ordenación.**

```sql
db.students.find().sort()
```

```sql
school> db.students.find().sort()
```

```sql
school> db.students.find().sort()
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

### **Ejemplo: Ordenación por `name` en orden descendente**

```sql
db.students.find().sort({name: -1})
```

```sql
school> db.students.find().sort({name: -1})
```

```bash
[
  {
    _id: ObjectId('66ec92f51ccdd73d3f964033'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ec94111ccdd73d3f964035'),
    name: 'Sandy',
    age: 27,
    gpa: 4
  },
  {
    _id: ObjectId('66ec94111ccdd73d3f964034'),
    name: 'Patrick',
    age: 38,
    gpa: 1.5
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
  },
  {
    _id: ObjectId('66ec94111ccdd73d3f964036'),
    name: 'Gary',
    age: 18,
    gpa: 2.5
  }
]
```

---

#### ***Ordenación ascendente (`1`) y descendente (`-1`)***

- **Para ordenar los resultados en orden ascendente, se utiliza `1`.**
- **Para ordenar los resultados en orden descendente, se utiliza `-1`.**

##### **Ejemplo: Ordenación ascendente por `name`**

```sql
db.students.find().sort({name: 1})
```

```sql
school> db.students.find().sort({name: 1})
```

```bash
[
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
    gpa: 4
  },
  {
    _id: ObjectId('66ec92f51ccdd73d3f964033'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  }
]
```

---

#### ***Ordenación por otro campo***

##### **Ejemplo: Ordenación por `gpa` en orden ascendente**

```sql
db.students.find().sort({gpa: 1})
```

```sql
school> db.students.find().sort({gpa: 1})
```

```bash
[
  {
    _id: ObjectId('66ec94111ccdd73d3f964034'),
    name: 'Patrick',
    age: 38,
    gpa: 1.5
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
  },
  {
    _id: ObjectId('66ec92f51ccdd73d3f964033'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  },
  {
    _id: ObjectId('66ec94111ccdd73d3f964035'),
    name: 'Sandy',
    age: 27,
    gpa: 4
  }
]
```

##### **Ejemplo: Ordenación por `gpa` en orden descendente**

```sql
db.students.find().sort({gpa: -1})
```

```sql
school> db.students.find().sort({gpa: -1})
```

```bash
[
  {
    _id: ObjectId('66ec94111ccdd73d3f964035'),
    name: 'Sandy',
    age: 27,
    gpa: 4
  },
  {
    _id: ObjectId('66ec92f51ccdd73d3f964033'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
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
  },
  {
    _id: ObjectId('66ec94111ccdd73d3f964036'),
    name: 'Gary',
    age: 18,
    gpa: 2.5
  },
  {
    _id: ObjectId('66ec94111ccdd73d3f964034'),
    name: 'Patrick',
    age: 38,
    gpa: 1.5
  }
]
```

---

#### ***Limitación de resultados***

- **El método `.limit()` restringe el número de documentos devueltos en una consulta.**

##### **Ejemplo: Limitar la salida a 1 documento**

```sql
db.students.find().limit(1)
```

```sql
school> db.students.find().limit(1)
```

```bash
[
  {
    _id: ObjectId('66ec92f51ccdd73d3f964033'),
    name: 'Spongebob',
    age: 30,
    gpa: 3.2
  }
]
```

##### **Ejemplo: Limitar la salida a 3 documentos**

```sql
db.students.find().limit(3)
```

```sql
school> db.students.find().limit(3)
```

```bash
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
    gpa: 4
  }
]
```

---

#### ***Combinación de `.sort()` y `.limit()`***

- **Es posible combinar el método `.sort()` con `.limit()` para obtener un número limitado de resultados ordenados.**

##### **Ejemplo: Ordenar por `gpa` en orden descendente y limitar a 1 documento**

```sql
db.students.find().sort({gpa: -1}).limit(1)
```

```sql
school> db.students.find().sort({gpa: -1}).limit(1)
```

```bash
[
  {
    _id: ObjectId('66ec94111ccdd73d3f964035'),
    name: 'Sandy',
    age: 27,
    gpa: 4
  }
]
```

##### **Ejemplo: Ordenar por `gpa` en orden ascendente y limitar a 1 documento**

```sql
db.students.find().sort({gpa: 1}).limit(1)
```

```sql
school> db.students.find().sort({gpa: 1}).limit(1)
```

```bash
[
  {
    _id: ObjectId('66ec94111ccdd73d3f964034'),
    name: 'Patrick',
    age: 38,
    gpa

: 1.5
  }
]
```

---

#### ***Uso de `.skip()`***

- **El método `.skip()` omite el número de documentos especificado en una consulta. Esto es útil cuando se implementa paginación.**

##### **Ejemplo: Saltar los primeros 2 resultados**

```sql
db.students.find().skip(2)
```

```sql
school> db.students.find().skip(2)
```

```bash
[
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

##### **Ejemplo: Combinar `.skip()` y `.limit()`**

```sql
db.students.find().skip(2).limit(1)
```

**Tambien se puede hacer:**

```sql
db.students.find().sort().skip(2).limit(1)
```

```sql
school> db.students.find().skip(2).limit(1)
```

```bash
[
  {
    _id: ObjectId('66ec94111ccdd73d3f964035'),
    name: 'Sandy',
    age: 27,
    gpa: 4
  }
]
```
