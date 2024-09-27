-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Selecciona todos los registros de la tabla 'users' y los ordena por la columna 'age' en orden ascendente (por defecto).
SELECT * FROM users ORDER BY age;

-- Selecciona todos los registros de la tabla 'users' y los ordena explícitamente por la columna 'age' en orden ascendente.
SELECT * FROM users ORDER BY age ASC;

-- Selecciona todos los registros de la tabla 'users' y los ordena por la columna 'age' en orden descendente.
SELECT * FROM users ORDER BY age DESC;

-- Selecciona todos los registros de la tabla 'users' donde el campo 'email' sea igual a 'raquel@gmail.com', y los ordena por la columna 'age' en orden descendente.
SELECT * FROM users WHERE email = 'raquel@gmail.com' ORDER BY age DESC;
