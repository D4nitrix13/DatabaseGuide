<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Índices en SQL***

---

## ***¿Qué son los índices y para qué sirven?***

- *Los índices en SQL son estructuras adicionales en la base de datos que mejoran la velocidad de acceso a los datos. Su principal propósito es agilizar las consultas, especialmente las que buscan valores específicos en columnas, como los campos de `WHERE`, `ORDER BY` o `JOIN`. Funcionan a bajo nivel de forma similar a los índices en un libro: almacenan referencias organizadas a los registros para que el sistema pueda encontrar la información sin escanear toda la tabla.*

---

### ***Tipos de Índices en SQL***

- **Existen varios tipos de índices en SQL, entre ellos:**

- **Índices ordinarios (o normales):** *Para acelerar consultas en una o varias columnas.*
- **Índices únicos:** *Impiden que se repitan valores en una columna o combinación de columnas.*
- **Índices compuestos:** *Abarcan más de una columna, útil para consultas con múltiples condiciones.*
- **Índices de texto completo:** *Utilizados para búsquedas en columnas de texto en bases de datos específicas.*

---

### ***Ejemplo de una tabla sin índice***

- **Supongamos la tabla `Products` sin ningún índice:**

```sql
CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT,
    Price REAL
);
```

```sql
sqlite> CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT,
    Price REAL
);
```

**Al realizar una consulta sobre esta tabla, como:**

```sql
SELECT * FROM Products WHERE ProductName = 'Chais';
```

```sql
sqlite> SELECT * FROM Products WHERE ProductName = 'Chais';
```

- *Si `Products` contiene muchos registros, la consulta tardará más, ya que se tiene que revisar cada registro. Esto puede tardar varios segundos en tablas grandes.*

---

### ***Crear un Índice***

- *El comando `CREATE INDEX` nos permite crear un índice. A continuación, se detalla cada parte del comando:*

- **`CREATE`:** *Inicia la declaración de creación.*
- **`INDEX`:** *Especifica que se creará un índice.*
- **`Name`:** *Es el nombre del índice que se está creando.*
- **`ON`:** *Indica en qué tabla se aplicará el índice.*
- **`Products`:** *Es el nombre de la tabla.*
- **Paréntesis `()`:** *Indican las columnas donde se aplicará el índice.*
- **`ProductName`:** *Es la columna en la que el índice será creado.*

- **Ejemplo de creación:**

```sql
CREATE INDEX Name ON Products (ProductName);
```

```sql
sqlite> CREATE INDEX Name ON Products (ProductName);
```

- *Después de crear el índice, la consulta `SELECT` anterior será mucho más rápida, ya que el índice permite saltar directamente a los registros relevantes sin hacer un escaneo completo de la tabla.*

---

### ***Ejemplo de Índice Único***

- *Un índice único evita la duplicación de valores en una columna o combinación de columnas. Esto es útil para campos donde los valores deben ser únicos, como correos electrónicos o combinaciones de nombre y apellido.*

- *Supongamos que tenemos la tabla `Employees` y queremos que la combinación de `FirstName` y `LastName` sea única para evitar duplicados exactos:*

```sql
SELECT * FROM "Employees";
```

```sql
sqlite> SELECT * FROM "Employees";
1|Davolio|Nancy|1968-12-08|EmpID1.pic|Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of 'Toastmasters International'.
2|Fuller|Andrew|1952-02-19|EmpID2.pic|Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.
3|Leverling|Janet|1963-08-30|EmpID3.pic|Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.
4|Peacock|Margaret|1958-09-19|EmpID4.pic|Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.
5|Buchanan|Steven|1955-03-04|EmpID5.pic|Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses 'Successful Telemarketing' and 'International Sales Management'. He is fluent in French.
6|Suyama|Michael|1963-07-02|EmpID6.pic|Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses 'Multi-Cultural Selling' and 'Time Management for the Sales Professional'. He is fluent in Japanese and can read and write French, Portuguese, and Spanish.
7|King|Robert|1960-05-29|EmpID7.pic|Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled 'Selling in Europe', he was transferred to the London office.
8|Callahan|Laura|1958-01-09|EmpID8.pic|Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.
9|Dodsworth|Anne|1969-07-02|EmpID9.pic|Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.
10|West|Adam|1928-09-19|EmpID10.pic|An old chum.
```

