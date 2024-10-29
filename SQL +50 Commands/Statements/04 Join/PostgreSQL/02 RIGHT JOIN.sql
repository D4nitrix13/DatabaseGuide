-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

/* 
RIGHT JOIN en PostgreSQL
*/

/* 
Obtiene todos los dni junto a su usuario (lo tenga o no)
Aquí se relacionan las tablas users y dni, devolviendo todos los dni y sus usuarios si existen.
*/
SELECT * FROM users RIGHT JOIN dni ON users.user_id = dni.user_id;

/* 
Obtiene todos los dni junto al nombre de su usuario (lo tenga o no)
Selecciona el nombre de los usuarios y el dni, mostrando también dni sin usuario asociado.
*/
SELECT name, dni_number
FROM users
    RIGHT JOIN dni ON users.user_id = dni.user_id;

/* 
Obtiene el nombre de todos los usuarios junto a su dni (lo tenga o no)
Invierte el RIGHT JOIN, mostrando todos los usuarios y sus dni si existen.
*/
SELECT name, dni_number
FROM dni
    RIGHT JOIN users ON users.user_id = dni.user_id;

/* 
Obtiene el nombre de todos los lenguajes junto a sus usuarios (los tenga o no)
Aquí se unen tres tablas: users, users_languages y languages, mostrando todos los lenguajes.
*/
SELECT users.name, languages.name
FROM
    users
    RIGHT JOIN users_languages ON users.user_id = users_languages.user_id
    RIGHT JOIN languages ON users_languages.language_id = languages.language_id;