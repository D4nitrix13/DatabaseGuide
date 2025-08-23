<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***`AND`, `OR`, `NOT`***

- *En SQL, las cláusulas lógicas `AND`, `OR` y `NOT` se utilizan para combinar o modificar las condiciones de las consultas `WHERE`. Estas cláusulas permiten realizar filtrados más precisos al trabajar con múltiples condiciones.*

---

## ***1. `NOT`***

- **La cláusula `NOT` se usa para negar una condición. Si la condición es verdadera, `NOT` la convierte en falsa, y viceversa.**

---

### ***Ejemplos***

- ***MySQL** / **PostgreSQL** / **SQLite3**:*

```sql
-- Selecciona todos los registros de la tabla 'users' donde el correo electrónico NO es 'd4nitrix13@gmail.com'.
SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com';
```

- *Salida MySQL:*

```sql
mysql> SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com';
+---------+--------------+----------------+------+------------+--------------------+
| user_id | name         | surname        | age  | init_date  | email              |
+---------+--------------+----------------+------+------------+--------------------+
|       5 | Isabella     | NULL           |   31 | NULL       | isabella@gmail.com |
|       6 | Raquel       | Morales Gamboa |   28 | 1985-09-02 | raquel@gmail.com   |
|      11 | Coby         | Morales        |   18 | 2005-12-13 | coby@gmail.com     |
|      12 | Nuria Raquel | Morales Gamboa |   33 | 1988-09-02 | raquel@gmail.com   |
+---------+--------------+----------------+------+------------+--------------------+
4 rows in set (0.00 sec)
```

- *Salida PostgreSQL:*

```sql
hello_postgresql=# SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com';
 user_id |     name     |    surname     | age | init_date  |       email
---------+--------------+----------------+-----+------------+--------------------
       5 | Isabella     |                |  31 |            | isabella@gmail.com
       6 | Raquel       | Morales Gamboa |  28 | 1985-09-02 | raquel@gmail.com
       7 | Coby         | Morales        |  18 | 2005-12-13 | coby@gmail.com
       8 | Nuria Raquel | Morales Gamboa |  33 | 1988-09-02 | raquel@gmail.com
(4 rows)
```

- *Salida SQLite3:*

```sql
sqlite> SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com';
5|Isabella||31||isabella@gmail.com
6|Raquel|Morales Gamboa|28|1985-09-02|raquel@gmail.com
7|Coby|Morales|18|2005-12-13|coby@gmail.com
8|Nuria Raquel|Morales Gamboa|33|1988-09-02|raquel@gmail.com
```

- *En este ejemplo, se seleccionan todos los usuarios excepto el que tiene el correo electrónico `d4nitrix13@gmail.com`.*

---

## ***2. `AND`***

- *La cláusula `AND` se utiliza para combinar varias condiciones. Ambas (o más) condiciones deben ser verdaderas para que el registro sea seleccionado.*

---

### ***Ejemplos:***

- ***MySQL** / **PostgreSQL** / **SQLite3**:*

```sql
-- Selecciona todos los registros donde el correo electrónico NO es 'd4nitrix13@gmail.com' y la edad es igual a 28.
SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' AND age = 28;
```

- *Salida MySQL:*

```sql
mysql> SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' AND age = 28;
+---------+--------+----------------+------+------------+------------------+
| user_id | name   | surname        | age  | init_date  | email            |
+---------+--------+----------------+------+------------+------------------+
|       6 | Raquel | Morales Gamboa |   28 | 1985-09-02 | raquel@gmail.com |
+---------+--------+----------------+------+------------+------------------+
1 row in set (0.00 sec)
```

- *Salida PostgreSQL:*

```sql
hello_postgresql=# SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' AND age = 28;
 user_id |  name  |    surname     | age | init_date  |      email
---------+--------+----------------+-----+------------+------------------
       6 | Raquel | Morales Gamboa |  28 | 1985-09-02 | raquel@gmail.com
(1 row)
```

- *Salida SQLite3:*

```sql
sqlite> SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' AND age = 28;
6|Raquel|Morales Gamboa|28|1985-09-02|raquel@gmail.com
```

- *Aquí, se seleccionan los usuarios cuyo correo no es `d4nitrix13@gmail.com` **y** cuya edad es exactamente 28.*

