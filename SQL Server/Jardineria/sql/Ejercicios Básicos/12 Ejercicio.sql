--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 13. Pagos Realizados mediante Paypal en 2008:
-- Genera un listado de todos los pagos realizados en 2008 mediante Paypal, ordenados de mayor a menor.

SELECT
    TOP 5 codigo_cliente,
    forma_pago,
    fecha_pago
FROM pago
WHERE
    YEAR(fecha_pago) = '2008'
    AND forma_pago = 'PayPal'
ORDER BY codigo_cliente DESC