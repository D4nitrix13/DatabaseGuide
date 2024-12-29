-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

/*
TRIGGERS EN SQL SERVER
En SQL Server, un trigger es un conjunto de instrucciones que se ejecuta automáticamente en respuesta a eventos en una tabla.
SQL Server permite los triggers `AFTER` y `INSTEAD OF`. 
- `AFTER`: Ejecuta el trigger después de que se completa el evento (INSERT, UPDATE o DELETE).
- `INSTEAD OF`: Ejecuta el trigger en lugar del evento especificado, permitiendo personalizar la acción.
SQL Server no tiene la opción `BEFORE` para triggers.
SQL Server usa las tablas virtuales `INSERTED` y `DELETED` para acceder a los valores antes y después de la operación:
- `INSERTED`: Contiene los valores nuevos de los registros en una operación `INSERT` o `UPDATE`.
- `DELETED`: Contiene los valores anteriores de los registros en una operación `DELETE` o `UPDATE`.
*/

/* 
Crear una tabla `email_history` para almacenar el historial de emails previos.
En esta tabla se registra el `user_id` y el `email` anterior cada vez que se actualiza el campo `email` en la tabla `users`.
*/
CREATE TABLE email_history (
    email_history_id INT IDENTITY (1, 1) PRIMARY KEY, -- Campo de ID único auto-incremental para cada entrada en el historial
    user_id INT NOT NULL, -- ID del usuario cuyo email fue actualizado
    email NVARCHAR(100) -- Email previo del usuario antes de la actualización
);

/*
Crear un trigger `trigger_email` que se ejecutará después de una actualización (`AFTER UPDATE`) en la tabla `users`.
- `AFTER UPDATE ON users` especifica que el trigger se ejecutará después de la actualización en la tabla `users`.
- Para verificar el cambio en el email, se usa la tabla virtual `INSERTED` (valores nuevos) y `DELETED` (valores antiguos).
*/

CREATE TRIGGER trigger_email
ON users
AFTER UPDATE
AS
BEGIN
	-- Inserta en `email_history` solo si el `email` ha cambiado
	INSERT INTO email_history (user_id, email)
	SELECT 
		DELETED.user_id,        -- user_id del registro actualizado (anterior)
		DELETED.email           -- email anterior del usuario
	FROM 
		DELETED                 -- Tabla virtual que contiene los valores antes de la actualización
	JOIN 
		INSERTED ON DELETED.user_id = INSERTED.user_id  -- Se asegura de unir el registro antiguo y nuevo por `user_id`
	WHERE 
		DELETED.email <> INSERTED.email; -- Compara el email previo (`DELETED.email`) con el nuevo (`INSERTED.email`)
END;

/*
Prueba el trigger actualizando el email de un usuario en la tabla `users`.
Esto activará el trigger `trigger_email` y, si el email cambió, registrará el email anterior en `email_history`.
*/
UPDATE users SET email = 'Daniel@gmail.com' WHERE user_id = 1;

/*
Eliminar el trigger `trigger_email` de la tabla `users` si ya no es necesario.
*/
DROP TRIGGER trigger_email ON users;

/*
La convención para nombrar triggers en SQL no está estrictamente definida y puede variar según las prácticas del equipo o la organización. Sin embargo, aquí hay algunas recomendaciones comunes sobre cómo nombrar triggers y ejemplos de convenciones de nomenclatura:

Recomendaciones para Nombrar Triggers

1. Usar Prefijos: Comenzar el nombre del trigger con un prefijo que indique que es un trigger. Ejemplo: `trg_` o `trigger_`.
2. Incluir la Tabla Afectada: Incluir el nombre de la tabla que el trigger afecta, lo que ayuda a identificar fácilmente su propósito.
3. Indicar la Acción: Incluir una descripción de la acción que el trigger realiza, como `insert`, `update` o `delete`.
4. Uso de Notación:
- Pascal Case: Las palabras comienzan con mayúscula y no se utilizan guiones bajos. Ejemplo: `TrgOrdersInsert`.
- Snake Case: Se utilizan guiones bajos para separar palabras. Ejemplo: `trg_orders_insert`.
- Camel Case: Similar al Pascal Case, pero la primera palabra comienza en minúscula. Ejemplo: `trgOrdersInsert`.

Ejemplos de Nombres de Triggers

- Pascal Case: 
- `TrgOrdersInsert` (Un trigger que se activa en inserciones en la tabla `Orders`).
- `TrgCustomersUpdate` (Un trigger que se activa en actualizaciones en la tabla `Customers`).
- Snake Case: 
- `trg_orders_insert` (Un trigger que se activa en inserciones en la tabla `orders`).
- `trg_customers_update` (Un trigger que se activa en actualizaciones en la tabla `customers`).
- Camel Case: 
- `trgOrdersInsert` (Un trigger que se activa en inserciones en la tabla `Orders`).
- `trgCustomersUpdate` (Un trigger que se activa en actualizaciones en la tabla `Customers`).

Conclusión

La elección entre estas convenciones depende del estilo que prefieras seguir en tu proyecto o equipo. Lo más importante es ser consistente en la nomenclatura que elijas para que todos los desarrolladores puedan entender y trabajar con el código de manera eficiente.
*/