```sql
CREATE UNIQUE INDEX FullName ON Employees (FirstName, LastName);
```

```sql
sqlite> CREATE UNIQUE INDEX FullName ON Employees (FirstName, LastName);
```

- *Con este índice, si intentamos insertar un registro duplicado, como `FirstName='Nancy'` y `LastName='Davolio'`, obtendremos un error:*

```sql
INSERT INTO "Employees" ("LastName", "FirstName", "BirthDate", "Photo", "Notes")
VALUES ('Davolio', 'Nancy', '1975-05-15', 'EmpID10.pic', 'Graduated with a degree in business administration from New York University. Nancy has extensive experience in customer service and sales, including her previous role as a senior sales representative at a large retail company.');
```

```sql
sqlite> INSERT INTO "Employees" ("LastName", "FirstName", "BirthDate", "Photo", "Notes")
VALUES ('Davolio', 'Nancy', '1975-05-15', 'EmpID10.pic', 'Graduated with a degree in business administration from New York University. Nancy has extensive experience in customer service and sales, including her previous role as a senior sales representative at a large retail company.');
Error: stepping, UNIQUE constraint failed: Employees.FirstName, Employees.LastName (19)
```

- **Sin embargo, este registro sí se puede insertar porque `FirstName` y `LastName` son únicos:**

```sql
INSERT INTO "Employees" ("LastName", "FirstName", "BirthDate", "Photo", "Notes")
VALUES ('Davolio', 'Danna', '1975-05-15', 'EmpID10.pic', 'Graduated with a degree in business administration from New York University. Nancy has extensive experience in customer service and sales, including her previous role as a senior sales representative at a large retail company.');
```

```sql
sqlite> INSERT INTO "Employees" ("LastName", "FirstName", "BirthDate", "Photo", "Notes")
VALUES ('Davolio', 'Danna', '1975-05-15', 'EmpID10.pic', 'Graduated with a degree in business administration from New York University. Nancy has extensive experience in customer service and sales, including her previous role as a senior sales representative at a large retail company.');
```

---

### ***Visualizar la Información de la Tabla***

- **Para ver los detalles de la tabla `Employees`:**

```sql
PRAGMA table_info(Employees);
```

```sql
sqlite> PRAGMA table_info(Employees);
0|EmployeeID|INTEGER|0||1
1|LastName|TEXT|0||0
2|FirstName|TEXT|0||0
3|BirthDate|DATE|0||0
4|Photo|TEXT|0||0
5|Notes|TEXT|0||0
```

**Ejemplo de la estructura de la tabla `Employees`:**

| *ID* | *Nombre*     | *Tipo*    | *Requerido* | *Default* | *Clave primaria* |
| ---- | ------------ | --------- | ----------- | --------- | ---------------- |
| *0*  | *EmployeeID* | *INTEGER* | *No*        |           | *Sí*             |
| *1*  | *LastName*   | *TEXT*    | *No*        |           | *No*             |
| *2*  | *FirstName*  | *TEXT*    | *No*        |           | *No*             |
| *3*  | *BirthDate*  | *DATE*    | *No*        |           | *No*             |
| *4*  | *Photo*      | *TEXT*    | *No*        |           | *No*             |
| *5*  | *Notes*      | *TEXT*    | *No*        |           | *No*             |

---

### ***Índices Compuestos***

- *Un índice compuesto permite mejorar consultas que involucran múltiples columnas. Por ejemplo, si se quiere asegurar que `FirstName` y `LastName` en `Employees` son únicos:*

```sql
CREATE UNIQUE INDEX FullName ON Employees (FirstName, LastName);
```

```sql
sqlite> CREATE UNIQUE INDEX FullName ON Employees (FirstName, LastName);
```

- *Este tipo de índice garantiza que no habrá dos empleados con el mismo nombre completo. Es útil para campos de combinación como correos electrónicos (`email`), donde cada registro debe ser único.*

