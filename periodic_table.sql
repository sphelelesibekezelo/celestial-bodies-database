CREATE TABLE elements (
    atomic_number INT PRIMARY KEY,
    symbol VARCHAR(2) UNIQUE NOT NULL,
    name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE types (
    type_id SERIAL PRIMARY KEY,
    type VARCHAR(20) NOT NULL
);

CREATE TABLE properties (
    atomic_number INT PRIMARY KEY REFERENCES elements(atomic_number),
    atomic_mass DECIMAL(9,3) NOT NULL,
    melting_point_celsius DECIMAL(9,1) NOT NULL,
    boiling_point_celsius DECIMAL(9,1) NOT NULL,
    type_id INT NOT NULL REFERENCES types(type_id)
);

INSERT INTO elements (atomic_number, symbol, name) VALUES 
(1, 'H', 'Hydrogen'),
(2, 'He', 'Helium'),
(3, 'Li', 'Lithium'),
(4, 'Be', 'Beryllium'),
(5, 'B', 'Boron'),
(6, 'C', 'Carbon'),
(7, 'N', 'Nitrogen'),
(8, 'O', 'Oxygen'),
(9, 'F', 'Fluorine'),
(10, 'Ne', 'Neon');

INSERT INTO types (type) VALUES 
('nonmetal'),
('metal'),
('metalloid');

INSERT INTO properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES 
(1, 1.008, -259.1, -252.9, 1),
(2, 4.0026, -272.2, -269, 1),
(6, 12.011, 3550, 4027, 1),
(7, 14.007, -210.1, -195.8, 1),
(8, 15.999, -218, -183, 1),
(3, 6.94, 180.54, 1342, 2),
(4, 9.0122, 1287, 2470, 2),
(5, 10.81, 2075, 4000, 3),
(9, 18.998, -220, -188.1, 1),
(10, 20.18, -248.6, -246.1, 1);
