-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Selecciona solo la primera fila de la tabla 'users'.
SELECT * FROM users LIMIT 1;

-- Selecciona solo la primera fila de la tabla 'users' donde el correo electrónico NO es 'd4nitrix13@gmail.com' 
-- o la edad es igual a 28.
SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' OR age = 28 LIMIT 1;

