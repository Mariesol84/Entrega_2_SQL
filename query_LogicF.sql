CREATE DATABASE gestion_proveedores;
USE gestion_proveedores;

CREATE TABLE proveedores (
  ID_proveedor VARCHAR(10) PRIMARY KEY,
  Proveedor VARCHAR(100) NOT NULL,
  Contacto_comercial VARCHAR(100),
  Zona VARCHAR(50),
  Email VARCHAR(100),
  Telefono VARCHAR(20),
  Fecha_ultima_compra DATE
);

CREATE TABLE nuevos_saldos (
  ID VARCHAR(10) PRIMARY KEY,
  Saldo_pendiente DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (ID) REFERENCES proveedores(ID_proveedor)
);




CREATE TABLE compras (
  ID_compra INT AUTO_INCREMENT PRIMARY KEY,
  ID_proveedor VARCHAR(10),
  Fecha_compra DATE NOT NULL,
  Monto_total DECIMAL(10,2),
  FOREIGN KEY (ID_proveedor) REFERENCES proveedores(ID_proveedor)
);

CREATE TABLE productos (
  ID_producto INT AUTO_INCREMENT PRIMARY KEY,
  ID_compra INT,
  Nombre_producto VARCHAR(100),
  Cantidad INT,
  Precio_unitario DECIMAL(10,2),
  FOREIGN KEY (ID_compra) REFERENCES compras(ID_compra)
);

INSERT INTO proveedores (ID_proveedor, Proveedor, Contacto_comercial, Zona, Email, Telefono) VALUES
('P0001', 'Natural Ingredientes SRL', 'Lorenzo Cantón Galan', 'Villa de Mayo', 'fluffy@verizon.net', '(394) 406-8708'),
('P0002', 'Gourmet Quesos Group', 'Adelina Valls Canet', 'Nordelta', 'fraterk@me.com', '(923) 207-3871'),
('P0003', 'Delicias Suministros Express', 'Eulalia del Galindo', 'Villa Martelli', 'animats@mac.com', '(904) 363-2261'),
('P0004', 'Casero Carnes Logística', 'Tania Catalán Galván', 'Zelaya', 'tbeck@icloud.com', '(923) 671-4117'),
('P0005', 'Rico Conservas Distribuciones', 'Abraham Girón-Soler', 'Pilar', 'mallanmba@yahoo.ca', '(841) 798-8943'),
('P0006', 'Sabores Alimentos Market', 'Erasmo Gibert Quevedo', 'Villa Maipú', 'kosact@sbcglobal.net', '(559) 515-6369'),
('P0007', 'Dorado Pastas SA', 'Ana Belén Mayo Correa', 'Grand Bourg', 'bastian@aol.com', '(715) 328-4811'),
('P0008', 'Auténtico Lácteos Integral', 'Valentina Enríquez Montalbán', 'Benavídez', 'lukka@mac.com', '(953) 242-4312'),
('P0009', 'Estilo Bebidas de Cocina', 'Pastor Querol Verdugo', 'Florida Oeste', 'sjava@yahoo.com', '(429) 355-6554'),
('P0010', 'Crocante Especias SRL', 'Andrés Saavedra Castelló', 'José C. Paz', 'shawnce@me.com', '(399) 380-2112'),
('P0011', 'Gusto Alimentos Center', 'Juliana Márquez Huguet', 'Villa Rosa', 'moinefou@hotmail.com', '(242) 702-4300'),
('P0012', 'Delicias Carnes SA', 'África Fernandez Calatayud', 'El Talar', 'bebing@att.net', '(479) 987-5028'),
('P0013', 'Selecto Snacks Distribuidora', 'Carlito Domínguez Cortes', 'Matheu', 'afifi@yahoo.com', '(669) 494-0889'),
('P0014', 'Fresco Embutidos Del Chef', 'Heliodoro Baños Sainz', 'Villa Astolfi', 'zavadsky@gmail.com', '(495) 936-2371'),
('P0015', 'Suave Quesos Logística', 'Arturo Ferrán Terrón', 'Junín', 'neonatus@yahoo.ca', '(901) 585-8039'),
('P0016', 'Natural Vinos SRL', 'Serafina Marcela Solano Alfaro', 'Manzanares', 'nichoj@yahoo.com', '(243) 646-8371'),
('P0017', 'Gourmet Panificados Global', 'María Pilar Jódar Gómez', 'Los Polvorines', 'kwilliams@icloud.com', '(577) 722-8909'),
('P0018', 'Sabores Alimentos Express', 'Verónica Carmina Riba Criado', 'Rincón de Milberg', 'presoff@aol.com', '(965) 536-3236'),
('P0019', 'Casero Provisiones Gourmet', 'Bernardita Royo León', 'Boulogne Sur Mer', 'samavati@yahoo.com', '(970) 954-6303'),
('P0020', 'Tradición Pastas Distribuidora', 'Carlito Peñas Prado', 'Del Viso', 'philen@verizon.net', '(988) 713-8842'),
('P0021', 'Exquisito Alimentos Integral', 'Inmaculada Aurora Cantero Peralta', 'Villa Lynch', 'sacraver@aol.com', '(618) 384-8498'),
('P0022', 'Rico Verduras SRL', 'Sebastian Carnero Uriarte', 'General Arenales', 'seano@hotmail.com', '(727) 291-1259'),
('P0023', 'Sabor Delicatessen Market', 'Eusebia Peñalver Abellán', 'Campo de Mayo', 'fudrucker@aol.com', '(620) 870-4407'),
('P0024', 'Estilo Carnes de Cocina', 'Fermín Amor Piña', 'Belén de Escobar', 'burns@aol.com', '(588) 599-4372'),
('P0025', 'Delicias Bebidas Proveedores', 'Joaquín Duarte Lerma', 'Lincoln', 'jdhedden@live.com', '(225) 424-7303');

