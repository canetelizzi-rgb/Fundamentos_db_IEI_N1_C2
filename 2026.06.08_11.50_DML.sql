INSERT INTO tipos_usuario(tipo_usuario,descripcion_tipo_usuario) 
VALUES
('Admin','Control Completo de la Aplicación'),
('Encargado de Área','Control Completo Área Asignada'),
('Lector','Acceso Restingido a Lectura de Datos');

INSERT INTO productos(sku_produto,nombre_producto,id_tipo_producto,descripcion,precio)
VALUES
('123456789','Celular MotoG5',(SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Electrónicos'),'Celular de gama media',250000)