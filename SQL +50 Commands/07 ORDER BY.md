<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***`ORDER BY`***

> [!NOTE]
> *La cláusula `ORDER BY` en SQL se utiliza para ordenar los resultados de una consulta en función de una o más columnas. Es particularmente útil cuando se necesita presentar los datos en un orden específico, como ascendente o descendente, basado en una columna determinada.*

---

## ***MySQL***

```sql
SELECT * FROM users ORDER BY age;
```

```sql
mysql> SELECT * FROM users ORDER BY age;
+---------+--------------+----------------+------+------------+----------------------+
| user_id | name         | surname        | age  | init_date  | email                |
+---------+--------------+----------------+------+------------+----------------------+
|       3 | Danna        | NULL           |   13 | 2003-02-04 | NULL                 |
|       1 | Daniel       | Perez Morales  |   18 | 2005-12-13 | d4nitrix13@gmail.com |
|      11 | Coby         | Morales        |   18 | 2005-12-13 | coby@gmail.com       |
|       2 | Benjamin     | NULL           |   21 | 2000-10-18 | NULL                 |
|       4 | Luna         | Morales        |   23 | NULL       | NULL                 |
|       6 | Raquel       | Morales Gamboa |   28 | 1985-09-02 | raquel@gmail.com     |
|       5 | Isabella     | NULL           |   31 | NULL       | isabella@gmail.com   |
+---------+--------------+----------------+------+------------+----------------------+
8 rows in set (0.01 sec)
```

*Esta consulta selecciona todos los registros de la tabla `users` y los ordena por la columna `age` de manera ascendente, ya que, de forma predeterminada, `ORDER BY` organiza los datos en orden ascendente si no se especifica lo contrario.*

```sql
SELECT * FROM users ORDER BY age ASC;
```

```sql
mysql> SELECT * FROM users ORDER BY age ASC;
+---------+--------------+----------------+------+------------+----------------------+
| user_id | name         | surname        | age  | init_date  | email                |
+---------+--------------+----------------+------+------------+----------------------+
|       3 | Danna        | NULL           |   13 | 2003-02-04 | NULL                 |
|       1 | Daniel       | Perez Morales  |   18 | 2005-12-13 | d4nitrix13@gmail.com |
|      11 | Coby         | Morales        |   18 | 2005-12-13 | coby@gmail.com       |
|       2 | Benjamin     | NULL           |   21 | 2000-10-18 | NULL                 |
|       4 | Luna         | Morales        |   23 | NULL       | NULL                 |
|       6 | Raquel       | Morales Gamboa |   28 | 1985-09-02 | raquel@gmail.com     |
|       5 | Isabella     | NULL           |   31 | NULL       | isabella@gmail.com   |
+---------+--------------+----------------+------+------------+----------------------+
8 rows in set (0.01 sec)
```

- *Esta consulta hace explícito que los datos deben ordenarse por la columna `age` en orden ascendente (`ASC`), aunque el comportamiento sería el mismo que en la consulta anterior.*

```sql
SELECT * FROM users ORDER BY age DESC;
```

```sql
mysql> SELECT * FROM users ORDER BY age DESC;
+---------+--------------+----------------+------+------------+----------------------+
| user_id | name         | surname        | age  | init_date  | email                |
+---------+--------------+----------------+------+------------+----------------------+
|       5 | Isabella     | NULL           |   31 | NULL       | isabella@gmail.com   |
|       6 | Raquel       | Morales Gamboa |   28 | 1985-09-02 | raquel@gmail.com     |
|       4 | Luna         | Morales        |   23 | NULL       | NULL                 |
|       2 | Benjamin     | NULL           |   21 | 2000-10-18 | NULL                 |
|       1 | Daniel       | Perez Morales  |   18 | 2005-12-13 | d4nitrix13@gmail.com |
|      11 | Coby         | Morales        |   18 | 2005-12-13 | coby@gmail.com       |
|       3 | Danna        | NULL           |   13 | 2003-02-04 | NULL                 |
+---------+--------------+----------------+------+------------+----------------------+
8 rows in set (0.00 sec)
```

- *Aquí, los registros se ordenan por la columna `age` en orden descendente (`DESC`), mostrando primero a los usuarios de mayor edad.*

