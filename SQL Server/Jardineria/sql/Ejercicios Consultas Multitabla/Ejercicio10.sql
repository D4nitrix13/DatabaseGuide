--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 10. Clientes sin Entregas a Tiempo:
-- Lista los clientes a los que no se les ha entregado un pedido a tiempo.

SELECT TOP 73 c.codigo_cliente, c.nombre_cliente, p.fecha_pedido, p.fecha_esperada, COALESCE(
        CAST(
            p.fecha_entrega AS VARCHAR(10)
        ), 'No Ha Sido Entregado'
    ) AS "Fecha Entrega"
FROM pedido p
    INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente
WHERE
    p.fecha_entrega > p.fecha_esperada
    OR p.fecha_entrega IS NULL

-- Segunda Query
SELECT TOP 73 c.codigo_cliente, c.nombre_cliente, p.fecha_pedido, p.fecha_esperada, COALESCE(
        CONVERT(
            VARCHAR(10), p.fecha_entrega, 120
        ), 'No Ha Sido Entregado'
    ) AS "Fecha Entrega" -- 120 es un formato de fecha ISO
FROM pedido p
    INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente
WHERE
    p.fecha_entrega > p.fecha_esperada
    OR p.fecha_entrega IS NULL;
--     Cuando en SQL se define un campo como `VARCHAR(10)`, significa que el tipo de dato `VARCHAR` (que representa una cadena de caracteres de longitud variable) tiene un límite de 10 caracteres. Aquí hay algunos puntos clave sobre lo que significa y cómo se aplica en la consulta que proporcionaste:
-- ### Significado de `VARCHAR(10)`
-- 1. **Longitud Máxima**:
--    - `VARCHAR(10)` significa que el campo puede almacenar hasta 10 caracteres. Esto incluye cualquier combinación de letras, números y caracteres especiales. Si intentas insertar una cadena más larga que 10 caracteres, obtendrás un error o, en algunos sistemas de base de datos, se truncará la cadena a los primeros 10 caracteres.
-- 2. **Almacenamiento Eficiente**:
--    - Al ser de longitud variable, `VARCHAR` solo ocupa el espacio necesario para almacenar los caracteres que efectivamente se insertan en la columna, más un pequeño overhead para guardar la longitud de la cadena. Por ejemplo, si almacenas "Hola", ocupará 4 bytes más el overhead, en lugar de ocupar 10 bytes como lo haría un campo `CHAR(10)`.
-- 3. **Comparaciones**:
--    - Al realizar comparaciones con cadenas de caracteres, las reglas de longitud y tipo de datos aplican. Si comparas cadenas de diferentes longitudes, SQL puede manejar esto adecuadamente, pero es importante tener en cuenta que la longitud puede afectar los resultados si no se maneja correctamente.
-- ### Uso en Tu Consulta
-- En tu consulta SQL:
-- ```sql
-- COALESCE(
--     CAST(
--         p.fecha_entrega AS VARCHAR(10)
--     ), 'No Ha Sido Entregado'
-- ) AS "Fecha Entrega"
-- ```
-- - **`CAST(p.fecha_entrega AS VARCHAR(10))`**: Aquí estás convirtiendo el valor de `p.fecha_entrega` a un tipo de dato `VARCHAR(10)`. Esto es útil si quieres asegurarte de que la fecha se represente en un formato de cadena que no exceda los 10 caracteres. Sin embargo, si el formato de la fecha en `p.fecha_entrega` es más largo (por ejemplo, "2024-11-04 10:00:00"), la conversión truncará la cadena a solo los primeros 10 caracteres, resultando en algo como "2024-11-0".
-- - **`COALESCE(...)`**: Si `p.fecha_entrega` es nulo, `COALESCE` devolverá el valor predeterminado "No Ha Sido Entregado". Esto asegura que en caso de que no haya una fecha de entrega, tu consulta aún retornará un valor comprensible.
-- El error que estás recibiendo, **"Conversion failed when converting date and/or time from character string"**, indica que SQL Server está intentando convertir un valor de tipo carácter a un tipo de fecha, y no puede hacerlo porque el formato del valor no es válido como una fecha.
-- ### Problemas Potenciales
-- 1. **Formato Incorrecto**: Si `p.fecha_entrega` no tiene un formato que SQL Server pueda interpretar como una fecha, esto causará el error.
-- 2. **Uso de `COALESCE`**: En tu consulta, estás utilizando `COALESCE` para devolver una cadena `'No Ha Sido Entregado'` en caso de que `p.fecha_entrega` sea `NULL`. Esto puede causar problemas si `fecha_entrega` se espera que sea un tipo de dato de fecha y no una cadena.
-- ### Solución Propuesta
-- Para evitar el error, puedes hacer lo siguiente:
-- - Cambiar la cadena `'No Ha Sido Entregado'` a un valor de fecha que tenga sentido en el contexto de tu aplicación o simplemente manejar el `NULL` en la presentación de resultados, dependiendo de cómo desees presentar los datos.
-- Aquí hay un ejemplo de cómo corregir la consulta:
-- #### Opción 1: Devolver NULL en lugar de una cadena
-- Si quieres mantener el tipo de datos de fecha, simplemente puedes dejar que `COALESCE` devuelva `NULL`:
-- ```sql
-- SELECT TOP 100
--     c.codigo_cliente,
--     c.nombre_cliente,
--     p.fecha_pedido,
--     p.fecha_esperada,
--     COALESCE(p.fecha_entrega, NULL) AS "Fecha Entrega"
-- FROM
--     pedido p
-- INNER JOIN
--     cliente c ON c.codigo_cliente = p.codigo_cliente
-- WHERE
--     p.fecha_entrega > p.fecha_esperada OR p.fecha_entrega IS NULL;
-- ```
-- Esto devolverá `NULL` si no hay fecha de entrega.
-- #### Opción 2: Devolver una fecha específica
-- Si necesitas devolver una fecha por defecto en lugar de `NULL`, puedes usar un valor de fecha válido:
-- ```sql
-- SELECT TOP 100
--     c.codigo_cliente,
--     c.nombre_cliente,
--     p.fecha_pedido,
--     p.fecha_esperada,
--     COALESCE(p.fecha_entrega, CAST('1900-01-01' AS DATETIME)) AS "Fecha Entrega" -- O cualquier otra fecha válida
-- FROM
--     pedido p
-- INNER JOIN
--     cliente c ON c.codigo_cliente = p.codigo_cliente
-- WHERE
--     p.fecha_entrega > p.fecha_esperada OR p.fecha_entrega IS NULL;
-- ```
-- En este caso, estoy utilizando una fecha de placeholder (`'1900-01-01'`). Cambia esto a una fecha que tenga sentido en tu contexto.
-- ### Consideraciones sobre la Consulta
-- - **Manejo de Fechas**: Asegúrate de que las columnas `fecha_pedido`, `fecha_esperada`, y `fecha_entrega` son del tipo de dato correcto (normalmente `DATETIME` o `DATE` en SQL Server).
-- - **Formato de Fecha**: Si necesitas convertir cadenas a fechas en otras partes de tu consulta, asegúrate de que las cadenas estén en un formato que SQL Server reconozca (por ejemplo, `'YYYY-MM-DD'`).
-- ### Resumen
-- El problema principal proviene de la mezcla de tipos de datos (fechas y cadenas). Asegúrate de que todas las columnas que esperas que sean fechas realmente lo sean, y usa `COALESCE` de manera que no introduzcas un tipo de dato que cause conflictos.