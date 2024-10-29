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

- *Recuerda que cada vez que inicies una nueva sesión, necesitarás ejecutar el mismo comando para navegar a `/home/vscode`. Si deseas estar en un directorio específico de manera persistente cada vez que inicias un contenedor, puedes considerar configurar un archivo `.bashrc` o `.bash_profile` en el contenedor para cambiar automáticamente a ese directorio cuando inicies una nueva sesión de `bash`.*
