-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Este comando crea una nueva tabla llamada 'users' dentro de la base de datos 'hello_mysql'.
CREATE TABLE `hello_mysql`.`users` (

  -- 'user_id' es una columna de tipo INT que almacenará identificadores únicos para cada usuario.
  -- 'NOT NULL' indica que este campo es obligatorio.
  -- 'AUTO_INCREMENT' significa que el valor de 'user_id' se incrementará automáticamente con cada nuevo registro insertado.
  `user_id` INT NOT NULL AUTO_INCREMENT,

  -- 'name' es una columna de tipo VARCHAR con una longitud máxima de 50 caracteres, utilizada para almacenar el nombre del usuario.
  -- 'NOT NULL' significa que el nombre es obligatorio, no puede ser nulo.
  `name` VARCHAR(50) NOT NULL,

  -- 'surname' es una columna de tipo VARCHAR con una longitud máxima de 50 caracteres, que almacenará el apellido del usuario.
  -- 'NULL' significa que esta columna es opcional y puede contener valores nulos.
  `surname` VARCHAR(50) NULL,

  -- 'age' es una columna de tipo INT que almacenará la edad del usuario.
  -- 'NULL' significa que este campo es opcional y puede no tener valor.
  `age` INT NULL,

  -- 'init_date' es una columna de tipo DATE que almacenará la fecha de inicio o registro del usuario.
  -- 'NULL' significa que es opcional.
  `init_date` DATE NULL,

  -- 'email' es una columna de tipo VARCHAR con una longitud máxima de 100 caracteres, que almacenará la dirección de correo electrónico del usuario.
  -- 'NULL' indica que puede ser opcional y permitir valores nulos.
  `email` VARCHAR(100) NULL,

  -- 'PRIMARY KEY' define que la columna 'user_id' será la clave primaria de la tabla.
  -- Esto garantiza que cada 'user_id' será único y no se repetirá en la tabla.
  PRIMARY KEY (`user_id`)
);
