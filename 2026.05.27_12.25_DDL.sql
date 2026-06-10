-- Comentario de 1 línea

/**
Comentario de múltiples líneas
**/

-- DDL es acrónimo de Data Definition Language

CREATE DATABASE IF NOT EXISTS ventas;
USE ventas;

-- EMPRESA, CLIENTE, PRODUCTO, VENTA, DIRECCION, STOCK

-- El comando SQL para crear una tabla es CREATE TABLE nombre_tabla()
CREATE TABLE IF NOT EXISTS direcciones(
    -- Dentro de la tabla definimos campos, tipos de datos y 
    -- restricciones (Obligatoriedad de datos, claves primarias y foráneas, datos únicos)
    id INTEGER NOT NULL,
    comuna VARCHAR(20) NOT NULL,
    calle VARCHAR(50) NULL,
    numero VARCHAR(10) NULL DEFAULT 's/n',
    departamento VARCHAR(10) NULL,

    CONSTRAINT pk_direccion PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS empresas(
    id INTEGER NOT NULL AUTO_INCREMENT,
    razon_social VARCHAR(100) NOT NULL,
    rut VARCHAR(12) NOT NULL UNIQUE,
    giro_comercial VARCHAR(255) NOT NULL,
    id_direccion INTEGER NULL,
    telefono_contacto VARCHAR(15) NULL,
    correo_contacto VARCHAR(255) NULL,

    CONSTRAINT pk_empresa PRIMARY KEY (id),
    CONSTRAINT fk_empresa_direccion FOREIGN KEY (id_direccion) REFERENCES direcciones(id)
);

CREATE TABLE IF NOT EXISTS tipos_cliente(
    id INTEGER NOT NULL AUTO_INCREMENT,
    tipo_cliente VARCHAR(20) NOT NULL,
    descripcion_tipo_cliente VARCHAR(255) NULL,

    CONSTRAINT pk_tipos_cliente PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS clientes(
    id INTEGER NOT NULL AUTO_INCREMENT,
    nombre_cliente VARCHAR(100) NOT NULL,
    rut_cliente VARCHAR(12) NOT NULL UNIQUE,
    id_direccion_cliente INTEGER NULL,
    telefono_cliente VARCHAR(15) NULL,
    correo_cliente VARCHAR(255) NULL,
    fecha_nacimiento DATE NOT NULL,
    id_tipo_cliente INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT pk_clientes PRIMARY KEY (id),
    CONSTRAINT fk_clientes_direcciones FOREIGN KEY (id_direccion_cliente) REFERENCES direcciones(id),
    CONSTRAINT fk_clientes_tipos_cliente FOREIGN KEY (id_tipo_cliente) REFERENCES tipos_cliente(id)
);

CREATE TABLE IF NOT EXISTS tipos_producto(
    id INTEGER NOT NULL AUTO_INCREMENT,
    tipo_producto VARCHAR(50) NOT NULL,
    descripcion_tipo_producto VARCHAR(255) NULL,

    CONSTRAINT pk_tipos_producto PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS productos(
    id INTEGER NOT NULL AUTO_INCREMENT,
    nombre_producto VARCHAR(255) NOT NULL,
    id_tipo_producto INTEGER NOT NULL;

    CONSTRAINT pk_productos PRIMARY KEY (id_producto),
    CONSTRAINT fk_productos_tipos_producto FOREIGN KEY (id_tipo_producto) REFERENCES tipos_producto(id_tipo_producto)
);