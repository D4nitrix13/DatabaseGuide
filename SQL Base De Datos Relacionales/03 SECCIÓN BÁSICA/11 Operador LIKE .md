<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Operador `LIKE` en SQL***

- *El operador `LIKE` es un operador de comparación que se utiliza en consultas SQL para buscar patrones específicos en los valores de una columna. Este operador es común en muchas bases de datos, aunque algunas como PostgreSQL ofrecen variaciones adicionales.*

---

## ***Comodines en SQL***

**En SQL estándar, hay dos comodines principales que se utilizan con el operador LIKE:**

1. **Porcentaje (`%`):** *Representa cualquier cadena de caracteres de cualquier longitud (incluidos cero caracteres).*
2. **Guion bajo (`_`):** *Representa un solo carácter.*

**Ejemplo:**

```sql
SELECT * FROM Employees WHERE LastName LIKE "FULLER";
```

```sql
sqlite> SELECT * FROM Employees WHERE LastName LIKE "FULLER";
2|Fuller|Andrew|1952-02-19|EmpID2.pic|Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.
```

### ***Casos de Uso del Operador `LIKE`***

1. **Búsqueda exacta (insensible a mayúsculas/minúsculas en SQLite):**
   - *La siguiente consulta devolverá los registros que coincidan con el apellido Fuller, independientemente de si está en mayúsculas o minúsculas.*

    ```sql
    SELECT * FROM Employees WHERE LastName LIKE "FULLER";
    ```

    ```sql
    sqlite> SELECT * FROM Employees WHERE LastName LIKE "FULLER";
    2|Fuller|Andrew|1952-02-19|EmpID2.pic|Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.
    ```

2. **Búsqueda con comodines:**
    - **Comodín `%` al final:** *Busca apellidos que comiencen con la letra `F`.*

    ```sql
    SELECT * FROM Employees WHERE LastName LIKE "F%";
    ```

    ```sql
    sqlite> SELECT * FROM Employees WHERE LastName LIKE "F%";
    2|Fuller|Andrew|1952-02-19|EmpID2.pic|Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.
    ```

    - **Comodín `%` al principio y al final:** *Busca apellidos que contengan la letra `R` en cualquier posición.*

    ```sql
    SELECT * FROM Employees WHERE LastName LIKE "%R%";
    ```

    ```sql
    sqlite> SELECT * FROM Employees WHERE LastName LIKE "%R%";
    2|Fuller|Andrew|1952-02-19|EmpID2.pic|Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.
    3|Leverling|Janet|1963-08-30|EmpID3.pic|Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.
    9|Dodsworth|Anne|1969-07-02|EmpID9.pic|Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.
    ```

    - **Comodín `_` para caracteres individuales:**  
      - *La consulta siguiente buscará apellidos que empiecen con `F`, seguido de cualquier carácter, y terminen en *R*.*

    ```sql
    SELECT * FROM Employees WHERE LastName LIKE "F____R";
    ```

    ```sql
    sqlite> SELECT * FROM Employees WHERE LastName LIKE "F____R";
    2|Fuller|Andrew|1952-02-19|EmpID2.pic|Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.
    ```

3. **Búsqueda inversa:**
    - *Puedes buscar patrones inversos utilizando `NOT LIKE`. Esto devolverá todos los registros cuyo apellido no coincida con el patrón indicado:*

    ```sql
    SELECT * FROM Employees WHERE LastName NOT LIKE "%";
    ```

    ```sql
    sqlite> SELECT * FROM Employees WHERE LastName NOT LIKE "%";
    ```

#### ***Ejemplo práctico***

**Considera la siguiente consulta que usa el operador `LIKE` para buscar todos los empleados cuyo apellido contiene una R:**

```sql
SELECT * FROM Employees WHERE LastName LIKE "%R%";
```

**Resultado esperado:**

```sql
2 | Fuller     | Andrew  | 1952-02-19 | EmpID2.pic
3 | Leverling  | Janet   | 1963-08-30 | EmpID3.pic
9 | Dodsworth  | Anne    | 1969-07-02 | EmpID9.pic
```

- **Esto muestra cómo el operador LIKE es una herramienta flexible para realizar búsquedas basadas en patrones en las bases de datos SQL.**
