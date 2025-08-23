--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 8. Clientes con Pagos en 2008:
-- Muestra el código de cliente de aquellos que realizaron pagos en 2008, asegurando que no haya duplicados en los códigos.

SELECT TOP 4 codigo_cliente
FROM pago
WHERE
    YEAR(fecha_pago) = '2008'
GROUP BY
    codigo_cliente
ORDER BY codigo_cliente ASC