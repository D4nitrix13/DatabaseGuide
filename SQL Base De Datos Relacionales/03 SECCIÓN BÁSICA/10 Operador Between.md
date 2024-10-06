<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Operador BETWEEN***

> [!NOTE]
> *El operador `BETWEEN` en SQL se utiliza para filtrar los resultados que se encuentran dentro de un rango de valores especificado, incluyendo los límites superior e inferior. A continuación, se describen ejemplos de su uso y resultados obtenidos en una base de datos de ejemplo, así como algunas diferencias con otras formas de consulta.*

---

***Ejemplo con Precio:***

**Consulta:**

```sql
SELECT * FROM Products WHERE Price BETWEEN 20 AND 40 LIMIT 5;
```

*Esta consulta obtiene productos cuyo precio está entre 20 y 40 unidades monetarias, incluyendo los límites.*

**Salida:**

```sql
4 | Chef Anton's Cajun Seasoning | 2 | 2 | 48 - 6 oz jars | 22
5 | Chef Anton's Gumbo Mix        | 2 | 2 | 36 boxes      | 21.35
6 | Grandma's Boysenberry Spread  | 3 | 2 | 12 - 8 oz jars| 25
7 | Uncle Bob's Organic Dried Pears| 3 | 7 | 12 - 1 lb pkgs.| 30
8 | Northwoods Cranberry Sauce    | 3 | 2 | 12 - 12 oz jars| 40
```

---

## ***Entre Precio y Categoría:***

**Consulta:**

```sql
SELECT * FROM Products WHERE Price BETWEEN 20 AND 40 AND CategoryID = 6 LIMIT 3;
```

*Aquí, se agrega la condición de que el `CategoryID` debe ser 6, además del rango de precios.*

**Salida:**

```sql
17 | Alice Mutton        | 7  | 6 | 20 - 1 kg tins    | 39
53 | Perth Pasties       | 24 | 6 | 48 pieces         | 32.8
55 | Pâté chinois        | 25 | 6 | 24 boxes x 2 pies | 24
```

---

### ***Condición "OR" (o):***

**Consulta:**

```sql
SELECT * FROM Products WHERE Price BETWEEN 20 AND 40 OR CategoryID = 6 LIMIT 3;
```

*Esta consulta busca productos cuyo precio esté entre 20 y 40, o aquellos que pertenezcan a la categoría 6.*

**Salida:**

```sql
4  | Chef Anton's Cajun Seasoning  | 2  | 2 | 48 - 6 oz jars | 22
5  | Chef Anton's Gumbo Mix        | 2  | 2 | 36 boxes      | 21.35
6  | Grandma's Boysenberry Spread  | 3  | 2 | 12 - 8 oz jars| 25
```

---

***Condición con NOT BETWEEN:***

**Consulta:**

```sql
SELECT * FROM Products WHERE NOT Price BETWEEN 20 AND 40 AND CategoryID = 6 LIMIT 3;
```

*Esta consulta busca productos cuyo precio no está en el rango de 20 a 40, pero que pertenecen a la categoría 6.*

**Salida:**

```sql
9  | Mishi Kobe Niku            | 4  | 6 | 18 - 500 g pkgs.| 97
29 | Thüringer Rostbratwurst    | 12 | 6 | 50 bags x 30 sausgs.| 123.79
54 | Tourtière                  | 25 | 6 | 16 pies        | 7.45
```

*El operador `NOT BETWEEN` no es lo mismo que `WHERE NOT`, ya que `WHERE NOT` niega toda la condición, mientras que `NOT BETWEEN` niega solo la parte de rango.*

---

***Uso con Fechas:***

*También se puede utilizar el operador `BETWEEN` para comparar fechas.*

**Consulta:**

```sql
SELECT * FROM Employees WHERE BirthDate BETWEEN "1960-01-01" AND "1970-01-01";
```

*Busca empleados nacidos entre 1960 y 1970.*

**Salida:**

```sql
sqlite> SELECT * FROM Employees WHERE BirthDate BETWEEN "1960-01-01" AND "1970-01-01";
1|Davolio|Nancy|1968-12-08|EmpID1.pic|Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of 'Toastmasters International'.
3|Leverling|Janet|1963-08-30|EmpID3.pic|Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.
6|Suyama|Michael|1963-07-02|EmpID6.pic|Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses 'Multi-Cultural Selling' and 'Time Management for the Sales Professional'. He is fluent in Japanese and can read and write French, Portuguese, and Spanish.
7|King|Robert|1960-05-29|EmpID7.pic|Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled 'Selling in Europe', he was transferred to the London office.
9|Dodsworth|Anne|1969-07-02|EmpID9.pic|Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.
```

