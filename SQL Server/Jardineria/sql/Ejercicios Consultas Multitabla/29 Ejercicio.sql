--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 30. Clientes en Madrid:
-- Devuelve cuántos clientes tienen domicilio en la ciudad de Madrid.

SELECT
    TOP 1 COUNT(*) AS "Total de domicilio en la ciudad de Madrid"
FROM cliente
WHERE
    ciudad = 'Madrid'