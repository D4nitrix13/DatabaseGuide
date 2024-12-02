<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Explicación detallada de GROUP BY y HAVING***

- *En SQL, las cláusulas `GROUP BY` y `HAVING` permiten agrupar filas que comparten un valor común y aplicar funciones de agregación (como `COUNT`, `AVG`, `SUM`, etc.) a cada grupo. Además, la cláusula `HAVING` se utiliza para filtrar grupos basados en condiciones, similar a cómo `WHERE` filtra filas individuales.*

---

## ***Diferencia entre `WHERE` y `HAVING`***

- **`WHERE`:** *Filtra filas antes de que se realicen las agregaciones o agrupaciones. Se aplica directamente a las filas de la tabla antes de agrupar los datos.*
  
- **`HAVING`:** *Filtra los resultados después de que se haya aplicado la agregación o el agrupamiento. Se utiliza para limitar los grupos en función de los resultados de las funciones de agregación.*

- *Por ejemplo, si quieres filtrar las filas antes de agrupar, utilizas `WHERE`, pero si deseas filtrar los grupos después de aplicar una función como `AVG` o `SUM`, utilizas `HAVING`.*

---

### ***Ejemplos prácticos:***

1. ***Agrupación por `SupplierID` y cálculo del promedio de precios:***

    ```sql
    SELECT SupplierID, ROUND(AVG(Price)) FROM Products GROUP BY SupplierID;
    ```

    *Este ejemplo agrupa los productos por `SupplierID` y calcula el precio promedio de los productos de cada proveedor utilizando `AVG(Price)`, redondeando el resultado con la función `ROUND`. El resultado devuelve una lista de `SupplierID` con su correspondiente precio promedio.*

    ```sql
    sqlite> SELECT SupplierID, ROUND(AVG(Price)) FROM Products GROUP BY SupplierID;
    |0.0
    1|16.0
    2|20.0
    3|32.0
    4|46.0
    5|30.0
    6|15.0
    7|36.0
    8|28.0
    9|15.0
    10|5.0
    11|30.0
    12|45.0
    13|26.0
    14|26.0
    15|20.0
    16|15.0
    17|20.0
    18|141.0
    19|14.0
    20|26.0
    21|11.0
    22|11.0
    23|18.0
    24|31.0
    25|16.0
    26|29.0
    27|13.0
    28|45.0
    29|39.0
    ```

2. ***Ordenar los resultados por el promedio de precios en orden descendente:***

    ```sql
    SELECT SupplierID, ROUND(AVG(Price)) AS Promedio FROM Products GROUP BY SupplierID ORDER BY Promedio DESC;
    ```

    *Este ejemplo es similar al anterior, pero incluye una cláusula `ORDER BY` para ordenar los resultados por el precio promedio (`Promedio`) en orden descendente.*

    ```sql
    sqlite> SELECT SupplierID, ROUND(AVG(Price)) AS Promedio FROM Products GROUP BY SupplierID ORDER BY Promedio DESC;
    18|141.0
    4|46.0
    28|45.0
    12|45.0
    29|39.0
    7|36.0
    3|32.0
    24|31.0
    11|30.0
    5|30.0
    26|29.0
    8|28.0
    20|26.0
    14|26.0
    13|26.0
    17|20.0
    15|20.0
    2|20.0
    23|18.0
    25|16.0
    1|16.0
    16|15.0
    9|15.0
    6|15.0
    19|14.0
    27|13.0
    22|11.0
    21|11.0
    10|5.0
    |0.0
    ```

