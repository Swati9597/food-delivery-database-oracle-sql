-- Queries for QuickBite food delivery database

-- Query 1: Total number of orders and total revenue for each restaurant
SELECT
    r.Restaurant_Name,
    COUNT(o.Order_ID) AS Total_Orders,
    SUM(o.Total_Amount) AS Total_Revenue
FROM Restaurant r
JOIN Orders o
    ON r.Restaurant_ID = o.Restaurant_ID
GROUP BY r.Restaurant_Name
ORDER BY Total_Revenue DESC;



-- Query 2: Total orders and total amount spent by each customer
SELECT
    c.Full_Name,
    COUNT(o.Order_ID) AS Total_Orders,
    SUM(o.Total_Amount) AS Total_Spent
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY c.Full_Name
ORDER BY Total_Spent DESC;



-- Query 3: Most ordered menu items with total quantity sold
SELECT
    m.Item_Name,
    SUM(oi.Quantity) AS Total_Quantity_Sold,
    SUM(oi.Sub_Total) AS Total_Sales
FROM Menu_Item m
JOIN Order_Item oi
    ON m.Menu_Item_ID = oi.Menu_Item_ID
GROUP BY m.Item_Name
ORDER BY Total_Quantity_Sold DESC;



-- Query 4: Average rating and number of reviews for each restaurant
SELECT
    r.Restaurant_Name,
    COUNT(rv.Review_ID) AS Total_Reviews,
    ROUND(AVG(rv.Rating), 2) AS Average_Rating
FROM Restaurant r
JOIN Orders o
    ON r.Restaurant_ID = o.Restaurant_ID
JOIN Review rv
    ON o.Order_ID = rv.Order_ID
GROUP BY r.Restaurant_Name
ORDER BY Average_Rating DESC;



-- Query 5: Number of deliveries and total order value handled by each delivery partner
SELECT
    d.Full_Name,
    d.Vehicle_Type,
    COUNT(o.Order_ID) AS Total_Deliveries,
    SUM(o.Total_Amount) AS Total_Order_Value
FROM Delivery_Partner d
JOIN Orders o
    ON d.Delivery_Partner_ID = o.Delivery_Partner_ID
GROUP BY d.Full_Name, d.Vehicle_Type
ORDER BY Total_Deliveries DESC;