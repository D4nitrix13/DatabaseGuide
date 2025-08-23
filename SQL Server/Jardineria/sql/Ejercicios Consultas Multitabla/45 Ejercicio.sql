--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- Clientes con Límite de Crédito Mayor que Pagos:
-- Lista aquellos clientes cuyo límite de crédito es mayor que la suma de los pagos realizados, sin utilizar INNER JOIN.

SELECT 
    codigo_cliente, nombre_cliente, limite_credito
FROM 
    cliente
WHERE 
    limite_credito > (
        SELECT 
            COALESCE(SUM(total), 0)
        FROM 
            pago
        WHERE 
            pago.codigo_cliente = cliente.codigo_cliente
    );