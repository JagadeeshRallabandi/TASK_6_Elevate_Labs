# 📊 Task 6: Sales Trend Analysis Using Aggregations

This project is part of the Data Analyst Internship and focuses on analyzing monthly sales trends using SQL aggregations.

---

## 📁 Dataset

The dataset consists of 49 transactions from an e-commerce platform. Each row contains:
- Transaction ID
- Date
- Product Category & Name
- Units Sold
- Unit Price
- Total Revenue
- Region
- Payment Method

---

## 🏗️ Database Setup

### Step 1: Create the Table

```sql
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
```

### Step 2: Insert Data

Run the bulk insert script:

```sql
SOURCE bulk_insert_sales_data.sql;
```

---

## 🔍 Analysis Queries

### 1. Monthly Revenue and Transaction Volume

```sql
SELECT
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(MONTH FROM date) AS month,
    SUM(total_revenue) AS monthly_revenue,
    COUNT(DISTINCT transaction_id) AS transaction_volume
FROM
    sales_data
GROUP BY
    EXTRACT(YEAR FROM date), EXTRACT(MONTH FROM date)
ORDER BY
    year, month;
```

### 2. Top 3 Months by Revenue

```sql
SELECT
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(MONTH FROM date) AS month,
    SUM(total_revenue) AS monthly_revenue
FROM
    sales_data
GROUP BY
    EXTRACT(YEAR FROM date), EXTRACT(MONTH FROM date)
ORDER BY
    monthly_revenue DESC
LIMIT 3;
```

---

## 🎯 Learnings

- How to group data by month/year using `EXTRACT()`
- Use of aggregate functions like `SUM()` and `COUNT(DISTINCT)`
- Sorting and filtering results with `ORDER BY` and `LIMIT`
- Efficient bulk insert into SQL tables

---

## 📌 Submission

Includes:
- `sales_data.csv` (raw data)
- `bulk_insert_sales_data.sql` (insert script)
- SQL analysis queries
- `README.md` (this file)

