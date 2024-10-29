-- Autor: Daniel Benjamin Perez Morales
-- GitHub: https://github.com/DanielPerezMoralesDev13
-- Correo electrónico: danielperezdev@proton.me

-- Crea una tabla llamada "persons" con nombre de columna (atributos) de tipo int, varchar y date
CREATE TABLE persons (
    id INTEGER,
    name TEXT,
    age INTEGER,
    email TEXT,
    created DATE
);

/*
CONSTRAINTS: Restricciones
*/

-- NOT NULL: Obliga a que el campo id y name posean siempre un valor no nulo
CREATE TABLE persons2 (
    id INTEGER NOT NULL,
    name TEXT NOT NULL,
    age INTEGER,
    email TEXT,
    created DATE
);

-- UNIQUE: Obliga a que el campo id posea valores diferentes
CREATE TABLE persons3 (
    id INTEGER NOT NULL,
    name TEXT NOT NULL,
    age INTEGER,
    email TEXT,
    created DATETIME,
    UNIQUE (id)
);

-- PRIMARY KEY: Establece el campo id como clave primaria para futuras relaciones con otras tablas
CREATE TABLE persons4 (
    id INTEGER NOT NULL,
    name TEXT NOT NULL,
    age INTEGER,
    email TEXT,
    created DATETIME,
    UNIQUE (id),
    PRIMARY KEY (id)
);

-- CHECK: Establece que el campo age sólo podrá contener valores mayores o iguales a 18
CREATE TABLE persons5 (
    id INTEGER NOT NULL,
    name TEXT NOT NULL,
    age INTEGER,
    email TEXT,
    created DATETIME,
    UNIQUE (id),
    PRIMARY KEY (id),
    CHECK (age >= 18)
);

-- DEFAULT: Establece un valor por defecto en el campo created correspondiente a la fecha del sistema
CREATE TABLE persons6 (
    id INTEGER NOT NULL,
    name TEXT NOT NULL,
    age INTEGER,
    email TEXT,
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (id),
    PRIMARY KEY (id),
    CHECK (age >= 18)
);

-- AUTOINCREMENT: Indica que el campo id siempre se va a incrementar en 1 con cada nuevo inserto
CREATE TABLE persons7 (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER,
    email TEXT,
    created DATETIME DEFAULT CURRENT_TIMESTAMP,
    CHECK (age >= 18)
);