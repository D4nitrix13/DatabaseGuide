--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 7. Clientes y sus Representantes:
-- Devuelve el nombre de los clientes, el nombre de sus representantes, y la ciudad de la oficina a la que pertenece el representante.

SELECT
    TOP 36 c.codigo_cliente,
    c.nombre_cliente,
    CONCAT(
        e.nombre,
        ' ',
        e.apellido1,
        ' ',
        e.apellido2
    ) AS "Nombre Represetante",
    o.ciudad
FROM
    cliente c
    INNER JOIN empleado e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
    INNER JOIN oficina o ON o.codigo_oficina = e.codigo_oficina