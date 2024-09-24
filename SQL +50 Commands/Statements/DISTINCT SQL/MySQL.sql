-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Consulta que selecciona todos los campos de la tabla 'users'
-- y elimina filas duplicadas. Devuelve solo las filas únicas.
SELECT DISTINCT * FROM users;

-- Consulta que selecciona únicamente la columna 'age'
-- y elimina las edades duplicadas, devolviendo una lista de edades únicas.
SELECT DISTINCT age FROM users;


-- Consulta que selecciona únicamente la columna 'name'
-- y elimina los nombres duplicados, devolviendo una lista de nombres únicos.
SELECT DISTINCT name FROM users;
