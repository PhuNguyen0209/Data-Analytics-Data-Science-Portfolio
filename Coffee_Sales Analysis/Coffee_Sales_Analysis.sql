CREATE DATABASE coffee_sales_db;

USE coffee_sales_db;

DROP TABLE IF EXISTS coffee_shop_sales;
CREATE TABLE coffee_shop_sales (
  transaction_id      VARCHAR(20),
  transaction_date  VARCHAR(30),
  transaction_time  VARCHAR(30),
  transaction_qty     VARCHAR(20),
  store_id            VARCHAR(20),
  store_location      VARCHAR(100),
  product_id          VARCHAR(20),
  unit_price          VARCHAR(30),
  product_category    VARCHAR(100),
  product_type        VARCHAR(100),
  product_detail      VARCHAR(255)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Coffee Shop Sales.csv' INTO TABLE coffee_shop_sales
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

SELECT * 
FROM coffee_shop_sales;

-- Data Cleaning -- 

DESCRIBE coffee_shop_sales;

UPDATE coffee_shop_sales
SET transaction_date = STR_TO_Date(transaction_date, '%c/%e/%Y');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_date DATE;

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_id TEXT;

UPDATE coffee_shop_sales
SET transaction_time = STR_TO_Date(transaction_time, '%H:%i:%s');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_time TIME;

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_qty INT,
MODIFY COLUMN store_id INT,
MODIFY COLUMN store_location TEXT;

ALTER TABLE coffee_shop_sales
MODIFY COLUMN product_id INT,
MODIFY COLUMN unit_price DOUBLE,
MODIFY COLUMN product_category TEXT,
MODIFY COLUMN product_type TEXT,
MODIFY COLUMN product_detail TEXT;

-- Exploratory Data Analysis --

/* 1. Total Sales Analysis:
Calculate the total sales for each respective month.
Determine the month-on-month increase or decrease in sales.
Calculate the difference in sales between the selected month and the previous month. */

-- Total Sales for Respective months
SELECT 
	DATE_FORMAT(transaction_date, '%Y-%m') AS year_months,
	ROUND(SUM(unit_price * transaction_qty), 2) AS total_sales
FROM coffee_shop_sales
GROUP BY year_months
ORDER BY year_months;

-- Month on month difference in sales
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(transaction_date, '%Y-%m') AS year_months,
        ROUND(SUM(unit_price * transaction_qty), 2) AS total_sales
    FROM coffee_shop_sales
    GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
)
SELECT
    year_months,
    total_sales,
    total_sales - LAG(total_sales) OVER (ORDER BY year_months) AS sales_difference,
    ROUND(
        ( (total_sales - LAG(total_sales) OVER (ORDER BY year_months))
          / LAG(total_sales) OVER (ORDER BY year_months) ) * 100, 2
    ) AS pct_change
FROM monthly_sales;

-- pick the month you care about
SET @sel_month := '2023-03-01';   -- any day in the month is fine

-- Difference in sales between selected month and previous month
WITH monthly AS (
  SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS year_months,
    ROUND(SUM(unit_price * transaction_qty), 2) AS total_sales
  FROM coffee_shop_sales
  GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
),
with_prev AS (
  SELECT
    year_months,
    total_sales,
    LAG(total_sales) OVER (ORDER BY year_months) AS prev_month_sales
  FROM monthly
)
SELECT
  year_months,
  total_sales,
  prev_month_sales,
  total_sales - prev_month_sales AS sales_difference,
  ROUND((total_sales - prev_month_sales) / NULLIF(prev_month_sales, 0) * 100, 2) AS pct_change
FROM with_prev
WHERE year_months = DATE_FORMAT(@sel_month, '%Y-%m');


/* 2. Total Orders Analysis:
Calculate the total number of orders for each respective month.
Determine the month-on-month increase or decrease in the number of orders.
Calculate the difference in the number of orders between the selected month and the previous month. */

-- Total numbers of orders each month -- 
SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS year_months,
    COUNT(transaction_id) AS total_orders
FROM coffee_shop_sales
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
ORDER BY year_months;

-- Month on Month increase or decrease
WITH monthly_orders AS (
    SELECT
        DATE_FORMAT(transaction_date, '%Y-%m') AS year_months,
        COUNT(transaction_id) AS total_orders
    FROM coffee_shop_sales
    GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
)
SELECT
    year_months,
    total_orders,
    total_orders - LAG(total_orders) OVER (ORDER BY year_months) AS order_difference,
    ROUND(
        ( (total_orders - LAG(total_orders) OVER (ORDER BY year_months))
          / LAG(total_orders) OVER (ORDER BY year_months) ) * 100, 2
    ) AS pct_change
FROM monthly_orders
ORDER BY year_months;

