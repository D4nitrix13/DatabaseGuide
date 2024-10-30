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

-- PostgreSQL

-- En PostgreSQL, las transacciones funcionan de manera similar. No es necesario
-- usar `START TRANSACTION`, ya que al ejecutar una instrucción se inicia automáticamente.
BEGIN;
-- Inicia una nueva transacción
-- Realizar algunas operaciones de inserción o actualización
INSERT INTO users (name, age) VALUES ('Carol', 28);

INSERT INTO users (name, age) VALUES ('Diana', 32);

-- Si todo es correcto, confirma los cambios
COMMIT;

-- Si ocurre un error en alguna de las operaciones, deshaz los cambios
ROLLBACK;