--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- Producto con el Precio Más Alto:
-- Devuelve el nombre del producto que tiene el precio de venta más caro.

SELECT TOP 1
    nombre, precio_venta
FROM 
    producto
ORDER BY 
    precio_venta DESC
