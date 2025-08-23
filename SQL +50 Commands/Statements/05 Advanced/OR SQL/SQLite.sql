-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/D4nitrix13
-- Correo electrónico: danielperezdev@proton.me

-- Selecciona todos los registros de la tabla 'users' donde el correo electrónico NO es 'd4nitrix13@gmail.com' 
-- o la edad es igual a 28.
SELECT * FROM users WHERE NOT email = 'd4nitrix13@gmail.com' OR age = 28;
