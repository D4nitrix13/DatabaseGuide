-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

/* 
UNION (FULL JOIN) en MySQL
*/

/* 
UNION elimina duplicados
Obtiene todos los id de usuarios de las tablas dni y usuarios (exista o no relación).
Aquí se combinan los resultados de un LEFT JOIN y un RIGHT JOIN para simular un FULL JOIN.
*/
SELECT users.user_id AS u_user_id, dni.user_id AS d_user_id
FROM users
    LEFT JOIN dni ON users.user_id = dni.user_id
UNION
SELECT users.user_id AS u_user_id, dni.user_id AS d_user_id
FROM users
    RIGHT JOIN dni ON users.user_id = dni.user_id;

/* 
Obtiene todos los datos de las tablas dni y usuarios (exista o no relación).
Esta consulta combina los resultados de ambas tablas, eliminando duplicados.
*/
SELECT *
FROM users
    LEFT JOIN dni ON users.user_id = dni.user_id
UNION
SELECT *
FROM users
    RIGHT JOIN dni ON users.user_id = dni.user_id;

/* 
UNION ALL mantiene duplicados.
Ejemplo de cómo utilizar UNION ALL si se desea incluir registros duplicados.
*/
SELECT users.user_id AS u_user_id, dni.user_id AS d_user_id
FROM users
    LEFT JOIN dni ON users.user_id = dni.user_id
UNION ALL
SELECT users.user_id AS u_user_id, dni.user_id AS d_user_id
FROM users
    RIGHT JOIN dni ON users.user_id = dni.user_id;