-- Crear base de datos (ejecutar en postgres)
DROP DATABASE IF EXISTS tienda_comercial;
CREATE DATABASE tienda_comercial;

-- Conectarse a la base
\c tienda_comercial;

-- ===========================
-- CREACIÓN DE TABLAS
-- ===========================

CREATE TABLE producto (
    id_producto INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio INT DEFAULT 0
);


CREATE TABLE comuna (
    id_comuna INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE tipodoc (
    id_tipodoc INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE empleado (
    id_empleado INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_comuna INT,
    cargo VARCHAR(50) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_comuna) REFERENCES comuna(id_comuna)
);

CREATE TABLE sueldo (
    id_sueldo INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_empleado INT,
    valor INT DEFAULT 0,
    mes VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE vendedor (
	id_vendedor INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

CREATE TABLE tienda (
    id_tienda INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_comuna INT,
    nombre VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_comuna) REFERENCES comuna(id_comuna)
);

CREATE TABLE venta (
    id_venta INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_tienda INT,
    id_tipodoc INT,
    anio INT,
    mes VARCHAR(100),
    FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda),
    FOREIGN KEY (id_tipodoc) REFERENCES tipodoc(id_tipodoc)
);

CREATE TABLE producto_venta (
    id_producto INT,
    id_venta INT,
    id_vendedor INT,
    PRIMARY KEY (id_producto, id_venta, id_vendedor),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto),
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor)
);
CREATE TABLE tienda_empleado (
    id_tienda INT,
    id_empleado INT,
    PRIMARY KEY (id_tienda, id_empleado),
    FOREIGN KEY (id_tienda) REFERENCES tienda(id_tienda),
    FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado)
);

