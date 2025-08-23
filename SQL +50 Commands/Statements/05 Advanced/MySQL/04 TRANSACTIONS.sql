-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/D4nitrix13
-- Correo electrónico: danielperezdev@proton.me

/*
TRANSACTIONS
Una transacción es una unidad de trabajo que se ejecuta como una sola operación. 
Una transacción puede incluir múltiples instrucciones SQL y se utiliza para asegurar 
que todas las operaciones se completen correctamente. Si alguna parte de la transacción falla, 
todas las operaciones pueden revertirse a su estado original, garantizando la integridad de los datos.
*/

-- MySQL

-- Inicia una nueva transacción. Desde este punto, todas las modificaciones realizadas en la
-- base de datos son temporales y solo son visibles dentro de esta transacción.
START TRANSACTION;

-- Finaliza una transacción con éxito. Cuando se ejecuta, todos los cambios realizados en la
-- base de datos durante la transacción actual se hacen permanentes y visibles.
COMMIT;

-- Deshace las operaciones realizadas en una transacción, revirtiendo la base de datos
-- al estado en que se encontraba antes de iniciar la transacción.
ROLLBACK;

-- Ejemplo de uso de transacciones en MySQL:
START TRANSACTION;

-- Realizar algunas operaciones de inserción o actualización
INSERT INTO users (name, age) VALUES ('Kathy', 30);

INSERT INTO users (name, age) VALUES ('Bob', 25);

-- Si todo es correcto, confirma los cambios
COMMIT;

-- Si ocurre un error en alguna de las operaciones, deshaz los cambios
ROLLBACK;

-- Al final, la base de datos se encuentra en un estado coherente.