## CREACION DE BASE DE DATOS
create database conexion;

## USAR BASE DE DATOS
use conexion;

## CREAR TABLAs
create table usuario(
	id_usuario int primary key auto_increment,
	usuario varchar(100),
    clave varchar(100),
    fecha_registro timestamp
);

create table cliente(
	id_cliente int primary key auto_increment,
    nombre varchar(100),
    apellido varchar(100),
    telefono varchar(15),
    correo varchar(100),
    direccion varchar(100),
    fecha_nacimiento date,
    fecha_creacion timestamp
);

create table productos(
	id_producto int primary key auto_increment,
    nombre_producto varchar(200),
    valor_unitario decimal(10,2),
    descripcion varchar(300),
    cantidad int,
    fecha_caducidad date,
    fecha_creacion timestamp    
);

create table factura(
	id_factura int primary key auto_increment,
    numero_facturacion int unique not null,
	id_cliente int,
    total decimal(10,2),
    descuento decimal(10,2),
    fecha_creacion timestamp,
    estado tinyint(1),
    
    constraint fk_facturas_id_cliente foreign key (id_cliente) references cliente (id_cliente)
);

create table detalle_factura(
	id_factura int not null,
    id_producto int,
    cantidad int,
    valor decimal(10,2),
       
    constraint fk_factura_id_factura foreign key (id_factura) references factura (id_factura),
    constraint fk_factura_id_producto foreign key(id_producto) references productos (id_producto)    
);

## POBLADO TABLA USUARIO
INSERT INTO usuario (usuario, clave, fecha_registro) VALUES
('yasuri01', 'clave123', CURRENT_TIMESTAMP),
('carlos22', 'pass456', CURRENT_TIMESTAMP),
('andres15', 'admin789', CURRENT_TIMESTAMP),
('maria08', 'maria123', CURRENT_TIMESTAMP),
('laura25', 'laura456', CURRENT_TIMESTAMP),
('pedro10', 'pedro789', CURRENT_TIMESTAMP),
('sofia30', 'sofia123', CURRENT_TIMESTAMP),
('javier18', 'javier456', CURRENT_TIMESTAMP),
('daniel05', 'daniel789', CURRENT_TIMESTAMP),
('camila12', 'camila123', CURRENT_TIMESTAMP);

## POBLADO TABLA CLIENTE 
INSERT INTO cliente (nombre, apellido, telefono, correo, direccion, fecha_nacimiento, fecha_creacion) VALUES
('Carlos', 'Gomez', '3001234567', 'carlos@gmail.com', 'Calle 10 # 15-20', '1995-04-12', CURRENT_TIMESTAMP),
('Maria', 'Rodriguez', '3102345678', 'maria@gmail.com', 'Carrera 5 # 20-30', '1998-08-25', CURRENT_TIMESTAMP),
('Andres', 'Martinez', '3203456789', 'andres@gmail.com', 'Calle 15 # 10-40', '1992-02-18', CURRENT_TIMESTAMP),
('Laura', 'Hernandez', '3014567890', 'laura@gmail.com', 'Carrera 8 # 12-15', '2000-06-10', CURRENT_TIMESTAMP),
('Pedro', 'Ramirez', '3155678901', 'pedro@gmail.com', 'Calle 20 # 8-25', '1990-11-30', CURRENT_TIMESTAMP),
('Sofia', 'Torres', '3126789012', 'sofia@gmail.com', 'Carrera 12 # 18-22', '1997-03-05', CURRENT_TIMESTAMP),
('Javier', 'Castro', '3007890123', 'javier@gmail.com', 'Calle 25 # 14-10', '1994-09-15', CURRENT_TIMESTAMP),
('Daniel', 'Moreno', '3148901234', 'daniel@gmail.com', 'Carrera 3 # 16-35', '1999-12-20', CURRENT_TIMESTAMP),
('Camila', 'Ortiz', '3169012345', 'camila@gmail.com', 'Calle 30 # 22-18', '2001-07-08', CURRENT_TIMESTAMP),
('Valentina', 'Perez', '3180123456', 'valentina@gmail.com', 'Carrera 10 # 25-12', '1996-01-22', CURRENT_TIMESTAMP);

