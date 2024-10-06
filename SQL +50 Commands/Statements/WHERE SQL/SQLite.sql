-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Selecciona todos los registros de la tabla 'users' y los ordena por la columna 'age' en orden ascendente (por defecto).
SELECT * FROM users ORDER BY age;

-- Selecciona todos los registros de la tabla 'users' y los ordena explícitamente por la columna 'age' en orden ascendente.
SELECT * FROM users ORDER BY age ASC;

-- Selecciona todos los registros de la tabla 'users' y los ordena por la columna 'age' en orden descendente.
SELECT * FROM users ORDER BY age DESC;

-- Esta consulta selecciona todos los registros de la tabla 'users' donde el campo 'email' es igual a 'raquel@gmail.com'.
-- Los resultados se ordenan por la columna 'age' en orden descendente, mostrando primero a los usuarios de mayor edad.
SELECT * FROM users WHERE email = 'raquel@gmail.com' ORDER BY age DESC;

-- Alternativamente, esta consulta utiliza una sintaxis diferente (doble igual) para verificar la igualdad en el campo 'email'.
-- El resultado es el mismo: todos los registros con el email especificado, ordenados por edad de forma descendente.
SELECT * FROM users WHERE email == 'raquel@gmail.com' ORDER BY age DESC;
