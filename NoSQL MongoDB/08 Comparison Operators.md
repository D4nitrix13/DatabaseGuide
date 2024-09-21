<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Comparison Operators en MongoDB***

> [!NOTE]
> *En MongoDB, los operadores de comparación se utilizan para consultar documentos que cumplan con ciertas condiciones. Estos operadores se identifican con el prefijo `$`.*

---

## ***Insertar documentos de ejemplo***

- *Antes de comenzar a utilizar los operadores de comparación, vamos a insertar algunos documentos en la colección `students`:*

```sql
db.students.insertOne({"name": "Spongebob", age: 30, gpa: 3.2})

db.students.insertMany([
  {name: "Patrick", age: 38, gpa: 1.5},
  {name: "Sandy", age: 27, gpa: 4.0},
  {name: "Gary", age: 18, gpa: 2.5}
])

db.students.insertOne(
    {
        name: "Larry",
        age: 32,
        gpa: 2.8,
        fullTime: false,
        register: new Date(),
        graduationDate: null,
        courses: ["Biology", "Chemistry", "Calculus"],
        address: {
                    street: "123 Fake St.",
                    city: "Bikini Bottom",
                    zip: 1234
                 }
    }
)
```

- **Con estos datos insertados, podemos explorar los operadores de comparación.**

---

### ***Operadores de Comparación***

---

#### ***1. `$ne` (Not Equal)***

- *Este operador selecciona los documentos donde el valor de un campo **no es igual** al valor especificado.*

**Ejemplo:**

```sql
db.students.find({name: {$ne: "Spongebob"}})
```

```sql
school> db.students.find({name: {$ne: "Spongebob"}})
```

**Resultado:**

```sql
[
  { name: 'Patrick', age: 38, gpa: 1.5 },
  { name: 'Sandy', age: 27, gpa: 4 },
  { name: 'Gary', age: 18, gpa: 2.5 },
  { name: 'Larry', age: 32, gpa: 2.8, fullTime: false, register: ISODate('2024-09-21T19:26:54.025Z'), graduationDate: null, courses: [ 'Biology', 'Chemistry', 'Calculus' ], address: { street: '123 Fake St.', city: 'Bikini Bottom', zip: 1234 } }
]
```

---

#### ***2. `$lt` (Less Than)***

- *Selecciona los documentos donde el valor de un campo es **menor que** el valor especificado.*

**Ejemplo:**

```sql
db.students.find({age: {$lt: 20}})
```

```sql
school> db.students.find({age: {$lt: 20}})
```

**Resultado:**

```sql
[
  { name: 'Gary', age: 18, gpa: 2.5 }
]
```

---

#### ***3. `$lte` (Less Than or Equal)***

- *Selecciona los documentos donde el valor de un campo es **menor o igual** al valor especificado.*

**Ejemplo:**

```sql
db.students.find({age: {$lte: 27}})
```

```sql
school> db.students.find({age: {$lte: 27}})
```

**Resultado:**

```sql
[
  { name: 'Sandy', age: 27, gpa: 4 },
  { name: 'Gary', age: 18, gpa: 2.5 }
]
```

---

#### ***4. `$gt` (Greater Than)***

- *Selecciona los documentos donde el valor de un campo es **mayor que** el valor especificado.*

**Ejemplo:**

```sql
db.students.find({age: {$gt: 27}})
```

```sql
school> db.students.find({age: {$gt: 27}})
```

**Resultado:**

```sql
[
  { name: 'Spongebob', age: 30, gpa: 3.2 },
  { name: 'Patrick', age: 38, gpa: 1.5 },
  { name: 'Larry', age: 32, gpa: 2.8, fullTime: false, register: ISODate('2024-09-21T19:26:54.025Z'), graduationDate: null, courses: [ 'Biology', 'Chemistry', 'Calculus' ], address: { street: '123 Fake St.', city: 'Bikini Bottom', zip: 1234 } }
]
```

---

#### ***5. `$gte` (Greater Than or Equal)***

- **Selecciona los documentos donde el valor de un campo es **mayor o igual** al valor especificado.**

**Ejemplo:**

```sql
db.students.find({age: {$gte: 27}})
```

```sql
school> db.students.find({age: {$gte: 27}})
```

**Resultado:**

```sql
[
  { name: 'Spongebob', age: 30, gpa: 3.2 },
  { name: 'Patrick', age: 38, gpa: 1.5 },
  { name: 'Sandy', age: 27, gpa: 4 },
  { name: 'Larry', age: 32, gpa: 2.8, fullTime: false, register: ISODate('2024-09-21T19:26:54.025Z'), graduationDate: null, courses: [ 'Biology', 'Chemistry', 'Calculus' ], address: { street: '123 Fake St.', city: 'Bikini Bottom', zip: 1234 } }
]
```

---

### ***Operadores Compuestos***

---

#### ***6. Doble Condición (`$gte` y `$lte`)***

- **Puedes combinar múltiples operadores de comparación en una sola consulta. Este ejemplo selecciona los documentos donde el valor de `gpa` está entre 3 y 4.**

**Ejemplo:**

```sql
db.students.find({gpa: {$gte: 3, $lte: 4}})
```

```sql
school> db.students.find({gpa: {$gte: 3, $lte: 4}})
```

**Resultado:**

```sql
[
  { name: 'Spongebob', age: 30, gpa: 3.2 },
  { name: 'Sandy', age: 27, gpa: 4 }
]
```

---

### ***Operadores de Inclusión y Exclusión***

---

#### ***7. `$in`***

- *Selecciona los documentos donde el valor de un campo **coincide con cualquiera de los valores** en un arreglo dado.*

**Ejemplo:**

```sql
school> db.students.find({name: {$in: ["Spongebob", "Patrick", "Sandy"]}})
```

**Resultado:**

```sql
[
  { name: 'Spongebob', age: 30, gpa: 3.2 },
  { name: 'Patrick', age: 38, gpa: 1.5 },
  { name: 'Sandy', age: 27, gpa: 4 }
]
```

---

#### ***8. `$nin`***

- *Selecciona los documentos donde el valor de un campo **no coincide** con ninguno de los valores en un arreglo dado.*

**Ejemplo:**

```sql
db.students.find({name: {$nin: ["Spongebob", "Patrick", "Sandy"]}})
```

```sql
school> db.students.find({name: {$nin: ["Spongebob", "Patrick", "Sandy"]}})
```

**Resultado:**

```sql
[
  { name: 'Gary', age: 18, gpa: 2.5 },
  { name: 'Larry', age: 32, gpa: 2.8, fullTime: false, register: ISODate('2024-09-21T19:26:54.025Z'), graduationDate: null, courses: [ 'Biology', 'Chemistry', 'Calculus' ], address: { street: '123 Fake St.', city: 'Bikini Bottom', zip: 1234 } }
]
```

---

### ***Resumen de Operadores***

- **`$ne`:** *No igual.*
- **`$lt`:** *Menor que.*
- **`$lte`:** *Menor o igual que.*
- **`$gt`:** *Mayor que.*
- **`$gte`:** *Mayor o igual que.*
- **`$in`:** *Coincide con algún valor de una lista.*
- **`$nin`:** *No coincide con ninguno de los valores de una lista.*
- **Combinación de operadores:** *Se pueden usar múltiples operadores de comparación en una sola consulta.*
