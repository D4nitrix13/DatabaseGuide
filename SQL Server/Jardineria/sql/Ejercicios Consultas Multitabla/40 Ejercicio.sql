--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- Ventas Totales de Productos:
-- Lista las ventas totales de los productos que han facturado más de 3000 euros, mostrando el nombre, unidades vendidas, total facturado y total con impuestos (21% IVA).

SELECT 
    p.nombre AS NombreProducto,
    SUM(dp.cantidad) AS UnidadesVendidas,
    ROUND(SUM(dp.cantidad * dp.precio_unidad), 2) AS TotalFacturado,
    ROUND(SUM(dp.cantidad * dp.precio_unidad) * 1.21, 2) AS TotalConIVA
FROM 
    detalle_pedido dp
JOIN 
    producto p ON dp.codigo_producto = p.codigo_producto
GROUP BY 
    p.nombre
HAVING 
    SUM(dp.cantidad * dp.precio_unidad) > 3000;
