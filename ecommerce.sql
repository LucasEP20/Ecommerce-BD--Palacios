DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;
SET SQL_SAFE_UPDATES = 0; /*Desativado para la ejecucion completa del codigo*/
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100)
);
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    categoria_id INT,
    proveedor_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
);
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    direccion TEXT
);
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha TIMESTAMP ,
    total DECIMAL(10, 2),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);
CREATE TABLE detalle_pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    precio_unitario Decimal(10,2),
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

/*INSERTAR DATOS EN CLIENTES*/
INSERT INTO clientes (nombre, apellido, email, direccion) VALUES 
('Corenda', 'Torricina', 'ctorricina0@ovh.net', 'Suite 77'),
('Raphaela', 'O''Duggan', 'roduggan1@cam.ac.uk', 'Suite 22'),
('Hedda', 'Jamson', 'hjamson2@google.de', 'PO Box 89327'),
('Eartha', 'Metcalfe', 'emetcalfe3@tinyurl.com', 'Room 827'),
('Paola', 'Laffling', 'plaffling4@ezinearticles.com', 'Room 1472'),
('Ruthanne', 'Cobbald', 'rcobbald5@miibeian.gov.cn', 'PO Box 10002'),
('Estell', 'Albiston', 'ealbiston6@nytimes.com', 'Suite 12'),
('Ros', 'Frany', 'rfrany7@addtoany.com', '17th Floor'),
('Lizbeth', 'Lempke', 'llempke8@jimdo.com', 'Apt 591'),
('Annadiane', 'Hardern', 'ahardern9@comsenz.com', 'PO Box 76218');

/*INSERTAR DATOS EN PROVEEDORES*/
insert into proveedores (nombre, contacto) values 
('Digitube', '+1 447 296 4291'),
('Flashpoint', '+1 902 894 9767'),
('Skidoo', '+62 100 850 8208'),
('Buzzshare', '+389 413 532 2567'),
('LiveZ', '+86 669 627 9377'),
('Devbug', '+47 906 701 2936'),
('Mynte', '+994 107 997 3529'),
('Agimba', '+66 863 850 2420'),
('Skyble', '+55 249 667 8168'),
('Oyonder', '+256 549 783 2113');

/*INSERTAR DATOS EN CATEGORIAS*/
insert into categorias (nombre) values 
('Automotive'),
('Food - Salads'),
('Kitchen'),
('Electrodomesticos'),
('Food - Condiments'),
('Toys'),
('Office'),
('Food - Beverages'),
('Home'),
('Food - Snacks');

/*INSERTAR DATOS EN PRODUCTOS*/
insert into productos (nombre, descripcion, precio , categoria_id, stock, proveedor_id) values 
('Oatmeal Raisin Cookies', 'Delicious cookies packed with oats and raisins.', 4540, 5, 39,1),
('Beef Sirloin Steak', 'Juicy and tender beef sirloin steak, grass-fed.', 1812, 6, 6, 1),
('Electrolyte Water Bottle', 'Water bottle that tracks hydration levels and adds electrolytes.', 2044, 2, 74, 2),
('Puzzle Game Set', 'Challenging puzzle game set for family entertainment.', 4131, 6, 9, 2),
('Marinara Sauce', 'Classic marinara sauce for all pasta dishes.', 3192, 5, 64, 2),
('Tailored Dress Pants', 'Smart tailored dress pants, perfect for work or formal events.', 5236, 10, 65, 3),
('Patterned Knit Scarf', 'Add a pop of color with this stylish patterned knit scarf.', 5130, 1, 32, 3),
('Grapes (red)', 'Fresh seedless red grapes, perfect for snacking.', 7670, 5, 64, 4),
('Pet Hair Remover', 'Effective roller for removing pet hair from furniture.', 3070, 3, 80, 5);

/*INSERTAR DATOS EN PEDIDOS*/
INSERT INTO pedidos (cliente_id, fecha, total)VALUES 
(2, '2025-10-10', NULL),
(3, '2024-02-29', NULL),
(2, '2024-04-25', NULL),
(5, '2024-07-29', NULL),
(3, '2025-04-20', NULL),
(4, '2025-03-02', NULL),
(6, '2025-07-11', NULL),
(1, '2025-10-17', NULL),
(5, '2024-02-13', NULL),
(10, '2024-08-30', NULL);

INSERT INTO detalle_pedidos (pedido_id, producto_id, cantidad, precio_unitario, subtotal) VALUES
(1, 2, 50, 1812, Null),
(3, 5, 20, 3192, Null),
(9, 4, 15, 4131, Null),
(2, 6, 80, 5236, Null),
(4, 1, 45, 4540,Null),
(6, 8, 70, 5236,Null),
(5, 3, 60, 2044, Null),
(10, 9, 90, 7670, Null),
(8, 7, 25, 5236, Null),
(7, 1, 40, 3070, Null),
(1, 3, 30, 2044, Null),
(2, 4, 55, 4131, Null),
(3, 1, 65, 4540, Null),
(4, 9, 35, 7670, Null),
(5, 2, 75, 1812, Null),
(6, 5, 85, 3192, Null),
(7, 6, 95, 5236, Null),
(8, 8, 10, 5130, Null),
(9, 7, 5, 7670, Null),
(10, 9, 100, 3070, Null),
(1, 5, 40, 3192, NULL),
(2, 2, 60, 3192, Null),
(3, 3, 70, 3192, Null),
(4, 4, 80, 3192, Null),
(5, 1, 90, 3192, Null),
(6, 9, 20, 3192, Null),
(7, 8, 30, 3192, Null),
(8, 6, 50, 3192, Null),
(9, 4, 15, 3192, Null),
(10, 7, 25, 3192, Null);


