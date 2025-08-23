-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/D4nitrix13
-- Correo electrónico: danielperezdev@proton.me

-- Este comando se utiliza para conectarse a una base de datos específica en el servidor PostgreSQL.
\connect hello_postgresql;

-- '\connect' es un comando interno de PostgreSQL utilizado en la interfaz de línea de comandos 'psql'.

-- 'hello_postgresql' es el nombre de la base de datos a la que deseas conectarte.
-- Al ejecutar este comando, cambias tu conexión actual a esta base de datos, 
-- lo que significa que todas las operaciones SQL posteriores se realizarán en el contexto de 'hello_postgresql'.

-- Si la base de datos especificada no existe, PostgreSQL mostrará un error indicando que no se pudo encontrar la base de datos.

-- Este comando es útil para gestionar múltiples bases de datos, permitiéndote cambiar rápidamente entre ellas según sea necesario.

