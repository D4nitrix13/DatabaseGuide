--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 8. Empleados y sus Jefes:
-- Muestra el nombre de los empleados junto con el nombre de sus jefes.

-- Hacer una auto-unión (self join) en la tabla empleado, usando el campo codigo_jefe para identificar la relación entre empleado y jefe.
-- Auto-Join con LEFT JOIN: Hacemos un LEFT JOIN entre empleado (e) y otra instancia de empleado (Jefe) donde el campo codigo_jefe del empleado coincide con el codigo_empleado del jefe. Esto nos permite emparejar cada empleado con su jefe.

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
    -- ### 8. Empleados y sus Jefes
    -- Esta consulta muestra el nombre de los empleados junto con el nombre de sus jefes directos. La lógica detrás de esta consulta se basa en un **LEFT JOIN**, que permite incluir todos los empleados, incluso aquellos que no tienen un jefe asignado.
    -- ```sql
    -- SELECT
    --     TOP 31 CONCAT(
    --         e.nombre,
    --         ' ',
    --         e.apellido1,
    --         ' ',
    --         e.apellido2
    --     ) AS "Nombre Apellido Empleado",
    --     CASE
    --         WHEN CONCAT(
    --             Jefe.nombre,
    --             ' ',
    --             Jefe.apellido1,
    --             ' ',
    --             Jefe.apellido2
    --         ) = ' ' THEN 'No Tiene Jefe Asignado'
    --         ELSE CONCAT(
    --             Jefe.nombre,
    --             ' ',
    --             Jefe.apellido1,
    --             ' ',
    --             Jefe.apellido2
    --         )
    --     END AS 'Nombre Apellido Jefe'
    -- FROM empleado e
    --     LEFT JOIN empleado Jefe ON e.codigo_jefe = Jefe.codigo_empleado
    -- ORDER BY
    --     e.nombre ASC;
    -- ```
    -- ### Explicación de la Consulta
    -- 1. **Selección de Datos**:
    --    - La consulta selecciona los primeros 31 empleados y construye una cadena que combina su nombre y apellidos.
    --    - Utiliza un `CASE` para manejar la situación en la que un empleado no tiene un jefe asignado, mostrando 'No Tiene Jefe Asignado' en lugar de un valor en blanco.
    -- 2. **LEFT JOIN**:
    --    - Se realiza un `LEFT JOIN` de la tabla `empleado` (alias `e`) consigo misma, donde `e.codigo_jefe` se une a `Jefe.codigo_empleado`.
    --    - Esta relación asegura que se obtienen los jefes directos de cada empleado.
    -- ### Comparación de Consultas
    -- #### Primera Consulta
    -- ```sql
    -- SELECT
    --     TOP 50 CONCAT(
    --         e.nombre,
    --         ' ',
    --         e.apellido1,
    --         ' ',
    --         e.apellido2
    --     ) AS "Nombre Apellido Empleado",
    --     CONCAT(
    --         Jefe.nombre,
    --         ' ',
    --         Jefe.apellido1,
    --         ' ',
    --         Jefe.apellido2
    --     ) AS "Nombre Apellido Jefe"
    -- FROM empleado e
    --     LEFT JOIN empleado Jefe ON Jefe.codigo_jefe = e.codigo_empleado
    -- ORDER BY e.nombre ASC;
    -- ```
    -- **Condición de Unión**: `LEFT JOIN empleado Jefe ON Jefe.codigo_jefe = e.codigo_empleado`
    -- **Análisis**: Esta consulta busca a los empleados cuyo jefe es el actual (`e`). Esto resulta en que `Jefe` representa a los subordinados de `e`, no a sus jefes. Por tanto, la columna "Nombre Apellido Jefe" muestra incorrectamente a los subordinados en lugar de a los jefes.
    -- #### Segunda Consulta
    -- ```sql
    -- SELECT
    --     TOP 31 CONCAT(
    --         e.nombre,
    --         ' ',
    --         e.apellido1,
    --         ' ',
    --         e.apellido2
    --     ) AS "Nombre Apellido Empleado",
    --     CONCAT(
    --         Jefe.nombre,
    --         ' ',
    --         Jefe.apellido1,
    --         ' ',
    --         Jefe.apellido2
    --     ) AS "Nombre Apellido Jefe"
    -- FROM empleado e
    --     LEFT JOIN empleado Jefe ON e.codigo_jefe = Jefe.codigo_empleado
    -- ORDER BY e.nombre ASC;
    -- ```
    -- **Condición de Unión**: `LEFT JOIN empleado Jefe ON e.codigo_jefe = Jefe.codigo_empleado`
    -- **Análisis**: Aquí, la condición de unión establece que el `codigo_jefe` del empleado `e` se compara con el `codigo_empleado` del jefe. Esto vincula correctamente a cada empleado con su jefe directo, mostrando así los nombres de los jefes en la columna "Nombre Apellido Jefe".
    -- ### Conclusión: ¿Cuál es la Consulta Correcta?
    -- La **segunda consulta** es la correcta para mostrar al jefe de cada empleado, ya que establece la relación adecuada entre empleados y jefes. La primera consulta, al invertir la relación, genera un resultado incorrecto al mostrar subordinados en lugar de jefes.
    -- #### Concepto de Subordinados
    -- En este contexto, **subordinados** se refiere a aquellos empleados que están en un nivel jerárquico inferior y reportan a un jefe. En una estructura organizacional, los subordinados son los empleados que dependen de un superior para recibir instrucciones, tareas y supervisión. Por ejemplo, en una jerarquía laboral, los subordinados son aquellos que tienen un `codigo_jefe` que apunta al `codigo_empleado` de otro empleado, es decir, están bajo la autoridad de un jefe.