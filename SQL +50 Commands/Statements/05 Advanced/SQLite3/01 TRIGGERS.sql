-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

/*
TRIGGERS EN SQLITE
En SQLite, los triggers se definen para ejecutar automáticamente un conjunto de instrucciones SQL en respuesta a eventos 
(INSERT, UPDATE, DELETE) en una tabla específica. 
- `AFTER`: Ejecuta el trigger después de que se realiza la operación en la tabla.
- `BEFORE`: Ejecuta el trigger antes de que se realice la operación en la tabla, permitiendo validar o modificar datos antes de guardarlos.
SQLite permite el uso de `OLD` y `NEW` para acceder a los valores antes y después de una operación en triggers `UPDATE`.
*/

/* 
Crear una tabla `email_history` para registrar los emails anteriores cada vez que se actualice el email en la tabla `users`.
La tabla contiene el `user_id` y el `email` antes de la actualización.
*/
CREATE TABLE email_history (
    email_history_id INTEGER PRIMARY KEY AUTOINCREMENT, -- Campo de ID único auto-incremental para cada entrada en el historial
    user_id INTEGER NOT NULL, -- ID del usuario cuyo email fue actualizado
    email TEXT -- Email previo del usuario antes de la actualización
);

/*
Crear un trigger `trigger_email` que se ejecutará después de actualizar (`AFTER UPDATE`) un registro en la tabla `users`.
- `AFTER UPDATE ON users` indica que el trigger se ejecutará después de una actualización en `users`.
- `OLD` y `NEW` permiten acceder a los valores antiguos y nuevos de los campos respectivamente.
*/

CREATE TRIGGER trigger_email
AFTER UPDATE ON users
FOR EACH ROW              -- Ejecuta el trigger para cada registro afectado en `users`
BEGIN
	-- Solo inserta en `email_history` si el `email` ha cambiado
	INSERT INTO email_history (user_id, email)
	VALUES (OLD.user_id, OLD.email)  -- `OLD.user_id` y `OLD.email` contienen los valores anteriores a la actualización
	WHERE OLD.email <> NEW.email;    -- Compara el email previo (`OLD.email`) con el nuevo (`NEW.email`)
END;

/*
Prueba el trigger actualizando el email de un usuario en la tabla `users`.
Si el email cambia, se activará el trigger `trigger_email` y registrará el email previo en `email_history`.
*/
UPDATE users SET email = 'Daniel@gmail.com' WHERE user_id = 1;

/*
Eliminar el trigger `trigger_email` de la tabla `users` si ya no es necesario.
En SQLite, se utiliza `DROP TRIGGER` seguido del nombre del trigger.
*/
DROP TRIGGER trigger_email;

/*
La convención para nombrar triggers en SQL no está estrictamente definida y puede variar según las prácticas del equipo o la organización. Sin embargo, aquí hay algunas recomendaciones comunes sobre cómo nombrar triggers y ejemplos de convenciones de nomenclatura:
### Recomendaciones para Nombrar Triggers
1. **Usar Prefijos**: Comenzar el nombre del trigger con un prefijo que indique que es un trigger. Ejemplo: `trg_` o `trigger_`.
2. **Incluir la Tabla Afectada**: Incluir el nombre de la tabla que el trigger afecta, lo que ayuda a identificar fácilmente su propósito.
3. **Indicar la Acción**: Incluir una descripción de la acción que el trigger realiza, como `insert`, `update` o `delete`.
4. **Uso de Notación**:
- **Pascal Case**: Las palabras comienzan con mayúscula y no se utilizan guiones bajos. Ejemplo: `TrgOrdersInsert`.
- **Snake Case**: Se utilizan guiones bajos para separar palabras. Ejemplo: `trg_orders_insert`.
- **Camel Case**: Similar al Pascal Case, pero la primera palabra comienza en minúscula. Ejemplo: `trgOrdersInsert`.
### Ejemplos de Nombres de Triggers
- **Pascal Case**: 
- `TrgOrdersInsert` (Un trigger que se activa en inserciones en la tabla `Orders`).
- `TrgCustomersUpdate` (Un trigger que se activa en actualizaciones en la tabla `Customers`).
- **Snake Case**: 
- `trg_orders_insert` (Un trigger que se activa en inserciones en la tabla `orders`).
- `trg_customers_update` (Un trigger que se activa en actualizaciones en la tabla `customers`).
- **Camel Case**: 
- `trgOrdersInsert` (Un trigger que se activa en inserciones en la tabla `Orders`).
- `trgCustomersUpdate` (Un trigger que se activa en actualizaciones en la tabla `Customers`).
### Conclusión
La elección entre estas convenciones depende del estilo que prefieras seguir en tu proyecto o equipo. Lo más importante es ser consistente en la nomenclatura que elijas para que todos los desarrolladores puedan entender y trabajar con el código de manera eficiente.
*/