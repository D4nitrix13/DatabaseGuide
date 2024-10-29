-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Este comando abre una base de datos SQLite existente o crea una nueva si no existe,
-- y la asigna como la base de datos activa para ejecutar operaciones SQL.

.open /home/user/hello_sqlite3.db 
-- '.open' es un comando de SQLite que se utiliza para abrir una base de datos.

-- '/home/user/hello_sqlite3.db' es la ruta completa del fichero de la base de datos en el sistema de ficheros.
-- Puedes cambiar esta ruta para que apunte a cualquier otra ubicación o fichero de base de datos que quieras usar.

-- Si el fichero 'hello_sqlite3.db' no existe, SQLite creará una nueva base de datos en la ruta especificada.
-- Si el fichero ya existe, se abrirá y se podrá interactuar con los datos almacenados en él.