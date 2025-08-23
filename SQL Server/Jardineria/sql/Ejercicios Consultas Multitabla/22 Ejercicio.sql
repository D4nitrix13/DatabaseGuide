--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 23. Empleados sin Clientes y sus Jefes:
-- Devuelve un listado con los datos de empleados sin clientes asociados y el nombre de su jefe.

SELECT
    TOP 20 e.codigo_empleado AS "ID Empleado",
    e.nombre AS "Nombre Empleado",
    COALESCE(
        CAST(
            "Jefe".codigo_empleado AS VARCHAR(22)
        ),
        'No Tiene Jefe Asignado'
    ) AS "ID Jefe",
    COALESCE(
        "Jefe".nombre,
        'No Tiene Jefe Asignado'
    ) AS "Nombre Jefe"
FROM
    empleado AS e
    LEFT JOIN cliente AS c ON c.codigo_empleado_rep_ventas = e.codigo_empleado
    LEFT JOIN empleado AS Jefe ON e.codigo_jefe = Jefe.codigo_empleado
WHERE
    c.codigo_cliente IS NULL