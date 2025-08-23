--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 21. Oficinas sin Representantes de Ventas:
-- Devuelve las oficinas donde no trabajan empleados que hayan sido representantes de ventas de algún cliente que haya comprado productos de la gama Frutales.

SELECT TOP 18 o.codigo_oficina, o.ciudad, e.codigo_empleado, e.nombre, pr.gama, c.codigo_cliente, c.nombre_cliente
FROM
    oficina AS o
    LEFT JOIN empleado AS e ON e.codigo_oficina = o.codigo_oficina
    LEFT JOIN cliente AS c ON c.codigo_empleado_rep_ventas = e.codigo_empleado
    LEFT JOIN pedido p ON p.codigo_cliente = c.codigo_cliente
    LEFT JOIN detalle_pedido d ON d.codigo_pedido = p.codigo_pedido
    LEFT JOIN producto pr ON pr.codigo_producto = d.codigo_producto
    AND pr.gama = 'Frutales'
WHERE
    pr.gama IS NOT NULL
    OR e.codigo_empleado IS NULL
GROUP BY
    o.codigo_oficina,
    o.ciudad,
    e.codigo_empleado,
    e.nombre,
    pr.gama,
    c.codigo_cliente,
    c.nombre_cliente
ORDER BY c.codigo_cliente, e.codigo_empleado ASC