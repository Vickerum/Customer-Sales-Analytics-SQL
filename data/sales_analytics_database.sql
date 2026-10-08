/* Customer & Sales Analytics — SQL Server Dataset
   Grain:
   customers       = 1 row/customer
   employees       = 1 row/employee
   products        = 1 row/product
   orders          = 1 row/order
   customer_events = 1 row/event
*/

CREATE TABLE customers (
 customer_id INT PRIMARY KEY, customer_name VARCHAR(100), city VARCHAR(50),
 state VARCHAR(50), signup_date DATE, customer_type VARCHAR(30)
);

INSERT INTO customers VALUES
(1,'Aarav Mehta','Mumbai','Maharashtra','2024-01-05','Retail'),
(2,'Neha Sharma','Pune','Maharashtra','2024-01-12','Retail'),
(3,'Rahul Verma','Delhi','Delhi','2024-01-20','Corporate'),
(4,'Priya Nair','Bangalore','Karnataka','2024-02-03','Retail'),
(5,'Rohan Patel','Ahmedabad','Gujarat','2024-02-15','Corporate'),
(6,'Sneha Joshi','Vadodara','Gujarat','2024-03-01','Retail'),
(7,'Aditya Singh','Noida','Uttar Pradesh','2024-03-18','Corporate'),
(8,'Kavya Iyer','Chennai','Tamil Nadu','2024-04-07','Retail'),
(9,'Arjun Kapoor','Mumbai','Maharashtra','2024-04-22','Corporate'),
(10,'Ananya Desai','Surat','Gujarat','2024-05-10','Retail'),
(11,'Vivek Shah','Pune','Maharashtra','2024-05-25','Corporate'),
(12,'Pooja Kulkarni','Nashik','Maharashtra','2024-06-04','Retail'),
(13,'Karan Malhotra','Delhi','Delhi','2024-06-19','Corporate'),
(14,'Isha Rao','Hyderabad','Telangana','2024-07-02','Retail'),
(15,'Manish Gupta','Jaipur','Rajasthan','2024-07-18','Corporate'),
(16,'Riya Shah','Mumbai','Maharashtra','2024-08-01','Retail'),
(17,'Siddharth Jain','Indore','Madhya Pradesh','2024-08-21','Corporate'),
(18,'Meera Shah','Vadodara','Gujarat','2024-09-05','Retail'),
(19,'Akash Yadav','Pune','Maharashtra','2024-09-20','Corporate'),
(20,'Nidhi Agarwal','Bangalore','Karnataka','2024-10-03','Retail'),
(21,'Varun Bansal','Delhi','Delhi','2024-10-19','Corporate'),
(22,'Tanvi Shah','Surat','Gujarat','2024-11-02','Retail'),
(23,'Harsh Mehta','Mumbai','Maharashtra','2024-11-15','Corporate'),
(24,'Simran Kaur','Chandigarh','Punjab','2024-12-01','Retail'),
(25,'Yash Patil','Pune','Maharashtra','2024-12-15','Corporate'),
(26,'Aditi Rao','Hyderabad','Telangana','2025-01-05','Retail'),
(27,'Mohit Soni','Jaipur','Rajasthan','2025-01-18','Corporate'),
(28,'Shruti Menon','Bangalore','Karnataka','2025-02-02','Retail'),
(29,'Dev Joshi','Vadodara','Gujarat','2025-02-17','Corporate'),
(30,'Pallavi Deshmukh','Nagpur','Maharashtra','2025-03-03','Retail'),
(31,'Aman Tiwari','Lucknow','Uttar Pradesh','2025-03-20','Retail'),
(32,'Sakshi Rao','Bangalore','Karnataka','2025-04-01','Retail');

CREATE TABLE employees (
 employee_id INT PRIMARY KEY, employee_name VARCHAR(100), department VARCHAR(50),
 salary DECIMAL(12,2), joining_date DATE, manager_id INT NULL
);

INSERT INTO employees VALUES
(101,'Amit Kumar','Sales',72000,'2021-04-10',NULL),
(102,'Snehal Patil','Sales',68000,'2022-06-15',101),
(103,'Raj Malhotra','Sales',68000,'2022-08-20',101),
(104,'Kunal Shah','Sales',61000,'2023-01-12',101),
(105,'Priti Joshi','Sales',55000,'2023-07-05',102),
(106,'Nitin Verma','Finance',85000,'2020-03-11',NULL),
(107,'Anjali Mehta','Finance',76000,'2021-09-19',106),
(108,'Rakesh Gupta','Finance',76000,'2022-11-07',106),
(109,'Deepa Nair','Finance',65000,'2023-05-22',106),
(110,'Suresh Rao','HR',90000,'2019-01-15',NULL),
(111,'Divya Singh','HR',70000,'2021-02-18',110),
(112,'Manoj Yadav','HR',62000,'2023-03-10',110);

CREATE TABLE products (
 product_id INT PRIMARY KEY, product_name VARCHAR(100), category VARCHAR(50),
 sub_category VARCHAR(50), unit_price DECIMAL(12,2)
);

