-- ============================================
-- E-Commerce Relational Database (SQL)
-- For MySQL Workbench
-- ============================================

-- Create and select the database
DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- ============================================
-- STEP 1: CREATE TABLES
-- ============================================

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    stock_quantity INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating INT,
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ============================================
-- STEP 2: INSERT SAMPLE DATA
-- ============================================

INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Fashion'),
(3, 'Home and Kitchen'),
(4, 'Books'),
(5, 'Sports');

INSERT INTO customers (customer_id, customer_name, email, city, signup_date) VALUES
(101, 'Ravi Kumar', 'ravi.k@mail.com', 'Vizianagaram', '2024-01-10'),
(102, 'Priya Sharma', 'priya.s@mail.com', 'Hyderabad', '2024-01-15'),
(103, 'Anil Reddy', 'anil.r@mail.com', 'Vijayawada', '2024-02-05'),
(104, 'Sneha Patel', 'sneha.p@mail.com', 'Bangalore', '2024-02-20'),
(105, 'Vikram Singh', 'vikram.s@mail.com', 'Delhi', '2024-03-01'),
(106, 'Divya Nair', 'divya.n@mail.com', 'Chennai', '2024-03-12'),
(107, 'Arjun Rao', 'arjun.r@mail.com', 'Visakhapatnam', '2024-03-25'),
(108, 'Meena Iyer', 'meena.i@mail.com', 'Vijayawada', '2024-04-02');

INSERT INTO products (product_id, product_name, category_id, price, stock_quantity) VALUES
(1, 'Wireless Mouse', 1, 499.00, 120),
(2, 'Bluetooth Speaker', 1, 1299.00, 60),
(3, 'Men Formal Shirt', 2, 899.00, 80),
(4, 'Women Kurti', 2, 799.00, 100),
(5, 'Non-stick Pan', 3, 1199.00, 40),
(6, 'Mixer Grinder', 3, 2999.00, 25),
(7, 'Data Structures Book', 4, 549.00, 70),
(8, 'Novel Fiction', 4, 349.00, 90),
(9, 'Cricket Bat', 5, 1599.00, 30),
(10, 'Yoga Mat', 5, 699.00, 50),
(11, 'Wireless Keyboard', 1, 899.00, 55),
(12, 'Power Bank', 1, 1099.00, 65);

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(1001, 101, '2024-05-02', 'Delivered'),
(1002, 102, '2024-05-04', 'Delivered'),
(1003, 103, '2024-05-06', 'Delivered'),
(1004, 104, '2024-05-09', 'Cancelled'),
(1005, 105, '2024-05-12', 'Delivered'),
(1006, 106, '2024-05-15', 'Delivered'),
(1007, 101, '2024-06-01', 'Delivered'),
(1008, 107, '2024-06-05', 'Delivered'),
(1009, 108, '2024-06-08', 'Placed'),
(1010, 102, '2024-06-12', 'Delivered');

INSERT INTO order_items (order_item_id, order_id, product_id, quantity, unit_price) VALUES
(1, 1001, 1, 2, 499.00),
(2, 1001, 7, 1, 549.00),
(3, 1002, 4, 1, 799.00),
(4, 1003, 6, 1, 2999.00),
(5, 1004, 9, 1, 1599.00),
(6, 1005, 2, 1, 1299.00),
(7, 1005, 12, 1, 1099.00),
(8, 1006, 5, 2, 1199.00),
(9, 1007, 3, 1, 899.00),
(10, 1007, 8, 3, 349.00),
(11, 1008, 10, 1, 699.00),
(12, 1009, 11, 1, 899.00),
(13, 1010, 1, 1, 499.00),
(14, 1010, 2, 1, 1299.00);

INSERT INTO payments (payment_id, order_id, payment_date, amount, payment_method) VALUES
(1, 1001, '2024-05-02', 1547.00, 'UPI'),
(2, 1002, '2024-05-04', 799.00, 'Card'),
(3, 1003, '2024-05-06', 2999.00, 'UPI'),
(4, 1005, '2024-05-12', 2398.00, 'Card'),
(5, 1006, '2024-05-15', 2398.00, 'Cash on Delivery'),
(6, 1007, '2024-06-01', 1946.00, 'UPI'),
(7, 1008, '2024-06-05', 699.00, 'Card'),
(8, 1010, '2024-06-12', 1798.00, 'UPI');

INSERT INTO reviews (review_id, product_id, customer_id, rating, review_date) VALUES
(1, 1, 101, 5, '2024-05-10'),
(2, 7, 101, 4, '2024-05-10'),
(3, 4, 102, 4, '2024-05-08'),
(4, 6, 103, 5, '2024-05-12'),
(5, 2, 105, 3, '2024-05-18'),
(6, 5, 106, 4, '2024-05-20'),
(7, 3, 101, 5, '2024-06-05'),
(8, 10, 107, 4, '2024-06-08');

-- ============================================
-- STEP 3: ANALYSIS QUERIES
-- ============================================

-- 1. Total revenue from delivered orders
SELECT SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'Delivered';

-- 2. Best-selling products by quantity sold
SELECT p.product_name, SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 5;

-- 3. Revenue by category
SELECT c.category_name, SUM(oi.quantity * oi.unit_price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY revenue DESC;

-- 4. Top customers by total spend
SELECT cu.customer_name, SUM(oi.quantity * oi.unit_price) AS total_spend
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers cu ON o.customer_id = cu.customer_id
WHERE o.status = 'Delivered'
GROUP BY cu.customer_name
ORDER BY total_spend DESC;

-- 5. Order status breakdown
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status;

-- 6. Average product rating
SELECT p.product_name, ROUND(AVG(r.rating), 2) AS avg_rating, COUNT(r.review_id) AS review_count
FROM reviews r
JOIN products p ON r.product_id = p.product_id
GROUP BY p.product_name
ORDER BY avg_rating DESC;

-- 7. Low stock products (below 40 units)
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity < 40
ORDER BY stock_quantity ASC;

-- 8. Payment method preference
SELECT payment_method, COUNT(*) AS times_used, SUM(amount) AS total_amount
FROM payments
GROUP BY payment_method
ORDER BY total_amount DESC;

-- 9. City-wise customer distribution
SELECT city, COUNT(*) AS customer_count
FROM customers
GROUP BY city
ORDER BY customer_count DESC;

-- 10. Cancelled order rate (%)
SELECT
  ROUND(
    (SELECT COUNT(*) FROM orders WHERE status = 'Cancelled') * 100.0 / COUNT(*), 2
  ) AS cancellation_rate_percent
FROM orders;
