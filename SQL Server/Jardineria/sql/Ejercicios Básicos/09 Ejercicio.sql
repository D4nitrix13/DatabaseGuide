--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 10. Pedidos Entregados Antes de lo Esperado:
-- Lista los pedidos cuya fecha de entrega fue al menos dos días anterior a la fecha esperada.

SELECT
    TOP 13 codigo_pedido,
    fecha_entrega,
    fecha_esperada
FROM pedido
WHERE
    DAY(fecha_entrega) < DAY(fecha_esperada)