<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Columnas y Alias en Bases de Datos***

---

## ***Columnas en Bases de Datos***

- *Cuando trabajas con bases de datos y necesitas almacenar imágenes, lo habitual no es guardar directamente la imagen en la base de datos. En su lugar, se sube la imagen a un servidor de almacenamiento y, en la base de datos, se almacena la **URL absoluta** de la imagen en un campo específico (por ejemplo, `photo`).*

- *Esto optimiza el rendimiento de la base de datos y facilita la gestión de ficheros multimedia. La URL almacena la ubicación de la imagen en el servidor, permitiendo acceder a ella desde cualquier lugar.*

---

### ***Uso de Alias en Consultas SQL***

- *Un **alias** en SQL es un nombre alternativo dado a una columna o tabla para hacer más legible y comprensible una consulta. Los alias no cambian los nombres reales de las tablas o columnas en la base de datos, pero son útiles para crear nombres más cortos o más descriptivos en los resultados de las consultas.*

- **Sintaxis del Alias para Columnas:**

```sql
SELECT Columna AS Alias FROM Tabla;
```

#### ***Ejemplo:***

- *Si deseas listar los nombres y apellidos de los empleados con un alias más descriptivo, puedes usar una consulta como esta:*

```sql
SELECT FirstName AS 'Nombre', LastName AS 'Apellido' FROM Employees;
```

---

### ***Listar Todos los Campos de la Tabla `Employees`***

- *Para ver todos los campos y registros de la tabla `Employees`, simplemente puedes utilizar la siguiente consulta:*

```sql
SELECT * FROM Employees;
```

