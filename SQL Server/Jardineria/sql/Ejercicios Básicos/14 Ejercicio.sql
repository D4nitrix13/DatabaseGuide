--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 15. Productos Ornamentales en Stock:
-- Devuelve un listado de los productos de la gama Ornamentales que tienen más de 100 unidades en stock, ordenados por precio de venta de mayor a menor.

SELECT TOP 15 *
FROM producto
WHERE
    gama = 'Ornamentales'
    AND cantidad_en_stock > 100
ORDER BY precio_venta DESC