<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***AND, OR y NOT en SQL***

- **Estructura y funcionalidad de AND, OR y NOT**

*En SQL, las cláusulas `AND`, `OR` y `NOT` se utilizan para combinar condiciones en una consulta. Estas operaciones permiten filtrar datos según criterios específicos, facilitando la búsqueda de información más precisa en una base de datos.*

---

## ***1. AND***

- **La cláusula `AND` se utiliza para combinar dos o más condiciones y devuelve resultados solo si todas las condiciones son verdaderas. Por ejemplo:**

```sql
SELECT * FROM Customers WHERE CustomerID >= 50 AND CustomerID < 55;
```

**Salida:**

```sql
sqlite> SELECT * FROM Customers WHERE CustomerID >= 50 AND CustomerID < 55;
50|Maison Dewey|Catherine Dewey|Rue Joseph-Bens 532|Bruxelles|B-1180|Belgium
51|Mère Paillarde|Jean Fresnière|43 rue St. Laurent|Montréal|H1J 1C3|Canada
52|Morgenstern Gesundkost|Alexander Feuer|Heerstr. 22|Leipzig|4179|Germany
53|North/South|Simon Crowther|South House 300 Queensbridge|London|SW7 1RZ|UK
54|Océano Atlántico Ltda.|Yvonne Moncada|Ing. Gustavo Moncada 8585 Piso 20-A|Buenos Aires|1010|Argentina
```

- *En este caso, la consulta selecciona todos los clientes con un `CustomerID` entre 50 y 54.*

---

### ***2. OR***

**La cláusula `OR` se utiliza para combinar condiciones y devuelve resultados si al menos una de las condiciones es verdadera. Por ejemplo:**

```sql
SELECT * FROM Employees WHERE FirstName == "Nancy" OR FirstName == "Anne";
```

**Salida:**

```sql
sqlite> SELECT * FROM Employees WHERE FirstName == "Nancy" OR FirstName == "Anne";
1|Davolio|Nancy|1968-12-08|EmpID1.pic|Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of 'Toastmasters International'.
9|Dodsworth|Anne|1969-07-02|EmpID9.pic|Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.
```

> [!TIP]
> *Aquí, la consulta selecciona empleados cuyo nombre es "Nancy" o "Anne". También se puede usar el operador de igualdad `=` en lugar de `==`, como en el siguiente ejemplo:*

```sql
SELECT * FROM Employees WHERE FirstName = "Nancy";
```

**Salida:**

```sql
sqlite> SELECT * FROM Employees WHERE FirstName = "Nancy";
1|Davolio|Nancy|1968-12-08|EmpID1.pic|Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of 'Toastmasters International'.
```

---

### ***3. Combinaciones de AND y OR***

**Es posible combinar `AND` y `OR` en una sola consulta. Es importante usar paréntesis para garantizar que las condiciones se evalúen en el orden correcto. Por ejemplo:**

```sql
SELECT * FROM Products WHERE Price < 20 OR (CategoryID = 6 AND SupplierID = 7) LIMIT 10;
```

**Salida:**

```sql
sqlite> SELECT * FROM Products WHERE Price < 20 OR (CategoryID = 6 AND SupplierID = 7) LIMIT 10;
1|Chais|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
13|Konbu|6|8|2 kg box|6
15|Genen Shouyu|6|2|24 - 250 ml bottles|15.5
16|Pavlova|7|3|32 - 500 g boxes|17.45
17|Alice Mutton|7|6|20 - 1 kg tins|39
19|Teatime Chocolate Biscuits|8|3|10 boxes x 12 pieces|9.2
21|Sir Rodney's Scones|8|3|24 pkgs. x 4 pieces|10
23|Tunnbröd|9|5|12 - 250 g pkgs.|9
```

*Aquí, la consulta selecciona productos que tienen un precio menor a 20 o que pertenecen a la categoría 6 y son suministrados por el proveedor 7.*

---

## ***Uso de Paréntesis `()` en SQL***

- *Los paréntesis se utilizan en SQL para agrupar condiciones y controlar el orden en que se evalúan. Al igual que en matemáticas, donde los paréntesis determinan qué operaciones se realizan primero, en SQL, los paréntesis permiten especificar qué condiciones deben evaluarse juntas antes de aplicar los operadores lógicos como `AND` y `OR`.*

---

### ***1. Controlar el Orden de Evaluación***

- *Cuando se combinan múltiples condiciones usando `AND` y `OR`, es importante establecer el orden correcto de evaluación. Sin paréntesis, SQL evalúa las condiciones de acuerdo con su precedencia, donde `AND` tiene prioridad sobre `OR`. Esto significa que SQL evalúa primero todas las condiciones `AND` antes de considerar las condiciones `OR`.*

**Ejemplo sin paréntesis:**

```sql
SELECT * FROM Products WHERE Price < 20 OR CategoryID = 6 AND SupplierID = 7 LIMIT 3;
```

```sql
sqlite> SELECT * FROM Products WHERE Price < 20 OR CategoryID = 6 AND SupplierID = 7 LIMIT 3;
1|Chais|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
```

**En este caso, SQL interpretará la consulta como:**

```sql
SELECT * FROM Products WHERE Price < 20 OR (CategoryID = 6 AND SupplierID = 7) LIMIT 3;
```

```sql
sqlite> SELECT * FROM Products WHERE Price < 20 OR (CategoryID = 6 AND SupplierID = 7) LIMIT 3;
1|Chais|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
```

- *Esto significa que seleccionará productos que cumplen cualquiera de las siguientes condiciones:*

- *Tienen un precio menor a 20, **o***
- *Pertenecen a la categoría 6 **y** son suministrados por el proveedor 7.*

