<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Bloqueos y Transacciones en SQLite***

---

## ***¿Qué son los bloqueos y para qué sirven?***

- *Los **bloqueos** son mecanismos de control en una base de datos que permiten gestionar el acceso concurrente a los datos. Cuando varios usuarios o procesos intentan acceder a los mismos datos, los bloqueos ayudan a evitar conflictos y garantizan la integridad de la información. Por ejemplo, un bloqueo puede impedir que dos transacciones escriban en la misma fila al mismo tiempo, previniendo inconsistencias.*

- *Las **transacciones** son bloques de una o varias operaciones SQL que se ejecutan de manera atómica, es decir, o se completan todas las operaciones o no se ejecuta ninguna. Los bloqueos son fundamentales dentro de una transacción, ya que ayudan a controlar el acceso simultáneo y a garantizar que los datos queden en un estado coherente cuando la transacción se completa.*

---

### ***Ventajas y Desventajas de los Bloqueos y Transacciones***

**Ventajas:**

- **Consistencia de datos:** *Garantizan que los datos permanezcan coherentes y precisos, incluso cuando varios usuarios interactúan con ellos al mismo tiempo.*
- **Control de concurrencia:** *Permiten gestionar el acceso simultáneo de múltiples procesos, evitando conflictos y corrupción de datos.*
- **Aislamiento de transacciones:** *Mantienen las operaciones dentro de una transacción aisladas, evitando interferencias.*

**Desventajas:**

- **Rendimiento:** *Los bloqueos pueden reducir el rendimiento, especialmente en operaciones de escritura, debido a los tiempos de espera y los bloqueos exclusivos.*
- **Limitaciones de concurrencia:** *En sistemas como SQLite, los bloqueos exclusivos pueden bloquear a otros usuarios de leer o escribir hasta que la transacción finalice.*
- **Bloqueos largos:** *Transacciones extensas pueden mantener los datos bloqueados por más tiempo, afectando a otras transacciones que requieren acceso.*

> [!NOTE]
> *En SQLite, algunos bloqueos avanzados como `FOR UPDATE` no están disponibles. Por lo tanto, aquí exploraremos los conceptos y tipos de bloqueos, sin ver código de ejemplos específicos.*

---

### ***Limitaciones de los Bloqueos en SQLite***

- *SQLite tiene un sistema de bloqueo simplificado en comparación con otros motores de bases de datos, ya que fue diseñado para aplicaciones de bajo a moderado nivel de concurrencia. Esto significa que SQLite tiene limitaciones en el uso de bloqueos y concurrencia, ya que solo permite una escritura a la vez en la base de datos. Existen varios tipos de bloqueos en SQLite:*

---

#### ***Tipos de Bloqueos en SQLite***

1. **Bloqueo Compartido (Shared Lock):** *También conocido como **bloqueo de lectura (Read Lock)**. Permite que múltiples procesos o usuarios lean los datos simultáneamente. Un bloqueo compartido se adquiere cuando se lee de la base de datos y no impide que otros usuarios también lean.*

2. **Bloqueo Reservado (Reserved Lock):** *También conocido como **bloqueo de escritura diferida (Write Lock)**. Este bloqueo indica que una transacción planea escribir en la base de datos, pero todavía no ha comenzado. Otros procesos pueden seguir leyendo, pero no escribir, mientras el bloqueo reservado está activo.*

3. **Bloqueo Exclusivo (Exclusive Lock):** *Este bloqueo permite que un único proceso lea y escriba, bloqueando a otros de cualquier acceso. Durante un bloqueo exclusivo, otros procesos no pueden ni leer ni escribir hasta que se complete la transacción. Este bloqueo se activa cuando se comienza a escribir en la base de datos y se requiere control total para evitar conflictos.*

---

### ***Transacciones en SQL***

*En SQL, una transacción agrupa una serie de operaciones que se ejecutan como una unidad atómica. Esto significa que las operaciones dentro de la transacción se completan todas o ninguna, garantizando la coherencia de los datos. A continuación, detallamos un ejemplo de transacción y cómo manejar errores comunes que pueden surgir en SQLite.*

---

### ***Ejemplo de Transacción***

