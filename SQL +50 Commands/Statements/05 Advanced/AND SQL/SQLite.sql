-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Selecciona todos los registros de la tabla 'users' donde el correo electrónico NO es 'd4nitrix13@gmail.com' 
-- y la edad es igual a 28.
SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' AND age = 28;
