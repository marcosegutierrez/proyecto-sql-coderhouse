drop database supermercadogutierrez;

CREATE DATABASE IF NOT EXISTS supermercadoGutierrez;

USE supermercadogutierrez;

/*************************** 
	CREACION DE TABLAS
 ***************************/

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
    nombre varchar(50),
    stock int
);

CREATE TABLE Proveedores (
	id_proveedor int auto_increment primary key,
    nombre varchar(50),
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
    precio_total FLOAT,
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
    precio float,
    foreign key(id_producto) references productos(id_producto),
    foreign key(id_remito) references remitos(id_remito)  
);

/*************************** 
	INSERCION DE DATOS
 ***************************/

INSERT INTO Clientes VALUES 
    (null, "Abraham", "Simpson", 5002459),
    (null, "Mona", "Simpson", 52545469),
    (null, "Jacqueline", "Bouvier", 51034205),
    (null, "Clancy", "Bouvier", 51567890),
    (null, "Herb", "Powell", 52012345),
    (null, "Homero", "Simpson", 32056789),
    (null, "Marge", "Bouvier", 32102345),
    (null, "Patty", "Bouvier", 32254321),
    (null, "Selma", "Bouvier", 32287654),
    (null, "Barney", "Gumble", 32345678),
    (null, "Moe", "Szyslak", 32398765),
    (null, "Lenny", "Leonard", 32456895),
    (null, "Carl", "Carlson", 32490876),
    (null, "Ned", "Flanders", 32534567),
    (null, "Maude", "Flanders", 32576543),
    (null, "Rod", "Flanders", 55012345),
    (null, "Todd", "Flanders", 55054321),
    (null, "Bart", "Simpson", 56056789),
    (null, "Milhouse", "Van Houten", 56123456),
    (null, "Martin", "Prince", 56165432),
    (null, "Nelson", "Muntz", 56234567),
    (null, "Lisa", "Simpson", 56345678),
    (null, "Ralph", "Wiggum", 56412345),
    (null, "Sherri", "Mackleberry", 56456789),
    (null, "Terri", "Mackleberry", 56467890),
    (null, "Janey", "Powell", 56500123),
    (null, "Kearney", "Zzyzwicz", 56554321),
    (null, "Dolph", "Starbeam", 56623456),
    (null, "Jimbo", "Jones", 56676543),
    (null, "Maggie", "Simpson", 70012345),
    (null, "Apu", "Nahasapeemapetilon", 32598765),
    (null, "Manjula", "Nahasapeemapetilon", 32654321),
    (null, "Sanjay", "Nahasapeemapetilon", 32654322),
    (null, "Fat Tony", "D'Amico", 32712345),
    (null, "Krusty", "The Clown", 32812345),
    (null, "Sideshow Bob", "Terwilliger", 32912345),
    (null, "Chief Wiggum", "Clancy", 33012345),
    (null, "Sarah", "Wiggum", 33054321),
    (null, "Seymour", "Skinner", 33112345),
    (null, "Edna", "Krabappel", 33154321),
    (null, "Kent", "Brockman", 33212345),
    (null, "Comic Book Guy", "Jeff Albertson", 33312345),
    (null, "Waylon", "Smithers", 33412345),
    (null, "Julius", "Hibbert", 33512345),
    (null, "Elizabeth", "Hoover", 33612345),
    (null, "Gil", "Gunderson", 33712345),
    (null, "Lionel", "Hutz", 33812345),
    (null, "Troy", "McClure", 33912345),
    (null, "Luann", "Van Houten", 34012345);
    
INSERT INTO Sucursales VALUES 
	(null, "Sucursal Norte", "Cuenca 525", "Villa del Parque", "Capital Federal"),
    (null, "Sucursal Sur", "Corrientes 1234", "San Telmo", "Capital Federal"),
    (null, "Sucursal Oeste", "Cabildo 2000", "Belgrano", "Buenos Aires"),
    (null, "Sucursal Este", "Pueyrredón 345", "Recoleta", "Buenos Aires"),
    (null, "Sucursal Central", "Rivadavia 150", "Once", "Buenos Aires"),
    (null, "Sucursal Litoral", "Urquiza 987", "Rosario", "Santa Fe"),
    (null, "Sucursal Norte", "San Martín 300", "Paraná", "Entre Rios"),
    (null, "Sucursal Córdoba", "Laprida 450", "Nueva Córdoba", "Córdoba"),
    (null, "Sucursal Oeste", "9 de Julio 100", "Santa Rosa", "La Pampa"),
    (null, "Sucursal Vinoteca", "Sarmiento 600", "Mendoza Capital", "Mendoza");
    
