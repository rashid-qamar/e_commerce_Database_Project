# E-Commerce Order Management System (SQL)

## Overview
This project implements a relational database for a simple e-commerce system using MySQL.  
It manages customers, products, orders, payments, and shipping information while demonstrating core SQL concepts like joins, transactions, and constraints.

---

## Database Tables

### Customer
- **customer_id** (Primary Key)
- **customer_name**
- **phone_no**
- **address**

### Product
- **product_id** (Primary Key)
- **product_name**
- **price**
- **stock_quantity**

### Orders
- **order_id** (Primary Key)
- **customer_id** (Foreign Key)
- **order_date**
- **order_status**
- **total_amount**

### Order_Item
- **order_item_id** (Primary Key)
- **order_id** (Foreign Key)
- **product_id** (Foreign Key)
- **quantity**
- **price**

### Payment
- **payment_id** (Primary Key)
- **order_id** (Foreign Key)
- **payment_method** (UPI / Cash)
- **payment_status** (Pending / Completed / Failed)
- **payment_date**

### Shipping
- **shipping_id** (Primary Key)
- **order_id** (Foreign Key)
- **address**
- **delivery_date**

---

## SQL Concepts Used

### DDL (Data Definition Language)
- CREATE TABLE
- ALTER TABLE
- Constraints (Primary Key, Foreign Key, NOT NULL)

### DML (Data Manipulation Language)
- INSERT
- UPDATE
- DELETE
- SELECT

### DCL (Data Control Language)
- GRANT
- REVOKE

### TCL (Transaction Control Language)
- START TRANSACTION
- COMMIT
- ROLLBACK

### Joins
Used to retrieve related data from multiple tables.

### ER Diagram

![E-commerce](https://github.com/user-attachments/assets/f0d65c9e-dc27-441d-9123-3510d74e0ebb)

### Joins
<img width="2442" height="1135" alt="image" src="https://github.com/user-attachments/assets/8318e9a4-092a-4b0c-ba5b-e81782514f37" />


