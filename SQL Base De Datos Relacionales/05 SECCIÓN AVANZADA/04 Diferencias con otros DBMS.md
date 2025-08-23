<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Diferencias con otros DBMS***

---

## ***1. Concepto de Base de Datos Embebida***

**Definición:**
*Una base de datos embebida es un sistema de gestión de bases de datos que se integra directamente en la aplicación que la utiliza. No requiere un servidor independiente para operar, lo que significa que todas las operaciones de la base de datos se llevan a cabo dentro del mismo proceso de la aplicación.*

**Ejemplo:**
*SQLite es un buen ejemplo de base de datos embebida; se almacena en un fichero dentro del sistema de ficheros y se accede directamente desde la aplicación que la utiliza. Esto es ideal para aplicaciones móviles, software de escritorio o situaciones donde se necesita una gestión simple y ligera de datos.*

---

### ***2. Comparación entre SQLite, SQL Server, MySQL y PostgreSQL***

| **Característica**                          | **SQLite**                                                  | **SQL Server**                                      | **MySQL**                                           | **PostgreSQL**                                          |
| ------------------------------------------- | ----------------------------------------------------------- | --------------------------------------------------- | --------------------------------------------------- | ------------------------------------------------------- |
| **Tipo**                                    | *Embebida*                                                  | *Cliente/Servidor*                                  | *Cliente/Servidor*                                  | *Cliente/Servidor*                                      |
| **Instalación**                             | *Solo requiere un fichero*                                  | *Instalación completa y configuración del servidor* | *Instalación completa y configuración del servidor* | *Instalación completa y configuración del servidor*     |
| **Costo**                                   | *Gratuito*                                                  | *Licencia comercial*                                | *Gratuito (versión comunitaria)*                    | *Gratuito (versión comunitaria)*                        |
| **Soporte para Transacciones**              | *Soporte básico (ACID)*                                     | *Soporte completo (ACID)*                           | *Soporte básico (ACID)*                             | *Soporte completo (ACID)*                               |
| **Escalabilidad**                           | *Limitada*                                                  | *Alta escalabilidad*                                | *Alta escalabilidad*                                | *Alta escalabilidad*                                    |
| **Lenguaje de Consulta**                    | *SQL*                                                       | *T-SQL*                                             | *SQL*                                               | *SQL*                                                   |
| **Soporte para Procedimientos Almacenados** | *No*                                                        | *Sí*                                                | *Sí*                                                | *Sí*                                                    |
| **Soporte para Concurrencia**               | *Limitado (bloqueo de fichero)*                             | *Alto (control de concurrencia)*                    | *Alto (control de concurrencia)*                    | *Alto (control de concurrencia)*                        |
| **Diferencias en Mayúsculas y Minúsculas**  | *Sensible a mayúsculas dependiendo del sistema de ficheros* | *Insensible a mayúsculas*                           | *Insensible a mayúsculas*                           | *Sensible a mayúsculas dependiendo de la configuración* |

---

### ***3. Características Específicas***

---

#### ***a. Tamaño y Eficiencia***

- **SQLite:** *Muy ligero y eficiente en uso de recursos, ideal para aplicaciones con bajo volumen de datos.*
- **SQL Server, MySQL, PostgreSQL:** *Requieren más recursos y espacio debido a su arquitectura cliente/servidor.*

---

#### ***b. Transacciones***

- **SQLite:** *Soporta transacciones, pero puede tener limitaciones en entornos altamente concurrentes debido a su bloqueo de fichero.*
- **SQL Server y PostgreSQL:** *Soporte completo para transacciones y control de concurrencia, lo que permite múltiples accesos simultáneos sin problemas.*
  
  ---
  
#### ***c. Procedimientos Almacenados***

- **SQLite:** *No soporta procedimientos almacenados, lo que limita la capacidad de encapsular lógica de negocio en la base de datos.*
- **SQL Server, MySQL y PostgreSQL:** *Permiten la creación de procedimientos almacenados, facilitando la reutilización de código y la implementación de lógica compleja.*

---

#### ***d. Escalabilidad y Rendimiento***