3. ***Incluir nombres de productos al agrupar por `SupplierID`:***

    ```sql
    SELECT ProductName, SupplierID, ROUND(AVG(Price)) AS Promedio FROM Products GROUP BY SupplierID ORDER BY Promedio DESC;
    ```

    *En este caso, además de agrupar por `SupplierID`, se incluye el nombre del producto (`ProductName`). Esto devuelve una lista con los productos y su proveedor, mostrando el precio promedio del proveedor ordenado de mayor a menor.*

    ```sql
    sqlite> SELECT ProductName, SupplierID, ROUND(AVG(Price)) AS Promedio FROM Products GROUP BY SupplierID ORDER BY Promedio DESC;
    Côte de Blaye|18|141.0
    Mishi Kobe Niku|4|46.0
    Raclette Courdavault|28|45.0
    Rössle Sauerkraut|12|45.0
    Sirop d'érable|29|39.0
    Pavlova|7|36.0
    Grandma's Boysenberry Spread|3|32.0
    Manjimup Dried Apples|24|31.0
    NuNuCa Nuß-Nougat-Creme|11|30.0
    Queso Cabrales|5|30.0
    Gnocchi di nonna Alice|26|29.0
    Teatime Chocolate Biscuits|8|28.0
    Singaporean Hokkien Fried Mee|20|26.0
    Gorgonzola Telino|14|26.0
    Nord-Ost Matjeshering|13|26.0
    Inlagd Sill|17|20.0
    Geitost|15|20.0
    Chef Anton's Cajun Seasoning|2|20.0
    Maxilaku|23|18.0
    Tourtière|25|16.0
    Chais|1|16.0
    Sasquatch Ale|16|15.0
    Gustaf's Knäckebröd|9|15.0
    Konbu|6|15.0
    Boston Crab Meat|19|14.0
    Escargots de Bourgogne|27|13.0
    Zaanse koeken|22|11.0
    Røgede sild|21|11.0
    Guaraná Fantástica|10|5.0
    ||0.0
    ```

---

### ***Ejemplo de un error común al usar `WHERE` y `GROUP BY`:***

```sql
SELECT CategoryID, ROUND(AVG(Price)) AS Promedio FROM Products GROUP BY CategoryID WHERE CategoryID IS NOT NULL;
```

```sql
sqlite> SELECT CategoryID, ROUND(AVG(Price)) AS Promedio FROM Products GROUP BY CategoryID WHERE CategoryID IS NOT NULL;
Error: in prepare, near "WHERE": syntax error (1)
```

*Este código dará un error porque el orden correcto de las cláusulas es crucial en SQL. Primero se debe filtrar con `WHERE`, luego agrupar con `GROUP BY`. El orden correcto de ejecución en SQL es:*

1. *Seleccionar las filas a filtrar (`WHERE`).*
2. *Agrupar los datos (`GROUP BY`).*
3. *Aplicar funciones de agregación o filtrado con `HAVING`.*

---

### ***Solución al error:***

```sql
SELECT CategoryID, ROUND(AVG(Price)) AS Promedio FROM Products WHERE CategoryID IS NOT NULL GROUP BY CategoryID;
```

- *Con este ajuste, primero filtramos las filas donde `CategoryID` no es `NULL`, y luego agrupamos los productos por `CategoryID` para calcular el precio promedio.*

```sql
sqlite> SELECT CategoryID, ROUND(AVG(Price)) AS Promedio FROM Products WHERE CategoryID IS NOT NULL GROUP BY CategoryID;
1|38.0
2|23.0
3|23.0
4|29.0
5|20.0
6|46.0
7|32.0
8|21.0
9|0.0
```

---

#### ***Agrupación y Agregación en SQL***

- *La cláusula `GROUP BY` se utiliza para agrupar filas que tienen valores similares en columnas específicas, permitiendo realizar operaciones de agregación sobre cada grupo. Las funciones de agregación como `AVG()`, `SUM()`, `COUNT()`, entre otras, nos permiten aplicar cálculos sobre los grupos creados.*

- **`WHERE`:** *Filtra filas (registros) antes de agrupar. Solo actúa sobre los registros individuales.*
- **`HAVING`:** *Filtra grupos. Se usa después de aplicar `GROUP BY` y funciona sobre los resultados de las funciones de agregación.*

**Ejemplo 1:**

