ALTER TABLE empresas DROP FOREIGN KEY fk_empresa_direccion;
ALTER TABLE clientes DROP FOREIGN KEY fk_clientes_direcciones;
ALTER TABLE clientes DROP FOREIGN KEY fk_clientes_tipos_cliente;

ALTER TABLE `direcciones` CHANGE `id` `id_direccion` INT(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `empresas` CHANGE `id` `id_empresa` INT(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `tipos_cliente` CHANGE `id` `id_tipo_cliente` INT(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `tipos_producto` CHANGE `id` `id_tipo_producto` INT(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `clientes` CHANGE `id` `id_cliente` INT(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE productos DROP COLUMN fecha_caducidad;