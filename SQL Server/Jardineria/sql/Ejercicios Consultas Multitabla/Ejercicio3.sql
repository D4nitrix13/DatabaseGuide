--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 3. Clientes sin Pagos y sus Representantes:
-- Muestra el nombre de los clientes que no han realizado pagos junto con el nombre de sus representantes de ventas.

-- Error: Incorrect syntax near the keyword 'INNER'.

-- El error en la consulta SQL ocurre porque el orden de los JOIN está incorrecto. En SQL, los JOIN deben estar juntos en una secuencia continua antes de cualquier cláusula como WHERE.
-- En este caso, se ha colocado WHERE antes de INNER JOIN, lo cual causa el error de sintaxis

-- * Clausula Error
-- LEFT JOIN [pago] p ON c.codigo_cliente = p.codigo_cliente
-- WHERE p.codigo_cliente IS NULL
-- INNER JOIN [empleado] e ON e.codigo_empleado = c.codigo_empleado_rep_ventas

-- Para resolverlo, debes reorganizar los JOIN de forma que la condición WHERE venga después de todos ellos. Es decir, primero defines todos los JOIN y luego aplicas el filtro WHERE

SELECT
    TOP 18 c.codigo_cliente AS "Codigo Cliente",
    c.nombre_cliente "Nombre Cliente",
    CONCAT(
        e.nombre,
        ' ',
        e.apellido1,
        ' ',
        e.apellido2
    ) AS "Nombre Completo Representante de Venta"
FROM
    [cliente] c
    LEFT JOIN [pago] p ON c.codigo_cliente = p.codigo_cliente
    INNER JOIN [empleado] e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE
    p.codigo_cliente IS NULL
ORDER BY c.codigo_cliente ASC