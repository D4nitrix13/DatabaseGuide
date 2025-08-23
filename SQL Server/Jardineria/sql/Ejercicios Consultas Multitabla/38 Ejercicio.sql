--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- Facturación por Producto:
-- La misma información que en el ejercicio anterior, pero agrupada por código de producto.

SELECT
    dp.codigo_producto,
    ROUND(SUM(dp.cantidad * dp.precio_unidad), 2) AS BaseImponible,
    ROUND(SUM(dp.cantidad * dp.precio_unidad), 2) * 0.21 AS Iva,
    ROUND(SUM(dp.cantidad * dp.precio_unidad), 2) * 1.21 AS TotalFacturado
FROM 
    detalle_pedido dp
GROUP BY dp.codigo_producto ASC