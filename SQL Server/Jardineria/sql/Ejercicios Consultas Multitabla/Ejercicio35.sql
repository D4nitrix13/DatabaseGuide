--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 35. Productos por Pedido:
-- Calcula el número de productos diferentes que hay en cada uno de los pedidos.

SELECT
    TOP 5 pd.codigo_pedido,
    COUNT(DISTINCT d.codigo_producto) AS [cantidad productos diferentes que hay en cada uno de los pedidos]
FROM
    detalle_pedido d
    INNER JOIN producto p ON d.codigo_producto = p.codigo_producto
    INNER JOIN pedido pd ON pd.codigo_pedido = d.codigo_pedido
GROUP BY
    pd.codigo_pedido
ORDER BY pd.codigo_pedido ASC