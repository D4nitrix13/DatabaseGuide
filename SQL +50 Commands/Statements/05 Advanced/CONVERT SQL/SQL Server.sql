--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

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

-- ### SQL Server

-- En SQL Server, puedes usar `CAST` y `CONVERT` para convertir tipos de datos. Aquí están los ejemplos:

-- #### Usando `CAST`

-- ```sql
-- SELECT TOP 73
--     c.codigo_cliente,
--     c.nombre_cliente,
--     p.fecha_pedido,
--     p.fecha_esperada,
--     COALESCE(
--         CAST(p.fecha_entrega AS VARCHAR(10)), 'No Ha Sido Entregado'
--     ) AS "Fecha Entrega"
-- FROM
--     pedido p
--     INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente
-- WHERE
--     p.fecha_entrega > p.fecha_esperada OR p.fecha_entrega IS NULL;
-- ```

-- #### Usando `CONVERT`

-- ```sql
-- SELECT TOP 73
--     c.codigo_cliente,
--     c.nombre_cliente,
--     p.fecha_pedido,
--     p.fecha_esperada,
--     COALESCE(
--         CONVERT(VARCHAR(10), p.fecha_entrega, 120), 'No Ha Sido Entregado'
--     ) AS "Fecha Entrega" -- 120 es un formato de fecha ISO
-- FROM
--     pedido p
--     INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente
-- WHERE
--     p.fecha_entrega > p.fecha_esperada OR p.fecha_entrega IS NULL;
-- ```

-- ### MySQL

-- En MySQL, puedes usar `CAST` de manera similar. Sin embargo, no hay un equivalente directo para `CONVERT` que funcione como en SQL Server;

-- `CAST` es más común para este propósito.
-- #### Usando `CAST`

-- ```sql
-- SELECT
--     c.codigo_cliente,
--     c.nombre_cliente,
--     p.fecha_pedido,
--     p.fecha_esperada,
--     COALESCE(
--         CAST(p.fecha_entrega AS CHAR(10)), 'No Ha Sido Entregado'
--     ) AS "Fecha Entrega"
-- FROM
--     pedido p
--     INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente
-- WHERE
--     p.fecha_entrega > p.fecha_esperada OR p.fecha_entrega IS NULL;
-- ```

-- ### PostgreSQL

-- En PostgreSQL, `CAST` se usa con una sintaxis similar, y `TO_CHAR` es el método preferido para convertir fechas a texto.

-- #### Usando `CAST`

-- ```sql
-- SELECT
--     c.codigo_cliente,
--     c.nombre_cliente,
--     p.fecha_pedido,
--     p.fecha_esperada,
--     COALESCE(
--         CAST(p.fecha_entrega AS VARCHAR), 'No Ha Sido Entregado'
--     ) AS "Fecha Entrega"
-- FROM
--     pedido p
--     INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente
-- WHERE
--     p.fecha_entrega > p.fecha_esperada OR p.fecha_entrega IS NULL;
-- ```

-- #### Usando `TO_CHAR`

-- ```sql
-- SELECT
--     c.codigo_cliente,
--     c.nombre_cliente,
--     p.fecha_pedido,
--     p.fecha_esperada,
--     COALESCE(
--         TO_CHAR(p.fecha_entrega, 'YYYY-MM-DD'), 'No Ha Sido Entregado'
--     ) AS "Fecha Entrega"
-- FROM
--     pedido p
--     INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente
-- WHERE
--     p.fecha_entrega > p.fecha_esperada OR p.fecha_entrega IS NULL;
-- ```

-- ### SQLite3

-- En SQLite, puedes usar `CAST`, pero la conversión de fechas a cadenas se maneja un poco diferente.

-- #### Usando `CAST`

-- ```sql
-- SELECT
--     c.codigo_cliente,
--     c.nombre_cliente,
--     p.fecha_pedido,
--     p.fecha_esperada,
--     COALESCE(
--         CAST(p.fecha_entrega AS TEXT), 'No Ha Sido Entregado'
--     ) AS "Fecha Entrega"
-- FROM
--     pedido p
--     INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente
-- WHERE
--     p.fecha_entrega > p.fecha_esperada OR p.fecha_entrega IS NULL;
-- ```

-- ### Resumen

-- - **SQL Server**: Usa `CAST` y `CONVERT`.
-- - **MySQL**: Principalmente `CAST`.
-- - **PostgreSQL**: Usa `CAST` y `TO_CHAR` para formatear fechas.
-- - **SQLite**: Usa `CAST` como `TEXT` para convertir a texto.

-- Asegúrate de que los tipos de datos sean compatibles con la conversión para evitar errores en la ejecución de las consultas.