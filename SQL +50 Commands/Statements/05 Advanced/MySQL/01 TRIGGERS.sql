-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

/*
TRIGGERS
Los triggers, o disparadores, son bloques de código SQL que se ejecutan automáticamente en respuesta a 
ciertos eventos (como inserciones, actualizaciones o eliminaciones) en una tabla específica.
Son útiles para aplicar reglas de negocio, auditoría y lógica que deben ejecutarse automáticamente al 
ocurrir ciertos cambios en los datos de una base de datos.
Un trigger se define indicando el evento (INSERT, UPDATE, DELETE) y el momento en que debe ejecutarse 
(BEFORE o AFTER el evento).
*/

-- Crea una tabla para almacenar el historial de cambios en la tabla `users`
-- En este caso, se usa una tabla llamada `email_history` para registrar cada vez que se actualiza el email
CREATE TABLE `hello_mysql`.`email_history` (
    `email_history_id` INT NOT NULL AUTO_INCREMENT, -- Identificador único para cada entrada en la tabla de historial
    `user_id` INT NOT NULL, -- ID del usuario cuyo email cambió
    `email` VARCHAR(100) NULL, -- Email previo del usuario antes de ser actualizado
    PRIMARY KEY (`email_history_id`), -- Establece `email_history_id` como clave primaria
    UNIQUE INDEX `email_history_id_UNIQUE` (`email_history_id` ASC) VISIBLE -- Índice único para asegurar la unicidad
);

-- Cambia el delimitador de las instrucciones SQL para poder usar múltiples líneas de código en el trigger
-- En MySQL, la directiva DELIMITER permite cambiar el símbolo de terminación de cada instrucción SQL
-- (por defecto es `;`), útil al definir bloques de código como triggers o procedimientos almacenados.
DELIMITER / /

-- Crea un trigger llamado `tg_email` que se ejecutará automáticamente después de que se actualice un registro en `users`
-- `AFTER UPDATE ON users` indica que el trigger se ejecutará después de una actualización en la tabla `users`
CREATE TRIGGER tg_email
AFTER UPDATE ON users
FOR EACH ROW       -- Aplica el trigger a cada registro modificado en la tabla `users`
BEGIN
	-- Verifica si el email cambió comparando el valor anterior (OLD.email) con el nuevo (NEW.email)
	IF OLD.email <> NEW.email THEN
		-- Inserta un registro en `email_history` con el `user_id` y el `email` antes de la actualización
		INSERT INTO email_history (user_id, email)
		VALUES (OLD.user_id, OLD.email);
	END IF;
END//

/*
VISTOS EN EL TRIGGER:
- `VISIBLE`: Especifica la visibilidad de un índice en MySQL 8.0 y versiones posteriores. Cuando un índice está marcado como `VISIBLE` (visibilidad predeterminada),
es utilizado por el optimizador de consultas al ejecutar instrucciones SQL.
El contrario de `VISIBLE` es `INVISIBLE`, que oculta el índice del optimizador sin eliminarlo.
Ejemplo:
UNIQUE INDEX `email_history_id_UNIQUE` (`email_history_id` ASC) VISIBLE
Esto crea un índice único `VISIBLE` en `email_history_id`, que el optimizador de consultas podrá usar.
*/

/*
AFTER vs BEFORE:
- `AFTER`: Indica que el trigger se ejecuta después de que ocurre el evento especificado (como una actualización).
En nuestro ejemplo, el trigger `tg_email` con `AFTER UPDATE` se ejecuta tras la actualización del email en la tabla `users`.
- `BEFORE`: Por el contrario, si se define un trigger con `BEFORE`, este se ejecuta antes de que ocurra el evento.
En una operación `BEFORE UPDATE`, podríamos verificar o modificar los valores antes de que se guarden en la tabla.
Ejemplo de uso:
- `AFTER UPDATE ON users` => el trigger se ejecuta después de la actualización en `users`
- `BEFORE UPDATE ON users` => el trigger se ejecuta antes de la actualización en `users`
*/

/*
OLD y NEW:
En triggers de `UPDATE`, `OLD` y `NEW` se usan para acceder a los valores anteriores y nuevos de los campos respectivamente.
- `OLD`: Hace referencia a los valores anteriores a la operación en curso.
Útil en triggers para registrar o comparar el valor previo de una columna antes de un cambio.
- `NEW`: Hace referencia a los valores nuevos que serán aplicados en la operación actual.
Ejemplo:
- `IF OLD.email <> NEW.email` => Compara el valor anterior (`OLD.email`) con el nuevo (`NEW.email`) para ver si hubo un cambio en el email.
*/

-- Restaura el delimitador original de MySQL a `;`
DELIMITER;

-- Realiza una actualización en la tabla `users` para desencadenar el trigger y probar su funcionamiento
-- En este caso, se cambia el email del usuario con ID `1` en la tabla `users`
UPDATE users SET email = 'Daniel@gmail.com' WHERE user_id = 1;

-- Elimina el trigger `tg_email` de la base de datos
DROP TRIGGER tg_email;

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