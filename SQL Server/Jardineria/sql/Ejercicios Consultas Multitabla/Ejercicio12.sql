--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 12. Clientes sin Pagos:
-- Genera un listado que muestra solamente los clientes que no han realizado ningún pago.

SELECT TOP 18 c.codigo_cliente, c.nombre_cliente,
FROM cliente c
    LEFT JOIN pago p ON p.codigo_cliente = c.codigo_cliente
WHERE
    p.codigo_cliente IS NULL