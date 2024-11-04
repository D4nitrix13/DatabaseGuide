--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 9. Pedidos No Entregados a Tiempo:
-- Obtiene el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no fueron entregados a tiempo.

SELECT
    TOP 24 codigo_pedido,
    codigo_cliente,
    fecha_esperada,
    fecha_entrega
FROM pedido
WHERE
    estado = 'Rechazado'