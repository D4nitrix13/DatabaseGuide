--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 28. Precio de Venta de Productos Extremas:
-- Calcula el precio de venta del producto más caro y del más barato en una sola consulta.

SELECT TOP 1 MAX(precio_venta) AS "Producto Más Caro", MIN(precio_venta) AS "Producto Más Barato"
FROM producto
    -- Otra Query

SELECT
    TOP 1 'Producto Más Caro' AS Tipo,
    codigo_producto AS [ID Producto],
    nombre AS [Nombre Producto],
    precio_venta AS [Precio Producto]
FROM producto
WHERE
    precio_venta = (
        SELECT MAX(precio_venta)
        FROM producto
    )
UNION ALL
SELECT
    'Producto Más Barato' AS Tipo,
    codigo_producto AS [ID Producto],
    nombre AS [Nombre Producto],
    precio_venta AS [Precio Producto]
FROM producto
WHERE
    precio_venta = (
        SELECT MIN(precio_venta)
        FROM producto
    )
    -- Otra Query


SELECT
    stored_procedure_caro.codigo_producto AS [ID Producto Más Caro],
    stored_procedure_caro.nombre AS [Nombre Producto Más Caro],
    stored_procedure_caro.precio_venta AS [Precio Producto Más Caro],
    stored_procedure_barato.codigo_producto AS [ID Producto Más Barato],
    stored_procedure_barato.nombre AS [Nombre Producto Más Barato],
    stored_procedure_barato.precio_venta AS [Precio Producto Más Barato]
FROM
    producto stored_procedure_caro
    CROSS JOIN producto stored_procedure_barato
WHERE
    stored_procedure_caro.precio_venta = (
        SELECT MAX(precio_venta)
        FROM producto
    )
    AND stored_procedure_barato.precio_venta = (
        SELECT MIN(precio_venta)
        FROM producto
    );