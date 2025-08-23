--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 18. Empleados sin Oficina y sin Cliente:
-- Devuelve un listado que muestra empleados que no tienen una oficina asociada y aquellos que no tienen un cliente asociado.

SELECT TOP 20 CONCAT(
        e.nombre, ' ', e.apellido1, ' ', e.apellido2
    ) Name, o.codigo_oficina
FROM
    empleado e
    LEFT JOIN cliente c ON c.codigo_empleado_rep_ventas = e.codigo_empleado
    LEFT JOIN oficina o ON o.codigo_oficina = e.codigo_oficina
WHERE
    c.codigo_empleado_rep_ventas IS NULL
    OR o.codigo_oficina IS NULL