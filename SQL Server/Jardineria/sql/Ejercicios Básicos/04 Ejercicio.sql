--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 5. Empleados Excluyendo Representantes de Ventas:
-- Listar el nombre, apellidos y puesto de aquellos empleados que no son representantes de ventas.

SELECT TOP 12 nombre, CONCAT(apellido1, ' ', apellido2) AS Apellido, puesto
FROM empleado
WHERE
    NOT puesto = 'Representante Ventas'