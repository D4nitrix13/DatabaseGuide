<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Ejercicios de Consultas SQL***

---

## ***Comando de Copia del Archivo SQL en Docker***

```bash
docker container cp jardineria.sql sqlpreview:/tmp/jardineria.sql
```

- **Este comando copia el archivo `jardineria.sql` desde tu máquina local al contenedor `sqlpreview`, específicamente en la ruta `/tmp/jardineria.sql`. Es útil para preparar el archivo antes de ejecutarlo en SQL Server dentro del contenedor Docker.**

**Confirmación de Copia Exitosa:**

```bash
docker container cp jardineria.sql sqlpreview:/tmp/jardineria.sql
Successfully copied 142kB to sqlpreview:/tmp/jardineria.sql
```

---

### ***Ejecución del Script SQL en el Contenedor***

- **Para ejecutar el archivo `.sql` en SQL Server dentro de Docker, puedes usar el siguiente comando:**

```bash
docker exec -i sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -d Northwind -i /tmp/jardineria.sql
```

- **Este comando intenta ejecutar el script SQL `jardineria.sql` en la base de datos `Northwind`. Sin embargo, puede aparecer un error si la base de datos `Northwind` no existe o si hay problemas de autenticación.**

---

### ***Errores Comunes y Soluciones***

1. **Error de Conexión a la Base de Datos:**

   ```bash
   Sqlcmd: Error: Microsoft ODBC Driver 17 for SQL Server : Cannot open database "Northwind" requested by the login. The login failed..
   Sqlcmd: Error: Microsoft ODBC Driver 17 for SQL Server : Login failed for user 'sa'..
   ```

   - **Este error indica que la base de datos `Northwind` no está disponible o no se puede acceder con el usuario especificado. Asegúrate de que:**
   - *La base de datos `Northwind` exista en el servidor.*
   - *Las credenciales de inicio de sesión sean correctas.*
   - *No haya restricciones de permisos para el usuario `sa`.*

2. **Error de Sintaxis al Crear la Base de Datos:**

   ```bash
   Msg 911, Level 16, State 1, Server sqlpreview, Line 7
   Database 'jardineria' does not exist. Make sure that the name is entered correctly.
   Msg 156, Level 15, State 1, Server sqlpreview, Line 6
   Incorrect syntax near the keyword 'SET'.
   ```

   - **Este mensaje puede aparecer si el script intenta crear una base de datos usando la sintaxis de MySQL (`CHARACTER SET`), que no es compatible con SQL Server. SQL Server no requiere definir el conjunto de caracteres de esta manera.**

   **Solución:**
   - *Elimina la opción `CHARACTER SET` del script.*
   - *Asegúrate de que la sintaxis sea compatible con SQL Server.*

---

### Modificación del Script para SQL Server

```bash
cat ./jardineria.sql | head --lines=+8
```

**Para SQL Server, un script básico de creación de base de datos puede verse así:**

```sql
-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/D4nitrix13
-- Correo electrónico: danielperezdev@proton.me

DROP DATABASE IF EXISTS jardineria;  -- Compatible en SQL Server 2016 y posteriores
CREATE DATABASE jardineria; 
GO
USE jardineria;
```

- **Nota sobre `GO`:** *La instrucción `GO` en SQL Server separa los bloques de ejecución de comandos. Si no se usa, el script podría fallar en operaciones donde se requiere un cambio de contexto (por ejemplo, `USE` en una nueva base de datos).*

---

### Ejecución del Script SQL Modificado en Docker

- **Después de modificar el script, puedes ejecutar el comando de nuevo en Docker. Asegúrate de especificar `master` como base de datos de inicio, ya que la base de datos `jardineria` aún no existe:**

```bash
docker exec -i sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -d master -i /tmp/jardineria.sql
```

---

### ***Ejemplo de Conexión al Contenedor SQL Server en Docker***

- **Para conectarte directamente a la base de datos `jardineria` y ejecutar comandos manualmente, puedes usar:**

```bash
docker exec -it sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -d jardineria
```

**Solución de Problemas:**

1. **Reiniciar el Contenedor SQL Server:** *Si el contenedor no responde, reinícialo con:*

   ```bash
   docker container restart sqlpreview
   ```

2. **Adjuntar al Contenedor:** *Para ver los logs y mensajes en tiempo real:*

   ```bash
   docker attach sqlpreview
   ```

---

### ***Notas Adicionales***

- **Compatibilidad de Versiones:** *El comando `DROP DATABASE IF EXISTS` es compatible con SQL Server 2016 en adelante.*
- **Prueba en Cliente SQL:** *Si sigues teniendo problemas en Docker, intenta ejecutar el script directamente en un cliente SQL Server como SQL Server Management Studio. Esto puede ayudarte a identificar si el problema es del script o del entorno Docker.*

---

### ***Resumen***

- *Estos ajustes deberían permitirte crear la base de datos `jardineria` en SQL Server sin problemas. Si surge otro error, revisa los mensajes y ajusta la sintaxis o la configuración de Docker en función de las instrucciones aquí descritas.*

- **Ejecución del comando:**

```bash
docker exec -i sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -i /tmp/Jardineria\ SQL\ Server.sql
```

