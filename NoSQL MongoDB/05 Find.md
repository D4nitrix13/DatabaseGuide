<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Find en MongoDB***

- *El método `.find()` en MongoDB permite realizar consultas sobre una colección. La sintaxis general es:*

```bash
.find({query}, {projection})
```

- **`query`:** *Especifica los criterios de búsqueda. Es un objeto JSON que filtra los documentos a recuperar.*
- **`projection`:** *Define qué campos mostrar o excluir en los resultados. También es un objeto JSON.*

---

## ***Ejemplos Básicos de Búsqueda***

1. **Buscar por un campo específico (`name`):**

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
    gpa: 3.2
  }
]
```

- **Descripción:** *Busca todos los documentos donde el campo `name` es `"Spongebob"`.*

---

### ***2. Buscar por otro campo (`gpa`):***

```bash
db.students.find({gpa: 4.0})
```

```bash
school> db.students.find({gpa: 4.0})
[
  {
    _id: ObjectId('66ec94111ccdd73d3f964035'),
    name: 'Sandy',
    age: 27,
    gpa: 4
  }
]
```

- **Descripción:** *Encuentra todos los estudiantes con un `gpa` de 4.0.*

---

#### ***3. **Buscar por un campo booleano (`fullTime`):***

```bash
db.students.find({fullTime: false})
```

```bash
school> db.students.find({fullTime: false})
[
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

- **Descripción:** *Busca estudiantes que no son de tiempo completo (`fullTime: false`).*

---

### ***Consultas sin Criterios Específicos***

- *Si no se especifican parámetros de consulta, `.find()` devolverá todos los documentos de la colección:*

**Ejemplo incorrecto (solo para ilustración):**

```bash
db.students.find({gpa: 4.0 ,fullTime: true})
```

```bash
school> db.students.find({gpa: 4.0 ,fullTime: true})
```

**Ejemplo correcto:**

```bash
db.students.find({}, {name: true})
```

```bash
school> db.students.find({}, {name: true})
[
  { _id: ObjectId('66ec92f51ccdd73d3f964033'), name: 'Spongebob' },
  { _id: ObjectId('66ec94111ccdd73d3f964034'), name: 'Patrick' },
  { _id: ObjectId('66ec94111ccdd73d3f964035'), name: 'Sandy' },
  { _id: ObjectId('66ec94111ccdd73d3f964036'), name: 'Gary' },
  { _id: ObjectId('66ec99ad1ccdd73d3f96403b'), name: 'Larry' }
]
```

- **Descripción:** *Muestra solo el campo `name` de todos los documentos.*

> [!NOTE]
> **Por Defecto Muestra El Id De Los Documentos**
---

### ***Ejemplos de Proyección***

1. **Excluir el campo `_id` y mostrar solo `name` y `gpa`:**

```bash
db.students.find({}, {_id: false, name: true, gpa: true})
```

```bash
school> db.students.find({}, {_id: false, name: true, gpa: true})
[
  { name: 'Spongebob', gpa: 3.2 },
  { name: 'Patrick', gpa: 1.5 },
  { name: 'Sandy', gpa: 4 },
  { name: 'Gary', gpa: 2.5 },
  { name: 'Larry', gpa: 2.8 }
]
```

- **Descripción:** *Este ejemplo excluye el campo `_id` y muestra solo los campos `name` y `gpa`.*

---

### ***2. **Consulta con filtro y proyección:***

```bash
db.students.find({gpa: 4.0}, {_id: false, name: true, gpa: true})
```

```bash
school> db.students.find({gpa: 4.0}, {_id: false, name: true, gpa: true})
[ { name: 'Sandy', gpa: 4 } ]
```

- **Descripción:** *Encuentra estudiantes con un `gpa` de 4.0 y muestra solo los campos `name` y `gpa`.*

---

#### ***3. Consulta con múltiples condiciones:***

```bash
db.students.find({gpa: 4.0, age: 27}, {_id: false, name: true, gpa: true})
```

```bash
school> db.students.find({gpa: 4.0, age: 27}, {_id: false, name: true, gpa: true})
[ { name: 'Sandy', gpa: 4 } ]
```

- **Descripción:** *Filtra los estudiantes con un `gpa` de 4.0 y una edad de 27 años, mostrando solo `name` y `gpa`.*

**Conclusión:** *El método `.find()` es una herramienta flexible para realizar consultas específicas en MongoDB, permitiendo el uso de proyecciones para optimizar los resultados.*