---

#### ***Comparación con operadores de mayor/menor:***

- *En lugar de `BETWEEN`, también se puede usar `>` y `<` para especificar rangos de fechas, pero la sintaxis es diferente.*

**Consulta:**

```sql
SELECT * FROM Employees WHERE BirthDate > "1950-01-01" AND BirthDate < "1960-01-01";
```

*Busca empleados nacidos después de 1950 y antes de 1960.*

**Salida:**

```sql
sqlite> SELECT * FROM Employees WHERE BirthDate > "1950-01-01" AND BirthDate < "1960-01-01";
2|Fuller|Andrew|1952-02-19|EmpID2.pic|Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.
4|Peacock|Margaret|1958-09-19|EmpID4.pic|Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.
5|Buchanan|Steven|1955-03-04|EmpID5.pic|Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses 'Successful Telemarketing' and 'International Sales Management'. He is fluent in French.
8|Callahan|Laura|1958-01-09|EmpID8.pic|Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.
```

---

##### ***Ejemplo con IDs:***

- *El operador `BETWEEN` también puede aplicarse a identificadores u otros números enteros.*

**Consulta:**

```sql
SELECT * FROM Employees WHERE "EmployeeID" BETWEEN 2 AND 4;
```

**Salida:**

```sql
sqlite> SELECT * FROM Employees WHERE "EmployeeID" BETWEEN 2 AND 4;
2|Fuller|Andrew|1952-02-19|EmpID2.pic|Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.
3|Leverling|Janet|1963-08-30|EmpID3.pic|Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.
4|Peacock|Margaret|1958-09-19|EmpID4.pic|Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.
```

---

#### ***Límites Invertidos en BETWEEN:***

**Si los límites de `BETWEEN` están al revés (mayor primero), no devuelve nada.**

**Consulta:**

```sql
SELECT * FROM Employees WHERE "EmployeeID" BETWEEN 6 AND 3;
```

**Salida:**

```sql
sqlite> SELECT * FROM Employees WHERE "EmployeeID" BETWEEN 6 AND 3;
```

---

#### ***Datos Incompatibles con BETWEEN:***

- *El uso de `BETWEEN` entre tipos de datos incompatibles (como una fecha y un número) genera un error o no devuelve ningún resultado.*

**Consulta:**

```sql
SELECT * FROM Employees WHERE "EmployeeID" BETWEEN "1960-01-01" AND 3;
```

**Salida:**

```sql
sqlite> SELECT * FROM Employees WHERE "EmployeeID" BETWEEN "1960-01-01" AND 3;
```

---

#### ***Uso de Booleanos en SQL:***

*En SQL, `0` se considera `FALSE` y `1` se considera `TRUE`. Esto permite usar consultas con constantes booleanas.*

**Consulta:**

```sql
SELECT * FROM Employees WHERE TRUE;
```

**Salida:**

```sql
sqlite> SELECT * FROM Employees WHERE TRUE;
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

**Consulta:**

```sql
SELECT * FROM Employees WHERE 0;
```

**Salida:**

```sql
sqlite> SELECT * FROM Employees WHERE 0;
```

---

***Combinaciones Booleanas:***

**Se pueden combinar valores booleanos en consultas SQL.**

**Consulta:**

```sql
SELECT * FROM Employees WHERE 1 AND 1;
```

**Salida:**

```sql
sqlite> SELECT * FROM Employees WHERE 1 AND 1;
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

**Consulta:**

```sql
SELECT * FROM Employees WHERE 1 OR 0;
```

**Salida:**

```sql
sqlite> SELECT * FROM Employees WHERE 1 OR 0;
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

---

##### ***Conclusión sobre BETWEEN:***

- *El operador `BETWEEN` es útil cuando se necesita filtrar por un rango de valores, incluyendo los límites. No puede usarse con tipos de datos incompatibles y debe ser manejado con cuidado en combinaciones lógicas o booleanas.*

- **Ejemplo NOT**

```sql
SELECT * FROM Employees NOT 0;
```

```sql
sqlite> SELECT * FROM Employees NOT 0;
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
SELECT * FROM Employees NOT 1;
```

```sql
sqlite> 
```
