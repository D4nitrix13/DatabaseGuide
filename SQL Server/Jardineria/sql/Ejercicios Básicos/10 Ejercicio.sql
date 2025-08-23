--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 11. Pedidos Rechazados en 2009:
-- Muestra todos los pedidos que fueron rechazados durante el año 2009.

SELECT
    TOP 4 codigo_pedido,
    estado,
    fecha_entrega
FROM pedido
WHERE
    estado = 'Rechazado'
    AND YEAR(fecha_entrega) = '2009'