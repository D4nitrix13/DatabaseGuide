--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 11. Gamas de Productos Compradas por Cliente:
-- Devuelve un listado de las diferentes gamas de productos que ha comprado cada cliente.

SELECT TOP 318 c.codigo_cliente, pr.codigo_producto, pr.nombre, pr.gama
FROM
    pedido p
    INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente
    INNER JOIN detalle_pedido d ON d.codigo_pedido = p.codigo_pedido
    INNER JOIN producto pr ON pr.codigo_producto = d.codigo_producto
ORDER BY c.codigo_cliente ASC