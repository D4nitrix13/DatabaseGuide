<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Funciones de Agregación***

*Las funciones de agregación en SQL permiten realizar cálculos sobre un conjunto de valores y devolver un solo valor. Algunas de las funciones más comunes son `COUNT`, `SUM`, `AVG`, `MIN`, y `MAX`. Estas funciones son útiles para obtener resúmenes y estadísticas sobre los datos almacenados en las tablas.*

1. **Consulta de múltiples columnas:**

    ```sql
    SELECT "FirstName", "LastName", "FirstName", "LastName" FROM Employees LIMIT 3;
    ```

    ```sql
    sqlite> SELECT "FirstName", "LastName", "FirstName", "LastName" FROM Employees LIMIT 3;
    Nancy|Davolio|Nancy|Davolio
    Andrew|Fuller|Andrew|Fuller
    Janet|Leverling|Janet|Leverling
    ```

    *En SQL, se permite repetir campos en una consulta, como en este caso, donde se seleccionan las columnas `FirstName` y `LastName` dos veces. Esto puede ser útil en ciertos casos para mantener el formato o realizar operaciones adicionales, aunque no es necesario a menos que haya un propósito específico. La consulta devolverá tres filas con los nombres y apellidos de los empleados, repitiendo las columnas seleccionadas.*

2. **Función `COUNT`:**

    ```sql
    SELECT COUNT(FirstName) FROM Employees;
    ```

    ```sql
    sqlite> SELECT COUNT(FirstName) FROM Employees;
    10
    ```

    *La función `COUNT` cuenta el número de filas donde la columna `FirstName` no es `NULL`. En este caso, hay 10 registros en la columna `FirstName`.*

    ```sql
    SELECT COUNT(FirstName) AS "Cantidad De Nombres" FROM Employees LIMIT 1;
    ```

    ```sql
    sqlite> SELECT COUNT(FirstName) AS "Cantidad De Nombres" FROM Employees LIMIT 1;
    10
    ```

    *Esta versión de la consulta asigna un alias (`Cantidad De Nombres`) al resultado de la función `COUNT`, lo que hace que la salida sea más descriptiva.*

3. **Función `SUM`:**

    ```sql
    SELECT SUM(Price) FROM Products;
    ```

    ```sql
    sqlite> SELECT SUM(Price) FROM Products;
    2222.71
    ```

    *La función `SUM` calcula la suma total de los valores en la columna `Price`, devolviendo en este caso 2222.71.*

4. **Función `AVG`:**

    ```sql
    SELECT AVG(Price) FROM Products;
    ```

    ```sql
    sqlite> SELECT AVG(Price) FROM Products;
    27.4408641975309
    ```

    *La función `AVG` devuelve el valor promedio de la columna `Price`, en este caso, 27.4408641975309.*

5. **Función `ROUND`:**

    *La función `ROUND` se usa para redondear un valor numérico. Puedes especificar el número de decimales a los que deseas redondear.*

    - *Redondear sin decimales:*

    ```sql
    SELECT ROUND(AVG(Price)) FROM Products;
    ```

    ```sql
    sqlite> SELECT ROUND(AVG(Price)) FROM Products;
    27.0
    ```

    - *Resultado: 27.0*

    - **Redondear con 5 decimales:**

    ```sql
    SELECT ROUND(AVG(Price), 5) AS Promedio FROM Products;
    ```

    ```sql
    sqlite> SELECT ROUND(AVG(Price), 5) AS Promedio FROM Products;
    27.44086
    ```

    - **Resultado: 27.44086**

    - **Redondear al valor por defecto:**

    ```sql
    SELECT ROUND(AVG(Price), 0) AS Promedio FROM Products;
    ```

    ```sql
    sqlite> SELECT ROUND(AVG(Price), 0) AS Promedio FROM Products;
    27.0
    ```

    - *Resultado: 27.0*

6. **Funciones `MIN` y `MAX`:**

- *La función `MIN` devuelve el valor mínimo de una columna.*

```sql
SELECT MIN(Price) AS PrecioMinimo FROM Products;
```

```sql
sqlite> SELECT MIN(Price) AS PrecioMinimo FROM Products;
0
```

- **Resultado: 0**

- *Podemos usar `MIN` junto con otras columnas para obtener información adicional:*

```sql
SELECT ProductName, MIN(Price) AS PrecioMinimo FROM Products WHERE ProductName IS NOT NULL;
```

```sql
sqlite> SELECT ProductName, MIN(Price) AS PrecioMinimo FROM Products WHERE ProductName IS NOT NULL;
Geitost|2.5
```

- *Resultado: Geitost | 2.5*

- *La función `MAX` devuelve el valor máximo de una columna.*

```sql
SELECT ProductName, MAX(Price) AS PrecioMaximo FROM Products;
```

```sql
sqlite> SELECT ProductName, MAX(Price) AS PrecioMaximo FROM Products;
Côte de Blaye|263.5
```

- *Resultado: Côte de Blaye | 263.5*

*Estas funciones de agregación son muy útiles para analizar datos, calcular totales, promedios y obtener información clave como el precio mínimo o máximo de los productos disponibles.*
