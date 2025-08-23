--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 9. Empleados y sus Jefes a Varios Niveles:
-- Devuelve un listado con el nombre de cada empleado, el nombre de su jefe, y el nombre del jefe de su jefe.

SELECT *
FROM (
        SELECT
            TOP 31 CONCAT(
                [e].[nombre], ' ', [e].[apellido1], ' ', [e].[apellido2]
            ) AS "Nombre Empleado", CONCAT(
                [JefeNivelUno].[nombre], ' ', [JefeNivelUno].[apellido1], ' ', [JefeNivelUno].[apellido2]
            ) AS "Nombre Jefe Directo", CASE
                WHEN CONCAT(
                    [JefeNivelDos].[nombre], ' ', [JefeNivelDos].[apellido1], ' ', [JefeNivelDos].[apellido2]
                ) = ' ' THEN 'No Tiene Jefe Asignado'
                ELSE CONCAT(
                    [JefeNivelDos].[nombre], ' ', [JefeNivelDos].[apellido1], ' ', [JefeNivelDos].[apellido2]
                )
            END AS "Nombre Jefe de Jefe"
        FROM
            [empleado] [e]
            LEFT JOIN empleado [JefeNivelUno] ON [e].[codigo_jefe] = [JefeNivelUno].[codigo_jefe]
            LEFT JOIN empleado [JefeNivelDos] ON [JefeNivelUno].[codigo_jefe] = [JefeNivelDos].[codigo_jefe]
        ORDER BY [e].[nombre] ASC
    ) AS [data]
