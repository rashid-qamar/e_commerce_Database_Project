CREATE database ecommerce_project;
USE ecommerce_project;

CREATE TABLE Customer (
cust_id INT PRIMARY KEY,
cust_name VARCHAR(50),
phone bigint,
address varchar(100)
);

create table Product (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
price DECIMAL(10, 2),
stock_quantity INT
);


create table Orders (
order_id INT PRIMARY KEY,
cust_id INT,
order_date DATE,
order_status varchar(20),
total_amount DECIMAL(10, 2),
FOREIGN KEY (cust_id) REFERENCES Customer (cust_id)
);

create table Orders_item(
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
price DECIMAL(10, 2),
FOREIGN KEY (order_id) REFERENCES Orders (order_id),
FOREIGN KEY (product_id) REFERENCES Product (product_id)
);

create table Payment (
payment_id INT PRIMARY KEY,
order_id INT,
payment_method ENUM ('UPI', 'Cash') NOT NULL,
payment_status ENUM('Pending','Completed','Failed') NOT NULL,
payment_date DATE,
foreign key (order_id) references Orders (order_id)
);

create table Shipping (
shipping_id INT PRIMARY KEY,
order_id INT,
address VARCHAR(100),
delevery_date DATE,
foreign key (order_id) references Orders (order_id)
);

ALTER TABLE Payment
MODIFY payment_status ENUM('Pending','Completed','Failed') NOT NULL;

INSERT INTO Customer
VALUES
(101, 'Rashid','9876543210','Vijayawada'),
(102, 'Aman','9123456780','Delhi'),
(103, 'Sara','9988776655','Mumbai');

INSERT INTO Product(product_id, product_name, price, stock_quantity)
VALUES
(201,'Laptop',60000,10),
(202,'Smartphone',20000,15),
(203,'Headphones',2000,30);

INSERT INTO Orders(order_id, cust_id, order_date, order_status, total_amount)
VALUES
(301,101,'2026-03-09','Pending',60000),
(302,102,'2026-03-09','Delivered',20000),
(303,103,'2026-03-10','Pending',2000);

INSERT INTO Orders_item(order_item_id, order_id, product_id, quantity, price)
VALUES
(401,301,201,1,60000),
(402,302,202,1,20000),
(403,303,203,1,2000);

INSERT INTO Payment(payment_id, order_id, payment_method, payment_status, payment_date)
VALUES
(501,301,'UPI','Completed','2026-03-09'),
(502,302,'Cash','Completed','2026-03-09'),
(503,303,'UPI','Pending','2026-03-10');


INSERT INTO Shipping(shipping_id, order_id, address, delevery_date)
VALUES
(601,301,'Vijayawada','2026-03-12'),
(602,302,'Delhi','2026-03-10'),
(603,303,'Mumbai','2026-03-13');

SELECT * FROM Customer;

SELECT c.cust_name, o.order_id, o.order_date, o.total_amount
FROM Customer c
JOIN Orders o
ON c.cust_id = o.cust_id;

SELECT o.order_id, p.product_name, oi.quantity, oi.price
FROM Orders_item oi
JOIN Product p ON oi.product_id = p.product_id
JOIN Orders o ON oi.order_id = o.order_id;

SELECT * FROM Orders
WHERE order_status = 'Pending';

SELECT SUM(total_amount) AS Total_Sales
FROM Orders;

SELECT cust_id, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY cust_id;

START TRANSACTION;

UPDATE Product
SET stock_quantity = stock_quantity - 1
WHERE product_id = 201;

COMMIT;

