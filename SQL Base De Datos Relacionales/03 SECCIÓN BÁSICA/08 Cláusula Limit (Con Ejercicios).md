<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Cláusula `LIMIT` (Con Ejercicios)***

- *La cláusula `LIMIT` en SQL se utiliza para especificar la cantidad máxima de registros que deben devolverse en el resultado de una consulta. Esto es útil para evitar que se devuelvan demasiados registros, especialmente en bases de datos grandes, y permite manejar de manera más efectiva los resultados, como en la paginación.*

---

## ***Ejemplos***

---

### ***Ejemplo 1: Filtrar Clientes por ID y País***

```sql
SELECT * FROM "Customers" 
WHERE "CustomerID" >= 50 
AND NOT "Country" = "Germany" 
AND NOT "Country" = "UK" 
AND NOT "Country" = "Argentina" 
AND NOT "Country" = "Mexico" 
AND NOT "Country" = "France" 
LIMIT 5;
```

**Salida:**

```sql
sqlite> SELECT * FROM "Customers" WHERE "CustomerID" >= 50 AND NOT "Country" = "Germany" AND NOT "Country" = "UK" AND NOT "Country" = "Argentina" AND NOT "Country" = "Mexico" AND NOT "Country" = "France" LIMIT 5;
50|Maison Dewey|Catherine Dewey|Rue Joseph-Bens 532|Bruxelles|B-1180|Belgium
51|Mère Paillarde|Jean Fresnière|43 rue St. Laurent|Montréal|H1J 1C3|Canada
55|Old World Delicatessen|Rene Phillips|2743 Bering St.|Anchorage|99508|USA
59|Piccolo und mehr|Georg Pipps|Geislweg 14|Salzburg|5020|Austria
60|Princesa Isabel Vinhoss|Isabel de Castro|Estrada da saúde n. 58|Lisboa|1756|Portugal
```

**Explicación:**

- *Esta consulta devuelve un máximo de 5 registros de la tabla "Customers" donde el `CustomerID` es mayor o igual a 50 y el país no es Alemania, Reino Unido, Argentina, México ni Francia.*
- *La cláusula `LIMIT 5` asegura que solo se muestren 5 resultados, incluso si hay más que cumplen las condiciones.*

---

### ***Ejemplo 2: Filtrar Productos por ID de Categoría y Proveedor***

```sql
SELECT * FROM "Products" 
WHERE NOT "CategoryID" = 6 
AND NOT "SupplierID" = 1 
AND "Price" <= 30 
LIMIT 3;
```

**Salida:**

```sql
sqlite> SELECT * FROM "Products" WHERE NOT "CategoryID" = 6 AND NOT "SupplierID" = 1 AND "Price" <= 30 LIMIT 3;
4|Chef Anton's Cajun Seasoning|2|2|48 - 6 oz jars|22
5|Chef Anton's Gumbo Mix|2|2|36 boxes|21.35
6|Grandma's Boysenberry Spread|3|2|12 - 8 oz jars|25
```

**Explicación:**

- *Esta consulta devuelve un máximo de 3 productos de la tabla "Products" que no pertenecen a la categoría 6, no son suministrados por el proveedor 1, y cuyo precio es menor o igual a 30.*
- *Nuevamente, `LIMIT 3` garantiza que no se devuelvan más de 3 resultados.*

---

### ***Ejemplo 3: Seleccionar Productos Aleatorios***

```sql
SELECT * FROM "Products" 
WHERE NOT "CategoryID" = 6 
AND NOT "SupplierID" = 1 
AND "Price" <= 30 
ORDER BY RANDOM() 
LIMIT 3;
```

**Salida:**

```sql
sqlite> SELECT * FROM "Products" WHERE NOT "CategoryID" = 6 AND NOT "SupplierID" = 1 AND "Price" <= 30 ORDER BY RANDOM() LIMIT 3;
16|Pavlova|7|3|32 - 500 g boxes|17.45
34|Sasquatch Ale|16|1|24 - 12 oz bottles|14
65|Louisiana Fiery Hot Pepper Sauce|2|2|32 - 8 oz bottles|21.05
```

**Explicación:**

- *En esta consulta, se seleccionan hasta 3 productos que no pertenecen a la categoría 6, no son suministrados por el proveedor 1, y cuyo precio es menor o igual a 30.*
- *La cláusula `ORDER BY RANDOM()` se utiliza para devolver resultados en un orden aleatorio antes de aplicar `LIMIT 3`, lo que resulta en una selección de productos de manera no predecible.*

---

## ***Conclusión***

> [!NOTE]
> *La cláusula `LIMIT` es una herramienta poderosa en SQL que permite gestionar la cantidad de datos devueltos en las consultas. Al combinar `LIMIT` con condiciones de filtrado, puedes optimizar tus consultas para obtener solo los resultados relevantes y deseados. Esto es especialmente útil en aplicaciones que manejan grandes volúmenes de datos, donde el rendimiento y la legibilidad de los resultados son cruciales. Si tienes más preguntas o necesitas más ejemplos, ¡no dudes en preguntar!*
