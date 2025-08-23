--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 4. Clientes que han Hecho Pagos y sus Representantes:
-- Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes, incluyendo la ciudad de la oficina a la que pertenece cada representante.

SELECT *
FROM (
        SELECT
            TOP 26 c.codigo_cliente AS "Codigo Cliente", c.nombre_cliente "Nombre Cliente", CONCAT(
                e.nombre, ' ', e.apellido1, ' ', e.apellido2
            ) AS "Nombre Completo Representante de Venta", o.ciudad AS "Ciudad Oficina"
        FROM
            [cliente] c
            INNER JOIN [pago] p ON c.codigo_cliente = p.codigo_cliente
            INNER JOIN [empleado] e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
            INNER JOIN [oficina] o ON o.codigo_oficina = e.codigo_oficina
        ORDER BY c.codigo_cliente ASC
    ) AS data
GROUP BY
    data."Codigo Cliente",
    data."Nombre Cliente",
    data."Nombre Completo Representante de Venta",
    data."Ciudad Oficina"