```sql
SELECT * FROM "Employees";
```

```sql
sqlite> SELECT * FROM "Employees";
1|Davolio|Nancy|1968-12-08|EmpID1.pic|Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of 'Toastmasters International'.
2|Fuller|Andrew|1952-02-19|EmpID2.pic|Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.
3|Leverling|Janet|1963-08-30|EmpID3.pic|Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.
4|Peacock|Margaret|1958-09-19|EmpID4.pic|Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.
5|Buchanan|Steven|1955-03-04|EmpID5.pic|Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses 'Successful Telemarketing' and 'International Sales Management'. He is fluent in French.
6|Suyama|Michael|1963-07-02|EmpID6.pic|Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses 'Multi-Cultural Selling' and 'Time Management for the Sales Professional'. He is fluent in Japanese and can read and write French, Portuguese, and Spanish.
7|King|Robert|1960-05-29|EmpID7.pic|Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled 'Selling in Europe', he was transferred to the London office.
8|Callahan|Laura|1958-01-09|EmpID8.pic|Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.
9|Dodsworth|Anne|1969-07-02|EmpID9.pic|Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.
10|West|Adam|1928-09-19|EmpID10.pic|An old chum.
11|Davolio|Danna|1975-05-15|EmpID10.pic|Graduated with a degree in business administration from New York University. Nancy has extensive experience in customer service and sales, including her previous role as a senior sales representative at a large retail company.
```

---

## ***Ventajas y Desventajas de los Índices***

- **Los índices son estructuras que mejoran la velocidad de las operaciones de búsqueda y consulta en una base de datos, pero también tienen sus desventajas.**

### ***Ventajas***

- **Aceleración de las Consultas:** *Los índices permiten que las consultas se realicen más rápidamente al proporcionar un acceso directo a los datos.*
- **Mejor Rendimiento de Lectura:** *Facilitan la recuperación de datos, lo que es especialmente útil en tablas grandes.*

### ***Desventajas***

- **Uso de Espacio en Disco:** *Los índices ocupan espacio adicional en el disco, lo que puede ser un problema en bases de datos grandes.*
- **Aumento del Tiempo de Escritura:** *Cada vez que se inserta, actualiza o elimina un registro, los índices deben ser actualizados también. Esto puede incrementar el tiempo de operación para estas acciones.*
- **Mantenimiento de Índices:** *Es necesario revisar y, en algunos casos, reorganizar los índices para mantener su eficiencia.*

---

## ***Casos de Uso***

---

### ***Claves Primarias y Foráneas***

- **Claves Primarias (Primary Key):** *Se utilizan para identificar de manera única cada registro en una tabla. La creación de un índice en una clave primaria asegura que las búsquedas y las operaciones de unión sean rápidas.*
  
- **Claves Foráneas (Foreign Key):** *Establecen relaciones entre tablas y, al igual que las claves primarias, pueden beneficiarse de índices para optimizar las consultas que implican uniones entre tablas relacionadas.*

---

## ***Ejemplo de Consulta***

```sql
SELECT *
FROM "OrderDetails" od
INNER JOIN "Orders" o
ON o."OrderID" = od."OrderID"
WHERE o."OrderDate" > '1996-07-04' 
AND od."Quantity" > 10
LIMIT 100;
```

