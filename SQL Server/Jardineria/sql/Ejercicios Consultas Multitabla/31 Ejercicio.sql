--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 32. Representantes de Ventas y Clientes:
-- Devuelve el nombre de los representantes de ventas junto con el número de clientes que atienden.

SELECT TOP 11 e.nombre, COUNT(*) AS [Numero de Clientes]
FROM empleado e
    INNER JOIN cliente c ON c.codigo_empleado_rep_ventas = e.codigo_empleado
GROUP BY
    e.nombre