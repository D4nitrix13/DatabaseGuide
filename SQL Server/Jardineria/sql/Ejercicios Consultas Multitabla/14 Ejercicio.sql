--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 15. Empleados sin Oficina Asociada:
-- Devuelve un listado que muestra solo los empleados que no tienen una oficina asociada.

SELECT TOP 1 e.codigo_oficina, e.codigo_empleado, CONCAT(
        e.nombre, ' ', e.apellido1, ' ', e.apellido2
    ) AS Nombre
FROM empleado e
    LEFT JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
WHERE
    o.codigo_oficina IS NULL