<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***`LIMIT`***

> [!NOTE]
> *La cláusula `LIMIT` se utiliza en SQL para restringir la cantidad de filas devueltas por una consulta. Esto es especialmente útil cuando se trabaja con tablas grandes y se desea obtener solo un subconjunto de los datos, ya sea para propósitos de paginación, pruebas o análisis rápido.*

---

## ***¿Para qué sirve `LIMIT`?***

- **Control de Resultados:** *Permite especificar cuántas filas se desean recuperar, lo que es útil para evitar que se devuelvan demasiados datos de una sola vez.*
- **Paginación:** *Facilita la implementación de paginación en aplicaciones web, donde se muestra un número limitado de registros por página.*
- **Pruebas y Desarrollo:** *Ayuda a los desarrolladores a realizar pruebas y depuraciones sin necesidad de cargar toda la base de datos.*

---

## ***Ejemplos de uso de `LIMIT`***

---

### ***1. Recuperar una única fila***

**MySQL, PostgreSQL y SQLite3:**

```sql
-- Selecciona solo la primera fila de la tabla 'users'.
SELECT * FROM users LIMIT 1;
```

- *Salida MySQL:*

```sql
mysql> SELECT * FROM users LIMIT 1;
+---------+--------+---------------+------+------------+----------------------+
| user_id | name   | surname       | age  | init_date  | email                |
+---------+--------+---------------+------+------------+----------------------+
|       1 | Daniel | Perez Morales |   18 | 2005-12-13 | d4nitrix13@gmail.com |
+---------+--------+---------------+------+------------+----------------------+
1 row in set (0.00 sec)
```

- *Salida PostgreSQL:*

```sql
hello_postgresql=# SELECT * FROM users LIMIT 1;
 user_id |  name  |    surname    | age | init_date  |        email
---------+--------+---------------+-----+------------+----------------------
       1 | Daniel | Perez Morales |  18 | 2005-12-13 | d4nitrix13@gmail.com
(1 row)
```

- *Salida SQLite3:*

```sql
sqlite> SELECT * FROM users LIMIT 1;
1|Daniel|Perez Morales|18|2005-12-13|d4nitrix13@gmail.com
```

- *Esta consulta devuelve solo la primera fila de la tabla `users`, independientemente de cuántos registros haya en total.*

---

### ***2. Aplicar `LIMIT` con condiciones***

**MySQL, PostgreSQL y SQLite3**:

```sql
-- Selecciona solo la primera fila donde el correo electrónico NO es 'd4nitrix13@gmail.com' 
-- o la edad es igual a 28.
SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' OR age = 28 LIMIT 1;
```

- *Salida MySQL:*

```sql
mysql> SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' OR age = 28 LIMIT 1;
+---------+----------+---------+------+-----------+--------------------+
| user_id | name     | surname | age  | init_date | email              |
+---------+----------+---------+------+-----------+--------------------+
|       5 | Isabella | NULL    |   31 | NULL      | isabella@gmail.com |
+---------+----------+---------+------+-----------+--------------------+
1 row in set (0.00 sec)
```

- *Salida PostgreSQL:*

```sql
hello_postgresql=# SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' OR age = 28 LIMIT 1;
 user_id |   name   | surname | age | init_date |       email
---------+----------+---------+-----+-----------+--------------------
       5 | Isabella |         |  31 |           | isabella@gmail.com
(1 row)
```

- *Salida SQLite3:*

```sql
sqlite> SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' OR age = 28 LIMIT 1;
5|Isabella||31||isabella@gmail.com
```

- *En este caso, la consulta devuelve solo una fila que cumple con la condición especificada, limitando el número total de resultados a uno.*

---

### ***Resumen***

> [!IMPORTANT]
> *La cláusula `LIMIT` es una herramienta poderosa en SQL que permite a los desarrolladores y administradores de bases de datos controlar la cantidad de datos devueltos por una consulta, mejorando la eficiencia y la facilidad de uso en la manipulación de datos. Es compatible con MySQL, PostgreSQL y SQLite3, y su sintaxis es idéntica en estos sistemas de gestión de bases de datos.*
