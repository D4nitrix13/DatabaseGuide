--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 25. Clientes por País:
-- Devuelve el número de clientes que tiene cada país.

SELECT TOP 5 pais, COUNT(codigo_cliente) [Total Clientes]
FROM cliente
GROUP BY
    pais
ORDER BY [Total Clientes] ASC