INSERT INTO nuevos_saldos (ID, Saldo_pendiente) VALUES
('P0003', 2412.00),
('P0007', 4733.00),
('P0010', 310.00),
('P0012', 71.14),
('P0015', 211.00),
('P0016', 3391.00),
('P0019', 7601.00),
('P0020', 607.00),
('P0021', 8231.00),
('P0023', 1635.00),
('P0024', 5861.00),
('P0025', 2021.00);

SELECT p.ID_proveedor, p.Proveedor, p.Contacto_comercial, p.Zona
FROM proveedores p
LEFT JOIN nuevos_saldos ns ON p.ID_proveedor = ns.ID
WHERE ns.Saldo_pendiente IS NULL;

UPDATE proveedores SET Telefono = '(999) 123-4567' WHERE ID_proveedor = 'P0002';
UPDATE proveedores SET Telefono = '(888) 234-5678' WHERE ID_proveedor = 'P0006';
UPDATE proveedores SET Telefono = '(777) 345-6789' WHERE ID_proveedor = 'P0011';
UPDATE proveedores SET Telefono = '(666) 456-7890' WHERE ID_proveedor = 'P0017';
UPDATE proveedores SET Telefono = '(555) 567-8901' WHERE ID_proveedor = 'P0022';

SELECT 
  p.ID_proveedor,
  p.Proveedor,
  p.Contacto_comercial,
  p.Zona,
  p.Email,
  p.Telefono,
  ns.Saldo_pendiente
FROM proveedores p
INNER JOIN nuevos_saldos ns ON p.ID_proveedor = ns.ID;

SELECT 
  p.ID_proveedor,
  p.Proveedor,
  p.Contacto_comercial,
  p.Zona,
  p.Email,
  p.Telefono,
  ns.Saldo_pendiente
FROM proveedores p
LEFT JOIN nuevos_saldos ns ON p.ID_proveedor = ns.ID;

SELECT 
  p.ID_proveedor,
  p.Proveedor,
  ns.Saldo_pendiente
FROM proveedores p
INNER JOIN nuevos_saldos ns ON p.ID_proveedor = ns.ID
UNION
SELECT 
  p.ID_proveedor,
  p.Proveedor,
  NULL AS Saldo_pendiente
FROM proveedores p
LEFT JOIN nuevos_saldos ns ON p.ID_proveedor = ns.ID
WHERE ns.Saldo_pendiente IS NULL;

SELECT 
  ID_proveedor,
  Proveedor,
  Contacto_comercial,
  Zona,
  Email,
  Telefono
FROM proveedores
WHERE Proveedor LIKE 'C%'


CREATE VIEW vista_proveedores_con_saldo AS
SELECT 
  p.ID_proveedor,
  p.Proveedor,
  p.Contacto_comercial,
  p.Zona,
  p.Email,
  p.Telefono,
  ns.Saldo_pendiente
FROM proveedores p
INNER JOIN nuevos_saldos ns ON p.ID_proveedor = ns.ID;

SELECT 
  ID_proveedor,
  Proveedor,
  Contacto_comercial,
  Zona,
  Email,
  Telefono
FROM proveedores
WHERE Proveedor LIKE 'C%';

CREATE VIEW vista_proveedores_con_saldo AS
SELECT 
  p.ID_proveedor,
  p.Proveedor,
  p.Contacto_comercial,
  p.Zona,
  p.Email,
  p.Telefono,
  ns.Saldo_pendiente
