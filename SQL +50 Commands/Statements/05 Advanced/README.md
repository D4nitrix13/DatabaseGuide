<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Exportar la Base de Datos MySQL***

- **Para exportar una base de datos MySQL, puedes utilizar la herramienta de línea de comandos `mysqldump`. Este comando permite crear un fichero de volcado (dump) que contiene todas las instrucciones necesarias para recrear la base de datos, incluyendo tablas y datos**

---

## ***1. Usando `mysqldump`***

**El comando básico para exportar una base de datos es:**

```bash
mysqldump -u [user] -p [DatabaseName] > [Fichero].sql
```

- **[user]:** *Tu nombre de user de MySQL.*
- **[DatabaseName]:** *El nombre de la base de datos que deseas exportar.*
- **[Fichero].sql:** *El nombre del fichero donde se guardará el volcado.*

---

## ***2. Ejemplo Práctico***

- **Por ejemplo, si deseas exportar una base de datos llamada `MyDatabase` y tu user es `root`, el comando sería:**

```bash
mysqldump -u root -p MyDatabase > MyDatabaseDump.sql
```

- **Después de ejecutar este comando, se te pedirá que ingreses la contraseña del user.**

---

## ***3. Otras Opciones Útiles***

- **Incluir las DatabaseEstructures de las tablas:**
  - **El comando anterior ya incluye las DatabaseEstructures. Pero si deseas incluir solo las DatabaseEstructures sin los datos, puedes usar `--no-data`:**

  ```bash
  mysqldump -u root -p --no-data MyDatabase > DatabaseEstructure.sql
  ```

- **Incluir datos sin Estructures:**
  - **Para exportar solo los datos, puedes usar `--no-create-info`:**

  ```bash
  mysqldump -u root -p --no-create-info MyDatabase > DatabaseData.sql
  ```

- **Exportar todas las bases de datos:**
  - *Para exportar todas las bases de datos en el servidor MySQL, puedes usar la opción `--all-databases`:*

  ```bash
  mysqldump -u root -p --all-databases > AllDatabaseDump.sql
  ```

- **Comprimir la exportación:**
  - **Si deseas comprimir el volcado, puedes usar una tubería (`|`) junto con `gzip`:**

  ```bash
  mysqldump -u root -p MyDatabase | gzip > MyDatabaseDump.sql.gz
  ```

---

### ***Resumen***

1. *Utiliza `mysqldump` para exportar la base de datos.*
2. *Especifica el user y la base de datos, y redirige la salida a un fichero.*
3. *Usa opciones adicionales según tus necesidades (-DatabaseEstructure, datos, todas las bases, etc.).*

---

## ***Para incluir la contraseña directamente en el comando `mysqldump`, puedes hacerlo de la siguiente manera:***

```bash
mysqldump -u root -proot northwind > DatabaseDump.sql
```

---

### ***Notas Importantes***

1. **Sin Espacio Entre `-p` y la Contraseña:** *Es crucial que no haya un espacio entre `-p` y la contraseña. En el ejemplo anterior, `-proot` es correcto, mientras que `-p root` causará un error.*

2. **Seguridad:** *Incluir la contraseña en la línea de comandos puede ser un riesgo de seguridad, ya que otras personas que estén monitoreando los procesos del sistema pueden ver la contraseña en texto plano. Como alternativa más segura, se recomienda no incluir la contraseña directamente en el comando y, en su lugar, dejar que el sistema te pida la contraseña. Sin embargo, si deseas ejecutar el comando en un script, podrías considerar las siguientes opciones:*

   - **Usar un fichero de configuración:** *Puedes almacenar tus credenciales en un fichero de configuración de MySQL, como `~/.my.cnf`, para evitar tener que escribir la contraseña cada vez. El fichero debería tener el siguiente formato:*

    ```ini
    [client]
    user=root
    password=root
    ```

    - **Asegúrate de establecer permisos restrictivos para este fichero:**

    ```bash
    chmod 600 ~/.my.cnf
    ```

    - *Luego, puedes ejecutar el comando `mysqldump` sin necesidad de proporcionar la contraseña:*

    ```bash
    mysqldump northwind > DatabaseDump.sql
    ```

   - **Pasar la contraseña como variable de entorno** *(menos común pero posible):*

    ```bash
    MYSQL_PWD=root mysqldump -u root northwind > DatabaseDump.sql
    ```

