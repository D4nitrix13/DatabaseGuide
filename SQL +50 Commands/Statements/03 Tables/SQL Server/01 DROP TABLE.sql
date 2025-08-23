-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/D4nitrix13
-- Correo electrónico: danielperezdev@proton.me

-- Elimina la tabla llamada "persons8" solo si existe
IF OBJECT_ID ('persons8', 'U') IS NOT NULL DROP TABLE persons8;

-- Elimina la tabla llamada "persons3" sin comprobar si existe
DROP TABLE persons3;