--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 17. Empleados sin Cliente y Datos de su Oficina:
-- Devuelve un listado que muestra solo los empleados que no tienen un cliente asociado, junto con los datos de la oficina donde trabajan.

-- o.*: El * en SQL se utiliza para seleccionar todas las columnas de la tabla oficina (o). Esto devuelve todos los campos de la tabla oficina asociados con el empleado.
SELECT TOP 20 e.codigo_empleado ID, CONCAT(
        e.nombre, ' ', e.apellido1, ' ', e.apellido2
    ) [Name Empleado], o.*
FROM
    empleado e
    LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
    INNER JOIN oficina o ON o.codigo_oficina = e.codigo_oficina
WHERE
    c.codigo_empleado_rep_ventas IS NULL
    -- Explicación de e. y *:
    --     e.: El prefijo e. es un alias que se asigna a la tabla empleado. Esto se hace para evitar confusión cuando varias tablas tienen columnas con el mismo nombre. En este caso, e. se refiere a la tabla empleado, y por eso, cuando ves e.codigo_empleado, te está indicando que esta columna proviene de la tabla empleado.
    --     o.*: El * significa "todas las columnas" de la tabla oficina. Esto selecciona todos los campos disponibles en la tabla oficina y los incluye en los resultados de la consulta. Es una forma rápida de incluir toda la información de la tabla sin tener que escribir todas las columnas explícitamente.
    -- ¿Es e.* válido en todas las bases de datos?
    --     e.* es válido en SQL siempre y cuando e sea un alias de una tabla previamente definida en la consulta. El uso del alias e (o cualquier otro alias) es común en todas las bases de datos SQL (como MySQL, PostgreSQL, SQL Server, Oracle, etc.). Los alias son una forma estándar de referirse a tablas dentro de una consulta.
    --     Sin embargo, el uso del asterisco (*) no es una recomendación en prácticas de bases de datos de producción, ya que puede hacer que la consulta sea más lenta y difícil de mantener si las tablas tienen muchas columnas, o si la estructura de la tabla cambia en el futuro. Es mejor especificar explícitamente las columnas que necesitas en lugar de usar *.