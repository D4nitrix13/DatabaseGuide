--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 16. Empleados sin Cliente Asociado:
-- Genera un listado que muestra solo los empleados que no tienen un cliente asociado.

SELECT TOP 20 e.codigo_empleado, CONCAT(
        e.nombre, ' ', e.apellido1, ' ', e.apellido2
    ) AS Name
FROM cliente c
    RIGHT JOIN empleado e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE
    c.codigo_cliente IS NULL
    -- Otra Query

SELECT TOP 20 e.codigo_empleado, CONCAT(
        e.nombre, ' ', e.apellido1, ' ', e.apellido2
    ) AS Name
FROM empleado e
    LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE
    c.codigo_cliente IS NULL;