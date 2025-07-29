#Retail Sales Analysis
create database sql_p1;

-- Create TABLE
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );
select * from retail_sales
limit 10;

SELECT COUNT(*) 
FROM retail_sales;

-- Cleaning the dataset
SELECT * FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;

DELETE FROM retail_sales
WHERE 
    transaction_id IS NULL
    OR
    sale_date IS NULL
    OR 
    sale_time IS NULL
    OR
    gender IS NULL
    OR
    category IS NULL
    OR
    quantity IS NULL
    OR
    cogs IS NULL
    OR
    total_sale IS NULL;
	
--##Data Exploration
--Unique Customers
SELECT COUNT(DISTINCT customer_id) as total_sale FROM retail_sales;

--Distinct Categories
SELECT DISTINCT category FROM retail_sales;

--#KPI'S

--Category Wise Total Sales
SELECT 
    category,
    SUM(total_sale) as net_sale,
    COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1;


--Best performing Month year wise By Average Sales 
SELECT 
       year,
       month,
    avg_sale
FROM 
(    
SELECT 
    EXTRACT(YEAR FROM sale_date) as year,
    EXTRACT(MONTH FROM sale_date) as month,
    AVG(total_sale) as avg_sale,
    RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
FROM retail_sales
GROUP BY 1, 2
) as t1
WHERE rank = 1;


--Top 10 customers by Highest Total Sales
SELECT 
    customer_id,
    SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;


--Transactions where category ='Beauty' and quantity sold > 3 in the month of Sept-2022
SELECT 
  *
FROM retail_sales
WHERE 
    category = 'Beauty'
    AND 
    TO_CHAR(sale_date, 'YYYY-MM') = '2022-09'
    AND
    quantity >= 3;


--Query to compute Sales made on a particular date
SELECT *
FROM retail_sales
WHERE sale_date = '2022-08-12';


--Average age of customers by Categories
SELECT category, 
    ROUND(AVG(age), 2) as avg_age
FROM retail_sales
GROUP BY category;


--Count of transactions made by each gender for every category
SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM retail_sales
GROUP 
    BY 
    category,
    gender
ORDER BY 1;


--Unique Customers For Each Category
SELECT category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retail_sales
GROUP BY category;


--Shift Wise Number of Orders
WITH hourly_sale
AS
(
SELECT *,
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END as shift
FROM retail_sales
)
SELECT 
    shift,
    COUNT(*) as total_orders    
FROM hourly_sale
GROUP BY shift;