```sql
-- Selecciona todos los registros donde el correo electrónico NO es 'd4nitrix13@gmail.com' y la edad es mayor que 28.
SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' AND age > 28;
```

- *Salida MySQL:*

```sql
mysql> SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' AND age > 28;
+---------+--------------+----------------+------+------------+--------------------+
| user_id | name         | surname        | age  | init_date  | email              |
+---------+--------------+----------------+------+------------+--------------------+
|       5 | Isabella     | NULL           |   31 | NULL       | isabella@gmail.com |
|      12 | Nuria Raquel | Morales Gamboa |   33 | 1988-09-02 | raquel@gmail.com   |
+---------+--------------+----------------+------+------------+--------------------+
2 rows in set (0.00 sec)
```

- *Salida PostgreSQL:*

```sql
hello_postgresql=# SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' AND age > 28;
 user_id |     name     |    surname     | age | init_date  |       email
---------+--------------+----------------+-----+------------+--------------------
       5 | Isabella     |                |  31 |            | isabella@gmail.com
       8 | Nuria Raquel | Morales Gamboa |  33 | 1988-09-02 | raquel@gmail.com
(2 rows)
```

- *Salida SQLite3:*

```sql
sqlite> SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' AND age > 28;
5|Isabella||31||isabella@gmail.com
8|Nuria Raquel|Morales Gamboa|33|1988-09-02|raquel@gmail.com
```

- *Este ejemplo filtra los usuarios cuyo correo no es `d4nitrix13@gmail.com` **y** cuya edad es mayor de 28.*

---

## ***3. `OR`***

- *La cláusula `OR` se utiliza para seleccionar registros si **al menos una** de las condiciones es verdadera.*

---

### ***Ejemplos OR***

- ***MySQL** / **PostgreSQL** / **SQLite3**:*

```sql
-- Selecciona todos los registros donde el correo electrónico NO es 'd4nitrix13@gmail.com' O la edad es igual a 28.
SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' OR age = 28;
```

- *Salida MySQL:*

```sql
mysql> SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' OR age = 28;
+---------+--------------+----------------+------+------------+--------------------+
| user_id | name         | surname        | age  | init_date  | email              |
+---------+--------------+----------------+------+------------+--------------------+
|       5 | Isabella     | NULL           |   31 | NULL       | isabella@gmail.com |
|       6 | Raquel       | Morales Gamboa |   28 | 1985-09-02 | raquel@gmail.com   |
|      11 | Coby         | Morales        |   18 | 2005-12-13 | coby@gmail.com     |
|      12 | Nuria Raquel | Morales Gamboa |   33 | 1988-09-02 | raquel@gmail.com   |
+---------+--------------+----------------+------+------------+--------------------+
4 rows in set (0.00 sec)
```

- *Salida PostgreSQL:*

```sql
hello_postgresql=# SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' OR age = 28;
 user_id |     name     |    surname     | age | init_date  |       email
---------+--------------+----------------+-----+------------+--------------------
       5 | Isabella     |                |  31 |            | isabella@gmail.com
       6 | Raquel       | Morales Gamboa |  28 | 1985-09-02 | raquel@gmail.com
       7 | Coby         | Morales        |  18 | 2005-12-13 | coby@gmail.com
       8 | Nuria Raquel | Morales Gamboa |  33 | 1988-09-02 | raquel@gmail.com
(4 rows)
```

- *Salida SQLite3:*

```sql
sqlite> SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' OR age = 28;
5|Isabella||31||isabella@gmail.com
6|Raquel|Morales Gamboa|28|1985-09-02|raquel@gmail.com
7|Coby|Morales|18|2005-12-13|coby@gmail.com
8|Nuria Raquel|Morales Gamboa|33|1988-09-02|raquel@gmail.com
```

- *En este caso, se seleccionan los usuarios cuyo correo no es `d4nitrix13@gmail.com` **o** aquellos cuya edad es exactamente 28. Solo una de las dos condiciones necesita cumplirse.*

---

### ***Resumen***

- **`NOT`:** *Invierte la condición.*
- **`AND`:** *Ambas condiciones deben cumplirse para que el registro sea seleccionado.*
- **`OR`:** *Solo una de las condiciones debe ser verdadera para que el registro sea seleccionado.*

- *Estos operadores lógicos son compatibles con MySQL, PostgreSQL y SQLite, y se utilizan de manera similar en todos estos sistemas.*
