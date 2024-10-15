-- 1. Liquor Sales Measures

-- 1.1 Sales $: Analyze the total sales revenue generated from liquor sales.
SELECT SUM(SALE_DOLLARS) AS TotalSales
FROM EDW.FACT_LIQUOR_SALES;

-- 1.2 Sales volume (gallons): Determine the total volume of liquor sold in gallons.
SELECT SUM(VOLUME_SOLD_IN_GALLONS) AS TotalVolumeGallons
FROM EDW.FACT_LIQUOR_SALES;

SELECT SUM(CAST([Volume Sold (Gallons)] AS FLOAT)) AS TotalVolumeGallons
FROM stage.STG_IOWA_LIQUOR_SALES;

-- 1.3 Sales volume (bottles): Determine the total number of liquor bottles sold.
SELECT SUM(BOTTLE_SOLD) AS TotalBottlesSold
FROM EDW.FACT_LIQUOR_SALES;

SELECT SUM(CAST([Bottles Sold] AS INT)) AS TotalBottlesSold
FROM stage.STG_IOWA_LIQUOR_SALES;

-- 1.4 Gross profit (retail price – cost): Calculate the gross profit by subtracting the cost from the retail price.
SELECT 
    SUM((ITEM.STATE_BOTTLE_RETAIL_IN_DOLLARS - ITEM.STATE_BOTTLE_COST_IN_DOLLARS) * SALES.BOTTLE_SOLD) AS GrossProfit
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_ITEM ITEM ON SALES.DIM_ITEM_SK = ITEM.DIM_ITEM_SK;


SELECT 
    SUM(
        (CAST(REPLACE([State Bottle Retail], '$', '') AS FLOAT) - 
         CAST(REPLACE([State Bottle Cost], '$', '') AS FLOAT)) * 
        CAST([Bottles Sold] AS INT)
    ) AS TotalGrossProfit
FROM 
    stage.STG_IOWA_LIQUOR_SALES;


-- 1.5 Sales $ per Capita: Analyze sales revenue per capita.
SELECT 
    CITY.CITY_NAME,
    SALES_BY_CITY_YEAR.YEAR,
    (SALES_BY_CITY_YEAR.TotalSalesDollars / POP.TOTAL_POPULATION) AS SalesPerCapita
FROM 
    (
        SELECT 
            SALES.DIM_CITY_SK,
             DATE.[year] AS YEAR,
            SUM(SALES.SALE_DOLLARS) AS TotalSalesDollars
        FROM 
            EDW.FACT_LIQUOR_SALES SALES
        JOIN 
            EDW.DIM_DATE DATE ON SALES.INVOICE_DATE = DATE.DIM_DATE_KEY
        GROUP BY 
            SALES.DIM_CITY_SK, 
            DATE.[year]
    ) AS SALES_BY_CITY_YEAR
JOIN 
    EDW.DIM_CITY CITY ON SALES_BY_CITY_YEAR.DIM_CITY_SK = CITY.DIM_CITY_SK
JOIN 
    EDW.FACT_CITY_YEARLY POP ON CITY.DIM_CITY_SK = POP.DIM_CITY_SK AND SALES_BY_CITY_YEAR.YEAR = POP.YEAR;










-- 2. Liquor Sales by Time

-- 2.1 Total: Calculate the total liquor sales over the entire dataset.
SELECT SUM(SALE_DOLLARS) AS TotalSales
FROM EDW.FACT_LIQUOR_SALES;



-- 2.2 Year: Analyze liquor sales by year.
SELECT 
    DATE.[year] AS Year, 
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_DATE DATE ON SALES.INVOICE_DATE = DATE.dim_date_key
GROUP BY 
    DATE.[year];





-- 2.3 Year, Month: Analyze liquor sales by both year and month.
SELECT 
    date.[year] AS Year, 
    date.month_name AS Month, 
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_DATE DATE ON SALES.INVOICE_DATE = DATE.dim_date_key
GROUP BY 
    date.[year],date.month_name;
	
	
	
	
	

-- 2.4 Year over Year (YoY): Perform a year-over-year comparison of liquor sales to identify trends.
SELECT 
    DATE.[year] AS Year, 
    SUM(SALE_DOLLARS) AS TotalSales,
    SUM(SALE_DOLLARS) - LAG(SUM(SALE_DOLLARS)) OVER (ORDER BY DATE.[year]) AS YoYChange
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_DATE DATE ON SALES.INVOICE_DATE = DATE.dim_date_key
GROUP BY DATE.[year]; 










-- 3. Liquor Sales by Dimension

-- 3.1 Store: Analyze liquor sales by individual store.
SELECT 
    CATEGORY.CATEGORY_NAME,
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_CATEGORY CATEGORY ON SALES.DIM_CATEGORY_SK = CATEGORY.DIM_CATEGORY_SK
GROUP BY 
    CATEGORY.CATEGORY_NAME;
	
	
-- 3.2 County: Analyze liquor sales by county.
SELECT 
    COUNTY.COUNTY_NAME,
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_COUNTY COUNTY ON SALES.DIM_COUNTRY_SK = COUNTY.DIM_COUNTRY_SK
GROUP BY 
    COUNTY.COUNTY_NAME;

-- 3.3 City: Analyze liquor sales by city.
SELECT 
    CITY.CITY_NAME,
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_CITY CITY ON SALES.DIM_CITY_SK = CITY.DIM_CITY_SK
GROUP BY 
    CITY.CITY_NAME;

-- 3.4 Category: Analyze liquor sales by category (e.g., vodka, whiskey).
SELECT 
    CATEGORY.CATEGORY_NAME,
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_CATEGORY CATEGORY ON SALES.DIM_CATEGORY_SK = CATEGORY.DIM_CATEGORY_SK
GROUP BY 
    CATEGORY.CATEGORY_NAME;