```sql
BEGIN TRANSACTION;
UPDATE "Products" SET "ProductName" = 'Coca Cola' WHERE "ProductName" = 'Chais';
COMMIT;
```

```sql
sqlite> BEGIN TRANSACTION;
UPDATE "Products" SET "ProductName" = 'Coca Cola' WHERE "ProductName" = 'Chais';
COMMIT;
```

---

#### ***Explicación de cada comando***

1. **BEGIN TRANSACTION:**
   - **BEGIN:** *Inicia una transacción. Cualquier operación realizada después de este punto se considera parte de una unidad de trabajo que será completada con `COMMIT` o revertida con `ROLLBACK`.*
   - **TRANSACTION:** *Palabra opcional en SQLite (se puede omitir escribiendo solo `BEGIN`), que indica el inicio de una transacción.*
   - Dentro de una transacción, se evita que otros procesos modifiquen los mismos datos, garantizando la integridad y consistencia de la base de datos.

2. **UPDATE:**
   - **UPDATE "Products":** *Comando que permite modificar registros en una tabla específica, en este caso, la tabla `"Products"`.*
   - **SET "ProductName" = 'Coca Cola':** *Define el nuevo valor para la columna `"ProductName"`, reemplazando el valor `'Chais'` por `'Coca Cola'`.*
   - **WHERE "ProductName" = 'Chais':** *Filtro que limita la operación solo a aquellos registros donde `"ProductName"` tiene el valor `'Chais'`.*

3. **COMMIT:**
   - **COMMIT:** *Finaliza la transacción, guardando de forma permanente todos los cambios realizados desde el `BEGIN`. Si la transacción se completa correctamente, los cambios quedan en la base de datos; de lo contrario, si ocurre algún error, se pueden revertir usando `ROLLBACK`.*

- *Este proceso asegura que todos los cambios se realicen en conjunto, o que no se realice ninguno si ocurre un problema.*

---

### ***Error Común: `cannot start a transaction within a transaction (1)`***

```sql
sqlite> BEGIN TRANSACTION;
UPDATE "Products" SET "ProductName" = 'Coca Cola' WHERE "ProductName" = 'Chais';
COMMIT;
cannot start a transaction within a transaction (1)
```

*Este error ocurre cuando SQLite detecta que ya hay una transacción activa, y se intenta iniciar otra con `BEGIN TRANSACTION`. Esto suele suceder si la transacción anterior no se cerró adecuadamente o si la base de datos está en un estado de bloqueo.*

---

#### ***Pasos para Resolver el Error***

1. **Revertir la transacción y liberar bloqueos:** *Si la transacción anterior quedó abierta, cancélala y cierra cualquier bloqueo pendiente usando `ROLLBACK`, lo que permite empezar de nuevo:*

   ```sql
   ROLLBACK;
   ```

   ```sql
   sqlite> ROLLBACK;
   ```

2. **Intentar nuevamente** *después de confirmar que no hay otra transacción en curso:*

   ```sql
   BEGIN TRANSACTION;
   UPDATE "Products" SET "ProductName" = 'Coca Cola' WHERE "ProductName" = 'Chais';
   COMMIT;
   ```

   ```sql
   sqlite> BEGIN TRANSACTION;
   UPDATE "Products" SET "ProductName" = 'Coca Cola' WHERE "ProductName" = 'Chais';
   COMMIT;
   ```

   > [!NOTE]
   > *La palabra `TRANSACTION` es opcional en SQLite, por lo que también puedes escribir simplemente `BEGIN`:*

   ```sql
   BEGIN;
   UPDATE "Products" SET "ProductName" = 'Coca Cola' WHERE "ProductName" = 'Chais';
   COMMIT;
   ```

   ```sql
   sqlite> BEGIN;
   UPDATE "Products" SET "ProductName" = 'Coca Cola' WHERE "ProductName" = 'Chais';
   COMMIT;
   ```

3. **Verificar conexiones abiertas:** *SQLite puede bloquearse si otras conexiones a la base de datos están activas o en transacción. Asegúrate de que no haya conexiones paralelas que impidan el acceso, especialmente en entornos multiusuario.*

