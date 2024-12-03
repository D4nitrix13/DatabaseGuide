--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- Suma Total de Pagos por Año:
-- Muestra la suma total de todos los pagos realizados para cada uno de los años que aparecen en la tabla de pagos.

SELECT TOP 4 
    YEAR(fecha_pago) AS "Año", 
    SUM(total) AS "TotalDePagos"
FROM 
    pago AS [p]
GROUP BY 
    YEAR(fecha_pago)
ORDER BY 
    YEAR(fecha_pago) ASC;