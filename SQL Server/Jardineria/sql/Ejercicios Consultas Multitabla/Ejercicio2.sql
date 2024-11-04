--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- Error: Incorrect syntax near ')'.
-- El error en tu consulta se debe a que SQL Server requiere que las subconsultas (también llamadas subqueries) tengan un alias. Cada subconsulta debe tener un nombre, incluso si solo estás usando SELECT * FROM (subconsulta). SQL Server espera que identifiques el resultado de la subconsulta con un alias para poder referenciarla.

-- Error: Column 'data.Nombre Cliente' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.
-- El error que estás viendo (Column 'data.Nombre Cliente' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause) indica que estás intentando seleccionar columnas en una consulta que utiliza GROUP BY sin que todas las columnas seleccionadas estén incluidas en la cláusula GROUP BY o en una función de agregación (como SUM, COUNT, etc.).

-- 2. Clientes con Pagos y sus Representantes:
-- Genera un listado de los clientes que han realizado pagos, junto con el nombre de sus representantes de ventas.

SELECT *
FROM (
        SELECT
            TOP 26 c.codigo_cliente AS "Codigo Cliente", c.nombre_cliente "Nombre Cliente", CONCAT(
                e.nombre, ' ', e.apellido1, ' ', e.apellido2
            ) AS "Nombre Completo Representante de Venta"
        FROM
            [cliente] c
            INNER JOIN [pago] p ON c.codigo_cliente = p.codigo_cliente
            INNER JOIN [empleado] e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
        ORDER BY c.codigo_cliente ASC
    ) AS data
GROUP BY
    data."Codigo Cliente",
    data."Nombre Cliente",
    data."Nombre Completo Representante de Venta"