INSERT INTO products VALUES
(201,'Laptop Pro 14','Electronics','Laptop',85000),
(202,'Laptop Air 13','Electronics','Laptop',65000),
(203,'Wireless Mouse','Electronics','Accessories',1500),
(204,'Mechanical Keyboard','Electronics','Accessories',4500),
(205,'27 Inch Monitor','Electronics','Monitor',22000),
(206,'Office Chair','Furniture','Chair',12000),
(207,'Standing Desk','Furniture','Desk',28000),
(208,'Bookshelf','Furniture','Storage',9000),
(209,'Business Backpack','Lifestyle','Bags',3500),
(210,'Travel Backpack','Lifestyle','Bags',5000),
(211,'Bluetooth Speaker','Electronics','Audio',6500),
(212,'Noise Cancelling Headset','Electronics','Audio',12500),
(213,'Webcam HD','Electronics','Camera',5500),
(214,'USB-C Hub','Electronics','Accessories',3200),
(215,'Smart Watch','Electronics','Wearable',18000);

CREATE TABLE orders (
 order_id INT PRIMARY KEY, customer_id INT, product_id INT, employee_id INT,
 order_date DATE, quantity INT, total_amount DECIMAL(12,2),
 status VARCHAR(30), payment_method VARCHAR(30)
);

INSERT INTO orders VALUES
(1053,2,202,101,'2025-02-03',1,65000,'Completed','Card'),
(1054,5,215,102,'2025-02-11',1,18000,'Completed','UPI'),
(1055,7,201,103,'2025-02-18',1,85000,'Completed','Card'),
(1056,14,206,104,'2025-02-25',1,12000,'Completed','UPI'),
(1057,1,203,101,'2025-03-04',2,3000,'Completed','UPI'),
(1058,6,207,102,'2025-03-13',1,28000,'Completed','Card'),
(1059,11,211,103,'2025-03-21',1,6500,'Completed','UPI'),
(1060,21,201,104,'2025-03-29',1,85000,'Completed','Card'),
(1061,3,212,101,'2025-04-02',1,12500,'Completed','Card'),
(1062,4,201,102,'2025-04-09',1,85000,'Completed','Card'),
(1063,8,205,103,'2025-04-18',1,22000,'Completed','UPI'),
(1064,13,207,104,'2025-04-27',1,28000,'Completed','Card'),
(1065,1,215,101,'2025-05-03',1,18000,'Completed','UPI'),
(1066,2,211,102,'2025-05-11',1,6500,'Completed','UPI'),
(1067,7,202,103,'2025-05-19',1,65000,'Completed','Card'),
(1068,15,201,104,'2025-05-28',1,85000,'Completed','Card'),
(1069,5,205,101,'2025-06-04',1,22000,'Completed','Card'),
(1070,9,203,102,'2025-06-12',2,3000,'Completed','UPI'),
(1071,12,212,103,'2025-06-18',1,12500,'Completed','Card'),
(1072,17,207,104,'2025-06-26',1,28000,'Completed','UPI');

CREATE TABLE customer_events (
 event_id INT PRIMARY KEY, customer_id INT, event_type VARCHAR(30),
 event_date DATE, channel VARCHAR(30)
);