-- Difference between the selected month and the previous month --
-- set your target month
SET @sel_month := '2023-04-01';

WITH monthly_orders AS (
  SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS year_months,
    COUNT(transaction_id) AS total_orders
  FROM coffee_shop_sales
  GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
),
with_prev AS (
  SELECT
    year_months,
    total_orders,
    LAG(total_orders) OVER (ORDER BY year_months) AS prev_month_orders
  FROM monthly_orders
)
SELECT
  year_months,
  total_orders,
  prev_month_orders,
  total_orders - prev_month_orders AS order_difference,
  ROUND((total_orders - prev_month_orders) / NULLIF(prev_month_orders, 0) * 100, 2) AS pct_change
FROM with_prev
WHERE year_months = DATE_FORMAT(@sel_month, '%Y-%m');

/* 3. Total Quantity Sold Analysis:
Calculate the total quantity sold for each respective month.
Determine the month-on-month increase or decrease in the total quantity sold.
Calculate the difference in the total quantity sold between the selected month and the previous month. */

-- Total quantity sold each month --
SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS year_months,
    SUM(transaction_qty) AS total_qty
FROM coffee_shop_sales
GROUP BY year_months
ORDER BY year_months;

-- Month on month increase or decreasein quantity sold -- 
WITH monthly_qty AS (
  SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS year_months,
    SUM(transaction_qty) AS total_qty
  FROM coffee_shop_sales
  GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
)
SELECT
  year_months,
  total_qty,
  total_qty - LAG(total_qty) OVER (ORDER BY year_months) AS qty_diff,
  ROUND(
    (total_qty - LAG(total_qty) OVER (ORDER BY year_months))
    / NULLIF(LAG(total_qty) OVER (ORDER BY year_months), 0) * 100, 2
  ) AS pct_change
FROM monthly_qty
ORDER BY year_months;

-- Difference in quantity ordered of selected month and previous month --
-- pick any date inside the month you want to compare --
SET @sel_month := '2023-04-01';

WITH monthly_qty AS (
  SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS year_months,
    SUM(transaction_qty) AS total_qty
  FROM coffee_shop_sales
  GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
),
with_month_prev AS (
  SELECT
    year_months,
    total_qty,
    LAG(total_qty) OVER (ORDER BY year_months) AS prev_month_qty
  FROM monthly_qty
)
SELECT
  year_months,
  total_qty,
  prev_month_qty,
  total_qty - prev_month_qty AS qty_diff,
  ROUND((total_qty - prev_month_qty) / NULLIF(prev_month_qty, 0) * 100, 2) AS pct_change
FROM with_month_prev
WHERE year_months = DATE_FORMAT(@sel_month, '%Y-%m');

-- Metrics for each day --
SELECT *
FROM coffee_shop_sales;

SELECT 
	CONCAT(ROUND(SUM(unit_price * transaction_qty)/1000,2), 'K') AS total_sales,
    CONCAT(ROUND(SUM(transaction_qty)/1000,2), 'K') AS total_qty_sold,
    CONCAT(ROUND(COUNT(transaction_id)/1000,2), 'K') AS total_orders
FROM coffee_shop_sales
WHERE transaction_date = '2023-03-27';

-- Data for weeekends and weekdays --
SELECT
  CASE WHEN DAYOFWEEK(transaction_date) IN (1,7) THEN 'Weekend' ELSE 'Weekday' END AS day_type,
  ROUND(SUM(unit_price * transaction_qty), 2) AS total_sales,
  COUNT(transaction_id) AS total_orders,
  SUM(transaction_qty) AS total_qty,
  ROUND(SUM(unit_price * transaction_qty) / NULLIF(COUNT(transaction_id),0), 2) AS avg_order_value
FROM coffee_shop_sales
GROUP BY day_type
ORDER BY day_type;

-- Sales by store locations each month--
SELECT
  store_location,
  DATE_FORMAT(transaction_date, '%Y-%m') AS year_months,
  ROUND(SUM(unit_price * transaction_qty), 2) AS total_sales,
  COUNT(transaction_id) AS total_orders,
  SUM(transaction_qty) AS total_qty
FROM coffee_shop_sales
GROUP BY store_location, DATE_FORMAT(transaction_date, '%Y-%m')
ORDER BY store_location, year_months;

-- Month on month per location with selected month only -- 
-- choose any date inside the month you want to analyze
SET @sel_month := '2023-02-01';

