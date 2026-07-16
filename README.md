# E-Commerce Relational Database (SQL)

## Overview
A relational database designed to model a real-world e-commerce platform, covering customers, products, categories, orders, order items, payments, and product reviews. Built to practice database design (primary/foreign keys, constraints, many-to-many relationships) and to write business-focused analytical SQL queries.

## Objective
To design a normalized relational schema for an e-commerce system and answer key business questions — revenue, best-sellers, customer spend, inventory alerts, and payment trends — the kind of analysis a Product Analyst would perform to support data-driven decisions.

## Database Design
7 interconnected tables:
- **categories** — product categories
- **customers** — customer profile details
- **products** — product catalog, linked to categories, tracks stock
- **orders** — order header (customer, date, status)
- **order_items** — junction table linking orders and products (many-to-many, supports multiple products per order)
- **payments** — payment records linked to orders
- **reviews** — product ratings and reviews by customers

Includes primary keys, foreign keys, a `CHECK` constraint on ratings, and a `UNIQUE` constraint on customer email — designed to reflect real-world referential integrity.

## Key Analysis Performed
1. Total revenue from delivered orders
2. Best-selling products by units sold
3. Revenue breakdown by category
4. Top customers by total spend
5. Order status breakdown (Placed / Delivered / Cancelled)
6. Average product rating and review count
7. Low-stock inventory alerts
8. Payment method preference and totals
9. City-wise customer distribution
10. Order cancellation rate (%)

## Key Insights (Sample findings from this dataset)
- Electronics and Home & Kitchen categories contribute the largest share of revenue.
- A small number of customers account for a disproportionately high share of total spend.
- UPI is the most preferred payment method among customers in this dataset.

## Tools Used
- SQL (SQLite-compatible syntax; also runs on MySQL with minor syntax adjustments)
- Tested using SQLite Online (https://sqliteonline.com/)

## How to Run
1. Open [SQLite Online](https://sqliteonline.com/) or any SQL editor (MySQL Workbench, DB Browser for SQLite).
2. Copy the contents of `ecommerce_database.sql`.
3. Run the `CREATE TABLE` and `INSERT` statements first to set up the database.
4. Run each analysis query individually to view results.

## Author
Tarun Sai Gidijala
