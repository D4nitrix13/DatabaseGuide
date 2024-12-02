/*
STORED PROCEDURES
Un procedimiento almacenado es un conjunto de instrucciones SQL predefinidas y almacenadas en el servidor de bases de datos. 
Permite realizar operaciones complejas con una simple llamada, aumentando la eficiencia y reutilización del código, además 
de mejorar la seguridad, ya que los usuarios pueden ejecutar el procedimiento sin necesidad de acceder directamente a las tablas.
*/

-- SQLite (Simulación usando lenguaje anfitrión)

-- SQLite no soporta procedimientos almacenados. Sin embargo, se pueden usar scripts en un lenguaje anfitrión
-- (como Python, PHP o JavaScript) para ejecutar SQL con lógica programática.
-- Este ejemplo muestra cómo se haría en un entorno Python:

-- # Autor: Daniel Benjamin Perez Morales
-- # GitHub: https://github.com/DanielPerezMoralesDev13
-- # Correo electrónico: danielperezdev@proton.me

-- """
-- Esta aplicación se conecta a una base de datos SQLite y simula procedimientos almacenados
-- para gestionar usuarios en una tabla `users`.

-- Contiene dos funciones:
-- 1. `p_all_users`: Obtiene todos los registros de la tabla `users`.
-- 2. `p_age_users`: Filtra los registros de usuarios según la edad proporcionada como parámetro.

-- La aplicación imprime en la consola los resultados de estas funciones.
-- """

-- import sqlite3
-- import sys
-- from typing import Any, List, Tuple

-- # Conectar a la base de datos SQLite
-- conn: sqlite3.Connection = sqlite3.connect(database="./Database.db")
-- cursor: sqlite3.Cursor = conn.cursor()

-- def p_all_users() -> List[Tuple[Any]]:
--     """
--     Simula el procedimiento almacenado `p_all_users` para obtener todos los usuarios.

--     Retorna:
--         List[Tuple[Any]]: Una lista de tuplas que contienen todos los registros de la tabla `users`.
--     """
--     cursor.execute("SELECT * FROM users")
--     return cursor.fetchall()

-- def p_age_users(age_param: int) -> List[Tuple[Any]]:
--     """
--     Simula el procedimiento almacenado `p_age_users` para obtener usuarios filtrados por edad.

--     Args:
--         age_param (int): La edad utilizada como criterio de filtrado.

--     Retorna:
--         List[Tuple[Any]]: Una lista de tuplas que contienen los registros de usuarios
--         cuya edad coincide con `age_param`.
--     """
--     cursor.execute("SELECT * FROM users WHERE age = ?", (age_param,))
--     return cursor.fetchall()

-- # Invocar la función `p_all_users`
-- print(p_all_users(), end="\n", file=sys.stdout)

-- # Invocar la función `p_age_users` con el parámetro `30`
-- print(p_age_users(age_param=30), end="\n", file=sys.stdout)

-- # Cerrar la conexión
-- conn.close()
-- sys.exit(0)

/*
Las convenciones para nombrar procedimientos almacenados pueden variar según el equipo, la empresa o el estilo personal, pero aquí hay algunas pautas comunes y mejores prácticas que pueden ayudarte a establecer una convención clara y coherente:
### 1. Prefijo Común
- **Usar un prefijo que indique que es un procedimiento almacenado**: Muchos desarrolladores utilizan un prefijo como `sp_` (de "stored procedure") para distinguir procedimientos almacenados de otras entidades como tablas o funciones. Ejemplo: `sp_GetUserById`.
### 2. Verbos Claros
- **Incluir un verbo que indique la acción que realiza el procedimiento**: Utilizar verbos en el nombre ayuda a comprender de inmediato la funcionalidad. Ejemplo: `CreateUser`, `UpdateUser`, `DeleteUser`, `GetUsers`.
### 3. Uso de CamelCase o Snake_Case
- **Elegir un estilo de nomenclatura consistente**: Puedes usar `CamelCase` (por ejemplo, `GetUserById`) o `snake_case` (por ejemplo, `get_user_by_id`). Lo importante es ser consistente en toda la base de datos.
### 4. Descripción del Propósito
- **Ser descriptivo**: Asegúrate de que el nombre del procedimiento refleje su propósito y funcionalidad. Por ejemplo, `GetActiveUsers` es más claro que `GetUsers`.
### 5. Parámetros en el Nombre (opcional)
- **Incluir información sobre parámetros importantes**: Si un procedimiento almacenado tiene un parámetro clave que define su comportamiento, podrías incluirlo en el nombre. Por ejemplo, `GetUsersByAge` indica que el procedimiento recibe una edad como parámetro.
### 6. Evitar Abreviaturas Confusas
- **Usar abreviaturas de forma cuidadosa**: Si decides usar abreviaturas, asegúrate de que sean bien conocidas y comprensibles para todos los desarrolladores. Evita abreviaturas que puedan resultar confusas.
### 7. Consistencia en la Terminología
- **Usar términos consistentes**: Si usas un término específico para una entidad (por ejemplo, "User" en lugar de "Account"), asegúrate de usarlo de manera consistente en todos los procedimientos relacionados.
### Ejemplos de Nombres de Procedimientos Almacenados
- `sp_CreateUser` - Para crear un nuevo usuario.
- `sp_UpdateUser` - Para actualizar la información de un usuario existente.
- `sp_DeleteUser` - Para eliminar un usuario.
- `sp_GetUserById` - Para obtener un usuario específico basado en su ID.
- `sp_GetActiveUsers` - Para obtener una lista de usuarios activos.
### Resumen
Adoptar una convención de nomenclatura clara y coherente para procedimientos almacenados es esencial para facilitar la comprensión, el mantenimiento y la colaboración en proyectos de desarrollo. Asegúrate de documentar la convención elegida y de que todo el equipo esté de acuerdo con ella.
*/