---

### ***Resumen:***

- *Puedes incluir la contraseña directamente en el comando usando `-proot`.*
- *Es recomendable usar un fichero de configuración para almacenar tus credenciales de forma segura y evitar exponer la contraseña en la línea de comandos.*
- *Considera los riesgos de seguridad al manejar contraseñas y opta por métodos más seguros siempre que sea posible.*

---

### ***1. Exportar la Base de Datos con el Comando `USE`***

> [!CAUTION]
> *Para evitar el error `#1046 - No database selected` y asegurarte de que el volcado incluya el comando `USE` al inicio, puedes agregar una instrucción para seleccionar la base de datos directamente en el fichero de exportación al hacer el volcado:*

**Usa la opción `--databases` al ejecutar `mysqldump`. Esto incluye automáticamente el comando `USE nombre_de_base_datos;` en el fichero de volcado.**

**Por ejemplo:**

```bash
mysqldump -u root -p --databases Database > DatabaseDump.sql
```

- *Este comando hará que el fichero `DatabaseDump.sql` contenga el comando `USE Database;` al inicio. Esto permitiráName que MySQL sepa a qué base de datos apuntar al importar los datos, eliminando el error `No database selected`.*

---

### ***2. Agregar el Comando `USE` Manualmente en el fichero de Volcado***

- *Si ya tienes un fichero de volcado sin el comando `USE`, puedes editarlo y agregarlo manualmente al inicio. Abre el fichero `DatabaseDump.sql` en tu editor de texto y añade la línea:*

```sql
USE DatabaseName;
```

---

### ***3. Importar el fichero SQL***

**Luego de asegurarte de que el fichero tiene el comando `USE`, puedes importarlo con:**

```bash
mysql -u root -p < DatabaseDump.sql
```

**O bien, especificando la base de datos al momento de importar:**

```bash
mysql -u root -p Database < DatabaseDump.sql
```

---

### ***1. En SQL***

> [!NOTE]
> **En el contexto de bases de datos y programación, *volcar* (o *dump* en inglés) se refiere a la acción de exportar o copiar el contenido completo de una base de datos, estructura de datos o información relevante de un sistema a un formato de fichero o a otra ubicación. Este fichero, llamado *volcado*, puede usarse para respaldos, migraciones, análisis o auditoría de datos:**

- **En SQL, *volcar* una base de datos significa exportar toda la información de una base de datos (o de ciertas tablas) en un fichero de texto. Este fichero contiene los comandos SQL necesarios para reconstruir los datos y la estructura de la base de datos. Por ejemplo, al hacer un volcado de una base de datos, el fichero resultante suele incluir:**

- *Comandos `CREATE TABLE` para reconstruir la estructura de las tablas.*
- *Comandos `INSERT` para poblar las tablas con los datos actuales.*
- *Otras configuraciones, como la selección de la base de datos a usar (`USE`).*

**Ejemplo de un volcado en MySQL:**

```bash
mysqldump -u root -p DatabaseTest > DatabaseDump.sql
```

- **Este fichero `DatabaseDump.sql` permite restaurar los datos en otra base de datos con un comando `mysql`.**

---

### ***2. En Programación***

- **En programación, *volcar* significa guardar el contenido de una estructura de datos, un objeto o un estado del sistema en un fichero o en algún otro lugar de almacenamiento. Esto permite almacenar el estado en un momento específico para su recuperación, análisis o diagnóstico.**

**Por ejemplo:**