- *Este procedimiento debería ayudarte a evitar errores al manejar transacciones en SQLite y a realizar actualizaciones de forma segura.*

---

## ***Manejo de Errores en Transacciones: `cannot rollback - no transaction is active (1)`***

---

### ***Descripción del Error***

- *El error `cannot rollback - no transaction is active (1)` ocurre cuando se intenta ejecutar un `ROLLBACK` sin una transacción activa. Esto puede suceder por dos razones principales:*

1. **No se inició la transacción correctamente:** *No hay una transacción en progreso que pueda ser revertida.*
2. **La transacción ya ha finalizado:** *SQLite detecta que la transacción ha sido confirmada (`COMMIT`) o revertida (`ROLLBACK`) previamente, y no hay nada más que revertir.*

---

## ***Pasos para Resolver el Error Actual***

1. **Verificar si hay una transacción activa:** *Antes de ejecutar cualquier comando de control de transacciones (`BEGIN TRANSACTION`, `COMMIT`, o `ROLLBACK`), asegúrate de que no haya una transacción pendiente o en curso, ya que esto podría indicar un estado inconsistente.*

2. **Iniciar la transacción sin `ROLLBACK` previo:** *Si deseas realizar una transacción de actualización, asegúrate de comenzar correctamente sin intentar un `ROLLBACK` inicial, a menos que estés seguro de que la transacción anterior quedó incompleta. Por ejemplo:*

   ```sql
   BEGIN TRANSACTION;
   UPDATE "Products" SET "ProductName" = 'Coca Cola' WHERE "ProductName" = 'Chais';
   COMMIT;
   ```

   ```sql
   sqlite> BEGIN TRANSACTION;
   UPDATE "Products" SET "ProductName" = 'Coca Cola' WHERE "ProductName" = 'Chais';
   COMMIT;
   ```

   ```sql
   sqlite> BEGIN;
   UPDATE "Products" SET "ProductName" = 'Coca Cola' WHERE "ProductName" = 'Chais';
   COMMIT;
   ```

3. **Cerrar y reabrir la conexión a la base de datos:** *En algunos casos, SQLite puede quedar en un estado de bloqueo o inconsistente, lo que hace que el sistema no reconozca el estado real de la transacción. Cerrar y reabrir la conexión puede ayudar a restaurar el estado adecuado y resolver el problema.*

4. **Ejecutar comandos de manera aislada:** *Si el problema persiste, intenta ejecutar la operación de actualización (`UPDATE`) sin agruparla en un bloque de transacción explícito (`BEGIN TRANSACTION` y `COMMIT`), ya que SQLite por defecto trata cada sentencia como una transacción independiente:*

   ```sql
   UPDATE "Products" SET "ProductName" = 'Coca Cola' WHERE "ProductName" = 'Chais';
   ```

   ```sql
   sqlite> UPDATE "Products" SET "ProductName" = 'Coca Cola' WHERE "ProductName" = 'Chais';
   ```

- **Conclusión**

- *Este procedimiento te permitirá corregir el error `cannot rollback - no transaction is active (1)` al asegurar que solo se ejecuten comandos de transacción en contextos válidos y que la conexión a la base de datos esté en el estado adecuado antes de iniciar nuevas operaciones.*

---

## ***Operaciones en la Tabla "Products"***

---

### ***Ejemplo de Consulta Inicial***

```sql
SELECT * FROM "Products" LIMIT 2;
```

```sql
sqlite> SELECT * FROM "Products" LIMIT 2;
```

**Resultado:**

```bash
1|Coca Cola|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
```

---

### ***Transacción con ROLLBACK***

```sql
BEGIN TRANSACTION;
UPDATE "Products" SET "ProductName" = 'Chais' WHERE "ProductName" = 'Coca Cola';
ROLLBACK;
```

```sql
sqlite> BEGIN TRANSACTION;
UPDATE "Products" SET "ProductName" = 'Chais' WHERE "ProductName" = 'Coca Cola';
ROLLBACK;
```

---

### ***Explicación del Comando***

