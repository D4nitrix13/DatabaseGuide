<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***`LIKE`***

> [!NOTE]
> *La cláusula `LIKE` se utiliza en SQL para buscar un patrón específico dentro de una columna de texto. Es útil cuando no conocemos el valor exacto que estamos buscando, pero tenemos una idea parcial del contenido. Se usa comúnmente con los comodines `%` y `_`.*

---

## ***Comodines en `LIKE`***

- **`%` (porcentaje):** *Representa cualquier secuencia de caracteres (incluyendo una cadena vacía). Puede utilizarse al principio, en medio o al final de la cadena que se busca.*
  
  **Ejemplos:**
  - `LIKE '%gmail.com'` *busca todos los correos electrónicos que terminen con "gmail.com".*
  - `LIKE 'D%'` *encuentra todas las cadenas que comiencen con "D".*

- **`_` (guion bajo):** *Representa exactamente un carácter único. Es útil cuando necesitas buscar patrones que tengan una longitud fija pero pueden variar en un solo carácter.*
  
  **Ejemplo:**
  - *`LIKE 'D_n%'` buscaría todas las cadenas que comiencen con "D", luego tengan cualquier letra en la segunda posición, seguida de "n".*

---

### ***Ejemplos de consultas con `LIKE`***

**Supongamos que tienes una tabla llamada `users` con la siguiente información:**

- **MySQL**

```sql
+---------+--------------+----------------+------+------------+----------------------+
| user_id | name         | surname        | age  | init_date  | email                |
+---------+--------------+----------------+------+------------+----------------------+
|       1 | Daniel       | Perez Morales  |   18 | 2005-12-13 | d4nitrix13@gmail.com |
|       2 | Benjamin     | NULL           |   21 | 2000-10-18 | NULL                 |
|       3 | Danna        | NULL           |   13 | 2003-02-04 | NULL                 |
|       4 | Luna         | Morales        |   23 | NULL       | NULL                 |
|       5 | Isabella     | NULL           |   31 | NULL       | isabella@gmail.com   |
|       6 | Raquel       | Morales Gamboa |   28 | 1985-09-02 | raquel@gmail.com     |
|      11 | Coby         | Morales        |   18 | 2005-12-13 | coby@gmail.com       |
|      12 | Nuria Raquel | Morales Gamboa |   33 | 1988-09-02 | raquel@gmail.com     |
+---------+--------------+----------------+------+------------+----------------------+
```

- **PostgreSQL**

```sql
 user_id |     name     |    surname     | age | init_date  |        email
---------+--------------+----------------+-----+------------+----------------------
       1 | Daniel       | Perez Morales  |  18 | 2005-12-13 | d4nitrix13@gmail.com
       2 | Benjamin     |                |  21 | 2000-10-18 |
       3 | Danna        |                |  13 | 2003-02-04 |
       4 | Luna         | Morales        |  23 |            |
       5 | Isabella     |                |  31 |            | isabella@gmail.com
       6 | Raquel       | Morales Gamboa |  28 | 1985-09-02 | raquel@gmail.com
       7 | Coby         | Morales        |  18 | 2005-12-13 | coby@gmail.com
       8 | Nuria Raquel | Morales Gamboa |  33 | 1988-09-02 | raquel@gmail.com
(8 rows)
```

- **SQLite3**

```sql
1|Daniel|Perez Morales|18|2005-12-13|d4nitrix13@gmail.com
2|Benjamin||21|2000-10-18|
3|Danna||13|2003-02-04|
4|Luna|Morales|23||
5|Isabella||31||isabella@gmail.com
6|Raquel|Morales Gamboa|28|1985-09-02|raquel@gmail.com
7|Coby|Morales|18|2005-12-13|coby@gmail.com
8|Nuria Raquel|Morales Gamboa|33|1988-09-02|raquel@gmail.com
```

---

### ***Ejemplos en MySQL, PostgreSQL y SQLite***

1. **Buscar todos los correos electrónicos que terminen en `@gmail.com`:**

   ```sql
   SELECT * FROM users WHERE email LIKE '%@gmail.com';
   ```

    - **Salida MySQL**

    ```sql
    mysql> SELECT * FROM users WHERE email LIKE '%@gmail.com';
    +---------+--------------+----------------+------+------------+----------------------+
    | user_id | name         | surname        | age  | init_date  | email                |
    +---------+--------------+----------------+------+------------+----------------------+
    |       1 | Daniel       | Perez Morales  |   18 | 2005-12-13 | d4nitrix13@gmail.com |
    |       5 | Isabella     | NULL           |   31 | NULL       | isabella@gmail.com   |
    |       6 | Raquel       | Morales Gamboa |   28 | 1985-09-02 | raquel@gmail.com     |
    |      11 | Coby         | Morales        |   18 | 2005-12-13 | coby@gmail.com       |
    |      12 | Nuria Raquel | Morales Gamboa |   33 | 1988-09-02 | raquel@gmail.com     |
    +---------+--------------+----------------+------+------------+----------------------+
    5 rows in set (0.00 sec)
    ```

    - **Salida PostgreSQL**

    ```sql
    hello_postgresql=# SELECT * FROM users WHERE email LIKE '%@gmail.com';
     user_id |     name     |    surname     | age | init_date  |        email
    ---------+--------------+----------------+-----+------------+----------------------
           1 | Daniel       | Perez Morales  |  18 | 2005-12-13 | d4nitrix13@gmail.com
           5 | Isabella     |                |  31 |            | isabella@gmail.com
           6 | Raquel       | Morales Gamboa |  28 | 1985-09-02 | raquel@gmail.com
           7 | Coby         | Morales        |  18 | 2005-12-13 | coby@gmail.com
           8 | Nuria Raquel | Morales Gamboa |  33 | 1988-09-02 | raquel@gmail.com
    (5 rows)
    ```

    - **Salida SQLite3**

    ```sql
    sqlite> SELECT * FROM users WHERE email LIKE '%@gmail.com';
    1|Daniel|Perez Morales|18|2005-12-13|d4nitrix13@gmail.com
    5|Isabella||31||isabella@gmail.com
    6|Raquel|Morales Gamboa|28|1985-09-02|raquel@gmail.com
    7|Coby|Morales|18|2005-12-13|coby@gmail.com
    8|Nuria Raquel|Morales Gamboa|33|1988-09-02|raquel@gmail.com
    ```

   - *Esto devolverá todos los registros donde el correo electrónico termina en "@gmail.com", independientemente de lo que venga antes.*