- *Volcado de memoria:* *Es el proceso de guardar el contenido de la memoria (o de ciertas variables) en un fichero para análisis. Esto es útil al depurar errores en un programa o al analizar un *crash*.*
- *Volcado de registros de aplicación:* *Es guardar el estado de ciertas variables o estructuras de datos en un fichero de log para monitoreo o diagnóstico.*

**Ejemplo en Python:**

```python
"""
Aplicacion de volcado de la estructura `data` en formato JSON
"""

# Autor: Daniel Benjamin Perez Morales
# GitHub: https://github.com/D4nitrix13
# Correo electrónico: danielperezdev@proton.me

import json
from typing import Dict, Union

# Una estructura de datos en Python
data: Dict[str, Union[str, int]] = {"name": "Alice", "age": 30, "city": "New York"}

# Volcar datos a un fichero JSON
with open(file=r"./data_dump.json", mode="w", encoding="utf-8") as file:
    json.dump(obj=data, fp=file)
```

**Aquí, `data_dump.json` contiene un volcado de la estructura `data` en formato JSON.**

---

## ***Implementacion***

```bash
docker exec -it -u mysql mysql-practicas bash -c "cd ~/ && exec bash"
```

- **`docker exec`:** *Ejecuta un comando en un contenedor en ejecución.*
- **`-it`:** *Combina dos flags:*
  - **`-i`:** *Mantiene la entrada estándar (stdin) abierta para el contenedor.*
  - **`-t`:** *Asigna un pseudo-terminal (tty) para la interacción.*
- **`-u mysql`:** *Especifica el usuario con el que se ejecutará el comando dentro del contenedor. En este caso, el usuario es `mysql`.*
- **`mysql-practicas`:** *Es el nombre del contenedor en el que se ejecutará el comando.*
- **`bash -c "cd ~/ && exec bash"`:** *Inicia una nueva sesión de bash y cambia al directorio del usuario (`~`).*

---

```bash
touch ~/.my.cnf
```

```bash
bash-5.1$ touch ~/.my.cnf
```

- **`touch`:** *Crea un fichero vacío o actualiza la fecha de acceso y modificación del fichero si ya existe.*
- **`~/.my.cnf`:** *fichero de configuración para el cliente MySQL donde se pueden almacenar las credenciales.*

---

```bash
echo -e "[client]\nuser=root\npassword=root" > !$ && chmod 600 ~/.my.cnf
```

```bash
bash-5.1$ echo -e "[client]\nuser=root\npassword=root" > !$ && chmod 600 ~/.my.cnf
```

- **`echo -e`:** *Imprime texto y permite la interpretación de caracteres de escape como `\n` para nuevas líneas.*
- **`"[client]\nuser=root\npassword=root"`:** *Contenido que se va a escribir en el fichero `.my.cnf`, especificando el cliente, el nombre de usuario y la contraseña.*
- **`> !$`:** *Redirige la salida del comando anterior al fichero especificado. `!$` representa el último argumento del comando anterior (`~/.my.cnf`).*
- **`chmod 600 ~/.my.cnf`:** *Cambia los permisos del fichero para que sólo el propietario tenga permiso de lectura y escritura, lo que mejora la seguridad.*

---

```bash
mysqldump -u root -proot northwind > DatabaseDump.sql
```

```bash
bash-5.1$ mysqldump -u root -proot northwind > DatabaseDump.sql
```

- **`mysqldump`:** *Herramienta para crear volcado de bases de datos MySQL.*
- **`-u root`:** *Especifica el usuario que tiene acceso a la base de datos.*
- **`-proot`:** *Proporciona la contraseña para el usuario sin espacio entre `-p` y la contraseña.*
- **`northwind`:** *Nombre de la base de datos a exportar.*
- **`> DatabaseDump.sql`:** *Redirige la salida del volcado a un fichero llamado `DatabaseDump.sql`.*
- **Advertencia:** *`mysqldump: [Warning] Using a password on the command line interface can be insecure.` Este aviso indica que usar la contraseña directamente en la línea de comandos puede ser un riesgo de seguridad, ya que puede ser visible en el historial de comandos.*

- **Otra forma:**

