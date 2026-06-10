-- Data Managing Language

/*
Usamos este lenguaje para insertar y modificar los datos
*/

-- INSERT INTO es usado para insertar datos en una tabla específica
-- Junto con el nombre de la tabla, será bueno agregar los nombres de las columnas en las que se insertarán datos
-- VALUES son los datos que se insertarán en las columnas indicadas
-- Debemos insertar la misma cantidad de datos que la cantidad de columnas especificada.

INSERT INTO tipos_cliente(tipo_cliente,descripcion_tipo_cliente) 
VALUES
('Normal','Cliente regular de la tienda'),
('Premium','Cliente con compras superiores a $100.000 mensual'),
('VIP','Cliente con compras superiores a $500.000 mensual');

INSERT INTO tipos_producto(tipo_producto,descripcion_tipo_producto)
VALUE
('Abarrotes',NULL),
('Cecinas',NULL),
('Lacteos',NULL),
('Mascotas',NULL),
('Juquetes',NULL),
('Electrónicos',NULL),
('Línea Blanca',NULL),
('Hogar',NULL),
('Frutas y Verduras',NULL),
('Carnes',NULL);