2. **Buscar todos los correos electrónicos que contengan cualquier dominio y terminen en `.com`:**

   ```sql
   SELECT * FROM users WHERE email LIKE '%@%.com';
   ```

    - **Salida MySQL**

    ```sql
    mysql> SELECT * FROM users WHERE email LIKE '%@%.com';
    +---------+--------------+----------------+------+------------+----------------------+
    | user_id | name         | surname        | age  | init_date  | email                |
    +---------+--------------+----------------+------+------------+----------------------+
    |       1 | Daniel       | Perez Morales  |   18 | 2005-12-13 | d4nitrix13@gmail.com |
    |       5 | Isabella     | NULL           |   31 | NULL       | isabella@gmail.com   |
    |       6 | Raquel       | Morales Gamboa |   28 | 1985-09-02 | raquel@gmail.com     |
    |      11 | Coby         | Morales        |   18 | 2005-12-13 | coby@gmail.com       |
    |      12 | Nuria Raquel | Morales Gamboa |   33 | 1988-09-02 | raquel@gmail.com     |
    +---------+--------------+----------------+------+------------+----------------------+
    5 rows in set (0.00 sec)
    ```

    - **Salida PostgreSQL**

    ```sql
    hello_postgresql=# SELECT * FROM users WHERE email LIKE '%@%.com';
     user_id |     name     |    surname     | age | init_date  |        email
    ---------+--------------+----------------+-----+------------+----------------------
           1 | Daniel       | Perez Morales  |  18 | 2005-12-13 | d4nitrix13@gmail.com
           5 | Isabella     |                |  31 |            | isabella@gmail.com
           6 | Raquel       | Morales Gamboa |  28 | 1985-09-02 | raquel@gmail.com
           7 | Coby         | Morales        |  18 | 2005-12-13 | coby@gmail.com
           8 | Nuria Raquel | Morales Gamboa |  33 | 1988-09-02 | raquel@gmail.com
    (5 rows)
    ```

    - **Salida SQLite3**

    ```sql
    sqlite> SELECT * FROM users WHERE email LIKE '%@%.com';
    1|Daniel|Perez Morales|18|2005-12-13|d4nitrix13@gmail.com
    5|Isabella||31||isabella@gmail.com
    6|Raquel|Morales Gamboa|28|1985-09-02|raquel@gmail.com
    7|Coby|Morales|18|2005-12-13|coby@gmail.com
    8|Nuria Raquel|Morales Gamboa|33|1988-09-02|raquel@gmail.com
    ```

   - *Esta consulta devolverá todos los correos electrónicos que contengan un "@" seguido de cualquier dominio, y que terminen en ".com".*

3. **Buscar nombres que comiencen con "D" y tengan exactamente 5 caracteres:**

   ```sql
   SELECT * FROM users WHERE name LIKE 'D____';
   ```

    - **Salida MySQL**

    ```sql
    mysql> SELECT * FROM users WHERE name LIKE 'D____';
    +---------+-------+---------+------+------------+-------+
    | user_id | name  | surname | age  | init_date  | email |
    +---------+-------+---------+------+------------+-------+
    |       3 | Danna | NULL    |   13 | 2003-02-04 | NULL  |
    +---------+-------+---------+------+------------+-------+
    1 row in set (0.00 sec)
    ```

    - **Salida PostgreSQL**

    ```sql
    hello_postgresql=# SELECT * FROM users WHERE name LIKE 'D____';
     user_id | name  | surname | age | init_date  | email
    ---------+-------+---------+-----+------------+-------
           3 | Danna |         |  13 | 2003-02-04 |
    (1 row)
    ```

    - **Salida SQLite3**

    ```sql
    sqlite> SELECT * FROM users WHERE name LIKE 'D____';
    3|Danna||13|2003-02-04|
    ```

   - *Este ejemplo usa el guion bajo (`_`) para indicar que el nombre debe tener exactamente 5 caracteres, comenzando con "D". Encontrará nombres como "Daniel" o "Danna", pero no "Dani" o "David".*

*En resumen, la cláusula `LIKE` es útil para hacer búsquedas flexibles en columnas de texto, y los comodines `%` y `_` permiten afinar los patrones de búsqueda dependiendo de la situación.*
