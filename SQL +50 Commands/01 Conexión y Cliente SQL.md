<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Conexión y Cliente SQL***

**Cliente SQL**  
**Puedes descargar MySQL Workbench desde el siguiente enlace:**

- [Descargar MySQL Workbench](https://dev.mysql.com/downloads/workbench/ "https://dev.mysql.com/downloads/workbench/")

**Obtenemos los datos de todos los contenedores:**  

- *Para listar todos los detalles de un contenedor, utilizamos el siguiente comando:*

```bash
docker inspect mysql-practicas | less
```

- *Esto muestra la información detallada del contenedor `mysql-practicas`.*

**Si queremos ver todo el contenido de la inspección:**  

- **Podemos usar el mismo comando anterior con `| less` para paginar el contenido:**

```bash
docker inspect mysql-practicas | less
```

**Filtrando datos específicos:**  

- **Para extraer información específica, como la dirección IP del contenedor, usamos `--format`:**

```bash
docker inspect --format "{{.NetworkSettings.IPAddress}}" mysql-practicas
```

- **En este caso, el resultado será algo como:**

```bash
172.17.0.3
```

**Explicación del formato:**  

- **`{{` y `}}`:** *Indican el uso de una expresión dentro del formato.*
- **`NetworkSettings`:** *Hace referencia al apartado de configuración de red del contenedor.*
- **`IPAddress`:** *Extrae la dirección IP asignada al contenedor.*

**Visualización de los puertos expuestos por el contenedor:**  

- *Puedes consultar los puertos expuestos por el contenedor `mysql-practicas` con el siguiente comando:*

```bash
docker container port mysql-practicas
```

- **El resultado será algo como:**

```bash
3306/tcp -> 0.0.0.0:3306
3306/tcp -> [::]:3306
```

```bash
docker container port mysql-practicas | sed -n 's/.*\([0-9]\{4\}\).*$/\1/p' | head -n 1
3306
```

```bash
docker container port mysql-practicas | awk -F':' '{print $NF}' | head -n 1
3306
```

- *Este comando muestra cómo los puertos internos del contenedor (3306/tcp) están expuestos a tu máquina local en la IP `0.0.0.0` y la dirección `::` (IPv6).*

---

## ***`sed -n 's/.*\([0-9]\{4\}\).*$/\1/p'`***

1. **`sed -n`:** *`sed` es una herramienta de procesamiento de texto que utiliza expresiones regulares. La opción `-n` le dice a `sed` que no imprima automáticamente todas las líneas, sino solo las líneas que coinciden con el comando de sustitución especificado.*

2. **`s/.*\([0-9]\{4\}\).*$/\1/p`:** *Este es el comando de sustitución que `sed` está ejecutando:*
   - **`s/`:** *Inicia la sustitución.*
   - **`.*`:** *Coincide con cualquier cantidad de caracteres al principio de la línea.*
   - **`\([0-9]\{4\}\)`:** *Captura un grupo de exactamente cuatro dígitos. Los paréntesis `\(` y `\)` definen un grupo de captura en `sed`, y `\{4\}` especifica que debe haber exactamente cuatro dígitos.*
   - **`.*$`:** *Coincide con cualquier cantidad de caracteres después de los cuatro dígitos hasta el final de la línea.*
   - **`\1`:** *Reemplaza la línea completa con el contenido del primer grupo de captura, que en este caso son los cuatro dígitos.*
   - **`p`:** *Imprime la línea que ha sido modificada (es decir, la línea que ha sido reemplazada por el grupo de captura).*

- **En resumen, este comando busca líneas que contengan cuatro dígitos y reemplaza la línea completa con esos cuatro dígitos.**

---

### ***`head -n 1`***

- **`head -n 1`:** *Esta parte del comando toma solo la primera línea de la salida que `sed` ha producido. Esto es útil si `sed` devuelve más de una línea y solo quieres la primera.*

**En conjunto, el comando completo:**

```bash
sed -n 's/.*\([0-9]\{4\}\).*$/\1/p' | head -n 1
```

- *Encuentra y extrae los cuatro dígitos de la entrada, y luego toma solo la primera línea de esa salida para evitar duplicados o múltiples resultados.*

---

### ***`awk -F':' '{print $NF}'`***

1. **`awk`:** *`awk` es una herramienta de procesamiento de texto que usa patrones y acciones para manipular datos en texto.*

2. **`-F':'`:** *Establece el delimitador de campo a `:`. Esto le dice a `awk` que divida cada línea de entrada en campos usando el carácter `:` como separador.*

3. **`'{print $NF}'`:**

- **`$NF`:** *Es una variable especial en `awk` que representa el último campo de una línea. `NF` es el número total de campos en la línea actual, y `$NF` accede al valor del último campo.*

- *En conjunto, `awk -F':' '{print $NF}'` divide cada línea en campos usando `:` como delimitador y luego imprime el último campo de cada línea.*

### ***`head -n 1`:***

- **`head -n 1`:** *Muestra solo la primera línea de la salida. Esto es útil si hay múltiples líneas en la salida y solo quieres la primera.*

- **Entonces, el comando completo:**

```bash
awk -F':' '{print $NF}' | head -n 1
```

- *divide cada línea de la entrada usando `:` como delimitador, imprime el último campo de cada línea, y luego toma solo la primera línea de esa salida. Esto debería darte el puerto `5432` sin duplicados y solo la primera instancia en caso de que haya múltiples líneas.*

---

## ***Obtener datos del contenedor***

- **Para extraer información específica del contenedor, utilizamos el comando `docker inspect` con el flag `--format` para aplicar un formato personalizado. La sintaxis es importante para extraer datos precisos.**

**Ejemplo:**

```bash
docker inspect --format "{{.NetworkSettings.IPAddress}}" sqlite3-practicas
```

**Explicación de los componentes:**

- **`{{` y `}}`:** *Delimitadores que indican el comienzo y el final de una expresión de formato.*
- **`.NetworkSettings`:** *Accede a la sección de configuración de red del contenedor.*
- **`.IPAddress`:** *Extrae la dirección IP del contenedor.*

- *En el ejemplo, `172.17.0.2` es la dirección IP asignada al contenedor `sqlite3-practicas`.*

**Explicación de las flags y el formato:**

- **`-f` o `--format`:** *Permite definir un formato personalizado para la salida del comando `docker inspect`.*

**Ejemplo de uso:**

```bash
docker inspect -f "{{.GraphDriver.Data.MergedDir}}" sqlite3-practicas
```

- *Este comando devuelve la ruta al directorio de fusión del contenedor:*

```bash
/var/lib/docker/overlay2/76c9fde95efb4fc9abd94eee0d3fc95dc29a03d935fba895bc3dcd24fdda1e57/merged
```

**Explicación del comando complejo:**

```bash
sudo rg --files --glob '*.db' "$(docker inspect -f '{{.GraphDriver.Data.MergedDir}}' sqlite3-practicas)$(docker exec sqlite3-practicas awk -F: '/sqlite/ {print $6}' /etc/passwd)" | xclip -selection clipboard
```

- **`sudo rg --files --glob '*.db'`:** *Usa `ripgrep` para buscar ficheros con extensión `.db`.*
- **`$(docker inspect -f '{{.GraphDriver.Data.MergedDir}}' sqlite3-practicas)`:** *Inserta la ruta del directorio de fusión del contenedor.*
- **`$(docker exec sqlite3-practicas awk -F: '/sqlite/ {print $6}' /etc/passwd)`:** *Extrae la ruta del directorio de usuario del contenedor para la base de datos SQLite.*
- **`| xclip -selection clipboard`:** *Copia la salida al portapapeles.*

**Nota sobre SQLite 3 y VSCode:**

- *Para trabajar con SQLite3 dentro de un contenedor y evitar problemas de permisos y compatibilidad con VSCode, usamos la extensión `Dev Containers`.*

**Problemas al usar la ruta directamente:**

- **Permisos:** *La ruta `/var/lib/docker/overlay2/4f9ce71ab5fde25c264556a6515742262d7d82dd719999e953d348aff2ef58a9/merged/home/sqlite/database.db/var/lib/docker/overlay2/4f9ce71ab5fde25c264556a6515742262d7d82dd719999e953d348aff2ef58a9/merged/home/sqlite/databases.db` no está accesible para el usuario normal por razones de seguridad.*
- **VSCode como root:** *Iniciar VSCode con permisos de root no es recomendable debido a problemas con extensiones y seguridad.*

**Pasos para configurar un contenedor SQLite3:**

1. **Detener y eliminar el contenedor:**

   ```bash
   docker stop sqlite3-practicas
   docker rm sqlite3-practicas
   ```

2. **Instalar las extensiones necesarias en VSCode:**

   - **MySQL:**
     - **Nombre:** *MySQL*
     - **ID:** *cweijan.vscode-mysql-client2*
     - **Descripción:** *Database manager for MySQL/MariaDB, PostgreSQL, SQLite, Redis and ElasticSearch.*
     - **Versión:** *4.5.12*
     - **Editor:** *Weijan Chen*
     - **Enlace:** *[VS Marketplace](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-mysql-client2 "https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-mysql-client2")*

   - **Dev Containers:**
     - **Nombre:** *Dev Containers*
     - **ID:** *ms-vscode-remote.remote-containers*
     - **Descripción:** *Open any folder or repository inside a Docker container and take advantage of Visual Studio Code's full feature set.*
     - **Versión:** *0.386.0*
     - **Editor:** *Microsoft*
     - **Enlace:** *[VS Marketplace](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers "https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers")*

3. **Crear una base de datos localmente:**

   ```bash
   sudo apt-get update && sudo apt-get install -y sqlite3
   ```

   **Crear y verificar la base de datos:**

   ```bash
   sqlite3 /home/vscode/databases.db
   SQLite version 3.37.2 2022-01-06 13:25:41
   Enter ".help" for usage hints.
   sqlite> .databases
   sqlite> main: /home/vscode/databases.db r/w
   ```

4. **Conectar la base de datos usando la extensión del cliente:**
   - **Ruta de la base de datos:** *`/home/vscode/databases.db`*

---

### ***Obtener datos del contenedor:***

**Para obtener la dirección IP de un contenedor, usamos el siguiente comando:**

```bash
docker inspect --format "{{.NetworkSettings.IPAddress}}" postgres-practicas
```

**El resultado es:**

```bash
172.17.0.4
```

**Para visualizar los puertos expuestos por el contenedor, usamos:**

```bash
docker container port postgres-practicas
```

**La salida será algo como:**

```bash
5432/tcp -> 0.0.0.0:5432
5432/tcp -> [::]:5432
```

```bash
docker container port postgres-practicas | sed -n 's/.*\([0-9]\{4\}\).*$/\1/p' | head -n 1
5432
```

```bash
docker container port postgres-practicas | awk -F':' '{print $NF}' | head -n 1
5432
```

---

### ***Configuración de conexiones en VSCode:***

- **Para añadir una nueva conexión en la extensión de VSCode:**

1. *Presiona `Ctrl + Shift + P` para abrir la paleta de comandos.*
2. *Elige la opción para añadir una nueva conexión.*

- *Dependiendo del tipo de base de datos, completa los campos necesarios y haz clic en el botón **Connect**.*

---

### ***Configuración de conexión para MySQL:***

```json
{
  "key": "",
  "command": "mysql.connection.add",
  "when": "view =~ /cweijan.+?ql/"
}
```

- **Llena los campos de la siguiente manera:**

- **Connection Name:** *MySQL Practicas*
- **Server Type:** *MySQL*
- **Host:** *172.17.0.3*
- **Port:** *3306*
- **Username:** *root*
- **Password:** *root*

- *Haz clic en **Connect**.*

![Image ClienteMySQL](/Images/ClienteMySQL.png "/Images/ClienteMySQL.png")
![Image ClienteMySQLComplete](/Images/ClienteMySQLComplete.png "/Images/ClienteMySQLComplete.png")

---

### ****Configuración de conexión para PostgreSQL:****

- **Llena los campos de la siguiente manera:**

- **Connection Name:** *PostgreSQL Practicas*
- **Server Type:** *PostgreSQL*
- **Host:** *172.17.0.4*
- **Port:** *5432*
- **Username:** *postgres*
- **Password:** *root*

- *Haz clic en **Connect**.*

![Image ClientePostgresSQL](/Images/ClientePostgresSQL.png "/Images/ClientePostgresSQL.png")

---

#### ***Configuración de conexión para SQLite:***

- **Llena los campos de la siguiente manera:**

- **Connection Name:** *SQLite Practicas*
- **Server Type:** *SQLite*
- **SQLite File Path:** */home/vscode/databases.db*

- *Haz clic en **Connect**.*

![Image ClienteSQLite3](/Images/ClienteSQLite3.png "/Images/ClienteSQLite3.png")

---

### ***Detenemos Todos los Contenedores***

```bash
docker container stop --signal SIGTERM --time 3 $(docker container ps --all --quiet --filter status=running)
```

```bash
docker stop -sSIGTERM -t3 $(docker ps -aqfstatus=running)
```

---

### ***Query***

> [!NOTE]
> *Una **query** es una instrucción que enviamos a una base de datos para realizar una operación, ya sea para **consultar** (leer), **modificar** (insertar, actualizar o eliminar) datos, o **administrar** la estructura de la base de datos (crear tablas, usuarios, etc.).*

---

### ***Crear una base de datos en MySQL***

- *Una **base de datos** es un espacio donde se almacenan datos estructurados de manera organizada, permitiendo el acceso, la gestión y la manipulación de los mismos. Para crear una base de datos en MySQL, puedes usar el siguiente comando:*

```bash
mysql> CREATE DATABASE hello_mysql;
Query OK, 1 row affected (0.01 sec)
```

- *Este comando crea una base de datos llamada `hello_mysql`. El mensaje `Query OK` confirma que la operación se realizó con éxito.*

---

### ***Crear una base de datos en PostgreSQL***

- *En PostgreSQL, una base de datos también es una colección organizada de datos. Para crear una base de datos, utilizamos el siguiente comando:*

```bash
postgres=# CREATE DATABASE hello_postgresql;
CREATE DATABASE
```

- *Este comando crea una base de datos llamada `hello_postgresql`. La confirmación aparece como `CREATE DATABASE`.*

---

### ***Ver la Lista de Bases de Datos***

- *Para ver la lista de bases de datos en PostgreSQL, puedes usar el comando `\l` (o `\list`) en el shell de `psql`. Esto te mostrará una tabla con información sobre todas las bases de datos disponibles en el servidor.*

#### ***Comando para Listar Bases de Datos***

```sql
\l
```

#### ***Significado de Cada Campo***

**Aquí está el significado de cada campo en la salida del comando `\l`:**

- **Name:** *El nombre de la base de datos.*
- **Owner:** *El nombre del usuario o rol que es el propietario de la base de datos.*
- **Encoding:** *El conjunto de caracteres utilizado para la base de datos (por ejemplo, UTF8).*
- **Locale Provider:** *El proveedor de configuración regional utilizado (generalmente `libc`).*
- **Collate:** *La configuración regional para ordenar texto (ej., `en_US.utf8`).*
- **Ctype:** *La configuración regional para clasificación de caracteres (ej., `en_US.utf8`).*
- **ICU Locale:** *La configuración regional de ICU (International Components for Unicode), si se utiliza.*
- **ICU Rules:** *Las reglas de clasificación de ICU, si se utilizan.*
- **Access privileges:** *Los privilegios de acceso asignados a los usuarios para esa base de datos.*

#### ***Ejemplo de Salida***

```sql
\l
```

```sql
postgres=# \l
                                                          List of databases
       Name       |  Owner   | Encoding | Locale Provider |  Collate   |   Ctype    | ICU Locale | ICU Rules |   Access privileges
------------------+----------+----------+-----------------+------------+------------+------------+-----------+-----------------------
 postgres         | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           |
 template0        | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           | =c/postgres          +
                  |          |          |                 |            |            |            |           | postgres=CTc/postgres
 template1        | postgres | UTF8     | libc            | en_US.utf8 | en_US.utf8 |            |           | =c/postgres          +
                  |          |          |                 |            |            |            |           | postgres=CTc/postgres
(3 rows)
```

- **postgres:** *La base de datos predeterminada de PostgreSQL.*
- **template0** *y* **template1:** *Bases de datos de plantilla utilizadas por PostgreSQL para crear nuevas bases de datos. Estas no deben ser modificadas directamente.*

---

### ***Notas Adicionales***

- **`postgres`:** *Es la base de datos por defecto que se crea durante la instalación de PostgreSQL.*
- **`template0`** *y* **`template1`:** *Son bases de datos de plantilla que se usan para crear nuevas bases de datos. No se deben modificar, ya que se utilizan para mantener el estado original de las plantillas.*

*Para obtener más detalles sobre una base de datos específica o sus tablas, puedes conectarte a la base de datos usando `\c <nombre_base_de_datos>` y luego usar comandos como `\dt` para listar las tablas, `\d <nombre_tabla>` para obtener detalles sobre una tabla específica, etc.*

---

### ***Crear una base de datos en SQLite***

- *En SQLite, una base de datos es un fichero que contiene toda la estructura y datos de la base. Para crear una base de datos, puedes usar los siguientes comandos:*

```bash
sqlite> .open /home/vscode/hello_sqlite3.db
sqlite> .databases
main: /home/vscode/hello_sqlite3.db r/w
```

- *El comando `.open` crea (si no existe) y abre la base de datos `hello_sqlite3.db`. Luego, el comando `.databases` muestra las bases de datos abiertas, confirmando que la base de datos `hello_sqlite3.db` está disponible para lectura y escritura (`r/w`).*

---

### ***Cambiar el Nombre del Contenedor***

1. **Detén el contenedor** *(si está en ejecución):*

   ```bash
   docker stop charming_dubinsky
   ```

2. **Renombra el contenedor** *usando el comando `docker container rename` o `docker rename`:*

   ```bash
   docker container rename charming_dubinsky container-sqlite3-practicas
   ```

   *Reemplaza `container-sqlite3-practicas` con el nombre que deseas darle al contenedor.*

   ```bash
   docker ps -a
   CONTAINER ID   IMAGE                                                                                    COMMAND                  CREATED        STATUS                      PORTS                                                  NAMES
   2f5501c4ebac   vsc-sql50commands-ba3450d17e10e5014da786185946033e2475defd21c414d45c49c45cfb08108d-uid   "/bin/sh -c 'echo Co…"   3 hours ago    Exited (0) 54 seconds ago                                                          container-sqlite3-practicas
   04bbdb5a0193   postgres                                                                                 "docker-entrypoint.s…"   24 hours ago   Up 4 hours                  0.0.0.0:5432->5432/tcp, :::5432->5432/tcp              postgres-practicas
   9ae8377f53ab   mysql                                                                                    "docker-entrypoint.s…"   24 hours ago   Up 4 hours                  0.0.0.0:3306->3306/tcp, :::3306->3306/tcp, 33060/tcp   mysql-practicas
   ```

3. **Inicia el contenedor** *nuevamente si es necesario:*

   ```bash
   docker start -i container-sqlite3-practicas
   ```

---

### ***Cambiar el Nombre de la Imagen***

- **Para cambiar la etiqueta de una imagen, sigue estos pasos:**

1. **Listar las imágenes disponibles** *para encontrar la ID de la imagen que deseas renombrar:*

   ```bash
   docker images
   ```

2. **Etiquetar la imagen con un nuevo nombre** *usando el comando `docker image tag` o `docker tag`:*

   ```bash
   docker image tag vsc-sql50commands-ba3450d17e10e5014da786185946033e2475defd21c414d45c49c45cfb08108d-uid:latest d4nitrix13/sqlite3-practicas:latest
   ```

   - *Reemplaza `id imagen` o `nombre imagen con el tag completo` con la ID actual de la imagen, y `nuevo_nombre:etiqueta` con el nuevo nombre y etiqueta que desees.*

   ```bash
   docker images -a
   REPOSITORY                                                                               TAG       IMAGE ID       CREATED       SIZE
   d4nitrix13/sqlite3-practicas                                                             latest    62edb801e1cc   3 hours ago   681MB
   vsc-sql50commands-ba3450d17e10e5014da786185946033e2475defd21c414d45c49c45cfb08108d-uid   latest    62edb801e1cc   3 hours ago   681MB
   keinos/sqlite3                                                                           latest    b7ab10f897c7   2 days ago    15.4MB
   postgres                                                                                 latest    b781f3a53e61   5 weeks ago   432MB
   mysql                                                                                    latest    680b8c60dce6   8 weeks ago   586MB
   ```

3. **Eliminar la etiqueta antigua** *(opcional, si ya no necesitas la imagen con la etiqueta antigua):*

   ```bash
   docker rmi vsc-sql50commands-ba3450d17e10e5014da786185946033e2475defd21c414d45c49c45cfb08108d-uid:latest
   ```

   ```bash
   docker rmi -f vsc-sql50commands-ba3450d17e10e5014da786185946033e2475defd21c414d45c49c45cfb08108d-uid:latest
   Untagged: vsc-sql50commands-ba3450d17e10e5014da786185946033e2475defd21c414d45c49c45cfb08108d-uid:latest
   ```

   - *Ten en cuenta que eliminar la imagen solo eliminará la etiqueta, no los datos de la imagen si están en uso por otros contenedores.*

- **Aquí un ejemplo completo:**

1. **Detén y renombra el contenedor:**

   ```bash
   docker stop charming_dubinsky
   docker rename charming_dubinsky container-sqlite3-practicas
   docker start -i container-sqlite3-practicas
   ```

2. **Cambia la etiqueta de la imagen:**

   ```bash
   docker tag vsc-sql50commands-ba3450d17e10e5014da786185946033e2475defd21c414d45c49c45cfb08108d-uid:latest d4nitrix13/sqlite3-practicas:latest
   docker rmi vsc-sql50commands-ba3450d17e10e5014da786185946033e2475defd21c414d45c49c45cfb08108d-uid:latest
   ```

- *Asegúrate de que no haya contenedores en ejecución que dependan de la imagen antes de eliminar la etiqueta antigua.*

---

### ***Iniciar el Contenedor***

```bash
docker start -i container-sqlite3-practicas
```

- **Descripción:** *Este comando inicia el contenedor llamado `container-sqlite3-practicas`.*
- **Opciones:**
  - **`-i`:** *Permite la entrada interactiva al contenedor.*
  - **`-t`:** *Asigna un pseudo-TTY, útil para la interacción con la terminal.*

---

### ***Conectarse a SQLite con un Cliente CLI***

```bash
docker exec --interactive --tty --privileged --user vscode container-sqlite3-practicas sqlite3 /home/vscode/hello_sqlite3.db
```

- **Descripción:** *Este comando se utiliza para ejecutar el cliente de SQLite dentro del contenedor.*
- **Componentes del comando:**
  - **`docker exec`:** *Ejecuta un comando en un contenedor en ejecución.*
  - **`--interactive` (`-i`):** *Mantiene la entrada estándar abierta para la interacción.*
  - **`--tty` (`-t`):** *Proporciona un terminal interactivo.*
  - **`--privileged`:** *Permite al contenedor ejecutar comandos que requieren privilegios adicionales (opcional, según necesidades).*
  - **`--user vscode` (`-u, --user string`):** *Especifica el usuario bajo el cual se ejecutará el comando, en este caso, `vscode`.*
  - **`container-sqlite3-practicas`:** *El nombre del contenedor en el que se ejecuta el cliente SQLite.*
  - **`sqlite3 /home/vscode/hello_sqlite3.db`:** *Inicia el cliente SQLite y abre la base de datos `hello_sqlite3.db` ubicada en el directorio `/home/vscode/`.*

---

### ***Mensaje de Bienvenida***

```sql
SQLite version 3.37.2 2022-01-06 13:25:41
Enter ".help" for usage hints.
sqlite>
```

- **Descripción:** *Al conectarte exitosamente, verás la versión de SQLite y un mensaje de ayuda que indica que puedes escribir `.help` para obtener más información sobre los comandos disponibles en SQLite.*

---

### ***Explicación***

> [!CAUTION]
> *Al ejecutar el comando `docker exec -it container-sqlite3-practicas sqlite3`, si no especificas el usuario, Docker ejecutará el comando como **root** por defecto. Esto es debido a que el usuario root es el usuario predeterminado en la mayoría de las imágenes de Docker, a menos que se haya configurado explícitamente otro usuario en el archivo `Dockerfile` o con el argumento `--user` durante la creación del contenedor.*

1. **Comando ejecutado como root:**

   **Si ejecutas el siguiente comando sin especificar el usuario:**

   ```bash
   docker exec -it container-sqlite3-practicas sqlite3
   ```

   - **Por defecto,** *este comando se ejecutará como el usuario **root** dentro del contenedor, ya que no se especificó el usuario a través del argumento `--user`.*
   - **root** *tiene acceso a todos los archivos y permisos en el sistema de archivos del contenedor, lo que incluye la capacidad de ejecutar el cliente SQLite y acceder a cualquier archivo de base de datos en el contenedor.*

2. **Por qué sucede:**
   - *Docker ejecuta comandos dentro de contenedores como root de forma predeterminada a menos que se le indique lo contrario. Esto proporciona acceso total al sistema dentro del contenedor, pero también puede representar un riesgo si no se maneja con cuidado, especialmente si el contenedor tiene más permisos de los necesarios.*

3. **Ejemplo de ejecución como root:**

   ```bash
   docker exec -it container-sqlite3-practicas sqlite3 /home/vscode/hello_sqlite3.db
   ```

   - *Este comando abrirá la base de datos `hello_sqlite3.db` en SQLite como el usuario **root** dentro del contenedor. Aunque esto funcionará sin problemas, es importante entender que cualquier operación que realices dentro del contenedor tendrá los permisos de root.*

---

### ***Especificar otro usuario (vscode en este caso)***

- **Para evitar usar el usuario root y ejecutar el comando como otro usuario (por ejemplo, `vscode`), puedes utilizar el argumento `--user`:**

```bash
docker exec --interactive --tty --user vscode container-sqlite3-practicas sqlite3 /home/vscode/hello_sqlite3.db
```

- **--user vscode:** *Indica que el comando se ejecutará bajo el usuario `vscode`, que puede tener permisos más restringidos según cómo esté configurado el contenedor.*

---

### ***Consideraciones de Seguridad:***

- *Ejecutar comandos como **root** dentro de contenedores puede ser arriesgado, especialmente si esos contenedores tienen acceso a volúmenes o interfaces de red compartidas con el sistema host.*
- *Es buena práctica, cuando sea posible, ejecutar contenedores y comandos bajo un usuario no root para limitar el impacto potencial de vulnerabilidades o errores dentro del contenedor.*

- *En resumen, cuando no se especifica el usuario en un comando `docker exec`, el comando se ejecuta como **root** por defecto. Para mayor seguridad y control, puedes definir un usuario específico con `--user`.*