- **SQLite:** *Mejor para aplicaciones pequeñas y medianas, pero no es adecuado para aplicaciones a gran escala con múltiples usuarios concurrentes.*
- **SQL Server, MySQL y PostgreSQL:** *Diseñados para manejar aplicaciones empresariales grandes con alta concurrencia y grandes volúmenes de datos.*

---

### ***4. Diferencias en el Tratamiento de Mayúsculas y Minúsculas***

- **SQLite:** *Puede ser sensible a mayúsculas o minúsculas, dependiendo del sistema de ficheros. Por ejemplo, en sistemas de ficheros de Windows, "tabla" y "Tabla" pueden ser tratados como idénticos, pero en Linux pueden ser diferentes.*
- **SQL Server:** *Generalmente insensible a mayúsculas, aunque esto puede variar según la configuración de collation.*
- **MySQL:** *También insensible a mayúsculas en la mayoría de las configuraciones predeterminadas.*
- **PostgreSQL:** *Sensible a mayúsculas, a menos que se utilicen comillas para forzar el uso exacto de la capitalización.*

---

### ***Resumen***

*SQLite es una opción excelente para aplicaciones pequeñas y embebidas debido a su simplicidad y ligereza. Sin embargo, para aplicaciones más grandes que requieren un alto nivel de concurrencia, transacciones complejas y soporte para procedimientos almacenados, es preferible utilizar sistemas como SQL Server, MySQL o PostgreSQL, que están diseñados para manejar esos requisitos.*

---

## ***Ejemplo de Creación de Bases de Datos***

---

### ***1. SQLite***

```sql
-- Crear base de datos en SQLite
-- En SQLite, la base de datos se crea al crear una conexión con un fichero.
-- No es necesario un comando específico para crear la base de datos.

-- Crear tabla en la base de datos
CREATE TABLE diferencias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    descripcion TEXT NOT NULL
);
```

**Diferencias:**  
*En SQLite, la base de datos es un fichero y se crea automáticamente al conectarse a un fichero. La estructura de la tabla se define directamente al crearla.*

---

## ***2. SQL Server***

```sql
-- Crear base de datos en SQL Server
CREATE DATABASE DiferenciasDB;
GO

-- Usar la base de datos creada
USE DiferenciasDB;
GO

-- Crear tabla en la base de datos
CREATE TABLE diferencias (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(255) NOT NULL
);
```

**Diferencias:**  
*En SQL Server, se utiliza el comando `CREATE DATABASE` para crear una base de datos. Las tablas se definen utilizando el tipo de datos específico de SQL Server, como `NVARCHAR` para soportar texto Unicode.*

---

## ***3. MySQL***

```sql
-- Crear base de datos en MySQL
CREATE DATABASE DiferenciasDB;
-- Seleccionar la base de datos
USE DiferenciasDB;

-- Crear tabla en la base de datos
CREATE TABLE diferencias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NOT NULL
) ENGINE=InnoDB;
```

**Diferencias:**  
*En MySQL, se utiliza `CREATE DATABASE` para crear una base de datos, seguido del comando `USE` para seleccionarla. La tabla puede especificar un motor de almacenamiento, como `InnoDB`, que soporta transacciones y claves foráneas.*

---

## ***4. PostgreSQL***

```sql
-- Crear base de datos en PostgreSQL
CREATE DATABASE diferenciasdb;

-- Conectar a la base de datos creada
\c diferenciasdb;

-- Crear tabla en la base de datos
CREATE TABLE diferencias (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL
);
```

**Diferencias:**  
*En PostgreSQL, se utiliza `CREATE DATABASE` para crear la base de datos y `\c` para conectarse a ella. La tabla utiliza el tipo `SERIAL` para el campo `id`, que automáticamente incrementa el valor.*

---

### ***Resumen de Diferencias***

- **SQLite:** *La base de datos se crea como un fichero. No se necesita un comando específico para crearla.*
- **SQL Server:** *Requiere el comando `CREATE DATABASE` y permite el uso de tipos de datos específicos como `NVARCHAR`.*
- **MySQL:** *Utiliza `CREATE DATABASE` y permite especificar un motor de almacenamiento (por ejemplo, `InnoDB`).*
- **PostgreSQL:** *Requiere `CREATE DATABASE` y se conecta a la base de datos con `\c`. Usa `SERIAL` para campos autoincrementales.*