```sql
sqlite> SELECT *
FROM "OrderDetails" od
INNER JOIN "Orders" o
ON o."OrderID" = od."OrderID"
WHERE o."OrderDate" > '1996-07-04'
AND od."Quantity" > 10
LIMIT 100;
5|10249|51|40|10249|81|6|1996-07-05|1
7|10250|51|35|10250|34|4|1996-07-08|2
8|10250|65|15|10250|34|4|1996-07-08|2
10|10251|57|15|10251|84|3|1996-07-08|1
11|10251|65|20|10251|84|3|1996-07-08|1
12|10252|20|40|10252|76|4|1996-07-09|2
13|10252|33|25|10252|76|4|1996-07-09|2
14|10252|60|40|10252|76|4|1996-07-09|2
15|10253|31|20|10253|34|3|1996-07-10|2
16|10253|39|42|10253|34|3|1996-07-10|2
17|10253|49|40|10253|34|3|1996-07-10|2
18|10254|24|15|10254|14|5|1996-07-11|2
19|10254|55|21|10254|14|5|1996-07-11|2
20|10254|74|21|10254|14|5|1996-07-11|2
21|10255|2|20|10255|68|9|1996-07-12|3
22|10255|16|35|10255|68|9|1996-07-12|3
23|10255|36|25|10255|68|9|1996-07-12|3
24|10255|59|30|10255|68|9|1996-07-12|3
25|10256|53|15|10256|88|3|1996-07-15|2
26|10256|77|12|10256|88|3|1996-07-15|2
27|10257|27|25|10257|35|4|1996-07-16|3
29|10257|77|15|10257|35|4|1996-07-16|3
30|10258|2|50|10258|20|1|1996-07-17|1
31|10258|5|65|10258|20|1|1996-07-17|1
35|10260|41|16|10260|55|4|1996-07-19|1
36|10260|57|50|10260|55|4|1996-07-19|1
37|10260|62|15|10260|55|4|1996-07-19|1
38|10260|70|21|10260|55|4|1996-07-19|1
39|10261|21|20|10261|61|4|1996-07-19|2
40|10261|35|20|10261|61|4|1996-07-19|2
41|10262|5|12|10262|65|8|1996-07-22|3
42|10262|7|15|10262|65|8|1996-07-22|3
44|10263|16|60|10263|20|9|1996-07-23|3
45|10263|24|28|10263|20|9|1996-07-23|3
46|10263|30|60|10263|20|9|1996-07-23|3
47|10263|74|36|10263|20|9|1996-07-23|3
48|10264|2|35|10264|24|6|1996-07-24|3
49|10264|41|25|10264|24|6|1996-07-24|3
50|10265|17|30|10265|7|2|1996-07-25|1
51|10265|70|20|10265|7|2|1996-07-25|1
52|10266|12|12|10266|87|3|1996-07-26|3
53|10267|40|50|10267|25|4|1996-07-29|1
54|10267|59|70|10267|25|4|1996-07-29|1
55|10267|76|15|10267|25|4|1996-07-29|1
58|10269|33|60|10269|89|5|1996-07-31|1
59|10269|72|20|10269|89|5|1996-07-31|1
60|10270|36|30|10270|87|1|1996-08-01|1
61|10270|43|25|10270|87|1|1996-08-01|1
62|10271|33|24|10271|75|6|1996-08-01|2
64|10272|31|40|10272|65|6|1996-08-02|2
65|10272|72|24|10272|65|6|1996-08-02|2
66|10273|10|24|10273|63|3|1996-08-05|3
67|10273|31|15|10273|63|3|1996-08-05|3
68|10273|33|20|10273|63|3|1996-08-05|3
69|10273|40|60|10273|63|3|1996-08-05|3
70|10273|76|33|10273|63|3|1996-08-05|3
71|10274|71|20|10274|85|6|1996-08-06|1
73|10275|24|12|10275|49|1|1996-08-07|1
75|10276|10|15|10276|80|8|1996-08-08|3
77|10277|28|20|10277|52|2|1996-08-09|3
78|10277|62|12|10277|52|2|1996-08-09|3
79|10278|44|16|10278|5|8|1996-08-12|2
80|10278|59|15|10278|5|8|1996-08-12|2
82|10278|73|25|10278|5|8|1996-08-12|2
83|10279|17|15|10279|44|8|1996-08-13|2
84|10280|24|12|10280|5|2|1996-08-14|1
85|10280|55|20|10280|5|2|1996-08-14|1
86|10280|75|30|10280|5|2|1996-08-14|1
92|10283|15|20|10283|46|3|1996-08-16|3
93|10283|19|18|10283|46|3|1996-08-16|3
94|10283|60|35|10283|46|3|1996-08-16|3
96|10284|27|15|10284|44|4|1996-08-19|1
97|10284|44|21|10284|44|4|1996-08-19|1
98|10284|60|20|10284|44|4|1996-08-19|1
100|10285|1|45|10285|63|1|1996-08-20|2
101|10285|40|40|10285|63|1|1996-08-20|2
102|10285|53|36|10285|63|1|1996-08-20|2
103|10286|35|100|10286|63|8|1996-08-21|3
104|10286|62|40|10286|63|8|1996-08-21|3
105|10287|16|40|10287|67|8|1996-08-22|3
106|10287|34|20|10287|67|8|1996-08-22|3
107|10287|46|15|10287|67|8|1996-08-22|3
110|10289|3|30|10289|11|7|1996-08-26|3
112|10290|5|20|10290|15|8|1996-08-27|1
113|10290|29|15|10290|15|8|1996-08-27|1
114|10290|49|15|10290|15|8|1996-08-27|1
116|10291|13|20|10291|61|6|1996-08-27|2
117|10291|44|24|10291|61|6|1996-08-27|2
119|10292|20|20|10292|81|1|1996-08-28|2
120|10293|18|12|10293|80|1|1996-08-29|3
124|10294|1|18|10294|65|4|1996-08-30|2
125|10294|17|15|10294|65|4|1996-08-30|2
126|10294|43|15|10294|65|4|1996-08-30|2
127|10294|60|21|10294|65|4|1996-08-30|2
130|10296|11|12|10296|46|6|1996-09-03|1
131|10296|16|30|10296|46|6|1996-09-03|1
132|10296|69|15|10296|46|6|1996-09-03|1
133|10297|39|60|10297|7|5|1996-09-04|2
134|10297|72|20|10297|7|5|1996-09-04|2
135|10298|2|40|10298|37|6|1996-09-05|2
```

