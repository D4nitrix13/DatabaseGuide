--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 36. Suma de Cantidad de Productos por Pedido:
-- Calcula la suma total de la cantidad de todos los productos que aparecen en cada uno de los pedidos.

SELECT
    TOP 5 p.codigo_pedido,
    SUM(d.cantidad) AS [Cantidad Total De Productos]
FROM pedido AS p
    INNER JOIN detalle_pedido AS d ON d.codigo_pedido = p.codigo_pedido
GROUP BY
    p.codigo_pedido
ORDER BY p.codigo_pedido ASC