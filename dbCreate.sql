CREATE TABLE producto (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio INT DEFAULT 0
);

CREATE TABLE sueldo (
    id_sueldo INT PRIMARY KEY,
    valor INT DEFAULT 0,
    mes VARCHAR(20) NOT NULL
);

CREATE TABLE comuna (
    id_comuna INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE tipodoc (
    id_tipodoc INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE empleado (
    id_empleado INT PRIMARY KEY,
    id_sueldo INT,
    id_comuna INT,
    cargo VARCHAR(50) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_sueldo) REFERENCES sueldo(id_sueldo),
    FOREIGN KEY (id_comuna) REFERENCES comuna(id_comuna)
);

CREATE TABLE vendedor (
	id_vendedor INT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL
);

CREATE TABLE tienda (
    id_tienda INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE venta (
    id_venta INT PRIMARY KEY,
    id_tienda INT,
    id_vendedor INT,
    id_tipodoc INT,
    anio INT NOT NULL,
    mes VARCHAR(20) NOT NULL,
    dia INT NOT NULL,
    FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor),
    FOREIGN KEY (id_tipodoc) REFERENCES tipodoc(id_tipodoc)
);

CREATE TABLE producto_venta (
    id_producto INT,
    id_venta INT,
    PRIMARY KEY (id_producto, id_venta),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta)
);

CREATE TABLE tienda_empleado (
    id_tienda INT,
    id_empleado INT,
    PRIMARY KEY (id_tienda, id_empleado),
    FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE tienda_comuna (
    id_tienda INT,
    id_comuna INT,
    PRIMARY KEY (id_tienda, id_comuna),
    FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda),
    FOREIGN KEY (id_comuna) REFERENCES comuna(id_comuna)
);
