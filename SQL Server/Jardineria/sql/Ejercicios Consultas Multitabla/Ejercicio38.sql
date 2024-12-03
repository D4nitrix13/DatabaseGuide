--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- Facturación Total de la Empresa: 
-- Muestra la facturación total de la empresa, incluyendo la base imponible, IVA (21%) y el total facturado, calculando la base imponible a partir del coste del producto y las unidades vendidas.

SELECT 
    ROUND(SUM(dp.cantidad * dp.precio_unidad), 2) AS BaseImponible,
    ROUND(SUM(dp.cantidad * dp.precio_unidad), 2) * 0.21 AS iva,
    ROUND(SUM(dp.cantidad * dp.precio_unidad), 2) * 1.21 AS totalFacturado
FROM 
    detalle_pedido dp;

-- Base imponible: Calculada como la suma del precio por unidad multiplicado por la cantidad en cada línea de pedido.
-- IVA: Se calcula aplicando el 21% sobre la base imponible.
-- Total facturado: La suma de la base imponible más el IVA.