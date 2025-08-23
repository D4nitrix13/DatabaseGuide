<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Formatos de las cadenas de conexión para MySQL, PostgreSQL y SQLite3***

---

## ***MySQL***

```bash
mysql://<user>:<password>@<host>:<port>/<database>
```

**Ejemplo:**

```bash
mysql://root:password@localhost:3306/myDatabase
```

---

### ***PostgreSQL***

```bash
postgresql://<user>:<password>@<host>:<port>/<database>
```

**Ejemplo:**

```bash
postgresql://postgres:password@localhost:5432/myDatabase
```

---

### ***SQLite3***

- *Para **SQLite3**, la conexión es más sencilla, ya que no necesitas un servidor, sino solo la ruta al archivo de la base de datos:*

```bash
sqlite:///ruta/a/myDatabase.db
```

**Ejemplo:**

```bash
sqlite:///home/user/myDatabase.db
```

> [!NOTE]
> *Nota: Asegúrate de adaptar `<user>`, `<password>`, `<host>`, `<port>` y `<database>` según tu configuración específica.*

---

### ***Formato de Cadenas de Conexión***

> [!IMPORTANT]
> *La razón por la cual **SQLite3** utiliza tres barras (`///`) en la cadena de conexión es debido a cómo se estructura la URL.*

- **En MySQL y PostgreSQL:** *las conexiones utilizan el formato `protocolo://usuario:contraseña@host:puerto/database`. Aquí la doble barra `//` indica que la conexión es hacia un servidor, como `localhost` o una dirección IP remota, y lo que sigue es la especificación del usuario y demás parámetros de la conexión.*

- **En SQLite3:** *al ser una base de datos de archivo local, no se conecta a un servidor, por lo que no necesita un "host". En este caso, `sqlite:///` indica que se trata de un archivo local y que la ruta es absoluta (de ahí las tres barras: `///`).*

  - **Ejemplo:** *`sqlite:///ruta/a/myDatabase.db` significa que el archivo `myDatabase.db` está ubicado en una ruta completa, como `/ruta/a/`.*

- *Para una ruta relativa en SQLite3, podrías usar solo dos barras (`sqlite://myDatabase.db`), lo que indicará que el archivo está en el mismo directorio de trabajo actual.*

## ***Cliente gráfico de terminal para MySQL, PostgreSQL y SQLite3***

