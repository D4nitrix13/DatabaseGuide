--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 26. Pago Medio en 2009:
-- Calcula el pago medio realizado en el año 2009.

SELECT TOP 1 ROUND(AVG(total), 2) AS Promedio
FROM pago
WHERE
    YEAR(fecha_pago) = 2009