-- SUELDO
INSERT INTO sueldo (valor, mes) VALUES
(800, 'Enero'),
(850, 'Febrero'),
(900, 'Marzo'),
(950, 'Abril'),
(1000, 'Mayo'),
(1050, 'Junio'),
(1100, 'Julio'),
(1150, 'Agosto'),
(1200, 'Septiembre'),
(1250, 'Octubre');

-- COMUNA
INSERT INTO comuna (nombre) VALUES
('Centro'),
('Norte'),
('Sur'),
('Este'),
('Oeste'),
('Valle'),
('Montaña'),
('Playa'),
('Puerto'),
('Campo');

-- TIPODOC
INSERT INTO tipodoc (nombre) VALUES
('Factura'),
('Boleta'),
('Nota de Crédito'),
('Nota de Débito'),
('Recibo'),
('Orden de Compra'),
('Ticket'),
('Guía de Despacho'),
('Factura Exenta'),
('Vale');

-- EMPLEADO
INSERT INTO empleado (id_sueldo, id_comuna, cargo, nombre) VALUES
(1, 1, 'Supervisor', 'Juan Pérez'),
(2, 2, 'Cajero', 'María López'),
(3, 3, 'Gerente', 'Pedro Gómez'),
(4, 4, 'Supervisor', 'Ana Torres'),
(5, 5, 'Cajero', 'Luis Díaz'),
(6, 6, 'Cajero', 'Laura Silva'),
(7, 7, 'Gerente', 'Jorge Ramírez'),
(8, 8, 'Supervisor', 'Sofía Herrera'),
(9, 9, 'Gerente', 'Diego Castro'),
(10, 10, 'Cajero', 'Carla Morales');

-- VENDEDOR
INSERT INTO vendedor (nombre) VALUES
('Ricardo Fuentes'),
('Valentina Rojas'),
('Fernando Aguilar'),
('Isabel Contreras'),
('Matías Pereira'),
('Camila Varela'),
('Sebastián León'),
('Natalia Paredes'),
('Gonzalo Méndez'),
('Paula Estrada');

-- TIENDA
INSERT INTO tienda (nombre) VALUES
('Tienda Centro'),
('Tienda Norte'),
('Tienda Sur'),
('Tienda Este'),
('Tienda Oeste'),
('Tienda Valle'),
('Tienda Montaña'),
('Tienda Playa'),
('Tienda Puerto'),
('Tienda Campo');

-- VENTA
INSERT INTO venta (id_tienda, id_vendedor, id_tipodoc, año, mes, dia) VALUES
(1, 1, 1, 2023, 'Enero', 5),
(2, 2, 2, 2023, 'Febrero', 10),
(3, 3, 3, 2023, 'Marzo', 15),
(4, 4, 4, 2023, 'Abril', 20),
(5, 5, 5, 2023, 'Mayo', 25),
(6, 6, 6, 2023, 'Junio', 12),
(7, 7, 7, 2023, 'Julio', 7),
(8, 8, 8, 2023, 'Agosto', 18),
(9, 9, 9, 2023, 'Septiembre', 22),
(10, 10, 10, 2023, 'Octubre', 30);

-- PRODUCTO
INSERT INTO producto (nombre, precio) VALUES
('Laptop', 800),
('Mouse', 20),
('Teclado', 35),
('Monitor', 200),
('Impresora', 150),
('Teléfono', 500),
('Tablet', 300),
('Auriculares', 50),
('Disco Duro', 100),
('USB', 15);

-- PRODUCTO_VENTA
INSERT INTO producto_venta (id_producto, id_venta) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 6),
(8, 7),
(9, 8),
(10, 9);

-- TIENDA_EMPLEADO
INSERT INTO tienda_empleado (id_tienda, id_empleado) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- TIENDA_COMUNA
INSERT INTO tienda_comuna (id_tienda, id_comuna) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
