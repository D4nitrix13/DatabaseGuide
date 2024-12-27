--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 22. Clientes con Pedidos sin Pagos:
-- Muestra un listado de clientes que han realizado pedidos pero no han realizado ningún pago.

SELECT TOP 5 c.codigo_cliente, c.nombre_cliente, pd.codigo_pedido
FROM
    cliente [c]
    INNER JOIN pedido [pd] ON pd.codigo_cliente = c.codigo_cliente
    LEFT JOIN pago [pg] ON pg.codigo_cliente = c.codigo_cliente
WHERE
    pg.codigo_cliente IS NULL