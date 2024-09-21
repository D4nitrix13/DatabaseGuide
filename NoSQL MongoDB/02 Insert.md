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

  - **Con comillas dobles en la clave:**

    ```sql
    db.students.insertOne({"name": "Spongebob", age: 30, gpa: 3.2})
    ```

  - **Con comillas simples en la clave:**

    ```sql
    db.students.insertOne({'name': "Spongebob", age: 30, gpa: 3.2})
    ```

  - **Sin comillas en la clave (solo si no hay espacios):**

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

### ***Listar todas las colecciones en la base de datos activa***

> [!TIP]
> **Para listar todas las colecciones en una base de datos de MongoDB, puedes usar el comando `show collections` en el shell de MongoDB. Aquí te muestro cómo hacerlo:**

```sql
show collections
```

```sql
school> show collections
students
```

- **Descripción:** *Este comando muestra todas las colecciones en la base de datos activa. Si estás utilizando una base de datos específica, listará solo las colecciones dentro de esa base de datos.*

---

### ***Listar colecciones con el método JavaScript***

- *También puedes listar las colecciones usando el método `getCollectionNames()`:*

```sql
db.getCollectionNames()
```

```sql
db.getCollectionNames()
[ 'students' ]
```

- **Descripción:** *Este comando devuelve una lista de nombres de todas las colecciones dentro de la base de datos actual en un formato de array.*

---

### ***Explicación del Comando `db.getCollectionInfos()`:***

- **El comando `db.getCollectionInfos()` en MongoDB se utiliza para obtener información detallada sobre todas las colecciones en la base de datos activa, en este caso, la base de datos `school`. El resultado es un array de objetos que describe cada colección y sus propiedades.**

```sql
school> db.getCollectionInfos()
[
  {
    name: 'students',
    type: 'collection',
    options: {},
    info: {
      readOnly: false,
      uuid: UUID('59822579-67fd-459b-be49-7fadc266717b')
    },
    idIndex: { v: 2, key: { _id: 1 }, name: '_id_' }
  }
]
```

---

#### ***name: 'students'***

- **Descripción:** *El nombre de la colección, en este caso `students`.*

---

#### ***type: 'collection'***

- **Descripción:** *Especifica el tipo de objeto, que en este caso es una colección de documentos. MongoDB también puede tener otros tipos como vistas (`view`).*

---

#### ***options: {}***

- **Descripción:** *Un objeto que contiene las opciones de configuración de la colección. En este caso, el objeto está vacío (`{}`), lo que significa que no se especificaron opciones especiales al crear la colección, como un `capped collection` o restricciones de tamaño.*

---

#### ***info***

- **Descripción:** *Un subobjeto que proporciona información adicional sobre la colección.*

- **readOnly: false:** *Esto indica que la colección no es de solo lectura, por lo que se pueden realizar operaciones de escritura (inserción, actualización, etc.) en ella.*
  
- **uuid: UUID('59822579-67fd-459b-be49-7fadc266717b'):** *Este es un identificador único universal (UUID) asignado a la colección. Cada colección tiene un UUID único dentro de la base de datos para identificarla.*

---

#### ***idIndex***

- **Descripción:** *Contiene información sobre el índice creado automáticamente para el campo `_id`, que MongoDB genera por defecto para cada colección. Los detalles son:*

- **v: 2:** *La versión del índice.*
  
- **key: { _id: 1 }:** *Define que el índice está creado en el campo `_id`, que es el identificador único de cada documento dentro de la colección. El valor `1` indica que el índice está en orden ascendente.*

- **name: '*id*':** *El nombre del índice, que MongoDB asigna automáticamente como `'_id_'`.*

**Conclusión:** *Este resultado muestra que la base de datos `school` tiene una colección llamada `students`, que no tiene configuraciones especiales, es editable (no de solo lectura) y tiene un índice por defecto en el campo `_id`.*
