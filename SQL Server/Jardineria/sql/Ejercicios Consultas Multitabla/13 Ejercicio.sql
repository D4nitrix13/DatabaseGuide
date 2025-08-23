--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 14. Clientes sin Pagos y Pedidos:
-- Muestra un listado que incluye clientes que no han realizado ningún pago y aquellos que no han realizado ningún pedido.

SELECT TOP 17 c.codigo_cliente, c.nombre_cliente
FROM
    cliente c
    LEFT JOIN pago pg ON pg.codigo_cliente = c.codigo_cliente
    LEFT JOIN pedido pd ON pd.codigo_cliente = c.codigo_cliente
WHERE
    pg.codigo_cliente IS NULL
    AND pd.codigo_cliente IS NULL