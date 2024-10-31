<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/DanielPerezMoralesDev13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Contenedor de Prácticas***

```bash
docker exec -it --privileged -u vscode container-sqlite3-practicas bash -c "cd /home/vscode && exec bash"
```

---

## ***Desglose del Comando:***

1. **`docker exec`:** *Este comando se utiliza para ejecutar un comando en un contenedor en ejecución.*
2. **`-it`:**
   - *`-i`: Mantiene la entrada estándar (STDIN) abierta para que puedas interactuar con el contenedor.*
   - *`-t`: Asigna un pseudo-TTY, lo que permite que la terminal funcione como si fuera una terminal real, habilitando características como el autocompletado y el manejo de colores.*
3. **`--privileged`:** *Esta opción otorga permisos adicionales al contenedor, permitiendo que ejecute tareas que requieren privilegios más altos, como acceder a dispositivos o modificar configuraciones del sistema.*
4. **`-u vscode`:** *Especifica el usuario bajo el cual se ejecutará el comando dentro del contenedor, en este caso, el usuario `vscode`. Esto es útil para asegurarse de que tienes los permisos correctos para acceder a ciertos recursos.*
5. **`container-sqlite3-practicas`:** *Nombre del contenedor en el que quieres ejecutar el comando.*
6. **`bash -c`:** *Ejecuta el comando especificado dentro de un nuevo intérprete de comandos `bash`.*
7. **`"cd /home/vscode && exec bash"`:**
   - *`cd /home/vscode`: Cambia al directorio `/home/vscode` dentro del contenedor.*
   - *`&&`: Asegura que el siguiente comando se ejecute solo si el anterior tuvo éxito (es decir, si el cambio de directorio fue exitoso).*
   - *`exec bash`: Reemplaza el shell actual con un nuevo shell `bash`, manteniéndote en el directorio especificado para que puedas continuar trabajando allí.*

---

### ***Usar el Comando***

- *Cuando ejecutes el comando anterior, abrirás una nueva terminal dentro del contenedor que estará en el directorio `/home/vscode`. Una vez que salgas de esta terminal (`exit`), ya no estarás en ese directorio. Para acceder nuevamente, deberás ejecutar el mismo comando.*

---

### ***Limitación***

- *Recuerda que cada vez que inicies una nueva sesión, necesitarás ejecutar el mismo comando para navegar a `/home/vscode`. Si deseas estar en un directorio específico de manera persistente cada vez que inicias un contenedor, puedes considerar configurar un fichero `.bashrc` o `.bash_profile` en el contenedor para cambiar automáticamente a ese directorio cuando inicies una nueva sesión de `bash`.*

---

#### ***Comando Docker***

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
    --name container-sqlite3-practicas \
    d4nitrix13/sqlite3-practicas:latest
```

---

### ***Desglose del Comando***

1. **`docker container run`:**
   - *Este es el comando básico para crear y ejecutar un nuevo contenedor a partir de una imagen de Docker.*

2. **`-it`:**
   - **`-i`:** *Manten el `STDIN` abierto incluso si no está conectado.*
   - **`-t`:** *Asigna un pseudo-terminal al contenedor, permitiendo una interacción más fácil (como una terminal de línea de comandos).*

3. **`-w /Code`:**
   - *Establece el directorio de trabajo dentro del contenedor en `/Code`. Esto significa que cualquier comando que se ejecute dentro del contenedor se ejecutará desde este directorio.*

4. **`-p 8000:8000`:**
   - *Publica el puerto 8000 del contenedor en el puerto 8000 de la máquina host. Esto permite que cualquier aplicación que escuche en el puerto 8000 dentro del contenedor sea accesible desde el host en el mismo puerto.*

5. **`--user vscode`:**
   - *Ejecuta el contenedor como el usuario `vscode` en lugar de usar el usuario root por defecto. Esto puede ser útil para evitar problemas de permisos.*

6. **`--privileged`:**
   - *Otorga al contenedor permisos adicionales que le permiten realizar tareas que normalmente están restringidas. Esto puede ser necesario si el contenedor necesita acceder a dispositivos específicos o realizar configuraciones de red.*

7. **`--init`:**
   - *Usa un contenedor de init (init container) para gestionar procesos huérfanos. Esto ayuda a asegurar que los procesos en segundo plano se manejen adecuadamente.*

8. **`--expose 8000`:**
   - *Indica que el contenedor escuchará en el puerto 8000. A diferencia de la opción `-p`, esta solo documenta el puerto expuesto; no lo publica en el host.*

9. **`--stop-signal SIGTERM`:**
   - *Establece la señal que se enviará al contenedor cuando se detenga. En este caso, se utiliza la señal `SIGTERM` para permitir un cierre ordenado.*

10. **`--stop-timeout 10`:**
    - *Establece un tiempo de espera de 10 segundos para que el contenedor se detenga después de que se envíe la señal de parada.*

11. **`--attach STDOUT`:**
    - *Conecta la salida estándar del contenedor a la terminal de host, permitiendo ver la salida del contenedor en tiempo real.*

12. **`--attach STDERR`:**
    - *Conecta la salida de error estándar del contenedor a la terminal de host, permitiendo ver los errores en tiempo real.*

13. **`--attach STDIN`:**
    - *Conecta la entrada estándar del contenedor a la terminal de host, permitiendo enviar entrada al contenedor.*

14. **`-v "$(pwd)":/Code`:**
    - *Monta el directorio actual (obtenido con `$(pwd)`) del host en el directorio `/Code` del contenedor. Esto permite que el contenedor acceda a los ficheros en el directorio actual del host y viceversa.*

15. **`--name container-sqlite3-practicas`:**
    - *Asigna un nombre al contenedor que se está creando, en este caso, `container-sqlite3-practicas`.*

16. **`d4nitrix13/sqlite3-practicas:latest`:**
    - *Especifica la imagen que se va a utilizar para crear el contenedor. En este caso, se está utilizando la imagen `sqlite3-practicas` del repositorio `d4nitrix13` en su versión más reciente (`latest`).*

### ***Resumen***

- *Este comando ejecuta un contenedor de Docker que corre una imagen específica relacionada con SQLite y establece varias configuraciones para facilitar su uso. Esto incluye configurar puertos, directorios de trabajo, y opciones de conexión para que el contenedor sea interactivo y accesible desde el host, manteniendo un enfoque en la seguridad mediante el uso de un usuario específico y permisos limitados.*
