-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Este comando crea una nueva tabla llamada 'users' en la base de datos actual.
CREATE TABLE users (
    
    -- 'user_id' es una columna de tipo INTEGER que se utilizará como identificador único para cada usuario.
    -- 'PRIMARY KEY' indica que esta columna será la clave primaria de la tabla, garantizando que no habrá duplicados en los valores.
    -- 'AUTOINCREMENT' permite que el valor se genere automáticamente y se incremente con cada nuevo registro insertado, 
    -- facilitando la gestión de identificadores únicos sin necesidad de especificarlos manualmente.
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,

    -- 'name' es una columna de tipo VARCHAR con una longitud máxima de 50 caracteres, destinada a almacenar el nombre del usuario.
    -- 'NOT NULL' indica que este campo es obligatorio, lo que significa que no puede quedar vacío.
    name VARCHAR(50) NOT NULL,

    -- 'surname' es una columna de tipo VARCHAR con una longitud máxima de 50 caracteres, que almacenará el apellido del usuario.
    -- Este campo es opcional, por lo que puede contener valores nulos si el usuario decide no proporcionar un apellido.
    surname VARCHAR(50),

    -- 'age' es una columna de tipo INTEGER que almacenará la edad del usuario.
    -- Este campo también es opcional, permitiendo que se deje en blanco si no se proporciona una edad.
    age INTEGER,

    -- 'init_date' es una columna de tipo DATE que registrará la fecha de inicio o la fecha de registro del usuario.
    -- Este campo es opcional, lo que significa que puede no estar presente si no se especifica una fecha.
    init_date DATE,

    -- 'email' es una columna de tipo VARCHAR con una longitud máxima de 100 caracteres, destinada a almacenar la dirección de correo electrónico del usuario.
    -- Este campo es opcional y puede ser nulo, permitiendo que el usuario elija no proporcionar un correo electrónico.
    email VARCHAR(100)
);
