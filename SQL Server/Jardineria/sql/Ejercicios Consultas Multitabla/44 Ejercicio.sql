--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- Producto Más Vendido:
-- Devuelve el nombre del producto del que se han vendido más unidades, calculando el total a partir de los datos de la tabla detalle_pedido.

SELECT TOP 1
    p.nombre AS NombreProducto, 
    SUM(dp.cantidad) AS UnidadesVendidas
FROM 
    detalle_pedido dp
INNER JOIN 
    producto p ON dp.codigo_producto = p.codigo_producto
GROUP BY 
    p.nombre
ORDER BY 
    UnidadesVendidas DESC
