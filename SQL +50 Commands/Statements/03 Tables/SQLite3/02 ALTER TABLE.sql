-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/D4nitrix13
-- Correo electrónico: danielperezdev@proton.me

-- ADD: Añade un nuevo atributo "surname" a la tabla "persons8"
ALTER TABLE persons8 ADD COLUMN surname VARCHAR(150);
-- SQLite permite solo agregar columnas
-- RENAME COLUMN: Renombra el atributo "surname" a "description" en la tabla "persons8"
ALTER TABLE persons8 RENAME COLUMN surname TO description;

-- MODIFY COLUMN: SQLite no soporta directamente la modificación de tipos de columna.
-- Debes crear una nueva tabla y copiar los datos.

-- DROP COLUMN: SQLite no soporta la eliminación de columnas directamente,
-- debe realizarse creando una nueva tabla sin la columna y copiando los datos.

-- Ejemplo de modificación y eliminación de columna:
CREATE TABLE persons8_new (
    id INT,
    surname VARCHAR(150),
    /* Otros atributos */
    description VARCHAR(250)
);

INSERT INTO
    persons8_new (id, surname, description)
SELECT id, surname, description
FROM persons8;

DROP TABLE persons8;

ALTER TABLE persons8_new RENAME TO persons8;
-- Renombra la nueva tabla a persons8