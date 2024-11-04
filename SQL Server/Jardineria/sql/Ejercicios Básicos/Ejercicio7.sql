--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 7. Estados de un Pedido:
-- Devuelve un listado con los distintos estados que puede tener un pedido.

SELECT TOP 3 estado
FROM pedido
GROUP BY
    estado
ORDER BY estado ASC