-- 3.5 Item: Analyze liquor sales by specific item (e.g., specific brands or products).
SELECT 
    ITEM.ITEM_DESCRIPTION,
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_ITEM ITEM ON SALES.DIM_ITEM_SK = ITEM.DIM_ITEM_SK
GROUP BY 
    ITEM.ITEM_DESCRIPTION;

-- 3.6 Vendor: Analyze liquor sales by vendor (the company supplying the liquor).
SELECT 
    VENDOR.VENDOR_NAME,
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_VENDOR VENDOR ON SALES.DIM_VENDOR_SK = VENDOR.DIM_VENDOR_SK
GROUP BY 
    VENDOR.VENDOR_NAME;
	
	
	
	
	
	
	

-- 4. Overall Consumption of Liquor Year-wise

-- 4.1 Overall Consumption: Write inferences on the year-wise consumption trends of liquor.
SELECT 
    DATE.[year] AS Year, 
    SUM(VOLUME_SOLD_IN_GALLONS) AS TotalConsumption
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_DATE DATE ON SALES.INVOICE_DATE = DATE.dim_date_key
GROUP BY 
    DATE.[year];








-- 5. Most Popular Liquor Types

-- 5.1 Which type of spirit/liquor had more sales? Identify the liquor type with the most sales.
 SELECT TOP 1
    CATEGORY.CATEGORY_NAME,
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_CATEGORY CATEGORY ON SALES.DIM_CATEGORY_SK = CATEGORY.DIM_CATEGORY_SK
GROUP BY 
    CATEGORY.CATEGORY_NAME
ORDER BY 
    TotalSales DESC;   





-- 5.2 Top 3 names: Identify the top 3 liquor types or brands by sales.
SELECT TOP 3
    ITEM.ITEM_DESCRIPTION,
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_ITEM ITEM ON SALES.DIM_ITEM_SK = ITEM.DIM_ITEM_SK
GROUP BY 
    ITEM.ITEM_DESCRIPTION
ORDER BY 
    TotalSales DESC;
	
	
	
	
	
	
	
	
	

-- 6. Bottle Size Preferences

-- 6.1 What bottle size is favorable? Determine which bottle size had the most sales.
SELECT 

TOP 1
    ITEM.BOTTLE_VOLUME_IN_ML,
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_ITEM ITEM ON SALES.DIM_ITEM_SK = ITEM.DIM_ITEM_SK
GROUP BY 
    ITEM.BOTTLE_VOLUME_IN_ML
ORDER BY 
    TotalSales DESC
;






-- 7. Liquor Sales by Specific Metrics

-- 7.1 Yearly sales including 2024 YTD: Analyze liquor sales on a yearly basis, including data up to 2024.
SELECT 
    DATE.[year] AS Year, 
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_DATE DATE ON SALES.INVOICE_DATE = DATE.dim_date_key
WHERE 
    DATE.[year]  <= 2024
GROUP BY 
    DATE.[year] ;
	
	
	
	

-- 7.2 Top 20 stores (all-time): Identify the top 20 stores based on all-time liquor sales.
SELECT 
TOP 20
    STORE.STORE_NAME,
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_STORE STORE ON SALES.DIM_STORE_SK = STORE.DIM_STORE_SK
GROUP BY 
    STORE.STORE_NAME
ORDER BY 
    TotalSales DESC;
	
	


-- 7.3 Top 20 cities (all-time): Identify the top 20 cities based on all-time liquor sales.
SELECT 
TOP 20
    CITY.CITY_NAME,
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_CITY CITY ON SALES.DIM_CITY_SK = CITY.DIM_CITY_SK
GROUP BY 
    CITY.CITY_NAME
ORDER BY 
    TotalSales DESC;

-- 7.4 Top 10 counties (all-time): Identify the top 10 counties based on all-time liquor sales.
SELECT TOP 10
    COUNTY.COUNTY_NAME,
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_COUNTY COUNTY ON SALES.DIM_COUNTRY_SK = COUNTY.DIM_COUNTRY_SK
GROUP BY 
    COUNTY.COUNTY_NAME
ORDER BY 
    TotalSales DESC;

-- 7.5 Top 20 categories (all-time): Identify the top 20 categories based on all-time liquor sales.
SELECT TOP 20
    CATEGORY.CATEGORY_NAME,
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_CATEGORY CATEGORY ON SALES.DIM_CATEGORY_SK = CATEGORY.DIM_CATEGORY_SK
GROUP BY 
    CATEGORY.CATEGORY_NAME
ORDER BY 
    TotalSales DESC;

-- 7.6 Top 50 items (all-time): Identify the top 50 items based on all-time liquor sales.
SELECT TOP 50
    ITEM.ITEM_DESCRIPTION,
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_ITEM ITEM ON SALES.DIM_ITEM_SK = ITEM.DIM_ITEM_SK
GROUP BY 
    ITEM.ITEM_DESCRIPTION
ORDER BY 
    TotalSales DESC;
	
	
	
	


-- 7.7 Top 20 vendors (all-time): Identify the top 20 vendors based on all-time liquor sales.
SELECT TOP 20
    VENDOR.VENDOR_NAME,
    SUM(SALE_DOLLARS) AS TotalSales
FROM 
    EDW.FACT_LIQUOR_SALES SALES
JOIN 
    EDW.DIM_VENDOR VENDOR ON SALES.DIM_VENDOR_SK = VENDOR.DIM_VENDOR_SK
GROUP BY 
    VENDOR.VENDOR_NAME
ORDER BY 
    TotalSales DESC;