## POBLADO TABLA PRODUCTO
INSERT INTO productos (nombre_producto, valor_unitario, descripcion, cantidad, fecha_caducidad, fecha_creacion) VALUES
('Arroz Diana 500g', 2500.00, 'Arroz blanco tradicional de 500 gramos', 50, '2027-05-15', CURRENT_TIMESTAMP),
('Aceite Premier 1L', 8500.00, 'Aceite vegetal de un litro', 30, '2027-08-20', CURRENT_TIMESTAMP),
('Azucar Manuelita 1kg', 4200.00, 'Azucar blanca refinada de un kilogramo', 40, '2027-06-10', CURRENT_TIMESTAMP),
('Leche Colanta 1L', 3800.00, 'Leche entera pasteurizada de un litro', 25, '2026-12-15', CURRENT_TIMESTAMP),
('Cafe Sello Rojo 250g', 9500.00, 'Cafe molido tradicional de 250 gramos', 20, '2027-04-18', CURRENT_TIMESTAMP),
('Pasta Doria 500g', 3200.00, 'Pasta tipo espagueti de 500 gramos', 45, '2027-09-12', CURRENT_TIMESTAMP),
('Sal Refisal 500g', 1800.00, 'Sal refinada de mesa de 500 gramos', 35, '2028-01-20', CURRENT_TIMESTAMP),
('Galletas Festival', 2500.00, 'Paquete de galletas surtidas', 60, '2027-03-25', CURRENT_TIMESTAMP),
('Chocolate Corona 250g', 7800.00, 'Chocolate de mesa tradicional', 28, '2027-07-30', CURRENT_TIMESTAMP),
('Avena Quaker 500g', 6500.00, 'Avena en hojuelas de 500 gramos', 32, '2027-10-15', CURRENT_TIMESTAMP);

## POBLADO TABLA FACTURA
INSERT INTO factura (numero_facturacion, id_cliente, total, descuento, fecha_creacion, estado) VALUES
(1001, 1, 150000.00, 5000.00, CURRENT_TIMESTAMP, 1),
(1002, 2, 250000.00, 10000.00, CURRENT_TIMESTAMP, 1),
(1003, 3, 85000.00, 0.00, CURRENT_TIMESTAMP, 1),
(1004, 4, 320000.00, 20000.00, CURRENT_TIMESTAMP, 1),
(1005, 5, 175000.00, 5000.00, CURRENT_TIMESTAMP, 0),
(1006, 6, 95000.00, 0.00, CURRENT_TIMESTAMP, 1),
(1007, 7, 450000.00, 25000.00, CURRENT_TIMESTAMP, 1),
(1008, 8, 125000.00, 10000.00, CURRENT_TIMESTAMP, 0),
(1009, 9, 280000.00, 15000.00, CURRENT_TIMESTAMP, 1),
(1010, 10, 195000.00, 5000.00, CURRENT_TIMESTAMP, 1);

## POBLADO TABLA DETALLE
INSERT INTO detalle_factura (id_factura, id_producto, cantidad, valor) VALUES

-- Factura 1 - Cliente 1
(1, 1, 2, 2500.00),
(1, 2, 1, 8500.00),
(1, 3, 3, 4200.00),
(1, 4, 2, 3800.00),
(1, 5, 1, 9500.00),
(1, 6, 4, 3200.00),
(1, 7, 2, 1800.00),
(1, 8, 3, 2500.00),
(1, 9, 1, 7800.00),
(1, 10, 2, 6500.00),

