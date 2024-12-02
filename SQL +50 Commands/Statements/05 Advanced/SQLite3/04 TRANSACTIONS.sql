-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

/*
TRANSACTIONS
Una transacción es una unidad de trabajo que se ejecuta como una sola operación. 
Una transacción puede incluir múltiples instrucciones SQL y se utiliza para asegurar 
que todas las operaciones se completen correctamente. Si alguna parte de la transacción falla, 
todas las operaciones pueden revertirse a su estado original, garantizando la integridad de los datos.
*/

-- SQLite

-- En SQLite, las transacciones son similares a otros DBMS.
BEGIN;
-- Inicia una nueva transacción
-- Realizar algunas operaciones de inserción o actualización
INSERT INTO users (name, age) VALUES ('Grace', 29);

INSERT INTO users (name, age) VALUES ('Heidi', 31);

-- Si todo es correcto, confirma los cambios
COMMIT;

-- Si ocurre un error en alguna de las operaciones, deshaz los cambios
ROLLBACK;

-- En SQLite, las transacciones ayudan a mantener la integridad de los datos
-- y son especialmente útiles en operaciones de múltiples instrucciones.