```sql
SELECT CategoryID, ROUND(AVG(Price), 2) AS Promedio
FROM Products
WHERE CategoryID IS NOT NULL
GROUP BY CategoryID
HAVING Promedio > 40;
```

```sql
sqlite> SELECT CategoryID, ROUND(AVG(Price), 2) AS Promedio
FROM Products
WHERE CategoryID IS NOT NULL
GROUP BY CategoryID
HAVING Promedio > 40;
```

*Esto selecciona el ID de categoría y el promedio de los precios de productos para cada categoría, pero solo muestra los grupos cuyo promedio supera los 40.*

**Resultado:**

```sql
6|46.29
```

**Ejemplo 2:**

```sql
SELECT SupplierID, ROUND(AVG(Price), 2) AS Promedio
FROM Products
GROUP BY SupplierID
HAVING Promedio > 40;
```

```sql
sqlite> SELECT SupplierID, ROUND(AVG(Price), 2) AS Promedio
FROM Products
GROUP BY SupplierID
HAVING Promedio > 40;
```

- *Aquí se agrupan productos por sus proveedores, calculando el promedio de precios por proveedor, y filtrando solo aquellos proveedores con un promedio de precios mayor a 40.*

**Resultado:**

```sql
4|46.0
12|44.68
18|140.75
28|44.5
```

---

#### ***Ejemplos de Consultas con Agregación***

1. *Consulta para obtener los primeros 10 registros de la tabla `OrderDetails`:*

    ```sql
    SELECT "ProductID", "Quantity" 
    FROM "OrderDetails" 
    LIMIT 10;
    ```

    ```sql
    sqlite> SELECT "ProductID", "Quantity" 
    FROM "OrderDetails" 
    LIMIT 10;
    ```

    **Resultado:**

    ```sql
    11|12
    42|10
    72|5
    ...
    ```

2. *Suma de cantidades (`Quantity`) para un producto específico:*

    ```sql
    SELECT "ProductID", SUM("Quantity")
    FROM "OrderDetails";
    ```

    ```sql
    sqlite> SELECT "ProductID", SUM("Quantity")
    FROM "OrderDetails";
    ```

    **Esto suma todas las cantidades asociadas con un producto.**

    **Resultado:**

    ```sql
    11|12743
    ```

3. *Ordenar por el total de cantidades para cada producto, limitando la salida a los primeros 20 registros:*

    ```sql
    SELECT "ProductID", SUM("Quantity") AS Total 
    FROM "OrderDetails"
    GROUP BY "ProductID"
    ORDER BY Total ASC NULLS LAST 
    LIMIT 20;
    ```

    ```sql
    sqlite> SELECT "ProductID", SUM("Quantity") AS Total 
    FROM "OrderDetails"
    GROUP BY "ProductID"
    ORDER BY Total ASC NULLS LAST 
    LIMIT 20;
    ```

4. *Filtrar productos cuya suma total de cantidades sea menor a 50:*

    ```sql
    SELECT "ProductID", SUM("Quantity") AS Total 
    FROM "OrderDetails"
    GROUP BY "ProductID"
    HAVING Total < 50 
    ORDER BY Total ASC NULLS LAST 
    LIMIT 20;
    ```

    ```sql
    sqlite> SELECT "ProductID", SUM("Quantity") AS Total 
    FROM "OrderDetails"
    GROUP BY "ProductID"
    HAVING Total < 50 
    ORDER BY Total ASC NULLS LAST 
    LIMIT 20;
    ```

5. *Obtener el producto con la mayor cantidad vendida:*

    ```sql
    SELECT "ProductID", SUM("Quantity") AS Total 
    FROM "OrderDetails"
    GROUP BY "ProductID"
    ORDER BY Total DESC NULLS LAST 
    LIMIT 1;
    ```

    ```sql
    sqlite> SELECT "ProductID", SUM("Quantity") AS Total 
    FROM "OrderDetails"
    GROUP BY "ProductID"
    ORDER BY Total DESC NULLS LAST 
    LIMIT 1;
    ```

