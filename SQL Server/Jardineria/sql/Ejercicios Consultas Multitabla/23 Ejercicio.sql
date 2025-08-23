--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 24. Total de Empleados:
-- Calcula el número total de empleados en la compañía.

SELECT TOP 1 COUNT(
        DISTINCT [e].[codigo_empleado]
    ) + COUNT(
        DISTINCT [Jefe1].[codigo_empleado]
    ) + COUNT(
        DISTINCT [Jefe2].[codigo_empleado]
    ) [Total Empleados]
FROM
    [empleado] [e]
    INNER JOIN [empleado] [Jefe1] ON [e].[codigo_jefe] = [Jefe1].[codigo_empleado]
    INNER JOIN [empleado] [Jefe2] ON [Jefe1].[codigo_jefe] = [Jefe2].[codigo_empleado]