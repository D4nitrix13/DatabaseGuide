-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/D4nitrix13
-- Correo electrónico: danielperezdev@proton.me

/* 
RIGHT JOIN en SQLite
*/

/* 
Obtiene todos los dni junto a su usuario (lo tenga o no)
SQLite no soporta RIGHT JOIN directamente, se puede lograr mediante un LEFT JOIN en la tabla invertida.
*/
SELECT * FROM dni LEFT JOIN users ON users.user_id = dni.user_id;

/* 
Obtiene todos los dni junto al nombre de su usuario (lo tenga o no)
Se aplica el mismo principio, mostrando el nombre y el dni.
*/
SELECT name, dni_number
FROM dni
    LEFT JOIN users ON users.user_id = dni.user_id;

/* 
Obtiene el nombre de todos los usuarios junto a su dni (lo tenga o no)
Igualmente, se usa un LEFT JOIN, pero aquí se están invirtiendo las tablas.
*/
SELECT name, dni_number
FROM users
    LEFT JOIN dni ON users.user_id = dni.user_id;

/* 
Obtiene el nombre de todos los lenguajes junto a sus usuarios (los tenga o no)
De nuevo, usando LEFT JOIN, se pueden mostrar todos los lenguajes y sus usuarios.
*/
SELECT users.name, languages.name
FROM
    users_languages
    LEFT JOIN users ON users.user_id = users_languages.user_id
    LEFT JOIN languages ON users_languages.language_id = languages.language_id;