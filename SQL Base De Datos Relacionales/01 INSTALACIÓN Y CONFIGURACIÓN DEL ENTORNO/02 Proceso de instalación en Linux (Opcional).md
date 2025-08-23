<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Proceso de Instalación en Linux (Opcional)***

**Para instalar SQLite y DB Browser en Linux, sigue los pasos a continuación.**

---

## ***Instalación de SQLite***

1. *Abre una terminal y ejecuta el siguiente comando para actualizar los paquetes e instalar SQLite:*

   ```bash
   sudo apt update --fix-missing && sudo apt install -y sqlite
   ```

**Este comando se asegurará de que tu sistema esté actualizado y que SQLite se instale correctamente.**

---

## ***Instalación de DB Browser para SQLite***

1. **Para instalar DB Browser en Linux, utiliza el siguiente comando:**

   ```bash
   sudo apt install -y sqlitebrowser
   ```

- *Este comando instalará el navegador gráfico para trabajar con bases de datos SQLite.*

---

### ***Si ocurre algún error durante la instalación***

- *Si encuentras algún problema, como un error de dependencias, puedes intentar nuevamente actualizando los paquetes y repitiendo la instalación con estos comandos:*

1. **Actualiza nuevamente los paquetes:**

   ```bash
   sudo apt update --fix-missing
   ```

2. **Intenta instalar DB Browser nuevamente:**

   ```bash
   sudo apt install -y sqlitebrowser
   ```

- *Estos pasos deberían resolver la mayoría de los problemas de instalación en Linux.*
