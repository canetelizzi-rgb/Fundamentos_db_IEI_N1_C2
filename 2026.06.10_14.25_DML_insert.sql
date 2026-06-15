INSERT INTO direcciones(comuna,calle,numero,departamento)
VALUES
('Temuco','Luis Durand','0123',NULL)
,('Padre Las Casas','Villa Alegre','0123','A-123')
,('Carahue','Aquiles Baeza','0123',NULL)
,('Lautaro','Los Confines','0123',NULL)
,('Pitrufquén','1 Norte','0123','345');

INSERT INTO usuarios(nombre_usuario,rut_usuario,id_direccion_usuario,telefono_usuario,correo_usuario,fecha_nacimiento,id_tipo_usuario)
VALUES
('Aquiles Baeza','12.345.678-5',1,NULL,'aquiles.baeza@test.test',STR_TO_DATE('25-01-2006', '%d-%m-%Y'),1),
('Wendy Sulca','20018434-3',1,NULL,'wendy.sulca@test.test',STR_TO_DATE('25-01-2006', '%d-%m-%Y'),2),
('Delfin Quispe','20398480-4',1,NULL,'delfin.quispe@test.test',STR_TO_DATE('25-01-2006', '%d-%m-%Y'),2),
('Armando Casas','17655582-3',1,NULL,'armando.casas@test.test',STR_TO_DATE('25-01-2006', '%d-%m-%Y'),3),
('Federico Coloma','21580679-0',1,NULL,'federico.coloma@test.test',STR_TO_DATE('25-01-2006', '%d-%m-%Y'),3);

INSERT INTO bodegas(codigo_bodega,id_direccion_bodega,capacidad,encargado_bodega)
VALUES
('BOD-TEM',1,5000,1),
('BOD-PLC',2,5000,2),
('BOD-CAR',3,5000,3),
('BOD-LAU',4,5000,4),
('BOD-PIT',5,5000,5);

INSERT INTO inventarios(id_producto,id_bodega,cantidad_producto,fecha_caducidad,ubicacion)
VALUES
(1,1,100,STR_TO_DATE('01-01-2027', '%d-%m-%Y'),'Pasillo Central - A52'),
(1,2,100,STR_TO_DATE('01-01-2027', '%d-%m-%Y'),'B52'),
(2,1,100,STR_TO_DATE('01-01-2027', '%d-%m-%Y'),'C52'),
(2,2,100,STR_TO_DATE('01-01-2027', '%d-%m-%Y'),'Pasillo Principal - A52'),
(3,3,100,STR_TO_DATE('01-01-2027', '%d-%m-%Y'),'Pasillo 2 - A52'),
(3,4,100,STR_TO_DATE('01-01-2027', '%d-%m-%Y'),'Pasillo 3 - A52'),
(4,2,100,STR_TO_DATE('01-01-2027', '%d-%m-%Y'),'Pasillo 1 - A52'),
(4,4,100,STR_TO_DATE('01-01-2027', '%d-%m-%Y'),'Pasillo 2 - A52'),
(5,1,100,STR_TO_DATE('01-01-2027', '%d-%m-%Y'),'Pasillo 3 - A52'),
(5,2,100,STR_TO_DATE('01-01-2027', '%d-%m-%Y'),'Pasillo Lautaro - A52'),
(6,3,100,STR_TO_DATE('01-01-2027', '%d-%m-%Y'),'Pasillo Caupolican - A52'),
(6,4,100,STR_TO_DATE('01-01-2027', '%d-%m-%Y'),'Pasillo Chol-Chol - A52'),
(7,5,100,STR_TO_DATE('01-01-2027', '%d-%m-%Y'),'Central - A52'),
(7,3,100,STR_TO_DATE('01-01-2027', '%d-%m-%Y'),'Central - A52'),
(8,1,100,STR_TO_DATE('01-01-2027', '%d-%m-%Y'),'Central - A52');

INSERT INTO productos(sku_produto,nombre_producto,id_tipo_producto,descripcion,precio)
VALUES
('123456789','Celular MotoG5',(SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Electrónicos'),'Celular de gama media',250000)
('112233445','Laptop Asus Vivobook',(SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Electrónicos'),'Laptop de 15.6 pulgadas para estudio y oficina',650000),
('223344556','Audífonos Sony WH-1000XM4',(SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Audio'),'Audífonos inalámbricos con cancelación de ruido',299990),
('334455667','Cafetera Espresso Oster',(SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Electrodomésticos'),'Cafetera de bomba con espumador de leche',120000),
('445566778','Zapatillas Nike Air Max',(SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Calzado'),'Zapatillas deportivas urbanas de alta comodidad',95000),
('556677889','Monitor Gamer LG 27"',(SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Electrónicos'),'Monitor Full HD de 144Hz y 1ms de respuesta',185000),
('667788990','Silla Ergonómica de Oficina',(SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Muebles'),'Silla con soporte lumbar regulable y apoyabrazos',140000),
('778899001','Smartwatch Samsung Galaxy',(SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Accesorios'),'Reloj inteligente con monitor de salud y GPS',210000),
('889900112','Bicicleta de Montaña Trek',(SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Deportes'),'Bicicleta aro 29 con frenos de disco hidráulicos',480000),
('990011223','Teclado Mecánico Logitech',(SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Computación'),'Teclado RGB con switches táctiles silenciosos',75000),
('001122334','Proyector Portátil Anker',(SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Electrónicos'),'Miniproyector Android TV con batería integrada',320000);

