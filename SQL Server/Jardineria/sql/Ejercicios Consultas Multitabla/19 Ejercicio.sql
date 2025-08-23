--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 20. Detalles de Productos Nunca Pedidos:
-- Devuelve un listado de los productos que nunca han aparecido en un pedido, mostrando su nombre, descripción e imagen.

SELECT TOP 129 p.nombre, p.descripcion, p.gama
FROM
    producto p
    LEFT JOIN detalle_pedido d ON d.codigo_producto = p.codigo_producto
    INNER JOIN gama_producto g ON g.gama = p.gama
WHERE
    d.codigo_producto IS NULL