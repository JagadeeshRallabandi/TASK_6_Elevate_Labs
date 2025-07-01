use sales_trend_db;
CREATE TABLE sales_data (
    transaction_id INT,
    date DATE,
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_revenue DECIMAL(10,2),
    region VARCHAR(50),
    payment_method VARCHAR(50)
);

 -- 1. Monthly Revenue and Transaction Volume
SELECT 
    YEAR(date) AS year,
    MONTH(date) AS month,
    SUM(total_revenue) AS monthly_revenue,
    COUNT(DISTINCT transaction_id) AS transaction_volume
FROM 
    sales_data
GROUP BY 
    YEAR(date), MONTH(date)
ORDER BY 
    year, month;
-- Total Revenue by Product Category
SELECT 
    product_category,
    SUM(total_revenue) AS category_revenue
FROM 
    sales_data
GROUP BY 
    product_category
ORDER BY 
    category_revenue DESC;



--  4. Revenue and Transactions for February 2024
SELECT 
    SUM(total_revenue) AS february_revenue,
    COUNT(DISTINCT transaction_id) AS february_transactions
FROM 
    sales_data
WHERE 
    YEAR(date) = 2024 AND MONTH(date) = 2;

-- 5. Monthly Transaction Volume for Each Region
SELECT 
    region,
    YEAR(date) AS year,
    MONTH(date) AS month,
    COUNT(DISTINCT transaction_id) AS transaction_volume
FROM 
    sales_data
GROUP BY 
    region, YEAR(date), MONTH(date)
ORDER BY 
    region, year, month;

