---VALIDATION QUERY FOR INTEGRATION SCHEMA

--DIM_CATEGORY

select count(*) from
(select distinct Category,[Category Name] from stage.STG_IOWA_LIQUOR_SALES
union
select distinct -999 as Category, [Category Name] from stage.STG_IOWA_LIQUOR_PRODUCTS)
a;


--DIM_CITY


select count(*) from
(select distinct City from stage.STG_IOWA_LIQUOR_SALES
union
select distinct City from stage.STG_IOWA_LIQUOR_STORES
union 
select distinct City from stage.STG_IOWA_CITY_POPULATION_BY_YEAR)
a;


--DIM_COUNTY

select count(*) from
(select distinct  trim(upper(County)) as County from stage.STG_IOWA_LIQUOR_SALES
union
select distinct trim((County)) as County  from stage.STG_IOWA_COUNTY_POPULATION_BY_YEAR
union 
select distinct trim((County)) as County from stage.STG_IOWA_LIQUOR_SALES_BY_YEAR_AND_COUNTY)
a;


-- DIM_DATE

select count(*) from edw.dim_date;

-- DIM ITEMS

select count(*) from
(select distinct  [Item Number],[Item Description],[Bottle Volume (ml)],[State Bottle Cost],
[State Bottle Retail] from stage.stg_iowa_liquor_sales
union
select distinct [Item Number],[Item Description],[Bottle Volume (ml)],[State Bottle Cost], 
[State Bottle Retail] from stage.STG_IOWA_LIQUOR_PRODUCTS)
a;


-- DIM LOCATION

select count(*) from
( select Address,City,County,[Zip Code],[Store Location] from stage.stg_iowa_liquor_sales
union
select Address,City, null as County,[Zip Code],Store  from stage.STG_IOWA_LIQUOR_STORES)
a;


--DIM STORES

select count(*) from
(select distinct [Store Number],[Store Name]  from stage.stg_iowa_liquor_sales
union
select distinct Store, Name from stage.STG_IOWA_LIQUOR_STORES)
a;


--DIM VENDOR

select count(*) from
(select distinct [Vendor Number],[Vendor Name]  from stage.stg_iowa_liquor_sales
union
select distinct Vendor,[Vendor Name]  from stage.STG_IOWA_LIQUOR_PRODUCTS)
a;





--FACT LIQUOR SALES


select count(*) from stage.STG_IOWA_LIQUOR_SALES;

select count(*) from edw.FACT_LIQUOR_SALES;









-- FACT CITY LOAD

SELECT COUNT(*) FROM EDW.FACT_CITY_YEARLY;

SELECT COUNT(*) FROM STAGE.STG_IOWA_CITY_POPULATION_BY_YEAR;


-- FACT COUNTY LOAD



