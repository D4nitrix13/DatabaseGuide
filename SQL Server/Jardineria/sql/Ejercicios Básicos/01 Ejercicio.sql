--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- 2. Oficinas en España
-- Muestra la ciudad y el número de teléfono de todas las oficinas ubicadas en España.
SELECT TOP 3 ciudad, telefono FROM oficina WHERE pais = 'España';

SELECT TOP 3 ciudad, telefono FROM oficina WHERE pais = 'Espa?a';