<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Configuración e Instalación***

> [!TIP]
> *Independientemente del sistema de gestión de bases de datos (DBMS) que utilicemos, los conceptos básicos se repiten gracias al estándar SQL aceptado por ISO.*

**MySQL** *es una de las bases de datos más utilizadas por principiantes debido a su facilidad de uso y amplia documentación.*

- **Página oficial:** *[MySQL](https://dev.mysql.com/ "https://dev.mysql.com/")*
- **Descarga:** *[Descargas de MySQL](https://dev.mysql.com/downloads/ "https://dev.mysql.com/downloads/")*

**PostgreSQL** *es actualmente una de las bases de datos más populares en el mundo profesional, conocida por su robustez y soporte avanzado para estándares SQL.*

- **Página oficial:** *[PostgreSQL](https://www.postgresql.org/ "https://www.postgresql.org/")*
- **Descarga general:** *[Descargas de PostgreSQL](https://www.postgresql.org/download/ "https://www.postgresql.org/download/")*
- **Descarga para Linux:** *[PostgreSQL para Linux](https://www.postgresql.org/download/linux/ "https://www.postgresql.org/download/linux/")*
- **Descarga para Ubuntu:** *[PostgreSQL para Ubuntu](https://www.postgresql.org/download/linux/ubuntu/ "https://www.postgresql.org/download/linux/ubuntu/")*

**SQLite3** *es una base de datos ligera muy utilizada en proyectos medianamente pequeños debido a su simplicidad y la ausencia de un servidor de bases de datos separado.*

- **Página oficial:** *[SQLite](https://www.sqlite.org/ "https://www.sqlite.org/")*
- **Descarga:** *[Descargas de SQLite](https://www.sqlite.org/download.html "https://www.sqlite.org/download.html")*

- *Para la gestión de bases de datos en contenedores, utilizaremos Docker. A continuación, se muestra un ejemplo de cómo ejecutar un contenedor de SQLite con Docker:*

---

## ***Configuración del Contenedor sqlite3***

```bash
docker run -it -p 8191:8191 --expose 8191 --init --name sqlite3-practicas keinos/sqlite3
```

```bash
docker run -it -p8191:8191 --expose 8191 --init --name sqlite3-practicas keinos/sqlite3
Unable to find image 'keinos/sqlite3:latest' locally
latest: Pulling from keinos/sqlite3
43c4264eed91: Pull complete
d7bc0cb0ab45: Pull complete
0c07abe465e8: Pull complete
c2bab539c3e2: Pull complete
4d5ead79b81b: Pull complete
4f4fb700ef54: Pull complete
Digest: sha256:2cff72a61c12e5a9497e2c5aeac889dbbcad2fe0a870f662a4f5ea41a845572c
Status: Downloaded newer image for keinos/sqlite3:latest
SQLite version 3.46.1 2024-08-13 09:16:08
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite>
```

- **`-it`:** *Ejecuta el contenedor en modo interactivo con una terminal.*
- **`-p 8191:8191`:** *Mapea el puerto 8191 del contenedor al puerto 8191 del host.*
- **`--expose 8191`:** *Expone el puerto 8191 del contenedor.*
- **`--init`:** *Ejecuta un proceso de inicialización.*
- **`--name sqlite3-practicas`:** *Asigna un nombre al contenedor.*
- **`keinos/sqlite3`:** *Nombre de la imagen de Docker utilizada.*

> [!TIP]
> *En SQLite3, no es necesario configurar una contraseña ni un usuario. Esto se debe a que SQLite es una base de datos embebida y no requiere un servidor independiente para manejar conexiones. Los datos se almacenan en un fichero local, y el acceso se realiza directamente a través de este fichero, eliminando la necesidad de autenticación adicional.*

---

### ***Configuración del Contenedor MySQL***

- **Para ejecutar un contenedor de MySQL con Docker, utiliza el siguiente comando:**

```bash
docker run -it -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 --expose 3306 --name mysql-practicas mysql
```

```bash
docker run -iteMYSQL_ROOT_PASSWORD=root -p3306:3306 --expose 3306 --name mysql-practicas mysql
Unable to find image 'mysql:latest' locally
latest: Pulling from library/mysql
5e407bf3af90: Pull complete
5f79c432ce4c: Pull complete
e93edcbaa54f: Pull complete
a0535a79ba39: Pull complete
20ab03fc7bed: Pull complete
75f2fdac1421: Pull complete
f8d6a5d16572: Pull complete
b8dff4a91460: Pull complete
90c257e20398: Pull complete
17219240cf71: Pull complete
Digest: sha256:c69299937e5e2fc9a2cb26f5cd7a7151e48d9d5a3b3679f62bfd1275de698c0c
Status: Downloaded newer image for mysql:latest
2024-09-16 19:55:27+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 9.0.1-1.el9 started.
2024-09-16 19:55:27+00:00 [Note] [Entrypoint]: Switching to dedicated user 'mysql'
2024-09-16 19:55:27+00:00 [Note] [Entrypoint]: Entrypoint script for MySQL Server 9.0.1-1.el9 started.
2024-09-16 19:55:28+00:00 [Note] [Entrypoint]: Initializing database files
2024-09-16T19:55:28.348320Z 0 [System] [MY-015017] [Server] MySQL Server Initialization - start.
2024-09-16T19:55:28.350805Z 0 [System] [MY-013169] [Server] /usr/sbin/mysqld (mysqld 9.0.1) initializing of server in progress as process 80
2024-09-16T19:55:28.364940Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
2024-09-16T19:55:28.895394Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
2024-09-16T19:55:31.679266Z 6 [Warning] [MY-010453] [Server] root@localhost is created with an empty password ! Please consider switching off the --initialize-insecure option.
2024-09-16T19:55:34.781710Z 0 [System] [MY-015018] [Server] MySQL Server Initialization - end.
2024-09-16 19:55:34+00:00 [Note] [Entrypoint]: Database files initialized
2024-09-16 19:55:34+00:00 [Note] [Entrypoint]: Starting temporary server
mysqld will log errors to /var/lib/mysql/9ae8377f53ab.err
mysqld is running as pid 123
2024-09-16 19:55:36+00:00 [Note] [Entrypoint]: Temporary server started.
'/var/lib/mysql/mysql.sock' -> '/var/run/mysqld/mysqld.sock'
Warning: Unable to load '/usr/share/zoneinfo/iso3166.tab' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/leap-seconds.list' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/leapseconds' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/tzdata.zi' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/zone.tab' as time zone. Skipping it.
Warning: Unable to load '/usr/share/zoneinfo/zone1970.tab' as time zone. Skipping it.

2024-09-16 19:55:39+00:00 [Note] [Entrypoint]: Stopping temporary server
2024-09-16 19:55:40+00:00 [Note] [Entrypoint]: Temporary server stopped

2024-09-16 19:55:40+00:00 [Note] [Entrypoint]: MySQL init process done. Ready for start up.

2024-09-16T19:55:40.591346Z 0 [System] [MY-015015] [Server] MySQL Server - start.
2024-09-16T19:55:40.927058Z 0 [System] [MY-010116] [Server] /usr/sbin/mysqld (mysqld 9.0.1) starting as process 1
2024-09-16T19:55:40.941570Z 1 [System] [MY-013576] [InnoDB] InnoDB initialization has started.
2024-09-16T19:55:41.384335Z 1 [System] [MY-013577] [InnoDB] InnoDB initialization has ended.
2024-09-16T19:55:41.765830Z 0 [Warning] [MY-010068] [Server] CA certificate ca.pem is self signed.
2024-09-16T19:55:41.765898Z 0 [System] [MY-013602] [Server] Channel mysql_main configured to support TLS. Encrypted connections are now supported for this channel.
2024-09-16T19:55:41.772946Z 0 [Warning] [MY-011810] [Server] Insecure configuration for --pid-file: Location '/var/run/mysqld' in the path is accessible to all OS users. Consider choosing a different directory.
2024-09-16T19:55:41.811944Z 0 [System] [MY-011323] [Server] X Plugin ready for connections. Bind-address: '::' port: 33060, socket: /var/run/mysqld/mysqlx.sock
2024-09-16T19:55:41.812140Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '9.0.1'  socket: '/var/run/mysqld/mysqld.sock'  port: 3306  MySQL Community Server - GPL.
```

- **`-it`:** *Ejecuta el contenedor en modo interactivo con una terminal.*
- **`-e MYSQL_ROOT_PASSWORD=root`:** *Configura la contraseña del usuario root en MySQL. Aquí, `root` es la contraseña establecida para el usuario root.*
- **`-p 3306:3306`:** *Mapea el puerto 3306 del contenedor al puerto 3306 del host.*
- **`--expose 3306`:** *Expone el puerto 3306 del contenedor para que esté accesible.*
- **`--name mysql-practicas`:** *Asigna el nombre `mysql-practicas` al contenedor.*
- **`mysql`:** *Nombre de la imagen de Docker utilizada.*

> [!NOTE]
> *En el comando, es esencial proporcionar la variable de entorno `MYSQL_ROOT_PASSWORD` para configurar el usuario y la contraseña de MySQL. Sin esta variable, MySQL no se iniciará correctamente.*

**Mensaje de confirmación cuando el contenedor esté listo:**

```bash
2024-09-16T19:55:41.812140Z 0 [System] [MY-010931] [Server] /usr/sbin/mysqld: ready for connections. Version: '9.0.1' socket: '/var/run/mysqld/mysqld.sock' port: 3306 MySQL Community Server - GPL.
```

- *Este mensaje indica que el servidor MySQL está listo para aceptar conexiones en el puerto 3306.*

---

### ***Configuración del Contenedor PostgreSQL***

- **Para ejecutar un contenedor de PostgreSQL con Docker, utiliza el siguiente comando:**

```bash
docker run -it -w /App -e POSTGRES_PASSWORD=root -p 5432:5432 --expose 5432 --name postgres-practicas postgres
```

- **`-it`:** *Ejecuta el contenedor en modo interactivo con una terminal.*
- **`-w /App`:** *Establece el directorio de trabajo dentro del contenedor como `/App`.*
- **`-e POSTGRES_PASSWORD=root`:** *Configura la contraseña del usuario `postgres`. Aquí, `root` es la contraseña establecida para el usuario administrador por defecto de PostgreSQL.*
- **`-p 5432:5432`:** *Mapea el puerto 5432 del contenedor al puerto 5432 del host, permitiendo la conexión a PostgreSQL desde el host.*
- **`--expose 5432`:** *Expone el puerto 5432 del contenedor para que esté accesible desde el exterior.*
- **`--name postgres-practicas`:** *Asigna el nombre `postgres-practicas` al contenedor.*
- **`postgres`:** *Nombre de la imagen de Docker utilizada.*

> [!NOTE]
> *Es necesario proporcionar la variable de entorno `POSTGRES_PASSWORD` para configurar la contraseña del usuario administrador (`postgres`). Sin esta variable, PostgreSQL no se iniciará correctamente.*

**Mensaje de confirmación cuando el contenedor esté listo:**

- *Cuando el contenedor esté configurado correctamente, PostgreSQL mostrará un mensaje de confirmación similar al siguiente:*

```bash
PostgreSQL init process complete; ready for start up.

2024-09-16 19:58:02.644 UTC [1] LOG:  starting PostgreSQL 16.4 (Debian 16.4-1.pgdg120+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
2024-09-16 19:58:02.644 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
2024-09-16 19:58:02.644 UTC [1] LOG:  listening on IPv6 address "::", port 5432
2024-09-16 19:58:02.652 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
2024-09-16 19:58:02.661 UTC [61] LOG:  database system was shut down at 2024-09-16 19:58:02 UTC
2024-09-16 19:58:02.672 UTC [1] LOG:  database system is ready to accept connections
```

- *Este mensaje indica que el servidor PostgreSQL está listo para aceptar conexiones en el puerto 5432.*

```bash
docker run -itw/App -ePOSTGRES_PASSWORD=root -p5432:5432 --expose 5432 --name postgres-practicas postgres
Unable to find image 'postgres:latest' locally
latest: Pulling from library/postgres
a2318d6c47ec: Pull complete
2f16a1d7105a: Pull complete
426ef4eb83d0: Pull complete
e405020056e2: Pull complete
37f223cd3b7a: Pull complete
5b21d7a5cb0b: Pull complete
2fd2333708a2: Pull complete
a9193c797654: Pull complete
175415c99903: Pull complete
88ab146977b5: Pull complete
5d0d6d069b83: Pull complete
c31960c64c87: Pull complete
edaedb71f264: Pull complete
de96e3ff4e81: Pull complete
Digest: sha256:026d0ab72b34310b68160ab9299aa1add5544e4dc3243456b94f83cb1c119c2c
Status: Downloaded newer image for postgres:latest
The files belonging to this database system will be owned by user "postgres".
This user must also own the server process.

The database cluster will be initialized with locale "en_US.utf8".
The default database encoding has accordingly been set to "UTF8".
The default text search configuration will be set to "english".

Data page checksums are disabled.

fixing permissions on existing directory /var/lib/postgresql/data ... ok
creating subdirectories ... ok
selecting dynamic shared memory implementation ... posix
selecting default max_connections ... 100
selecting default shared_buffers ... 128MB
selecting default time zone ... Etc/UTC
creating configuration files ... ok
running bootstrap script ... ok
performing post-bootstrap initialization ... ok
syncing data to disk ... ok

initdb: warning: enabling "trust" authentication for local connections
initdb: hint: You can change this by editing pg_hba.conf or using the option -A, or --auth-local and --auth-host, the next time you run initdb.

Success. You can now start the database server using:

    pg_ctl -D /var/lib/postgresql/data -l logfile start

waiting for server to start....2024-09-16 19:58:02.360 UTC [47] LOG:  starting PostgreSQL 16.4 (Debian 16.4-1.pgdg120+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
2024-09-16 19:58:02.362 UTC [47] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
2024-09-16 19:58:02.374 UTC [50] LOG:  database system was shut down at 2024-09-16 19:58:01 UTC
2024-09-16 19:58:02.388 UTC [47] LOG:  database system is ready to accept connections
 done
server started

/usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/*

2024-09-16 19:58:02.493 UTC [47] LOG:  received fast shutdown request
waiting for server to shut down....2024-09-16 19:58:02.500 UTC [47] LOG:  aborting any active transactions
2024-09-16 19:58:02.506 UTC [47] LOG:  background worker "logical replication launcher" (PID 53) exited with exit code 1
2024-09-16 19:58:02.507 UTC [48] LOG:  shutting down
2024-09-16 19:58:02.512 UTC [48] LOG:  checkpoint starting: shutdown immediate
2024-09-16 19:58:02.539 UTC [48] LOG:  checkpoint complete: wrote 3 buffers (0.0%); 0 WAL file(s) added, 0 removed, 0 recycled; write=0.007 s, sync=0.006 s, total=0.033 s; sync files=2, longest=0.004 s, average=0.003 s; distance=0 kB, estimate=0 kB; lsn=0/14EA2C8, redo lsn=0/14EA2C8
2024-09-16 19:58:02.549 UTC [47] LOG:  database system is shut down
 done
server stopped

PostgreSQL init process complete; ready for start up.

2024-09-16 19:58:02.644 UTC [1] LOG:  starting PostgreSQL 16.4 (Debian 16.4-1.pgdg120+1) on x86_64-pc-linux-gnu, compiled by gcc (Debian 12.2.0-14) 12.2.0, 64-bit
2024-09-16 19:58:02.644 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
2024-09-16 19:58:02.644 UTC [1] LOG:  listening on IPv6 address "::", port 5432
2024-09-16 19:58:02.652 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
2024-09-16 19:58:02.661 UTC [61] LOG:  database system was shut down at 2024-09-16 19:58:02 UTC
2024-09-16 19:58:02.672 UTC [1] LOG:  database system is ready to accept connections
```

---

# ***Cliente MySQL***

- *Para conectarte a un contenedor de MySQL desde la línea de comandos, puedes utilizar el siguiente comando:*

```bash
docker exec -it mysql-practicas mysql -uroot -proot -hlocalhost -P3306
```

- **O tambien:**

```bash
docker exec -it mysql-practicas mysql -u root -proot -h localhost -P 3306
```

- **`docker exec`:** *Ejecuta un comando dentro de un contenedor en ejecución.*
- **`-it`:** *Permite la interacción con la terminal (modo interactivo) para que el usuario pueda ingresar comandos en tiempo real.*
- **`mysql-practicas`:** *Nombre del contenedor donde se ejecutará el comando, en este caso, `mysql-practicas`.*
- **`mysql`:** *El comando que ejecuta el cliente MySQL dentro del contenedor, iniciando una sesión en MySQL.*
- **`-u root`:** *Especifica el nombre de usuario para la conexión, que en este caso es `root`.*
- **`-p root`:** *Proporciona la contraseña del usuario `root` (en este ejemplo, también es `root`).*
- **`-h localhost`:** *Especifica el **host** al que te conectas, en este caso `localhost`, que representa al propio contenedor o servidor donde se está ejecutando MySQL.*
- **`-P 3306`:** *Especifica el **puerto** que se utiliza para la conexión a MySQL. El puerto por defecto de MySQL es `3306`.*

> [!WARNING]
> *Se muestra una advertencia de seguridad sobre el uso de la contraseña en la línea de comandos:*

```bash
mysql: [Warning] Using a password on the command line interface can be insecure.
```

**Mensaje de confirmación cuando la conexión es exitosa:**

```bash
docker exec -it mysql-practicas mysql -u root -proot -h localhost -P 3306
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 9.0.1 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

---

## ***Cliente PostgreSQL***

- *Para conectarte a un contenedor de PostgreSQL desde la línea de comandos, utiliza el siguiente comando:*

- **Para especificar el puerto y la contraseña al conectarte a un contenedor PostgreSQL, puedes hacer lo siguiente:**

```bash
docker container exec -it postgres-practicas psql -h localhost -U postgres -p 5432
```

- **O tambien:**

```bash
docker container exec -itePGPASSWORD=root postgres-practicas psql -hlocalhost -Upostgres -p5432
```

```bash
docker container exec --interactive --tty --env PGPASSWORD=root postgres-practicas psql -h localhost -U postgres -p 5432
```

- **En este caso:**

- **`docker container exec`:** *Ejecuta un comando dentro de un contenedor en ejecución.*
- **`-it`:** *Permite la interacción con la terminal (modo interactivo).*
- **`postgres-practicas`:** *Nombre del contenedor donde se ejecutará el comando.*
- **`psql`:** *El comando que ejecuta el cliente PostgreSQL dentro del contenedor.*
- **`-h localhost`:** *Especifica el host al que te conectas (en este caso, `localhost`).*
- **`-U postgres`:** *Especifica el nombre de usuario, en este caso `postgres`.*
- **`-p 5432`:** *Especifica el puerto de conexión, que en PostgreSQL por defecto es `5432`.*

- **Para ingresar la contraseña, PostgreSQL te la pedirá automáticamente si está configurada para el usuario `postgres`. En caso de que no quieras que te pregunte, puedes usar la variable de entorno `PGPASSWORD` para pasar la contraseña de esta forma:**

- **Aquí:**

- **`-e PGPASSWORD=root`:** *Define la contraseña de manera segura en la variable de entorno `PGPASSWORD` para que no se solicite en la terminal.*

```bash
docker container exec --interactive --tty --env PGPASSWORD=root postgres-practicas psql -h localhost -U postgres -p 5432
psql (16.4 (Debian 16.4-1.pgdg120+1))
Type "help" for help.

postgres=#
```

**Mensaje de confirmación cuando la conexión es exitosa:**

```bash
docker exec -itePGPASSWORD=root postgres-practicas psql -hlocalhost -Upostgres -p5432
psql (16.4 (Debian 16.4-1.pgdg120+1))
Type "help" for help.

postgres=#
```

- *Este mensaje indica que te has conectado exitosamente al servidor PostgreSQL y estás listo para ejecutar comandos SQL en la consola de PostgreSQL.*

---

## ***Listar Bases de Datos***

### ***SQLite3***

> [!CAUTION]
> *Para listar todas las bases de datos en SQLite3, recuerda que **SQLite3** no tiene múltiples bases de datos dentro de un mismo servidor, como lo hace MySQL o PostgreSQL. En SQLite3, cada fichero es una base de datos independiente. Por lo tanto, no es necesario listar las bases de datos como en otros sistemas.*

- *Por lo tanto, no es posible listar bases de datos en SQLite3 como se haría en otros sistemas de gestión de bases de datos.*

- **Solo puedes trabajar con una base de datos a la vez, y dentro de esa base, listar las tablas disponibles**

- **Para listar las tablas en una base de datos de SQLite3, el comando es el siguiente:**

```bash
.tables
```

- **Este comando muestra todas las tablas presentes en la base de datos actualmente conectada.**

---

### ***MySQL***

- *Para listar las bases de datos en MySQL, puedes utilizar el siguiente comando:*

```bash
show databases;
```

- *O también en mayúsculas, ya que MySQL no es sensible a mayúsculas y minúsculas para comandos SQL:*

```bash
SHOW DATABASES;
```

- *Esto se debe a que **MySQL** no distingue entre mayúsculas y minúsculas en sus comandos SQL.*

**Salida esperada:**

```bash
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.02 sec)
```

---

### ***Bases de datos por defecto en MySQL***

- **Los siguientes son las bases de datos que vienen por defecto en MySQL:**

- **information_schema:** *Contiene metadatos sobre las bases de datos y las tablas del servidor MySQL.*
- **mysql:** *Contiene los datos relacionados con los usuarios, privilegios y configuraciones del sistema.*
- **performance_schema:** *Proporciona datos sobre el rendimiento del servidor MySQL.*
- **sys:** *Ofrece vistas que facilitan la monitorización y administración del servidor.*

**En Linux,** *estas bases de datos se almacenan en la siguiente ruta:*

```bash
docker exec -it mysql-practicas bash -c "ls -lA /var/lib/mysql/"
total 112532
-rw-r----- 1 mysql mysql  6291456 Sep 16 19:57 '#ib_16384_0.dblwr'
-rw-r----- 1 mysql mysql 14680064 Sep 16 19:55 '#ib_16384_1.dblwr'
drwxr-x--- 2 mysql mysql     4096 Sep 16 19:55 '#innodb_redo'
drwxr-x--- 2 mysql mysql     4096 Sep 16 19:55 '#innodb_temp'
-rw-r----- 1 mysql mysql     1541 Sep 16 19:55  9ae8377f53ab.err
-rw-r----- 1 mysql mysql       56 Sep 16 19:55  auto.cnf
-rw-r----- 1 mysql mysql  2943051 Sep 16 19:55  binlog.000001
-rw-r----- 1 mysql mysql      158 Sep 16 19:55  binlog.000002
-rw-r----- 1 mysql mysql       32 Sep 16 19:55  binlog.index
-rw------- 1 mysql mysql     1705 Sep 16 19:55  ca-key.pem
-rw-r--r-- 1 mysql mysql     1108 Sep 16 19:55  ca.pem
-rw-r--r-- 1 mysql mysql     1108 Sep 16 19:55  client-cert.pem
-rw------- 1 mysql mysql     1705 Sep 16 19:55  client-key.pem
-rw-r----- 1 mysql mysql     5611 Sep 16 19:55  ib_buffer_pool
-rw-r----- 1 mysql mysql 12582912 Sep 16 19:55  ibdata1
-rw-r----- 1 mysql mysql 12582912 Sep 16 19:55  ibtmp1
drwxr-x--- 2 mysql mysql     4096 Sep 16 19:55  mysql
-rw-r----- 1 mysql mysql 32505856 Sep 16 19:55  mysql.ibd
lrwxrwxrwx 1 mysql mysql       27 Sep 16 19:55  mysql.sock -> /var/run/mysqld/mysqld.sock
-rw-r----- 1 mysql mysql      131 Sep 16 19:55  mysql_upgrade_history
drwxr-x--- 2 mysql mysql     4096 Sep 16 19:55  performance_schema
-rw------- 1 mysql mysql     1705 Sep 16 19:55  private_key.pem
-rw-r--r-- 1 mysql mysql      452 Sep 16 19:55  public_key.pem
-rw-r--r-- 1 mysql mysql     1108 Sep 16 19:55  server-cert.pem
-rw------- 1 mysql mysql     1705 Sep 16 19:55  server-key.pem
drwxr-x--- 2 mysql mysql     4096 Sep 16 19:55  sys
-rw-r----- 1 mysql mysql 16777216 Sep 16 19:57  undo_001
-rw-r----- 1 mysql mysql 16777216 Sep 16 19:57  undo_002
```

- **El contenido de cada base de datos en esta ubicación contiene los ficheros correspondientes a cada tabla y metadatos.**

---

### ***PostgreSQL***

- **Para listar las bases de datos en PostgreSQL, se pueden usar los siguientes comandos:**

```bash
\l
```

- **O también:**

```bash
\list
```

- *Ambos comandos mostrarán todas las bases de datos disponibles en el servidor PostgreSQL.*
