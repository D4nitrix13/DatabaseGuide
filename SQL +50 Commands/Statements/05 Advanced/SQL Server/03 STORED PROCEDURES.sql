-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

/*
STORED PROCEDURES
Un procedimiento almacenado es un conjunto de instrucciones SQL predefinidas y almacenadas en el servidor de bases de datos. 
Permite realizar operaciones complejas con una simple llamada, aumentando la eficiencia y reutilización del código, además 
de mejorar la seguridad, ya que los usuarios pueden ejecutar el procedimiento sin necesidad de acceder directamente a las tablas.
*/

-- SQL Server

-- Crear un procedimiento almacenado `p_all_users` en SQL Server
CREATE PROCEDURE p_all_users
AS
BEGIN
	SELECT * FROM users;
END;

-- Ejecutar el procedimiento almacenado `p_all_users`
EXEC p_all_users;

-- Crear un procedimiento almacenado `p_age_users` con parámetro de entrada `@age_param`
CREATE PROCEDURE p_age_users
	@age_param INT -- `@age_param` es el parámetro de entrada de tipo `INT`
AS
BEGIN
	SELECT * FROM users WHERE age = @age_param; -- Filtra usuarios por edad
END;

-- Ejecutar el procedimiento almacenado `p_age_users` pasando el valor `30` como parámetro
EXEC p_age_users @age_param = 30;

-- Eliminar el procedimiento almacenado `p_age_users`
DROP PROCEDURE p_age_users;

/*
En SQL, el comando `CALL` se utiliza para invocar (o ejecutar) procedimientos almacenados. Un procedimiento almacenado es un conjunto de instrucciones SQL que se almacena en la base de datos y puede ser ejecutado en cualquier momento, permitiendo encapsular la lógica de negocio y facilitar su reutilización.
### Sintaxis
La sintaxis básica para utilizar `CALL` es:
```sql
CALL nombre_del_procedimiento(parametro1, parametro2, ...);
```
### Ejemplo
Supongamos que has definido un procedimiento almacenado llamado `p_all_users` que no recibe parámetros y simplemente devuelve todos los registros de la tabla `users`. Para ejecutar este procedimiento, usarías:
```sql
CALL p_all_users();
```
Si tu procedimiento almacenado tiene parámetros, como en el caso de `p_age_users`, que filtra los usuarios por edad, lo invocarías pasando el valor correspondiente:
```sql
CALL p_age_users(30);
```
### Beneficios del uso de `CALL`
1. **Reutilización de Código**: Permite encapsular lógicas complejas en un solo lugar y reutilizarlas sin tener que reescribir el código SQL cada vez.
2. **Modularidad**: Facilita la organización de la lógica de la base de datos, haciendo que sea más fácil de mantener y entender.
3. **Seguridad**: Puede ayudar a proteger la base de datos al limitar el acceso directo a las tablas, ya que se puede otorgar acceso solo a procedimientos almacenados.
### Consideraciones
- No todos los sistemas de gestión de bases de datos (DBMS) utilizan la misma sintaxis para los procedimientos almacenados, aunque muchos, como MySQL, SQL Server y PostgreSQL, tienen comandos similares.
- En algunos sistemas, como SQL Server, el comando utilizado es `EXEC` en lugar de `CALL`.
En resumen, `CALL` es una herramienta clave para la gestión y ejecución de procedimientos almacenados en SQL, facilitando la implementación de lógicas más complejas y la reutilización de código.
*/

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