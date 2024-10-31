<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***DISTINCT***

---

## ***¿Qué hace `DISTINCT` en SQL?***

- *El modificador `DISTINCT` se utiliza para eliminar los duplicados en los resultados de una consulta. Cuando una columna o combinación de columnas contiene valores repetidos, el uso de `DISTINCT` asegura que solo se devuelvan valores únicos.*

---

### ***Ejemplo y Explicación***

```sql
-- Consulta que selecciona todos los campos de la tabla 'users'
-- y elimina filas duplicadas. Devuelve solo las filas únicas.
SELECT DISTINCT * FROM users;
```

- **Explicación:** *Esta consulta selecciona todas las columnas de la tabla `users`. Si existen filas duplicadas (es decir, si hay dos o más filas que tengan exactamente los mismos valores en todas las columnas), solo se devolverá una de ellas.*

```sql
-- Consulta que selecciona únicamente la columna 'age'
-- y elimina las edades duplicadas, devolviendo una lista de edades únicas.
SELECT DISTINCT age FROM users;
```

- **Explicación:** *Esta consulta selecciona solo la columna `age` de la tabla `users` y elimina los valores duplicados, mostrando solo una lista de edades distintas. Por ejemplo, si hay varios usuarios con la misma edad, solo se devolverá un valor único para cada edad.*

---

### ***Resumen***

- *`DISTINCT` se usa para evitar duplicados en el resultado.*
- *Se puede aplicar a todas las columnas (con `*`) o a columnas específicas.*

---

### ***Comando DISTINCT MySQL***

```sql
mysql> SELECT DISTINCT name FROM users;
+----------+
| name     |
+----------+
| Daniel   |
| Benjamin |
| Danna    |
| Luna     |
| Isabella |
| Raquel   |
+----------+
6 rows in set (0.00 sec)
```

```sql
mysql> SELECT DISTINCT * FROM users;
+---------+----------+----------------+------+------------+----------------------+
| user_id | name     | surname        | age  | init_date  | email                |
+---------+----------+----------------+------+------------+----------------------+
|       1 | Daniel   | Perez Morales  |   18 | 2005-12-13 | d4nitrix13@gmail.com |
|       2 | Benjamin | NULL           |   21 | 2000-10-18 | NULL                 |
|       3 | Danna    | NULL           |   13 | 2003-02-04 | NULL                 |
|       4 | Luna     | Morales        |   23 | NULL       | NULL                 |
|       5 | Isabella | NULL           |   31 | NULL       | isabella@gmail.com   |
|       6 | Raquel   | Morales Gamboa |   28 | 1985-09-02 | raquel@gmail.com     |
+---------+----------+----------------+------+------------+----------------------+
6 rows in set (0.00 sec)
```

```sql
mysql> SELECT DISTINCT age FROM users;
+------+
| age  |
+------+
|   18 |
|   21 |
|   13 |
|   23 |
|   31 |
|   28 |
+------+
6 rows in set (0.00 sec)
```

---

### ***Comando DISTINCT PostgreSQL***

```sql
hello_postgresql=# SELECT DISTINCT * FROM users;
 user_id |   name   |    surname     | age | init_date  |        email
---------+----------+----------------+-----+------------+----------------------
       1 | Daniel   | Perez Morales  |  18 | 2005-12-13 | d4nitrix13@gmail.com
       5 | Isabella |                |  31 |            | isabella@gmail.com
       3 | Danna    |                |  13 | 2003-02-04 |
       6 | Raquel   | Morales Gamboa |  28 | 1985-09-02 | raquel@gmail.com
       2 | Benjamin |                |  21 | 2000-10-18 |
       4 | Luna     | Morales        |  23 |            |
(6 rows)
```

```sql
hello_postgresql=# SELECT DISTINCT age FROM users;
 age
-----
  21
  28
  31
  13
  18
  23
(6 rows)
```

```sql
hello_postgresql=# SELECT DISTINCT name FROM users;
   name
----------
 Danna
 Isabella
 Luna
 Daniel
 Benjamin
 Raquel
(6 rows)
```

---

### ***Comando DISTINCT SQLite3***

```sql
sqlite> SELECT DISTINCT * FROM users;
1|Daniel|Perez Morales|18|2005-12-13|d4nitrix13@gmail.com
2|Benjamin||21|2000-10-18|
3|Danna||13|2003-02-04|
4|Luna|Morales|23||
5|Isabella||31||isabella@gmail.com
6|Raquel|Morales Gamboa|28|1985-09-02|raquel@gmail.com
```

```sql
sqlite> SELECT DISTINCT age FROM users;
18
21
13
23
31
28
```

```sql
sqlite> SELECT DISTINCT name FROM users;
Daniel
Benjamin
Danna
Luna
Isabella
Raquel
```
