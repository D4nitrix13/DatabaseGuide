--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

SELECT
    nombre,
    salario,
    CASE
        WHEN salario >= 70000 THEN 'Excelente'
        WHEN salario >= 50000 THEN 'Bueno'
        WHEN salario >= 30000 THEN 'Aceptable'
        ELSE 'Insuficiente'
    END AS 'Clasificación de Salario'
FROM empleados;

-- La sintaxis básica del CASE es muy similar en SQLite, MySQL y PostgreSQL. A continuación, se muestra cómo se implementa el CASE en cada uno de estos sistemas de gestión de bases de datos:

-- SQLite

-- En SQLite, el uso de CASE es idéntico a la sintaxis estándar SQL. Aquí tienes un ejemplo:

-- ```sql
-- SELECT
--     nombre,
--     salario,
--     CASE
--         WHEN salario >= 70000 THEN 'Excelente'
--         WHEN salario >= 50000 THEN 'Bueno'
--         WHEN salario >= 30000 THEN 'Aceptable'
--         ELSE 'Insuficiente'
--     END AS 'Clasificación de Salario'
-- FROM empleados;
-- ```

-- MySQL

-- En MySQL, la sintaxis del CASE también es la misma. Puedes usar CASE en una consulta para categorizar los datos como se muestra a continuación:

-- ```sql
-- SELECT
--     nombre,
--     salario,
--     CASE
--         WHEN salario >= 70000 THEN 'Excelente'
--         WHEN salario >= 50000 THEN 'Bueno'
--         WHEN salario >= 30000 THEN 'Aceptable'
--         ELSE 'Insuficiente'
--     END AS 'Clasificación de Salario'
-- FROM empleados;
-- ```

-- PostgreSQL

-- PostgreSQL también admite la misma sintaxis para CASE. Aquí tienes un ejemplo:

-- ```sql
-- SELECT
--     nombre,
--     salario,
--     CASE
--         WHEN salario >= 70000 THEN 'Excelente'
--         WHEN salario >= 50000 THEN 'Bueno'
--         WHEN salario >= 30000 THEN 'Aceptable'
--         ELSE 'Insuficiente'
--     END AS "Clasificación de Salario"
-- FROM empleados;
-- ```

-- Notas Comunes

-- 1. Comillas: En SQLite y PostgreSQL, puedes usar comillas simples (`'`) o dobles (`"`), aunque es recomendable usar comillas dobles para nombres de columnas en PostgreSQL, ya que permite el uso de mayúsculas. En MySQL, las comillas simples son más comunes para cadenas y se pueden utilizar para alias.

-- 2. Espaciado: La forma de estructurar el `CASE` es flexible;

--  puedes agregar espacios y sangrías para mejorar la legibilidad sin afectar la ejecución.

-- 3. Anidamiento: Todos estos sistemas permiten anidar declaraciones `CASE` si es necesario, así como combinar condiciones complejas utilizando `AND` y `OR`.

-- Ejemplo de Anidamiento en CASE

-- Si deseas anidar múltiples CASE, puedes hacerlo de la siguiente manera:

-- ```sql
-- SELECT
--     nombre,
--     salario,
--     CASE
--         WHEN salario >= 70000 THEN 'Excelente'
--         WHEN salario >= 50000 THEN
--             CASE
--                 WHEN experiencia >= 5 THEN 'Bueno con Experiencia'
--                 ELSE 'Bueno sin Experiencia'
--             END
--         WHEN salario >= 30000 THEN 'Aceptable'
--         ELSE 'Insuficiente'
--     END AS "Clasificación de Salario"
-- FROM empleados;
-- ```

-- Este ejemplo muestra cómo se puede anidar un CASE dentro de otro, permitiendo una categorización más específica según múltiples condiciones.

-- En resumen, la implementación de CASE es bastante consistente entre SQLite, MySQL y PostgreSQL, facilitando la creación de consultas dinámicas en diferentes sistemas de bases de datos.