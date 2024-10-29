-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Inserta un registro en la tabla "users" con un identificador, nombre y apellido.
-- La columna "user_id" se especifica manualmente, en este caso es el valor 8.
INSERT INTO
    users (user_id, name, surname)
VALUES (8, 'María', 'López');

-- Inserta un registro en la tabla "users" sin especificar el identificador.
-- Esto puede significar que "user_id" está configurado para autoincrementar,
-- permitiendo que el sistema genere automáticamente un valor único de identificación.
INSERT INTO users (name, surname) VALUES ('Daniel', 'Pérez');

-- Inserta un registro en la tabla "users" con un identificador no correlativo,
-- en este caso el valor 11. Esto puede ser útil cuando se necesita un valor específico.
INSERT INTO
    users (user_id, name, surname)
VALUES (11, 'El', 'Joker');