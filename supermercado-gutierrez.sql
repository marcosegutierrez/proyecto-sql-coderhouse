CREATE DATABASE IF NOT EXISTS supermercadoGutierrez;

USE supermercadogutierrez;

CREATE TABLE Clientes (
	id_cliente INT AUTO_INCREMENT primary key,
    nombre varchar(20),
    apellido varchar(20),
    dni int
);

CREATE TABLE Sucursales (
	id_sucursal int auto_increment primary key,
    nombre varchar(20),
    direccion varchar(50),
    localidad varchar(20),
    provincia varchar(20)
);

CREATE TABLE Productos (
	id_producto int auto_increment primary key,
    nombre varchar(20),
    stock int
);

CREATE TABLE Proveedores (
	id_proveedor int auto_increment primary key,
    nombre varchar(20),
    nombre_resp varchar(20),
    apellido_resp varchar(20),
    telefono int,
    email varchar(50)
);

CREATE TABLE Vendedores (
	id_vendedor INT auto_increment,
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    id_sucursal INT,
    PRIMARY KEY (id_vendedor),
    FOREIGN KEY(id_sucursal) references sucursales(id_sucursal)
);

CREATE TABLE Compras (
	id_compra int auto_increment primary key,
    id_cliente int,
    id_vendedor int,
    foreign key(id_cliente) references clientes(id_cliente),
    foreign key(id_vendedor) references vendedores(id_vendedor)    
);

CREATE TABLE Facturas (
	id_factura INT auto_increment,
    precio_total INT,
    fecha datetime,
    id_compra int,
    tipo_factura char(1),
    PRIMARY KEY (id_factura),
    FOREIGN KEY (id_compra) references compras(id_compra)
);

CREATE TABLE Remitos (
	id_remito int auto_increment primary key,
    id_proveedor int,
    fecha date,
    foreign key(id_proveedor) references proveedores(id_proveedor)
);

CREATE TABLE ProductosxCompras (
	id_productoxcompra INT auto_increment primary key,
    id_producto int,
    id_compra int,
    cantidad int,
    precio int,
    foreign key(id_producto) references productos(id_producto),
    foreign key(id_compra) references compras(id_compra)  
);

CREATE TABLE ProductosxRemitos (
	id_productoxremito INT auto_increment primary key,
    id_producto int,
    id_remito int,
    cantidad int,
    precio int,
    foreign key(id_producto) references productos(id_producto),
    foreign key(id_remito) references remitos(id_remito)  
);

-- SELECT Tablas 1 a 10
SELECT * FROM VENDEDORES;
SELECT * FROM COMPRAS;
SELECT * FROM FACTURAS;
SELECT * FROM CLIENTES;
SELECT * FROM SUCURSALES;
SELECT * FROM PRODUCTOS;
SELECT * FROM PROVEEDORES;
SELECT * FROM REMITOS;
SELECT * FROM ProductosxCompras;
SELECT * FROM ProductosxRemitos;

-- DROP DATABASE supermercadogutierrez;