**Enlace al proyecto:** **[dbui en GitHub](https://github.com/KenanBek/dbui "https://github.com/KenanBek/dbui")**

- *Actualmente, la última versión disponible es la [v0.7.0](https://github.com/kenanbek/dbui/releases/tag/v0.7.0 "https://github.com/kenanbek/dbui/releases/tag/v0.7.0")*

- **Enlace al paquete `.deb`:** **[dbui_0.7.0_linux_amd64.deb](https://github.com/KenanBek/dbui/releases/download/v0.7.0/dbui_0.7.0_linux_amd64.deb "https://github.com/KenanBek/dbui/releases/download/v0.7.0/dbui_0.7.0_linux_amd64.deb")**

**Instalación con `wget` y `dpkg`:**

```bash
wget https://github.com/KenanBek/dbui/releases/download/v0.7.0/dbui_0.7.0_linux_amd64.deb
sudo dpkg -i dbui_0.7.0_linux_amd64.deb
```

---

## ***Configuración de contenedores para probar `dbui`***

- **Para probar `dbui`, vamos a crear dos contenedores Docker con bases de datos MySQL y PostgreSQL:**

1. **Contenedor MySQL** *con datos de empleados:*

   ```bash
   docker run -d --name dbui-mysql-demo -p 3316:3306 -e MYSQL_ROOT_PASSWORD=demo genschsa/mysql-employees
   ```

2. **Contenedor PostgreSQL** *con la base de datos `world-db`:*

   ```bash
   docker run -d --name dbui-postgresql-demo -p 5432:5432 ghusta/postgres-world-db:2.4-alpine
   ```

---

### ***Paso 2: Crear fichero de configuración `dbui.yml`***

- *Para configurar `dbui`, crea el fichero `dbui.yml` en el directorio actual con el siguiente contenido:*

```bash
touch ~/dbui.yml
```

**Contenido de `dbui.yml`:**

```yaml
dataSources:
  - alias: employees
    type: mysql
    dsn: "root:demo@(localhost:3316)/employees"
  - alias: world-db
    type: postgresql
    dsn: "user=world password=world123 host=localhost port=5432 dbname=world-db sslmode=disable"
  - alias: Northwind
    type: sqlite
    dsn: "/home/sqlite/testdata/Northwind.db"
default: employees
```

- **`dataSources`:** *Aquí defines cada fuente de datos con los siguientes parámetros:*
  - **`alias`:** *nombre o identificador de la base de datos.*
  - **`type`:** *tipo de base de datos (mysql, postgresql, sqlite).*
  - **`dsn`:** *cadena de conexión para la base de datos.*
- **`default`:** *define la base de datos predeterminada que se utilizará al iniciar `dbui`.*

> **Orden de búsqueda del fichero `dbui.yml`:** **Primero `dbui` busca el fichero en el directorio actual, y si no lo encuentra, lo busca en el directorio personal del user.**

---

Aquí tienes una explicación detallada sobre las cadenas de conexión (DSN) para MySQL, PostgreSQL y SQLite3 en `dbui`, incluyendo cómo configurar cada una y desactivar SSL para las conexiones que lo requieran.

---

### ***Cadenas de Conexión (DSN) en `dbui`***

- *Una DSN (Data Source Name) es una cadena que contiene toda la información necesaria para que una aplicación se conecte a una base de datos. En `dbui`, puedes especificar el DSN en el fichero `dbui.yml` o directamente en la línea de comandos al ejecutar `dbui`.*

#### ***1. MySQL***

- *La cadena de conexión para MySQL en `dbui` tiene la siguiente estructura:*

   ```yaml
   dsn: "user:password@(host:port)/Database"
   ```

- **user:** *Nombre del user de la base de datos.*
- **password:** *password del user.*
- **host:** *Dirección IP o nombre del host donde está el servidor MySQL (por ejemplo, `localhost` o la IP del contenedor).*
- **port:** *port en el que MySQL está escuchando (normalmente, `3306`).*
- **Database:** *Nombre de la base de datos a la que te estás conectando.*

   **Ejemplo:**

   ```yaml
   dsn: "root:demo@(localhost:3316)/employees"
   ```

- *Este ejemplo conecta a una base de datos MySQL llamada `employees` que se ejecuta en `localhost` en el port `3316`, usando el user `root` con la password `demo`.*

#### ***2. PostgreSQL***

   *La cadena de conexión para PostgreSQL en `dbui` tiene un formato ligeramente diferente y permite configuraciones adicionales, como la desactivación de SSL.*

   ```yaml
   dsn: "user=user password=password host=host port=port dbname=Database sslmode=disable"
   ```

- **user:** *Nombre del user de la base de datos.*
- **password:** *password del user.*
- **host:** *Dirección IP o nombre del host donde está el servidor PostgreSQL.*
- **port:** *port en el que PostgreSQL está escuchando (por defecto `5432`).*
- **dbname:** *Nombre de la base de datos a la que te estás conectando.*
- **sslmode:** *Configura el modo SSL. Para desactivar SSL, usa `sslmode=disable`.*

   **Ejemplo:**

   ```yaml
   dsn: "user=world password=world123 host=localhost port=5432 dbname=world-db sslmode=disable"
   ```

- *Este ejemplo conecta a una base de datos PostgreSQL llamada `world-db` en `localhost` y en el port `5432`, usando el user `world` con la password `world123`. Además, `sslmode=disable` desactiva SSL para esta conexión.*

#### ***3. SQLite3***

- *SQLite3 es una base de datos local que no requiere un servidor externo, por lo que la cadena de conexión es simplemente la ruta al fichero de la base de datos.*

   ```yaml
   dsn: "ruta/al/fichero.db"
   ```

- **ruta/al/fichero.db:** *Ruta completa o relativa al fichero SQLite3.*

   **Ejemplo:**

   ```yaml
   dsn: "/home/vscode/Code/Northwind.db"
   ```

- - *Este ejemplo indica a `dbui` que use el fichero SQLite `Northwind.db` en el directorio `/home/vscode/Code/`.*

---

### ***Cómo Desactivar SSL en MySQL y PostgreSQL***

- *SSL (Secure Sockets Layer) se utiliza para cifrar las conexiones a bases de datos y proteger la información sensible. Sin embargo, en entornos de desarrollo o en configuraciones específicas, puede ser útil desactivarlo.*

---

#### ***Desactivar SSL en PostgreSQL***

- *En PostgreSQL, puedes desactivar SSL añadiendo `sslmode=disable` al final de la cadena de conexión DSN:*

```yaml
dsn: "user=user password=password host=host port=port dbname=Database sslmode=disable"
```

- **Ejemplo**:

  ```yaml
  dsn: "user=world password=world123 host=192.168.1.17 port=5432 dbname=world-db sslmode=disable"
  ```

---

#### ***Desactivar SSL en MySQL***

- **En MySQL, si quieres desactivar SSL, puedes hacerlo añadiendo `tls=false` en la cadena DSN:**

```yaml
dsn: "user:password@(host:port)/Database?tls=false"
```

- **Ejemplo**:

  ```yaml
  dsn: "root:demo@(localhost:3306)/employees?tls=false"
  ```

- *Esto le indica a `dbui` que conecte a la base de datos MySQL sin SSL.*

---

### ***Conexión única con DSN y tipo de base de datos***

- *Es posible iniciar `dbui` para una única conexión a la base de datos, usando la cadena de conexión (DSN) y el tipo de base de datos.*

**Ejemplo para MySQL:**

```bash
dbui -dsn "codekn:codekn@(localhost:3306)/codekn_omni" -type mysql
```

---

### ***Prioridad de configuración en `dbui`***

1. **`dbui` sin parámetros:** *Lee el fichero `dbui.yml` del directorio actual (`./dbui.yml`), o si no lo encuentra, lo busca en el directorio personal (`~/dbui.yml`).*
2. **Especificando fichero de configuración:** *Con `dbui -f /ruta/personalizada/mydbui.yml` se lee el fichero de configuración desde la ubicación indicada.*
3. **Modo de conexión única:** *Si usas `dbui -dsn "<connection-string>" -type <tipo>`, inicia en modo de conexión única.*

---

### ***Configuración de conexión entre contenedores***

- *Para conectar `dbui` desde un contenedor a la base de datos en otro, es necesario configurar la base de datos para que escuche en la dirección IP asignada por la red `bridge` de Docker, no solo en `localhost`.*

- **IP de `dbui-mysql-demo`:**

  ```bash
  docker container inspect --format "{{.NetworkSettings.IPAddress}}" dbui-mysql-demo
  ```

  **Salida:**
  
  ```bash
  172.17.0.2
  ```

- **IP de `dbui-postgresql-demo`:**

  ```bash
  docker container inspect --format "{{.NetworkSettings.IPAddress}}" dbui-postgresql-demo
  ```

  **Salida:**
  
  ```bash
  172.17.0.3
  ```

- **Para crear otro contenedor de pruebas para SQLite3, ejecuta:**

```bash
docker container run \
  -it \
  -w /Code \
  -p 8000:8000 \
  --user vscode \
  --privileged \
  --init \
  --expose 8000 \
  --stop-signal SIGTERM \
  --stop-timeout 10 \
  --attach STDOUT \
  --attach STDERR \
  --attach STDIN \
  -v "$(pwd)":/Code \
  --name container-practicas \
  d4nitrix13/database:latest
```

- **Dirección IP de `container-practicas`:**

  ```bash
  docker container inspect --format "{{.NetworkSettings.IPAddress}}" container-practicas
  ```

  **Salida:**
  
  ```bash
  172.17.0.4
  ```

- **ports de `container-practicas`:**

  ```bash
  docker container port container-practicas
  ```

  **Salida:**
  
  ```bash
  8000/tcp -> 0.0.0.0:8000
  8000/tcp -> [::]:8000
  ```

---

### ***Instalación de MySQL, PostgreSQL y SQLite en el contenedor de pruebas***

- *Para configurar el contenedor de prácticas con `MySQL`, `PostgreSQL` y `SQLite`, necesitamos instalar cada base de datos en el contenedor:*

1. **Guías de instalación:**
   - **MySQL:** *[Guía de instalación de MySQL](https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/ "https://dev.mysql.com/doc/mysql-apt-repo-quick-guide/en/")*
   - **PostgreSQL:** *[Guía de instalación de PostgreSQL](https://ubuntu.com/server/docs/install-and-configure-postgresql "https://ubuntu.com/server/docs/install-and-configure-postgresql")*
   - **SQLite3:** *[Guía de instalación de SQLite3](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-sqlite-on-ubuntu-20-04 "https://www.digitalocean.com/community/tutorials/how-to-install-and-use-sqlite-on-ubuntu-20-04")*

2. **Comandos para actualizar e instalar los paquetes:**

   ```bash
   sudo apt update
   sudo apt-get install mysql-server postgresql postgresql-client sqlite3 -y
   ```

---

### ***Configuración de passwords de users***

- **Después de instalar las bases de datos, es necesario establecer una password para el user sin privilegios y para el user root en el contenedor:**

1. **Cambiar a user root:**

   ```bash
   sudo su
   ```

2. **Establecer la password del user actual:**

   ```bash
   passwd $USER
   ```

   **Al ejecutar este comando, aparecerá lo siguiente:**

   ```bash
   New password:
   Retype new password:
   passwd: password updated successfully
   ```

---

### ***Iniciar y verificar el estado de MySQL***

1. **Iniciar el servicio de MySQL:**

   ```bash
   service mysql start
   ```

   **Salida esperada:**

   ```bash
   - Starting MySQL database server mysqld [ OK ]
   ```

2. **Verificar el estado de MySQL:**

   ```bash
   service mysql status
   ```

   **Salida esperada:**

   ```bash
   - /usr/bin/mysqladmin Ver 8.0.39-0ubuntu0.22.04.1 for Linux on x86_64 ((Ubuntu))
     Server version: 8.0.39-0ubuntu0.22.04.1
     Protocol version: 10
     Connection: Localhost via UNIX socket
     UNIX socket: /var/run/mysqld/mysqld.sock
     Uptime: 22 min 6 sec
     Threads: 2  Questions: 24  Slow queries: 0  Opens: 119  Flush tables: 3  Open tables: 38  Queries per second avg: 0.018
   ```

   > *Nota: A veces puede mostrar una advertencia, como `cannot change directory to /nonexistent`, pero esto no debería afectar el funcionamiento básico.*

---

### ***Configuración de `dbui.yml`***

- **Este fichero de configuración permite que `dbui` administre y conecte múltiples bases de datos sin necesidad de reiniciar.**

1. **Crear el fichero `dbui.yml`:**

   ```bash
   touch ~/dbui.yml
   ```

2. **Contenido del fichero `dbui.yml`:**

   ```yaml
   dataSources:
     - alias: employees
       type: mysql
       dsn: "root:demo@(localhost:3316)/employees"
     - alias: world-db
       type: postgresql
       dsn: "user=world password=world123 host=localhost port=5432 dbname=world-db sslmode=disable"
     - alias: Northwind
       type: sqlite
       dsn: "/home/sqlite/testdata/Northwind.db"
   default: employees
   ```

   - **`dataSources`:** *Especifica las bases de datos que se pueden gestionar en `dbui`:*
     - **`alias`:** *Identificador para la base de datos.*
     - **`type`:** *Tipo de base de datos (mysql, postgresql, sqlite).*
     - **`dsn`:** *Cadena de conexión (Data Source Name) para cada base de datos.*
   - **`default`:** *Define cuál será la base de datos predeterminada al iniciar `dbui`.*

---

### ***Conexiones directas usando DSN en `dbui`***

1. **Comando para MySQL con `dbui`:**

   ```bash
   dbui -dsn "root:demo@(localhost:3316)/employees" -type mysql
   ```

   **Este comando podría dar el error:**

   ```bash
   dial tcp [::-1]:3316 connect connection: refused
   ```

   - *Esto ocurre porque el contenedor no puede resolver `localhost` para la conexión entre contenedores.*

2. **Soluciones alternativas:**

   - **Con la IP del contenedor MySQL:**

     ```bash
     dbui -dsn "root:demo@(172.17.0.2:3306)/employees" -type mysql
     ```

   - **Con la IP del host:**

     - **Primero, obtenemos la IP del host:**

     ```bash
     echo $(hostname -I | awk '{print $1}')
     ```

     - **Supongamos que la IP es `192.168.1.17`:**

     ```bash
     dbui -dsn "root:demo@(192.168.1.17:3316)/employees" -type mysql
     ```

   - **Ejecutando dentro del contenedor SQLite de pruebas (`container-practicas`):**

     **Primera forma:**

     ```bash
     docker exec --interactive --tty --user vscode --privileged container-practicas dbui -dsn "root:demo@(192.168.1.17:3316)/employees" -type mysql
     ```

     **Segunda forma (usando `hostname -I`):**

     ```bash
     docker exec --interactive --tty --user vscode --privileged container-practicas dbui -dsn "root:demo@($(hostname -I | awk '{print $1}'):3316)/employees" -type mysql
     ```

     **Tercera forma (usando la IP del contenedor MySQL):**

     ```bash
     docker exec --interactive --tty --user vscode --privileged container-practicas dbui -dsn "root:demo@($(docker container inspect --format '{{.NetworkSettings.IPAddress}}' dbui-mysql-demo):3306)/employees" -type mysql
     ```

---

### ***Configuración de conexión para PostgreSQL en `dbui`***

1. **Comando de conexión que podría fallar en `dbui`:**

   ```bash
   dbui -dsn "user=world password=world123 host=localhost port=5432 dbname=world-db sslmode=disable" -type postgresql
   ```

   - *Esto podría dar un error de conexión debido a `localhost`.*

2. **Soluciones alternativas:**

   - **Usando la IP del host:**

     ```bash
     dbui -dsn "user=world password=world123 host=192.168.1.17 port=5432 dbname=world-db sslmode=disable" -type postgresql
     ```

   - **Usando la IP del contenedor PostgreSQL:**

     ```bash
     dbui -dsn "user=world password=world123 host=172.17.0.3 port=5432 dbname=world-db sslmode=disable" -type postgresql
     ```

3. **Ejecutando dentro del contenedor SQLite de pruebas (`container-practicas`):**

   **Primera forma:**

   ```bash
   docker exec --interactive --tty --user vscode --privileged container-practicas dbui -dsn "user=world password=world123 host=172.17.0.3 port=5432 dbname=world-db sslmode=disable" -type postgresql
   ```

   **Segunda forma (usando la IP del contenedor PostgreSQL):**

   ```bash
   docker exec --interactive --tty --user vscode --privileged container-practicas dbui -dsn "user=world password=world123 host=$(docker container inspect --format '{{.NetworkSettings.IPAddress}}' dbui-postgresql-demo) port=5432 dbname=world-db sslmode=disable" -type postgresql
   ```

   **Tercera forma (usando la IP del host):**

   ```bash
   docker exec --interactive --tty --user vscode --privileged container-practicas dbui -dsn "user=world password=world123 host=$(hostname -I | awk '{print $1}') port=5432 dbname=world-db sslmode=disable" -type postgresql
   ```

---

### ***Conexión de `dbui` a una base de datos SQLite3***

- *Para trabajar con una base de datos SQLite3 en `dbui`, puedes especificar la ubicación del fichero `.db` en el parámetro DSN (Data Source Name).*

1. **Comando básico para iniciar `dbui` con SQLite3:**

   ```bash
   dbui -dsn "/home/vscode/Code/Northwind.db" -type sqlite
   ```

   - *Este comando inicia `dbui` y conecta directamente a la base de datos `Northwind.db` en la ruta especificada (`/home/vscode/Code/`). Es importante que la ruta apunte al fichero SQLite3 en el sistema de ficheros del contenedor o del host, según dónde esté corriendo `dbui`.*

2. **Ejecutar `dbui` dentro de un contenedor Docker para SQLite3:**

    *Si estás utilizando el contenedor de prácticas (`container-practicas`) y quieres ejecutar `dbui` en el contexto de ese contenedor, usa el siguiente comando:*

   ```bash
   docker exec -it --user vscode --privileged container-practicas dbui -dsn "/home/vscode/Code/Northwind.db" -type sqlite
   ```

   - **`docker exec`:** *Ejecuta un comando dentro de un contenedor en ejecución.*
   - **`-it`:** *Modo interactivo y de terminal, útil para mantener la sesión abierta.*
   - **`--user vscode`:** *Ejecuta el comando como el user `vscode`.*
   - **`--privileged`:** *Concede privilegios adicionales si es necesario para la ejecución.*
   - **`container-practicas`:** *Nombre del contenedor donde se ejecutará `dbui`.*

---

### ***Configuración del Teclado Predeterminado en `dbui`***

- *La configuración predeterminada de teclado en `dbui` facilita la navegación y el acceso rápido a diferentes paneles y opciones. A continuación, se muestra una lista de los atajos de teclado y su función específica.*

---

#### ***Atajos de teclado principales en `dbui`***

1. **Atajos de Navegación y Foco**

    - **Ctrl-A:** *Muestra la lista de `data sources` (fuentes de datos) configuradas.*
    - **Ctrl-S:** *Navega al panel de `schemas` (esquemas) de la base de datos.*
    - **Ctrl-D:** *Muestra las tablas de la base de datos seleccionada.*
    - **Ctrl-E:** *Cambia al modo de `preview` (vista previa) para observar los datos.*
    - **Ctrl-Q:** *Abre el editor de `query` (consultas SQL) para escribir y ejecutar consultas SQL.*

2. **Navegación Especial**

   - **Tab:** *Navega al siguiente elemento de la interfaz.*
   - **Shift-Tab:** *Navega al elemento anterior en la interfaz.*
   - **Ctrl-F:** *Alterna el *modo de foco, lo que permite activar o desactivar el enfoque de navegación.*
   - **Ctrl-C:** *Sale de la aplicación `dbui`.*

3. **Atajos específicos de la tabla**

    - *Estos atajos solo funcionan cuando el panel de tablas está activo:*

    - **e:** *Muestra la descripción de la tabla seleccionada (similar a `DESCRIBE` en SQL).*
    - **p:** *Muestra una vista previa de la tabla seleccionada. Funciona como `ENTER` pero sin cambiar el foco actual.*

4. **Atajos específicos para la vista previa de datos**

   - *Estos atajos solo están disponibles cuando el panel de vista previa de datos está activo:*

- **y:** *Copia una fila seleccionada al portapapeles. (Función en desarrollo, próxima actualización).*

---

### ***Imagen de Configuración de Teclado Predeterminada***

- *La configuración predeterminada de teclas en `dbui` se representa gráficamente en la siguiente imagen:*

*![Configuración de Teclado](/Images/keyboardLayout.png "/Images/keyboardLayout.png")*

---

### *Con clientes gráficos de terminal como `dbui`, no es necesario tener instalado el DBMS (Sistema de Gestión de Bases de Datos) en el host, siempre y cuando el cliente esté configurado para conectarse a un servidor de base de datos en ejecución en un contenedor u otro servidor*

---

### ***Diferencia entre Cliente y DBMS***

- **DBMS (Sistema de Gestión de Bases de Datos):** *Es el software que gestiona las bases de datos, como MySQL, PostgreSQL o SQLite. Es necesario para ejecutar y almacenar las bases de datos.*

- **Cliente de Base de Datos:** *Es el software que permite interactuar con el DBMS. Un cliente puede ser una aplicación de línea de comandos, una herramienta gráfica o una extensión o aplicación de terminal como `dbui`. El cliente solo necesita estar configurado para conectarse al servidor de base de datos (DBMS), y no es necesario que el DBMS esté instalado en la misma máquina que el cliente.*

### ***¿Es necesario tener MySQL o PostgreSQL instalado en el host para usar `dbui`?***

> [!IMPORTANT]
> *No, **no es necesario tener MySQL ni PostgreSQL instalados en el host** para usar `dbui` y conectarse a un servidor MySQL o PostgreSQL que esté corriendo en un contenedor. Esto se debe a que `dbui` solo actúa como cliente y se conecta a una base de datos a través de la red o un socket.*

#### ***¿Cómo funciona?***

- **En tu caso**, si tienes un contenedor Docker con MySQL o PostgreSQL (como en los ejemplos anteriores), el contenedor tiene su propio DBMS funcionando. El host solo necesita tener el cliente adecuado (en este caso, `dbui`) para conectarse a la base de datos que corre dentro del contenedor.

- **Acceso desde el host al contenedor:** *Puedes conectar `dbui` al servidor MySQL o PostgreSQL del contenedor usando la IP del contenedor o mapeando el puerto del contenedor a un puerto del host. No es necesario tener MySQL o PostgreSQL instalado en el host para acceder al contenedor.*

---

### ***Ejemplos prácticos***

---

#### ***1. Contenedor con MySQL:***

**Primero, creas y ejecutas un contenedor con MySQL:**

```bash
docker run -d --name dbui-mysql-demo -p 3316:3306 -e MYSQL_ROOT_PASSWORD=demo genschsa/mysql-employees
```

- *Este contenedor tiene MySQL en ejecución, pero **no es necesario que MySQL esté instalado en el host**.*

- *Luego, en el host, puedes usar `dbui` para conectarte al servidor MySQL dentro del contenedor. Para ello, ejecutas el siguiente comando en el host:*

```bash
dbui -dsn "root:demo@(localhost:3316)/employees" -type mysql
```

**Explicación:**

- *`localhost:3316` se refiere al puerto 3316 del host, que está mapeado al puerto 3306 del contenedor MySQL.*
- *`dbui` actúa como cliente y se conecta a MySQL a través del puerto expuesto, pero **no necesitas tener MySQL instalado en el host**.*

---

#### ***2. Contenedor con PostgreSQL:***

- **De manera similar, creas y ejecutas un contenedor con PostgreSQL:**

```bash
docker run -d --name dbui-postgresql-demo -p 5432:5432 ghusta/postgres-world-db:2.4-alpine
```

- *Este contenedor tiene PostgreSQL en ejecución, pero nuevamente, **no es necesario tener PostgreSQL instalado en el host**.*

- **En el host, puedes usar `dbui` para conectarte al servidor PostgreSQL dentro del contenedor:**

```bash
dbui -dsn "user=world password=world123 host=localhost port=5432 dbname=world-db sslmode=disable" -type postgresql
```

**Explicación:**

- *`localhost:5432` se refiere al puerto 5432 del host, mapeado al puerto 5432 del contenedor PostgreSQL.*
- *Al igual que con MySQL, **no necesitas tener PostgreSQL instalado en el host** para acceder al contenedor.*

### ***En resumen***

- *No es necesario tener MySQL, PostgreSQL o SQLite instalados en el host para usar herramientas de cliente como `dbui`. Lo que necesitas es que el DBMS (por ejemplo, MySQL o PostgreSQL) esté corriendo en un contenedor, y que el cliente (`dbui`) esté configurado correctamente para conectarse a ese servidor de base de datos. El cliente se conecta al contenedor usando la IP o el puerto mapeado, sin necesidad de instalar el DBMS en el host.*

### ***Resumen***

---

#### ***1. Clientes de Bases de Datos:***

- *Los clientes de bases de datos, como `dbui`, `DBeaver`, `MySQL Workbench`, `pgAdmin`, o incluso las herramientas de línea de comandos como `mysql` o `psql`, funcionan como interfaces para interactuar con el servidor de base de datos. **No requieren que el servidor de base de datos (DBMS)** esté instalado en la misma máquina donde se ejecuta el cliente. Solo necesitan tener acceso a un servidor de base de datos que esté en ejecución en otro lugar, como un contenedor o un servidor remoto.*

---

#### ***2. Conexión con el Contenedor:***

- **Docker:** *Si el servidor de base de datos se está ejecutando dentro de un contenedor Docker, el cliente puede conectarse a él utilizando la IP del contenedor o los puertos mapeados entre el contenedor y el host.*
- **Redes Externas:** *Si el servidor de base de datos se encuentra en una máquina remota o en otro contenedor en la misma red, el cliente puede conectarse a él proporcionando la IP y el puerto correcto.*

---

#### ***3. Independencia del DBMS en el Host:***

- *No es necesario que el cliente tenga el DBMS instalado en la misma máquina. Por ejemplo, si tienes un contenedor corriendo MySQL o PostgreSQL, puedes usar un cliente como `DBeaver` en tu máquina local (host) para conectarte a ese contenedor sin necesidad de instalar MySQL o PostgreSQL en tu máquina.*

---

### ***Ejemplos de Clientes y su Funcionamiento***

- **DBeaver:** *Al igual que `dbui`, es un cliente universal para bases de datos que puede conectarse a varios tipos de servidores de bases de datos, ya sea MySQL, PostgreSQL, SQLite, Oracle, etc. No necesita tener el servidor de base de datos instalado en el host.*
  
- **pgAdmin:** *Un cliente gráfico específico para PostgreSQL. Puedes conectarte a un servidor PostgreSQL que esté corriendo en un contenedor Docker sin tener PostgreSQL instalado en tu máquina local.*

- **MySQL Workbench:** *Un cliente gráfico para MySQL. Similar a `dbui` y `DBeaver`, solo necesita conectarse a un servidor MySQL (puede ser un contenedor Docker) y no requiere que MySQL esté instalado en el host.*

- **psql (PostgreSQL CLI)** y **mysql (MySQL CLI):** *Herramientas de línea de comandos que permiten conectarse a servidores de bases de datos MySQL y PostgreSQL. Puedes utilizarlas para conectarte a un servidor MySQL o PostgreSQL en un contenedor sin tener esos DBMS instalados en tu máquina local.*

---

### ***¿Qué necesitas para conectarte?***

1. **Cliente de Base de Datos:** *Puede ser una aplicación de terminal, una herramienta gráfica o un cliente como `dbui`, `DBeaver`, `MySQL Workbench`, `pgAdmin`, `psql`, etc.*

2. **Acceso al Servidor de Base de Datos:** *El cliente necesita conocer la dirección IP o el nombre de host del servidor de base de datos, además del puerto correcto y las credenciales necesarias (usuario, contraseña, etc.).*

3. **Servidor de Base de Datos:** *El servidor DBMS (MySQL, PostgreSQL, SQLite, etc.) debe estar en ejecución, ya sea en un contenedor, una máquina virtual o un servidor físico. El cliente se conecta a ese servidor para interactuar con las bases de datos.*

### ***En resumen:***

-*Este comportamiento **aplica a todos los clientes de bases de datos**, sin importar si son clientes de terminal o aplicaciones gráficas. No es necesario tener el DBMS instalado en el host, ya que el cliente se conecta al servidor de base de datos, que puede estar en un contenedor o en un servidor remoto, mientras que el cliente solo necesita estar configurado para acceder a él a través de la red.*