1. **BEGIN TRANSACTION:** *Inicia una nueva transacción. Todas las operaciones que se realicen después de este comando se agruparán. Si todo se ejecuta correctamente, se pueden confirmar más tarde con `COMMIT`, o se pueden revertir con `ROLLBACK`.*

2. **UPDATE:** *Cambia el nombre del producto `"Coca Cola"` a `"Chais"`. Sin embargo, dado que se usa `ROLLBACK`, el cambio no se guarda en la base de datos.*

3. **ROLLBACK:** *Revierte todas las operaciones realizadas en la transacción actual, es decir, el cambio de `"Coca Cola"` a `"Chais"` no se aplicará. Esto significa que los datos seguirán siendo los mismos que antes de la transacción.*

---

### ***Verificación Post-Rollback***

```sql
SELECT * FROM "Products" LIMIT 2;
```

```sql
sqlite> SELECT * FROM "Products" LIMIT 2;
```

**Resultado:**

```bash
1|Coca Cola|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
```

- **Como se puede observar, el nombre del producto sigue siendo `"Coca Cola"` porque el `ROLLBACK` deshizo el cambio.**

---

### ***Nueva Transacción***

```sql
BEGIN TRANSACTION;
UPDATE "Products" SET "ProductName" = 'GeForce RTX 4090';
```

```sql
sqlite> BEGIN TRANSACTION;
UPDATE "Products" SET "ProductName" = 'GeForce RTX 4090';
```

---

#### ***Resultado Esperado***

```sql
SELECT * FROM "Products" LIMIT 3;
```

```sql
sqlite> SELECT * FROM "Products" LIMIT 3;
```

**Posible Resultado:**

```bash
1|GeForce RTX 4090|1|1|10 boxes x 20 bags|18
2|GeForce RTX 4090|1|1|24 - 12 oz bottles|19
3|GeForce RTX 4090|1|2|12 - 550 ml bottles|10
```

---

### ***Conexión desde Otro Proceso***

**Si te conectas a la base de datos desde otra instancia, como esta:**

```bash
docker container exec --interactive --tty --privileged --user vscode container-sqlite3-practicas sqlite3 /home/vscode/Northwind.db
```

```bash
docker container exec --interactive --tty --privileged --user vscode container-sqlite3-practicas sqlite3 /home/vscode/Northwind.db
SQLite version 3.37.2 2022-01-06 13:25:41
Enter ".help" for usage hints.
sqlite>
```

**Y ejecutas:**

```sql
BEGIN TRANSACTION;
UPDATE "Products" SET "ProductName" = 'GeForce RTX 4090';
```

```sql
sqlite> BEGIN TRANSACTION;
UPDATE "Products" SET "ProductName" = 'GeForce RTX 4090';
```

---

#### ***Error Encontrado***

```bash
Error: stepping, database is locked (5)
```

---

### ***Descripción del Error Actual***

- *El error `database is locked (5)` indica que la base de datos está en estado de bloqueo. Esto ocurre porque otra conexión o proceso está utilizando la base de datos y no ha liberado el bloqueo. Este problema es común en aplicaciones multiusuario o cuando múltiples transacciones intentan acceder simultáneamente.*

---

### ***Pasos para Resolver el Problema***

1. **Cerrar todas las conexiones activas:** *Asegúrate de que no haya otras conexiones o procesos utilizando la misma base de datos. En SQLite, solo se permite una conexión de escritura a la vez.*

2. **Reducir el tiempo de espera de bloqueo:** *Configura un tiempo de espera que SQLite debe aguardar antes de lanzar un error. Por ejemplo, puedes establecerlo en 5000 milisegundos (5 segundos):*

   ```sql
   PRAGMA busy_timeout = 5000;
   ```

   ```sql
   sqlite> PRAGMA busy_timeout = 5000;
   ```

   - *Esto le indica a SQLite que espere hasta 5 segundos para obtener acceso a la base de datos antes de lanzar un error.*

3. **Cerrar y reabrir la conexión:** *Si el problema persiste, intenta cerrar y volver a abrir la conexión a la base de datos para liberar cualquier bloqueo.*

