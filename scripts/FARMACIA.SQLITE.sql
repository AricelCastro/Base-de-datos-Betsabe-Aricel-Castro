CREATE DATABASE IF NOT EXISTS farmacia;

CREATE TABLE IF NOT EXISTS clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS medicamentos (
    medicamento_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE IF NOT EXISTS recetas (
    receta_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha_receta DATETIME NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS detalles_receta (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    receta_id INT NOT NULL,
    medicamento_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (receta_id) REFERENCES recetas(receta_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (medicamento_id) REFERENCES medicamentos(medicamento_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS proveedores (
    proveedor_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS medicamentos_proveedores (
    medicamento_id INT NOT NULL,
    proveedor_id INT NOT NULL,
    PRIMARY KEY (medicamento_id, proveedor_id),
    FOREIGN KEY (medicamento_id) REFERENCES medicamentos(medicamento_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(proveedor_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO farmacia.clientes (nombre, direccion, telefono, email) VALUES
('Juan Perez', 'Calle 123, Ciudad X', '123456789', 'juan@example.com'),
('Maria Rodriguez', 'Avenida Principal, Ciudad Y', '987654321', 'maria@example.com'),
('Pedro Gomez', 'Plaza Central, Ciudad Z', '555666777', 'pedro@example.com'),
('Ana Lopez', 'Calle 456, Ciudad A', '111222333', 'ana@example.com'),
('Carlos Sanchez', 'Avenida Central, Ciudad B', '444555666', 'carlos@example.com'),
('Luisa Martinez', 'Plaza Principal, Ciudad C', '777888999', 'luisa@example.com'),
('Sofia Ramirez', 'Carrera 789, Ciudad D', '999888777', 'sofia@example.com'),
('David Fernandez', 'Paseo 321, Ciudad E', '666555444', 'david@example.com'),
('Laura Gutierrez', 'Calle 789, Ciudad F', '333444555', 'laura@example.com'),
('Pablo Torres', 'Avenida Norte, Ciudad G', '666777888', 'pablo@example.com'),
('Carmen Diaz', 'Plaza del Sol, Ciudad H', '999000111', 'carmen@example.com'),
('Daniel Ruiz', 'Carrera Este, Ciudad I', '222333444', 'daniel@example.com'),
('Sara Fernandez', 'Paseo Sur, Ciudad J', '555666777', 'sara@example.com'),
('Javier Lopez', 'Calle Oeste, Ciudad K', '888999000', 'javier@example.com'),
('Andrea Gomez', 'Avenida Sur, Ciudad L', '111222333', 'andrea@example.com'),
('Alejandro Perez', 'Plaza Principal, Ciudad M', '444555666', 'alejandro@example.com'),
('Monica Martinez', 'Calle Central, Ciudad N', '777888999', 'monica@example.com'),
('Mario Sanchez', 'Avenida Este, Ciudad O', '000111222', 'mario@example.com');

INSERT INTO farmacia.medicamentos (nombre, descripcion, precio, stock) VALUES
('Paracetamol', 'Analgesico y antipiretico', 5.99, 100),
('Amoxicilina', 'Antibiotico de amplio espectro', 8.50, 50),
('Omeprazol', 'Inhibidor de la bomba de protones', 7.25, 80),
('Ibuprofeno', 'Antiinflamatorio no esteroideo', 6.75, 120),
('Loratadina', 'Antihistamínico', 4.25, 90),
('Atorvastatina', 'Reductor del colesterol', 10.50, 60),
('Diazepam', 'Ansiolítico y relajante muscular', 9.99, 40),
('Aspirina', 'Analgésico y antipirético', 4.50, 80),
('Cetirizina', 'Antihistamínico', 6.25, 50),
('Naproxeno', 'Antiinflamatorio no esteroideo', 8.75, 120);

INSERT INTO farmacia.recetas (cliente_id, fecha_receta, total) VALUES
(1, '2024-05-01 10:00:00', 15.98),
(2, '2024-05-02 11:30:00', 21.50),
(3, '2024-05-03 09:45:00', 14.50),
(4, '2024-05-04 14:15:00', 18.75),
(5, '2024-05-05 16:30:00', 29.95),
(6, '2024-05-06 09:30:00', 22.50),
(7, '2024-05-07 10:45:00', 33.75),
(8, '2024-05-08 12:00:00', 42.25),
(9, '2024-05-09 13:15:00', 15.99),
(10, '2024-05-10 14:30:00', 28.50);

INSERT INTO farmacia.detalles_receta (receta_id, medicamento_id, cantidad, precio) VALUES
(1, 1, 1, 5.99),
(1, 2, 2, 17.00),
(2, 3, 1, 7.25),
(2, 4, 2, 13.50),
(3, 5, 1, 4.25),
(3, 6, 3, 31.50),
(4, 7, 2, 19.98),
(4, 8, 1, 4.50),
(5, 9, 2, 17.50),
(5, 10, 3, 26.25),
(6, 5, 3, 12.75),
(6, 7, 1, 10.50),
(7, 1, 2, 9.00),
(7, 3, 3, 25.50),
(8, 2, 1, 7.25),
(8, 4, 2, 11.98),
(9, 1, 1, 4.50),
(9, 8, 1, 9.99),
(10, 3, 2, 17.00),
(10, 6, 1, 6.75);

INSERT INTO farmacia.proveedores (nombre, contacto, telefono, email) VALUES
('Proveedor A', 'Contacto A', '111222333', 'proveedora@example.com'),
('Proveedor B', 'Contacto B', '444555666', 'proveedorb@example.com'),
('Proveedor C', 'Contacto C', '222333444', 'proveedorc@example.com'),
('Proveedor D', 'Contacto D', '555666777', 'proveedord@example.com');

INSERT INTO farmacia.medicamentos_proveedores (medicamento_id, proveedor_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 1),
(10, 2);

SELECT * FROM farmacia.clientes;
SELECT * FROM farmacia.medicamentos;
SELECT * FROM farmacia.recetas;
SELECT * FROM farmacia.detalles_receta;
SELECT * FROM farmacia.proveedores;
SELECT c.nombre AS nombre_cliente, r.fecha_receta, r.total 
FROM farmacia.clientes c
JOIN farmacia.recetas r ON c.cliente_id = r.cliente_id;
SELECT * FROM farmacia.medicamentos WHERE stock <= 50;
SELECT c.nombre AS nombre_cliente, SUM(r.total) AS total_ventas
FROM farmacia.clientes c
JOIN farmacia.recetas r ON c.cliente_id = r.cliente_id
GROUP BY c.nombre;
SELECT m.* 
FROM farmacia.medicamentos m
JOIN farmacia.medicamentos_proveedores mp ON m.medicamento_id = mp.medicamento_id
GROUP BY m.medicamento_id
HAVING COUNT(mp.proveedor_id) > 1;
SELECT m.nombre AS nombre_medicamento, m.precio, p.nombre AS nombre_proveedor
FROM farmacia.medicamentos m
JOIN farmacia.medicamentos_proveedores mp ON m.medicamento_id = mp.medicamento_id
JOIN farmacia.proveedores p ON mp.proveedor_id = p.proveedor_id
WHERE m.precio > 8;
