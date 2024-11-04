--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 4. Información del Jefe de la Empresa:
-- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

SELECT
    TOP 31 puesto,
    nombre,
    CONCAT(apellido1, ' ', apellido2) AS Apellido,
    email
FROM empleado