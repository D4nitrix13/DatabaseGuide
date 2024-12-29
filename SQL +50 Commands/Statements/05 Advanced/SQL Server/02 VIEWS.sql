-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

/*
VIEWS
Una vista es una consulta guardada en la base de datos que se puede utilizar como si fuera una tabla. 
Sirve para simplificar consultas complejas, restringir el acceso a ciertos datos y proporcionar una capa de seguridad adicional.
Aquí se creará una vista `view_adult_users` que muestra solo los usuarios adultos (con edad >= 18) en la tabla `users`.
*/

-- SQL Server
-- En SQL Server, el proceso es similar, pero es importante usar `GO` entre instrucciones para separarlas
-- en ciertos contextos (como en SQL Server Management Studio).
CREATE VIEW view_adult_users AS
SELECT name, age
FROM users
WHERE
    age >= 18;

GO -- Indicador de final de instrucción en SQL Server Management Studio (SSMS) y otras herramientas
-- Consulta todos los registros de la vista `view_adult_users`
SELECT *
FROM view_adult_users;

GO
-- Elimina la vista `view_adult_users`
DROP VIEW view_adult_users;

GO
/*
En general, las vistas se utilizan para consultas y no para insertar datos directamente. Sin embargo, algunos sistemas de gestión de bases de datos permiten realizar inserciones, actualizaciones y eliminaciones en vistas si cumplen ciertas condiciones. A continuación, te explico cuándo y cómo es posible hacer esto en cada sistema, además de sus limitaciones:

Condiciones para modificar datos en una vista

Para que una vista permita inserciones, actualizaciones o eliminaciones, debe cumplir generalmente con las siguientes condiciones:
1. Basada en una sola tabla: La vista debe seleccionar datos de una sola tabla.
2. Sin funciones de agregación: No debe incluir agregaciones como `SUM`, `COUNT`, `AVG`, ni tampoco funciones de agrupamiento (`GROUP BY`).
3. Sin operaciones de unión o subconsultas complejas: Las operaciones de `JOIN` y subconsultas limitan la capacidad de modificación de datos en la vista.
4. Todos los campos requeridos: Deben estar presentes todos los campos que requieren valores para las inserciones en la tabla base.

Ejemplos en cada DBMS

Veamos cómo funcionan las inserciones en vistas en cada sistema:

---

MySQL

MySQL permite modificar vistas simples (sin `JOIN`, funciones de agregación o `GROUP BY`). Para vistas más complejas, se puede emplear la cláusula `WITH CHECK OPTION` para restringir la modificación a los datos que cumplen las condiciones de la vista.

```sql
-- Ejemplo: Vista de usuarios adultos en MySQL
CREATE VIEW view_adult_users AS
SELECT user_id, name, age
FROM users
WHERE age >= 18
WITH CHECK OPTION; -- Asegura que solo se pueden insertar o actualizar registros que cumplen la condición `age >= 18`
-- Insertar en la vista (funcionará si se cumplen todas las restricciones)
INSERT INTO view_adult_users (user_id, name, age) VALUES (101, 'Carlos', 20);
-- Si intentas insertar un usuario menor de 18 años, dará un error debido a `WITH CHECK OPTION`.
```

---

PostgreSQL

PostgreSQL permite actualizar vistas actualizables, que son vistas simples que cumplen con las condiciones mencionadas. Si una vista no es actualizable, puedes crear un trigger `INSTEAD OF` para definir un comportamiento específico cuando se intente modificar la vista.

```sql
-- Ejemplo: Vista de usuarios adultos en PostgreSQL
CREATE VIEW view_adult_users AS
SELECT user_id, name, age
FROM users
WHERE age >= 18;
-- Intentar insertar en la vista (funcionará si cumple con las restricciones)
INSERT INTO view_adult_users (user_id, name, age) VALUES (102, 'Ana', 25);
-- Para vistas más complejas, puedes crear un trigger `INSTEAD OF` en la vista para manejar la inserción manualmente.
```

---

SQL Server

En SQL Server, solo las vistas simples son actualizables de forma directa. Para vistas más complejas, puedes usar un trigger `INSTEAD OF` que permita manipular los datos al intentar una inserción o actualización.

```sql
-- Ejemplo: Vista de usuarios adultos en SQL Server
CREATE VIEW view_adult_users AS
SELECT user_id, name, age
FROM users
WHERE age >= 18;
-- Insertar directamente en la vista (solo si cumple con las restricciones)
INSERT INTO view_adult_users (user_id, name, age) VALUES (103, 'Luisa', 30);
-- Para vistas no actualizables, puedes definir un trigger `INSTEAD OF INSERT` para personalizar la operación.
```

---

SQLite

SQLite permite insertar datos en vistas solo si la vista es muy simple y cumple con todas las restricciones. Para vistas no actualizables, SQLite no soporta triggers `INSTEAD OF`, así que las vistas complejas no permiten modificación de datos.

```sql
-- Ejemplo: Vista de usuarios adultos en SQLite
CREATE VIEW view_adult_users AS
SELECT user_id, name, age
FROM users
WHERE age >= 18;
-- Intentar insertar en la vista (funcionará solo si cumple las restricciones y es una vista simple)
INSERT INTO view_adult_users (user_id, name, age) VALUES (104, 'Miguel', 22);
-- SQLite no permite triggers `INSTEAD OF`, por lo que no puedes modificar vistas complejas.
```

---

Consideraciones adicionales

1. WITH CHECK OPTION (MySQL y PostgreSQL): Esta opción asegura que las inserciones y actualizaciones cumplen con las condiciones de la vista. SQL Server y SQLite no soportan `WITH CHECK OPTION`.
2. Triggers `INSTEAD OF` (PostgreSQL y SQL Server): Permiten manejar inserciones, actualizaciones y eliminaciones en vistas complejas. SQLite no soporta `INSTEAD OF`.
En resumen, las vistas actualizables permiten modificar datos bajo ciertas restricciones, y cuando estas limitaciones no se cumplen, solo en algunos sistemas se puede usar `INSTEAD OF` para definir un comportamiento específico.
*/