-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- ADD: Añade un nuevo atributo "surname" a la tabla "persons8"
ALTER TABLE persons8 ADD surname VARCHAR(150);

-- RENAME COLUMN: Renombra el atributo "surname" a "description" en la tabla "persons8"
ALTER TABLE persons8 CHANGE surname description VARCHAR(150);
-- Usar CHANGE en lugar de RENAME COLUMN
-- MODIFY COLUMN: Modifica el tipo de dato del atributo "description" en la tabla "persons8"
ALTER TABLE persons8 MODIFY COLUMN description VARCHAR(250);

-- DROP COLUMN: Elimina el atributo "description" en la tabla "persons8"
ALTER TABLE persons8 DROP COLUMN description;