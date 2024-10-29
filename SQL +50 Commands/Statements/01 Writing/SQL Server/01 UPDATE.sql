-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Establece el valor 21 para la edad del registro de la tabla "users" con identificador igual a 11.
UPDATE users SET age = '21' WHERE user_id = 11;

-- Establece el valor 20 para la edad del registro de la tabla "users" con identificador igual a 11.
UPDATE users SET age = '20' WHERE user_id = 11;

-- Establece la edad y una fecha para el registro de la tabla "users" con identificador igual a 11.
UPDATE users
SET
    age = 20,
    init_date = '2020-10-12'
WHERE
    user_id = 11;