---

## ***Ejemplo de Creación de Tablas con Cláusula de Auto-Incremento***

---

### ***1. ¿Qué es la Cláusula de Auto-Incremento?***

**Definición:**  
*La cláusula de auto-incremento es una característica de algunos sistemas de bases de datos que permite que un campo (normalmente una clave primaria) se incremente automáticamente cada vez que se inserta una nueva fila. Esto elimina la necesidad de que el usuario especifique un valor único para este campo en cada inserción, garantizando así la unicidad y facilitando la gestión de identificadores.*

---

## ***2. Ejemplo en MySQL***

```sql
-- Crear tabla en MySQL con cláusula de auto-incremento
CREATE TABLE ejemplo_mysql (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);
```

**Diferencias:**  
*En MySQL, la cláusula `AUTO_INCREMENT` se usa para definir que el campo `id` se incrementará automáticamente con cada inserción. Se especifica como parte de la definición del campo en la declaración de la tabla.*

---

## ***3. Ejemplo en SQL Server***

```sql
-- Crear tabla en SQL Server con cláusula de auto-incremento
CREATE TABLE ejemplo_sql_server (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(MAX)
);
```

**Diferencias:**  
*En SQL Server, la cláusula `IDENTITY(1,1)` se utiliza para definir que el campo `id` se incrementará automáticamente. Los dos parámetros indican el valor inicial y el incremento, respectivamente.*

---

## ***4. Ejemplo en PostgreSQL***

```sql
-- Crear tabla en PostgreSQL con cláusula de auto-incremento
CREATE TABLE ejemplo_postgresql (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);
```

**Diferencias:**  
*En PostgreSQL, se utiliza el tipo de dato `SERIAL` para definir un campo que se autoincrementa. Esto genera automáticamente una secuencia que se utiliza para asignar valores únicos al campo `id` en cada inserción.*

---

## ***5. Ejemplo en SQLite***

```sql
-- Crear tabla en SQLite con cláusula de auto-incremento
CREATE TABLE ejemplo_sqlite (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    descripcion TEXT
);
```

**Diferencias:**  
*En SQLite, se utiliza `AUTOINCREMENT` para especificar que el campo `id` se incrementará automáticamente. La combinación de `INTEGER PRIMARY KEY` y `AUTOINCREMENT` garantiza que se asignen valores únicos a `id` en cada inserción.*

---

### ***Resumen de Diferencias en la Cláusula de Auto-Incremento***

- **MySQL:** *Usa `AUTO_INCREMENT` para incrementar automáticamente el valor del campo.*
- **SQL Server:** *Utiliza `IDENTITY(1,1)` para definir un campo de auto-incremento.*
- **PostgreSQL:** *Emplea el tipo de dato `SERIAL` para campos que se autoincrementan.*
- **SQLite:** *Utiliza `AUTOINCREMENT` junto con `INTEGER PRIMARY KEY` para el mismo propósito.*

---

## ***Ejemplo de JOIN en Diferentes DBMS***

---

### ***1. ¿Qué son los JOIN?***

**Definición:**  
*Los JOIN se utilizan en SQL para combinar filas de dos o más tablas basadas en una relación entre ellas. Existen varios tipos de JOIN, siendo los más comunes: INNER JOIN, LEFT JOIN, RIGHT JOIN y FULL OUTER JOIN. Cada tipo de JOIN permite recuperar datos de diferentes maneras, dependiendo de cómo se relacionan las tablas.*

---

## ***2. INNER JOIN***

**Descripción:**  
*El INNER JOIN devuelve solo las filas que tienen coincidencias en ambas tablas.*

### ***Ejemplo en SQL Server, MySQL y PostgreSQL:***

```sql
-- INNER JOIN en SQL Server, MySQL y PostgreSQL
SELECT a.id, a.nombre, b.descripcion
FROM tabla_a AS a
INNER JOIN tabla_b AS b ON a.id = b.id_a;
```

