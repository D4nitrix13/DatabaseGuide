-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/D4nitrix13
-- Correo electrónico: danielperezdev@proton.me

-- SQLite no utiliza el comando CREATE DATABASE de la misma manera que otros DBMS.
-- En SQLite, las bases de datos son simplemente ficheros,
-- y se crea una base de datos al conectar a un nuevo fichero.
-- Para crear una base de datos llamada "test", se puede utilizar:
ATTACH DATABASE 'test.db' AS test;