**Resultados esperados:**

- *Esto puede llevar a resultados inesperados, ya que puede devolver productos que tienen un precio bajo, independientemente de su categoría y proveedor.*

---

### ***2. Agrupando Condiciones***

- *Al usar paréntesis, puedes especificar qué condiciones deben evaluarse juntas, lo que asegura que la consulta devuelva los resultados deseados.*

**Ejemplo con paréntesis:**

```sql
SELECT * FROM Products WHERE (Price < 20 OR CategoryID = 6) AND SupplierID = 7;
```

```sql
sqlite> SELECT * FROM Products WHERE (Price < 20 OR CategoryID = 6) AND SupplierID = 7;
16|Pavlova|7|3|32 - 500 g boxes|17.45
17|Alice Mutton|7|6|20 - 1 kg tins|39
70|Outback Lager|7|1|24 - 355 ml bottles|15
```

- *En este caso, la consulta selecciona productos que cumplen con la siguiente condición:*

- ***(Tienen un precio menor a 20 o pertenecen a la categoría 6)** **y** son suministrados por el proveedor 7.*

**Resultados esperados:**

- *Este enfoque permite un control más preciso sobre los criterios de selección y asegura que los productos devueltos cumplan con los criterios de ambas condiciones.*

---

### ***3. Efecto de No Usar Paréntesis***

- **Si no usas paréntesis en situaciones donde son necesarios, puede resultar en:**

- **Resultados incorrectos:** *La lógica de la consulta puede cambiar drásticamente, devolviendo resultados que no esperabas.*
- **Ambigüedad:** *Sin una clara agrupación de condiciones, puede ser difícil entender qué se está evaluando, lo que puede llevar a errores en la interpretación de la consulta.*
  
---

### ***Ejemplo de Efecto Sin Paréntesis***

**Considera el siguiente conjunto de datos:**

```sql
SELECT * FROM Products WHERE Price < 20 OR Price > 30 AND CategoryID = 6 LIMIT 3;
```

```sql
sqlite> SELECT * FROM Products WHERE Price < 20 OR Price > 30 AND CategoryID = 6 LIMIT 3;
1|Chais|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
```

**Esto se interpretará como:**

```sql
SELECT * FROM Products WHERE Price < 20 OR (Price > 30 AND CategoryID = 6) LIMIT 3;
```

```sql
sqlite> SELECT * FROM Products WHERE Price < 20 OR (Price > 30 AND CategoryID = 6) LIMIT 3;
1|Chais|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
```

**Posibles resultados:**

1. *Productos con un precio menor a 20 (independientemente de la categoría).*
2. *Productos con un precio mayor a 30 **que también** pertenecen a la categoría 6.*

- *En este caso, los productos que cumplen solamente con la condición de precio (menor a 20) pueden ser seleccionados sin considerar su categoría. Esto puede llevar a un gran número de resultados si hay muchos productos económicos.*

---

### ***Conclusión***

**El uso de paréntesis en SQL es esencial para:**

- **Controlar el flujo de la lógica:** *Permiten especificar qué condiciones se deben evaluar juntas.*
- **Evitar resultados inesperados:** *Aseguran que la consulta se ejecute como se pretende.*
- **Mejorar la claridad de la consulta:** *Hacen que las intenciones del programador sean más obvias.*

---

### ***4. NOT***

- *La cláusula `NOT` se utiliza para excluir resultados que cumplen con una condición específica. Por ejemplo:*

```sql
SELECT * FROM Products WHERE NOT Price > 40 LIMIT 10;
```

**Salida:**

```sql
sqlite> SELECT * FROM Products WHERE NOT Price > 40 LIMIT 10;
1|Chais|1|1|10 boxes x 20 bags|18
2|Chang|1|1|24 - 12 oz bottles|19
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
7|Uncle Bob's Organic Dried Pears|3|7|12 - 1 lb pkgs.|30
8|Northwoods Cranberry Sauce|3|2|12 - 12 oz jars|40
10|Ikura|4|8|12 - 200 ml jars|31
11|Queso Cabrales|5|4|1 kg pkg.|21
```

- *En este caso, la consulta selecciona productos cuyo precio no es mayor a 40.*

*También puedes usar `NOT` para excluir múltiples condiciones:*

```sql
SELECT * FROM Customers WHERE NOT Country = "USA" AND NOT Country = "France" LIMIT 10;
```

**Salida:**

```sql
sqlite> SELECT * FROM Customers WHERE NOT Country = "USA" AND NOT Country = "France" LIMIT 10;
1|Alfreds Futterkiste|Maria Anders|Obere Str. 57|Berlin|12209|Germany
2|Ana Trujillo Emparedados y helados|Ana Trujillo|Avda. de la Constitución 2222|México D.F.|5021|Mexico
3|Antonio Moreno Taquería|Antonio Moreno|Mataderos 2312|México D.F.|5023|Mexico
4|Around the Horn|Thomas Hardy|120 Hanover Sq.|London|WA1 1DP|UK
5|Berglunds snabbköp|Christina Berglund|Berguvsvägen 8|Luleå|S-958 22|Sweden
6|Blauer See Delikatessen|Hanna Moos|Forsterstr. 57|Mannheim|68306|Germany
8|Bólido Comidas preparadas|Martín Sommer|C/ Araquil, 67|Madrid|28023|Spain
10|Bottom-Dollar Marketse|Elizabeth Lincoln|23 Tsawassen Blvd.|Tsawassen|T2F 8M4|Canada
11|B's Beverages|Victoria Ashworth|Fauntleroy Circus|London|EC2 5NT|UK
12|Cactus Comidas para llevar|Patricio Simpson|Cerrito 333|Buenos Aires|1010|Argentina
```
