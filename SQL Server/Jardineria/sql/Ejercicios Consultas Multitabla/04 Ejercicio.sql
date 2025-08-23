--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 5. Clientes sin Pagos y sus Representantes:
-- Muestra el nombre de los clientes que no han realizado pagos, junto con el nombre de sus representantes y la ciudad de la oficina.

SELECT
    TOP 18 c.codigo_cliente AS "Codigo Cliente",
    c.nombre_cliente "Nombre Cliente",
    CONCAT(
        e.nombre,
        ' ',
        e.apellido1,
        ' ',
        e.apellido2
    ) AS "Nombre Completo Representante de Venta",
    o.ciudad AS "Ciudad Oficina"
FROM
    [cliente] c
    LEFT JOIN [pago] p ON c.codigo_cliente = p.codigo_cliente
    INNER JOIN [empleado] e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
    INNER JOIN [oficina] o ON o.codigo_oficina = e.codigo_oficina
WHERE
    p.codigo_cliente IS NULL
ORDER BY c.codigo_cliente ASC