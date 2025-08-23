--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

SELECT
    TOP 31 CONCAT(
        e.nombre,
        ' ',
        e.apellido1,
        ' ',
        e.apellido2
    ) AS "Nombre Apellido Empleado",
    CASE
        WHEN CONCAT(
            Jefe.nombre,
            ' ',
            Jefe.apellido1,
            ' ',
            Jefe.apellido2
        ) = ' ' THEN 'No Tiene Jefe Asignado'
        ELSE CONCAT(
            Jefe.nombre,
            ' ',
            Jefe.apellido1,
            ' ',
            Jefe.apellido2
        )
    END AS 'Nombre Apellido Jefe'
FROM empleado e
    LEFT JOIN empleado Jefe ON e.codigo_jefe = Jefe.codigo_empleado
ORDER BY
    e.nombre ASC
    -- El CASE en SQL es una estructura de control que permite realizar evaluaciones condicionales, similar a una declaración `if-else` en otros lenguajes de programación. Sirve para manejar situaciones en las que se necesita asignar un valor a una columna basada en condiciones específicas. Aquí te explico en detalle cómo funciona:
    -- Estructura del CASE
    -- La sintaxis básica del CASE es la siguiente:
    -- ```sql
    -- CASE
    --     WHEN <condición1> THEN <resultado1>
    --     WHEN <condición2> THEN <resultado2>
    --     ...
    --     ELSE <resultadoPorDefecto>
    -- END
    -- ```
    -- Componentes del CASE
    -- 1. WHEN:
    --    - Aquí se especifica la condición que se evalúa. Si la condición se cumple (es verdadera), se ejecuta el bloque de código correspondiente.
    --    - Por ejemplo: `WHEN columna = 'valor' THEN 'Resultado'` significa que si el valor de la columna es igual a 'valor', se devolverá 'Resultado'.
    -- 2. THEN:
    --    - Indica el resultado que se devolverá si la condición especificada en el WHEN es verdadera. Es el valor que se asignará si se cumple la condición.
    --    - Por ejemplo: `THEN 'Empleado'` significa que si la condición del WHEN se cumple, el resultado será la cadena 'Empleado'.
    -- 3. ELSE:
    --    - Esta sección es opcional y se utiliza para proporcionar un valor por defecto que se devolverá si ninguna de las condiciones anteriores se cumple.
    --    - Por ejemplo: `ELSE 'No asignado'` significa que si ninguna de las condiciones WHEN se cumple, se devolverá el valor 'No asignado'.
    -- 4. END: - Indica el final de la estructura CASE.
    -- Ejemplo de Uso del CASE
    -- Vamos a ver un ejemplo práctico para ilustrar cómo se aplica el CASE en una consulta SQL.
    -- ```sql
    -- SELECT
    --     nombre,
    --     CASE
    --         WHEN salario >= 50000 THEN 'Alto'
    --         WHEN salario >= 30000 THEN 'Medio'
    --         ELSE 'Bajo'
    --     END AS 'Rango de Salario'
    -- FROM empleados;
    -- ```
    -- - En este ejemplo:
    --   - Condición 1: Si el salario es mayor o igual a 50,000, el resultado será 'Alto'.
    --   - Condición 2: Si el salario es menor a 50,000 pero mayor o igual a 30,000, el resultado será 'Medio'.
    --   - ELSE: Si el salario es menor a 30,000, el resultado será 'Bajo'.
    -- Añadiendo Múltiples Casos
    -- Si deseas añadir múltiples casos, simplemente puedes seguir añadiendo más bloques WHEN y THEN. Por ejemplo:
    -- ```sql
    -- SELECT
    --     nombre,
    --     CASE
    --         WHEN salario >= 70000 THEN 'Excelente'
    --         WHEN salario >= 50000 THEN 'Bueno'
    --         WHEN salario >= 30000 THEN 'Aceptable'
    --         ELSE 'Insuficiente'
    --     END AS 'Clasificación de Salario'
    -- FROM empleados;
    -- ```
    -- En este caso, se evalúan más condiciones y se asignan diferentes rangos según el valor del salario.
    -- Resumen
    -- CASE es una herramienta muy útil para manejar condiciones en SQL.
    -- - Las condiciones en WHEN se evalúan en orden;
    --  si una se cumple, se devuelve el resultado correspondiente en THEN.
    -- ELSE proporciona un valor por defecto si ninguna de las condiciones se cumple.
    -- - Se pueden añadir múltiples condiciones para clasificar o categorizar datos según sea necesario.
    -- Utilizar el CASE permite hacer que tus consultas sean más dinámicas y adaptadas a las necesidades de tus informes o análisis de datos.