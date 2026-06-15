INSERT INTO tipos_usuario(tipo_usuario,descripcion_tipo_usuario) 
VALUES
('Admin','Control Completo de la Aplicación'),
('Encargado de Área','Control Completo Área Asignada'),
('Lector','Acceso Restingido a Lectura de Datos');

INSERT INTO productos(sku_produto,nombre_producto,id_tipo_producto,descripcion,precio)
VALUES
('123456789','Celular MotoG5',(SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Electrónicos'),'Celular de gama media',250000);

INSERT INTO productos
(sku_produto, nombre_producto, id_tipo_producto, descripcion, precio)
VALUES
(
    'SKU000000001',
    'Arroz Grado 1 1Kg',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Abarrotes'),
    'Arroz blanco grano largo',
    1590
),
(
    'SKU000000002',
    'Azúcar Blanca 1Kg',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Abarrotes'),
    'Azúcar refinada',
    1290
),
(
    'SKU000000003',
    'Fideos Espagueti 500g',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Abarrotes'),
    'Pasta de trigo',
    890
),
(
    'SKU000000004',
    'Jamón Acaramelado 250g',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Cecinas'),
    'Jamón laminado',
    3490
),
(
    'SKU000000005',
    'Salchichas Vienesas 500g',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Cecinas'),
    'Paquete familiar',
    2990
),
(
    'SKU000000006',
    'Chorizo Parrillero 400g',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Cecinas'),
    'Chorizo artesanal',
    4590
),
(
    'SKU000000007',
    'Leche Entera 1L',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Lacteos'),
    'Leche larga vida',
    1190
),
(
    'SKU000000008',
    'Yogurt Frutilla 125g',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Lacteos'),
    'Yogurt individual',
    490
),
(
    'SKU000000009',
    'Queso Gauda 500g',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Lacteos'),
    'Queso laminado',
    5490
),
(
    'SKU000000010',
    'Alimento Perro Adulto 3Kg',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Mascotas'),
    'Croquetas premium',
    12990
),
(
    'SKU000000011',
    'Alimento Gato Adulto 2Kg',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Mascotas'),
    'Sabor salmón',
    10990
),
(
    'SKU000000012',
    'Pelota de Fútbol Infantil',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Juguetes'),
    'Tamaño Nº3',
    5990
),
(
    'SKU000000013',
    'Muñeca Clásica',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Juguetes'),
    'Incluye accesorios',
    8990
),
(
    'SKU000000014',
    'Set Bloques Construcción',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Juguetes'),
    '100 piezas',
    14990
),
(
    'SKU000000015',
    'Audífonos Bluetooth',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Electrónicos'),
    'Con micrófono integrado',
    24990
),
(
    'SKU000000016',
    'Mouse Inalámbrico',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Electrónicos'),
    'Con receptor USB',
    9990
),
(
    'SKU000000017',
    'Pendrive 64GB',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Electrónicos'),
    'USB 3.0',
    7990
),
(
    'SKU000000018',
    'Microondas 20L',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Línea Blanca'),
    '700W de potencia',
    79990
),
(
    'SKU000000019',
    'Hervidor Eléctrico 1.7L',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Línea Blanca'),
    'Acero inoxidable',
    24990
),
(
    'SKU000000020',
    'Juego de Sábanas 2 Plazas',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Hogar'),
    '180 hilos',
    19990
),
(
    'SKU000000021',
    'Almohada Viscoelástica',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Hogar'),
    'Alta densidad',
    14990
),
(
    'SKU000000022',
    'Manzana Roja Kg',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Frutas y Verduras'),
    'Fruta fresca',
    1990
),
(
    'SKU000000023',
    'Plátano Kg',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Frutas y Verduras'),
    'Origen Ecuador',
    1690
),
(
    'SKU000000024',
    'Lechuga Escarola',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Frutas y Verduras'),
    'Unidad',
    990
),
(
    'SKU000000025',
    'Posta Negra Kg',
    (SELECT id_tipo_producto FROM tipos_producto WHERE tipo_producto = 'Carnes'),
    'Carne vacuno premium',
    10990
);