WITH loc_monthly AS (
  SELECT
    store_location,
    DATE_FORMAT(transaction_date, '%Y-%m') AS year_months,
    ROUND(SUM(unit_price * transaction_qty), 2) AS total_sales
  FROM coffee_shop_sales
  GROUP BY store_location, DATE_FORMAT(transaction_date, '%Y-%m')
),
with_prev AS (
  SELECT
    store_location,
    year_months,
    total_sales,
    LAG(total_sales) OVER (PARTITION BY store_location ORDER BY year_months) AS prev_sales
  FROM loc_monthly
)
SELECT
  store_location,
  year_months,
  total_sales,
  prev_sales,
  total_sales - prev_sales AS diff_sales,
  ROUND((total_sales - prev_sales) / NULLIF(prev_sales, 0) * 100, 2) AS pct_change,
  CASE
    WHEN prev_sales IS NULL THEN 'N/A'
    WHEN total_sales > prev_sales THEN 'Increase'
    WHEN total_sales < prev_sales THEN 'Decrease'
    ELSE 'No change'
  END AS trend
FROM with_prev
WHERE year_months = DATE_FORMAT(@sel_month, '%Y-%m')
ORDER BY store_location;

-- Baseline average sales for each month, to later visualize as a line to see which day of the month is below that threshold
	SELECT 
		CONCAT(ROUND(AVG(total_sales)/1000,2), 'K') as avg_sales
	FROM 
		(SELECT SUM(transaction_qty * unit_price) AS total_sales
		FROM coffee_shop_sales
		WHERE MONTH(transaction_date) = 5
        GROUP BY transaction_date
		) AS internal_query;
	
    -- Sales of each day of a selected month --
	SELECT 
		DAY(transaction_date) AS day_of_month,
        CONCAT(ROUND(SUM(transaction_qty * unit_price)/1000,3), 'K') as total_sales
	FROM coffee_shop_sales
    WHERE MONTH(transaction_date) = 5
    GROUP BY day_of_month
    ORDER BY day_of_month;
    
    -- compare each day's performance to see if it is below or above the average --
    WITH daily_sales AS (
    SELECT 
        transaction_date,
        ROUND(SUM(transaction_qty * unit_price), 2) AS total_sales
    FROM coffee_shop_sales
    WHERE MONTH(transaction_date) = 5   
    GROUP BY transaction_date
),
avg_sales AS (
    SELECT ROUND(AVG(total_sales), 2) AS avg_sales
    FROM (
        SELECT SUM(transaction_qty * unit_price) AS total_sales
        FROM coffee_shop_sales
        WHERE MONTH(transaction_date) = 5
        GROUP BY transaction_date
    ) AS t
)
SELECT 
    d.transaction_date,
    d.total_sales,
    a.avg_sales,
    CASE 
        WHEN d.total_sales > a.avg_sales THEN 'Above Average'
        WHEN d.total_sales < a.avg_sales THEN 'Below Average'
        ELSE 'Equal to Average'
    END AS performance
FROM daily_sales d
CROSS JOIN avg_sales a
ORDER BY d.transaction_date;

-- Sales by each product category-- 
SELECT
    product_category,
    ROUND(SUM(transaction_qty * unit_price), 2) AS total_sales,
    COUNT(transaction_id) AS total_orders,
    SUM(transaction_qty) AS total_quantity
FROM coffee_shop_sales
GROUP BY product_category
ORDER BY total_sales DESC;

-- Top 10 products by sales --
SELECT
    product_type,
    ROUND(SUM(transaction_qty * unit_price), 2) AS total_sales,
    SUM(transaction_qty) AS total_quantity,
    COUNT(transaction_id) AS total_orders
FROM coffee_shop_sales
GROUP BY product_type
ORDER BY total_sales DESC
LIMIT 10;

-- Sales Analysis for Days and hours for selected month --
SELECT
    DAYNAME(transaction_date) AS day_name,
    HOUR(transaction_time) AS hour_of_day,
    ROUND(SUM(transaction_qty * unit_price), 2) AS total_sales,
    COUNT(transaction_id) AS total_orders,
    SUM(transaction_qty) AS total_quantity
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5
GROUP BY day_name, hour_of_day
ORDER BY FIELD(day_name, 'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'),
         hour_of_day;
         
-- Sales Analysis for Days of the Week for a selected month --
SET @sel_month := '2023-05-01';

SELECT
    DAYNAME(transaction_date) AS day_name,
    WEEKDAY(transaction_date) AS weekday_index,  -- 0=Monday … 6=Sunday
    ROUND(SUM(transaction_qty * unit_price), 2) AS total_sales,
    COUNT(transaction_id) AS total_orders,
    SUM(transaction_qty)  AS total_quantity
FROM coffee_shop_sales
WHERE transaction_date >= DATE_FORMAT(@sel_month, '%Y-%m-01')
  AND transaction_date <  DATE_ADD(DATE_FORMAT(@sel_month, '%Y-%m-01'), INTERVAL 1 MONTH)
GROUP BY weekday_index, day_name
ORDER BY weekday_index;