- **Este ejemplo muestra cómo se pueden unir las tablas `OrderDetails` y `Orders` para obtener registros que cumplan ciertas condiciones. La adición de índices puede mejorar significativamente el rendimiento de esta consulta.**

---

## ***Nomenclatura para Crear Índices***

- **La nomenclatura para crear índices en bases de datos puede variar según las convenciones de la organización o equipo, pero existen algunas prácticas comunes que ayudan a identificar rápidamente los índices y entender su propósito. A continuación, se presentaran algunas convenciones ampliamente usadas:**

---

### ***1. Prefijo por Tipo de Índice***

- *Se puede usar un prefijo para indicar el tipo de índice:*
  - *`IX_` para índices en general.*
  - *`PK_` para claves primarias (Primary Key).*
  - *`FK_` para claves foráneas (Foreign Key).*
  - *`UQ_` para índices de unicidad (Unique).*

---

### ***2. Nombre de la Tabla***

- **El nombre de la tabla se incluye para identificar rápidamente a qué tabla pertenece el índice.**

---

### ***3. Columnas Indexadas***

- **Las columnas que forman el índice se agregan en el nombre, separadas por un guion bajo `_` o concatenadas.**

---

### ***Ejemplos de Nomenclatura Común***

- **1. Índice Simple**

- **`IX_Employees_LastName`:** *Índice sobre la columna `LastName` en la tabla `Employees`.*
- **`IX_Orders_OrderDate`:** *Índice sobre `OrderDate` en la tabla `Orders`.*

- **2. Índice Compuesto**

- **`IX_Orders_CustomerID_OrderDate`:** *Índice sobre las columnas `CustomerID` y `OrderDate` en la tabla `Orders`.*
- **`IX_Employees_DepartmentID_LastName`:** *Índice sobre las columnas `DepartmentID` y `LastName` en `Employees`.*

- **3. Claves Primarias y Foráneas**

- **`PK_Employees`:** *Clave primaria en la tabla `Employees`.*
- **`FK_Orders_CustomerID`:** *Clave foránea en la tabla `Orders` que referencia `CustomerID`.*

---

### ***Ejemplo de Creación Usando Convenciones de Nombres***

```sql
-- Índice sobre la columna FirstName en la tabla Employees
CREATE INDEX IX_Employees_FirstName ON Employees (FirstName);

-- Índice compuesto sobre CustomerID y OrderDate en la tabla Orders
CREATE INDEX IX_Orders_CustomerID_OrderDate ON Orders (CustomerID, OrderDate);
```

