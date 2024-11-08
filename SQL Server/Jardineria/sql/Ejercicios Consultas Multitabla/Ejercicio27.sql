--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 27. Pedidos por Estado:
-- Cuenta cuántos pedidos hay en cada estado, ordenando el resultado de manera descendente por el número de pedidos.

SELECT TOP 3 estado, COUNT(codigo_pedido) [Total Pedidos]
FROM pedido
GROUP BY
    estado
ORDER BY [Total Pedidos] DESC