CREATE TABLE IF NOT EXISTS tipos_usuario(
    id_tipo_usuario INTEGER NOT NULL AUTO_INCREMENT,
    tipo_usuario VARCHAR(20) NOT NULL,
    descripcion_tipo_usuario VARCHAR(255) NULL,

    CONSTRAINT pk_tipos_usuario PRIMARY KEY (id_tipo_usuario)
);

CREATE TABLE IF NOT EXISTS usuarios(
    id_usuario INTEGER NOT NULL AUTO_INCREMENT,
    nombre_usuario VARCHAR(100) NOT NULL,
    rut_usuario VARCHAR(12) NOT NULL UNIQUE,
    id_direccion_usuario INTEGER NULL,
    telefono_usuario VARCHAR(15) NULL,
    correo_usuario VARCHAR(255) NULL,
    fecha_nacimiento DATE NOT NULL,
    id_tipo_usuario INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT pk_usuarios PRIMARY KEY (id_usuario),
    CONSTRAINT fk_usuarios_direcciones FOREIGN KEY (id_direccion_usuario) REFERENCES direcciones(id_direccion),
    CONSTRAINT fk_usuarios_tipos_usuario FOREIGN KEY (id_tipo_usuario) REFERENCES tipos_usuario(id_tipo_usuario)
);

CREATE TABLE IF NOT EXISTS bodegas(
    id_bodega INTEGER NOT NULL AUTO_INCREMENT,
    codigo_bodega VARCHAR(25) NOT NULL,
    id_direccion_bodega INTEGER NOT NULL,
    capacidad INTEGER NOT NULL,
    encargado_bodega INTEGER NOT NULL,

    CONSTRAINT pk_bodegas PRIMARY KEY (id_bodega),
    CONSTRAINT fk_bodegas_direcciones FOREIGN KEY (id_direccion_bodega) REFERENCES direcciones(id_direccion),
    CONSTRAINT fk_bodegas_usuarios FOREIGN KEY (encargado_bodega) REFERENCES usuarios(id_usuario)
);

CREATE TABLE IF NOT EXISTS inventarios(
    id_inventario INTEGER NOT NULL AUTO_INCREMENT,
    id_producto INTEGER NOT NULL,
    id_bodega INTEGER NOT NULL,
    cantidad_producto INTEGER,
    fecha_caducidad DATE NOT NULL,
    ubicacion VARCHAR(50) NOT NULL,

    CONSTRAINT pk_inventarios PRIMARY KEY (id_inventario),
    CONSTRAINT fk_inventarios_productos FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    CONSTRAINT fk_inventarios_bodegas FOREIGN KEY (id_bodega) REFERENCES bodegas(id_bodega)
);