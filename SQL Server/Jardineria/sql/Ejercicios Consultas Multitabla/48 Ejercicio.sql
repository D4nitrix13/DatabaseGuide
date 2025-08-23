--  Autor: Daniel Benjamin Perez Morales
--  GitHub: https://github.com/D4nitrix13
--  Correo electrónico: danielperezdev@proton.me

-- Empleados a Cargo de Alberto Soria:
-- Devuelve el nombre, apellidos y email de los empleados que están bajo la supervisión de Alberto Soria.

SELECT 
    Jefe.codigo_empleado AS "ID Jefe", 
    CONCAT(Jefe.nombre, ' ', Jefe.apellido1) AS "Name Jefe",
    e.nombre, 
    e.apellido1, 
    e.email 
 FROM empleado [Jefe]
INNER JOIN empleado [e] ON e.codigo_jefe = Jefe.codigo_empleado
WHERE Jefe.nombre = 'Alberto' AND Jefe.apellido1 = 'Soria'

-- Segunda Query

SELECT 
    e.nombre, e.apellido1, e.apellido2, e.email
FROM 
    empleado e
WHERE 
    e.codigo_jefe = (
        SELECT 
            codigo_empleado
        FROM 
            empleado
        WHERE 
            nombre = 'Alberto' AND apellido1 = 'Soria'
    );
