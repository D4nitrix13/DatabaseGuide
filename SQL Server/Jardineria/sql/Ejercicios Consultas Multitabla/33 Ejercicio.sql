--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 34. Fechas de Pagos por Cliente:
-- Calcula la fecha del primer y último pago realizado por cada cliente, mostrando su nombre y apellidos.

SELECT
    TOP 18 c.codigo_cliente,
    c.nombre_cliente,
    c.nombre_contacto,
    c.apellido_contacto,
    MIN(p.fecha_pago) AS [Primer Pago],
    MAX(p.fecha_pago) AS [Ultimo Pago]
FROM pago p
    INNER JOIN cliente c ON c.codigo_cliente = p.codigo_cliente
GROUP BY
    c.codigo_cliente,
    c.nombre_cliente,
    c.nombre_contacto,
    c.apellido_contacto
ORDER BY c.codigo_cliente ASC