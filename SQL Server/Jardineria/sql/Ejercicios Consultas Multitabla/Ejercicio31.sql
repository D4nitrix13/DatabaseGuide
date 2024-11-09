--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 31. Clientes en Ciudades que Empiezan por M:
-- Calcula cuántos clientes hay en cada una de las ciudades que comienzan con la letra "M".

SELECT
    TOP 3 ciudad,
    COUNT(*) AS [Cantidad de Clientes en Ciudad con M]
FROM cliente
WHERE
    ciudad LIKE 'M%'
GROUP BY
    ciudad
ORDER BY
    [Cantidad de Clientes en Ciudad con M] ASC