**Resultado:**

```sql
31|458
```

---

#### ***Importante sobre SQL:***

- *No es posible usar una función de agregación como argumento de otra función de agregación directamente.*
- *`HAVING` solo puede usarse en conjunto con `GROUP BY`, ya que se aplica sobre grupos de datos, no sobre registros individuales.*

---

#### ***Orden de Ejecución de las Cláusulas en una Consulta SQL:***

1. **`SELECT`:** *Definimos las columnas que queremos seleccionar.*
2. **`FROM`:** *Indicamos las tablas de las que obtendremos los datos.*
3. **`WHERE`:** *Filtramos filas (registros) antes de agrupar.*
4. **`GROUP BY`:** *Agrupamos los registros en base a una o más columnas.*
5. **`HAVING`:** *Filtramos los grupos después de la agregación.*
6. **`ORDER BY`:** *Ordenamos los resultados en base a una o más columnas.*
7. **`LIMIT`:** *Limitamos la cantidad de registros que se muestran en el resultado.*

- *Este orden asegura que la consulta se ejecute de forma correcta y eficiente, obteniendo resultados precisos según los criterios establecidos.*

---

### ***Resumen del Orden de Ejecución en SQL:***

1. **`SELECT`:** *Se seleccionan las columnas.*
2. **`WHERE`:** *Se filtran las filas según las condiciones.*
3. **`GROUP BY`:** *Se agrupan los datos.*
4. **Funciones de agregación:** *Se aplican funciones como `COUNT`, `AVG`, `SUM`, etc.*
5. **`HAVING`:** *Se filtran los grupos (si es necesario).*
6. **`ORDER BY`:** *Se ordenan los resultados.*

*La clave para evitar errores es seguir este orden al escribir consultas SQL.*

---

#### ***Error Con `\`:***

```sql
SELECT CategoryID, ROUND(AVG(Price)) AS Promedio FROM Products \
WHERE CategoryID IS NOT NULL \
GROUP BY CategoryID \
HAVING Promedio > 40;
Error: in prepare, unrecognized token: "\" (1)
```

*se debe al uso de la barra invertida (`\`) para continuar la consulta en múltiples líneas. SQLite no reconoce la barra invertida como un carácter para dividir líneas, lo que genera el error. En SQLite, simplemente puedes escribir la consulta en varias líneas sin usar la barra invertida, y el intérprete de SQLite esperará a que completes la consulta con un punto y coma (`;`) antes de ejecutarla.*

---

### ***Cómo corregir el error***

1. **Escribir la consulta completa sin barras invertidas:**
   *Puedes escribir toda la consulta en una sola línea sin usar barras invertidas para evitar el error.*

   ```sql
   SELECT CategoryID, ROUND(AVG(Price)) AS Promedio 
   FROM Products 
   WHERE CategoryID IS NOT NULL 
   GROUP BY CategoryID 
   HAVING Promedio > 40;
   ```

2. **Permitir que SQLite continúe en la siguiente línea automáticamente:**
   *SQLite te permite escribir la consulta en varias líneas, y esperará hasta que termines con un punto y coma (`;`).*

   ```sql
   sqlite> SELECT CategoryID, ROUND(AVG(Price)) AS Promedio 
      ...> FROM Products 
      ...> WHERE CategoryID IS NOT NULL 
      ...> GROUP BY CategoryID 
      ...> HAVING Promedio > 40;
   ```

   ```sql
   sqlite>  SELECT CategoryID, ROUND(AVG(Price)) AS Promedio
   FROM Products
   WHERE CategoryID IS NOT NULL
   GROUP BY CategoryID
   HAVING Promedio > 40;
   6|46.0
   ```

### ***Resumen:***

*El error ocurre debido a las barras invertidas (`\`). SQLite no requiere barras invertidas para continuar una consulta en varias líneas. Simplemente elimina las barras invertidas y usa el formato estándar de múltiples líneas o una sola línea completa.*
