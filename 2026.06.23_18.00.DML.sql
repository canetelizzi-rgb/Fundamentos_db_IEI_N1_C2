USE restaurante_canete;

INSERT INTO cliente (nombre, rut, telefono, email) VALUES
    ('María González López',    '12345678-9', '+56912345678', 'maria.gonzalez@email.cl'),
    ('Carlos Pérez Ramírez',    '23456789-0', '+56923456789', 'carlos.perez@email.cl'),
    ('Ana Martínez Silva',      '34567890-1', '+56934567890', 'ana.martinez@email.cl'),
    ('Juan Rodríguez Fuentes',  '45678901-2', '+56945678901', 'juan.rodriguez@email.cl'),
    ('Luisa Fernández Torres',  '56789012-3', '+56956789012', 'luisa.fernandez@email.cl'),
    ('Roberto Soto Villalobos', '67890123-4', '+56967890123', 'roberto.soto@email.cl');


INSERT INTO mesa (cantidad_personas, piso) VALUES
    (2,  1),
    (4,  1),
    (6,  1),
    (8,  2),
    (4,  2),
    (10, 2);


INSERT INTO turno_trabajo (fecha, horario, semana, fin_de_semana) VALUES
    ('2025-06-23', '08:00-16:00', 1, 0),
    ('2025-06-23', '16:00-00:00', 1, 0),
    ('2025-06-24', '08:00-16:00', 1, 0),
    ('2025-06-28', '10:00-18:00', 0, 1),
    ('2025-06-29', '12:00-20:00', 0, 1),
    ('2025-06-30', '18:00-02:00', 0, 1);


INSERT INTO personal_atencion (rut, nombre, telefono, email, rol_de_personal, id_turno_trabajo) VALUES
    ('11111111-1', 'Pedro Alvarado Díaz',    '+56911111111', 'pedro.alvarado@rest.cl',   'cocinero',       1),
    ('22222222-2', 'Sofía Vega Morales',     '+56922222222', 'sofia.vega@rest.cl',        'garzon',         1),
    ('33333333-3', 'Diego Castillo Ríos',    '+56933333333', 'diego.castillo@rest.cl',    'recepcionista',  2),
    ('44444444-4', 'Valentina Rojas Pinto',  '+56944444444', 'valentina.rojas@rest.cl',   'garzon',         2),
    ('55555555-5', 'Miguel Herrera Lagos',   '+56955555555', 'miguel.herrera@rest.cl',    'cocinero',       3),
    ('66666666-6', 'Camila Núñez Araya',     '+56966666666', 'camila.nunez@rest.cl',      'recepcionista',  4);


INSERT INTO reservas (fecha, horario, estado, id_cliente, id_mesa) VALUES
    ('2025-06-25', '13:00', 'confirmada',  1, 1),
    ('2025-06-26', '20:00', 'pendiente',   2, 3),
    ('2025-06-27', '14:00', 'confirmada',  3, 2),
    ('2025-06-28', '19:00', 'cancelada',   4, 4),
    ('2025-06-29', '21:00', 'pendiente',   5, 5),
    ('2025-06-30', '12:30', 'confirmada',  6, 6);


INSERT INTO plato (nombre, id_mesa, categoria, precio) VALUES
    ('Cazuela de vacuno',         NULL, 'plato de fondo', 8500.00),
    ('Ceviche de reineta',        NULL, 'entrada',        6500.00),
    ('Tarta de manzana',          NULL, 'postre',         4000.00),
    ('Pollo asado con papas',     NULL, 'plato de fondo', 9200.00),
    ('Empanada de pino frita',    NULL, 'entrada',        3500.00),
    ('Mousse de maracuyá',        NULL, 'postre',         3800.00);


INSERT INTO ingredientes (tipo_ingrediente, precio) VALUES
    ('Carne de vacuno',    3200.00),
    ('Reineta fresca',     4500.00),
    ('Harina',              800.00),
    ('Manzana',             600.00),
    ('Pollo entero',       3800.00),
    ('Maracuyá',            900.00),
    ('Papa',                450.00),
    ('Cebolla',             200.00);


INSERT INTO proveedores (empresa, codigo_ingrediente) VALUES
    ('Carnes del Sur Ltda.',      1),
    ('Pesquera Pacífico S.A.',    2),
    ('Molino Central S.A.',       3),
    ('Frutícola Los Andes Ltda.', 4),
    ('Avícola San Miguel S.A.',   5),
    ('Frutícola Tropical Ltda.',  6);


