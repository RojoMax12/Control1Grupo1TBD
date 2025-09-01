INSERT INTO sueldo (id_sueldo, valor, mes) VALUES
(1, 800, 'Enero'),
(2, 850, 'Febrero'),
(3, 900, 'Marzo'),
(4, 950, 'Abril'),
(5, 1000, 'Mayo'),
(6, 1050, 'Junio'),
(7, 1100, 'Julio'),
(8, 1150, 'Agosto'),
(9, 1200, 'Septiembre'),
(10, 1250, 'Octubre');

INSERT INTO comuna (id_comuna, nombre) VALUES
(1, 'Centro'),
(2, 'Norte'),
(3, 'Sur'),
(4, 'Este'),
(5, 'Oeste'),
(6, 'Valle'),
(7, 'Montaña'),
(8, 'Playa'),
(9, 'Puerto'),
(10, 'Campo');

INSERT INTO tipodoc (id_tipodoc, nombre) VALUES
(1, 'Factura'),
(2, 'Boleta'),
(3, 'Nota de Crédito'),
(4, 'Nota de Débito'),
(5, 'Recibo'),
(6, 'Orden de Compra'),
(7, 'Ticket'),
(8, 'Guía de Despacho'),
(9, 'Factura Exenta'),
(10, 'Vale');

INSERT INTO empleado (id_empleado, id_sueldo, id_comuna, cargo, nombre) VALUES
(1, 1, 1, 'Supervisor', 'Juan Pérez'),
(2, 2, 2, 'Cajero', 'María López'),
(3, 3, 3, 'Gerente', 'Pedro Gómez'),
(4, 4, 4, 'Supervisor', 'Ana Torres'),
(5, 5, 5, 'Cajero', 'Luis Díaz'),
(6, 6, 6, 'Cajero', 'Laura Silva'),
(7, 7, 7, 'Gerente', 'Jorge Ramírez'),
(8, 8, 8, 'Supervisor', 'Sofía Herrera'),
(9, 9, 9, 'Gerente', 'Diego Castro'),
(10, 10, 10, 'Cajero', 'Carla Morales');

INSERT INTO vendedor (id_vendedor, nombre) VALUES
(1, 'Ricardo Fuentes'),
(2, 'Valentina Rojas'),
(3, 'Fernando Aguilar'),
(4, 'Isabel Contreras'),
(5, 'Matías Pereira'),
(6, 'Camila Varela'),
(7, 'Sebastián León'),
(8, 'Natalia Paredes'),
(9, 'Gonzalo Méndez'),
(10, 'Paula Estrada');

INSERT INTO tienda (id_tienda, nombre) VALUES
(1, 'Tienda Centro'),
(2, 'Tienda Norte'),
(3, 'Tienda Sur'),
(4, 'Tienda Este'),
(5, 'Tienda Oeste'),
(6, 'Tienda Valle'),
(7, 'Tienda Montaña'),
(8, 'Tienda Playa'),
(9, 'Tienda Puerto'),
(10, 'Tienda Campo');

INSERT INTO venta (id_venta, id_tienda, id_vendedor, id_tipodoc, anio, mes, dia) VALUES
(1, 1, 1, 1, 2023, 'Enero', 5),
(2, 2, 2, 2, 2023, 'Febrero', 10),
(3, 3, 3, 3, 2023, 'Marzo', 15),
(4, 4, 4, 4, 2023, 'Abril', 20),
(5, 5, 5, 5, 2023, 'Mayo', 25),
(6, 6, 6, 6, 2023, 'Junio', 12),
(7, 7, 7, 7, 2023, 'Julio', 7),
(8, 8, 8, 8, 2023, 'Agosto', 18),
(9, 9, 9, 9, 2023, 'Septiembre', 22),
(10, 10, 10, 10, 2023, 'Octubre', 30);

INSERT INTO producto (id_producto, nombre, precio) VALUES
(1, 'Laptop', 800),
(2, 'Mouse', 20),
(3, 'Teclado', 35),
(4, 'Monitor', 200),
(5, 'Impresora', 150),
(6, 'Teléfono', 500),
(7, 'Tablet', 300),
(8, 'Auriculares', 50),
(9, 'Disco Duro', 100),
(10, 'USB', 15);

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