**Diferencias:**  
*SQLite no tiene soporte explícito para INNER JOIN, pero se puede utilizar el mismo comando que en otros DBMS.*

---

## ***3. LEFT JOIN***

**Descripción:**  
*El LEFT JOIN devuelve todas las filas de la tabla de la izquierda y las filas coincidentes de la tabla de la derecha. Si no hay coincidencias, se rellenan con NULL.*

### ***Ejemplo en SQLite:***

```sql
-- LEFT JOIN en SQLite
SELECT a.id, a.nombre, b.descripcion
FROM tabla_a AS a
LEFT JOIN tabla_b AS b ON a.id = b.id_a;
```

### ***Ejemplo en SQL Server, MySQL y PostgreSQL LEFT JOIN:***

```sql
-- LEFT JOIN en SQL Server, MySQL y PostgreSQL
SELECT a.id, a.nombre, b.descripcion
FROM tabla_a AS a
LEFT JOIN tabla_b AS b ON a.id = b.id_a;
```

**Diferencias:**  
*En SQLite, no hay un INNER JOIN; simplemente se invierte la lógica en el LEFT JOIN si es necesario.*

---

## ***4. RIGHT JOIN***

**Descripción:**  
*El RIGHT JOIN devuelve todas las filas de la tabla de la derecha y las filas coincidentes de la tabla de la izquierda. Si no hay coincidencias, se rellenan con NULL.*

### ***Ejemplo en SQL Server, MySQL y PostgreSQL RIGHT JOIN:***

```sql
-- RIGHT JOIN en SQL Server, MySQL y PostgreSQL
SELECT a.id, a.nombre, b.descripcion
FROM tabla_a AS a
RIGHT JOIN tabla_b AS b ON a.id = b.id_a;
```

### ***Simulación en SQLite:***

*En SQLite, se puede simular un RIGHT JOIN usando un LEFT JOIN con las tablas invertidas:*

```sql
-- Simulación de RIGHT JOIN en SQLite
SELECT b.id, b.descripcion, a.nombre
FROM tabla_b AS b
LEFT JOIN tabla_a AS a ON b.id_a = a.id;
```

**Diferencias:**  
*SQLite no soporta RIGHT JOIN, por lo que se deben invertir las tablas en un LEFT JOIN.*

---

## ***5. FULL OUTER JOIN***

**Descripción:**  
*El FULL OUTER JOIN devuelve todas las filas cuando hay una coincidencia en una de las tablas. Si no hay coincidencia, se rellenan con NULL.*

### ***Ejemplo en SQL Server y PostgreSQL:***

```sql
-- FULL OUTER JOIN en SQL Server y PostgreSQL
SELECT a.id, a.nombre, b.descripcion
FROM tabla_a AS a
FULL OUTER JOIN tabla_b AS b ON a.id = b.id_a;
```

### ***Simulación en MySQL:***

*En MySQL, el FULL OUTER JOIN no es soportado directamente; se debe utilizar la combinación de LEFT JOIN y RIGHT JOIN usando UNION:*

```sql
-- Simulación de FULL OUTER JOIN en MySQL
SELECT a.id, a.nombre, b.descripcion
FROM tabla_a AS a
LEFT JOIN tabla_b AS b ON a.id = b.id_a
UNION
SELECT b.id, b.descripcion, a.nombre
FROM tabla_b AS b
LEFT JOIN tabla_a AS a ON b.id_a = a.id;
```

### ***Simulación Usando UNION en SQLite:***

*En SQLite, al igual que en MySQL, se debe utilizar una combinación de LEFT JOIN y RIGHT JOIN invertido usando UNION:*

```sql
-- Simulación de FULL OUTER JOIN en SQLite
SELECT a.id, a.nombre, b.descripcion
FROM tabla_a AS a
LEFT JOIN tabla_b AS b ON a.id = b.id_a
UNION
SELECT b.id, b.descripcion, a.nombre
FROM tabla_b AS b
LEFT JOIN tabla_a AS a ON b.id_a = a.id;
```

