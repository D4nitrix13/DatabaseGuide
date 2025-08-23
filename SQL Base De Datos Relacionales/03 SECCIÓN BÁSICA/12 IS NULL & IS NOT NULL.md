<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Operadores `IS NULL` & `IS NOT NULL` en SQL***

- *Los operadores `IS NULL` y `IS NOT NULL` se utilizan en SQL para verificar si un valor en una columna es `nulo` o no. Un valor `NULL` indica la ausencia de un valor en la base de datos.*

## Uso del Operador `IS NULL`

- *El operador `IS NULL` se utiliza para filtrar registros donde el valor de una columna es nulo.*

**Ejemplo:**

```sql
SELECT * FROM Products WHERE ProductName IS NULL ORDER BY ProductName ASC LIMIT 5;
```

- *Esto selecciona todos los registros donde el campo ProductName es `NULL`, los ordena de forma ascendente y limita el resultado a 5 registros.*

**Resultado:**

```sql
78|||||0
80|||3||0
81|||6||0
82|||9||0
```

- *En este caso, los registros 78, 80, 81 y 82 tienen un valor `NULL` en la columna ProductName.*

### ***Uso del Operador `IS NOT NULL`***

- **Por el contrario, el operador `IS NOT NULL` selecciona los registros donde el valor de la columna no es nulo.**

**Ejemplo:**

```sql
SELECT * FROM Products WHERE ProductName IS NOT NULL ORDER BY ProductName ASC LIMIT 5;
```

- *Este ejemplo devuelve los primeros 5 registros donde ProductName tiene un valor válido (no nulo).*

**Resultado:**

```sql
17|Alice Mutton|7|6|20 - 1 kg tins|39
3|Aniseed Syrup|1|2|12 - 550 ml bottles|10
40|Boston Crab Meat|19|8|24 - 4 oz tins|18.4
60|Camembert Pierrot|28|4|15 - 300 g rounds|34
18|Carnarvon Tigers|7|8|16 kg pkg.|62.5
```

### ***Ordenamiento y Condiciones en SQL***

*Las condiciones como `IS NULL` y `IS NOT NULL` van antes de la cláusula `ORDER BY`.* *En estos ejemplos, la consulta selecciona los productos basándose en la condición del campo `ProductName`, y luego ordena el resultado por el nombre del producto.*

### ***Comparación de Resultados***

- *- **`IS NULL`**: Selecciona registros donde el campo ProductName no tiene valor asignado (`NULL`).*
- *- **`IS NOT NULL`**: Selecciona registros donde el campo ProductName tiene un valor asignado.*

*Ambos operadores son útiles para gestionar y consultar datos incompletos o nulos dentro de una base de datos.*
