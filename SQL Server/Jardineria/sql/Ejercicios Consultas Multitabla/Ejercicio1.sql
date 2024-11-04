--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 1. Clientes y sus Representantes de Ventas:
-- Muestra el nombre de cada cliente junto con el nombre y apellido de su representante de ventas.

SELECT TOP 36 c.codigo_cliente, c.nombre_cliente, c.nombre_contacto, c.apellido_contacto, c.codigo_empleado_rep_ventas, e.nombre, CONCAT(e.apellido1, ' ', e.apellido2) AS Apellido
FROM [cliente] c
    INNER JOIN [empleado] e ON c.codigo_empleado_rep_ventas = e.codigo_empleado