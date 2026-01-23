create database Zepto_sql;                                                                                                                
               
use Zepto_sql;                                                                                                          

CREATE TABLE products (
    Category VARCHAR(100),                          
    name VARCHAR(150),                                                                   
    mrp INT,                                                             
    discountPercent INT,
    availableQuantity INT,
    discountedSellingPrice INT,
    weightInGms INT,
    outOfStock VARCHAR(10),                                           
    quantity INT                                   
);                                                          


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/zepto_v2.csv'                                                    
INTO TABLE products
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS ;                                       

SELECT COUNT(*) FROM products;

create table zepto_V1 like zepto_V2;



SELECT COUNT(*) AS v1_rows FROM zepto_v1;
SELECT COUNT(*) AS v2_rows FROM zepto_v2;


---- =====================
---  Zepto Analysis Project
--- Author: Dev Aditya
---- ======================

-- data Exploration

-- Count of rows

select count(*) from zepto_v2;
select count(*) from zepto_v1;

-- Sample data

select * from zepto_v1
union all
select * from zepto_v2
limit 10 ;


-- Null values                                  

select * from zepto_V2
where Name is null                                          
or                 
category is null
or
mrp is null
or
discountPercent is null
or
availableQuantity is null
or
discountedSellingPrice is null
or
weightInGms is null
or
outofstock is null
or
quantity is null;


select * from zepto_V1
where Name is null
or
category is null
or
mrp is null
or
discountPercent is null
or
availableQuantity is null
or
discountedSellingPrice is null
or
weightInGms is null
or
outofstock is null
or
quantity is null;



-- SOURCE | Null_rows
--   V1       0
--   V2       0

---- =================================

-- different product Categories

select distinct Category
from products
order by Category;


-- Product in stock vs out of stock

select outofstock, count(*)
from products
group by outofstock;

-- Out-of-stock percentage

SELECT 
  ROUND(SUM(outOfStock = 'TRUE') / COUNT(*) * 100, 2) AS out_of_stock_percent
FROM products;                                                                  


-- Total categories

SELECT COUNT(DISTINCT Category) AS total_categories
FROM products;

-- Products per category

SELECT Category, COUNT(*) AS product_count
FROM products
GROUP BY Category
ORDER BY product_count DESC;

-- Top 10 expensive products

SELECT Name, discountedSellingPrice/100 AS price
FROM products
ORDER BY discountedSellingPrice DESC
LIMIT 10;

-- Discount distribution

SELECT discountPercent, COUNT(*) AS products
FROM products
GROUP BY discountPercent
ORDER BY discountPercent DESC;

-- Avg discount per category

SELECT Category, ROUND(AVG(discountPercent),2) AS avg_discount
FROM products
GROUP BY Category
ORDER BY avg_discount DESC;

--- =========================================

-- DATA CLEANING

-- checking duduplicates

SELECT Name, Category, COUNT(*) AS duplicate_count
FROM products                        
GROUP BY Name, Category
HAVING COUNT(*) > 1;

SELECT *
FROM products
WHERE (Name, Category) IN (
    SELECT Name, Category
    FROM products
    GROUP BY Name, Category
    HAVING COUNT(*) > 1
)
ORDER BY Name, Category;

-- Check for invalid MRP values

SELECT *
FROM products
WHERE mrp <= 0;

DELETE
FROM products
WHERE mrp = 0;


-- Converting paise to rupees

UPDATE products
SET 
    mrp = mrp / 100,
    discountedSellingPrice = discountedSellingPrice / 100;

SELECT Name, mrp,discountedSellingPrice
FROM products
LIMIT 10;

--- =======================
-- Business Insights
--- =======================

-- Category Performance — Where is the money?

SELECT 
    Category,
    COUNT(*) AS total_products,
    SUM(availableQuantity) AS total_units,
    ROUND(SUM(availableQuantity * discountedsellingprice), 2) AS revenue_potential
FROM products
GROUP BY Category
ORDER BY revenue_potential DESC;


-- Top 10 Most Expensive Products

SELECT Name, Category, discountedSellingPrice
FROM products
ORDER BY discountedSellingPrice DESC
LIMIT 10;

-- Discount Effectiveness

SELECT 
    discountPercent,
    COUNT(*) AS product_count,
    ROUND(AVG(availableQuantity),2) AS avg_stock
FROM products
GROUP BY discountPercent
ORDER BY discountPercent DESC;

-- Dead Inventory — stock not moving

SELECT Name, Category, discountedSellingPrice
FROM products
WHERE availableQuantity > 100 AND discountPercent = 0;


--- ======================
-- Advanced Business Questions
--- ======================

-- Top 10 Best-Value Products (by Discount %)

SELECT Name, Category, mrp, discountedSellingPrice, discountPercent
FROM products
ORDER BY discountPercent DESC
LIMIT 10;


-- High MRP but Out of Stock Products

SELECT Name, Category, mrp, discountedSellingPrice
FROM products
WHERE mrp > 500 AND outOfStock = 'TRUE'
ORDER BY mrp DESC;

-- Estimated Revenue per Category

SELECT 
    Category,
    ROUND(SUM(availableQuantity * discountedSellingPrice), 2) AS estimated_revenue
FROM products
GROUP BY Category
ORDER BY estimated_revenue DESC;

-- Top 5 Categories by Average Discount

SELECT Category, ROUND(AVG(discountPercent),2) AS avg_discount
FROM products
GROUP BY Category
ORDER BY avg_discount DESC
LIMIT 5;

-- Product Size Segmentation (Low / Medium / Bulk)

SELECT 
    CASE 
        WHEN weightInGms < 500 THEN 'Low'
        WHEN weightInGms BETWEEN 500 AND 2000 THEN 'Medium'
        ELSE 'Bulk'
    END AS product_size,
    COUNT(*) AS product_count
FROM products
GROUP BY product_size;





