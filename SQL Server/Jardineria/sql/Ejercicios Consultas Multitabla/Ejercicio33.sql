--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 33. Clientes sin Representante:
-- Calcula cuántos clientes no tienen asignado un representante de ventas.

SELECT
    TOP 1 COUNT(*) AS [Numero de Clientes Sin Representantes]
FROM empleado e
    LEFT JOIN cliente c ON c.codigo_empleado_rep_ventas = e.codigo_empleado
WHERE
    c.codigo_empleado_rep_ventas IS NULL