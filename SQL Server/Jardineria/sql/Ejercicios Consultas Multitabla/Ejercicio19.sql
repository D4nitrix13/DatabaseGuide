--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 19. Productos Nunca Pedidos:
-- Genera un listado de los productos que nunca han sido incluidos en un pedido.

SELECT TOP 129 p.*
FROM producto p
    LEFT JOIN detalle_pedido d ON d.codigo_producto = p.codigo_producto
WHERE
    d.codigo_producto IS NULL