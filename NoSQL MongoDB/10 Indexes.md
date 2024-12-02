<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Indexes en MongoDB***

- **Aquí tienes la información mejorada sobre los índices en MongoDB, con explicaciones más detalladas y estructuradas:**

---

## ***¿Qué son los Índices?***

> [!NOTE]
> *Los índices son estructuras de datos que mejoran la velocidad de las operaciones de búsqueda en una base de datos. Al agregar un índice, se permite una búsqueda más eficiente, lo que puede acelerar significativamente el tiempo de respuesta para consultas específicas. Sin embargo, los índices ocupan espacio adicional en memoria y pueden ralentizar las operaciones de inserción, actualización y eliminación, ya que el índice debe ser actualizado cada vez que se modifica el documento.*

![Image DataStructureB-Tree](/Images/DataStructureB-Tree.png "Images/DataStructureB-Tree.png")

---

### ***Ejemplo de Búsqueda sin Índice***

- *Al realizar una consulta sin un índice, MongoDB puede tener que realizar un **escaneo completo de la colección**:*

```sql
db.students.find({name: "Larry"}).explain("executionStats")
```

```sql
school> db.students.find({name: "Larry"}).explain("executionStats")
```

**Resultado:**

```sql
school> db.students.find({name: "Larry"}).explain("executionStats")
{
  explainVersion: '1',
  queryPlanner: {
    namespace: 'school.students',
    indexFilterSet: false,
    parsedQuery: { name: { '$eq': 'Larry' } },
    queryHash: 'A2F868FD',
    planCacheKey: 'A2F868FD',
    maxIndexedOrSolutionsReached: false,
    maxIndexedAndSolutionsReached: false,
    maxScansToExplodeReached: false,
    winningPlan: {
      stage: 'COLLSCAN',
      filter: { name: { '$eq': 'Larry' } },
      direction: 'forward'
    },
    rejectedPlans: []
  },
  executionStats: {
    executionSuccess: true,
    nReturned: 1,
    executionTimeMillis: 0,
    totalKeysExamined: 0,
    totalDocsExamined: 5,
    executionStages: {
      stage: 'COLLSCAN',
      filter: { name: { '$eq': 'Larry' } },
      nReturned: 1,
      executionTimeMillisEstimate: 0,
      works: 6,
      advanced: 1,
      needTime: 4,
      needYield: 0,
      saveState: 0,
      restoreState: 0,
      isEOF: 1,
      direction: 'forward',
      docsExamined: 5
    }
  },
  command: { find: 'students', filter: { name: 'Larry' }, '$db': 'school' },
  serverInfo: {
    host: '0ebf220b92c3',
    port: 27017,
    version: '7.0.14',
    gitVersion: 'ce59cfc6a3c5e5c067dca0d30697edd68d4f5188'
  },
  serverParameters: {
    internalQueryFacetBufferSizeBytes: 104857600,
    internalQueryFacetMaxOutputDocSizeBytes: 104857600,
    internalLookupStageIntermediateDocumentMaxSizeBytes: 104857600,
    internalDocumentSourceGroupMaxMemoryBytes: 104857600,
    internalQueryMaxBlockingSortMemoryUsageBytes: 104857600,
    internalQueryProhibitBlockingMergeOnMongoS: 0,
    internalQueryMaxAddToSetBytes: 104857600,
    internalDocumentSourceSetWindowFieldsMaxMemoryBytes: 104857600,
    internalQueryFrameworkControl: 'trySbeRestricted'
  },
  ok: 1
}
```

- *Aquí, `totalDocsExamined` muestra que se examinaron todos los documentos (5) porque no había un índice en la propiedad `name`.*

---

### ***Creación de un Índice***

- *Para mejorar el rendimiento de las consultas, puedes crear un índice en un campo específico:*

```sql
db.students.createIndex({name: 1})
```

```sql
school> db.students.createIndex({name: 1})
name_1
```

**Este comando crea un índice ascendente (`1`) en el campo `name`. También puedes crear un índice descendente usando `-1`:**

```sql
school> db.students.createIndex({name: -1})
```

---

### ***Ejemplo de Búsqueda con Índice***

- **Después de crear un índice, al realizar la misma consulta, deberías ver una mejora en el rendimiento:**

```sql
db.students.find({name: "Larry"}).explain("executionStats")
```

```sql
school> db.students.find({name: "Larry"}).explain("executionStats")
```

**Resultado:**

