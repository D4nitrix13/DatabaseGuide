<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Subconsultas (Subqueries)***

**Definición:**  

> [!NOTE]
> *Las subconsultas son consultas anidadas dentro de otra consulta SQL. Aunque pueden ser útiles en ciertas situaciones, no son la mejor forma de relacionar tablas; en general, se recomienda utilizar `JOIN`.*

**Limitaciones:**

- *Según el estándar SQL, el límite de subconsultas anidadas es de 16, aunque en MySQL este límite es de 64.*
- *Las subconsultas pueden tener varios niveles de anidamiento (primer nivel, segundo nivel, etc.).*

**Ejemplo básico:**

```sql
SELECT ProductName FROM Products WHERE ProductID = 11;
```

```sql
sqlite> SELECT ProductName FROM Products WHERE ProductID = 11;
Queso Cabrales
```

**Estructura:**  
*Una subconsulta debe ir entre paréntesis.*

**Ejemplo de error:**

```sql
sqlite> SELECT ProductID, Quantity, (SELECT ProductName, CategoryID FROM Products) FROM OrderDetails;
```

```sql
sqlite> SELECT ProductID, Quantity, (SELECT ProductName, CategoryID FROM Products) FROM OrderDetails;
Error: in prepare, sub-select returns 2 columns - expected 1 (1)
```

- *Esto da error porque el `SELECT` interno devuelve 2 columnas, pero la subconsulta debe devolver solo una columna.*

**Solución:**

```sql
SELECT ProductID, Quantity, (SELECT ProductName FROM Products WHERE ProductID = OrderDetails.ProductID) AS Name FROM OrderDetails LIMIT 3;
```

```sql
sqlite> SELECT ProductID, Quantity, (SELECT ProductName FROM Products WHERE ProductID = OrderDetails.ProductID) AS Name FROM OrderDetails LIMIT 3;
11|12|Queso Cabrales
42|10|Singaporean Hokkien Fried Mee
72|5|Mozzarella di Giovanni
```

**Uso de alias:**

- *Cuando se utiliza un alias, no se puede hacer referencia a él dentro de la misma consulta. Por ejemplo:*

```sql
SELECT ProductID AS pID, Quantity, (SELECT ProductName FROM Products WHERE pID = ProductID) AS Name FROM OrderDetails;
```

```sql
sqlite> SELECT ProductID AS pID, Quantity, (SELECT ProductName FROM Products WHERE pID = ProductID) AS Name FROM OrderDetails;
Error: in prepare, no such column: pID (1)
```

- *Esto dará error porque `pID` no se puede referenciar dentro de la misma consulta.*

**Referencias correctas:**

```sql
SELECT ProductID, Quantity, (SELECT ProductName FROM Products WHERE Products.ProductID = OrderDetails.ProductID) AS Name FROM OrderDetails LIMIT 10;
```

```sql
sqlite> SELECT ProductID, Quantity, (SELECT ProductName FROM Products WHERE Products.ProductID = OrderDetails.ProductID) AS Name FROM OrderDetails LIMIT 10;
11|12|Queso Cabrales
42|10|Singaporean Hokkien Fried Mee
72|5|Mozzarella di Giovanni
14|9|Tofu
51|40|Manjimup Dried Apples
41|10|Jack's New England Clam Chowder
51|35|Manjimup Dried Apples
65|15|Louisiana Fiery Hot Pepper Sauce
22|6|Gustaf's Knäckebröd
57|15|Ravioli Angelo
```

**Uso de alias mejorado:**

```sql
SELECT ProductID, Quantity, (SELECT ProductName FROM Products WHERE OD.ProductID = Products.ProductID) AS Nombre, (SELECT Price FROM Products WHERE OD.ProductID = Products.ProductID) AS Precio FROM OrderDetails AS OD LIMIT 10;
```

```sql
sqlite> SELECT ProductID, Quantity, (SELECT ProductName FROM Products WHERE OD.ProductID = Products.ProductID) AS Nombre, (SELECT Price FROM Products WHERE OD.ProductID = Products.ProductID) AS Precio FROM OrderDetails AS OD LIMIT 10;
11|12|Queso Cabrales|21
42|10|Singaporean Hokkien Fried Mee|14
72|5|Mozzarella di Giovanni|34.8
14|9|Tofu|23.25
51|40|Manjimup Dried Apples|53
41|10|Jack's New England Clam Chowder|9.65
51|35|Manjimup Dried Apples|53
65|15|Louisiana Fiery Hot Pepper Sauce|21.05
22|6|Gustaf's Knäckebröd|21
57|15|Ravioli Angelo|19.5
```