4. **Ejecutar comandos de manera aislada:** *Si sigue fallando, intenta ejecutar la operación de actualización (`UPDATE`) sin utilizar `BEGIN TRANSACTION` y `COMMIT`, ya que SQLite ejecuta automáticamente cada sentencia como una transacción aislada si no hay un bloque de transacción explícito.*

5. **Verificar el modo WAL (Write-Ahead Logging):** *Si estás usando SQLite en modo WAL, este permite algunas operaciones de lectura y escritura simultáneas, pero no siempre es compatible con todas las aplicaciones. Puedes desactivarlo temporalmente para verificar si mejora la situación:*

   ```sql
   PRAGMA journal_mode = DELETE;
   ```

   ```sql
   sqlite> PRAGMA journal_mode = DELETE;
   ```

- **Conclusión**

- *Sigue estos pasos para resolver el problema de bloqueo de base de datos y asegúrate de gestionar correctamente las transacciones y conexiones. Al hacer esto, podrás evitar conflictos y garantizar que tus operaciones en la base de datos se realicen de manera eficiente*

---

## ***Operaciones en la Tabla "Products" Actual***

---

### ***Consulta Inicial***

```sql
SELECT * FROM "Products" LIMIT 3;
```

```sql
sqlite> SELECT * FROM "Products" LIMIT 3;
```

**Resultado:**

```bash
1|Coca Cola|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
```

---

### ***Actualización de un Registro***

**Iniciamos una transacción y actualizamos el nombre del producto `"Coca Cola"` a `"Chais"`:**

```sql
BEGIN TRANSACTION;
UPDATE "Products" SET "ProductName" = 'Chais' WHERE "ProductName" = 'Coca Cola';
```

```sql
sqlite> BEGIN TRANSACTION;
UPDATE "Products" SET "ProductName" = 'Chais' WHERE "ProductName" = 'Coca Cola';
```

---

### ***Verificación del Cambio***

- *Después de ejecutar el `UPDATE`, verificamos los cambios realizados:*

```sql
SELECT * FROM "Products" LIMIT 3;
```

```sql
sqlite> SELECT * FROM "Products" LIMIT 3;
```

**Resultado:**

```bash
1|Chais|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
```

---

### ***Confirmación del Cambio***

- **Para hacer permanentes los cambios realizados, utilizamos el comando `COMMIT`:**

```sql
COMMIT;
```

```sql
sqlite> COMMIT;
```

---

### ***Verificación Final***

- *Al consultar nuevamente la tabla, confirmamos que el cambio ha sido registrado correctamente:*

```sql
SELECT * FROM "Products" LIMIT 3;
```

```sql
sqlite> SELECT * FROM "Products" LIMIT 3;
```

**Resultado:**

```bash
1|Chais|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
```

---

### ***Advertencias en Clientes Gráficos***

- *Al realizar una actualización sin especificar una cláusula `WHERE`, los clientes gráficos suelen mostrar advertencias para prevenir cambios no deseados en múltiples filas. Esto es importante para mantener la integridad de los datos. A continuación, un ejemplo de advertencia que podría aparecer:*

- *![Advertencia de Actualización](Images/ImageUpdateWarning.png "Images/ImageUpdateWarning.png")*

---

### ***Resumen***

1. **Transacciones:** *Utilizamos `BEGIN TRANSACTION` para agrupar operaciones que deben ser confirmadas o revertidas en conjunto.*
2. **UPDATE:** *Se cambia el nombre de un producto especificando la condición `WHERE` para evitar afectar otros registros.*
3. **COMMIT:** *Asegura que los cambios sean permanentes en la base de datos.*
4. **Precaución:** *Siempre verificar el uso de `WHERE` en operaciones `UPDATE` para evitar modificaciones accidentales de múltiples registros.*

*Con esta estructura y claridad, tus apuntes deberían ser más fáciles de seguir y entender.*

---

### ***1. Verificar el Estado de la Base de Datos***

> [!CAUTION]
> *En SQLite, no hay un comando directo para listar todas las transacciones activas de forma nativa. Sin embargo, puedes realizar algunas acciones para monitorear el estado de la base de datos y verificar si hay transacciones activas. Aquí te presento algunas opciones:*