```sql
sqlite> -- Índice sobre la columna FirstName en la tabla Employees
CREATE INDEX IX_Employees_FirstName ON Employees (FirstName);

-- Índice compuesto sobre CustomerID y OrderDate en la tabla Orders
CREATE INDEX IX_Orders_CustomerID_OrderDate ON Orders (CustomerID, OrderDate);
```

- **Estas convenciones facilitan la administración de índices, ya que ayudan a identificar el propósito del índice y las columnas asociadas.**

- *La nomenclatura comúnmente utilizada al crear índices incluye un prefijo que indica el tipo de índice, seguido del nombre de la tabla y la columna o columnas que se están indexando. Por ejemplo:*

```sql
CREATE INDEX index_OrderDetails_Quantity ON OrderDetails(Quantity);
CREATE INDEX index_Orders_OrderDate ON Orders(OrderDate);
```

```sql
sqlite> CREATE INDEX index_OrderDetails_Quantity ON OrderDetails(Quantity);
CREATE INDEX index_Orders_OrderDate ON Orders(OrderDate);
```

### ***Notas sobre el Rendimiento***

- *La creación de índices no siempre mejora el rendimiento de lectura de manera significativa. En algunas situaciones, puede que no haya una mejora notable, y es raro que el rendimiento aumente más del 20-30%.*
- *Para consultas complejas, los índices pueden acelerar el tiempo de respuesta, pero es importante realizar pruebas y análisis para determinar su eficacia.*

## ***Borrar Índices***

**Si se determina que un índice ya no es necesario o que está afectando negativamente el rendimiento, se puede eliminar utilizando:**

```sql
DROP INDEX index_OrderDetails_Quantity;
DROP INDEX index_Orders_OrderDate;
```

```sql
sqlite> DROP INDEX index_OrderDetails_Quantity;
DROP INDEX index_Orders_OrderDate;
```

---

### ***1. Listar índices de toda la base de datos***

- **En SQLite, puedes listar los índices de una tabla o de toda la base de datos utilizando consultas SQL específicas o los comandos `.schema` en el entorno de línea de comandos de SQLite. Aquí te detallo las opciones:**
- **Para ver todos los índices en la base de datos, utiliza el siguiente comando SQL:**

```sql
SELECT name FROM sqlite_master;
```

```sql
sqlite> SELECT name FROM sqlite_master;
Categories
sqlite_sequence
Customers
Employees
Shippers
Suppliers
Products
Orders
OrderDetails
DetalleDeOrden
Orden
Colores
Tamaños
Rewards
StudentsA
StudentsB
Alumnos Primaria
Alumnos Secundaria
Name
FullName
```

```sql
SELECT name FROM sqlite_master WHERE type = 'index';
```

```sql
sqlite> SELECT name FROM sqlite_master WHERE type = 'index';
```

- *Este comando consulta la tabla `sqlite_master`, que es una tabla interna de SQLite que almacena información sobre la estructura de la base de datos.*

- **`name`:** *Muestra el nombre del índice.*
- **`type = 'index'`:** *Filtra solo los elementos de tipo índice.*

### ***2. Listar los índices de una tabla específica***

- **Para listar los índices asociados a una tabla específica (por ejemplo, `MiTabla`), puedes hacer lo siguiente:**

```sql
SELECT name FROM sqlite_master WHERE type = 'index' AND tbl_name = 'MiTabla';
```

```sql
sqlite> SELECT name FROM sqlite_master WHERE type = 'index' AND tbl_name = 'Employees' LIMIT 100
```

```sql
sqlite> SELECT name FROM sqlite_master WHERE type = 'index' AND tbl_name = 'MiTabla';
```

- *Este comando mostrará todos los índices creados sobre `MiTabla`.*

---

### ***3. Usar el comando `.schema` en la línea de comandos de SQLite***

- **Si estás utilizando la línea de comandos de SQLite, el siguiente comando puede ayudarte a listar todos los índices, ya que muestra la estructura de la base de datos completa:**

```sql
.schema
```