```sql
INSERT INTO users (name, surname, age, init_date, email) 
VALUES ('Nuria Raquel', 'Morales Gamboa', 33, '1988-09-02', 'raquel@gmail.com');
```

```sql
mysql> INSERT INTO users (name, surname, age, init_date, email) 
VALUES ('Nuria Raquel', 'Morales Gamboa', 33, '1988-09-02', 'raquel@gmail.com');
Query OK, 1 row affected (0.01 sec)
```

- *Este comando inserta un nuevo usuario en la tabla `users` con los valores proporcionados.*

```sql
SELECT * FROM users WHERE email = 'raquel@gmail.com' ORDER BY age DESC;
```

```sql
mysql> SELECT * FROM users WHERE email = 'raquel@gmail.com' ORDER BY age DESC;
+---------+--------------+----------------+------+------------+------------------+
| user_id | name         | surname        | age  | init_date  | email            |
+---------+--------------+----------------+------+------------+------------------+
|      12 | Nuria Raquel | Morales Gamboa |   33 | 1988-09-02 | raquel@gmail.com |
|       6 | Raquel       | Morales Gamboa |   28 | 1985-09-02 | raquel@gmail.com |
+---------+--------------+----------------+------+------------+------------------+
2 rows in set (0.00 sec)
```

- *Esta consulta selecciona todos los registros de la tabla `users` donde el correo electrónico sea `'raquel@gmail.com'` y los ordena por la columna `age` en orden descendente, mostrando el usuario más viejo en primer lugar.*

---

### ***PostgreSQL***

- **El comportamiento de `ORDER BY` en PostgreSQL es idéntico al de MySQL. Las consultas funcionan de la misma manera:**

```sql
SELECT * FROM users ORDER BY age;
```

```sql
SELECT * FROM users ORDER BY age ASC;
```

```sql
SELECT * FROM users ORDER BY age DESC;
```

```sql
hello_postgresql=# SELECT * FROM users ORDER BY age;
 user_id |     name     |    surname     | age | init_date  |        email
---------+--------------+----------------+-----+------------+----------------------
       3 | Danna        |                |  13 | 2003-02-04 |
       7 | Coby         | Morales        |  18 | 2005-12-13 | coby@gmail.com
       1 | Daniel       | Perez Morales  |  18 | 2005-12-13 | d4nitrix13@gmail.com
       2 | Benjamin     |                |  21 | 2000-10-18 |
       4 | Luna         | Morales        |  23 |            |
       6 | Raquel       | Morales Gamboa |  28 | 1985-09-02 | raquel@gmail.com
       5 | Isabella     |                |  31 |            | isabella@gmail.com
(7 rows)
```

```sql
hello_postgresql=# SELECT * FROM users ORDER BY age ASC;
 user_id |     name     |    surname     | age | init_date  |        email
---------+--------------+----------------+-----+------------+----------------------
       3 | Danna        |                |  13 | 2003-02-04 |
       7 | Coby         | Morales        |  18 | 2005-12-13 | coby@gmail.com
       1 | Daniel       | Perez Morales  |  18 | 2005-12-13 | d4nitrix13@gmail.com
       2 | Benjamin     |                |  21 | 2000-10-18 |
       4 | Luna         | Morales        |  23 |            |
       6 | Raquel       | Morales Gamboa |  28 | 1985-09-02 | raquel@gmail.com
       5 | Isabella     |                |  31 |            | isabella@gmail.com
       8 | Nuria Raquel | Morales Gamboa |  33 | 1988-09-02 | raquel@gmail.com
(7 rows)
```

```sql
hello_postgresql=# SELECT * FROM users ORDER BY age DESC;
 user_id |     name     |    surname     | age | init_date  |        email
---------+--------------+----------------+-----+------------+----------------------
       5 | Isabella     |                |  31 |            | isabella@gmail.com
       6 | Raquel       | Morales Gamboa |  28 | 1985-09-02 | raquel@gmail.com
       4 | Luna         | Morales        |  23 |            |
       2 | Benjamin     |                |  21 | 2000-10-18 |
       1 | Daniel       | Perez Morales  |  18 | 2005-12-13 | d4nitrix13@gmail.com
       7 | Coby         | Morales        |  18 | 2005-12-13 | coby@gmail.com
       3 | Danna        |                |  13 | 2003-02-04 |
(7 rows)
```