INSERT INTO plato_ingrediente (nro_plato, codigo_ingrediente, cantidad) VALUES
    (1, 1, 0.250),   -- Cazuela → carne vacuno 250 g
    (1, 7, 0.300),   -- Cazuela → papa 300 g
    (1, 8, 0.100),   -- Cazuela → cebolla 100 g
    (2, 2, 0.200),   -- Ceviche → reineta 200 g
    (2, 8, 0.050),   -- Ceviche → cebolla 50 g
    (3, 3, 0.150),   -- Tarta → harina 150 g
    (3, 4, 0.200),   -- Tarta → manzana 200 g
    (4, 5, 0.350),   -- Pollo asado → pollo 350 g
    (4, 7, 0.200),   -- Pollo asado → papa 200 g
    (6, 6, 0.100);   -- Mousse → maracuyá 100 g


INSERT INTO delivery (calle, nro_casa, departamento, comuna, id_cliente) VALUES
    ('Av. Alemania',       '1234', NULL,    'Temuco',    1),
    ('Calle Caupolicán',   '567',  'Dep 3', 'Temuco',    2),
    ('Bulnes',             '890',  NULL,    'Padre Las Casas', 3),
    ('Arturo Prat',        '432',  'Dep 7', 'Temuco',    4),
    ('General Cruz',       '111',  NULL,    'Temuco',    5),
    ('San Martín',         '2020', 'Of 2',  'Lautaro',   6);


INSERT INTO pedido (fecha, monto, estado, id_delivery, id_cliente) VALUES
    ('2025-06-23 12:30:00', 15000.00, 'entregado',      1, 1),
    ('2025-06-23 13:15:00', 9200.00,  'listo',          2, 2),
    ('2025-06-23 14:00:00', 18500.00, 'en_preparacion', 3, 3),
    ('2025-06-23 19:45:00', 12000.00, 'recibido',       4, 4),
    ('2025-06-23 20:10:00', 8500.00,  'recibido',       NULL, 5),
    ('2025-06-23 21:00:00', 6500.00,  'recibido',       NULL, 6);


INSERT INTO detalle_pedido (id_pedido, nro_plato, cantidad_platos) VALUES
    (1, 1, 1),   -- Pedido 1 → Cazuela de vacuno x1
    (1, 2, 1),   -- Pedido 1 → Ceviche de reineta x1
    (1, 3, 1),   -- Pedido 1 → Tarta de manzana x1
    (2, 4, 1),   -- Pedido 2 → Pollo asado x1
    (3, 1, 2),   -- Pedido 3 → Cazuela de vacuno x2
    (3, 5, 1),   -- Pedido 3 → Empanada de pino x1
    (4, 4, 1),   -- Pedido 4 → Pollo asado x1
    (4, 6, 1),   -- Pedido 4 → Mousse de maracuyá x1
    (5, 1, 1),   -- Pedido 5 → Cazuela de vacuno x1
    (6, 2, 1);   -- Pedido 6 → Ceviche de reineta x1


INSERT INTO boleta (fecha, nombre_restaurant, monto, metodo_de_pago, pagado, id_pedido) VALUES
    ('2025-06-23 13:00:00', 'Restaurante Cañete', 15000.00, 'tarjeta_debito',   1, 1),
    ('2025-06-23 13:45:00', 'Restaurante Cañete',  9200.00, 'efectivo',         1, 2),
    ('2025-06-23 15:00:00', 'Restaurante Cañete', 18500.00, 'tarjeta_credito',  0, 3),
    ('2025-06-23 20:10:00', 'Restaurante Cañete', 12000.00, 'transferencia',    0, 4),
    ('2025-06-23 20:30:00', 'Restaurante Cañete',  8500.00, 'efectivo',         0, 5),
    ('2025-06-23 21:20:00', 'Restaurante Cañete',  6500.00, 'tarjeta_debito',   0, 6);


INSERT INTO promociones (fecha_comienzo, fecha_termino, porcentaje_descuento, cantidad_personas, activa) VALUES
    ('2025-06-01', '2025-06-30', 15.00, NULL, 1),
    ('2025-07-01', '2025-07-31', 20.00, 4,    1),
    ('2025-08-01', '2025-08-31', 10.00, NULL, 0),
    ('2025-12-20', '2025-12-31', 25.00, 6,    0),
    ('2025-09-01', '2025-09-18', 18.00, NULL, 0),
    ('2025-10-01', '2025-10-15', 12.00, 2,    0);