```bash
docker exec -it -u mysql mysql-practicas echo -e "[client]\nuser=root\npassword=root" > ~/.my.cnf && chmod 600 ~/.my.cnf
```

- *Aquí, el comando `echo` se ejecuta directamente dentro del contenedor y crea el fichero `.my.cnf` con las credenciales necesarias.*

```bash
docker exec -it -u mysql mysql-practicas bash -c "cd ~/ && mysqldump northwind > ~/DatabaseTestDump.sql"
```

- *En este caso, `mysqldump` se ejecuta directamente en el contenedor, volcando la base de datos `northwind` a `DatabaseTestDump.sql` en el directorio home del usuario.*

```bash
docker container cp mysql-practicas:/var/lib/mysql/DatabaseTestDump.sql ./
```

- **`docker container cp`:** *Copia ficheros o directorios entre un contenedor y el sistema de ficheros del host.*
- **`mysql-practicas:/var/lib/mysql/DatabaseTestDump.sql`:** *Ruta del fichero en el contenedor que se va a copiar.*
- **`./`:** *Directorio de destino en el host donde se copiará el fichero.*

- **Otra forma:**

```bash
docker exec -it -u mysql mysql-practicas bash -c "cd ~/ && mysqldump -u root -proot northwind > ~/DatabaseDump.sql"
```

- *Similar al comando anterior, este volcado se realiza utilizando las credenciales especificadas directamente en el comando.*

```bash
docker exec -it -u mysql mysql-practicas bash -c "cd ~/ && mysqldump -u root -proot --no-data northwind > ~/DatabaseEstructureDump.sql"
```

- **`--no-data`:** *Esta opción indica que sólo se debe exportar la estructura de la base de datos (las tablas y su definición), sin los datos contenidos.*

```bash
docker exec -it -u mysql mysql-practicas bash -c "cd ~/ && mysqldump -u root -proot --no-create-info northwind > ~/DatabaseDataDump.sql"
```

- **`--no-create-info`:** *Esta opción permite exportar solo los datos de las tablas, omitiendo la creación de la estructura (CREATE TABLE).*

```bash
docker exec -it -u mysql mysql-practicas bash -c "cd ~/ && mysqldump -u root -proot --all-databases > ~/AllDatabaseDump.sql"
```

- **`--all-databases`:** *Esta opción indica que se deben volcar todas las bases de datos disponibles en el servidor MySQL.*

```bash
docker exec -it -u mysql mysql-practicas bash -c "cd ~/ && mysqldump -u root -proot --databases northwind > ~/DatabaseNorthwindDump.sql"
```

- **`--databases`:** *Permite especificar una o más bases de datos para volcar. Aunque solo se mencione una base de datos, se debe usar esta opción si se están pasando varias.*

---

### ***Uso de Clever Cloud para Importar Bases de Datos***

- *Ahora utilizaremos un servicio de Clever Cloud, específicamente un plan gratuito, aunque también existen opciones de pago. Es importante tener en cuenta que el plan gratuito tiene limitaciones en cuanto a la configuración y los recursos disponibles.*

- *Al importar los datos de la base de datos, el usuario que nos brinda el hosting es único y tiene restricciones de servicio. Además, al crear una base de datos, Clever Cloud nos proporciona un nombre de usuario, contraseña, puerto y host. Debemos adaptar estos datos al query generado al realizar el volcado de la base de datos (dump).*

- *Es crucial borrar o omitir ciertas secciones del SQL exportado para evitar errores durante la importación. Por ejemplo, si el volcado incluye el comando `USE`, se presentará un error similar al siguiente:*

```sql
--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;

MySQL ha dicho: Documentación
#1046 - No database selected
```

---

### ***Prevención del Error #1046 - No Database Selected***

