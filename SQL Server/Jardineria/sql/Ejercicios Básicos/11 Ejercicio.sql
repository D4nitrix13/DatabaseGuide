--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 12. Pedidos Entregados en Enero:
-- Devuelve todos los pedidos que han sido entregados en el mes de enero de cualquier año.

SELECT
    TOP 20 codigo_pedido,
    estado,
    fecha_entrega
FROM pedido
WHERE
    estado = 'Entregado'
    AND MONTH(fecha_entrega) = '1'