INSERT INTO Productos (nombre, stock) VALUES
    ("Papa", 25),
    ("Carne", 150),
    ("Gaseosa Cola", 100),
    ("Leche", 75),
    ("Pan", 50),
    ("Arroz", 40),
    ("Fideos", 60),
    ("Aceite", 30),
    ("Azúcar", 45),
    ("Sal", 20),
    ("Harina", 55),
    ("Tomate", 35),
    ("Cebolla", 25),
    ("Banana", 70),
    ("Manzana", 65),
    ("Naranja", 80),
    ("Peras", 45),
    ("Uvas", 55),
    ("Pera", 50),
    ("Sandía", 35),
    ("Melón", 40),
    ("Durazno", 60),
    ("Maní", 25),
    ("Almendras", 30),
    ("Nueces", 35),
    ("Ciruelas", 40),
    ("Pasas de uva", 20),
    ("Chocolate", 70),
    ("Yogur", 60),
    ("Queso", 50),
    ("Manteca", 45),
    ("Helado", 30),
    ("Galletas", 40),
    ("Cerveza", 85),
    ("Vino", 90),
    ("Whisky", 85),
    ("Vodka", 70),
    ("Ron", 10),
    ("Tequila", 95),
    ("Café", 60),
    ("Té", 70),
    ("Azúcar rubia", 25),
    ("Levadura", 35),
    ("Limón", 45),
    ("Cerveza sin alcohol", 80),
    ("Jugo de naranja", 60),
    ("Jugo de manzana", 70),
    ("Agua mineral", 50),
    ("Papel higiénico", 99),
    ("Detergente", 90),
    ("Suavizante de ropa", 80),
    ("Limpiador multiuso", 70),
    ("Desodorante", 60),
    ("Shampoo", 55),
    ("Chicles", 40),
    ("Yerba", 35),
    ("Cereal de maíz", 60),
    ("Cereal de trigo", 55),
    ("Galletas saladas", 45),
    ("Mermelada", 30),
    ("Miel", 25),
    ("Jabón de tocador", 40),
    ("Jabón líquido", 35),
    ("Desinfectante", 25),
    ("Escoba", 40),
    ("Fósforos", 45),
    ("Encendedor", 30),
    ("Pilas", 25),
    ("Lámpara", 40),
    ("Papel de aluminio", 35),
    ("Film transparente", 25),
    ("Esponja", 40),
    ("Pan rallado", 45),
    ("Maicena", 30),
    ("Café instantáneo", 40),
    ("Té verde", 35),
    ("Té negro", 25),
    ("Té de hierbas", 40),
    ("Fideos de arroz", 45),
    ("Yogur con frutas", 30),
    ("Helado de vainilla", 40),
    ("Galletas de chocolate", 35),
    ("Cerveza artesanal", 25),
    ("Vino tinto", 40),
    ("Whisky escocés", 45),
    ("Vodka ruso", 30),
    ("Ron añejo", 25),
    ("Tequila blanco", 40),
    ("Café colombiano", 35),
    ("Té chai", 25),
    ("Azúcar mascabado", 40),
    ("Levadura seca", 45),
    ("Limón exprimido", 30),
    ("Cerveza de trigo", 25),
    ("Jugo de limón", 40),
    ("Jugo de durazno", 35),
    ("Agua con gas", 25),
    ("Papel higiénico doble hoja", 40),
    ("Detergente concentrado", 45),
    ("Suavizante de ropa con aroma a lavanda", 30),
    ("Limpiador de baño", 25),
    ("Desodorante roll-on", 40),
    ("Shampoo anticaspa", 35),
    ("Chicles de menta", 25),
    ("Yerba saborizada", 40),
    ("Cereal de avena", 45),
    ("Galletas integrales", 30),
    ("Mermelada de frutilla", 25),
    ("Miel de abeja pura", 40),
    ("Jabón en barra de glicerina", 35),
    ("Jabón líquido antibacterial", 25);

