<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***SQL Server en Docker - Documentación y Características***

## **Introducción**

**SQL Server se puede ejecutar fácilmente dentro de un contenedor de Docker, lo que proporciona un entorno portable y controlado para pruebas y desarrollo. A continuación se detallan los comandos y procedimientos clave para ejecutar SQL Server en un contenedor de Docker, gestionar bases de datos y ejecutar consultas SQL desde el contenedor.**

---

### **Comandos de Pull y Ejecución de SQL Server**

---

### ***1. Docker Pull Command***

**Para descargar la imagen oficial de SQL Server desde el repositorio de Microsoft, utiliza el siguiente comando:**

```bash
docker pull mcr.microsoft.com/mssql/server:2022-CU13-ubuntu-22.04
```

**Este comando descarga la imagen de SQL Server versión 2022 con CU13 sobre Ubuntu 22.04.**

```bash
docker run -itw/App \
    --user mssql \
    --privileged \
    --stop-signal SIGTERM \
    -e "ACCEPT_EULA=Y" \
    -e "MSSQL_SA_PASSWORD=P@ssw0rd123!" \
    -e "MSSQL_PID=Evaluation" \
    -p 1433:1433 \
    --name sqlpreview \
    --hostname sqlpreview \
    -d mcr.microsoft.com/mssql/server:2022-CU13-ubuntu-22.04
f1515bfecf1cee0ebe85afed0143555d73c1eb917ce0c2f1cc7b1cd5b203464e
```

---

## ***2. Ejecutar el Contenedor de SQL Server***

**Una vez que tienes la imagen, puedes ejecutar el contenedor con el siguiente comando:**

```bash
docker run -itw/App \
    --user mssql \
    --privileged \
    --stop-signal SIGTERM \
    -e "ACCEPT_EULA=Y" \
    -e "MSSQL_SA_PASSWORD=P@ssw0rd123!" \
    -e "MSSQL_PID=Evaluation" \
    -p 1433:1433 \
    --name sqlpreview \
    --hostname sqlpreview \
    -d mcr.microsoft.com/mssql/server:2022-CU13-ubuntu-22.04
```

### **Explicación de cada flag:**

- **`-itw/App`:** *Inicia un terminal interactivo en la ruta `/App` dentro del contenedor.*
  - **`-i`:** *Permite la entrada interactiva en el contenedor.*
  - **`-t`:** *Asigna un pseudo-terminal al contenedor.*
  - **`w/App`:** *Establece el directorio de trabajo dentro del contenedor en `/App`.*

- **`--user mssql`:** *Especifica que el contenedor será ejecutado con el usuario `mssql`.*

- **`--privileged`:** *Otorga privilegios adicionales al contenedor, permitiendo acceso a todos los dispositivos del host.*

- **`--stop-signal SIGTERM`:** *Define que el contenedor debe detenerse correctamente con la señal `SIGTERM` para asegurar un apagado limpio.*

- **`-e ACCEPT_EULA=Y`:** *Acepta automáticamente el contrato de licencia (EULA) de SQL Server.*

- **`-e MSSQL_SA_PASSWORD=P@ssw0rd123!`:** *Define la contraseña para el usuario administrador del sistema `sa`.*

- **`-e MSSQL_PID=Evaluation`:** *Especifica la edición de SQL Server a utilizar, en este caso, la edición de evaluación (`Evaluation`).*

- **`-p 1433:1433`:** *Mapea el puerto 1433 del contenedor al puerto 1433 del host, permitiendo que las aplicaciones externas accedan a SQL Server en el contenedor a través del puerto predeterminado para conexiones SQL.*

- **`--name sqlpreview`:** *Asigna el nombre `sqlpreview` al contenedor para poder identificarlo fácilmente al ejecutarlo o al usar otros comandos Docker.*

- **`--hostname sqlpreview`:** *Establece el nombre del host dentro del contenedor como `sqlpreview`, permitiendo una mejor gestión de la red dentro del entorno Docker.*

- **`-d`:** *Ejecuta el contenedor en segundo plano (modo "detached"), lo que permite que el terminal esté libre para otros comandos.*

---

### **Comandos útiles para verificar la configuración**

---

### ***Ver bases de datos:***

**Puedes listar todas las bases de datos presentes en el servidor SQL con el siguiente comando:**

```bash
docker exec -it sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -d master -Q "SELECT name FROM sys.databases;"
```

- **`docker exec`:** *Ejecuta un comando dentro de un contenedor en ejecución.*
- **`-it`:** *Permite la entrada interactiva y asigna un terminal al comando.*
- **`sqlpreview`:** *Especifica el nombre del contenedor donde se ejecutará el comando.*
- **`/opt/mssql-tools/bin/sqlcmd`:** *Es la ruta al ejecutable `sqlcmd`, la herramienta de línea de comandos para SQL Server.*
- **`-S localhost`:** *Conecta a la instancia de SQL Server en el contenedor, especificando `localhost` como el servidor.*
- **`-U sa`:** *Especifica el usuario `sa` para la autenticación.*
- **`-P P@ssw0rd123!`:** *Especifica la contraseña del usuario `sa`.*
- **`-d master`:** *Selecciona la base de datos `master` donde se ejecutará la consulta.*
- **`-Q "SELECT name FROM sys.databases;"`:** *Ejecuta una consulta para listar todas las bases de datos.*

---

### ***Crear una nueva base de datos:***

**Puedes crear una nueva base de datos llamada `Northwind` con este comando:**

```bash
docker exec -it sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -Q "CREATE DATABASE Northwind;"
```

- **`CREATE DATABASE Northwind;`:** *Crea una base de datos nueva llamada `Northwind`.*

- **Si ya existe la Base de Datos**

```bash
docker exec -it sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -Q "CREATE DATABASE Northwind;"
Msg 1801, Level 16, State 3, Server sqlpreview, Line 1
Database 'Northwind' already exists. Choose a different database name.
```

---

#### ***Consultas SQL Dentro del Contenedor***

---

### ***Consultar tablas:***

```bash
docker exec -it sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -Q "SELECT * FROM INFORMATION_SCHEMA.TABLES;"
```

