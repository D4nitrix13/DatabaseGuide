--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

SELECT
    CodigoCliente,
    NombreCliente,
    COALESCE(
        telefono,
        email,
        'Sin contacto'
    ) AS ContactoPrincipal
FROM clientes;

-- La función `COALESCE` en SQL es muy útil para manejar valores nulos. Esta función devuelve el primer valor no nulo en una lista de argumentos. Es especialmente valiosa cuando deseas asegurar que tu consulta devuelva un valor significativo en lugar de `NULL`. A continuación, te proporcionaré ejemplos de cómo utilizar `COALESCE` en SQL Server, MySQL y PostgreSQL.

-- ### Ejemplo de Uso de `COALESCE`

-- #### Supongamos que tenemos la siguiente tabla llamada `clientes`:

-- | CodigoCliente  | NombreCliente  | telefono      | email              |
-- |----------------|----------------|---------------|--------------------|
-- | 1              | Daniel Pérez   | NULL          | Daniel@email.com   |
-- | 2              | María Gómez    | 123456789     | NULL               |
-- | 3              | Pedro López    | NULL          | NULL               |

-- ### 1. SQL Server

-- ```sql
-- SELECT
--     CodigoCliente,
--     NombreCliente,
--     COALESCE(telefono, email, 'Sin contacto') AS ContactoPrincipal
-- FROM
--     clientes;
-- ```

-- * * Resultado: * *
-- | CodigoCliente  | NombreCliente  | ContactoPrincipal    |
-- |----------------|----------------|----------------------|
-- | 1              | Daniel Pérez   | Daniel@email.com     |
-- | 2              | María Gómez    | 123456789            |
-- | 3              | Pedro López    | Sin contacto         |
-- ### 2. MySQL

-- La consulta es similar en MySQL:

-- ```sql
-- SELECT
--     CodigoCliente,
--     NombreCliente,
--     COALESCE(telefono, email, 'Sin contacto') AS ContactoPrincipal
-- FROM
--     clientes;
-- ```

-- * * Resultado: * *
-- | CodigoCliente | NombreCliente   | ContactoPrincipal    |
-- |----------------|----------------|----------------------|
-- | 1              | Daniel Pérez   | Daniel@email.com     |
-- | 2              | María Gómez    | 123456789            |
-- | 3              | Pedro López    | Sin contacto         |
-- ### 3. PostgreSQL

-- Y en PostgreSQL, la sintaxis también es la misma:

-- ```sql
-- SELECT
--     CodigoCliente,
--     NombreCliente,
--     COALESCE(telefono, email, 'Sin contacto') AS ContactoPrincipal
-- FROM
--     clientes;
-- ```

-- * * Resultado: * *
-- | CodigoCliente  | NombreCliente  | ContactoPrincipal    |
-- |----------------|----------------|----------------------|
-- | 1              | Daniel Pérez   | Daniel@email.com     |
-- | 2              | María Gómez    | 123456789            |
-- | 3              | Pedro López    | Sin contacto         |
-- ### Explicación

-- - **Uso de `COALESCE`**: En la consulta, `COALESCE(telefono, email, 'Sin contacto')` revisa primero si `telefono` es nulo. Si no lo es, se utiliza ese valor. Si `telefono` es nulo, se revisa `email`. Si `email` también es nulo, devuelve `'Sin contacto'` como valor predeterminado.
-- - **Aplicaciones**: `COALESCE` es útil en informes y vistas, donde es posible que algunos datos no estén disponibles y desees presentar un valor que indique la falta de información en lugar de `NULL`.

-- Este uso de `COALESCE` permite manejar de manera efectiva los datos nulos y proporciona una salida más clara y comprensible en tus consultas SQL.
