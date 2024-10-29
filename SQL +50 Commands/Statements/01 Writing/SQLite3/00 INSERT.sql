-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Inserta un registro en la tabla "users" con un identificador, nombre y apellido.
-- La columna "user_id" se especifica manualmente, en este caso es el valor 8.
INSERT INTO
    users (user_id, name, surname)
VALUES (8, 'María', 'López');

-- Inserta un registro en la tabla "users" sin especificar el identificador.
-- En SQLite, se puede utilizar INTEGER PRIMARY KEY para que el "user_id" se autoincremente.
INSERT INTO users (name, surname) VALUES ('Daniel', 'Pérez');

-- Inserta un registro en la tabla "users" con un identificador no correlativo,
-- aquí el valor es 11. Esto es útil cuando se necesita un valor específico.
INSERT INTO
    users (user_id, name, surname)
VALUES (11, 'El', 'Joker');