INSERT INTO sales_data
(transaction_id, date, product_category, product_name, units_sold, unit_price, total_revenue, region, payment_method)
VALUES
(10001, '2024-01-01', 'Electronics', 'iPhone 14 Pro', 2, 999.99, 1999.98, 'North America', 'Credit Card'),
(10002, '2024-01-02', 'Home Appliances', 'Dyson V11 Vacuum', 1, 499.99, 499.99, 'Europe', 'PayPal'),
(10003, '2024-01-03', 'Clothing', 'Levi''s 501 Jeans', 3, 69.99, 209.97, 'Asia', 'Debit Card'),
(10004, '2024-01-04', 'Books', 'The Da Vinci Code', 4, 15.99, 63.96, 'North America', 'Credit Card'),
(10005, '2024-01-05', 'Beauty Products', 'Neutrogena Skincare Set', 1, 89.99, 89.99, 'Europe', 'PayPal'),
(10006, '2024-01-06', 'Sports', 'Wilson Evolution Basketball', 5, 29.99, 149.95, 'Asia', 'Credit Card'),
(10007, '2024-01-07', 'Electronics', 'MacBook Pro 16-inch', 1, 2499.99, 2499.99, 'North America', 'Credit Card'),
(10008, '2024-01-08', 'Home Appliances', 'Blueair Classic 480i', 2, 599.99, 1199.98, 'Europe', 'PayPal'),
(10009, '2024-01-09', 'Clothing', 'Nike Air Force 1', 6, 89.99, 539.94, 'Asia', 'Debit Card'),
(10010, '2024-01-10', 'Books', 'Dune by Frank Herbert', 2, 25.99, 51.98, 'North America', 'Credit Card'),
(10011, '2024-01-11', 'Beauty Products', 'Chanel No. 5 Perfume', 1, 129.99, 129.99, 'Europe', 'PayPal'),
(10012, '2024-01-12', 'Sports', 'Babolat Pure Drive Tennis Racket', 3, 199.99, 599.97, 'Asia', 'Credit Card'),
(10013, '2024-01-13', 'Electronics', 'Samsung Galaxy Tab S8', 2, 749.99, 1499.98, 'North America', 'Credit Card'),
(10014, '2024-01-14', 'Home Appliances', 'Keurig K-Elite Coffee Maker', 1, 189.99, 189.99, 'Europe', 'PayPal'),
(10015, '2024-01-15', 'Clothing', 'North Face Down Jacket', 2, 249.99, 499.98, 'Asia', 'Debit Card'),
(10016, '2024-01-16', 'Books', 'Salt, Fat, Acid, Heat by Samin Nosrat', 3, 35.99, 107.97, 'North America', 'Credit Card'),
(10017, '2024-01-17', 'Beauty Products', 'Dyson Supersonic Hair Dryer', 1, 399.99, 399.99, 'Europe', 'PayPal'),
(10018, '2024-01-18', 'Sports', 'Manduka PRO Yoga Mat', 4, 119.99, 479.96, 'Asia', 'Credit Card'),
(10019, '2024-01-19', 'Electronics', 'Garmin Forerunner 945', 2, 499.99, 999.98, 'North America', 'Credit Card'),
(10020, '2024-01-20', 'Home Appliances', 'Ninja Professional Blender', 1, 99.99, 99.99, 'Europe', 'PayPal'),
(10021, '2024-01-21', 'Clothing', 'Zara Summer Dress', 3, 59.99, 179.97, 'Asia', 'Debit Card'),
(10022, '2024-01-22', 'Books', 'Gone Girl by Gillian Flynn', 2, 22.99, 45.98, 'North America', 'Credit Card'),
(10023, '2024-01-23', 'Beauty Products', 'Olay Regenerist Face Cream', 1, 49.99, 49.99, 'Europe', 'PayPal'),
(10024, '2024-01-24', 'Sports', 'Adidas FIFA World Cup Football', 3, 29.99, 89.97, 'Asia', 'Credit Card'),
(10025, '2024-01-25', 'Electronics', 'Bose QuietComfort 35 Headphones', 1, 299.99, 299.99, 'North America', 'Credit Card'),
(10026, '2024-01-26', 'Home Appliances', 'Panasonic NN-SN966S Microwave', 1, 179.99, 179.99, 'Europe', 'PayPal'),
(10027, '2024-01-27', 'Clothing', 'Adidas Ultraboost Shoes', 2, 179.99, 359.98, 'Asia', 'Debit Card'),
(10028, '2024-01-28', 'Books', 'Pride and Prejudice by Jane Austen', 3, 12.99, 38.97, 'North America', 'Credit Card'),
(10029, '2024-01-29', 'Beauty Products', 'MAC Ruby Woo Lipstick', 1, 29.99, 29.99, 'Europe', 'PayPal'),
(10030, '2024-01-30', 'Sports', 'Nike Air Zoom Pegasus 37', 2, 129.99, 259.98, 'Asia', 'Credit Card'),
(10031, '2024-01-31', 'Electronics', 'Sony WH-1000XM4 Headphones', 2, 349.99, 699.98, 'North America', 'Credit Card'),
(10032, '2024-02-01', 'Home Appliances', 'Instant Pot Duo', 3, 89.99, 269.97, 'Europe', 'PayPal'),
(10033, '2024-02-02', 'Clothing', 'Under Armour HeatGear T-Shirt', 5, 29.99, 149.95, 'Asia', 'Debit Card'),
(10034, '2024-02-03', 'Books', '1984 by George Orwell', 4, 19.99, 79.96, 'North America', 'Credit Card'),
(10035, '2024-02-04', 'Beauty Products', 'L''Oreal Revitalift Serum', 2, 39.99, 79.98, 'Europe', 'PayPal'),
(10036, '2024-02-05', 'Sports', 'Peloton Bike', 1, 1895.0, 1895.0, 'Asia', 'Credit Card'),
(10037, '2024-02-06', 'Electronics', 'Apple Watch Series 8', 3, 399.99, 1199.97, 'North America', 'Credit Card'),
(10038, '2024-02-07', 'Home Appliances', 'Roomba i7+', 2, 799.99, 1599.98, 'Europe', 'PayPal'),
(10039, '2024-02-08', 'Clothing', 'Columbia Fleece Jacket', 4, 59.99, 239.96, 'Asia', 'Debit Card'),
(10040, '2024-02-09', 'Books', 'Harry Potter and the Sorcerer''s Stone', 3, 24.99, 74.97, 'North America', 'Credit Card'),
(10041, '2024-02-10', 'Beauty Products', 'Estee Lauder Advanced Night Repair', 1, 105.0, 105.0, 'Europe', 'PayPal'),
(10042, '2024-02-11', 'Sports', 'Fitbit Charge 5', 2, 129.99, 259.98, 'Asia', 'Credit Card'),
(10043, '2024-02-12', 'Electronics', 'GoPro HERO10 Black', 3, 399.99, 1199.97, 'North America', 'Credit Card'),
(10044, '2024-02-13', 'Home Appliances', 'Nespresso VertuoPlus', 1, 199.99, 199.99, 'Europe', 'PayPal'),
(10045, '2024-02-14', 'Clothing', 'Patagonia Better Sweater', 2, 139.99, 279.98, 'Asia', 'Debit Card'),
(10046, '2024-02-15', 'Books', 'Becoming by Michelle Obama', 4, 32.5, 130.0, 'North America', 'Credit Card'),
(10047, '2024-02-16', 'Beauty Products', 'Clinique Moisture Surge', 1, 52.0, 52.0, 'Europe', 'PayPal'),
(10048, '2024-02-17', 'Sports', 'Yeti Rambler Tumbler', 6, 39.99, 239.94, 'Asia', 'Credit Card'),
(10049, '2024-02-18', 'Electronics', 'Kindle Paperwhite', 2, 129.99, 259.98, 'North America', 'Credit Card');


