-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Selecciona todos los registros de la tabla 'users' donde el correo electrónico termina en '@gmail.com'.
SELECT * FROM users WHERE email LIKE '%@gmail.com';

-- Selecciona todos los registros de la tabla 'users' donde el correo electrónico contiene un dominio y termina en '.com'.
SELECT * FROM users WHERE email LIKE '%@%.com';

-- Selecciona todos los registros de la tabla 'users' donde el nombre comienza con 'D' y tiene exactamente 5 caracteres.
SELECT * FROM users WHERE name LIKE 'D____';