- **permite ejecutar el script SQL (`Jardineria SQL Server.sql`) en una instancia de SQL Server que está ejecutándose en un contenedor Docker. Aquí está el detalle de cada parte del comando:**

1. **`docker exec -i sqlpreview`:** *Ejecuta un comando dentro del contenedor Docker que se llama `sqlpreview`. El flag `-i` indica que la entrada del contenedor se conecta a la entrada estándar del comando de Docker, lo cual permite que el script se ejecute como si fuera un proceso interactivo dentro del contenedor.*

2. **`/opt/mssql-tools/bin/sqlcmd`:** *Es el cliente de línea de comandos de SQL Server que se encuentra en la ruta especificada dentro del contenedor.*

3. **`-S localhost`:** *Especifica el servidor de SQL Server al que se conectará `sqlcmd`. En este caso, se conecta a `localhost` porque SQL Server está ejecutándose dentro del contenedor y `localhost` se refiere a esa misma instancia.*

4. **`-U sa -P P@ssw0rd123!`:** *Proporciona las credenciales de conexión con el usuario `sa` (System Administrator) y la contraseña `P@ssw0rd123!`.*

5. **`-i /tmp/Jardineria\ SQL\ Server.sql`:** *Especifica el archivo SQL de entrada que contiene el script para ejecutar en la base de datos.*

- *Cuando se ejecuta este comando, `sqlcmd` procesa las instrucciones SQL en el archivo y las aplica a la base de datos. La respuesta de cada comando, `(1 rows affected)`, indica que se realizó una operación en una o varias filas de la base de datos.*

- **Resultado**
- *El mensaje `(1 rows affected)` se repite varias veces, lo cual es una indicación de que se realizaron múltiples operaciones con éxito, cada una afectando al menos una fila en la base de datos.*

```bash
docker exec -i sqlpreview /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P@ssw0rd123! -i /tmp/Jardineria\ SQL\ Server.sql
Changed database context to 'jardineria'.

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)

(1 rows affected)
```

---

## ***Solución de Problemas de Conexión en SQL Server***

> [!CAUTION]
> *Si estás enfrentando un error durante la ejecución del comando `mssql.scriptSelect`, este podría deberse a problemas de configuración o conexión en tu entorno de SQL Server. Sigue estos pasos para intentar solucionarlo:*

---

### ***1. Verificación de la Configuración del Servidor SQL***

- **Asegúrate de que tu instancia de SQL Server esté configurada para aceptar conexiones remotas. Verifica los siguientes aspectos:**

- **Configuración de TCP/IP:**
  - *Abre el **SQL Server Configuration Manager**.*
  - *Dirígete a "SQL Server Network Configuration" -> "Protocols for [YourInstance]".*
  - *Asegúrate de que **TCP/IP** esté habilitado.*

- **Firewall:**
  - *Verifica que ningún firewall esté bloqueando el puerto 1433 (o el que uses para SQL Server).*

---

### ***2. Verificación de las Credenciales de Conexión***

- **Confirma que estás usando las credenciales correctas para conectarte a SQL Server. Verifica el usuario y la contraseña, y asegúrate de que el usuario tenga los permisos necesarios.**

---

### ***3. Compatibilidad entre Versiones de Cliente y Servidor***

- **Si utilizas una extensión en tu editor, como Visual Studio Code, verifica que la versión del cliente sea compatible con tu versión de SQL Server. Las actualizaciones de la extensión o de SQL Server pueden introducir problemas de compatibilidad.**

---

### ***4. Reinicio de SQL Server***

- **A veces, reiniciar el servicio de SQL Server soluciona problemas de conexión. Puedes reiniciar el servicio desde SQL Server Management Studio (SSMS) o desde Docker si estás usando una imagen en contenedor.**

```bash
docker restart [nombre_o_id_del_contenedor]
```

---

### ***5. Revisión de los Registros de Errores de SQL Server***

- **Consulta los registros de errores de SQL Server para obtener detalles adicionales. Estos se encuentran en la carpeta de instalación de SQL Server, en la subcarpeta `Log`.**

---

### ***6. Prueba de Conexión con un Cliente Diferente***

- *Si estás utilizando una extensión, intenta conectarte con otro cliente, como **SQL Server Management Studio (SSMS)** o **Azure Data Studio**, para descartar problemas específicos de la extensión.*

---

### ***7. Revisión de las Configuraciones de Seguridad***

- *Asegúrate de que SQL Server esté configurado con el modo de autenticación adecuado:*

- **Autenticación Mixta:**
- **Autenticación de Windows:**

- **Confirma que tu usuario esté habilitado para el modo de autenticación seleccionado.**

---

### ***8. Configuración de Docker (si aplica)***

- **Si SQL Server se está ejecutando en Docker, verifica que los puertos estén correctamente mapeados y que el contenedor esté configurado para aceptar conexiones.**

- **Resumen**

- *Estos pasos abarcan varias áreas críticas de diagnóstico de problemas de conexión en SQL Server. Si después de seguirlos el problema persiste, proporciona detalles adicionales de tu entorno (como la versión de SQL Server y el cliente usado) para que pueda ayudarte mejor.*