- *Puedes usar el comando `PRAGMA` para obtener información sobre el estado de la base de datos, incluyendo si hay bloqueos activos. Esto puede darte una idea de si hay transacciones que están en proceso:*

```sql
PRAGMA database_list;
PRAGMA locking_mode;
PRAGMA journal_mode;
```

```sql
sqlite> PRAGMA database_list;
PRAGMA locking_mode;
PRAGMA journal_mode;
```

---

### ***1. PRAGMA database_list***

- *El comando `PRAGMA` en SQLite se utiliza para consultar o modificar la configuración de la base de datos y para obtener información sobre su estado. Aquí tienes una explicación detallada de los comandos que mencionaste:*
- **Este comando devuelve una lista de las bases de datos abiertas en la conexión actual. La consulta devuelve una tabla con tres columnas:**

- **seq:** *Un número de secuencia que representa la posición de la base de datos en la lista.*
- **name:** *El nombre de la base de datos.*
- **file:** *La ruta al fichero de la base de datos.*

**Ejemplo de uso:**

```sql
PRAGMA database_list;
```

```sql
sqlite> PRAGMA database_list;
0|main|/home/vscode/Northwind.db
```

**Resultado:**

| *seq* | *name* | *file*                      |
| ----- | ------ | --------------------------- |
| *0*   | *main* | */home/vscode/Northwind.db* |

- **Aquí, `main` es la base de datos principal (el fichero que has abierto) y `temp` es una base de datos temporal que SQLite crea automáticamente.**

---

### ***2. PRAGMA locking_mode***

- **Este comando se utiliza para obtener o establecer el modo de bloqueo de la base de datos. Existen dos modos:**

- **NORMAL:** *Este es el modo predeterminado. Permite bloqueos compartidos y exclusivos según sea necesario.*
- **EXCLUSIVE:** *En este modo, todas las conexiones intentarán obtener un bloqueo exclusivo en la base de datos, lo que significa que solo una conexión podrá acceder a la base de datos a la vez, lo que puede mejorar la coherencia en situaciones de múltiples conexiones.*

**Ejemplo de uso:**

```sql
PRAGMA locking_mode;
```

**Resultado:**

```sql
sqlite> PRAGMA locking_mode;
normal
```

- **Para establecer el modo de bloqueo a exclusivo:**

```sql
PRAGMA locking_mode = EXCLUSIVE;
```

---

### ***3. PRAGMA journal_mode***

- **Este comando se utiliza para obtener o establecer el modo de registro (journal mode) de la base de datos. El modo de registro determina cómo SQLite maneja las transacciones y los puntos de restauración. Existen varios modos:**

- **DELETE:** *El modo predeterminado. Al finalizar la transacción, el fichero de registro se elimina.*
- **TRUNCATE:** *Similar a DELETE, pero el fichero de registro se trunca en lugar de eliminarse.*
- **PERSIST:** *El fichero de registro se mantiene, pero se limpia su contenido.*
- **MEMORY:** *El registro se almacena en memoria, lo que puede ser más rápido pero no persiste después de cerrar la base de datos.*
- **WAL (Write-Ahead Logging):** *Permite un acceso concurrente más eficiente y no bloquea las lecturas mientras se realizan escrituras.*

**Truncar** *se refiere a la acción de eliminar datos o recortar algo de manera que se eliminen las partes no deseadas. En el contexto de bases de datos y sistemas de gestión de datos, "truncar" tiene varios significados dependiendo de cómo se utilice. Aquí te detallo los significados más comunes:*

---

### ***1. Truncar una Tabla en SQL***

- *Cuando se habla de truncar una tabla en SQL, se refiere al comando `TRUNCATE TABLE`, que se utiliza para eliminar todos los registros de una tabla de manera rápida y eficiente. A diferencia del comando `DELETE`, que puede eliminar filas una por una y puede incluir condiciones (`WHERE`), `TRUNCATE` elimina todas las filas de la tabla sin poder aplicar filtros. Este proceso es irreversible y no se puede realizar un `ROLLBACK` sobre un `TRUNCATE`.*

**Sintaxis:**

```sql
TRUNCATE TABLE NombreTabla;
```

**Ejemplo:**

