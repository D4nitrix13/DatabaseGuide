--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 13. Clientes sin Pedidos:
-- Devuelve un listado que muestra solamente los clientes que no han realizado ningún pedido.

SELECT TOP 17 c.codigo_cliente, c.nombre_cliente
FROM cliente c
    LEFT JOIN pedido p ON p.codigo_cliente = c.codigo_cliente
WHERE
    p.codigo_cliente IS NULL