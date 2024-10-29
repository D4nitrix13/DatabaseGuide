-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

/* 
LEFT JOIN en SQLite
*/

/* 
Obtiene los datos de todos los usuarios junto a su dni (lo tenga o no)
Aquí se relacionan las tablas users y dni, devolviendo todos los usuarios y sus dni si existen.
*/
SELECT * FROM users LEFT JOIN dni ON users.user_id = dni.user_id;

/* 
Obtiene el nombre de todos los usuarios junto a su dni (lo tenga o no)
Solo se seleccionan el nombre de los usuarios y el dni, mostrando también usuarios sin dni.
*/
SELECT name, dni_number
FROM users
    LEFT JOIN dni ON users.user_id = dni.user_id;

/* 
Obtiene todos los dni junto al nombre de su usuario (lo tenga o no)
En este caso se invierte el LEFT JOIN, mostrando todos los dni y sus usuarios si existen.
*/
SELECT name, dni_number
FROM dni
    LEFT JOIN users ON users.user_id = dni.user_id;

/* 
Obtiene el nombre de todos los usuarios junto a sus lenguajes (los tenga o no)
Aquí se unen tres tablas: users, users_languages y languages, mostrando todos los usuarios.
*/
SELECT users.name, languages.name
FROM
    users
    LEFT JOIN users_languages ON users.user_id = users_languages.user_id
    LEFT JOIN languages ON users_languages.language_id = languages.language_id;