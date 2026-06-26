CREATE DATABASE IF NOT EXISTS restaurante_canete
USE restaurante_canete;


CREATE TABLE IF NOT EXISTS cliente (
    id_cliente   INT            NOT NULL AUTO_INCREMENT,
    nombre       VARCHAR(100)   NOT NULL,
    rut          VARCHAR(12)    NOT NULL,
    telefono     VARCHAR(15)    NULL,
    email        VARCHAR(100)   NULL,
    CONSTRAINT pk_cliente        PRIMARY KEY (id_cliente),
    CONSTRAINT uq_cliente_rut    UNIQUE (rut),
    CONSTRAINT uq_cliente_email  UNIQUE (email),
    CONSTRAINT ck_cliente_rut    CHECK (rut REGEXP '^[0-9]{7,8}-[0-9Kk]$')
);


CREATE TABLE IF NOT EXISTS mesa (
    id_mesa            INT   NOT NULL AUTO_INCREMENT,
    cantidad_personas  INT   NOT NULL,
    piso               INT   NOT NULL,
    CONSTRAINT pk_mesa               PRIMARY KEY (id_mesa),
    CONSTRAINT ck_mesa_capacidad     CHECK (cantidad_personas > 0),
    CONSTRAINT ck_mesa_piso          CHECK (piso >= 1)
);


CREATE TABLE IF NOT EXISTS turno_trabajo (
    id_turno_trabajo  INT          NOT NULL AUTO_INCREMENT,
    fecha             DATE         NOT NULL,
    horario           VARCHAR(50)  NOT NULL,
    semana            TINYINT(1)   NOT NULL DEFAULT 0,
    fin_de_semana     TINYINT(1)   NOT NULL DEFAULT 0,
    CONSTRAINT pk_turno_trabajo  PRIMARY KEY (id_turno_trabajo),
    CONSTRAINT ck_turno_semana   CHECK (semana IN (0, 1)),
    CONSTRAINT ck_turno_fds      CHECK (fin_de_semana IN (0, 1))
);


CREATE TABLE IF NOT EXISTS personal_atencion (
    id_personal_atencion  INT           NOT NULL AUTO_INCREMENT,
    rut                   VARCHAR(12)   NOT NULL,
    nombre                VARCHAR(100)  NOT NULL,
    telefono              VARCHAR(15)   NULL,
    email                 VARCHAR(100)  NULL,
    rol_de_personal       ENUM('cocinero','garzon','recepcionista') NOT NULL,
    id_turno_trabajo      INT           NOT NULL,
    CONSTRAINT pk_personal            PRIMARY KEY (id_personal_atencion),
    CONSTRAINT uq_personal_rut        UNIQUE (rut),
    CONSTRAINT fk_personal_turno      FOREIGN KEY (id_turno_trabajo)
                                        REFERENCES turno_trabajo(id_turno_trabajo)
                                        ON UPDATE CASCADE
                                        ON DELETE RESTRICT,
    CONSTRAINT ck_personal_rut        CHECK (rut REGEXP '^[0-9]{7,8}-[0-9Kk]$')
);