```sql
TRUNCATE TABLE Products;
```

```sql
sqlite> TRUNCATE TABLE Products;
```

**Características:**

- **Rápido:** *Es más rápido que `DELETE` porque no genera un registro individual para cada fila eliminada.*
- **No se puede usar con condiciones:** *Elimina todas las filas sin opción de filtrado.*
- **Reinicia contadores:** *En algunas bases de datos, como SQL Server, reinicia los contadores de las columnas `IDENTITY` si las hay.*

---

### ***2. Truncar un Fichero o Datos***

- **En el contexto de ficheros o datos, truncar puede referirse a la acción de reducir la longitud de un fichero o conjunto de datos, eliminando parte de su contenido. Por ejemplo, si se trunca un fichero de texto, se eliminarán los caracteres que están más allá de un cierto punto.**

---

### ***3. Truncar un Número o Valor***

- **En programación y matemáticas, truncar puede referirse a la acción de eliminar la parte decimal de un número, quedándose solo con la parte entera. Por ejemplo, truncar el número 5.78 resultaría en 5.**

- **Conclusión**

- *El término "truncar" se utiliza en varios contextos para referirse a la eliminación o reducción de datos. En bases de datos, el comando `TRUNCATE TABLE` es una herramienta eficiente para limpiar completamente el contenido de una tabla sin necesidad de especificar condiciones o realizar un seguimiento detallado de los cambios.*

**Ejemplo de uso:**

```sql
PRAGMA journal_mode;
```

**Resultado:**

```sql
sqlite> PRAGMA journal_mode;
delete
```

**Para establecer el modo de registro a WAL:**

```sql
PRAGMA journal_mode = WAL;
```

```sql
sqlite> PRAGMA journal_mode = WAL;
```

- **Conclusión**

- **Los comandos `PRAGMA` son herramientas poderosas en SQLite para gestionar y obtener información sobre el estado de la base de datos. Puedes usarlos para conocer el estado de las bases de datos abiertas, el modo de bloqueo actual y el modo de registro, lo que te permite optimizar el rendimiento y la seguridad de tus transacciones.**

---

### ***2. Identificar Conexiones Activas***

- *Si tienes acceso a las conexiones a la base de datos, puedes identificar si hay conexiones activas que podrían estar ejecutando transacciones. Sin embargo, esto normalmente no se puede hacer desde dentro de SQLite. Puedes hacer esto desde la aplicación que maneja las conexiones.*

---

### ***3. Uso de herramientas externas***

> [!IMPORTANT]
> **Si estás utilizando un entorno gráfico para gestionar SQLite, algunas herramientas te permiten monitorear las conexiones y transacciones activas, pero esto dependerá del cliente específico que estés usando.**

---

### ***4. Manejo de Errores***

> [!WARNING]
> **Si intentas realizar una operación y recibes un error de base de datos bloqueada (`database is locked`), puede indicar que hay una transacción activa en otro proceso. Esto es un indicativo indirecto de que hay transacciones que podrían estar activas.**

---

### ***5. Simular Transacciones Activas***

- **Puedes crear un ejemplo para simular una transacción y, al intentar otra, puedes verificar que la primera está activa:**

```sql
-- Conexión 1
BEGIN TRANSACTION;

-- Conexión 2
BEGIN TRANSACTION;  -- Esto generará un error si la primera conexión no se ha cerrado.

-- Cerrar la primera conexión o hacer ROLLBACK o COMMIT
ROLLBACK;  -- O COMMIT, según sea necesario.
```

```sql
sqlite> -- Conexión 1
BEGIN TRANSACTION;

-- Conexión 2
BEGIN TRANSACTION;  -- Esto generará un error si la primera conexión no se ha cerrado.

-- Cerrar la primera conexión o hacer ROLLBACK o COMMIT
ROLLBACK;  -- O COMMIT, según sea necesario.
```

---

### ***Conclusión***

- *SQLite no proporciona un método directo para listar todas las transacciones activas debido a su simplicidad y diseño. Sin embargo, puedes usar los comandos `PRAGMA` para verificar el estado general y manejar las conexiones activas desde tu aplicación o entorno de administración.*
