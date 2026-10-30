# QuickBite: Food Delivery Database (Oracle SQL)

QuickBite is a relational food delivery database system designed to manage customers, restaurants, menu items, orders, delivery partners, and customer reviews, built using Oracle SQL.

## Tools Used
- Oracle SQL
- Oracle SQL Developer

## Database Tables
1. Admin
2. Customer
3. Restaurant
4. Delivery_Partner
5. Menu_Item
6. Orders
7. Order_Item
8. Review

## What This Project Covers
- Table design with primary keys, foreign keys, unique constraints, and check constraints
- Sequences and triggers for auto-generated IDs
- Sample data for every table
- Analytical queries using joins, GROUP BY, aggregate functions, and ORDER BY

## Repository Files
- 01 to 08 `create` files: create each table (run these first, in order)
- `10_insert_sample_data.sql`: inserts sample data into all tables
- `20_queries.sql`: business queries on the data

## How to Run
1. Run the `01` to `08` files in order to create the tables.
2. Run `10_insert_sample_data.sql` to load the sample data.
3. Run `20_queries.sql` to see the results.

## Business Questions Answered
1. What are the total orders and total revenue for each restaurant?
2. How many orders has each customer placed, and how much have they spent?
3. Which menu items sell the most?
4. What is the average rating and number of reviews for each restaurant?
5. How many deliveries has each delivery partner handled, and what is the total order value?

## Author
Swati Gaddam
