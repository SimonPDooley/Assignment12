 create database pizza_restaurant;
 
 use pizza_restaurant;
 
 CREATE TABLE `customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`customer_id`));
  
  CREATE TABLE `order` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `time_of_order` DATETIME NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`));
  
  CREATE TABLE `pizza` (
  `pizza_id` INT NOT NULL AUTO_INCREMENT,
  `pizza_name` VARCHAR(45) NOT NULL,
  `cost` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`pizza_id`));
  
  CREATE TABLE `pizza_order` (
  `order_id` INT NOT NULL,
  `pizza_id` INT NOT NULL,
  FOREIGN KEY (`order_id`) REFERENCES `order`(`order_id`),
  FOREIGN KEY (`pizza_id`) REFERENCES `pizza`(`pizza_id`));
  
  INSERT INTO `customer` (`name`, `phone_number`)
  values ('Trevor Page', '226-555-4982');
  
  INSERT INTO `customer` (`name`, `phone_number`)
  values ('John Doe', '555-555-9498');
  
  INSERT INTO `pizza` (`pizza_name`, `cost`)
  values ('Pepperoni & Cheese', 7.99);
  
  INSERT INTO `pizza` (`pizza_name`, `cost`)
  values ('Vegetarian', 9.99);
  
  INSERT INTO `pizza` (`pizza_name`, `cost`)
  values ('Meat Lovers', 14.99);
  
  INSERT INTO `pizza` (`pizza_name`, `cost`)
  values ('Hawaiian', 12.99);
  
  INSERT INTO `order` (`time_of_order`, `customer_id`)
  values ('2014-10-09 9:47:00', 1);
  
  INSERT INTO `order` (`time_of_order`, `customer_id`)
  values ('2014-10-09 13:20:00', 2);
  
  INSERT INTO `order` (`time_of_order`, `customer_id`)
  values ('2014-10-09 9:47:00', 1);
  
  INSERT INTO `pizza_order` (`order_id`, `pizza_id`)
  values (1, 1);
  
  INSERT INTO `pizza_order` (`order_id`, `pizza_id`)
  values (2, 2);
  
  INSERT INTO `pizza_order` (`order_id`, `pizza_id`)
  values (3, 4);
  
  -- Grouping and reading all tables
  SELECT * FROM `customer` c
  JOIN `order` o on c.customer_id = o.customer_id
  JOIN `pizza_order` po on o.order_id = po.order_id
  JOIN `pizza` p on p.pizza_id = po.pizza_id;

  -- Assignment 12, Question 4
  SELECT c.customer_id, `name`, sum(cost) FROM `customer` c
  JOIN `order` o on c.customer_id = o.customer_id
  JOIN `pizza_order` po on o.order_id = po.order_id
  JOIN `pizza` p on p.pizza_id = po.pizza_id
  GROUP BY c.customer_id;
  
  -- Assignment 12, Question 5
  SELECT c.customer_id, `name`, DATE(o.time_of_order), count(o.order_id) FROM `customer` c
  JOIN `order` o on c.customer_id = o.customer_id
  JOIN `pizza_order` po on o.order_id = po.order_id
  JOIN `pizza` p on p.pizza_id = po.pizza_id
   GROUP BY o.time_of_order;