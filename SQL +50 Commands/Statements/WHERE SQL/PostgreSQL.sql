-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Selecciona todas las columnas de la tabla 'users'
-- donde la edad (age) del usuario es igual a 18.
SELECT * FROM users 
WHERE age = 18;

-- Selecciona las edades distintas de la tabla 'users' donde la edad es igual a 18.
SELECT DISTINCT age FROM users WHERE age = 18;
