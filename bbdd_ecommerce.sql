DROP DATABASE IF EXISTS `ecommerce`;
CREATE DATABASE IF NOT EXISTS `ecommerce` 
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


USE `ecommerce` ;

-- -----------------------------------------------------
-- Table `Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` BIGINT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `identify_document` VARCHAR(15) NOT NULL UNIQUE,
  `email` VARCHAR(45) NOT NULL,
  `phone` INT(15) NOT NULL,
  `address` VARCHAR(65) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `province` VARCHAR(45) NOT NULL,
  `zip_code` INT NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `registration_date` DATE NOT NULL,
  `payment_info` VARCHAR(45) NOT NULL,
  `account_status` VARCHAR(20) NOT NULL,
  `username` VARCHAR(45) NOT NULL UNIQUE,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_customer`))
ENGINE = InnoDB;




-- -----------------------------------------------------
-- Table `Supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supplier` (
  `id_supplier` BIGINT NOT NULL AUTO_INCREMENT,
  `supplier_name` VARCHAR(45) NULL,
  `contact_person` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `phone` INT(15) NULL,
  `additional_notes` VARCHAR(45) NULL,
  `bank_info` VARCHAR(45) NULL,
  PRIMARY KEY (`id_supplier`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product` (
  `id_product` BIGINT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `stock_quantity` INT NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `creation_date` DATE NOT NULL,
  `update_date` DATE NULL,
  `discount` DECIMAL(5,2) NOT NULL,
  `taxes` DECIMAL(5,2) NOT NULL,
  `product_image` VARCHAR(45) NOT NULL,
  `availability` BOOLEAN NOT NULL,
  `technical_specifications` VARCHAR(45) NULL,
  `supplier_id_supplier` BIGINT NOT NULL,
  PRIMARY KEY (`id_product`, `supplier_id_supplier`),
  CONSTRAINT `fk_product_supplier1`
    FOREIGN KEY (`supplier_id_supplier`)
    REFERENCES `supplier` (`id_supplier`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `purchase_order` (
  `id_order` BIGINT NOT NULL AUTO_INCREMENT,
  `order_date` DATE NOT NULL,
  `order_status` VARCHAR(45) NOT NULL,
  `payment_method` VARCHAR(45) NOT NULL,
  `total_order_amount` DECIMAL(10,2) NOT NULL,
  `customer_notes` VARCHAR(45) NOT NULL,
  `estimated_delivery_date` DATE NOT NULL,
  `shipping_date` DATE NOT NULL,
  `purchase_id_customer` BIGINT NOT NULL,
  PRIMARY KEY (`id_order`, `purchase_id_customer`),
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`purchase_id_customer`)
    REFERENCES `customer` (`id_customer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DeliveryNote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delivery_note` (
  `id_deliverynote` BIGINT NOT NULL AUTO_INCREMENT,
  `dispatch_date` DATE NULL,
  `shipping_details` VARCHAR(45) NULL,
  `receiver_signature` VARCHAR(45) NULL,
  `delivery_status` VARCHAR(45) NULL,
  `delivery_notes` VARCHAR(45) NULL,
  `purchase_order_id_order` BIGINT NOT NULL,
  PRIMARY KEY (`id_deliverynote`, `purchase_order_id_order`),
  CONSTRAINT `fk_deliverynote_order1`
	  FOREIGN KEY (`purchase_order_id_order`)
	  REFERENCES `purchase_order` (`id_order`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `invoice` (
  `id_invoice` BIGINT NOT NULL AUTO_INCREMENT,
  `invoice_date` DATE NULL,
  `due_date` DATE NULL,
  `shipping_details` VARCHAR(45) NULL,
  `subtotal` DECIMAL(10,2) NULL,
  `taxes` DECIMAL(10,2) NULL,
  `discounts` DECIMAL(10,2) NULL,
  `total_invoice_amount` DECIMAL(10,2) NULL,
  `payment_status` VARCHAR(45) NULL,
  `invoice_notes` VARCHAR(45) NULL,
  `purchase_order_id_order` BIGINT NOT NULL,
  PRIMARY KEY (`id_invoice`, `purchase_order_id_order`),
  CONSTRAINT `fk_invoice_order1`
	  FOREIGN KEY (`purchase_order_id_order`)
	  REFERENCES `purchase_order` (`id_order`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION)

ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product_has_Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product_has_order` (
  `id_product_has_order` BIGINT AUTO_INCREMENT,
  `product_id_product` BIGINT NOT NULL,
  `purchase_order_id_order` BIGINT NOT NULL,
  PRIMARY KEY (`id_product_has_order`),
  CONSTRAINT `fk_product_has_order_product`
    FOREIGN KEY (`product_id_product`)
    REFERENCES `product` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_order_order`
    FOREIGN KEY (`purchase_order_id_order`)
    REFERENCES `purchase_order` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;


-- DATOS EJEMPLO:

-- Insertar datos de ejemplo en la tabla Customer
INSERT INTO customer (id_customer, first_name, last_name, identify_document, email, phone, address, city, province, zip_code, country, registration_date, payment_info, account_status, username, password)
VALUES
(1, 'Sergi', 'Gavin','11223344K', 'sergi.gs@hotmail.es', '123456789', 'Carrer Batllevell 80', 'Sabadell', 'Barcelona', 08208, 'España', '2023-01-01', 'Credit Card', 'Active', 'Sergi', 'Sergi123'),
(2, 'CustomerB', 'CustomerB1','22334455L', 'jane.smith@example.com', '987654321', '456 Oak St', 'Townsville', 'Stateville', 67890, 'Countryland', '2023-01-02', 'PayPal', 'Active', 'jane_smith', 'password456'),
(3, 'CustomerC', 'CustomerC1','66778899S', 'alice.j@example.com', '555666777', '789 Elm St', 'Villagetown', 'Stateville', 54321, 'Countryland', '2023-01-03', 'Bank Transfer', 'Active', 'alice_j', 'password789');

-- Insertar datos de ejemplo en la tabla Supplier
INSERT INTO supplier (id_supplier, supplier_name, contact_person, email, phone, additional_notes, bank_info)
VALUES
(1, 'SupplierA', 'ContactA', 'supplierA@example.com', '111222333', 'Additional notes for SupplierA', 'Bank info for SupplierA'),
(2, 'SupplierB', 'ContactB', 'supplierB@example.com', '444555666', 'Additional notes for SupplierB', 'Bank info for SupplierB'),
(3, 'SupplierC', 'ContactC', 'supplierC@example.com', '777888999', 'Additional notes for SupplierC', 'Bank info for SupplierC');


-- Insertar datos de ejemplo en la tabla Product
INSERT INTO product (id_product, product_name, description, price, stock_quantity, category, creation_date, update_date, discount, taxes, product_image, availability, technical_specifications, supplier_id_supplier)
VALUES
(1, 'ProductA', 'Description for ProductA', 49.99, 100, 'CategoryA', '2023-01-01', NULL, 0.05, 0.1, 'productA.jpg', FALSE, 'Specs for ProductA', 1),
(2, 'ProductB', 'Description for ProductB', 29.99, 50, 'CategoryB', '2023-01-02', NULL, 0.02, 0.05, 'productB.jpg', FALSE, 'Specs for ProductB', 2),
(3, 'ProductC', 'Description for ProductC', 39.99, 75, 'CategoryC', '2023-01-03', NULL, 0.03, 0.07, 'productC.jpg', TRUE, 'Specs for ProductC', 3);

-- Insertar datos de ejemplo en la tabla Order
INSERT INTO purchase_order (id_order, order_date, order_status, payment_method, total_order_amount, customer_notes, estimated_delivery_date, shipping_date, purchase_id_customer)
VALUES
(1, '2023-02-01', 'Processing', 'Credit Card', 149.95, 'Special instructions for Order 1', '2023-02-10', '2023-02-05', 1),
(2, '2023-02-02', 'Shipped', 'PayPal', 79.98, 'Special instructions for Order 2', '2023-02-15', '2023-02-08', 2),
(3, '2023-02-03', 'Processing', 'Bank Transfer', 129.99, 'Special instructions for Order 3', '2023-02-12', '2023-02-06', 3),
(4, '2023-02-03', 'Processing', 'Bank Transfer', 129.99, 'Special instructions for Order 3', '2023-02-12', '2023-02-06', 1);

-- Insertar datos de ejemplo en la tabla DeliveryNote
INSERT INTO delivery_note (id_deliverynote, dispatch_date, shipping_details, receiver_signature, delivery_status, delivery_notes, Purchase_order_id_order)
VALUES
(1, '2023-02-05', 'Shipped via Express Shipping', 'John Doe', 'Delivered', 'Delivery notes for Order 1', 1),
(2, '2023-02-08', 'Shipped via Standard Shipping', 'Jane Smith', 'In Transit', 'Delivery notes for Order 2', 2),
(3, '2023-02-10', 'Shipped via Priority Shipping', 'Alice Johnson', 'In Transit', 'Delivery notes for Order 3', 3);


-- Insertar datos de ejemplo en la tabla Invoice
INSERT INTO invoice (id_invoice, invoice_date, due_date, shipping_details, subtotal, taxes, discounts, total_invoice_amount, payment_status, invoice_notes, purchase_order_id_order)
VALUES
(1, '2023-02-05', '2023-02-15', 'Shipped via Express Shipping', '149.95', '15.00', '7.50', '157.45', 'Paid', 'Invoice notes for Order 1', 1),
(2, '2023-02-08', '2023-02-18', 'Shipped via Standard Shipping', '79.98', '8.00', '4.00', '83.98', 'Pending', 'Invoice notes for Order 2', 2),
(3, '2023-02-10', '2023-02-20', 'Shipped via Priority Shipping', '129.99', '13.00', '6.50', '136.49', 'Pending', 'Invoice notes for Order 3', 3);

-- Insertar datos de ejemplo en la tabla Product_has_Order
INSERT INTO product_has_order (id_product_has_order,product_id_product, purchase_order_id_order)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 3, 3);



SELECT * FROM purchase_order;
SELECT * FROM customer;
SELECT * FROM supplier;
SELECT * FROM product;