FROM proveedores p
INNER JOIN nuevos_saldos ns ON p.ID_proveedor = ns.ID;

SELECT * FROM vista_proveedores_con_saldo;

CREATE VIEW vista_estado_proveedores AS
SELECT 
  p.ID_proveedor,
  p.Proveedor,
  p.Contacto_comercial,
  p.Zona,
  p.Email,
  p.Telefono,
  ns.Saldo_pendiente,
  CASE 
    WHEN ns.Saldo_pendiente IS NULL THEN 'Sin saldo'
  END AS Estado_saldo
FROM proveedores p
LEFT JOIN nuevos_saldos ns ON p.ID_proveedor = ns.ID;

CREATE VIEW vista_proveedores_C AS
SELECT 
  p.ID_proveedor,
  p.Proveedor,
  p.Contacto_comercial,
  p.Zona,
  p.Email,
  p.Telefono,
  ns.Saldo_pendiente
FROM proveedores p
LEFT JOIN nuevos_saldos ns ON p.ID_proveedor = ns.ID
WHERE p.Proveedor LIKE 'C%';

CREATE VIEW vista_proveedores_sin_saldo AS
SELECT 
  p.ID_proveedor,
  p.Proveedor,
  p.Contacto_comercial,
  p.Zona,
  p.Email,
  p.Telefono
FROM proveedores p
LEFT JOIN nuevos_saldos ns ON p.ID_proveedor = ns.ID
WHERE ns.Saldo_pendiente IS NULL;

CREATE VIEW vista_resumen_compras AS
SELECT 
  p.ID_proveedor,
  p.Proveedor,
  COUNT(c.ID_compra) AS total_compras,
  COALESCE(SUM(c.Monto_total), 0) AS monto_total_acumulado
FROM proveedores p
LEFT JOIN compras c ON p.ID_proveedor = c.ID_proveedor
GROUP BY p.ID_proveedor, p.Proveedor;

DELIMITER $$

CREATE FUNCTION obtener_saldo_proveedor(p_id VARCHAR(10))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE v_saldo DECIMAL(10,2);

  SELECT COALESCE(Saldo_pendiente, 0)
  INTO v_saldo
  FROM nuevos_saldos
  WHERE ID = p_id;

  RETURN v_saldo;
END$$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION total_gastado_proveedor(p_id VARCHAR(10))
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
  DECLARE v_total DECIMAL(15,2);

  SELECT COALESCE(SUM(Monto_total), 0)
  INTO v_total
  FROM compras
  WHERE ID_proveedor = p_id;

  RETURN v_total;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE registrar_compra(
    IN p_id_proveedor VARCHAR(10),
    IN p_fecha DATE,
    IN p_monto DECIMAL(10,2)
)
BEGIN
    -- Inserta la compra en la tabla compras
    INSERT INTO compras (ID_proveedor, Fecha_compra, Monto_total)
    VALUES (p_id_proveedor, p_fecha, p_monto);

    -- Si el proveedor tiene saldo, se actualiza; si no, se crea un registro
    IF EXISTS (SELECT 1 FROM nuevos_saldos WHERE ID = p_id_proveedor) THEN
        UPDATE nuevos_saldos
        SET Saldo_pendiente = Saldo_pendiente + p_monto
        WHERE ID = p_id_proveedor;
    ELSE
        INSERT INTO nuevos_saldos (ID, Saldo_pendiente)
        VALUES (p_id_proveedor, p_monto);
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE pagar_saldo(
    IN p_id_proveedor VARCHAR(10),
    IN p_monto_pago DECIMAL(10,2)
)
BEGIN
    -- Verificar si el proveedor tiene saldo
    IF EXISTS (SELECT 1 FROM nuevos_saldos WHERE ID = p_id_proveedor) THEN
        UPDATE nuevos_saldos
        SET Saldo_pendiente = GREATEST(Saldo_pendiente - p_monto_pago, 0)
        WHERE ID = p_id_proveedor;
    END IF;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_actualizar_fecha_compra
AFTER INSERT ON compras
FOR EACH ROW
BEGIN
    -- Cuando se registra una nueva compra,
    -- actualiza la fecha_ultima_compra del proveedor
    UPDATE proveedores
    SET Fecha_ultima_compra = NEW.Fecha_compra
    WHERE ID_proveedor = NEW.ID_proveedor;
END$$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_evitar_saldo_negativo
BEFORE UPDATE ON nuevos_saldos
FOR EACH ROW
BEGIN
    -- Evitar que el saldo pendiente quede en negativo
    IF NEW.Saldo_pendiente < 0 THEN
        SET NEW.Saldo_pendiente = 0;
    END IF;
END$$

DELIMITER ;