```bash
docker exec -it sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -Q "SELECT * FROM INFORMATION_SCHEMA.TABLES;"
TABLE_CATALOG                                                                                                                    TABLE_SCHEMA                                                                                                                     TABLE_NAME                                                                                                                       TABLE_TYPE
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- ----------
master                                                                                                                           dbo                                                                                                                              spt_fallback_db                                                                                                                  BASE TABLE
master                                                                                                                           dbo                                                                                                                              spt_fallback_dev                                                                                                                 BASE TABLE
master                                                                                                                           dbo                                                                                                                              spt_fallback_usg                                                                                                                 BASE TABLE
master                                                                                                                           dbo                                                                                                                              Employees                                                                                                                        BASE TABLE
master                                                                                                                           dbo                                                                                                                              Categories                                                                                                                       BASE TABLE
master                                                                                                                           dbo                                                                                                                              Customers                                                                                                                        BASE TABLE
master                                                                                                                           dbo                                                                                                                              Shippers                                                                                                                         BASE TABLE
master                                                                                                                           dbo                                                                                                                              Suppliers                                                                                                                        BASE TABLE
master                                                                                                                           dbo                                                                                                                              Orders                                                                                                                           BASE TABLE
master                                                                                                                           dbo                                                                                                                              Products                                                                                                                         BASE TABLE
master                                                                                                                           dbo                                                                                                                              Order Details                                                                                                                    BASE TABLE
master                                                                                                                           dbo                                                                                                                              Customer and Suppliers by City                                                                                                   VIEW
master                                                                                                                           dbo                                                                                                                              Alphabetical list of products                                                                                                    VIEW
master                                                                                                                           dbo                                                                                                                              Current Product List                                                                                                             VIEW
master                                                                                                                           dbo                                                                                                                              Orders Qry                                                                                                                       VIEW
master                                                                                                                           dbo                                                                                                                              Products Above Average Price                                                                                                     VIEW
master                                                                                                                           dbo                                                                                                                              Products by Category                                                                                                             VIEW
master                                                                                                                           dbo                                                                                                                              Quarterly Orders                                                                                                                 VIEW
master                                                                                                                           dbo                                                                                                                              Invoices                                                                                                                         VIEW
master                                                                                                                           dbo                                                                                                                              Order Details Extended                                                                                                           VIEW
master                                                                                                                           dbo                                                                                                                              Order Subtotals                                                                                                                  VIEW
master                                                                                                                           dbo                                                                                                                              Product Sales for 1997                                                                                                           VIEW
master                                                                                                                           dbo                                                                                                                              Category Sales for 1997                                                                                                          VIEW
master                                                                                                                           dbo                                                                                                                              Sales by Category                                                                                                                VIEW
master                                                                                                                           dbo                                                                                                                              Sales Totals by Amount                                                                                                           VIEW
master                                                                                                                           dbo                                                                                                                              Summary of Sales by Quarter                                                                                                      VIEW
master                                                                                                                           dbo                                                                                                                              Summary of Sales by Year                                                                                                         VIEW
master                                                                                                                           dbo                                                                                                                              CustomerCustomerDemo                                                                                                             BASE TABLE
master                                                                                                                           dbo                                                                                                                              CustomerDemographics                                                                                                             BASE TABLE
master                                                                                                                           dbo                                                                                                                              Region                                                                                                                           BASE TABLE
master                                                                                                                           dbo                                                                                                                              Territories                                                                                                                      BASE TABLE
master                                                                                                                           dbo                                                                                                                              EmployeeTerritories                                                                                                              BASE TABLE
master                                                                                                                           dbo                                                                                                                              spt_values                                                                                                                       VIEW
master                                                                                                                           dbo                                                                                                                              spt_monitor                                                                                                                      BASE TABLE
master                                                                                                                           dbo                                                                                                                              MSreplication_options                                                                                                            BASE TABLE

(35 rows affected)
```

- **`INFORMATION_SCHEMA.TABLES`:** *Es una vista del sistema que contiene información sobre todas las tablas en la base de datos.*

---

#### ***Ver bases de datos***

```bash
docker exec -it sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -d master -Q "SELECT name FROM sys.databases;"
```

```bash
docker exec -it sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -d master -Q "SELECT name FROM sys.databases;"
name
--------------------------------------------------------------------------------------------------------------------------------
master
tempdb
model
msdb
Northwind

(5 rows affected)
```

- **`sys.databases`:** *Es una vista del sistema que contiene una fila por cada base de datos en el servidor SQL.*

---

### ***Crear una base de datos y listar las bases:***

```bash
docker exec -it sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123!
1> CREATE DATABASE Northwind;
2> GO
1> SELECT name FROM sys.databases;
2> GO
```

- **`GO`:** *Indica el fin de un lote de instrucciones y ejecuta las instrucciones acumuladas.*
  
**Salida esperada:**

```bash
name
--------------------------------------------------------------------------------------------------------------------------------
master
tempdb
model
msdb
Northwind

(5 rows affected)
```

---

### ***Salir de la consola SQL:***

```bash
1> exit
```

---

#### ***Recursos Adicionales***

