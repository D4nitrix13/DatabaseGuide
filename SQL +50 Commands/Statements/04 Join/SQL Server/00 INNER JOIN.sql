-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

/* 
INNER JOIN (JOIN) en SQL Server
*/

/* 
Realiza un JOIN de manera incorrecta, ya que no existe un campo de relación 
Esto generará un error ya que no se puede unir sin una condición
*/
SELECT * FROM users INNER JOIN dni;
-- ERROR: no se especifica una relación
/* 
Obtiene los datos de los usuarios que tienen un dni 
Aquí se establece la relación entre los campos user_id de ambas tablas
*/
SELECT *
FROM users
    INNER JOIN dni ON users.user_id = dni.user_id;

/* 
Obtiene los datos de los usuarios que tienen un dni (JOIN es lo mismo que INNER JOIN)
*/
SELECT * FROM users JOIN dni ON users.user_id = dni.user_id;

/* 
Obtiene el nombre y el dni de los usuarios que tienen un dni y los ordena por edad
Se seleccionan solo los campos deseados y se ordenan por la edad de forma ascendente
*/
SELECT name, dni_number
FROM users
    JOIN dni ON users.user_id = dni.user_id
ORDER BY age ASC;

/* 
Obtiene los datos de los usuarios que tienen empresa
Relaciona las tablas users y companies a través de company_id
*/
SELECT *
FROM users
    JOIN companies ON users.company_id = companies.company_id;

/* 
Obtiene los datos de las empresas que tienen usuarios
Intercambia el orden de las tablas en el JOIN
*/
SELECT *
FROM companies
    JOIN users ON users.company_id = companies.company_id;

/* 
Obtiene el nombre de las empresas junto al nombre de sus usuarios
Combina las tablas companies y users para mostrar los nombres
*/
SELECT companies.name, users.name
FROM companies
    JOIN users ON companies.company_id = users.company_id;

/* 
Obtiene los nombres de usuarios junto a los lenguajes que conocen
Relación entre las tablas users_languages, users y languages
*/
SELECT users.name, languages.name
FROM
    users_languages
    JOIN users ON users_languages.user_id = users.user_id
    JOIN languages ON users_languages.language_id = languages.language_id;

/* 
Obtiene los nombres de usuarios junto a los lenguajes que conocen 
(utilizando otro orden de relación entre tablas)
*/
SELECT users.name, languages.name
FROM
    users
    JOIN users_languages ON users.user_id = users_languages.user_id
    JOIN languages ON users_languages.language_id = languages.language_id;