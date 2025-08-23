-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/D4nitrix13
-- Correo electrónico: danielperezdev@proton.me

/*
TRIGGERS
Un trigger es un bloque de código que se ejecuta automáticamente en respuesta a eventos específicos 
en una tabla. Son útiles para mantener integridad, hacer auditoría y aplicar reglas de negocio de manera automática.
PostgreSQL permite el uso de triggers en eventos `INSERT`, `UPDATE`, `DELETE`, con las opciones `BEFORE` y `AFTER`.
*/

/* 
En PostgreSQL, los índices son visibles por defecto y no se pueden marcar como `INVISIBLE`. 
Por lo tanto, no es necesario usar `VISIBLE` en los índices.
*/

/*
Crear una tabla `email_history` para almacenar el historial de emails modificados.
Esta tabla guardará el `user_id` y el email previo cada vez que se actualice el campo `email` de un usuario.
*/
CREATE TABLE email_history (
    email_history_id SERIAL PRIMARY KEY, -- Campo de ID único auto-incremental para cada entrada en el historial
    user_id INT NOT NULL, -- ID del usuario cuyo email fue actualizado
    email VARCHAR(100) -- Email previo del usuario antes de la actualización
);

/*
AFTER vs BEFORE:
- `AFTER` en triggers PostgreSQL: Ejecuta el trigger después de que se realiza el evento especificado. 
En nuestro caso, el trigger se activará después de que se actualice el email en la tabla `users`.
- `BEFORE`: Ejecuta el trigger antes de que ocurra el evento, útil para hacer validaciones o cambiar datos 
antes de que se realice la acción.
Ejemplo:
- `AFTER UPDATE ON users` => el trigger se ejecuta después de actualizar el email en `users`
- `BEFORE UPDATE ON users` => el trigger se ejecuta antes de la actualización del email en `users`
*/

/*
OLD y NEW:
En PostgreSQL, las variables `OLD` y `NEW` permiten acceder a los valores anteriores y nuevos de los campos en triggers de `UPDATE`.
- `OLD`: Hace referencia a los valores previos a la actualización.
Se usa para comparar o almacenar valores antiguos antes del cambio.
- `NEW`: Hace referencia a los valores que serán aplicados con la operación actual.
Ejemplo:
- `IF OLD.email <> NEW.email` => Compara el email anterior (`OLD.email`) con el nuevo (`NEW.email`) 
para verificar si hubo un cambio en el campo `email`.
*/

/* 
Crear una función que ejecutará la lógica del trigger.
En PostgreSQL, los triggers ejecutan funciones definidas para realizar las acciones especificadas.
*/

CREATE OR REPLACE FUNCTION function_log_email_update()
RETURNS TRIGGER AS $$
BEGIN
	-- Verifica si el campo `email` ha cambiado comparando `OLD.email` con `NEW.email`
	IF OLD.email <> NEW.email THEN
		-- Inserta un registro en `email_history` con el `user_id` y el email previo a la actualización
		INSERT INTO email_history (user_id, email)
		VALUES (OLD.user_id, OLD.email);
	END IF;
	RETURN NEW; -- Devuelve `NEW` para que continúe con la actualización en la tabla `users`
END;
$$ LANGUAGE plpgsql;

/* 
Crear el trigger `trigger_email` que ejecutará la función `function_log_email_update` cada vez que se actualice el email en `users`.
`AFTER UPDATE ON users` asegura que el trigger se ejecute después de una actualización en la tabla.
*/
CREATE TRIGGER trigger_email AFTER
UPDATE ON users FOR EACH ROW -- Aplica el trigger a cada registro que se actualice en `users`
EXECUTE FUNCTION function_log_email_update ();
-- Ejecuta la función que maneja la lógica del trigger
/*
Prueba el trigger actualizando el email de un usuario en la tabla `users`.
Esto ejecutará el trigger `trigger_email`, y, si el email cambió, registrará el email anterior en `email_history`.
*/
UPDATE users SET email = 'Daniel@gmail.com' WHERE user_id = 1;

/*
Eliminar el trigger `trigger_email` de la tabla `users`.
Esto desactiva el trigger sin afectar la función `function_log_email_update()`.
*/
DROP TRIGGER trigger_email ON users;

/*
Si ya no se necesita la función `function_log_email_update`, se puede eliminar con:
DROP FUNCTION function_log_email_update;
*/

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
