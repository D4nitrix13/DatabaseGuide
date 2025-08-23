--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- Cliente con Mayor Límite de Crédito:
-- Devuelve el nombre del cliente que tiene el mayor límite de crédito.

SELECT TOP 1
    nombre_cliente, limite_credito
FROM 
    cliente
ORDER BY 
    limite_credito DESC