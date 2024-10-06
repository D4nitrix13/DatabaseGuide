<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Operadores `IN` y `NOT IN` en SQL***

- *Los operadores **IN** y **NOT IN** se utilizan para simplificar las consultas que involucran múltiples condiciones de comparación en SQL.*

## ***Uso del Operador `IN`***

- *El operador **IN** permite verificar si un valor en una columna coincide con alguno de los valores dentro de una lista específica. Es una forma más eficiente de escribir múltiples condiciones **OR**.*

**Ejemplo sin `IN`:**

```sql
SELECT * FROM Products WHERE SupplierID = 3 OR SupplierID = 4 OR SupplierID = 5 OR SupplierID = 6;
```

**Resultado:**

```sql
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
74|Longlife Tofu|4|7|5 kg pkg.|10
```

**Ejemplo con `IN`:**

```sql
SELECT * FROM Products WHERE SupplierID IN (3, 4, 5, 6);
```

- *El uso de **IN** simplifica la consulta, eliminando la necesidad de múltiples condiciones **OR**, lo cual es más eficiente y legible.*

**Resultado:**

```sql
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
74|Longlife Tofu|4|7|5 kg pkg.|10
```

### ***Uso en Consultas con Texto***

- *El operador **IN** también puede utilizarse para comparar cadenas de texto. En este ejemplo, la consulta selecciona empleados cuyos apellidos son "Fuller" o "King".*

**Ejemplo:**

```sql
SELECT * FROM Employees WHERE LastName IN ("Fuller", "King");
```

**Resultado:**

```sql
2|Fuller|Andrew|1952-02-19|EmpID2.pic|Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales.
7|King|Robert|1960-05-29|EmpID7.pic|Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled 'Selling in Europe', he was transferred to the London office.
```

### ***Uso del Operador `NOT IN`***

- *El operador **NOT IN** es lo opuesto de **IN**. Se utiliza para excluir los registros que coinciden con los valores especificados en la lista.*

**Ejemplo:**

```sql
SELECT * FROM Employees WHERE LastName NOT IN ("Fuller", "King");
```

**Resultado:**

```sql
1|Davolio|Nancy|1968-12-08|EmpID1.pic|Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of 'Toastmasters International'.
3|Leverling|Janet|1963-08-30|EmpID3.pic|Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.
4|Peacock|Margaret|1958-09-19|EmpID4.pic|Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.
5|Buchanan|Steven|1955-03-04|EmpID5.pic|Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses 'Successful Telemarketing' and 'International Sales Management'. He is fluent in French.
6|Suyama|Michael|1963-07-02|EmpID6.pic|Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses 'Multi-Cultural Selling' and 'Time Management for the Sales Professional'. He is fluent in Japanese and can read and write French, Portuguese, and Spanish.
8|Callahan|Laura|1958-01-09|EmpID8.pic|Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.
9|Dodsworth|Anne|1969-07-02|EmpID9.pic|Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.
10|West|Adam|1928-09-19|EmpID10.pic|An old chum.
```

### ***Comparación entre `IN` y `NOT IN`***

- **`IN`:** *Devuelve los registros que coinciden con cualquiera de los valores en la lista.*
- **`NOT IN`:** *Excluye los registros que coinciden con los valores de la lista.*

- *Ambos operadores son herramientas esenciales para simplificar consultas que involucran múltiples valores de comparación, mejorando la legibilidad y la eficiencia del código SQL.*
