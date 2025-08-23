-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/D4nitrix13
-- Correo electrónico: danielperezdev@proton.me

/*
INDEX en MySQL
*/

/* 
Crea un índice llamado "index_name" en la tabla "users" asociado al campo "name".
Esto mejora la búsqueda de registros en la tabla "users" basándose en el nombre.
*/
CREATE INDEX index_name ON users (name);

/* 
Crea un índice único llamado "index_name" en la tabla "users" asociado al campo "name".
Esto garantiza que no haya duplicados en el campo "name".
*/
CREATE UNIQUE INDEX index_name ON users (name);

/* 
Crea un índice único llamado "index_name_surname" en la tabla "users" asociado a los campos "name" y "surname".
Esto garantiza que la combinación de nombre y apellido sea única en la tabla.
*/
CREATE UNIQUE INDEX index_name_surname ON users (name, surname);

/* 
Elimina el índice llamado "index_name".
Esto eliminará el índice y puede afectar el rendimiento de las consultas que lo utilizaban.
*/
DROP INDEX index_name ON users;