**Diferencias:**  
*Solo SQL Server y PostgreSQL tienen soporte directo para FULL OUTER JOIN. En MySQL y SQLite, se debe simular usando UNION de LEFT JOIN y RIGHT JOIN.*

---

### ***Resumen de Diferencias en JOIN***

- **INNER JOIN:** *Soportado en todos los DBMS; SQLite utiliza el mismo comando que otros.*
- **LEFT JOIN:** *Soportado en todos los DBMS; se usa de la misma manera.*
- **RIGHT JOIN:** *Soportado en SQL Server, MySQL y PostgreSQL; no está soportado en SQLite (se invierte la tabla).*
- **FULL OUTER JOIN:** *Soportado solo en SQL Server y PostgreSQL; MySQL y SQLite deben simularlo con UNION de LEFT y RIGHT JOIN.*

---

## ***Funciones de Agregación y Otros Conceptos en SQL***

---

### ***1. Funciones de Agregación***

**Definición:**  
*Las funciones de agregación son funciones que realizan un cálculo sobre un conjunto de valores y devuelven un único valor. Las funciones de agregación comunes incluyen:*

- **MAX:** *Devuelve el valor máximo de un conjunto de valores.*
- **AVG:** *Devuelve el promedio de un conjunto de valores.*
- **COUNT:** *Devuelve el número de filas que coinciden con un criterio.*
- **SUM:** *Devuelve la suma total de un conjunto de valores.*

### ***Ejemplo de Funciones de Agregación***

```sql
-- Ejemplo de funciones de agregación
SELECT 
    MAX(precio) AS PrecioMaximo,
    AVG(precio) AS PrecioPromedio,
    COUNT(*) AS TotalProductos,
    SUM(precio) AS SumaPrecios
FROM productos;
```

**Diferencias:**  
*Las funciones de agregación son iguales en todos los DBMS (SQLite, SQL Server, MySQL, PostgreSQL). Se utilizan de la misma manera y devuelven resultados consistentes en cada sistema.*

---

## ***2. GROUP BY y HAVING***

**Definición:**  
*`GROUP BY` se utiliza para agrupar filas que tienen valores idénticos en columnas especificadas en una consulta. `HAVING` se usa para filtrar registros que se devuelven después de aplicar `GROUP BY`.*

### ***Ejemplo de GROUP BY y HAVING***

```sql
-- Ejemplo de GROUP BY y HAVING
SELECT categoria, COUNT(*) AS TotalProductos
FROM productos
GROUP BY categoria
HAVING COUNT(*) > 10;
```

**Diferencias:**  
*Ambos, `GROUP BY` y `HAVING`, son iguales en todos los DBMS. La sintaxis y el funcionamiento son consistentes entre SQLite, SQL Server, MySQL y PostgreSQL.*

---

## ***3. Índices***

**Definición:**  
*Los índices son estructuras que mejoran la velocidad de recuperación de datos en una tabla. Existen índices comunes y únicos:*

- **Índice Común:** *Permite duplicados en los valores de la columna.*
- **Índice Único:** *No permite duplicados en los valores de la columna.*

### ***Ejemplo de Creación de Índices***

```sql
-- Crear un índice común
CREATE INDEX index_categoria ON productos(categoria);

-- Crear un índice único
CREATE UNIQUE INDEX index_codigo ON productos(codigo_producto);
```

**Diferencias:**  
*La creación y uso de índices son similares en todos los DBMS. La sintaxis es prácticamente la misma en SQLite, SQL Server, MySQL y PostgreSQL.*

---

## ***4. Transacciones***

**Definición:**  
*Una transacción es una unidad de trabajo que se realiza de forma completa o no se realiza en absoluto. Se utilizan las instrucciones `BEGIN`, `COMMIT` y `ROLLBACK` para gestionar transacciones.*

### ***Ejemplo de Manejo de Transacciones***

```sql
-- Ejemplo de manejo de transacciones
BEGIN;

INSERT INTO productos(nombre, precio) VALUES ('Producto A', 100);
INSERT INTO productos(nombre, precio) VALUES ('Producto B', 150);

-- Confirmar la transacción
COMMIT;
```

