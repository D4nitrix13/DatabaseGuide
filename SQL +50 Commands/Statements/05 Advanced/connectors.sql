CREATE DATABASE DatabaseTest
    DEFAULT CHARACTER SET = 'utf8mb4';

-- Crear la tabla `users`
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
);

-- Insertar al menos 30 registros en la tabla `users`
INSERT INTO users (name, age, email) VALUES
('Alice Smith', 25, 'alice.smith@example.com'),
('Bob Johnson', 30, 'bob.johnson@example.com'),
('Charlie Brown', 35, 'charlie.brown@example.com'),
('Diana Prince', 28, 'diana.prince@example.com'),
('Ethan Hunt', 40, 'ethan.hunt@example.com'),
('Fiona Gallagher', 22, 'fiona.gallagher@example.com'),
('George Michael', 33, 'george.michael@example.com'),
('Hannah Baker', 27, 'hannah.baker@example.com'),
('Ian Malcolm', 45, 'ian.malcolm@example.com'),
('Jenna Marbles', 31, 'jenna.marbles@example.com'),
('Kevin Hart', 36, 'kevin.hart@example.com'),
('Liam Neeson', 72, 'liam.neeson@example.com'),
('Mia Thermopolis', 29, 'mia.thermopolis@example.com'),
('Nina Dobrev', 35, 'nina.dobrev@example.com'),
('Oliver Queen', 34, 'oliver.queen@example.com'),
('Penny Lane', 25, 'penny.lane@example.com'),
('Quinn Fabray', 27, 'quinn.fabray@example.com'),
('Ryan Gosling', 43, 'ryan.gosling@example.com'),
('Sophie Turner', 28, 'sophie.turner@example.com'),
('Tom Hardy', 46, 'tom.hardy@example.com'),
('Uma Thurman', 53, 'uma.thurman@example.com'),
('Vince Vaughn', 53, 'vince.vaughn@example.com'),
('Wendy Williams', 55, 'wendy.williams@example.com'),
('Xander Cage', 37, 'xander.cage@example.com'),
('Yara Shahidi', 24, 'yara.shahidi@example.com'),
('Zach Braff', 48, 'zach.braff@example.com'),
('Alicia Keys', 42, 'alicia.keys@example.com'),
('Blake Lively', 36, 'blake.lively@example.com'),
('Chris Evans', 43, 'chris.evans@example.com'),
('Dwayne Johnson', 51, 'dwayne.johnson@example.com'),
('Emma Watson', 34, 'emma.watson@example.com'),
('Finn Wolfhard', 21, 'finn.wolfhard@example.com'),
('Gigi Hadid', 29, 'gigi.hadid@example.com'),
('Hailey Bieber', 27, 'hailey.bieber@example.com');