**Agrupaciones:**

```sql
SELECT ProductID, SUM(Quantity) AS Total FROM OrderDetails GROUP BY ProductID LIMIT 3;
```

```sql
sqlite> SELECT ProductID, SUM(Quantity) AS Total FROM OrderDetails GROUP BY ProductID LIMIT 3;
1|159
2|341
3|80
```

**Ejemplo con subconsulta:**

```sql
SELECT ProductID, SUM(Quantity) AS Total, (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio FROM [OrderDetails] OD GROUP BY ProductID LIMIT 3;
```

```sql
sqlite> SELECT ProductID, SUM(Quantity) AS Total, (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio FROM [OrderDetails] OD GROUP BY ProductID LIMIT 3;
1|159|18
2|341|19
3|80|10
```

---

## ***Sintaxis de Alias***

1. **`[OrderDetails] OD`:**
   - *Esta forma usa corchetes alrededor del nombre de la tabla.*
   - *Generalmente, se usa en bases de datos que permiten caracteres especiales o espacios en los nombres de tablas. Sin embargo, en muchos sistemas de bases de datos, como SQL Server, los corchetes son opcionales si el nombre de la tabla no contiene espacios ni caracteres especiales.*
   - *Ejemplo:*

    ```sql
    SELECT * FROM [OrderDetails] OD LIMIT 1;
    ```

    ```sql
    sqlite> SELECT * FROM [OrderDetails] OD LIMIT 1;
    1|10248|11|12
    ```

2. **`OrderDetails AS OD`:**
   - *Esta forma es más común y clara. La palabra clave `AS` se utiliza para indicar que `OD` es un alias de `OrderDetails`.*
   - *El uso de `AS` puede mejorar la legibilidad, ya que deja claro que se está creando un alias.*
   - *Ejemplo:*

    ```sql
    SELECT * FROM OrderDetails AS OD LIMIT 1;
    ```

    ```sql
    sqlite> SELECT * FROM OrderDetails AS OD LIMIT 1;
    1|10248|11|12
    ```

---

### ***Rendimiento***

- **Rendimiento:**
  *En términos de rendimiento, no hay diferencia entre las dos sintaxis. Ambos métodos crean un alias para la tabla y el motor de base de datos no realiza ninguna distinción en el procesamiento. La ejecución de la consulta será igual, independientemente de cuál opción uses.*

---

### ***Legibilidad***

- **Legibilidad:**
  - *La opción con `AS` suele ser más fácil de leer para quienes están familiarizados con SQL, ya que establece explícitamente que `OD` es un alias de `OrderDetails`.*
  - *La forma con corchetes puede ser menos clara para algunos usuarios, especialmente si no están familiarizados con el uso de corchetes.*

- **Conclusión**

- *Ambas formas son funcionalmente equivalentes en cuanto a rendimiento. Sin embargo, **`OrderDetails AS OD`** se considera generalmente más legible y es preferida en la mayoría de las prácticas de codificación SQL. Es recomendable seguir una convención que favorezca la claridad en la escritura de las consultas, por lo que usar `AS` puede ser la mejor opción en términos de estilo.*

---

#### ***Cuidado con las operaciones matemáticas:***

- *No se pueden usar alias en operaciones matemáticas directamente en la cláusula `SELECT`. Por ejemplo:*

```sql
SELECT ProductID, SUM(Quantity) AS Total, (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio, (Total * Precio) FROM [OrderDetails] OD GROUP BY ProductID LIMIT 3;
```

```sql
sqlite> SELECT ProductID, SUM(Quantity) AS Total, (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio, (Total * Precio) FROM [OrderDetails] OD GROUP BY ProductID LIMIT 3;
Error: in prepare, no such column: Total (1)
```

- **Esto dará error. La solución es realizar la operación usando la subconsulta:**

```sql
SELECT ProductID, SUM(Quantity) AS Total, (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio, (SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)) AS Recaudacion FROM [OrderDetails] OD GROUP BY ProductID LIMIT 3;
```

```sql
sqlite> SELECT ProductID, SUM(Quantity) AS Total, (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio, (SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)) AS Recaudacion FROM [OrderDetails] OD GROUP BY ProductID LIMIT 3;
1|159|18|2862
2|341|19|6479
3|80|10|800
```

**Ordenamientos:**

```sql
SELECT ProductID, SUM(Quantity) AS Total, (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio, (SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)) AS Recaudacion FROM [OrderDetails] OD GROUP BY ProductID ORDER BY Total DESC NULLS LAST LIMIT 3;
```