**Diferencias:**  
*Las transacciones funcionan de manera similar en todos los DBMS, utilizando las mismas instrucciones (`BEGIN`, `COMMIT`, `ROLLBACK`). La implementación y el comportamiento general son consistentes en SQLite, SQL Server, MySQL y PostgreSQL.*

---

### ***Resumen de Similitudes***

- **Funciones de Agregación:** *MAX, AVG, COUNT, SUM son iguales en todos los DBMS.*
- **GROUP BY y HAVING:** *Iguales en todos los DBMS, con la misma sintaxis y comportamiento.*
- **Índices:** *La creación y uso son similares en todos los DBMS, tanto para índices comunes como únicos.*
- **Transacciones:** *El manejo de transacciones es igual en todos los DBMS, con instrucciones consistentes.*

---

## ***Funciones de Fecha y Hora, y Funciones Matemáticas en SQL***

---

### ***1. Obtener la Fecha y Hora Actuales***

**Descripción:**  
*Las funciones para obtener la fecha y hora actuales pueden variar entre diferentes sistemas de gestión de bases de datos (DBMS). A continuación se describen las diferencias en cómo se obtiene la fecha y hora en SQLite, SQL Server, MySQL y PostgreSQL.*

### ***Obtener la Fecha y Hora Actuales***

- **SQLite:**

```sql
-- Obtener la fecha y hora actuales en SQLite
SELECT DATETIME('now');
```

- **SQL Server:**

```sql
-- Obtener la fecha y hora actuales en SQL Server
SELECT GETDATE();
```

- **MySQL:**

```sql
-- Obtener la fecha y hora actuales en MySQL
SELECT NOW();
```

- **PostgreSQL:**

```sql
-- Obtener la fecha y hora actuales en PostgreSQL
SELECT NOW();
```

**Diferencias:**

- *En **SQLite**, se utiliza `DATETIME('now')` ya que no hay una función `NOW()`.*
- *En **SQL Server**, se utiliza `GETDATE()`.*
- *En **MySQL** y **PostgreSQL**, se utiliza `NOW()`, que funciona de manera idéntica en ambos.*

---

## ***2. Funciones Matemáticas***

**Descripción:**  
*Las funciones matemáticas comunes, como `ROUND`, `CEIL` (o `CEILING`), y `FLOOR`, son utilizadas para manipular valores numéricos y son bastante similares en su funcionamiento entre diferentes DBMS.*

### ***Funciones Matemáticas Comunes***

- **ROUND:**
  - *Redondea un número al entero más cercano o a un número específico de decimales.*

```sql
-- Ejemplo de ROUND
SELECT ROUND(123.456, 2); -- Redondea a 2 decimales
```

- **CEIL y CEILING:**
  - *Ambas funciones devuelven el entero más pequeño que es mayor o igual al número dado.*
  
  - **SQLite y PostgreSQL:**

  ```sql
  SELECT CEIL(123.456); -- Devuelve 124
  ```

  - **MySQL y SQL Server:**

  ```sql
  SELECT CEILING(123.456); -- Devuelve 124
  ```

- **FLOOR:**
  - *Devuelve el entero más grande que es menor o igual al número dado.*

```sql
-- Ejemplo de FLOOR
SELECT FLOOR(123.456); -- Devuelve 123
```

**Diferencias:**

- *Las funciones `ROUND`, `CEIL` y `FLOOR` funcionan de manera similar en **SQLite**, **PostgreSQL**, **MySQL** y **SQL Server**, aunque la función `CEIL` en SQLite y PostgreSQL y `CEILING` en MySQL y SQL Server son nombres diferentes pero funcionalmente equivalentes.*

---

### ***Resumen de Similitudes y Diferencias***

- **Obtener la Fecha y Hora Actuales:**
  - **SQLite:** `DATETIME('now')`
  - **SQL Server:** `GETDATE()`
  - **MySQL y PostgreSQL:** `NOW()`
  
- **Funciones Matemáticas:**
  - **ROUND:** *Igual en todos los DBMS.*
  - **CEIL y CEILING:** *`CEIL` en SQLite y PostgreSQL, `CEILING` en MySQL y SQL Server, ambas funcionan de manera similar.*
  - **FLOOR:** *Igual en todos los DBMS.*

