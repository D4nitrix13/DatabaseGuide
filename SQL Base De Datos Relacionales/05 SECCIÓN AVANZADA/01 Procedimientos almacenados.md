<!-- Autor: Daniel Benjamin Perez Morales -->
<!-- GitHub: https://github.com/D4nitrix13 -->
<!-- GitLab: https://gitlab.com/D4nitrix13 -->
<!-- Correo electrónico: danielperezdev@proton.me -->

# ***Procedimientos Almacenados (Stored Procedures)***

---

## ***¿Qué son y para qué sirven?***

- *Un **procedimiento almacenado** es un conjunto de instrucciones SQL guardadas en la base de datos, al que se puede acceder mediante un nombre y que puede aceptar parámetros. Su propósito es encapsular la lógica de la aplicación, permitiendo que las operaciones se realicen directamente en la base de datos sin necesidad de escribir repetidamente las mismas consultas o procesos complejos. Esto puede mejorar la eficiencia y el mantenimiento de la base de datos.*

**Principales usos de los procedimientos almacenados:**

- *Automatizar tareas repetitivas y operaciones complejas en la base de datos.*
- *Realizar operaciones CRUD (crear, leer, actualizar, eliminar) y otras tareas mediante lógica predefinida.*
- *Centralizar la lógica de negocio, mejorando la consistencia y seguridad al evitar que la lógica se disperse en el código de la aplicación.*

---

### ***Ventajas y Desventajas***

**Ventajas:**

- **Eficiencia:** *Al ejecutarse en el lado del servidor, los procedimientos almacenados pueden mejorar el rendimiento, ya que reducen la cantidad de tráfico entre la base de datos y la aplicación.*
- **Seguridad:** *Permiten otorgar permisos específicos a usuarios sin exponer las tablas subyacentes.*
- **Mantenimiento:** *Facilitan la actualización de la lógica de negocio, ya que cualquier cambio en el procedimiento almacenado afecta a todas las aplicaciones que lo usan.*
- **Reducción de código redundante:** *Evitan la repetición de consultas complejas o procesos en distintas partes de la aplicación.*

**Desventajas:**

- **Dependencia de la base de datos:** *Los procedimientos almacenados dependen del sistema de gestión de bases de datos (DBMS) y su SQL puede variar entre motores de bases de datos, afectando la portabilidad.*
- **Dificultad para depurar:** *Depurar lógica en procedimientos almacenados es generalmente más complicado que en código de aplicación.*
- **Complejidad en el mantenimiento:** *Cuando se usan excesivamente, pueden hacer que el diseño de la base de datos sea más difícil de mantener.*

---

### ***Soporte en SQLite***

- *SQLite no soporta procedimientos almacenados de forma nativa como otros DBMS (por ejemplo, MySQL, SQL Server, o PostgreSQL). Esto se debe a que SQLite está diseñado para ser una base de datos ligera y no incluye soporte para muchas funciones avanzadas.*

- *Para implementar la lógica de procedimientos almacenados en SQLite, es común utilizar un **lenguaje de programación anfitrión** (como Python, JavaScript o C#), desde el cual se ejecutan las consultas necesarias y se controla la lógica en el nivel de la aplicación.*

**Cuando trabajamos con SQLite, la lógica de procedimientos almacenados generalmente se aplica en el backend de la aplicación**, utilizando las funciones de programación del lenguaje anfitrión para controlar el flujo, gestionar transacciones y realizar operaciones complejas.
