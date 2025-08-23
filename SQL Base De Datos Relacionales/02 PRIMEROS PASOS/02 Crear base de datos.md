<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Crear Base de Datos en SQLite3***

---

## ***Crear una base de datos SQLite desde la línea de comandos***

- **Para crear una base de datos SQLite, ejecuta el siguiente comando en la línea de comandos:**

```bash
sqlite3 /home/user/NombreBaseDatos.db
```

```bash
sqlite3 /home/user/UsuariosDataBase.db
```

- **Descripción:** *Este comando crea un fichero de base de datos llamado `UsuariosDataBase.db` en el directorio actual. Si el fichero no existe, SQLite lo creará automáticamente.*

---

## ***Verificar la creación de la base de datos***

- **Para verificar que la base de datos fue creada, puedes listar los ficheros en el directorio:**

```bash
ls -l ./
```

```bash
ls -l ./
UsuariosDataBase.db
```

- **Descripción:** *El fichero `UsuariosDataBase.db` aparecerá en la lista de ficheros si la base de datos se creó correctamente.*

---

### ***Conectar a la base de datos existente***

- **Si la base de datos ya existe, puedes conectarte a ella usando el mismo comando:**

```bash
sqlite3 /home/user/NombreBaseDatos.db
```

```bash
sqlite3 /home/user/UsuariosDataBase.db
```

- **Descripción:** *Este comando abre una sesión interactiva con la base de datos `UsuariosDataBase.db`. Si el fichero de base de datos existe, se conectará a él; si no existe, lo creará.*

---

#### ***Cerrar la sesión de SQLite***

- **Para salir de la sesión interactiva de SQLite, utiliza el siguiente comando:**

```bash
.exit
```

```bash
sqlite> .exit
```

- **Descripción:** *El comando `.exit` cierra la sesión de SQLite y te devuelve a la línea de comandos de tu sistema operativo.*

---

### ***Cómo limpiar la pantalla en SQLite3***

- *[Foro:](https://stackoverflow.com/questions/21616375/is-there-a-command-to-clear-screen-in-sqlite3 "https://stackoverflow.com/questions/21616375/is-there-a-command-to-clear-screen-in-sqlite3")*
- **SQLite3 en sí no tiene un comando directo para limpiar la pantalla. Sin embargo, existen soluciones que varían según el sistema operativo:**

---

#### ***Windows:***

- **Puedes utilizar el siguiente comando para limpiar la pantalla del shell de SQLite:**
  
```bash
.shell cls
```

- **Descripción:** *El comando `.shell` ejecuta comandos del sistema desde la terminal de SQLite. En este caso, `cls` es el comando utilizado en Windows para limpiar la pantalla.*

---

#### ***Linux/Unix/MacOS:***

- *Para limpiar la pantalla en sistemas basados en Unix, como Linux y MacOS, utiliza:*

```bash
.shell clear
```

```bash
.shell reset
```

- **Descripción:** *En estos sistemas, `clear` es el comando que limpia la pantalla del terminal. El prefijo `.shell` permite ejecutarlo desde la interfaz de SQLite.*

- *El comando `.shell reset` en SQLite ejecuta el comando del sistema `reset`, que está disponible en sistemas basados en Unix (Linux y macOS).*

---

#### ***Función de `.shell reset`***

- **Restablecer la terminal:**
  *El comando `reset` se utiliza para restaurar la terminal a su estado predeterminado. Esto puede ser útil si la pantalla de la terminal está desordenada o si la salida del terminal se comporta de manera inusual. A diferencia de `clear`, que simplemente borra la pantalla, `reset` reinicializa la terminal por completo, corrigiendo problemas visuales y de comportamiento.*

```bash
.shell reset
```

- **Descripción:** *Este comando es más completo que `clear`, ya que además de limpiar la pantalla, restablece la configuración de la terminal. Puede ser útil si has ejecutado un comando que ha dejado la pantalla en un estado inestable o si la visualización se ha corrompido.*

---

#### ***Atajo de teclado (Linux/Unix/MacOS):***

- *También puedes usar el atajo de teclado:*

```bash
Ctrl + l
```

- **Descripción:** *En muchos sistemas Unix, `Ctrl + L` mueve el cursor al principio de la pantalla, simulando una limpieza rápida del terminal.*

---

### ***Cómo limpiar la pantalla en PostgreSQL (psql) en Windows***

- *[Foro:](https://stackoverflow.com/questions/26065426/keystroke-to-clear-screen-in-psql "https://stackoverflow.com/questions/26065426/keystroke-to-clear-screen-in-psql")*

- **En PostgreSQL, no hay un comando directo para limpiar la pantalla del cliente `psql`. Sin embargo, puedes utilizar algunas soluciones según tu sistema operativo:**

---

#### ***Windows***

- **Para limpiar la pantalla en la consola `psql`, utiliza:**

```bash
\! cls
```

- **Descripción:** *El comando `\!` permite ejecutar comandos del sistema desde la consola de PostgreSQL. `cls` es el comando usado en Windows para limpiar la pantalla.*

---

#### ***Atajo de teclado (posible en algunas versiones):***

- **Algunos usuarios han reportado que en ciertas versiones de PostgreSQL en Windows, el siguiente atajo de teclado puede funcionar:**

```bash
Ctrl + Shift + L
```

- **Descripción:** *Si bien no siempre es compatible, este atajo puede limpiar la pantalla en algunas configuraciones de PostgreSQL en Windows.*

- **Para sistemas basados en Unix (Linux o macOS), el equivalente sería:**

```bash
\! clear
```

---

### ***Cómo limpiar la pantalla en MySQL***

---

#### ***En Linux***

- **Para limpiar la pantalla en la consola MySQL en Linux, puedes usar uno de los siguientes métodos:**

1. **Usar el comando `clear`:**

   ```sql
   \! clear
   ```

   ```sql
   mysql> \! clear
   ```

   ```sql
   system clear
   ```

   ```sql
   mysql> system clear
   ```

2. **Atajo de teclado:**
   - *Presiona `Ctrl + L` para limpiar la pantalla.*

---

#### ***En Windows***

**Para limpiar la pantalla en la consola MySQL en Windows, puedes utilizar:**

1. **Comando `cls`:**

   ```sql
   \! cls
   ```

   ```sql
   mysql> \! cls
   ```

   - **Descripción:** *El comando `\!` permite ejecutar comandos del sistema desde la consola MySQL, y `cls` es el comando para limpiar la pantalla en Windows.*

2. **Comando `system`:**

    ```sql
   system cls;
   ```

   ```sql
   mysql> system cls;
   ```

   - **Descripción:** *`system` también ejecuta comandos del sistema. Asegúrate de incluir el punto y coma al final.*

3. **Atajo de teclado (en algunas configuraciones):**
   - *Presiona `Ctrl + L` en algunas versiones de MySQL para limpiar la pantalla.*

---

### ***Resumen***

- **Linux:** *`system clear;` `\! clear` o `Ctrl + L`*
- **Windows:** *`\! cls` o `system cls;` (puede que `Ctrl + L` funcione en algunas configuraciones)*