INSERT INTO customer_events VALUES
(1,1,'Visit','2024-01-02','Organic'),(2,1,'Signup','2024-01-05','Organic'),(3,1,'AddToCart','2024-01-08','Organic'),(4,1,'Purchase','2024-01-10','Organic'),
(5,2,'Visit','2024-01-09','Google'),(6,2,'Signup','2024-01-12','Google'),(7,2,'AddToCart','2024-01-13','Google'),(8,2,'Purchase','2024-01-14','Google'),
(9,3,'Visit','2024-01-17','Organic'),(10,3,'Signup','2024-01-20','Organic'),(11,3,'AddToCart','2024-01-21','Organic'),(12,3,'Purchase','2024-01-22','Organic'),
(13,4,'Visit','2024-01-30','Instagram'),(14,4,'Signup','2024-02-03','Instagram'),(15,4,'AddToCart','2024-02-05','Instagram'),(16,4,'Purchase','2024-02-05','Instagram'),
(17,5,'Visit','2024-02-10','Google'),(18,5,'Signup','2024-02-15','Google'),(19,5,'AddToCart','2024-02-16','Google'),(20,5,'Purchase','2024-02-18','Google'),
(21,6,'Visit','2024-02-25','Organic'),(22,6,'Signup','2024-03-01','Organic'),(23,6,'Purchase','2024-03-01','Organic'),
(24,7,'Visit','2024-03-10','LinkedIn'),(25,7,'Signup','2024-03-18','LinkedIn'),(26,7,'AddToCart','2024-03-20','LinkedIn'),(27,7,'Purchase','2024-03-22','LinkedIn'),
(28,8,'Visit','2024-04-01','Google'),(29,8,'Signup','2024-04-07','Google'),(30,8,'AddToCart','2024-04-10','Google'),
(31,9,'Visit','2024-04-15','Organic'),(32,9,'Signup','2024-04-22','Organic'),(33,9,'AddToCart','2024-04-25','Organic'),(34,9,'Purchase','2024-04-28','Organic'),
(35,10,'Visit','2024-05-05','Instagram'),(36,10,'Signup','2024-05-10','Instagram'),(37,10,'AddToCart','2024-05-15','Instagram'),(38,10,'Purchase','2024-05-18','Instagram'),
(39,11,'Visit','2024-05-20','Google'),(40,11,'Signup','2024-05-25','Google'),(41,11,'Purchase','2024-06-02','Google'),
(42,12,'Visit','2024-06-01','Organic'),(43,12,'Signup','2024-06-04','Organic'),(44,12,'AddToCart','2024-06-05','Organic'),(45,12,'Purchase','2024-06-07','Organic'),
(46,13,'Visit','2024-06-15','LinkedIn'),(47,13,'Signup','2024-06-19','LinkedIn'),(48,13,'AddToCart','2024-06-22','LinkedIn'),(49,13,'Purchase','2024-06-29','LinkedIn'),
(50,14,'Visit','2024-07-01','Google'),(51,14,'Signup','2024-07-02','Google'),(52,14,'AddToCart','2024-07-05','Google'),(53,14,'Purchase','2024-07-08','Google'),
(54,15,'Visit','2024-07-10','Instagram'),(55,15,'Signup','2024-07-18','Instagram'),(56,15,'Purchase','2024-07-20','Instagram'),
(57,16,'Visit','2024-07-25','Organic'),(58,16,'Signup','2024-08-01','Organic'),(59,16,'AddToCart','2024-08-05','Organic'),(60,16,'Purchase','2024-08-07','Organic'),
(61,17,'Visit','2024-08-15','Google'),(62,17,'Signup','2024-08-21','Google'),(63,17,'AddToCart','2024-08-25','Google'),(64,17,'Purchase','2024-08-27','Google'),
(65,18,'Visit','2024-09-01','Organic'),(66,18,'Signup','2024-09-05','Organic'),(67,18,'AddToCart','2024-09-10','Organic'),
(68,19,'Visit','2024-09-15','Google'),(69,19,'Signup','2024-09-20','Google'),(70,19,'AddToCart','2024-09-22','Google'),(71,19,'Purchase','2024-09-25','Google'),
(72,20,'Visit','2024-10-01','Instagram'),(73,20,'Signup','2024-10-03','Instagram'),(74,20,'AddToCart','2024-10-10','Instagram'),(75,20,'Purchase','2024-10-12','Instagram'),
(76,21,'Visit','2024-10-15','Organic'),(77,21,'Signup','2024-10-19','Organic'),(78,21,'Purchase','2024-10-25','Organic'),
(79,22,'Visit','2024-11-01','Google'),(80,22,'Signup','2024-11-02','Google'),(81,22,'AddToCart','2024-11-05','Google'),
(82,23,'Visit','2024-11-10','LinkedIn'),(83,23,'Signup','2024-11-15','LinkedIn'),(84,23,'AddToCart','2024-11-20','LinkedIn'),(85,23,'Purchase','2024-11-22','LinkedIn'),
(86,24,'Visit','2024-11-25','Instagram'),(87,24,'Signup','2024-12-01','Instagram'),(88,24,'AddToCart','2024-12-05','Instagram'),(89,24,'Purchase','2024-12-08','Instagram'),
(90,25,'Visit','2024-12-10','Organic'),(91,25,'Signup','2024-12-15','Organic'),(92,25,'Purchase','2024-12-18','Organic'),
(93,26,'Visit','2025-01-01','Google'),(94,26,'Signup','2025-01-05','Google'),(95,26,'AddToCart','2025-01-08','Google'),(96,26,'Purchase','2025-01-10','Google'),
(97,27,'Visit','2025-01-15','Organic'),(98,27,'Signup','2025-01-18','Organic'),
(99,28,'Visit','2025-02-01','Instagram'),(100,28,'Signup','2025-02-02','Instagram'),(101,28,'AddToCart','2025-02-05','Instagram'),(102,28,'Purchase','2025-02-07','Instagram'),
(103,29,'Visit','2025-02-10','Google'),(104,29,'Signup','2025-02-17','Google'),(105,29,'Purchase','2025-02-20','Google'),
(106,30,'Visit','2025-03-01','Organic'),(107,30,'Signup','2025-03-03','Organic'),(108,30,'AddToCart','2025-03-05','Organic'),(109,30,'Purchase','2025-03-08','Organic');

-- Starter exploration
SELECT TOP (5) * FROM customers;
SELECT TOP (5) * FROM employees;
SELECT TOP (5) * FROM products;
SELECT TOP (5) * FROM orders;
SELECT TOP (5) * FROM customer_events;

-- Starter data-quality analysis: customers with no orders
SELECT c.*
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;
