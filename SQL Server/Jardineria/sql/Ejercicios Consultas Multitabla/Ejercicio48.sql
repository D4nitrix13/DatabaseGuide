--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/DanielPerezMoralesDev13
--  Correo electrónico: danielperezdev@proton.me

-- Producto con Menos Stock:
-- Devuelve el producto que tiene menos unidades en stock.

SELECT TOP 1
    nombre, cantidad_en_stock
FROM 
    producto
ORDER BY 
    cantidad_en_stock ASC
