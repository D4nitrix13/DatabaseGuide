-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Este comando se utiliza para conectarse a la base de datos llamada 'hello_postgresql'.
\connect hello_postgresql;

-- Este comando crea una nueva tabla llamada 'users' en la base de datos actual.
CREATE TABLE users (
    
    -- 'user_id' es una columna de tipo SERIAL que se utilizará como identificador único para cada usuario.
    -- 'SERIAL' implica que el valor se generará automáticamente y se incrementará con cada nuevo registro.
    -- 'PRIMARY KEY' indica que 'user_id' será la clave primaria de la tabla, garantizando que cada valor sea único.
    user_id SERIAL PRIMARY KEY,

    -- 'name' es una columna de tipo VARCHAR con una longitud máxima de 50 caracteres, destinada a almacenar el nombre del usuario.
    -- 'NOT NULL' significa que este campo es obligatorio y no puede ser nulo.
    name VARCHAR(50) NOT NULL,

    -- 'surname' es una columna de tipo VARCHAR con una longitud máxima de 50 caracteres, utilizada para almacenar el apellido del usuario.
    -- No se especifica 'NOT NULL', lo que significa que este campo es opcional y puede contener valores nulos.
    surname VARCHAR(50),

    -- 'age' es una columna de tipo INT que almacenará la edad del usuario.
    -- Este campo es opcional y puede ser nulo.
    age INT,

    -- 'init_date' es una columna de tipo DATE que almacenará la fecha de inicio o registro del usuario.
    -- Este campo también es opcional y puede ser nulo.
    init_date DATE,

    -- 'email' es una columna de tipo VARCHAR con una longitud máxima de 100 caracteres, que almacenará la dirección de correo electrónico del usuario.
    -- Este campo es opcional y puede ser nulo.
    email VARCHAR(100)
);