CREATE TABLE IF NOT EXISTS reservas (
    id_reserva  INT          NOT NULL AUTO_INCREMENT,
    fecha       DATE         NOT NULL,
    horario     VARCHAR(50)  NOT NULL,
    estado      ENUM('pendiente','confirmada','cancelada','completada')
                             NOT NULL DEFAULT 'pendiente',
    id_cliente  INT          NOT NULL,
    id_mesa     INT          NOT NULL,
    CONSTRAINT pk_reservas       PRIMARY KEY (id_reserva),
    CONSTRAINT fk_reservas_cli   FOREIGN KEY (id_cliente)
                                   REFERENCES cliente(id_cliente)
                                   ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_reservas_mesa  FOREIGN KEY (id_mesa)
                                   REFERENCES mesa(id_mesa)
                                   ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE IF NOT EXISTS plato (
    nro_plato  INT            NOT NULL AUTO_INCREMENT,
    nombre     VARCHAR(100)   NOT NULL,
    id_mesa    INT            NULL,
    categoria  ENUM('plato de fondo','entrada','postre') NOT NULL,
    precio     DECIMAL(10,2)  NOT NULL,
    CONSTRAINT pk_plato           PRIMARY KEY (nro_plato),
    CONSTRAINT ck_plato_precio    CHECK (precio >= 0),
    CONSTRAINT fk_plato_mesa      FOREIGN KEY (id_mesa)
                                    REFERENCES mesa(id_mesa)
                                    ON UPDATE CASCADE ON DELETE SET NULL
);


CREATE TABLE IF NOT EXISTS ingredientes (
    codigo_ingrediente  INT            NOT NULL AUTO_INCREMENT,
    tipo_ingrediente    VARCHAR(100)   NOT NULL,
    precio              DECIMAL(10,2)  NOT NULL,
    CONSTRAINT pk_ingredientes        PRIMARY KEY (codigo_ingrediente),
    CONSTRAINT ck_ingrediente_precio  CHECK (precio >= 0)
);


CREATE TABLE IF NOT EXISTS proveedores (
    id_proveedor        INT           NOT NULL AUTO_INCREMENT,
    empresa             VARCHAR(150)  NOT NULL,
    codigo_ingrediente  INT           NOT NULL,
    CONSTRAINT pk_proveedores     PRIMARY KEY (id_proveedor),
    CONSTRAINT fk_prov_ingrediente FOREIGN KEY (codigo_ingrediente)
                                     REFERENCES ingredientes(codigo_ingrediente)
                                     ON UPDATE CASCADE ON DELETE RESTRICT
);


CREATE TABLE IF NOT EXISTS plato_ingrediente (
    nro_plato           INT  NOT NULL,
    codigo_ingrediente  INT  NOT NULL,
    cantidad            DECIMAL(10,3) NOT NULL DEFAULT 1,
    CONSTRAINT pk_plato_ingrediente  PRIMARY KEY (nro_plato, codigo_ingrediente),
    CONSTRAINT fk_pi_plato           FOREIGN KEY (nro_plato)
                                       REFERENCES plato(nro_plato)
                                       ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_pi_ingrediente     FOREIGN KEY (codigo_ingrediente)
                                       REFERENCES ingredientes(codigo_ingrediente)
                                       ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ck_pi_cantidad        CHECK (cantidad > 0)
);


CREATE TABLE IF NOT EXISTS delivery (
    id_delivery   INT           NOT NULL AUTO_INCREMENT,
    calle         VARCHAR(150)  NOT NULL,
    nro_casa      VARCHAR(20)   NOT NULL,
    departamento  VARCHAR(50)   NULL,
    comuna        VARCHAR(100)  NOT NULL,
    id_cliente    INT           NOT NULL,
    CONSTRAINT pk_delivery      PRIMARY KEY (id_delivery),
    CONSTRAINT fk_delivery_cli  FOREIGN KEY (id_cliente)
                                  REFERENCES cliente(id_cliente)
                                  ON UPDATE CASCADE ON DELETE RESTRICT
);



CREATE TABLE IF NOT EXISTS pedido (
    id_pedido    INT            NOT NULL AUTO_INCREMENT,
    fecha        DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    monto        DECIMAL(10,2)  NOT NULL DEFAULT 0,
    estado       ENUM('recibido','en_preparacion','listo','entregado','cancelado')
                               NOT NULL DEFAULT 'recibido',
    id_delivery  INT            NULL,
    id_cliente   INT            NOT NULL,
    CONSTRAINT pk_pedido        PRIMARY KEY (id_pedido),
    CONSTRAINT fk_pedido_del    FOREIGN KEY (id_delivery)
                                  REFERENCES delivery(id_delivery)
                                  ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT fk_pedido_cli    FOREIGN KEY (id_cliente)
                                  REFERENCES cliente(id_cliente)
                                  ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ck_pedido_monto  CHECK (monto >= 0)
);


CREATE TABLE IF NOT EXISTS detalle_pedido (
    id_detalle_pedido  INT  NOT NULL AUTO_INCREMENT,
    id_pedido          INT  NOT NULL,
    nro_plato          INT  NOT NULL,
    cantidad_platos    INT  NOT NULL DEFAULT 1
    CONSTRAINT pk_detalle_pedido   PRIMARY KEY (id_detalle_pedido),
    CONSTRAINT fk_dp_pedido        FOREIGN KEY (id_pedido)
                                     REFERENCES pedido(id_pedido)
                                     ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_dp_plato         FOREIGN KEY (nro_plato)
                                     REFERENCES plato(nro_plato)
                                     ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ck_dp_cantidad      CHECK (cantidad_platos > 0)
);

CREATE TABLE IF NOT EXISTS boleta (
    id_boleta          INT            NOT NULL AUTO_INCREMENT,
    fecha              DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nombre_restaurant  VARCHAR(150)   NOT NULL DEFAULT 'Restaurante Cañete',
    monto              DECIMAL(10,2)  NOT NULL,
    metodo_de_pago     ENUM('efectivo','tarjeta_debito','tarjeta_credito','transferencia')
                                      NOT NULL,
    pagado             TINYINT(1)     NOT NULL DEFAULT 0,
    id_pedido          INT            NOT NULL,
    CONSTRAINT pk_boleta          PRIMARY KEY (id_boleta),
    CONSTRAINT fk_boleta_pedido   FOREIGN KEY (id_pedido)
                                    REFERENCES pedido(id_pedido)
                                    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ck_boleta_monto    CHECK (monto >= 0),
    CONSTRAINT ck_boleta_pagado   CHECK (pagado IN (0, 1))
);


CREATE TABLE IF NOT EXISTS promociones (
    id_promocion          INT            NOT NULL AUTO_INCREMENT,
    fecha_comienzo        DATE           NOT NULL,
    fecha_termino         DATE           NOT NULL,
    porcentaje_descuento  DECIMAL(5,2)   NOT NULL,
    cantidad_personas     INT            NULL,
    activa                TINYINT(1)     NOT NULL DEFAULT 1,
    CONSTRAINT pk_promociones         PRIMARY KEY (id_promocion),
    CONSTRAINT ck_promo_descuento     CHECK (porcentaje_descuento BETWEEN 0 AND 100),
    CONSTRAINT ck_promo_fechas        CHECK (fecha_termino >= fecha_comienzo),
    CONSTRAINT ck_promo_activa        CHECK (activa IN (0, 1))
);