INSERT INTO Proveedores (nombre, nombre_resp, apellido_resp, telefono, email) VALUES
    ("Bebidas S.A.", "Juan", "Martinez", 1122334455, "info@bebidas.com"),
    ("Verdulería Verde", "María", "Gómez", 1122334466, "info@verduleriaverde.com"),
    ("Carnicería San José", "Pedro", "López", 1122334477, "info@carniceriasanjose.com"),
    ("Supermercado Del Campo", "Laura", "Fernández", 1122334488, "info@supermercadodelcampo.com"),
    ("Distribuidora Dulce", "Diego", "Rodriguez", 1122334499, "info@distribuidoradulce.com");

INSERT INTO Vendedores (nombre, apellido, id_sucursal) VALUES
    -- Sucursal Norte
    ("Luis", "Martínez", 1),
    ("Ana", "García", 1),
    ("Carlos", "López", 1),
    ("María", "Rodríguez", 1),
    -- Sucursal Sur
    ("Juan", "Hernández", 2),
    ("Laura", "Díaz", 2),
    ("Pedro", "Martínez", 2),
    ("Silvia", "Pérez", 2),
    -- Sucursal Oeste
    ("Martín", "Gómez", 3),
    ("Lucía", "Fernández", 3),
    ("Diego", "Sánchez", 3),
    ("Valentina", "Gutiérrez", 3),
    -- Sucursal Este
    ("Julián", "Moreno", 4),
    ("Natalia", "Vega", 4),
    ("Santiago", "Rojas", 4),
    ("Valeria", "Molina", 4),
    -- Sucursal Central
    ("Lucas", "Suárez", 5),
    ("Marina", "Luna", 5),
    ("Gabriel", "Castro", 5),
    ("Celeste", "Ortega", 5),
    -- Sucursal Litoral
    ("Maximiliano", "Peralta", 6),
    ("Camila", "Flores", 6),
    ("Emilio", "Benítez", 6),
    ("Florencia", "Acosta", 6),
    -- Sucursal Norte Entre Ríos
    ("Agustín", "Ríos", 7),
    ("Jazmín", "López", 7),
    ("Bruno", "Sosa", 7),
    ("Antonella", "Silva", 7),
    -- Sucursal Córdoba
    ("Tomás", "González", 8),
    ("Victoria", "Paz", 8),
    ("Gonzalo", "Álvarez", 8),
    ("Catalina", "García", 8),
    -- Sucursal Oeste La Pampa
    ("Matías", "Ruiz", 9),
    ("Luciana", "Gómez", 9),
    ("Francisco", "Mendoza", 9),
    ("Bianca", "Díaz", 9),
    -- Sucursal Mendoza
    ("Facundo", "Torres", 10),
    ("Marcela", "Herrera", 10),
    ("Ramiro", "Cabrera", 10),
    ("Agustina", "López", 10);