```sql
school> db.students.find({name: "Larry"}).explain("executionStats")
{
  explainVersion: '1',
  queryPlanner: {
    namespace: 'school.students',
    indexFilterSet: false,
    parsedQuery: { name: { '$eq': 'Larry' } },
    queryHash: 'A2F868FD',
    planCacheKey: 'A3E454E0',
    maxIndexedOrSolutionsReached: false,
    maxIndexedAndSolutionsReached: false,
    maxScansToExplodeReached: false,
    winningPlan: {
      stage: 'FETCH',
      inputStage: {
        stage: 'IXSCAN',
        keyPattern: { name: 1 },
        indexName: 'name_1',
        isMultiKey: false,
        multiKeyPaths: { name: [] },
        isUnique: false,
        isSparse: false,
        isPartial: false,
        indexVersion: 2,
        direction: 'forward',
        indexBounds: { name: [ '["Larry", "Larry"]' ] }
      }
    },
    rejectedPlans: []
  },
  executionStats: {
    executionSuccess: true,
    nReturned: 1,
    executionTimeMillis: 1,
    totalKeysExamined: 1,
    totalDocsExamined: 1,
    executionStages: {
      stage: 'FETCH',
      nReturned: 1,
      executionTimeMillisEstimate: 0,
      works: 2,
      advanced: 1,
      needTime: 0,
      needYield: 0,
      saveState: 0,
      restoreState: 0,
      isEOF: 1,
      docsExamined: 1,
      alreadyHasObj: 0,
      inputStage: {
        stage: 'IXSCAN',
        nReturned: 1,
        executionTimeMillisEstimate: 0,
        works: 2,
        advanced: 1,
        needTime: 0,
        needYield: 0,
        saveState: 0,
        restoreState: 0,
        isEOF: 1,
        keyPattern: { name: 1 },
        indexName: 'name_1',
        isMultiKey: false,
        multiKeyPaths: { name: [] },
        isUnique: false,
        isSparse: false,
        isPartial: false,
        indexVersion: 2,
        direction: 'forward',
        indexBounds: { name: [ '["Larry", "Larry"]' ] },
        keysExamined: 1,
        seeks: 1,
        dupsTested: 0,
        dupsDropped: 0
      }
    }
  },
  command: { find: 'students', filter: { name: 'Larry' }, '$db': 'school' },
  serverInfo: {
    host: '0ebf220b92c3',
    port: 27017,
    version: '7.0.14',
    gitVersion: 'ce59cfc6a3c5e5c067dca0d30697edd68d4f5188'
  },
  serverParameters: {
    internalQueryFacetBufferSizeBytes: 104857600,
    internalQueryFacetMaxOutputDocSizeBytes: 104857600,
    internalLookupStageIntermediateDocumentMaxSizeBytes: 104857600,
    internalDocumentSourceGroupMaxMemoryBytes: 104857600,
    internalQueryMaxBlockingSortMemoryUsageBytes: 104857600,
    internalQueryProhibitBlockingMergeOnMongoS: 0,
    internalQueryMaxAddToSetBytes: 104857600,
    internalDocumentSourceSetWindowFieldsMaxMemoryBytes: 104857600,
    internalQueryFrameworkControl: 'trySbeRestricted'
  },
  ok: 1
}
```

- *Aquí, `totalKeysExamined` indica que solo se examinó un índice en lugar de todos los documentos, mejorando así la eficiencia de la consulta.*

---

### ***Obtención de Índices Existentes***

- **Para ver los índices existentes en la colección `students`, utiliza el siguiente comando:**

```sql
db.students.getIndexes()
```

```sql
school> db.students.getIndexes()
```

**Resultado:**

```sql
[
  { v: 2, key: { _id: 1 }, name: '_id_' },
  { v: 2, key: { name: 1 }, name: 'name_1' }
]
```

- *Este resultado muestra que hay un índice predeterminado en `_id` y el índice que creamos en `name`.*

---

### ***Eliminación de un Índice***

- *Si decides que un índice ya no es necesario, puedes eliminarlo con el siguiente comando:*

```sql
db.students.dropIndex("name_1")
```

```sql
school> db.students.dropIndex("name_1")
```

**Resultado:**

```sql
{ nIndexesWas: 2, ok: 1 }
```

- *Esto confirma que el índice fue eliminado correctamente.*

---

### ***Eliminación de Todos los Índices***

- *Si deseas eliminar todos los índices de la colección, puedes usar el siguiente comando:*

```sql
school> db.students.dropIndexes()
```

---

### ***Resumen de Índices en MongoDB***

- **Ventajas:** *Mejora la velocidad de búsqueda.*
- **Desventajas:** *Aumenta el uso de memoria y puede ralentizar inserciones, actualizaciones y eliminaciones.*
- **Tipos:** *Ascendente (`1`) y descendente (`-1`).*
- **Comandos:**
  - *Crear índice: `createIndex()`*
  - *Ver índices: `getIndexes()`*
  - *Eliminar índice: `dropIndex()`*
  - *Eliminar todos los índices: `dropIndexes()`*
