-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Crea una tabla llamada "persons" con nombre de columna (atributos) de tipo int, varchar y date
CREATE TABLE persons (
    id INT,
    name VARCHAR(100),
    age INT,
    email VARCHAR(50),
    created DATE
);

/*
CONSTRAINTS: Restricciones
*/

-- NOT NULL: Obliga a que el campo id y name posean siempre un valor no nulo
CREATE TABLE persons2 (
    id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(50),
    created DATE
);

-- UNIQUE: Obliga a que el campo id posea valores diferentes
CREATE TABLE persons3 (
    id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(50),
    created DATETIME,
    UNIQUE (id)
);

-- PRIMARY KEY: Establece el campo id como clave primaria para futuras relaciones con otras tablas
CREATE TABLE persons4 (
    id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(50),
    created DATETIME,
    UNIQUE (id),
    PRIMARY KEY (id)
);

-- CHECK: Establece que el campo age sólo podrá contener valores mayores o iguales a 18
CREATE TABLE persons5 (
    id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(50),
    created DATETIME,
    UNIQUE (id),
    PRIMARY KEY (id),
    CHECK (age >= 18)
);

-- DEFAULT: Establece un valor por defecto en el campo created correspondiente a la fecha del sistema
CREATE TABLE persons6 (
    id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(50),
    created DATETIME DEFAULT CURRENT_TIMESTAMP (),
    UNIQUE (id),
    PRIMARY KEY (id),
    CHECK (age >= 18)
);

-- AUTO_INCREMENT: Indica que el campo id siempre se va a incrementar en 1 con cada nuevo inserto
CREATE TABLE persons7 (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(50),
    created DATETIME DEFAULT CURRENT_TIMESTAMP (),
    UNIQUE (id),
    PRIMARY KEY (id),
    CHECK (age >= 18)
);