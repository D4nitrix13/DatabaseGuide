--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 16. Clientes en Madrid con Representantes Específicos:
-- Lista todos los clientes que son de la ciudad de Madrid y cuyo representante de ventas tiene un código de empleado 11 o 30.

SELECT TOP 100 *
FROM cliente
WHERE
    ciudad = 'Madrid'
    AND codigo_empleado_rep_ventas IN (11, 30)