- **Para evitar este error y asegurarte de que el volcado incluya el comando `USE` al inicio, puedes agregar una instrucción que seleccione la base de datos directamente en el fichero de exportación al hacer el volcado. Al importar en Clever Cloud, si recibes el mensaje de error `Access denied for user 'uwdgo355klqfdhm3'@'%' to database 'northwind'`, significa que el usuario de MySQL no tiene los permisos necesarios para crear la base de datos 'northwind'. Esto puede ocurrir si el usuario autenticado no tiene permisos de creación de base de datos o administración.**

---

### ***Ejemplo de SQL a Modificar***

**Aquí hay un ejemplo de cómo deberías modificar el SQL proporcionado por Clever Cloud:**

```sql
-- Creamos la base de datos si no existe y especificamos el conjunto de caracteres y el cifrado.
-- Comentamos porque ya existe la base de datos en Clever Cloud y no es necesario crearla de nuevo.
-- Además, el usuario que usamos en Clever Cloud puede no tener permisos para crear bases de datos.

-- CREATE DATABASE /*!32312 IF NOT EXISTS*/ `northwind` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;

-- Seleccionamos la base de datos `northwind` para ejecutar el resto de los comandos.
-- No es necesario porque Clever Cloud nos asigna una base de datos específica con un nombre personalizado.

-- USE `northwind`;

-- Cambiamos la selección a la base de datos que Clever Cloud nos provee para importar los datos.
-- En Clever Cloud, el nombre de la base de datos suele ser generado automáticamente.
USE `beht46qxiqazh9id5fsn`;
```

---

### ***Recursos Adicionales***

- *Para más información sobre Clever Cloud, puedes visitar su [página oficial](https://www.clever-cloud.com/ "https://www.clever-cloud.com/").*

**Imágenes relacionadas con Clever Cloud:**

- *![Img Clever Cloud .png](/Images/ImgCleverCloud.png "/Images/ImgCleverCloud.png")*
- *![Img Clever Cloud CreateAnAddOn.png](/Images/ImgCleverCloudCreateAnAddOn.png "/Images/ImgCleverCloudCreateAnAddOn.png")*
- *![Img Clever Cloud SelectDatabaseManagerSystems.png](/Images/ImgCleverCloudSelectDatabaseManagerSystems.png "/Images/ImgCleverCloudSelectDatabaseManagerSystems.png")*
- *![Img Clever Cloud SelectPlan.png](/Images/ImgCleverCloudSelectPlan.png "/Images/ImgCleverCloudSelectPlan.png")*
- *![Img Clever Cloud BotonNext.png](/Images/ImgCleverCloudBotonNext.png "/Images/ImgCleverCloudBotonNext.png")*
- *![Img Clever Cloud SelectRegion.png](/Images/ImgCleverCloudSelectRegion.png "/Images/ImgCleverCloudSelectRegion.png")*
- *![Img Clever Cloud AdminDatabase.png](/Images/ImgCleverCloudAdminDatabase.png "/Images/ImgCleverCloudAdminDatabase.png")*
- *![Img Clever Cloud PhpMyAdmin.png](/Images/ImgCleverCloudPhpMyAdmin.png "/Images/ImgCleverCloudPhpMyAdmin.png")*
- *![Img Clever Cloud ImportDatabse.png](/Images/ImgCleverCloudImportDatabse.png "/Images/ImgCleverCloudImportDatabse.png")*
- *![Img Clever Cloud ImportFinalizado.png](/Images/ImgCleverCloudImportFinalizado.png "/Images/ImgCleverCloudImportFinalizado.png")*
- *![Img Clever Cloud Env.png](/Images/ImgCleverCloudEnv.png "/Images/ImgCleverCloudEnv.png")*

**Repositorio de GitHub para MySQL Northwind:** *[GitHub - Northwind](https://github.com/dalers/mywind/tree/master "https://github.com/dalers/mywind/tree/master")*

**Otros Servicios de Hosting Recomendados:**

- *[Raiola Networks](https://raiolanetworks.com/ "https://raiolanetworks.com/")*
- *[Supabase](https://supabase.com/ "https://supabase.com/")*
- *[PlanetScale](https://planetscale.com/ "https://planetscale.com/")*