INSERT INTO Compras (id_cliente, id_vendedor) VALUES
    (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
    (6, 6), (7, 7), (8, 8), (13, 13), (14, 14),
    (16, 16), (17, 17), (18, 18), (19, 19), (20, 20),
    (21, 21), (22, 22), (24, 24), (25, 25), (26, 26),
    (27, 27), (28, 28), (29, 29), (31, 31), (32, 32),
    (33, 33), (34, 34), (35, 35), (36, 36), (37, 37),
    (38, 38), (39, 39), (40, 40), (41, 1), (42, 2),
    (43, 3), (44, 4), (45, 5), (46, 6), (47, 7),
    (48, 8), (49, 13);

INSERT INTO Facturas (id_factura, precio_total, fecha, id_compra, tipo_factura) VALUES
    (null, 100.50, '2024-01-01 12:00:00', 1, 'A'),
    (null, 200.25, '2024-01-02 13:30:00', 2, 'B'),
    (null, 150.75, '2024-01-03 10:45:00', 3, 'C'),
    (null, 300.00, '2024-01-04 09:15:00', 4, 'A'),
    (null, 75.80, '2024-01-05 14:20:00', 5, 'B'),
    (null, 250.30, '2024-01-06 11:00:00', 6, 'C'),
    (null, 180.45, '2024-01-07 08:45:00', 7, 'A'),
    (null, 220.10, '2024-01-08 15:10:00', 8, 'B'),
    (null, 350.20, '2024-01-09 10:30:00', 9, 'C'),
    (null, 120.75, '2024-01-10 12:45:00', 10, 'A'),
    (null, 280.60, '2024-01-11 14:00:00', 11, 'B'),
    (null, 180.90, '2024-01-12 11:20:00', 12, 'C'),
    (null, 400.00, '2024-01-13 09:30:00', 13, 'A'),
    (null, 90.25, '2024-01-14 13:15:00', 14, 'B'),
    (null, 150.50, '2024-01-15 10:00:00', 15, 'C'),
    (null, 200.75, '2024-01-16 08:00:00', 16, 'A'),
    (null, 280.30, '2024-01-17 12:20:00', 17, 'B'),
    (null, 160.45, '2024-01-18 11:30:00', 18, 'C'),
    (null, 300.00, '2024-01-19 09:45:00', 19, 'A'),
    (null, 150.20, '2024-01-20 14:40:00', 20, 'B'),
    (null, 220.90, '2024-01-21 10:15:00', 21, 'C'),
    (null, 180.60, '2024-01-22 08:30:00', 22, 'A'),
    (null, 350.45, '2024-01-23 13:00:00', 23, 'B'),
    (null, 90.75, '2024-01-24 11:45:00', 24, 'C'),
    (null, 120.30, '2024-01-25 09:10:00', 25, 'A'),
    (null, 250.00, '2024-01-26 14:50:00', 26, 'B'),
    (null, 180.20, '2024-01-27 10:25:00', 27, 'C'),
    (null, 300.50, '2024-01-28 08:40:00', 28, 'A'),
    (null, 200.60, '2024-01-29 12:05:00', 29, 'B'),
    (null, 280.90, '2024-01-30 11:15:00', 30, 'C'),
    (null, 150.75, '2024-01-31 09:20:00', 31, 'A'),
    (null, 350.30, '2024-02-01 14:30:00', 32, 'B'),
    (null, 180.45, '2024-02-02 10:55:00', 33, 'C'),
    (null, 220.00, '2024-02-03 08:50:00', 34, 'A'),
    (null, 120.20, '2024-02-04 13:20:00', 35, 'B'),
    (null, 280.75, '2024-02-05 11:35:00', 36, 'C'),
    (null, 180.30, '2024-02-06 09:50:00', 37, 'A'),
    (null, 300.60, '2024-02-07 12:00:00', 38, 'B'),
    (null, 200.90, '2024-02-08 10:10:00', 39, 'C'),
    (null, 250.75, '2024-02-09 08:25:00', 40, 'A'),
    (null, 280.00, '2024-02-10 14:40:00', 41, 'B'),
    (null, 160.20, '2024-02-11 11:05:00', 42, 'C');
    
INSERT INTO Remitos (id_proveedor, fecha) VALUES
    (1, '2024-01-01'),
    (2, '2024-01-02'),
    (3, '2024-01-03'),
    (4, '2024-01-04'),
    (5, '2024-01-05'),
    (1, '2024-01-06'),
    (2, '2024-01-07'),
    (3, '2024-01-08'),
    (4, '2024-01-09'),
    (5, '2024-01-10'),
    (1, '2024-01-11'),
    (2, '2024-01-12'),
    (3, '2024-01-13'),
    (4, '2024-01-14'),
    (5, '2024-01-15'),
    (1, '2024-02-01'),
    (2, '2024-02-02'),
    (3, '2024-02-03'),
    (4, '2024-02-04'),
    (5, '2024-02-05'),
    (1, '2024-02-06'),
    (2, '2024-02-07');
    
INSERT INTO ProductosxCompras (id_producto, id_compra, cantidad, precio) VALUES
(1, 1, 2, 60.50),
(2, 1, 1, 40),

(3, 2, 3, 90),
(4, 2, 1, 110.25),

(5, 3, 1, 80.20),
(6, 3, 3, 70.55),

(7, 4, 2, 150),
(8, 4, 1, 150),

(9, 5, 3, 70.50),
(10, 5, 1, 5.30),

(11, 6, 2, 120),
(12, 6, 1, 130.30),

(13, 7, 3, 90),
(14, 7, 2, 90.45),

(15, 8, 2, 90),
(16, 8, 1, 130.10),

(17, 9, 1, 180.45),
(18, 9, 2, 169.75),

(19, 10, 2, 60),
(20, 10, 1, 60.75),

(21, 11, 1, 200),
(22, 11, 2, 80.60),

(23, 12, 2, 100),
(24, 12, 1, 80.90),

(25, 13, 3, 100.50),
(26, 13, 1, 299.50),

(27, 14, 1, 45.25),
(28, 14, 2, 45),

(29, 15, 2, 90.10),
(30, 15, 1, 60.40),

(31, 16, 3, 100.75),
(32, 16, 1, 100),

(33, 17, 1, 180.30),
(34, 17, 2, 100),

(35, 18, 2, 160),
(36, 18, 1, 0.45),

(37, 19, 3, 150),
(38, 19, 1, 150.75),

(39, 20, 2, 70),
(40, 20, 1, 80.20),

(41, 21, 1, 120),
(42, 21, 2, 100.90),

(43, 22, 2, 70),
(44, 22, 1, 110.60),

(45, 23, 3, 150),
(46, 23, 1, 200.45),

(47, 24, 1, 80),
(48, 24, 2, 10.75),


(49, 25, 3, 100),
(50, 25, 1, 20.30),

(51, 26, 2, 120),
(52, 26, 1, 130),

(53, 27, 1, 100),
(54, 27, 2, 80.20),

(55, 28, 2, 120.20),
(56, 28, 1, 180.30),

(57, 29, 1, 200.60),
(58, 29, 2, 80),

(59, 30, 2, 100),
(60, 30, 1, 180.90),

(61, 31, 3, 100),
(62, 31, 1, 50.75),

(63, 32, 2, 70),
(64, 32, 1, 280.30),

(65, 33, 1, 100),
(66, 33, 2, 80.45),

(67, 34, 2, 150),
(68, 34, 1, 70),

(69, 35, 3, 20),
(70, 35, 1, 100.20),

(71, 36, 1, 200),
(72, 36, 2, 80.75),

(73, 37, 3, 80),
(74, 37, 1, 100.30),

(75, 38, 1, 200),
(76, 38, 2, 100.60),

(77, 39, 2, 100),
(78, 39, 1, 100.90),

(79, 40, 1, 150),
(80, 40, 2, 100.75),

(81, 41, 1, 150),
(82, 41, 2, 130),

(83, 42, 1, 80),
(84, 42, 2, 80.20);

INSERT INTO ProductosxRemitos (id_producto, id_remito, cantidad, precio) VALUES
-- BEBIDAS
(3, 1, 10, 20),
(2, 1, 10, 20),
(34, 1, 10, 20),
(35, 1, 10, 20),
(36, 1, 10, 20),
(37, 1, 10, 20),
(38, 1, 10, 20),
(39, 1, 10, 20),
(40, 6, 10, 20),
(41, 6, 10, 20),
(45, 6, 10, 20),
(46, 6, 10, 20),
(47, 6, 10, 20),
(48, 6, 10, 20),
(76, 11, 10, 20),
(77, 11, 10, 20),
(78, 11, 10, 20),
(83, 11, 10, 20),
(84, 11, 10, 20),
(85, 11, 10, 20),
(86, 11, 10, 20),
(87, 16, 10, 20),
(88, 16, 10, 20),
(89, 16, 10, 20),
(90, 21, 10, 20),
(93, 21, 10, 20),
(94, 21, 10, 20),
(95, 21, 10, 20),
(96, 21, 10, 20),
(97, 21, 10, 20),

-- VERDULERIA
(1, 2, 10, 20),
(12, 2, 10, 20),
(13, 2, 10, 20),
(14, 7, 10, 20),
(15, 7, 10, 20),
(16, 12, 10, 20),
(17, 12, 10, 20),
(18, 12, 10, 20),
(19, 12, 10, 20),
(20, 17, 10, 20),
(21, 17, 10, 20),
(22, 22, 10, 20),
(26, 22, 10, 20),
(44, 22, 10, 20),

-- CARNICERIA
(1, 3, 10, 20),
(1, 8, 10, 20),
(1, 13, 10, 20),
(1, 18, 10, 20),

-- SUPER DEL CAMPO
(4, 4, 10, 20),
(5, 4, 10, 20),
(6, 4, 10, 20),
(7, 4, 10, 20),
(8, 4, 10, 20),
(9, 4, 10, 20),
(10, 4, 10, 20),
(11, 4, 10, 20),
(23, 9, 10, 20),
(24, 9, 10, 20),
(25, 9, 10, 20),
(27, 9, 10, 20),
(29, 9, 10, 20),
(30, 9, 10, 20),
(31, 9, 10, 20),
(43, 9, 10, 20),
(49, 14, 10, 20),
(50, 14, 10, 20),
(51, 14, 10, 20),
(52, 14, 10, 20),
(53, 14, 10, 20),
(54, 14, 10, 20),
(56, 14, 10, 20),
(57, 14, 10, 20),
(58, 14, 10, 20),
(59, 14, 10, 20),
(62, 19, 10, 20),
(63, 19, 10, 20),
(64, 19, 10, 20),
(65, 19, 10, 20),
(66, 19, 10, 20),
(67, 19, 10, 20),
(68, 19, 10, 20),
(69, 19, 10, 20),
(70, 19, 10, 20),
(71, 19, 10, 20),
(72, 19, 10, 20),
(73, 19, 10, 20),
(74, 19, 10, 20),
(75, 19, 10, 20),
(79, 19, 10, 20),
(91, 19, 10, 20),
(92, 19, 10, 20),
(98, 19, 10, 20),
(99, 19, 10, 20),
(100, 19, 10, 20),
(101, 19, 10, 20),
(102, 19, 10, 20),
(103, 19, 10, 20),
(105, 19, 10, 20),
(106, 19, 10, 20),
(107, 19, 10, 20),
(110, 19, 10, 20),
(111, 19, 10, 20),

-- DULCE
(28, 5, 10, 20),
(32, 5, 10, 20),
(33, 5, 10, 20),
(42, 5, 10, 20),
(55, 10, 10, 20),
(60, 10, 10, 20),
(61, 15, 10, 20),
(80, 15, 10, 20),
(81, 15, 10, 20),
(82, 15, 10, 20),
(104, 20, 10, 20),
(108, 20, 10, 20),
(109, 20, 10, 20);

/*************************** 
	VISTAS
 ***************************/

-- Queremos saber los clientes mayores para hacerles un descuento
CREATE OR REPLACE VIEW clientes_mayores AS
	(SELECT id_cliente, nombre, apellido
	FROM clientes
	WHERE dni < 40000000);

SELECT * FROM clientes_mayores;

-- Conocer los 5 mejores vendedores
CREATE OR REPLACE VIEW mejores_vendedores AS
	(SELECT v.id_vendedor, v.nombre, v.apellido, COUNT(c.id_compra) as ventas, ROUND(SUM(f.precio_total)) as monto
	FROM vendedores v
	INNER JOIN compras c ON (v.id_vendedor = c.id_vendedor)
	INNER JOIN facturas f ON (f.id_compra = c.id_compra)
	GROUP BY (c.id_vendedor) ORDER BY monto DESC LIMIT 5);

SELECT * FROM mejores_vendedores;

/*************************** 
	FUNCIONES
 ***************************/

-- Funcion para uso en PROCEDURE

DELIMITER $$
CREATE FUNCTION `Ventas_sucursal_x` (sucursal INT) RETURNS VARCHAR(20) READS SQL DATA
	BEGIN
        RETURN
            (SELECT CONCAT("$",ROUND(SUM(f.precio_total)))
            FROM sucursales s
            INNER JOIN vendedores v ON (v.id_sucursal = s.id_sucursal)
			INNER JOIN compras c ON (v.id_vendedor = c.id_vendedor)
			INNER JOIN facturas f ON (f.id_compra = c.id_compra)
			WHERE v.id_sucursal = sucursal
            GROUP BY (v.id_sucursal));
	END $$
DELIMITER ;

SELECT Ventas_sucursal_x(1) AS "Ventas de sucursal";

/*************************** 
	PROCEDIMIENTOS ALMACENADOS
 ***************************/

DELIMITER //
	CREATE PROCEDURE `monto_de_sucursal` (IN sucursal INT)
	BEGIN
		DECLARE nombre_sucursal VARCHAR(100);
		SET nombre_sucursal = CONCAT("Ventas de ",(SELECT nombre FROM sucursales WHERE id_sucursal = sucursal));
        SET @consulta = CONCAT('SELECT Ventas_sucursal_x(', sucursal, ") AS ", "'", nombre_sucursal,"'");
		PREPARE runSQL FROM @consulta;
        EXECUTE runSQL;
        DEALLOCATE PREPARE runSQL;
	END //
DELIMITER ;

CALL monto_de_sucursal(5); -- Probar 1 a 10