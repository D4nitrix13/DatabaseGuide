--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 3. Empleados bajo un Jefe Específico:
-- Obtiene el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

SELECT TOP 3 nombre, CONCAT(apellido1, ' ', apellido2) AS Apellido, email
FROM empleado
WHERE
    codigo_jefe = 7