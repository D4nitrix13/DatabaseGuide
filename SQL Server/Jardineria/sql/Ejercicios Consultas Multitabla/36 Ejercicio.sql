--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 37. Productos Más Vendidos:
-- Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno, ordenado por unidades vendidas.

SELECT
    TOP 20 d.codigo_producto,
    p.nombre,
    SUM(d.cantidad) AS [Total De Unidades Vendidas]
FROM producto p
    INNER JOIN detalle_pedido d ON d.codigo_producto = p.codigo_producto
GROUP BY
    d.codigo_producto,
    p.nombre
ORDER BY [Total De Unidades Vendidas] ASC