```sql
INSERT INTO users (name, surname, age, init_date, email) 
VALUES ('Nuria Raquel', 'Morales Gamboa', 33, '1988-09-02', 'raquel@gmail.com');
```

```sql
hello_postgresql=# INSERT INTO users (name, surname, age, init_date, email) 
VALUES ('Nuria Raquel', 'Morales Gamboa', 33, '1988-09-02', 'raquel@gmail.com');
INSERT 0 1
```

- *Este comando inserta el mismo registro en PostgreSQL, con la diferencia en el mensaje de éxito que indica cuántas filas han sido afectadas.*

```sql
SELECT * FROM users WHERE email = 'raquel@gmail.com' ORDER BY age DESC;
```

```sql
hello_postgresql=# SELECT * FROM users WHERE email = 'raquel@gmail.com' ORDER BY age DESC;
 user_id |     name     |    surname     | age | init_date  |      email
---------+--------------+----------------+-----+------------+------------------
       8 | Nuria Raquel | Morales Gamboa |  33 | 1988-09-02 | raquel@gmail.com
       6 | Raquel       | Morales Gamboa |  28 | 1985-09-02 | raquel@gmail.com
(2 rows)
```

---

#### ***SQLite3***

- *En SQLite3, `ORDER BY` también funciona de manera idéntica a MySQL y PostgreSQL. Las siguientes consultas son equivalentes:*

```sql
SELECT * FROM users ORDER BY age;
```

```sql
SELECT * FROM users ORDER BY age ASC;
```

```sql
SELECT * FROM users ORDER BY age DESC;
```

```sql
sqlite> SELECT * FROM users ORDER BY age;
3|Danna||13|2003-02-04|
1|Daniel|Perez Morales|18|2005-12-13|d4nitrix13@gmail.com
7|Coby|Morales|18|2005-12-13|coby@gmail.com
2|Benjamin||21|2000-10-18|
4|Luna|Morales|23||
6|Raquel|Morales Gamboa|28|1985-09-02|raquel@gmail.com
5|Isabella||31||isabella@gmail.com
```

```sql
sqlite> SELECT * FROM users ORDER BY age ASC;
3|Danna||13|2003-02-04|
1|Daniel|Perez Morales|18|2005-12-13|d4nitrix13@gmail.com
7|Coby|Morales|18|2005-12-13|coby@gmail.com
2|Benjamin||21|2000-10-18|
4|Luna|Morales|23||
6|Raquel|Morales Gamboa|28|1985-09-02|raquel@gmail.com
5|Isabella||31||isabella@gmail.com
```

```sql
sqlite> SELECT * FROM users ORDER BY age DESC;
5|Isabella||31||isabella@gmail.com
6|Raquel|Morales Gamboa|28|1985-09-02|raquel@gmail.com
4|Luna|Morales|23||
2|Benjamin||21|2000-10-18|
1|Daniel|Perez Morales|18|2005-12-13|d4nitrix13@gmail.com
7|Coby|Morales|18|2005-12-13|coby@gmail.com
3|Danna||13|2003-02-04|
```

```sql
INSERT INTO users (name, surname, age, init_date, email) 
VALUES ('Nuria Raquel', 'Morales Gamboa', 33, '1988-09-02', 'raquel@gmail.com');
```

```sql
sqlite> INSERT INTO users (name, surname, age, init_date, email) 
VALUES ('Nuria Raquel', 'Morales Gamboa', 33, '1988-09-02', 'raquel@gmail.com');
```

```sql
SELECT * FROM users WHERE email = 'raquel@gmail.com' ORDER BY age DESC;
```

```sql
sqlite> SELECT * FROM users WHERE email = 'raquel@gmail.com' ORDER BY age DESC;
8|Nuria Raquel|Morales Gamboa|33|1988-09-02|raquel@gmail.com
6|Raquel|Morales Gamboa|28|1985-09-02|raquel@gmail.com
```

> [!TIP]
> *En resumen, la cláusula `ORDER BY` se utiliza para organizar los resultados en función de los valores de una columna, ya sea en orden ascendente (`ASC`) o descendente (`DESC`).*
