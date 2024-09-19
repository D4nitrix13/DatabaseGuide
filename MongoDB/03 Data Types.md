<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Sintaxis de Data Types MongoDB***

---

## ***Tipos de datos básicos***

- **`string`:** *Representa cadenas de texto. Por ejemplo: `"Hello, World!"`.*
- **`int`:** *Representa números enteros. Por ejemplo: `42`.*
- **Otros tipos:** *MongoDB también admite otros tipos de datos, como `double` para números de punto flotante, `bool` para valores booleanos (`true` o `false`), y `ObjectId` para identificadores únicos.*

---

### ***Fechas***

- **Para crear un campo de tipo fecha, si no se le pasa ningún valor, se usará la hora actual en la zona horaria UTC. Si deseas establecer una fecha específica, usa el siguiente formato:**

```sql
new Date("2023-01-02T00:00:00")
```

- *El formato de la fecha `new Date("2023-01-02T00:00:00")` se basa en el estándar ISO 8601, que es ampliamente utilizado para representar fechas y horas. Aquí te explico el significado de cada parte:*

- **2023:** *Año. En este caso, representa el año 2023.*
- **01:** *Mes. El valor es 01, lo que indica enero. Los meses van del 01 (enero) al 12 (diciembre).*
- **02:** *Día. Este número representa el día del mes. En este caso, es el segundo día de enero.*
- **T:** *Separador. La letra "T" se utiliza para indicar que lo que sigue es la parte de tiempo de la fecha.*
- **00:** *Horas. Este valor indica que son las 00 horas (medianoche).*
- **00:** *Minutos. Aquí se indica que son 00 minutos.*
- **00:** *Segundos. Este número representa que son 00 segundos.*

### **Resumen**

- *La cadena `"2023-01-02T00:00:00"` representa el 2 de enero de 2023 a las 00:00:00 (medianoche). Cuando se pasa a `new Date()`, se convierte en un objeto de fecha en JavaScript que puedes manipular fácilmente.*

---

#### ***Insertar un documento con varios tipos de datos***

- **Ejemplo de inserción de un documento en la colección `students` que incluye varios tipos de datos:**

```sql
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
                    street: "123. Fake St.",
                    city: "Bikini Bottom",
                    zip: 1234
                 }
    }
)
```

```sql
school> db.students.insertOne(
...     {
...         name: "Larry",
...         age: 32,
...         gpa: 2.8,
...         fullTime: false,
...         register: new Date(),
...         graduationDate: null,
...         courses: ["Biology", "Chemistry", "Calculus"],
...         address: {
...                     street: "123. Fake St.",
...                     city: "Bikini Bottom",
...                     zip: 1234
...                  }
...     }
... )
{
  acknowledged: true,
  insertedId: ObjectId('66ec99ad1ccdd73d3f96403b')
}
```

- **Descripción:** *El documento incluye campos de diferentes tipos de datos: un `string` para `name`, un `int` para `age`, un `double` para `gpa`, un `bool` para `fullTime`, un objeto `Date` para `register`, un `null` para `graduationDate`, un array para `courses`, y un objeto anidado para `address`.*

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

- **Descripción:** *Muestra todos los documentos en la colección `students`, incluyendo el último documento insertado con campos de diferentes tipos de datos, como `ISODate` para fechas y un objeto anidado para la dirección.*