```sql
sqlite> .schema
CREATE TABLE Categories
(
    CategoryID INTEGER PRIMARY KEY AUTOINCREMENT,
    CategoryName TEXT,
    Description TEXT
);
CREATE TABLE sqlite_sequence(name,seq);
CREATE TABLE Customers
(
    CustomerID INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerName TEXT,
    ContactName TEXT,
    Address TEXT,
    City TEXT,
    PostalCode TEXT,
    Country TEXT
);
CREATE TABLE Employees
(
    EmployeeID INTEGER PRIMARY KEY AUTOINCREMENT,
    LastName TEXT,
    FirstName TEXT,
    BirthDate DATE,
    Photo TEXT,
    Notes TEXT
);
CREATE TABLE Shippers(
    ShipperID INTEGER PRIMARY KEY AUTOINCREMENT,
    ShipperName TEXT,
    Phone TEXT
);
CREATE TABLE Suppliers(
    SupplierID INTEGER PRIMARY KEY AUTOINCREMENT,
    SupplierName TEXT,
    ContactName TEXT,
    Address TEXT,
    City TEXT,
    PostalCode TEXT,
    Country TEXT,
    Phone TEXT
);
CREATE TABLE Products(
    ProductID INTEGER PRIMARY KEY AUTOINCREMENT,
    ProductName TEXT,
    SupplierID INTEGER,
    CategoryID INTEGER,
    Unit TEXT,
    Price NUMERIC DEFAULT 0,
 FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID),
 FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID)
);
CREATE TABLE Orders(
    OrderID INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerID INTEGER,
    EmployeeID INTEGER,
    OrderDate DATETIME,
    ShipperID INTEGER,
    FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers (ShipperID)
);
CREATE TABLE OrderDetails(
    OrderDetailID INTEGER PRIMARY KEY AUTOINCREMENT,
    OrderID INTEGER,
    ProductID INTEGER,
    Quantity INTEGER,
 FOREIGN KEY (OrderID) REFERENCES Orders (OrderID),
 FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
);
CREATE TABLE DetalleDeOrden (
    DetalleDeOrdenID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Cantidad INT NOT NULL,
    OrdenId INT NOT NULL
);
CREATE TABLE Orden (
    OrdenId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    DetalleDeOrdenId INT NOT NULL,
    FOREIGN KEY (DetalleDeOrdenId) REFERENCES DetalleDeOrden(DetalleDeOrdenID)
);
CREATE TABLE Colores (
    NameColor VARCHAR(50) NOT NULL
);
CREATE TABLE Tamaños (
    Valor VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS "Rewards" (
        "RewardsID" INTEGER NOT NULL,
        "EmployeeID" INTEGER,
        "Reward" TEXT,
        "Month" TEXT,
        PRIMARY KEY("RewardsID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "StudentsA" (
    "StudentID" INTEGER PRIMARY KEY AUTOINCREMENT,
    "StudentName" TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS "StudentsB" (
    "StudentID" INTEGER PRIMARY KEY AUTOINCREMENT,
    "StudentName" TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS "Alumnos Primaria" (
    "AlumnoID" INTEGER NOT NULL,
    "Nombre" TEXT NOT NULL,
    "Nota" DOUBLE NOT NULL,
    PRIMARY KEY("AlumnoID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Alumnos Secundaria" (
    "AlumnoID" INTEGER NOT NULL,
    "Nombre" TEXT NOT NULL,
    "Nota" DOUBLE NOT NULL,
    PRIMARY KEY("AlumnoID" AUTOINCREMENT)
);
CREATE INDEX Name ON Products (ProductName)

;
CREATE UNIQUE INDEX FullName ON Employees (FirstName, LastName)

;
```

- *Esto mostrará todos los objetos de la base de datos, incluyendo índices. Para centrarte solo en los índices, puedes filtrar los resultados usando `.schema` combinado con `grep` en sistemas Unix/Linux:*

```bash
sqlite3 MiBaseDeDatos.db ".schema" | grep "CREATE INDEX"
```

*Este comando mostrará solo los comandos de creación de índices (`CREATE INDEX`), permitiéndote ver los índices existentes y los detalles de sus definiciones.*