---

## ***Límites y Desplazamientos en SQL***

---

### ***1. Uso de la Cláusula LIMIT y TOP***

**Descripción:**  
*La cláusula `LIMIT` se utiliza para especificar la cantidad máxima de filas que se devolverán en una consulta. Sin embargo, hay diferencias en la forma en que se implementa esta cláusula en diferentes DBMS.*

### ***Uso de LIMIT y TOP***

- **SQLite, MySQL y PostgreSQL:**

```sql
-- Ejemplo de LIMIT en SQLite, MySQL y PostgreSQL
SELECT * FROM productos
LIMIT 10; -- Devuelve las primeras 10 filas
```

- **SQL Server:**

```sql
-- Ejemplo de TOP en SQL Server
SELECT TOP 10 * FROM productos; -- Devuelve las primeras 10 filas
```

**Diferencias:**

- *En **SQLite**, **MySQL**, y **PostgreSQL**, se utiliza `LIMIT` para restringir el número de filas.*
- *En **SQL Server**, se utiliza `TOP`, lo que representa una diferencia clave en la sintaxis.*

---

## ***2. Uso de OFFSET***

**Descripción:**  
*La cláusula `OFFSET` se utiliza junto con `LIMIT` para especificar desde qué fila comenzar a devolver resultados. Se utiliza para paginación en las consultas.*

### ***Uso de OFFSET***

- **SQLite, MySQL y PostgreSQL:**

```sql
-- Ejemplo de OFFSET en SQLite, MySQL y PostgreSQL
SELECT * FROM productos
LIMIT 10 OFFSET 5; -- Devuelve 10 filas, comenzando desde la fila 6
```

- **SQL Server:**

```sql
-- Ejemplo de OFFSET en SQL Server
SELECT * FROM productos
ORDER BY id
OFFSET 5 ROWS FETCH NEXT 10 ROWS ONLY; -- Devuelve 10 filas comenzando desde la fila 6
```

**Diferencias:**

- *En **SQLite**, **MySQL**, y **PostgreSQL**, la cláusula `OFFSET` se utiliza directamente después de `LIMIT`.*
- *En **SQL Server**, se utiliza la combinación de `OFFSET` y `FETCH NEXT`, lo que requiere que se incluya una cláusula `ORDER BY`.*

---

## ***3. Simplificación de LIMIT con Dos Parámetros***

**Descripción:**  
*Se puede simplificar la cláusula `LIMIT` usando dos parámetros: el primer parámetro es el `OFFSET` y el segundo es el `LIMIT`.*

### ***Uso de LIMIT con Dos Parámetros***

- **SQLite, MySQL y PostgreSQL:**

```sql
-- Ejemplo de LIMIT con dos parámetros en SQLite, MySQL y PostgreSQL
SELECT * FROM productos
LIMIT 10 OFFSET 5; -- Devuelve 10 filas comenzando desde la fila 6
```

**Diferencias:**

- *En **SQL Server**, el uso de `LIMIT` no se aplica. En su lugar, se debe usar `OFFSET` junto con `FETCH NEXT`, como se mencionó anteriormente.*

---

### ***Resumen de Similitudes y Diferencias Sobre LIMIT y OFFSET***

- **LIMIT:**
  - ***SQLite, MySQL, PostgreSQL:** Se utiliza `LIMIT` para limitar el número de filas.*
  - ***SQL Server:** Se utiliza `TOP` para el mismo propósito.*

- **OFFSET:**
  - ***SQLite, MySQL, PostgreSQL:** Se utiliza `OFFSET` junto con `LIMIT`.*
  - ***SQL Server:** Se usa `OFFSET` junto con `FETCH NEXT` y requiere `ORDER BY`.*

- **Uso de LIMIT con Dos Parámetros:**
  - ***SQLite, MySQL, PostgreSQL:** Se puede simplificar usando `LIMIT` con dos parámetros (offset y limit).*
  - ***SQL Server:** Se utiliza `OFFSET` y `FETCH NEXT` sin `LIMIT`.*

---

