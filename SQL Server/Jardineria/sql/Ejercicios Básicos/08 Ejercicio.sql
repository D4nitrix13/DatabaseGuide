--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 9. Pedidos No Entregados a Tiempo:
-- Obtiene el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no fueron entregados a tiempo.

SELECT
    TOP 53 codigo_pedido,
    codigo_cliente,
    fecha_esperada,
    COALESCE(
        CAST(fecha_entrega AS VARCHAR(10)),
        'No Ha Sido Entregado'
    ) AS "Fecha Entrega"
FROM pedido
WHERE
    fecha_esperada > fecha_entrega
    OR fecha_entrega IS NULL