- *[**Repositorio oficial de la imagen:**](https://hub.docker.com/r/microsoft/mssql-server/ "https://hub.docker.com/r/microsoft/mssql-server/")*
- *[**Código de ejemplo de script SQL Server:**](https://github.com/microsoft/sql-server-samples/blob/master/samples/databases/northwind-pubs/instnwnd%20(Azure%20SQL%20Database).sql "https://github.com/microsoft/sql-server-samples/blob/master/samples/databases/northwind-pubs/instnwnd%20(Azure%20SQL%20Database).sql")*
- *[**Resolución de errores con la imagen:**](https://github.com/microsoft/mssql-docker/issues/881 "https://github.com/microsoft/mssql-docker/issues/881")*

---

Aquí tienes la explicación detallada de cada comando y flag, siguiendo el formato que prefieres:

---

#### ***SQL Server en Docker - Ejecución de Consultas y Manejo de Archivos SQL***

### ***Consulta a la base de datos activa***

---

### ***1. Comando para obtener el nombre de la base de datos actual***

**Este comando se utiliza para consultar el nombre de la base de datos activa dentro del contenedor.**

```bash
docker exec -it sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -d Northwind -q "SELECT DB_NAME() AS CurrentDatabase;"
```

### ***Explicación de cada flag y opción:***

- **`docker exec`:** *Ejecuta un comando en un contenedor en ejecución.*
- **`-it`:** *Permite la entrada interactiva y asigna un terminal al comando dentro del contenedor.*
- **`sqlpreview`:** *Especifica el nombre del contenedor donde se ejecutará el comando.*
- **`/opt/mssql-tools/bin/sqlcmd`:** *Es la ruta completa al ejecutable `sqlcmd`, que es la herramienta de línea de comandos para SQL Server.*
- **`-S localhost`:** *Indica que la conexión SQL se realizará al servidor SQL dentro del contenedor en `localhost`.*
- **`-U sa`:** *Especifica que el usuario será `sa` (administrador del sistema).*
- **`-P P@ssw0rd123!`:** *Proporciona la contraseña para el usuario `sa`.*
- **`-d Northwind`:** *Selecciona la base de datos `Northwind` como la base de datos activa donde se ejecutará la consulta.*
- **`-q "SELECT DB_NAME() AS CurrentDatabase;"`:** *Ejecuta la consulta SQL que obtiene el nombre de la base de datos actual y lo muestra como `CurrentDatabase`.*

**Salida esperada:**

```bash
CurrentDatabase
--------------------------------------------------------------------------------------------------------------------------------
Northwind

(1 rows affected)
1>
```

---

### ***Copiar un archivo SQL al contenedor***

---

### ***2. Copiar un archivo SQL desde el host al contenedor***

**Este comando copia un archivo SQL desde el sistema host al contenedor de Docker, donde puede ser ejecutado posteriormente.**

```bash
docker cp $HOME/Sql/tablesDatabase.sql sqlpreview:/tmp/tablesDatabase.sql
```

### **Explicación de cada flag y opción:**

- **`docker cp`:** *Este comando copia archivos entre el sistema host y un contenedor de Docker.*
- **`$HOME/Sql/tablesDatabase.sql`:** *Es la ruta en el host donde se encuentra el archivo `tablesDatabase.sql`.*
- **`sqlpreview:/tmp/tablesDatabase.sql`:** *Especifica la ruta de destino dentro del contenedor. El archivo se copiará en el directorio `/tmp` dentro del contenedor `sqlpreview`.*

**Salida esperada:**

```bash
Successfully copied 2.05kB to sqlpreview:/tmp/tablesDatabase.sql
```

---

### **Error al ejecutar el script SQL con redirección de entrada**

---

### ***3. Error al usar redirección con `-it`***

**Si intentas ejecutar un script SQL redirigiendo la entrada estándar mientras utilizas `-it`, recibirás un error.**

```bash
docker exec -it sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! < $HOME/Sql/tablesDatabase.sql
```

---

### ***Error:***

```bash
the input device is not a TTY
```

---

### ***Causa:***

> [!CAUTION]
> *El error "the input device is not a TTY" ocurre porque el flag `-it` está intentando asignar una terminal interactiva (TTY), pero cuando se usa redirección de entrada con `<`, no es necesario tener una terminal interactiva.*

---

### ***Solución: Ejecutar sin la flag `-t`***

---

### ***4. Ejecutar el script SQL correctamente***

**Para ejecutar un archivo SQL correctamente con redirección de entrada, usa `-i` en lugar de `-it`:**

```bash
docker exec -i sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! < $HOME/Sql/tablesDatabase.sql
```

---

### **Explicación de cada flag::**

- **`docker exec`:** *Ejecuta un comando en un contenedor en ejecución.*
- **`-i`:** *Permite la redirección de la entrada estándar para leer el archivo SQL, pero sin asignar un terminal interactivo.*
- **`sqlpreview`:** *Especifica el nombre del contenedor donde se ejecutará el comando.*
- **`< $HOME/Sql/tablesDatabase.sql`:** *Redirige el contenido del archivo SQL `tablesDatabase.sql` ubicado en el host hacia el comando SQL en el contenedor.*

**Salida esperada:**

```bash
TABLE_CATALOG                                                                                                                    TABLE_SCHEMA                                                                                                                     TABLE_NAME                                                                                                                       TABLE_TYPE
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- ----------
master                                                                                                                           dbo                                                                                                                              spt_fallback_db                                                                                                                  BASE TABLE
master                                                                                                                           dbo                                                                                                                              spt_fallback_dev                                                                                                                 BASE TABLE
master                                                                                                                           dbo                                                                                                                              spt_fallback_usg                                                                                                                 BASE TABLE
master                                                                                                                           dbo                                                                                                                              Employees                                                                                                                        BASE TABLE
master                                                                                                                           dbo                                                                                                                              Categories                                                                                                                       BASE TABLE
master                                                                                                                           dbo                                                                                                                              Customers                                                                                                                        BASE TABLE
master                                                                                                                           dbo                                                                                                                              Shippers                                                                                                                         BASE TABLE
master                                                                                                                           dbo                                                                                                                              Suppliers                                                                                                                        BASE TABLE
master                                                                                                                           dbo                                                                                                                              Orders                                                                                                                           BASE TABLE
master                                                                                                                           dbo                                                                                                                              Products                                                                                                                         BASE TABLE
master                                                                                                                           dbo                                                                                                                              Order Details                                                                                                                    BASE TABLE
master                                                                                                                           dbo                                                                                                                              Customer and Suppliers by City                                                                                                   VIEW
master                                                                                                                           dbo                                                                                                                              Alphabetical list of products                                                                                                    VIEW
master                                                                                                                           dbo                                                                                                                              Current Product List                                                                                                             VIEW
master                                                                                                                           dbo                                                                                                                              Orders Qry                                                                                                                       VIEW
master                                                                                                                           dbo                                                                                                                              Products Above Average Price                                                                                                     VIEW
master                                                                                                                           dbo                                                                                                                              Products by Category                                                                                                             VIEW
master                                                                                                                           dbo                                                                                                                              Quarterly Orders                                                                                                                 VIEW
master                                                                                                                           dbo                                                                                                                              Invoices                                                                                                                         VIEW
master                                                                                                                           dbo                                                                                                                              Order Details Extended                                                                                                           VIEW
master                                                                                                                           dbo                                                                                                                              Order Subtotals                                                                                                                  VIEW
master                                                                                                                           dbo                                                                                                                              Product Sales for 1997                                                                                                           VIEW
master                                                                                                                           dbo                                                                                                                              Category Sales for 1997                                                                                                          VIEW
master                                                                                                                           dbo                                                                                                                              Sales by Category                                                                                                                VIEW
master                                                                                                                           dbo                                                                                                                              Sales Totals by Amount                                                                                                           VIEW
master                                                                                                                           dbo                                                                                                                              Summary of Sales by Quarter                                                                                                      VIEW
master                                                                                                                           dbo                                                                                                                              Summary of Sales by Year                                                                                                         VIEW
master                                                                                                                           dbo                                                                                                                              CustomerCustomerDemo                                                                                                             BASE TABLE
master                                                                                                                           dbo                                                                                                                              CustomerDemographics                                                                                                             BASE TABLE
master                                                                                                                           dbo                                                                                                                              Region                                                                                                                           BASE TABLE
master                                                                                                                           dbo                                                                                                                              Territories                                                                                                                      BASE TABLE
master                                                                                                                           dbo                                                                                                                              EmployeeTerritories                                                                                                              BASE TABLE
master                                                                                                                           dbo                                                                                                                              spt_values                                                                                                                       VIEW
master                                                                                                                           dbo                                                                                                                              spt_monitor                                                                                                                      BASE TABLE
master                                                                                                                           dbo                                                                                                                              MSreplication_options                                                                                                            BASE TABLE

(35 rows affected)
```

---

### **Otra forma de ejecutar un archivo SQL desde el host**

---

### ***5. Usar `cat` para enviar el contenido del archivo SQL***

**Otra manera de ejecutar un archivo SQL es mediante el uso del comando `cat` para pasar su contenido a la entrada estándar del comando `sqlcmd`:**

```bash
cat $HOME/Sql/tablesDatabase.sql | docker exec -i sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123!
```

```bash
cat $HOME/Sql/tablesDatabase.sql | docker exec -i sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123!
TABLE_CATALOG                                                                                                                    TABLE_SCHEMA                                                                                                                     TABLE_NAME                                                                                                                       TABLE_TYPE
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- ----------
master                                                                                                                           dbo                                                                                                                              spt_fallback_db                                                                                                                  BASE TABLE
master                                                                                                                           dbo                                                                                                                              spt_fallback_dev                                                                                                                 BASE TABLE
master                                                                                                                           dbo                                                                                                                              spt_fallback_usg                                                                                                                 BASE TABLE
master                                                                                                                           dbo                                                                                                                              Employees                                                                                                                        BASE TABLE
master                                                                                                                           dbo                                                                                                                              Categories                                                                                                                       BASE TABLE
master                                                                                                                           dbo                                                                                                                              Customers                                                                                                                        BASE TABLE
master                                                                                                                           dbo                                                                                                                              Shippers                                                                                                                         BASE TABLE
master                                                                                                                           dbo                                                                                                                              Suppliers                                                                                                                        BASE TABLE
master                                                                                                                           dbo                                                                                                                              Orders                                                                                                                           BASE TABLE
master                                                                                                                           dbo                                                                                                                              Products                                                                                                                         BASE TABLE
master                                                                                                                           dbo                                                                                                                              Order Details                                                                                                                    BASE TABLE
master                                                                                                                           dbo                                                                                                                              Customer and Suppliers by City                                                                                                   VIEW
master                                                                                                                           dbo                                                                                                                              Alphabetical list of products                                                                                                    VIEW
master                                                                                                                           dbo                                                                                                                              Current Product List                                                                                                             VIEW
master                                                                                                                           dbo                                                                                                                              Orders Qry                                                                                                                       VIEW
master                                                                                                                           dbo                                                                                                                              Products Above Average Price                                                                                                     VIEW
master                                                                                                                           dbo                                                                                                                              Products by Category                                                                                                             VIEW
master                                                                                                                           dbo                                                                                                                              Quarterly Orders                                                                                                                 VIEW
master                                                                                                                           dbo                                                                                                                              Invoices                                                                                                                         VIEW
master                                                                                                                           dbo                                                                                                                              Order Details Extended                                                                                                           VIEW
master                                                                                                                           dbo                                                                                                                              Order Subtotals                                                                                                                  VIEW
master                                                                                                                           dbo                                                                                                                              Product Sales for 1997                                                                                                           VIEW
master                                                                                                                           dbo                                                                                                                              Category Sales for 1997                                                                                                          VIEW
master                                                                                                                           dbo                                                                                                                              Sales by Category                                                                                                                VIEW
master                                                                                                                           dbo                                                                                                                              Sales Totals by Amount                                                                                                           VIEW
master                                                                                                                           dbo                                                                                                                              Summary of Sales by Quarter                                                                                                      VIEW
master                                                                                                                           dbo                                                                                                                              Summary of Sales by Year                                                                                                         VIEW
master                                                                                                                           dbo                                                                                                                              CustomerCustomerDemo                                                                                                             BASE TABLE
master                                                                                                                           dbo                                                                                                                              CustomerDemographics                                                                                                             BASE TABLE
master                                                                                                                           dbo                                                                                                                              Region                                                                                                                           BASE TABLE
master                                                                                                                           dbo                                                                                                                              Territories                                                                                                                      BASE TABLE
master                                                                                                                           dbo                                                                                                                              EmployeeTerritories                                                                                                              BASE TABLE
master                                                                                                                           dbo                                                                                                                              spt_values                                                                                                                       VIEW
master                                                                                                                           dbo                                                                                                                              spt_monitor                                                                                                                      BASE TABLE
master                                                                                                                           dbo                                                                                                                              MSreplication_options                                                                                                            BASE TABLE

(35 rows affected)
```

### **Explicación:**

- **`cat $HOME/Sql/tablesDatabase.sql`:** *Muestra el contenido del archivo `tablesDatabase.sql`.*
- **`|`:** *Redirige el contenido mostrado por `cat` hacia el comando `docker exec`.*
- **`docker exec -i`:** *Ejecuta el comando SQL dentro del contenedor, permitiendo la redirección de entrada con `-i`.*

---

### **Ejecutar una consulta SQL directamente desde el host**

---

### ***6. Ejecutar una consulta simple con `echo`***

**Puedes usar `echo` para ejecutar una consulta SQL simple directamente desde el host, sin necesidad de archivos:**

```bash
echo "SELECT * FROM INFORMATION_SCHEMA.TABLES;" | docker exec -i sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123!
```

#### **Explicación**

- **`echo "SELECT * FROM INFORMATION_SCHEMA.TABLES;"`:** *Envía la consulta SQL directamente como texto a la salida estándar.*
- **`|`:** *Redirige la salida de `echo` hacia el comando SQL en el contenedor.*
- **`docker exec -i`:** *Ejecuta el comando SQL en el contenedor, permitiendo la redirección de entrada con `-i`.*

**Salida esperada:**

```bash
TABLE_CATALOG                                                                                                                    TABLE_SCHEMA                                                                                                                     TABLE_NAME                                                                                                                       TABLE_TYPE
-------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------------------------------------------------------------------------------------------------------------- ----------
master                                                                                                                           dbo                                                                                                                              spt_fallback_db                                                                                                                  BASE TABLE
master                                                                                                                           dbo                                                                                                                              spt_fallback_dev                                                                                                                 BASE TABLE
master                                                                                                                           dbo                                                                                                                              spt_fallback_usg                                                                                                                 BASE TABLE
master                                                                                                                           dbo                                                                                                                              Employees                                                                                                                        BASE TABLE
master                                                                                                                           dbo                                                                                                                              Categories                                                                                                                       BASE TABLE
master                                                                                                                           dbo                                                                                                                              Customers                                                                                                                        BASE TABLE
master                                                                                                                           dbo                                                                                                                              Shippers                                                                                                                         BASE TABLE
master                                                                                                                           dbo                                                                                                                              Suppliers                                                                                                                        BASE TABLE
master                                                                                                                           dbo                                                                                                                              Orders                                                                                                                           BASE TABLE
master                                                                                                                           dbo                                                                                                                              Products                                                                                                                         BASE TABLE
master                                                                                                                           dbo                                                                                                                              Order Details                                                                                                                    BASE TABLE
master                                                                                                                           dbo                                                                                                                              Customer and Suppliers by City                                                                                                   VIEW
master                                                                                                                           dbo                                                                                                                              Alphabetical list of products                                                                                                    VIEW
master                                                                                                                           dbo                                                                                                                              Current Product List                                                                                                             VIEW
master                                                                                                                           dbo                                                                                                                              Orders Qry                                                                                                                       VIEW
master                                                                                                                           dbo                                                                                                                              Products Above Average Price                                                                                                     VIEW
master                                                                                                                           dbo                                                                                                                              Products by Category                                                                                                             VIEW
master                                                                                                                           dbo                                                                                                                              Quarterly Orders                                                                                                                 VIEW
master                                                                                                                           dbo                                                                                                                              Invoices                                                                                                                         VIEW
master                                                                                                                           dbo                                                                                                                              Order Details Extended                                                                                                           VIEW
master                                                                                                                           dbo                                                                                                                              Order Subtotals                                                                                                                  VIEW
master                                                                                                                           dbo                                                                                                                              Product Sales for 1997                                                                                                           VIEW
master                                                                                                                           dbo                                                                                                                              Category Sales for 1997                                                                                                          VIEW
master                                                                                                                           dbo                                                                                                                              Sales by Category                                                                                                                VIEW
master                                                                                                                           dbo                                                                                                                              Sales Totals by Amount                                                                                                           VIEW
master                                                                                                                           dbo                                                                                                                              Summary of Sales by Quarter                                                                                                      VIEW
master                                                                                                                           dbo                                                                                                                              Summary of Sales by Year                                                                                                         VIEW
master                                                                                                                           dbo                                                                                                                              CustomerCustomerDemo                                                                                                             BASE TABLE
master                                                                                                                           dbo                                                                                                                              CustomerDemographics                                                                                                             BASE TABLE
master                                                                                                                           dbo                                                                                                                              Region                                                                                                                           BASE TABLE
master                                                                                                                           dbo                                                                                                                              Territories                                                                                                                      BASE TABLE
master                                                                                                                           dbo                                                                                                                              EmployeeTerritories                                                                                                              BASE TABLE
master                                                                                                                           dbo                                                                                                                              spt_values                                                                                                                       VIEW
master                                                                                                                           dbo                                                                                                                              spt_monitor                                                                                                                      BASE TABLE
master                                                                                                                           dbo                                                                                                                              MSreplication_options                                                                                                            BASE TABLE

(35 rows affected)
```

---

### ***Explicación de los comandos de SQL Server en Docker y el manejo de scripts SQL***

---

#### ***1. Ejecutar un script SQL desde un archivo existente en el contenedor***

```bash
docker exec -it sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -i $HOME/Sql/tablesDatabase.sql
```

**Error:**
`Sqlcmd: '$HOME/Sql/tablesDatabase.sql': Invalid filename.`

- *Este error ocurre porque el archivo no existe dentro del contenedor en la ruta especificada. El `$HOME` en el sistema host no se traduce automáticamente dentro del contenedor.*

---

#### ***2. Copiar el archivo al contenedor y ejecutar el script en una base de datos específica***

```bash
docker exec -i sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -d Northwind -i $HOME/Sql/script.sql
```

- *Este comando intenta ejecutar un script SQL que está en la máquina host, pero este enfoque también fallará si el archivo no está en el contenedor.*

```bash
docker exec -it sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -i $HOME/Sql/script.sql
Msg 103, Level 15, State 5, Server sqlpreview, Line 2
The number that starts with '77773776777610000000137775350317777773777737750701000101021001000100000000000010100010010300067777761650604065047604760746404776' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 2
Incorrect syntax near '77773776777610000000137775350317777773777737750701000101021001000100000000000010100010010300067777761650604065047604760746404776'.
Msg 103, Level 15, State 5, Server sqlpreview, Line 3
The number that starts with '77577577777777777777777353753777371700000001776040404040404606076767776170000470000071101100100000000000110157177776777776470124' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 4
The number that starts with '77753777777777777777750040000000000000000000000460460000000000463733733733733737777777770047464067000777777777777777777777777777' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 5
The number that starts with '00000000440000000000000077171357777674006064214357577775737757777777777777777777777777777777777777777777377777777777777777777777' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 6
The number that starts with '73777777777777777777777777777777777777777777777777777777377757177573737777577773575373573737737777773773737777777777777737373777' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 8
The number that starts with '13135335377777676400764045600677777777773737100001357664456656567134121013130001010352170317007373537173031117317137135273537733' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 8
Incorrect syntax near '13135335377777676400764045600677777777773737100001357664456656567134121013130001010352170317007373537173031117317137135273537733'.
Msg 103, Level 15, State 5, Server sqlpreview, Line 9
The number that starts with '03010212100012121101001010101310110177777777771653713173157071633153135235231121071301334377377737537757777777777771317131013537' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 10
The number that starts with '37353161717137171343531733753735777777737737775647006440465777777777656777777777775111110100011001137777777777757716103521410520' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 11
The number that starts with '73777777777777777747740567006777700000000000000000000774347777773753030250000010000000000000000000000013030031312121301343135367' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 12
The number that starts with '04564047465400474406476000677777777777777777740040067414770070760406030703231373333323323321323333337337333737337373737773774000' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 14
The number that starts with '37375777777777777777777775737331313313137353113103113331111117701677000071513131331353133131331177737753131313531371313131117777' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 14
Incorrect syntax near '37375777777777777777777775737331313313137353113103113331111117701677000071513131331353133131331177737753131313531371313131117777'.
Msg 103, Level 15, State 5, Server sqlpreview, Line 15
The number that starts with '75311111130117113170706070700005200101731731535351731171353173171757733717310313011011011111311110111101031013110101300001011010' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 16
The number that starts with '77777773737131011311713101035010101011011013107101011101100101311117737775773130001011101013101213317134311113717217073110113131' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 17
The number that starts with '11010011001131077735303513101313131311113030101113103135121413131733757357777777777777737777777777777777773573737377777777777777' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 18
The number that starts with '37707176012140505717727035001000600343303030035353637163775377763477637767007000375273773773777377377777737377777777777777777777' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 20
The number that starts with '04000000000000000001767752537777777777777777777777777777777777777777777777777777777765370434717242024204240030434056070242400402' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 20
Incorrect syntax near '04000000000000000001767752537777777777777777777777777777777777777777777777777777777765370434717242024204240030434056070242400402'.
Msg 103, Level 15, State 5, Server sqlpreview, Line 21
The number that starts with '73777777777777777777777777777777777674506152425067176536727717773777370100000000000100000001000000000000010000000010000000000004' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 22
The number that starts with '77777757050501612414704127077775737773737733373373737332500100000100000101777777777677002720000003740001757700020167527775576717' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 23
The number that starts with '53136716351017777175777777757775775777777036770000017700000477400001073777777777777777777777777777375341001000000200302010213432' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 24
The number that starts with '04124777752434773416150677777775371737777777777777777777777777777777777777777777777777777777777777777777175777777777777777777777' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 26
The number that starts with '00004707573517040350514140717010711771310040040737337373737376300004016777365347737777573737777565777777777777777777767777777777' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 26
Incorrect syntax near '00004707573517040350514140717010711771310040040737337373737376300004016777365347737777573737777565777777777777777777767777777777'.
Msg 103, Level 15, State 5, Server sqlpreview, Line 27
The number that starts with '01000015013303504041773777375616177777777777777777777777777777777777777777777777775777757777777777777750541404050404165047171653' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 28
The number that starts with '71773757771573717317571737373130121717531713753531053530107317513107777717771775353535377757373571373531000003537373737737773400' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 29
The number that starts with '17177577377537575670716177777352537777165753517172516153535717337377034014000400005733773373737300007777734347777777777777777777' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 30
The number that starts with '43705376501010400030400373737300007340060335370014137440604454040737737377737434740544144777377773777736161475757777777777777777' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 32
The number that starts with '77700777777373747777377657773771777373777777777777777775073070707757677270372577774777670000770564000005717707125343761734357253' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 32
Incorrect syntax near '77700777777373747777377657773771777373777777777777777775073070707757677270372577774777670000770564000005717707125343761734357253'.
Msg 103, Level 15, State 5, Server sqlpreview, Line 33
The number that starts with '17337731731733127137337333353732370006700724400000477657417357735573477717235737535777577376373763563437535343537077700000040400' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 34
The number that starts with '77774000777400652400400000000000000000750735757777177775470701737000010000000001000001010000100003071210757777777753737737373737' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 35
The number that starts with '77177165771767737777777777777773737737777777777253677777777775737777777077777777777777767371717677703434720500706112507130754577' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 36
The number that starts with '73773616777777736177777777777375377377372737373737373737337372735211252163733637735311616777777777363777777777737777377775777776' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 38
The number that starts with '77256256313077777777777777777777777777777777777377725213737377377373737273727372737337733737377377773777575777770004061604040564' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 38
Incorrect syntax near '77256256313077777777777777777777777777777777777377725213737377377373737273727372737337733737377377773777575777770004061604040564'.
Msg 103, Level 15, State 5, Server sqlpreview, Line 39
The number that starts with '77777777777774003776054656161657775771775351521014377777777777565777740000004405047473404400000044160447616504000044747475675656' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 40
The number that starts with '77417501534157775350747777777777157777777413535737113131101171113112111111353735103134353131311111173115353777106764413336333732' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 41
The number that starts with '53501773531031113177573313131310177731131131716173777713513101313073777007634605327737377373737373773773372537177700000000000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 42
The number that starts with '10177770457436343436177777777777777737677777747537377777773716161777773777757273733733737337373737337363373637323733737733317373' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 44
The number that starts with '00640046540000002000100000020010001010241101306110431110353125013002537351710000161410331353535377747664004067607400404777521111' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 44
Incorrect syntax near '00640046540000002000100000020010001010241101306110431110353125013002537351710000161410331353535377747664004067607400404777521111'.
Msg 103, Level 15, State 5, Server sqlpreview, Line 45
The number that starts with '40703171771031063077003757777767400246407643737337353733371711131331335213112030217313071301337777310103123777737337370330101001' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 46
The number that starts with '73313513173537333333135133371012121000675004646560042777466777777777777777777777764564654746440407065254525257750000010133512335' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 47
The number that starts with '03430212030201057547760017605434165070520742434760400000030701014007000303771373777377660472000614040646464706072000000046746174' is too long. Maximum length is 128.
Msg 103, Level 15, State 5, Server sqlpreview, Line 48
The number that starts with '00070113143043012170303430001300711214242510061535035617102517352535271243170711635720735234363537004730737737137750714170353070' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 2
Incorrect syntax near '0'.
Msg 103, Level 15, State 4, Server sqlpreview, Line 2
The identifier that starts with 'FFFFFFEFFFFEFFFFC90A900B0DADBDFBFFDBDB9FDBFCFFBFFEDFDBFFBFFFFFFFFFE900B0C009090900900000000000000009000000900000AD090A0009A00000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 3
The identifier that starts with 'D090000A0000000000000000000000000B0009000B09A000000900000000C000B00A9FFAD9CB0F9ADBBDB9F0DBF9ADB0B90B99A9A00B09090090000009000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 3
The identifier that starts with 'E9FEDFFFFFF00ADADBDBEBDF9FAFFBCBCBF90B90F09909090009000900009000900000000090009009AD9FCFEF9F9FFFFF9FF0DF9EBCBC90B09009A90E90AD09' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 5
The identifier that starts with 'FBFFFFFFFFFFFFFFFDBFFFFFFFFD9FC9F9BDA90BC9D09000C9C0F09E9F09E9A0BCBCA9009090D00000000000900000009009000000900000909A009A0BDBCA9E' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 5
The identifier that starts with 'E9CB9EBD0CB0B0C0F0A9A09000CB09F000000000000009090909E9A90B0CBCBCBCB0B0B0F09AFB000A0A0A09AC9E09FFFDBEDAFBFFBF9A9FB9AD0B0909000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 7
The identifier that starts with 'A9AD00A90BC00A00A90090A90E90A0EB0F0BCBC9ADBDBDAD09CB0BC0900000909A9DBCBFDBFFFBFFBCBC009000909ADB0F9FFFFFFFDF9900D0BC9CB090000900' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 8
The identifier that starts with 'A009A99AC0999DB0BCBD9B9F9C9F9FBDBDBCBF9FBFADFADEBDADADFDBFDBFB9DBFCBE9E9E9E9E9C0D000000000000000000009009AF09AD000A00A9A900A909A' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 8
The identifier that starts with 'ADBEDBCBD0A9090000000000909A900A90A9DA90B00B0000A09009CB009A0A0B0A0A0B0A0A0B090CB00009A0000A900000B0A0A000B000B0A0A0000A00900F90' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 10
The identifier that starts with 'A009A0B00A0000E9A9A0A00A00A0B0000A0900000A9009A0A0A0A0B0A000A00000900B000A00A09A9BFEDEF9FFCBDFBDFCF0B090000000000000000000000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 11
The identifier that starts with 'A0A009A0A090A00A00A0A000009000A00A0A000A0090090A9A9A0000000A0900B09CB00009009A090B0B000000A09A0A0000B0F9F00000A00A0A00A000000A0D' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 2
Incorrect syntax near '000'.
Msg 103, Level 15, State 4, Server sqlpreview, Line 2
The identifier that starts with 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FBFFDFBDFFBFFFBFFFF9FFFFFFFFFFFFFFFFFF0000000000000000000000000090A0009CB0DA9A9AF9E9BE900A00F0' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 3
The identifier that starts with 'FDFBDFFDAFBFB0000000909ADA9CBBCB0BBCBCBEB9BDB9F9E9ADB9BC9A9F9BDB9DBDA9DBAF9BCBD0DA9F0DB99E90D0F00000000000000000000FF99BCB0F0E90' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 4
The identifier that starts with 'B0FFA9A9BA9DA9BBD9A9BCB9FBDA99A9A9AD9CB9F0BCB0BCB0990DA9CB0F9FDADFBFDBDFBFFBDBFFBFDFBFBF9BFF9FB9FDBDBFBDBDBD99F9DBDBDBD9FD9BFBFF' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 4
The identifier that starts with 'FF9FBDFBFDBF9FDF9FFDBDFFFBBFBFFFBDBDB9FB0F9FBFD9F9F99DBDFBFFFBFDBDBFFBDBDBFFBFBFFFBFDFFFFFFFFFBDBFC000DADBCBF9F9F9EBDB9F0F9FBEDA' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 5
The identifier that starts with 'FFF9FF9FDFDA9FDBF9FFDFFF9FFFFFFFF009DFF0F00DB9F9ADF9F9F9A9B0F90BDB0F9DB90BE9C0D9090BCB0B0BC009BF9FD0BDFF9FFBDF9F09009ADA9B9F9FBB' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 6
The identifier that starts with 'BCBDABFBD0B99B0F9ADB9090B0D09E9F00000000000900A00000C09F9EF9BDBFDA9FB0BD000000D009C009090A00D09F090090090A09FF99FFFBFFBDFFFFFFF0' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 8
The identifier that starts with 'B9F0F9BF9BF9FBFDBDFDBFFBDBDBFFFBFFFFDFFFDFFDBFFFDFFFBFFFF0B00FBF09FDFBD9F09FF090B9D9099FFFFFF9A0BC0A90BC009B0BC00000000000000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 9
The identifier that starts with 'D0090090BD0AD000F00E90009A000900000000BC0B0000000000000000009E0000000F000000E090C0B0A9C00D00000000000000000000000000900000000090' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 10
The identifier that starts with 'AF00A00000CAF0000000000A00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 11
The identifier that starts with 'B000A09A00BC00D090CA000900B09090090009000900F00A0A00090000000000000000000000000000A0000000000009000000B0009A0B0A00A00A0000000A00' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 1
The identifier that starts with 'CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCB9FB9A9AE9BEFAF9A9ABEB9EBCB00000A0B0BE9AFF0FA090B00A90B0' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 2
Incorrect syntax near 'CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCB9FB9A9AE9BEFAF9A9ABEB9EBCB00000A0B0BE9AFF0FA090B00A90B0'.
Msg 103, Level 15, State 4, Server sqlpreview, Line 3
The identifier that starts with 'A9A009FEA9BCA9090BB0FFFFABF0BCBEAB0BFEB09E9A0A90009000009000000000000000000000000000000000000000000090090090FFFFFFFFFFFFFFFFFFFF' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 4
The identifier that starts with 'A090A00C0000009000090000000009000000000000009009000000000000000000000000090099A9A9E99DB9B9BDBDB9E99F9A9BDBDF9AFDF9B99C9B00909000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 5
The identifier that starts with 'B09F0DBF0BD0BB99F9BDBD9BBDBDBF0DB99FFFDBFF9BD9B0BC9000000900000000000000000000900000000000009000000000000000000900000FC0FC0C0C0E' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 5
The identifier that starts with 'B9FBFDFFDBCB0000000000000000000000000000090000000000000000900000090CCAD0CA0F0CBC0D0E90DA0CA9ACF0CC0C000090900000009000000000009B' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 6
The identifier that starts with 'D0EBCFCBFD00D0D0ADAD00DA0D0E9CADE90000000000000000000000000090090009BDBFDBBDBDBDB9FDDBDB99BF9DF9F9DB999F9BFFFFFFFFFFDEDF0F9FBFFF' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 8
The identifier that starts with 'B9A09000090CA9C9D9B9B9F9FBDF9F9DB9F9BD9F090090000000000000000009000000000000000000900D00D00A90000009009CD09C00C0C9C0C9E0F0FADCBE' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 9
The identifier that starts with 'DBFFFFFFFFFE9E9CB0D0DAD0D0E9C0C9E9C9CE9FFFDFFCFBFFFFFFFFFFFFFEFFFBFFFFBFFEFFFEFFFBFCFB0900000000000000000000000000090090B090B09A' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 9
The identifier that starts with 'ED0DCF0FBFFAFFFFFFFFBFFFFBFEFFFFFFFFFFFFEFFFBFFAFFFFFFFFFFFFFFDBDA09000009000000009000000009000000000000000000000000000000000900' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 10
The identifier that starts with 'FFFFFFFFFFFBFFFFBFFFFFBFFFFBFBFBFDBDFAFBE9EF0BDAD00C0AD09000D09FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCE0D0CDCC9C0DAD0F' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 2
Incorrect syntax near '00000000000009E'.
Msg 103, Level 15, State 4, Server sqlpreview, Line 2
The identifier that starts with 'FFDBFA9FDFB9FDF9FAFFBF9F9E9090000000000000000000000BB0BF9B9BBDBF9BBDB99BB9BB9B9BB0BFBFA9A9BDBCBFA9A9BF9FBCA0000000000000B0000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 2
The identifier that starts with 'DAD00000000000000AC0A000C0A000000000CA0000000000000000000000000000000000F0000000000000000000000A000A00A0A0AC00C0C90A09BE00000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 3
The identifier that starts with 'C00AC0000F00000000000000000000000000000000000000000000000000090BBDBFFDF9FFFFBDFFDBFDFFFDFFBFBFFDEDBD0DFDFFFFDDAD99DBC9BC9F0DBDAD' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 4
The identifier that starts with 'DFFFFBF9F9F9DBB9F9AD9DB9E9F9E9FFFFFBFFFFF9DFBCBBDADA990B9F9A9F9DBD0DAF9DBBDBCBD9F9BBC9EBC0DA00000000000000000000000000000000000A' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 5
The identifier that starts with 'BCF9FDAFFBDFF9F9ADB9E9F9EBE9009C0000000000000000000000000000000000000000000D000000000000000000000000000000009FBFFFFF9F99A9CB0BFF' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 7
The identifier that starts with 'CAC90C0CA0F00000000000000000000000000000000009E00000000000000009CBCFDEDBDEDBCBDBFBD9F9ADBCBCB0BDBFDF9FFFBDF9FFFFDBFF9F9FBDFBFDFD' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 8
The identifier that starts with 'B0BF9FBFFBDFFDBFDFFFF9FFDFFFFFFFFFDBFFFBFFF9FDFF9FFFFFBFDFFF9FF9FFBDF9F0B00AC000A00000000000000000000000000C0F0DAC0E9CA00E0CAC00' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 9
The identifier that starts with 'A0B0E000B000A9C00000000000000000009C0CAC0E09AC009C00F0BC0ACB0B0A9CB00FAF0000000A000000000A0000C0000009CACA9E09CBEB0E9C0F0BDAD000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 9
The identifier that starts with 'E90E9E90E0DA09EF0000000000000000000000A00000000A00A000A000000D000E9A0AC00D0F0E9ACA0DADA0AC0CA0000000A0F0A0E0F0E90DA9E90ADADA90DA' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 11
The identifier that starts with 'A000000A000000000000C000000A0000000000000000000000A000000000000000A0000000000000A000A00A0A0C9E0CAD0E0CAC0F0E9CAC0AC9E00A00A00000' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 2
Incorrect syntax near '000000000000000000'.
Msg 103, Level 15, State 4, Server sqlpreview, Line 2
The identifier that starts with 'D0000000000000CA9E9F0B0F0B9CBCB0D0000000000000000CF0000000000000000000000000000000000000000000000000000A000000000000000000000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 3
The identifier that starts with 'C0000CFFFFFFFEFFFFFFFFFFFEDFAC0D09000000900900A0CA000D000000000000CFFEAC00900000000000FFF9000009000A00000000000000ADA9000000000E' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 4
The identifier that starts with 'A0A9C0B00A0A0B0009E0A0D0F0AEBEFBCFFFFFFFFFFFFFFFFA90B0CFFFF9BDFBD9E9909009009090BC9090F090AD90D09B9AD0BCBD0DB0DB0F0B9FE9CBCD0BCA' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 4
The identifier that starts with 'E9099C90B0C9090909D0BC9B9D0DBCBDBD9DB99A9CB9D090DAD9FCFADE9F99DA90DADA9DADBDBCFEFFFFFFFFFFFFFFF0F9C90B0A9009009A9009C0A9A900909A' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 6
The identifier that starts with 'DF0BDFFFDFFFBEDBF9F9DBFFFFFFFFF9BCA9A900909C0000A0A000909AD0009C009C90E0F00ADA0DBCFFFFFFFFFFFFFFFFFFFFFFFF90999909090DFFFFFBF9BD' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 6
The identifier that starts with 'CA90B0E009A09A0F0F9A9EFFFFFFFFFFFFFFFFFFFFFFB9BDDBDB990900F0F0FF9FBFDBD9C90099B0DBD09DA0D0900B0000090090B9F9F9F9FFBFB9ADB90D0BD9' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 8
The identifier that starts with 'FDFFFFFFFFBFBDBF9FBBDBBDB9BDB9BDBDBDBDF9FBDFFFF9FF9F9FFFBDBFFBFFFDFFFFFFFFFFFF9C90CFFFFFFFFFFFFF9CB0900A90B0090A000000000090000B' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 8
The identifier that starts with 'FFFDFFFFFFFBD00000000FEDBFFFFFFFBDE900090900000000C0000000009000009E0000909C9C00B0CBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9000000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 10
The identifier that starts with 'B0090000A0C000CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCD000000000000000000000000000000000000000000000000000000000000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 10
The identifier that starts with 'FFFB0B09A0ADA9A090009C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CA9A0F0DEBEFFFFFFFFFFFFBFDFCBFBFFDBBDBE9AD0A000000000000000000000000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 2
The identifier that starts with 'FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000009FFFFFFFFFFFFFFFFFF' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 3
Incorrect syntax near 'FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000009FFFFFFFFFFFFFFFFFF'.
Msg 103, Level 15, State 4, Server sqlpreview, Line 3
The identifier that starts with 'FFFFFFFFFFFFFFFFFFFF09B09B099E909AC09A900000B000909A9C90B09CB090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE90DA009A00' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 5
The identifier that starts with 'FA9F9BDB99BB9BBDF0FFFFF00B0B0F000000000B000000000BFFFFFF000A0A0090E009A00F009009A0009A00B0A9000A0B0A90BB09B0A0090B0BDA0D0A00A0A0' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 5
The identifier that starts with 'A90A90A000B0F00B00CB0B0B0ADA0B0900900900A099C000000A0090A0000BEFFBDB0B0B9B999BC999B9B9BBD0F90B0B90909A009B0B0BCB90C9090F0B909B99' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 6
The identifier that starts with 'BFDBF9FBDBF9A9B9BFDB9FF9FBCBDFBFBFFBDFFBF9FBDBFBDBB9FFBF9FBFF9FBFBFB9FBFBBDBA9B9B9A9B0BF9B09DA99BCBB0BD0E900000A0000AFFFFFE00009' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 8
The identifier that starts with 'A9B9E9BC9B9ADBDBF9AD0AD0909AD900999E9A9CB0000A0000BDFFFFFA00B00A90AD0E00A9A0F00009000A0000000000000000000000000000000000000BE9F0' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 8
The identifier that starts with 'CA00CA009AC00A9F0009000A900009A000A00A9A0A0000000000000000000000000000090900009B000000000000B09099BD9AB9AD9B0BDBBCBF9F9FB9BB9ABF' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 10
The identifier that starts with 'ADADA0C0ADBFEDE90D0FFFFFFF00A9CA90BCBEF9EAF0FFFFFFFFFFFFFFBDBFFFFFFFFFFFDBCFFFFFFFFE00000000000000000000000000000000000000000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 11
The identifier that starts with 'AF00A00000009009000090000FFFFFFF000CACA0AC0E0F0A9E00F9009A90A0A00009000009000C000A900009A9000900A9ADFFFF000000000000000000000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 11
The identifier that starts with 'A9ADB0FADAFADBCA9EFFFFFFFBF9FFDFFFFFFFFFFFFFFFFFFFBFDFFFFFBFFBEDFFFFFF0F0FB0FADBE9FBCFDBCFDADFADBFCBBCBDBAF9FCFB0F9F0F0BC00A00C9' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 2
The identifier that starts with 'F0900000000000FCFFFDEDEEFCEEDE0FEFFEEFEFEFEFFFCCEEEFEFEFFEFEFCFEFFEDEFEFCFEFEFDFEFFCFEDE0909C9DEBDDB0FADE9FDBDBD99E9E9F0F99C900D' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 3
Incorrect syntax near 'F0900000000000FCFFFDEDEEFCEEDE0FEFFEEFEFEFEFFFCCEEEFEFEFFEFEFCFEFFEDEFEFCFEFEFDFEFFCFEDE0909C9DEBDDB0FADE9FDBDBD99E9E9F0F99C900D'.
Msg 103, Level 15, State 4, Server sqlpreview, Line 3
The identifier that starts with 'FFEFFDEF00D0FAFDFFFFFFFFFFFFFFFFFFFFFFFFFFF9FFFF9F9F0F09F0BC99B0D9C99C09000C0E0DADECACCACECFA90000000000C090A0000000000000000900' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 4
The identifier that starts with 'FF9F99F9F99BC9F000A0A0A00A0000A00000AC00A00A0000E000A000000A000A0000000000000000F00A00000000A0E0A00000000000A0A0A0000000CB00000C' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 5
The identifier that starts with 'A00A0000000A00A00EBE0E09A0A0000A000000000000A0000A0A0000A000000000A0000FFFFFFFFFFFFFFFFFFFFFFFFFFFBFDB0F900009F9F9F9FBDBDBDBDFBF' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 6
The identifier that starts with 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFFFFFFFFF9FF9BDF9F0BDADFB9F9F9EBD9CFA909A9090A00A000A00A0A000A00A0A00E9' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 7
The identifier that starts with 'F0FF09F990DA90000000909909900900000000000000A000000A0000C000000000000000A0A0A000000000000000000000A00000000000000000000E9BD9C9E9' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 8
The identifier that starts with 'CF000A09E0B00000A00AF0000000000000000A000900090000000000000900000000090000000900B0F0DEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 10
The identifier that starts with 'DBDBFFFFFFFFFFFFFFFFFFFFFFFFFDBFFBDBD9F9F90B00090900090000000009000090009009009000000000000A00C0A9AC00E0000FADAE0ED0ADA9A90A00E0' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 11
The identifier that starts with 'F090DB090F000A09F0F0D0D090ACBCACE0F0F0CBCACAEEFEFFEDA0A0A000000000A00C00A0A000000A0000A00A00A00A0000000000A0ADA0B0900D00F9F9CBCB' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 11
The identifier that starts with 'FEFEEFFFFEFEFEFFFFEFFEFB00090000000A0000A000000000000B000A000000000B0A09000A0A0A09A9A0E9A00000090A090000A00000A0B0BCADADABCBACBF' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 1
The identifier that starts with 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDFFBFFFFFFFFFFFFBFBFFD000900099A9DF0FFFFBCF000000090' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 2
Incorrect syntax near 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDFFBFFFFFFFFFFFFBFBFFD000900099A9DF0FFFFBCF000000090'.
Msg 103, Level 15, State 4, Server sqlpreview, Line 2
The identifier that starts with 'F0FB0F9B0BB0F9DADBC9BDBE9F9B9E009C90DA009000000000000000000000000009000000F09BC09A900900900900009A000009B0000000900000909000090F' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 4
The identifier that starts with 'FA90BCB0F0BE909A9A9F000000000909000B00090900000000000000000000000000000000BFFFFFDFFFF9FFDFBFE99F9F090CB0DA9CB09A09A9B090B09909A9' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 5
The identifier that starts with 'FFFFF9E9FFFFFFFDBCB09BD9A9AD09E9090DAD090F09C90909BFAB0BC90DB0E90009000900000000000000000000000000000000000000000000000900F00090' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 5
The identifier that starts with 'B9F9AD0D09C9009000009000B0909090000000000000000000000000000000090909A9009A9ABF0A0A0A00000000A09000A90BCBCBD090000000000009090000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 7
The identifier that starts with 'A090B0A000000B0A0A00A0000000A0000000A00000F0F00B0F0900000000000000BFF90090BFF00000000090FDFFFFDFBCB0E99000B090B9F0FE000000900900' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 8
The identifier that starts with 'BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFDAF9EB900DA90900000090000000000000000000000000000000000000000000000000000090BC90A00000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 9
The identifier that starts with 'A900009000000900000009ADA90F00A0B0000000A00000000000000000000000F00000000000000A000000000000000000000000B0909ADF090DBD9A9E99A9FF' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 10
The identifier that starts with 'B0000000000000A00B00000900A000090A00000000000A00000000000A000A0B0FDAAF0F0A00ADDACB0D90E90000AD000AD00000009A000000000909A0090B00' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 11
The identifier that starts with 'A000000900A000A0000A000B00090A90A09A0000090000000A00000B0000A0A0009A90A0A00A000000A09A090A0A0A90B0BA0A0B09A0A09A9000000A000A9000' is too long. Maximum length is 128.
Msg 102, Level 15, State 1, Server sqlpreview, Line 2
Incorrect syntax near '9'.
Msg 103, Level 15, State 4, Server sqlpreview, Line 2
The identifier that starts with 'D9F9FD9D9F9DBFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9BDBDD9D9DD9D9D9DD9D9F9D9D9F9D99D99F9D9DDD99BD9DBD99D9D9F9F9D9DDDD9DF9F9D9D9DBD999D99D' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 3
The identifier that starts with 'DBDBD9FD99DD9D999F99DB9D9F9D9D9D99D9D9D9D9D9DBD9DBD9DDBDDBDBD9F9DFDBDF9FDF9DF9DD99DD99DB9D9D9DD9D99D9DB9D999D99DBD9D9D9D99D9999D' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 3
The identifier that starts with 'F9D09000B0900B90900000000000000000000000000000000900909090999909999999DFFFFBBFFBDFFFBDBFDFBFBDBFBDBFDBDBDBBBFDBFF9BFBFFFFFFF9999' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 5
The identifier that starts with 'BDBBDBDB9DB9BB9FFFFDBFFFFFFDFFFBFBF9F9BB9F9B90000000000000000000000000000000000000000000000090000090000BD090BD9FE9F9C90B9A90999F' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 5
The identifier that starts with 'BDFF9000000000000000000000009000000009090B09A9CBD0B909B0F9FFDF9F090BBB0B0B9B0B9090B09A000000900000000000000000000000000000000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 6
The identifier that starts with 'F9B0B000A000900B0B009A09C90090909090000000000000000000000009FF9F9BB99B9BFFBFBFDFFDFFFFFFFFFFFDFFF9FFFBFFFFFFFFFFFFFFFFBFFFFBFFFF' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 8
The identifier that starts with 'B0B9B0900909909D09BDB909F99BDBDB9B909DAD990BDBF9FF9BDB9099FB0B900000000000000B0090090B099A0F909909A99099BD09D909090BDBD090000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 9
The identifier that starts with 'C9000FFFBFFFFBF09ADF09DB999ADB0B9D09A9A900000B000000000000A9A0000000000000B0A00090C900000000000000000000000000000000000000000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 10
The identifier that starts with 'CB90900900000000009A00000A9A09BA0900B90009A0A000000000000000000000009000A0000000000900B00000000000000000000090000000000000000000' is too long. Maximum length is 128.
Msg 103, Level 15, State 4, Server sqlpreview, Line 11
The identifier that starts with 'A0909A909009E9E9A9A0B09B0A0D0BDAF0B9E9BB0AB0B090A0000A90BC9A9ADB0A909EFBDABCB00A0CB00909A9090B090B9E90BCBBAB9A90A9A9B0B09B0B0B09' is too long. Maximum length is 128.
```

---

#### ***3. Copiar el archivo del host al contenedor***

```bash
docker cp $HOME/Sql/script.sql sqlpreview:/tmp/script.sql
```

**Explicación:**

- **Este comando copia el archivo `script.sql` desde la máquina host a la ruta `/tmp/script.sql` dentro del contenedor `sqlpreview`.**

**Salida:**

```bash
Successfully copied 1.05MB to sqlpreview:/tmp/script.sql
```

---

#### ***4. Ejecutar el script SQL desde dentro del contenedor***

```bash
docker exec -i sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -d Northwind -i /tmp/script.sql
```

- *Este comando ejecuta el script SQL que está ubicado en `/tmp/script.sql` en la base de datos `Northwind`.*

**Flags:**

- *`-S localhost`: Se conecta al servidor SQL en localhost.*
- *`-U sa`: Usuario para la conexión (SA en este caso).*
- *`-P P@ssw0rd123!`: Contraseña del usuario SA.*
- *`-d Northwind`: Selecciona la base de datos `Northwind`.*
- *`-i /tmp/script.sql`: Ejecuta el script ubicado en `/tmp/script.sql`.*

---

#### ***5. Ejecutar el script SQL en la base de datos `master`***

```bash
docker exec -i sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -d master -i /tmp/BaseDatosLinux.sql
```

**Salida:**

```bash
Changed database context to 'master'.
Msg 1801, Level 16, State 3, Server sqlpreview, Line 3
Database 'Registro' already exists. Choose a different database name.
```

**Explicación:**

- *Se cambió el contexto a la base de datos `master`, pero no se pudo crear la base de datos `Registro` porque ya existe.*

---

#### ***6. Verificar si la base de datos existe***

```bash
docker exec -i sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -d master -Q "SELECT name FROM sys.databases WHERE name = 'Registro';"
```

**Salida:**

```bash
name
--------------------------------------------------------------------------------------------------------------------------------
Registro
(1 rows affected)
```

**Explicación:**

- *Consulta para verificar si la base de datos `Registro` existe en el sistema.*
- *La base de datos existe, confirmando que no fue posible crearla nuevamente en el paso anterior.*

---

#### ***7. Ejecutar una consulta SQL directamente en una tabla de la base de datos `Northwind`***

```bash
docker exec -i sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -d Northwind -Q "SELECT TOP 10 * FROM dbo.Categories;"
```

**Explicación:**

- *`-Q`: Ejecuta una consulta SQL y sale después de completarla.*
- *`SELECT TOP 10 * FROM dbo.Categories;`: Devuelve las primeras 10 filas de la tabla `Categories`.*

---

### ***Resumen***

1. *Para ejecutar scripts SQL dentro de un contenedor Docker, primero debes copiar el archivo al contenedor con `docker cp`.*
2. *Usa el flag `-i` para especificar el archivo de entrada y ejecutarlo en una base de datos específica con el flag `-d`.*
3. *Si necesitas ejecutar scripts de forma interactiva, puedes usar el comando `docker exec` junto con `sqlcmd`.*
4. *La flag `-Q` se usa para ejecutar consultas rápidas sin necesidad de un archivo SQL.*