## ***Operadores de Comparación, Comodines y Exportación de Datos en SQL***

---

## ***1. Operadores de Comparación***

**Descripción:**  
*Los operadores de comparación se utilizan para comparar valores en SQL. Aunque hay una serie de operadores estándar, cada sistema de gestión de bases de datos (DBMS) puede tener sus propios operadores específicos que no son parte del estándar SQL.*

### ***Operadores de Comparación Comunes***

- **Igual a:** `=`
- **No igual a:** `!=` o `<>`
- **Mayor que:** `>`
- **Menor que:** `<`
- **Mayor o igual que:** `>=`
- **Menor o igual que:** `<=`

### ***Ejemplos de Comparadores No Estándar***

- **SQL Server:**
  - *Usa `ISNULL()` para comprobar valores nulos.*

  ```sql
  SELECT * FROM productos WHERE ISNULL(precio, 0) > 100;
  ```

- **MySQL:**
  - *Permite el uso de `REGEXP` para expresiones regulares.*

  ```sql
  SELECT * FROM productos WHERE nombre REGEXP '^[A-Z]'; -- Nombres que comienzan con mayúscula
  ```

- **PostgreSQL:**
  - *Soporta el operador `ILIKE` para comparaciones insensibles a mayúsculas y minúsculas.*

  ```sql
  SELECT * FROM productos WHERE nombre ILIKE 'ejemplo%'; -- Insensible a mayúsculas
  ```

---

## ***2. Comodines (Wildcards)***

**Descripción:**  
*Los comodines se utilizan en las consultas SQL para representar uno o más caracteres en una cadena. Se utilizan comúnmente en combinación con la cláusula `LIKE` para realizar búsquedas.*

### ***Comodines Comunes***

- **Porcentaje (`%`):** *Representa cero o más caracteres.*
- **Guion bajo (`_`):** *Representa un solo carácter.*

### ***Ejemplos de Uso de Comodines***

```sql
-- Buscar productos cuyo nombre comienza con 'A'
SELECT * FROM productos WHERE nombre LIKE 'A%';

-- Buscar productos cuyo nombre tiene 'a' como segundo carácter
SELECT * FROM productos WHERE nombre LIKE '_a%';
```

**Diferencias en el Uso de COLLATE:**

- *El uso de `COLLATE` permite especificar la forma en que se comparan las cadenas, como la sensibilidad a mayúsculas o minúsculas. Por ejemplo:*

```sql
-- Comparar insensiblemente a mayúsculas
SELECT * FROM productos WHERE nombre COLLATE NOCASE = 'ejemplo';
```

---

## ***3. Exportación de Datos***

**Descripción:**  
*La exportación de datos a formato CSV (Comma-Separated Values) es un estándar ampliamente utilizado para transferir datos entre diferentes sistemas y aplicaciones.*

### ***Exportación a CSV***

- **SQLite:**

```sql
-- Exportar datos a CSV en SQLite
.mode csv
.headers on
.output productos.csv
SELECT * FROM productos;
.output stdout
```

- **SQL Server:**

```sql
-- Exportar datos a CSV en SQL Server usando BCP
EXEC xp_cmdshell 'bcp "SELECT * FROM productos" queryout "productos.csv" -c -t, -T';
```

- **MySQL:**

```sql
-- Exportar datos a CSV en MySQL
SELECT * FROM productos INTO OUTFILE '/path/to/productos.csv' 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';
```

- **PostgreSQL:**

```sql
-- Exportar datos a CSV en PostgreSQL
COPY (SELECT * FROM productos) TO '/path/to/productos.csv' WITH (FORMAT CSV, HEADER);
```

---

### ***Resumen de Similitudes y Diferencias Sobre el Tema Actual***

- **Operadores de Comparación:**
  - *Comunes en todos los DBMS, pero pueden tener operadores específicos no estándar.*
  
- **Comodines:**
  - *Los comodines `%` y `_` son utilizados en todas las bases de datos, pero el uso de `COLLATE` puede variar.*

- **Exportación a CSV:**
  - *La exportación a CSV es un estándar común, pero la sintaxis específica puede variar entre los diferentes DBMS.*
