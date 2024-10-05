CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `unit_price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`product_id`)
); 

 

INSERT INTO `products` VALUES (1,'Apple',70,1.21);
INSERT INTO `products` VALUES (2,'Pork',49,4.65);
INSERT INTO `products` VALUES (3,'Lettuce',38,3.35);
INSERT INTO `products` VALUES (4,'Broccoli',90,4.53);
INSERT INTO `products` VALUES (5,'Ranch Dressing',94,1.63);
INSERT INTO `products` VALUES (6,'Orange',14,2.39);
INSERT INTO `products` VALUES (7,'Grape',98,3.29);
INSERT INTO `products` VALUES (8,'Raspberry',26,0.74);
INSERT INTO `products` VALUES (9,'Lemon',67,2.26);
INSERT INTO `products` VALUES (10,'Pumpkin',6,1.09);

ALTER TABLE products ADD category varchar(50) NOT NULL;
UPDATE products SET category = 'Fruit' WHERE product_id IN (1, 6, 7, 8, 9, 10);
UPDATE products SET category = 'Meat' WHERE product_id IN (2);
UPDATE products SET category = 'Vegetable' WHERE product_id IN (3, 4);
UPDATE products SET category = 'Sauce' WHERE product_id IN (5);

SELECT AVG(unit_price) FROM products WHERE category = "Fruit";
