<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Sintaxis de Base de Datos Database en MongoDB***

---

## ***Lista de bases de datos***

- *Para listar todas las bases de datos disponibles en tu instancia de MongoDB, utiliza el siguiente comando en el shell de MongoDB (`mongosh`):*

```sql
show dbs
```

```sql
test> show dbs
admin   100.00 KiB
config  108.00 KiB
local    72.00 KiB
```

- **Descripción:** *Muestra todas las bases de datos en el servidor de MongoDB junto con su tamaño en disco. Aquí se listan `admin`, `config` y `local`, que son las bases de datos predeterminadas.*

---

### ***Bases de datos por defecto en MongoDB***

- **MongoDB crea automáticamente las siguientes bases de datos predeterminadas:**

- **`admin`:** *Base de datos administrativa usada para gestionar el servidor MongoDB.*
- **`config`:** *Utilizada internamente para almacenar datos de configuración y metadatos.*
- **`local`:** *Base de datos para datos locales que no se replican en clústeres.*

---

#### ***Cambiar a una base de datos***

- **Para cambiar a una base de datos específica (o crearla si no existe), utiliza el siguiente comando:**

```sql
use admin
```

```sql
test> use admin
switched to db admin
```

- **Descripción:** *Cambia la base de datos activa a `admin`. Si la base de datos `admin` no existiera, se crearía.*

---

#### ***Crear y cambiar a una nueva base de datos***

- **Para crear una nueva base de datos y cambiar a ella, utiliza:**

```sql
use school
```

```sql
admin> use school
switched to db school
```

- **Descripción:** *Cambia la base de datos activa a `school`. Si la base de datos `school` no existiera, se crearía.*

---

#### ***Verificar la existencia de una base de datos***

**Al listar las bases de datos después de crear una nueva base de datos vacía:**

```sql
show dbs
```

```sql
school> show dbs
admin   100.00 KiB
config  108.00 KiB
local    72.00 KiB
```

- **Descripción:** *La base de datos `school` no aparece en la lista porque aún está vacía. MongoDB solo muestra las bases de datos que contienen al menos una colección con datos.*

---

#### ***Crear una colección en la base de datos***

- **Para crear una colección en la base de datos activa:**

```sql
school> db.createCollection("students")
{ ok: 1 }
```

```sql
school> db.createCollection("students")
{ ok: 1 }
```

- **Descripción:** *Crea una colección llamada `students` en la base de datos `school`. La respuesta `{ ok: 1 }` indica que la operación fue exitosa.*

---

#### ***Limpiar pantalla***

**Para limpiar la pantalla del shell de MongoDB:**

```sql
ls
```

```sql
school> cls
```

- **Descripción:** *Limpia la pantalla del shell para facilitar la lectura de los resultados. (Nota: En algunos entornos, el comando para limpiar la pantalla puede variar; por ejemplo, `Ctrl+L` o `clear` en otros shells.)*

---

#### ***Verificar la base de datos después de crear una colección***

- **Después de crear una colección, la base de datos `school` debería aparecer en la lista de bases de datos:**

```sql
show dbs
```

```sql
school> show dbs
admin   100.00 KiB
config  108.00 KiB
local    72.00 KiB
school    8.00 KiB
```

- **Descripción:** *Ahora que `school` contiene la colección `students`, aparece en la lista de bases de datos con su tamaño actualizado.*

---

#### ***Eliminar una base de datos***

- **Para eliminar la base de datos activa:**

```sql
db.dropDatabase()
```

```sql
school> db.dropDatabase()
{ ok: 1, dropped: 'school' }
```

- **Descripción:** *Elimina la base de datos `school`. La respuesta `{ ok: 1, dropped: 'school' }` indica que la base de datos fue eliminada exitosamente.*

--

#### ***Verificar la eliminación de la base de datos***

- **Para verificar que la base de datos ha sido eliminada:**

```sql
show dbs
```

```sql
school> show dbs
admin   100.00 KiB
config  108.00 KiB
local    72.00 KiB
```

- **Descripción:** *La base de datos `school` ya no aparece en la lista, confirmando que ha sido eliminada.*