```sql
sqlite> SELECT ProductID, SUM(Quantity) AS Total, (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio, (SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)) AS Recaudacion FROM [OrderDetails] OD GROUP BY ProductID ORDER BY Total DESC NULLS LAST LIMIT 3;
31|458|12.5|5725.0
60|430|34|14620
35|369|18|6642
```

**Mejoras con formateo:**

```sql
SELECT ProductID, SUM(Quantity) AS Total, (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio, ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion FROM [OrderDetails] OD GROUP BY ProductID ORDER BY Recaudacion DESC NULLS LAST LIMIT 3;
```

```sql
sqlite> SELECT ProductID, SUM(Quantity) AS Total, (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio, ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion FROM [OrderDetails] OD GROUP BY ProductID ORDER BY Recaudacion DESC NULLS LAST LIMIT 3;
38|239|263.5|62976.5
29|168|123.79|20796.72
59|346|55|19030.0
```

**Nombres claros en las columnas:**

```sql
SELECT ProductID, SUM(Quantity) AS Total, (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio, (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre, ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion FROM [OrderDetails] OD GROUP BY ProductID ORDER BY Recaudacion DESC NULLS LAST LIMIT 3;
```

```sql
sqlite> SELECT ProductID, SUM(Quantity) AS Total, (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio, (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre, ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion FROM [OrderDetails] OD GROUP BY ProductID ORDER BY Recaudacion DESC NULLS LAST LIMIT 3;
38|239|263.5|Côte de Blaye|62976.5
29|168|123.79|Thüringer Rostbratwurst|20796.72
59|346|55|Raclette Courdavault|19030.0
```

**Consulta con ordenamientos:**

```sql
SELECT ProductID, SUM(Quantity) AS Total, (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio, (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre, ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion FROM [OrderDetails] OD GROUP BY ProductID ORDER BY Total ASC NULLS LAST LIMIT 3;
```

```sql
sqlite> SELECT ProductID, SUM(Quantity) AS Total, (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio, (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre, ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion FROM [OrderDetails] OD GROUP BY ProductID ORDER BY Total ASC NULLS LAST LIMIT 3;
67|5|14|Laughing Lumberjack Lager|70.0
45|15|9.5|Røgede sild|142.5
22|18|21|Gustaf's Knäckebröd|378.0
```

---

### **Subconsultas con Filtros y Ejemplos**

---

#### ***Ejemplo 1: Consulta Básica con Subconsulta***

```sql
SELECT ProductID, 
       SUM(Quantity) AS Total, 
       (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio, 
       (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre, 
       ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion 
FROM [OrderDetails] OD 
GROUP BY ProductID 
ORDER BY Recaudacion ASC NULLS LAST 
LIMIT 3;
```

```sql
sqlite> SELECT ProductID,
       SUM(Quantity) AS Total,
       (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio,
       (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre,
       ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion
FROM [OrderDetails] OD
GROUP BY ProductID
ORDER BY Recaudacion ASC NULLS LAST
LIMIT 3;
67|5|14|Laughing Lumberjack Lager|70.0
45|15|9.5|Røgede sild|142.5
52|48|7|Filo Mix|336.0
```

- **Descripción:** *Esta consulta obtiene el ID del producto, la suma de la cantidad, el precio y el nombre del producto desde la tabla `OrderDetails`, calculando la recaudación y ordenando los resultados por recaudación en orden ascendente.*

---

### ***Ejemplo 2: Subconsulta Aplicada a Filtros***

```sql
SELECT ProductID,
       SUM(Quantity) AS Total,
       (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre,
       ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion
FROM [OrderDetails] OD
WHERE (SELECT Price FROM Products WHERE ProductID = OD.ProductID) > 40
GROUP BY ProductID
ORDER BY Recaudacion ASC NULLS LAST
LIMIT 3;
```

```sql
sqlite> SELECT ProductID,
       SUM(Quantity) AS Total,
       (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre,
       ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion
FROM [OrderDetails] OD
WHERE (SELECT Price FROM Products WHERE ProductID = OD.ProductID) > 40
GROUP BY ProductID
ORDER BY Recaudacion ASC NULLS LAST
LIMIT 3;
9|20|Mishi Kobe Niku|1940.0
27|90|Schoggi Schokolade|3951.0
43|136|Ipoh Coffee|6256.0
```

- **Descripción:** *Aquí se filtran los productos cuyo precio es mayor a 40, obteniendo el nombre del producto y la recaudación.*

---

### ***Ejemplo 3: Usando Alias en el Filtro***

