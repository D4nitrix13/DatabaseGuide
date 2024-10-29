-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Este comando se utiliza para abrir una base de datos SQLite específica o crear una nueva si no existe.
.open /home/user/hello_sqlite3.db 
-- '.open' es un comando interno de SQLite en la interfaz de línea de comandos que permite establecer una conexión a una base de datos.

-- '/home/user/hello_sqlite3.db' es la ruta completa del fichero de la base de datos en el sistema de ficheros.
-- Puedes cambiar esta ruta para apuntar a cualquier otro fichero de base de datos que desees abrir.

-- Si el fichero 'hello_sqlite3.db' no existe, SQLite creará una nueva base de datos en la ubicación especificada.
-- Si el fichero ya existe, se abrirá y podrás interactuar con los datos almacenados en él.

-- Este comando es fundamental para comenzar a trabajar con una base de datos SQLite,
-- ya que establece el contexto para cualquier operación SQL que desees realizar.