```sql
sqlite> SELECT * FROM Employees;
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

- *Esta consulta muestra todos los campos (columnas) de la tabla y todos los registros (filas) existentes.*

---

### ***Beneficios de Usar Alias***

1. **Claridad:** *Ayuda a hacer las consultas más claras y fáciles de leer.*
2. **Simplicidad:** *Permite usar nombres más cortos o descriptivos en consultas complejas.*
3. **Compatibilidad:** *Facilita la combinación de datos cuando se utilizan consultas con múltiples tablas o subconsultas.*

---

#### ***Uso de la Cláusula `AS` en SQL***

- *La cláusula **`AS`** en SQL se utiliza para crear **alias** para columnas o tablas en una consulta. Un alias es un nombre temporal que se le asigna a una columna o a una tabla para hacer los resultados de las consultas más claros y legibles. La cláusula `AS` no cambia los nombres originales en la base de datos; solo afecta cómo se muestran los resultados de la consulta.*

### ***Sintaxis General del Alias con `AS`:***

```sql
SELECT Columna AS Alias FROM Tabla;
```

---

### ***Ejemplo 1: Alias para una Columna***

- *Supongamos que queremos listar solo los apellidos de los empleados en la tabla `Employees`. Puedes usar la siguiente consulta para cambiar el nombre de la columna `LastName` a `Apellido` usando la cláusula `AS`:*

```sql
SELECT LastName AS Apellido FROM Employees;
```

```sql
sqlite> SELECT LastName AS Apellido FROM Employees;
Davolio
Fuller
Leverling
Peacock
Buchanan
Suyama
King
Callahan
Dodsworth
West
```

- *En este caso, el resultado de la consulta mostrará una nueva columna llamada "Apellido", aunque el nombre original de la columna en la base de datos sea `LastName`.*

---

### ***Ejemplo 2: Alias para Múltiples Columnas***

- **Puedes también asignar alias a múltiples columnas en una consulta. Por ejemplo, para listar tanto el nombre como el apellido de los empleados con nombres más comprensibles en español:**

```sql
SELECT LastName AS Apellido, FirstName AS Nombre FROM Employees;
```

```sql
sqlite> SELECT LastName AS Apellido, FirstName AS Nombre FROM Employees;
Davolio|Nancy
Fuller|Andrew
Leverling|Janet
Peacock|Margaret
Buchanan|Steven
Suyama|Michael
King|Robert
Callahan|Laura
Dodsworth|Anne
West|Adam
```

- *El resultado será una tabla que muestre los apellidos bajo la columna "Apellido" y los nombres bajo la columna "Nombre".*

---

### ***Ejemplo 3: Cambiar el Orden de las Columnas***

- *Es posible cambiar el orden en que se muestran las columnas en los resultados de la consulta sin afectar el orden en la base de datos. Por ejemplo, para mostrar primero el nombre y luego el apellido:*

```sql
SELECT FirstName AS Nombre, LastName AS Apellido FROM Employees;
```

```sql
sqlite> SELECT FirstName AS Nombre, LastName AS Apellido FROM Employees;
Nancy|Davolio
Andrew|Fuller
Janet|Leverling
Margaret|Peacock
Steven|Buchanan
Michael|Suyama
Robert|King
Laura|Callahan
Anne|Dodsworth
Adam|West
```

---

### ***¿Para Qué Sirve la Cláusula `AS`?***

1. **Mejora la Claridad:** *Ayuda a crear nombres de columnas más claros o personalizados, facilitando la lectura de los resultados de la consulta.*
2. **Personalización de Consultas:** *Permite organizar las columnas en el orden que desees en los resultados sin afectar la estructura de la base de datos.*
3. **Facilita la Lectura:** *Cuando se usan columnas con nombres largos o poco intuitivos, el uso de alias hace que los resultados sean más comprensibles para los usuarios.*
4. **Preparación para Exportación:** *Si planeas exportar datos, puedes renombrar columnas temporalmente para que sean más legibles o adecuadas al contexto.*

---

- **Resumen:** *La cláusula **`AS`** es una herramienta poderosa para personalizar los resultados de una consulta, haciéndolos más legibles y comprensibles sin modificar la estructura interna de la base de datos. Esto es especialmente útil en reportes o en la presentación de datos a usuarios finales.*

---

Aquí tienes una versión mejorada de la información sobre consultas `SELECT` en SQL, con ejemplos de alias, operaciones y funciones agregadas:

---

### ***Consultas `SELECT` en SQL con Alias y Funciones***

- *En SQL, la instrucción `SELECT` se utiliza para recuperar datos de una o más tablas. Puedes seleccionar todos los campos o columnas específicas, realizar operaciones matemáticas en los datos y utilizar funciones agregadas como `SUM`. A continuación, se presentan varios ejemplos que ilustran estas funcionalidades.*

---

### ***Ejemplo 1: Seleccionar Todos los Campos***

- *Si quieres seleccionar y ver todos los campos de la tabla `Products`, utilizas el siguiente comando:*

```sql
SELECT * FROM Products;
```

```sql
sqlite> SELECT * FROM Products;
1|Chais|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
9|Mishi Kobe Niku|4|6|18 - 500 g pkgs.|97
10|Ikura|4|8|12 - 200 ml jars|31
11|Queso Cabrales|5|4|1 kg pkg.|21
12|Queso Manchego La Pastora|5|4|10 - 500 g pkgs.|38
13|Konbu|6|8|2 kg box|6
14|Tofu|6|7|40 - 100 g pkgs.|23.25
15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
16|Pavlova|7|3|32 - 500 g boxes|17.45
17|Alice Mutton|7|6|20 - 1 kg tins|39
18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
20|Sir Rodney's Marmalade|8|3|30 gift boxes|81
21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
22|Gustaf's Knäckebröd|9|5|24 - 500 g pkgs.|21
23|Tunnbröd|9|5|12 - 250 g pkgs.|9
24|Guaraná Fantástica|10|1|12 - 355 ml cans|4.5
25|NuNuCa Nuß-Nougat-Creme|11|3|20 - 450 g glasses|14
26|Gumbär Gummibärchen|11|3|100 - 250 g bags|31.23
27|Schoggi Schokolade|11|3|100 - 100 g pieces|43.9
28|Rössle Sauerkraut|12|7|25 - 825 g cans|45.6
29|Thüringer Rostbratwurst|12|6|50 bags x 30 sausgs.|123.79
30|Nord-Ost Matjeshering|13|8|10 - 200 g glasses|25.89
31|Gorgonzola Telino|14|4|12 - 100 g pkgs|12.5
32|Mascarpone Fabioli|14|4|24 - 200 g pkgs.|32
33|Geitost|15|4|500 g|2.5
34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
35|Steeleye Stout|16|1|24 - 12 oz bottles|18
36|Inlagd Sill|17|8|24 - 250 g jars|19
37|Gravad lax|17|8|12 - 500 g pkgs.|26
38|Côte de Blaye|18|1|12 - 75 cl bottles|263.5
39|Chartreuse verte|18|1|750 cc per bottle|18
40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
41|Jack's New England Clam Chowder|19|8|12 - 12 oz cans|9.65
42|Singaporean Hokkien Fried Mee|20|5|32 - 1 kg pkgs.|14
43|Ipoh Coffee|20|1|16 - 500 g tins|46
44|Gula Malacca|20|2|20 - 2 kg bags|19.45
45|Røgede sild|21|8|1k pkg.|9.5
46|Spegesild|21|8|4 - 450 g glasses|12
47|Zaanse koeken|22|3|10 - 4 oz boxes|9.5
48|Chocolade|22|3|10 pkgs.|12.75
49|Maxilaku|23|3|24 - 50 g pkgs.|20
50|Valkoinen suklaa|23|3|12 - 100 g bars|16.25
51|Manjimup Dried Apples|24|7|50 - 300 g pkgs.|53
52|Filo Mix|24|5|16 - 2 kg boxes|7
53|Perth Pasties|24|6|48 pieces|32.8
54|Tourtière|25|6|16 pies|7.45
55|Pâté chinois|25|6|24 boxes x 2 pies|24
56|Gnocchi di nonna Alice|26|5|24 - 250 g pkgs.|38
57|Ravioli Angelo|26|5|24 - 250 g pkgs.|19.5
58|Escargots de Bourgogne|27|8|24 pieces|13.25
59|Raclette Courdavault|28|4|5 kg pkg.|55
60|Camembert Pierrot|28|4|15 - 300 g rounds|34
61|Sirop d'érable|29|2|24 - 500 ml bottles|28.5
62|Tarte au sucre|29|3|48 pies|49.3
63|Vegie-spread|7|2|15 - 625 g jars|43.9
64|Wimmers gute Semmelknödel|12|5|20 bags x 4 pieces|33.25
65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
66|Louisiana Hot Spiced Okra|2|2|24 - 8 oz jars|17
67|Laughing Lumberjack Lager|16|1|24 - 12 oz bottles|14
68|Scottish Longbreads|8|3|10 boxes x 8 pieces|12.5
69|Gudbrandsdalsost|15|4|10 kg pkg.|36
70|Outback Lager|7|1|24 - 355 ml bottles|15
71|Fløtemysost|15|4|10 - 500 g pkgs.|21.5
72|Mozzarella di Giovanni|14|4|24 - 200 g pkgs.|34.8
73|Röd Kaviar|17|8|24 - 150 g jars|15
74|Longlife Tofu|4|7|5 kg pkg.|10
75|Rhönbräu Klosterbier|12|1|24 - 0.5 l bottles|7.75
76|Lakkalikööri|23|1|500 ml|18
77|Original Frankfurter grüne Soße|12|2|12 boxes|13
```

- *Este comando devuelve todos los registros con todas sus columnas desde la tabla `Products`.*

---

### ***Ejemplo 2: Seleccionar un Campo Específico***

- *Si solo necesitas ver un campo específico, como el precio de los productos, puedes seleccionar únicamente esa columna:*

```sql
SELECT Price FROM Products;
```

```sql
sqlite> SELECT Price FROM Products;
18
19
10
22
21.35
25
30
40
97
31
21
38
6
23.25
15.5
17.45
39
62.5
9.2
81
10
21
9
4.5
14
31.23
43.9
45.6
123.79
25.89
12.5
32
2.5
14
18
19
26
263.5
18
18.4
9.65
14
46
19.45
9.5
12
9.5
12.75
20
16.25
53
7
32.8
7.45
24
38
19.5
13.25
55
34
28.5
49.3
43.9
33.25
21.05
17
14
12.5
36
15
21.5
34.8
15
10
7.75
18
13
```

- *Este comando devuelve solo la columna `Price` de la tabla `Products`.*

---

### ***Ejemplo 3: Operaciones Matemáticas en una Columna***

- *Puedes realizar operaciones matemáticas en las columnas de una tabla. Por ejemplo, para duplicar el valor de la columna `Price`, puedes multiplicarlo por 2:*

```sql
SELECT Price * 2 FROM Products;
```

```sql
sqlite> SELECT Price * 2 FROM Products;
36
38
20
44
42.7
50
60
80
194
62
42
76
12
46.5
31.0
34.9
78
125.0
18.4
162
20
42
18
9.0
28
62.46
87.8
91.2
247.58
51.78
25.0
64
5.0
28
36
38
52
527.0
36
36.8
19.3
28
92
38.9
19.0
24
19.0
25.5
40
32.5
106
14
65.6
14.9
48
76
39.0
26.5
110
68
57.0
98.6
87.8
66.5
42.1
34
28
25.0
72
30
43.0
69.6
30
20
15.5
36
26
```

- *Este comando devuelve una columna calculada que contiene el doble del precio de cada producto.*

---

### ***Ejemplo 4: Usar Alias para Operaciones Matemáticas***

- *Si deseas que el resultado de la operación tenga un nombre personalizado, puedes utilizar la cláusula `AS` para asignar un alias a la columna calculada. Por ejemplo:*

```sql
SELECT Price * 2 AS PrecioDoble FROM Products;
```

```sql
sqlite> SELECT Price * 2 AS PrecioDoble FROM Products;
36
38
20
44
42.7
50
60
80
194
62
42
76
12
46.5
31.0
34.9
78
125.0
18.4
162
20
42
18
9.0
28
62.46
87.8
91.2
247.58
51.78
25.0
64
5.0
28
36
38
52
527.0
36
36.8
19.3
28
92
38.9
19.0
24
19.0
25.5
40
32.5
106
14
65.6
14.9
48
76
39.0
26.5
110
68
57.0
98.6
87.8
66.5
42.1
34
28
25.0
72
30
43.0
69.6
30
20
15.5
36
26
```

- *Esto devuelve una columna llamada `PrecioDoble`, que contiene el valor del precio multiplicado por 2 para cada producto.*

---

### ***Ejemplo 5: Seleccionar Varias Columnas con Operaciones Matemáticas***

- *Es posible seleccionar varias columnas y aplicar operaciones en algunas de ellas al mismo tiempo. Por ejemplo, puedes seleccionar el precio original y, al mismo tiempo, mostrar el precio duplicado en una segunda columna:*

```sql
SELECT Price, Price * 2 AS PrecioDoble FROM Products;
```

```sql
sqlite> SELECT Price, Price * 2 AS PrecioDoble FROM Products;
18|36
19|38
10|20
22|44
21.35|42.7
25|50
30|60
40|80
97|194
31|62
21|42
38|76
6|12
23.25|46.5
15.5|31.0
17.45|34.9
39|78
62.5|125.0
9.2|18.4
81|162
10|20
21|42
9|18
4.5|9.0
14|28
31.23|62.46
43.9|87.8
45.6|91.2
123.79|247.58
25.89|51.78
12.5|25.0
32|64
2.5|5.0
14|28
18|36
19|38
26|52
263.5|527.0
18|36
18.4|36.8
9.65|19.3
14|28
46|92
19.45|38.9
9.5|19.0
12|24
9.5|19.0
12.75|25.5
20|40
16.25|32.5
53|106
7|14
32.8|65.6
7.45|14.9
24|48
38|76
19.5|39.0
13.25|26.5
55|110
34|68
28.5|57.0
49.3|98.6
43.9|87.8
33.25|66.5
21.05|42.1
17|34
14|28
12.5|25.0
36|72
15|30
21.5|43.0
34.8|69.6
15|30
10|20
7.75|15.5
18|36
13|26
```

- *Este comando devuelve dos columnas: `Price` con el valor original y `PrecioDoble` con el precio multiplicado por 2.*

---

### ***Función `SUM`: Calcular la Suma Total de una Columna***

- *La función **`SUM`** es una función agregada en SQL que suma todos los valores de una columna específica. Es útil cuando necesitas calcular totales, como el precio total de todos los productos.*

- **Por ejemplo, para calcular la suma total de los precios de los productos, puedes usar:**

```sql
SELECT SUM(Price) AS PrecioTotal FROM Products;
```

```sql
sqlite> SELECT SUM(Price) AS PrecioDoble FROM Products;
2222.71
```

- *Este comando devuelve una sola fila con la suma total de los precios de todos los productos bajo la columna `PrecioTotal`.*

---

### ***Resumen***

- **`SELECT *`:** *Devuelve todas las columnas de la tabla.*
- **`SELECT columna`:** *Devuelve solo la columna especificada.*
- **Operaciones Matemáticas:** *Puedes realizar cálculos directamente en las columnas.*
- **Alias (`AS`):** *Renombra las columnas o los resultados de operaciones matemáticas para hacer los resultados más claros.*
- **Función `SUM`:** *Suma los valores de una columna.*