WHERE
    [data].[Nombre Jefe Directo] <> ' '
    -- auto-unión en cascada sobre la tabla empleado. Esto significa que unirás la tabla empleado tres veces: la primera para los empleados, la segunda para los jefes directos, y la tercera para los jefes de esos jefes.
    -- En este contexto, cascada se refiere a la manera en que la consulta enlaza la tabla `empleado` consigo misma varias veces para acceder a diferentes niveles de jerarquía en una misma estructura.
    -- ### Visualización en Cascada
    -- Piensa en la relación de cascada como una secuencia que se va construyendo, nivel por nivel, desde el empleado hacia arriba en la jerarquía:
    -- - Primer JOIN (empleado → jefe directo): Trae el primer nivel jerárquico (empleado y su jefe directo).
    -- - Segundo JOIN (jefe directo → jefe del jefe): Agrega el siguiente nivel (jefe de ese jefe).
    -- ### Importancia de la Cascada
    -- Este método permite construir una consulta que "sube" en los niveles de jerarquía hasta el nivel deseado, aprovechando la relación referencial de `codigo_jefe` en la misma tabla.
    -- ### Concepto de Jerarquía en Cascada en SQL
    -- La jerarquía en cascada permite construir consultas SQL que extraen múltiples niveles jerárquicos dentro de una misma tabla de empleados, conectando datos de empleados, jefes directos y jefes de jefes en una estructura escalonada. En este tipo de consulta, la tabla `empleado` se une consigo misma varias veces para acceder a diferentes niveles jerárquicos.
    -- #### Visualización en Cascada
    -- La relación en cascada se visualiza como una secuencia que se va construyendo desde el nivel del empleado hacia arriba, avanzando jerárquicamente:
    -- **Primer JOIN**: Conecta el empleado con su jefe directo.
    -- **Segundo JOIN**: Conecta al jefe directo con el jefe de ese jefe, logrando así un segundo nivel de jerarquía.
    -- ### Importancia de la Estructura en Cascada
    -- La cascada permite:
    -- **Escalabilidad**: Acceder a varios niveles jerárquicos sin cambiar la estructura de la tabla.
    -- **Versatilidad**: Facilitar el análisis en organizaciones con estructuras jerárquicas complejas.
    -- **Claridad**: Identificar niveles de liderazgo y subordinación de manera clara, útil para informes o análisis organizacionales.
    -- ### Explicación Detallada de la Consulta
    -- #### 1. Estructura de la Consulta
    -- Esta consulta organiza a los empleados junto a su jefe directo y el jefe de su jefe:
    -- ```sql
    -- SELECT *
    -- FROM (
    --     SELECT
    --         TOP 31
    --         CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) AS "Nombre Empleado",
    --         CONCAT(JefeNivelUno.nombre, ' ', JefeNivelUno.apellido1, ' ', JefeNivelUno.apellido2) AS "Nombre Jefe Directo",
    --         CASE
    --             WHEN CONCAT(JefeNivelDos.nombre, ' ', JefeNivelDos.apellido1, ' ', JefeNivelDos.apellido2) = ' '
    --             THEN 'No Tiene Jefe Asignado'
    --             ELSE CONCAT(JefeNivelDos.nombre, ' ', JefeNivelDos.apellido1, ' ', JefeNivelDos.apellido2)
    --         END AS "Nombre Jefe de Jefe"
    --     FROM
    --         empleado e
    --         LEFT JOIN empleado JefeNivelUno ON e.codigo_jefe = JefeNivelUno.codigo_empleado
    --         LEFT JOIN empleado JefeNivelDos ON JefeNivelUno.codigo_jefe = JefeNivelDos.codigo_empleado
    --     ORDER BY e.nombre ASC
    -- ) AS data
    -- WHERE data.[Nombre Jefe Directo] <> ' ';
    -- ```
    -- #### 2. Desglose de la Jerarquía en Cascada
    -- **Primer Nivel de Jerarquía (Empleado - Jefe Directo)**:
    --   - El primer `LEFT JOIN` conecta al empleado (`e`) con su jefe directo (`JefeNivelUno`).
    --   - Condición de unión: `e.codigo_jefe = JefeNivelUno.codigo_empleado`, que relaciona a cada empleado con su jefe directo.
    --   ```sql
    --   LEFT JOIN empleado JefeNivelUno ON e.codigo_jefe = JefeNivelUno.codigo_empleado
    --   ```
    -- **Segundo Nivel de Jerarquía (Jefe Directo - Jefe del Jefe)**:
    --   - El segundo `LEFT JOIN` conecta el jefe directo (`JefeNivelUno`) con el jefe del jefe (`JefeNivelDos`).
    --   - Condición de unión: `JefeNivelUno.codigo_jefe = JefeNivelDos.codigo_empleado`.
    --   ```sql
    --   LEFT JOIN empleado JefeNivelDos ON JefeNivelUno.codigo_jefe = JefeNivelDos.codigo_empleado
    --   ```
    -- #### 3. Uso del `CASE` para Asignar Valor Predeterminado
    -- Dentro de la subconsulta, la instrucción `CASE` revisa si `"Nombre Jefe de Jefe"` está vacío (es un espacio `' '`). Si es así, reemplaza el valor con `No Tiene Jefe Asignado`. Esto asegura que el usuario final entienda la jerarquía correctamente.
    -- ```sql
    -- CASE
    --     WHEN CONCAT(JefeNivelDos.nombre, ' ', JefeNivelDos.apellido1, ' ', JefeNivelDos.apellido2) = ' '
    --     THEN 'No Tiene Jefe Asignado'
    --     ELSE CONCAT(JefeNivelDos.nombre, ' ', JefeNivelDos.apellido1, ' ', JefeNivelDos.apellido2)
    -- END AS "Nombre Jefe de Jefe"
    -- ```
    -- #### 4. Filtro Final
    -- La consulta externa, `SELECT * FROM (...) AS data`, filtra los resultados para excluir empleados sin jefe directo (`WHERE data.[Nombre Jefe Directo] <> ' '`), lo que da una salida limpia que solo incluye empleados con jefes asignados.
    -- ### Aplicaciones de la Consulta
    -- Esta consulta es útil para generar informes que necesiten mostrar la jerarquía completa de un empleado hasta el segundo nivel de mando. Es especialmente valiosa en contextos organizacionales, como:
    -- **Reportes de estructura de personal**: Listar jerarquías de empleados en un departamento.
    -- **Análisis de línea de mando**: Identificar los niveles de supervisión en diversas áreas.
    -- **Estudios de estructura de autoridad**: Ayudar a visualizar la relación de mando y subordinación dentro de una organización.
    -- Usar un `CASE` en la consulta proporciona una mejor legibilidad al evitar valores de jefe vacíos y sustituirlos con una indicación clara (`No Tiene Jefe Asignado`). Esto optimiza la comprensión para quienes lean el reporte, haciéndolo más informativo y accesible.
    -- El concepto de "cascada" no se limita únicamente a los `JOIN` en SQL; aunque es más comúnmente utilizado en ese contexto para describir la relación jerárquica de datos en un conjunto de registros, también puede aplicarse en otros escenarios. Aquí hay una explicación más detallada:
    -- ### Cascada en SQL
    -- 1. **Cascada en JOINs**:
    --    - Como se mencionó anteriormente, en las consultas SQL, la "cascada" se refiere a la manera en que se unen múltiples instancias de una tabla (auto-uniones) para acceder a diferentes niveles de una jerarquía. Esto es especialmente útil en tablas que representan relaciones parentales o jerárquicas, como la de empleados y sus jefes.
    --    - Ejemplo: Una tabla de empleados puede unirse a sí misma para obtener el jefe directo y el jefe del jefe, creando una cadena de relación.
    -- 2. **Cascada en Actualizaciones y Eliminaciones**:
    --    - En el contexto de las relaciones entre tablas, la cascada también puede referirse a comportamientos en las operaciones de actualización y eliminación. Por ejemplo, si una fila de una tabla padre se elimina, las filas correspondientes en las tablas secundarias pueden ser eliminadas automáticamente si se establece una relación de "cascada" en la clave foránea.
    --    - Esto se logra mediante las opciones `ON DELETE CASCADE` o `ON UPDATE CASCADE` en la definición de las claves foráneas, asegurando que los cambios se propaguen a través de las tablas relacionadas.
    -- 3. **Cascada en Triggers**:
    --    - También se puede aplicar el concepto de cascada a los triggers (disparadores) en una base de datos. Un trigger puede activar una serie de acciones cuando se producen ciertas condiciones, lo que puede llevar a un efecto en cadena en la base de datos.
    --    - Por ejemplo, si se inserta un nuevo registro en una tabla, un trigger podría insertar automáticamente registros en otras tablas relacionadas, generando un efecto de cascada.
    -- 4. **Cascada en Transacciones**:
    --    - En sistemas de bases de datos, la cascada puede referirse a cómo las transacciones se propagan. Si una transacción que afecta múltiples tablas falla, los cambios realizados pueden ser revertidos en todas las tablas, asegurando la integridad de los datos.
    -- 5. **Cascada en Estructuras de Datos**:
    --    - Fuera del contexto de SQL, el término "cascada" también se utiliza en programación y estructuras de datos. Por ejemplo, en la programación orientada a objetos, una llamada de método puede cascada a través de objetos en una jerarquía de clases.
    -- ### Conclusión
    -- Si bien el concepto de cascada es común en la gestión de relaciones jerárquicas mediante `JOINs` en SQL, también se puede aplicar en diversas áreas dentro de la gestión de bases de datos y programación. Su uso está relacionado con la propagación de acciones o efectos a través de una estructura de datos o entre tablas relacionadas, asegurando la integridad y coherencia de los datos.
    -- ### Consultas SQL
    -- 1. **Primera Consulta:**
    --    ```sql
    --    SELECT * FROM (
    --        SELECT TOP 31
    --            CONCAT([e].[nombre], ' ', [e].[apellido1], ' ', [e].[apellido2]) AS "Nombre Empleado",
    --            CONCAT([JefeNivelUno].[nombre], ' ', [JefeNivelUno].[apellido1], ' ', [JefeNivelUno].[apellido2]) AS "Nombre Jefe Directo",
    --            CASE
    --                WHEN CONCAT([JefeNivelDos].[nombre], ' ', [JefeNivelDos].[apellido1], ' ', [JefeNivelDos].[apellido2]) = ' '
    --                THEN 'No Tiene Jefe Asignado'
    --                ELSE CONCAT([JefeNivelDos].[nombre], ' ', [JefeNivelDos].[apellido1], ' ', [JefeNivelDos].[apellido2])
    --            END AS "Nombre Jefe de Jefe"
    --        FROM [empleado] [e]
    --        LEFT JOIN empleado [JefeNivelUno] ON [e].[codigo_jefe] = [JefeNivelUno].[codigo_empleado]
    --        LEFT JOIN empleado [JefeNivelDos] ON [JefeNivelUno].[codigo_jefe] = [JefeNivelDos].[codigo_empleado]
    --        ORDER BY [e].[nombre] ASC
    --    ) AS [data]
    --    WHERE [data].[Nombre Jefe Directo] <> ' ';
    --    ```
    -- 2. **Segunda Consulta:**
    --    ```sql
    --    SELECT * FROM (
    --        SELECT TOP 31
    --            CONCAT([e].[nombre], ' ', [e].[apellido1], ' ', [e].[apellido2]) AS "Nombre Empleado",
    --            CONCAT([JefeNivelUno].[nombre], ' ', [JefeNivelUno].[apellido1], ' ', [JefeNivelUno].[apellido2]) AS "Nombre Jefe Directo",
    --            CASE
    --                WHEN CONCAT([JefeNivelDos].[nombre], ' ', [JefeNivelDos].[apellido1], ' ', [JefeNivelDos].[apellido2]) = ' '
    --                THEN 'No Tiene Jefe Asignado'
    --                ELSE CONCAT([JefeNivelDos].[nombre], ' ', [JefeNivelDos].[apellido1], ' ', [JefeNivelDos].[apellido2])
    --            END AS "Nombre Jefe de Jefe"
    --        FROM [empleado] [e]
    --        LEFT JOIN empleado [JefeNivelUno] ON [JefeNivelUno].[codigo_jefe] = [e].[codigo_empleado]
    --        LEFT JOIN empleado [JefeNivelDos] ON [JefeNivelDos].[codigo_jefe] = [JefeNivelUno].[codigo_empleado]
    --        ORDER BY [e].[nombre] ASC
    --    ) AS [data]
    --    WHERE [data].[Nombre Jefe Directo] <> ' ';
    --    ```
    -- ### Diferencias Clave
    -- 1. **Dirección de los JOINs**:
    --    - **Primera Consulta**:
    --      - El primer `LEFT JOIN` conecta el empleado (`e`) con su jefe directo (`JefeNivelUno`) usando `e.codigo_jefe = JefeNivelUno.codigo_empleado`.
    --      - El segundo `LEFT JOIN` conecta `JefeNivelUno` con `JefeNivelDos` usando `JefeNivelUno.codigo_jefe = JefeNivelDos.codigo_empleado`, lo que busca al jefe del jefe directo.
    --    - **Segunda Consulta**:
    --      - El primer `LEFT JOIN` conecta el jefe directo (`JefeNivelUno`) con el empleado (`e`) usando `JefeNivelUno.codigo_jefe = e.codigo_empleado`, lo que significa que aquí se está buscando a los empleados que tienen un jefe directo que es, a su vez, un empleado.
    --      - El segundo `LEFT JOIN` conecta `JefeNivelDos` directamente con el jefe directo, usando `JefeNivelUno.codigo_jefe = JefeNivelDos.codigo_empleado`.
    -- 2. **Relación y Contexto de Jefes**:
    --    - En la primera consulta, se está buscando un jefe directo para cada empleado basado en el código del jefe del empleado.
    --    - En la segunda consulta, se está buscando un empleado que sea jefe de otro empleado, lo que puede provocar que la relación no sea clara o que no se obtengan los registros esperados.
    -- ### Resultados Diferentes
    -- Debido a estas diferencias en cómo se establecen las relaciones a través de los `JOIN`, es probable que los resultados sean diferentes:
    -- **Primera Consulta**:
    --   - Devuelve empleados que tienen un jefe directo asociado correctamente. El `LEFT JOIN` proporciona jefes que están efectivamente asignados según la estructura jerárquica.
    -- **Segunda Consulta**:
    --   - Podría devolver empleados que no tienen jefes directos definidos de manera correcta. Si la relación entre `JefeNivelUno` y `JefeNivelDos` no se establece adecuadamente, es posible que se obtengan registros que no cumplan con las condiciones esperadas.
    -- ### Conclusión
    -- **¿Cuál es la correcta?** La primera consulta es más probable que produzca resultados válidos y coherentes, ya que sigue la jerarquía adecuada desde el empleado hasta su jefe y luego al jefe de su jefe. La segunda consulta altera esta jerarquía al invertir las relaciones, lo que puede llevar a resultados no deseados o confusos.
    -- Es crucial establecer los `JOINs` de forma que representen correctamente la estructura jerárquica que se desea consultar.
    -- ### Primera Consulta
    -- **Lógica:**
    -- - Busca **cada empleado** y sus respectivos jefes directos y el jefe de esos jefes.
    -- - El enfoque es ascendente en la jerarquía:
    --   - **Empleados → Jefes Directos → Jefes de Jefes**
    -- **Resultado:**
    -- - Devuelve un listado de empleados junto con sus jefes directos y el jefe de esos jefes.
    -- ### Segunda Consulta
    -- **Lógica:**
    -- - Invierte la relación al buscar **jefes** (subordinados) que son empleados.
    -- - El enfoque es descendente en la jerarquía:
    --   - **Jefes Directos (que son empleados) → Subordinados**
    -- **Resultado:**
    -- - Intenta listar empleados que son subordinados de los jefes, pero puede no funcionar como se espera porque el primer `LEFT JOIN` se basa en la relación de jefe a empleado, lo que puede llevar a resultados que no muestren correctamente la jerarquía de empleados y sus jefes.
    -- ### Conclusión sobre la Segunda Consulta
    -- - En esencia, la segunda consulta se interpreta como un intento de listar los subordinados de los empleados, pero dado que el `JOIN` no está configurado correctamente, es probable que no obtenga el resultado deseado.
    -- **Subordinados** se refiere a los empleados que reportan a un jefe, mientras que en la primera consulta, estás enfocándote en los empleados desde su perspectiva hacia arriba en la jerarquía.
    -- Si el objetivo es listar subordinados, la consulta tendría que estructurarse adecuadamente para reflejar esa relación de jefes a subordinados. En su forma actual, la segunda consulta podría llevar a confusión en cuanto a los resultados obtenidos.
    --     El concepto de "cascada" en el contexto de las uniones de tablas se refiere generalmente a la manera en que las relaciones se extienden a través de múltiples niveles en una estructura jerárquica, pero no está limitado a uniones dentro de una sola tabla. Aquí te explico con más detalle:
    -- ### Cascada en Joins de una Sola Tabla
    -- Cuando hablamos de uniones en cascada dentro de una misma tabla, como en el caso de empleados y sus jefes, se refiere a la capacidad de realizar uniones múltiples para acceder a diferentes niveles de la jerarquía. Por ejemplo, puedes unirte a la tabla de empleados para obtener no solo el empleado y su jefe inmediato, sino también el jefe de ese jefe.
    -- **Ejemplo:**
    -- ```sql
    -- SELECT
    --     e.nombre AS "Empleado",
    --     JefeNivelUno.nombre AS "Jefe",
    --     JefeNivelDos.nombre AS "Jefe del Jefe"
    -- FROM empleado e
    -- LEFT JOIN empleado JefeNivelUno ON e.codigo_jefe = JefeNivelUno.codigo_empleado
    -- LEFT JOIN empleado JefeNivelDos ON JefeNivelUno.codigo_jefe = JefeNivelDos.codigo_empleado;
    -- ```
    -- En este caso, "cascada" describe cómo se accede a múltiples niveles de la jerarquía dentro de la misma tabla, donde `JefeNivelUno` es el jefe directo de `e`, y `JefeNivelDos` es el jefe de `JefeNivelUno`.
    -- ### Cascada en Joins de Diferentes Tablas
    -- El concepto de cascada no se limita solo a uniones en la misma tabla; también puede aplicarse en uniones entre diferentes tablas que están relacionadas jerárquicamente o que tienen relaciones de referencia.
    -- **Ejemplo:**
    -- Imagina que tienes una tabla de empleados y otra tabla de departamentos. Puedes unir estas tablas para acceder a los jefes y al departamento al que pertenecen, de manera que se conserve la jerarquía.
    -- ```sql
    -- SELECT
    --     e.nombre AS "Empleado",
    --     Jefe.nombre AS "Jefe",
    --     d.nombre AS "Departamento"
    -- FROM empleado e
    -- LEFT JOIN empleado Jefe ON e.codigo_jefe = Jefe.codigo_empleado
    -- LEFT JOIN departamento d ON e.codigo_departamento = d.codigo_departamento;
    -- ```
    -- ### Resumen
    -- **Cascada en Joins**: El término "cascada" se utiliza comúnmente para describir la forma en que los datos se extraen de una estructura jerárquica, ya sea en la misma tabla o entre tablas diferentes. Se refiere a cómo las uniones pueden extenderse a través de múltiples niveles de relaciones.
    -- **Uniones en Diferentes Tablas**: Las uniones pueden ser igualmente jerárquicas entre diferentes tablas, y el término cascada puede ser apropiado en esos contextos si estás siguiendo relaciones que se expanden a lo largo de una jerarquía organizativa o relacional.
    -- En conclusión, el concepto de cascada puede aplicarse a uniones tanto en la misma tabla como entre diferentes tablas, dependiendo de cómo se estructuran las relaciones y se accede a los datos.