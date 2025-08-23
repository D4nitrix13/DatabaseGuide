-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/D4nitrix13
-- Correo electrónico: danielperezdev@proton.me

-- Concatena en una sola columa los campos nombre y apellido
SELECT CONCAT('Nombre: ', name, ', Apellidos: ', surname) FROM users

-- Concatena en una sola columa los campos nombre y apellido y le establece el alias 'Nombre completo'
SELECT CONCAT('Nombre: ', name, ', Apellidos: ', surname) AS 'Nombre completo' FROM users