-- Factura 2 - Cliente 2
(2, 1, 3, 2500.00),
(2, 2, 2, 8500.00),
(2, 3, 1, 4200.00),
(2, 4, 4, 3800.00),
(2, 5, 2, 9500.00),
(2, 6, 3, 3200.00),
(2, 7, 5, 1800.00),
(2, 8, 2, 2500.00),
(2, 9, 2, 7800.00),
(2, 10, 1, 6500.00),

-- Factura 3 - Cliente 3
(3, 1, 1, 2500.00),
(3, 2, 3, 8500.00),
(3, 3, 2, 4200.00),
(3, 4, 1, 3800.00),
(3, 5, 4, 9500.00),
(3, 6, 2, 3200.00),
(3, 7, 3, 1800.00),
(3, 8, 4, 2500.00),
(3, 9, 2, 7800.00),
(3, 10, 3, 6500.00),

-- Factura 4 - Cliente 4
(4, 1, 4, 2500.00),
(4, 2, 2, 8500.00),
(4, 3, 5, 4200.00),
(4, 4, 3, 3800.00),
(4, 5, 2, 9500.00),
(4, 6, 1, 3200.00),
(4, 7, 4, 1800.00),
(4, 8, 3, 2500.00),
(4, 9, 1, 7800.00),
(4, 10, 2, 6500.00),

-- Factura 5 - Cliente 5
(5, 1, 2, 2500.00),
(5, 2, 4, 8500.00),
(5, 3, 3, 4200.00),
(5, 4, 2, 3800.00),
(5, 5, 1, 9500.00),
(5, 6, 5, 3200.00),
(5, 7, 2, 1800.00),
(5, 8, 1, 2500.00),
(5, 9, 3, 7800.00),
(5, 10, 4, 6500.00),

-- Factura 6 - Cliente 6
(6, 1, 5, 2500.00),
(6, 2, 1, 8500.00),
(6, 3, 2, 4200.00),
(6, 4, 3, 3800.00),
(6, 5, 2, 9500.00),
(6, 6, 4, 3200.00),
(6, 7, 1, 1800.00),
(6, 8, 5, 2500.00),
(6, 9, 2, 7800.00),
(6, 10, 3, 6500.00),

-- Factura 7 - Cliente 7
(7, 1, 3, 2500.00),
(7, 2, 5, 8500.00),
(7, 3, 2, 4200.00),
(7, 4, 4, 3800.00),
(7, 5, 3, 9500.00),
(7, 6, 2, 3200.00),
(7, 7, 4, 1800.00),
(7, 8, 1, 2500.00),
(7, 9, 5, 7800.00),
(7, 10, 2, 6500.00),

-- Factura 8 - Cliente 8
(8, 1, 2, 2500.00),
(8, 2, 3, 8500.00),
(8, 3, 4, 4200.00),
(8, 4, 1, 3800.00),
(8, 5, 2, 9500.00),
(8, 6, 5, 3200.00),
(8, 7, 3, 1800.00),
(8, 8, 2, 2500.00),
(8, 9, 4, 7800.00),
(8, 10, 1, 6500.00),

-- Factura 9 - Cliente 9
(9, 1, 4, 2500.00),
(9, 2, 2, 8500.00),
(9, 3, 3, 4200.00),
(9, 4, 5, 3800.00),
(9, 5, 1, 9500.00),
(9, 6, 3, 3200.00),
(9, 7, 2, 1800.00),
(9, 8, 4, 2500.00),
(9, 9, 3, 7800.00),
(9, 10, 2, 6500.00),

-- Factura 10 - Cliente 10
(10, 1, 3, 2500.00),
(10, 2, 4, 8500.00),
(10, 3, 2, 4200.00),
(10, 4, 3, 3800.00),
(10, 5, 5, 9500.00),
(10, 6, 2, 3200.00),
(10, 7, 1, 1800.00),
(10, 8, 5, 2500.00),
(10, 9, 2, 7800.00),
(10, 10, 3, 6500.00);