/*ACTUALIZAR tabla detalle_pedidos para calcular cada subtotal*/
DELIMITER //
CREATE PROCEDURE calcular_subtotal ()
BEGIN
	UPDATE detalle_pedidos
    SET subtotal=cantidad*precio_unitario;
END //
DELIMITER ;

CALL calcular_subtotal();

DELIMITER //
/*PROCEDIMIENTO PARA CALCULAR EL TOTAL DE LOS PEDIDOS*/
CREATE PROCEDURE calcular_total ()
BEGIN
    UPDATE pedidos p
    INNER JOIN (
        SELECT 
            pedido_id, 
            SUM(subtotal) AS nuevo_total
        FROM detalle_pedidos
        GROUP BY pedido_id
    ) AS detalles
    ON p.id = detalles.pedido_id
    SET p.total = detalles.nuevo_total;
    
    -- si un pedido no tiene detalles, su total debe ser 0.00

    UPDATE pedidos p
    LEFT JOIN detalle_pedidos dp ON p.id = dp.pedido_id
    SET p.total = 0.00
    WHERE dp.pedido_id IS NULL AND p.total <> 0.00;
    
END //

DELIMITER ;


/*TRIGGER PARA CALCULAR AUTOMATICAMENTE*/
DELIMITER //

CREATE TRIGGER stock_resta
AFTER INSERT ON detalle_pedidos
FOR EACH ROW
BEGIN
    -- Resta la cantidad del producto vendido del stock disponible
    UPDATE productos
    SET stock = stock - NEW.cantidad
    WHERE id = NEW.producto_id;
END //

DELIMITER ;
DELIMITER //

CREATE TRIGGER stock_cambio
AFTER UPDATE ON detalle_pedidos
FOR EACH ROW
BEGIN
    -- Si la cantidad cambia, ajusta la diferencia en el stock.
    -- Se suma lo OLD (devuelve) y se resta lo NEW (vende).
    IF OLD.cantidad <> NEW.cantidad THEN
        UPDATE productos
        SET stock = stock + OLD.cantidad - NEW.cantidad
        WHERE id = NEW.producto_id;
    END IF;
END //

DELIMITER ;
DELIMITER //

CREATE TRIGGER calcular_total_automatico_suma
AFTER INSERT ON detalle_pedidos
FOR EACH ROW
BEGIN
    -- Llama al procedimiento que recalcula el total del pedido padre.
    CALL calcular_total(); 
END //

DELIMITER ;
DELIMITER //

CREATE TRIGGER calcular_total_automatico_resta
AFTER DELETE ON detalle_pedidos
FOR EACH ROW
BEGIN
    -- Usa OLD.pedido_id porque el registro NEW ya no existe.
    CALL calcular_total();
END //

DELIMITER ;

DELIMITER //

/*FUNCIÓN: Calcula el IVA (21%) de un monto dado*/
CREATE FUNCTION calcular_iva (monto DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    RETURN monto * 0.21;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER stock_suma
AFTER DELETE ON detalle_pedidos
FOR EACH ROW
BEGIN
    -- Suma la cantidad eliminada del pedido de nuevo al stock.
    UPDATE productos
    SET stock = stock + OLD.cantidad
    WHERE id = OLD.producto_id;
END //

DELIMITER ;

DELIMITER //

DELIMITER //

CREATE TRIGGER calcular_total_automatico_cambio
AFTER UPDATE ON detalle_pedidos
FOR EACH ROW
BEGIN
    -- Solo llama al SP si la cantidad o precio_unitario cambiaron
    IF OLD.cantidad <> NEW.cantidad OR OLD.precio_unitario <> NEW.precio_unitario THEN
        CALL calcular_total();
    END IF;
END //

DELIMITER ;


/*VISTA:1 Resumen de Pedidos y Clientes*/
CREATE VIEW vista_pedidos AS
SELECT
    p.id AS pedido_id,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    p.fecha,
    p.total
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id;

/*VISTA 2: Detalle Completo de cada Pedido*/
CREATE VIEW vista_detalle_pedido_completo AS
SELECT
    dp.id AS detalle_id,
    ped.id AS pedido_id,
    ped.fecha,
    cli.nombre AS nombre_cliente,
    prod.nombre AS nombre_producto,
    dp.cantidad,
    dp.precio_unitario,
    dp.subtotal
FROM detalle_pedidos dp
JOIN pedidos ped ON dp.pedido_id = ped.id
JOIN clientes cli ON ped.cliente_id = cli.id
JOIN productos prod ON dp.producto_id = prod.id;

-- VISTA 3: Inventario con Categoría y Proveedor
CREATE VIEW vista_inventario_completo AS
SELECT
    prod.nombre AS nombre_producto,
    prod.descripcion,
    prod.precio AS precio_actual,
    prod.stock,
    c.nombre AS nombre_categoria,
    prov.nombre AS nombre_proveedor,
    prov.contacto AS contacto_proveedor
FROM productos prod
JOIN categorias c ON prod.categoria_id = c.id
JOIN proveedores prov ON prod.proveedor_id = prov.id;

CALL calcular_subtotal(); 
CALL calcular_total();
SELECT * FROM vista_pedidos;
SELECT * FROM vista_detalle_pedido_completo;
SELECT * FROM vista_inventario_completo;

SET SQL_SAFE_UPDATES = 1; /*Activado para la seguridad completa del codigo*/
