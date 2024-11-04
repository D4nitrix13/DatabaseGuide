--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- 6. Direcciones de Oficinas en Fuenlabrada:
-- Lista las direcciones de las oficinas que tienen clientes ubicados en Fuenlabrada.

SELECT TOP 6 c.codigo_cliente, e.codigo_empleado, o.codigo_oficina, c.ciudad, CONCAT(
        o.linea_direccion1, ' ', o.linea_direccion2
    ) AS Direccion
FROM
    cliente c
    INNER JOIN empleado e ON e.codigo_empleado = c.codigo_empleado_rep_ventas
    INNER JOIN oficina o ON o.codigo_oficina = e.codigo_oficina
WHERE
    c.ciudad = 'Fuenlabrada'