```sql
SELECT ProductID,
       SUM(Quantity) AS Total,
       (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio,
       (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre,
       ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion
FROM [OrderDetails] OD
WHERE Precio > 40
GROUP BY ProductID
ORDER BY Recaudacion ASC NULLS LAST
LIMIT 3;
```

```sql
sqlite> SELECT ProductID,
       SUM(Quantity) AS Total,
       (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio,
       (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre,
       ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion
FROM [OrderDetails] OD
WHERE Precio > 40
GROUP BY ProductID
ORDER BY Recaudacion ASC NULLS LAST
LIMIT 3;
9|20|97|Mishi Kobe Niku|1940.0
27|90|43.9|Schoggi Schokolade|3951.0
43|136|46|Ipoh Coffee|6256.0
```

- **Descripción:** *Esta consulta es similar a la anterior, pero utiliza `Precio` directamente en el filtro, lo que mejora la legibilidad. Sin embargo, es importante tener en cuenta que algunos sistemas de gestión de bases de datos pueden no permitir el uso de alias en la cláusula `WHERE`.*

---

### ***Ejemplo 4: Subconsulta en From***

```sql
SELECT * FROM (
  SELECT ProductID,
         SUM(Quantity) AS Total,
         (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio,
         (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre,
         ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion
  FROM [OrderDetails] OD
  WHERE Precio > 40
  GROUP BY ProductID
  ORDER BY Recaudacion ASC NULLS LAST
  LIMIT 3
);
```

```sql
sqlite> SELECT * FROM (
  SELECT ProductID,
         SUM(Quantity) AS Total,
         (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio,
         (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre,
         ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion
  FROM [OrderDetails] OD
  WHERE Precio > 40
  GROUP BY ProductID
  ORDER BY Recaudacion ASC NULLS LAST
  LIMIT 3
);
9|20|97|Mishi Kobe Niku|1940.0
27|90|43.9|Schoggi Schokolade|3951.0
43|136|46|Ipoh Coffee|6256.0
```

- **Descripción:** *En este caso, la consulta se encapsula en otra consulta, lo que permite trabajar con los resultados de la subconsulta en una consulta externa.*

---

### ***Ejemplo 5: Elegir un Campo Específico***

```sql
SELECT Recaudacion FROM (
  SELECT ProductID,
         SUM(Quantity) AS Total,
         (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio,
         (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre,
         ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion
  FROM [OrderDetails] OD
  WHERE Precio > 40
  GROUP BY ProductID
  ORDER BY Recaudacion ASC NULLS LAST
  LIMIT 3
);
```

```sql
sqlite> SELECT Recaudacion FROM (
  SELECT ProductID,
         SUM(Quantity) AS Total,
         (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio,
         (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre,
         ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion
  FROM [OrderDetails] OD
  WHERE Precio > 40
  GROUP BY ProductID
  ORDER BY Recaudacion ASC NULLS LAST
  LIMIT 3
);
1940.0
3951.0
6256.0
```

- **Descripción:** *Esta consulta extrae solo el campo `Recaudacion` de los resultados obtenidos en la subconsulta.*

---

### ***Ejemplo 6: Aplicando Filtros a los Resultados Externos***

```sql
SELECT Nombre, Recaudacion FROM (
  SELECT ProductID,
         SUM(Quantity) AS Total,
         (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio,
         (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre,
         ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion
  FROM [OrderDetails] OD
  WHERE Precio > 40
  GROUP BY ProductID
  ORDER BY Recaudacion ASC NULLS LAST
) WHERE Recaudacion > 100
LIMIT 3;
```

```sql
sqlite> SELECT Nombre, Recaudacion FROM (
  SELECT ProductID,
         SUM(Quantity) AS Total,
         (SELECT Price FROM Products WHERE ProductID = OD.ProductID) AS Precio,
         (SELECT ProductName FROM Products WHERE ProductID = OD.ProductID) AS Nombre,
         ROUND((SUM(Quantity) * (SELECT Price FROM Products WHERE ProductID = OD.ProductID)), 2) AS Recaudacion
  FROM [OrderDetails] OD
  WHERE Precio > 40
  GROUP BY ProductID
  ORDER BY Recaudacion ASC NULLS LAST
) WHERE Recaudacion > 100
LIMIT 3;
Mishi Kobe Niku|1940.0
Schoggi Schokolade|3951.0
Ipoh Coffee|6256.0
```

- **Descripción:** *En este último ejemplo, se filtran los resultados de la subconsulta para incluir solo aquellos productos cuya recaudación es mayor a 100.*
