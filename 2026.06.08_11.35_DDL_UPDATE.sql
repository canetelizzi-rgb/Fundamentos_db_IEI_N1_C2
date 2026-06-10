ALTER TABLE clientes DROP CONSTRAINT fk_clientes_direcciones;
ALTER TABLE clientes ADD CONSTRAINT fk_clientes_direcciones FOREIGN KEY (id_direccion_cliente) REFERENCES direcciones(id_direccion);

ALTER TABLE empresas DROP CONSTRAINT fk_empresa_direccion;
ALTER TABLE empresas ADD CONSTRAINT fk_empresa_direccion FOREIGN KEY (id_direccion) REFERENCES direcciones(id_direccion);