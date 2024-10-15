CREATE OR REPLACE TABLE PROFILING.STG_IOWA_LIQUOR_SALES (
    Invoice_Item_Number VARCHAR,
    Inv_Date_Str VARCHAR,
	Inv_Date DATE,
    Store_Number INTEGER,
    Store_Name VARCHAR,
    Address VARCHAR,
    City VARCHAR,
    Zip_Code VARCHAR,
    Store_Location VARCHAR,
    County_Number VARCHAR,
    County VARCHAR,
    Category INTEGER,
    Category_Name VARCHAR,
    Vendor_Number INTEGER,
    Vendor_Name VARCHAR,
    Item_Number VARCHAR,
    Item_Description VARCHAR,
    Pack INTEGER,
    Bottle_Volume_ml FLOAT,
    State_Bottle_Cost FLOAT,
    State_Bottle_Retail FLOAT,
    Bottles_Sold INTEGER,
    Sale_Dollars FLOAT,
    Volume_Sold_Liters FLOAT,
    Volume_Sold_Gallons FLOAT,
	DW_LOAD_DATE DATETIME,
	DW_LOAD_JOB_ID VARCHAR,
	DW_LOAD_WORKFLOW_NAME VARCHAR
);


CREATE OR REPLACE TABLE PROFILING.STG_IOWA_LIQUOR_SALES_NOTCLEANED (
    Invoice_Item_Number VARCHAR,
    Inv_Date_Str VARCHAR,
	Inv_Date DATE,
    Store_Number INTEGER,
    Store_Name VARCHAR,
    Address VARCHAR,
    City VARCHAR,
    Zip_Code VARCHAR,
    Store_Location VARCHAR,
    County_Number VARCHAR,
    County VARCHAR,
    Category INTEGER,
    Category_Name VARCHAR,
    Vendor_Number INTEGER,
    Vendor_Name VARCHAR,
    Item_Number VARCHAR,
    Item_Description VARCHAR,
    Pack INTEGER,
    Bottle_Volume_ml FLOAT,
    State_Bottle_Cost FLOAT,
    State_Bottle_Retail FLOAT,
    Bottles_Sold INTEGER,
    Sale_Dollars FLOAT,
    Volume_Sold_Liters FLOAT,
    Volume_Sold_Gallons FLOAT,
	DW_LOAD_DATE DATETIME,
	DW_LOAD_JOB_ID VARCHAR,
	DW_LOAD_WORKFLOW_NAME VARCHAR
);








CREATE OR REPLACE TABLE PROFILING.STG_IOWA_LIQUOR_PRODUCTS (
    Item_Number VARCHAR,
    Category_Name VARCHAR,
    Item_Description VARCHAR,
    Vendor VARCHAR,
    Vendor_Name VARCHAR,
    Bottle_Volume_ml INTEGER,
    Pack INTEGER,
    Inner_Pack INTEGER,
    Age INTEGER,
    Proof FLOAT,
	List_Date_Str VARCHAR,
    List_Date DATE,
    UPC VARCHAR,
    SCC VARCHAR,
    State_Bottle_Cost FLOAT,
    State_Case_Cost FLOAT,
    State_Bottle_Retail FLOAT,
	Report_Date_Str VARCHAR,
    Report_Date DATE,
	DW_LOAD_DATE DATETIME,
	DW_LOAD_JOB_ID VARCHAR,
	DW_LOAD_WORKFLOW_NAME VARCHAR
);


CREATE OR REPLACE TABLE PROFILING.STG_IOWA_LIQUOR_PRODUCTS_NOTCLEANED (
    Item_Number VARCHAR,
    Category_Name VARCHAR,
    Item_Description VARCHAR,
    Vendor VARCHAR,
    Vendor_Name VARCHAR,
    Bottle_Volume_ml INTEGER,
    Pack INTEGER,
    Inner_Pack INTEGER,
    Age INTEGER,
    Proof FLOAT,
	List_Date_Str VARCHAR,
    List_Date DATE,
    UPC VARCHAR,
    SCC VARCHAR,
    State_Bottle_Cost FLOAT,
    State_Case_Cost FLOAT,
    State_Bottle_Retail FLOAT,
	Report_Date_Str VARCHAR,
    Report_Date DATE,
	DW_LOAD_DATE DATETIME,
	DW_LOAD_JOB_ID VARCHAR,
	DW_LOAD_WORKFLOW_NAME VARCHAR
);




CREATE TABLE PROFILING.STG_IOWA_LIQUOR_STORES (
    Store VARCHAR,
    Name VARCHAR,
    Store_Status VARCHAR,
    Address VARCHAR,
    City VARCHAR,
    State VARCHAR,
    Zip_Code VARCHAR,
    Store_Address VARCHAR,
	Report_Date_Str VARCHAR,
    Report_Date DATE,
	DW_LOAD_DATE DATETIME,
	DW_LOAD_JOB_ID VARCHAR,
	DW_LOAD_WORKFLOW_NAME VARCHAR
);




CREATE TABLE PROFILING.STG_IOWA_LIQUOR_STORES_NOTCLEANED (
    Store VARCHAR,
    Name VARCHAR,
    Store_Status VARCHAR,
    Address VARCHAR,
    City VARCHAR,
    State VARCHAR,
    Zip_Code VARCHAR,
    Store_Address VARCHAR,
	Report_Date_Str VARCHAR,
    Report_Date DATE,
	DW_LOAD_DATE DATETIME,
	DW_LOAD_JOB_ID VARCHAR,
	DW_LOAD_WORKFLOW_NAME VARCHAR
);





CREATE OR REPLACE TABLE PROFILING.STG_IOWA_CITY_POPULATION_BY_YEAR (
    FIPS INTEGER,
    City VARCHAR(255),
    Year VARCHAR(13),
    Population INTEGER,
    Primary_Point VARCHAR(1000),
	DW_LOAD_DATE DATETIME,
	DW_LOAD_JOB_ID VARCHAR,
	DW_LOAD_WORKFLOW_NAME VARCHAR
);





CREATE OR REPLACE TABLE PROFILING.STG_IOWA_COUNTY_POPULATION_BY_YEAR (
    FIPS INTEGER,
    County VARCHAR(255),
    Year VARCHAR(13),
    Population INTEGER,
    Primary_Point VARCHAR(1000),
	DW_LOAD_DATE DATETIME,
	DW_LOAD_JOB_ID VARCHAR,
	DW_LOAD_WORKFLOW_NAME VARCHAR
);





CREATE OR REPLACE TABLE PROFILING.STG_IOWA_LIQUOR_SALES_BY_YEAR_AND_COUNTY (
    Date integer,
    County VARCHAR(255),
    Sale_Dollars FLOAT,
    Volume_Sold_Gallons FLOAT,
	DW_LOAD_DATE DATETIME,
	DW_LOAD_JOB_ID VARCHAR,
	DW_LOAD_WORKFLOW_NAME VARCHAR
);


CREATE OR REPLACE TABLE PROFILING.STG_IOWA_LIQUOR_SALES_BY_YEAR(
    Date integer,
    Sale_Dollars FLOAT,
    Volume_Sold_Gallons FLOAT,
	DW_LOAD_DATE DATETIME,
	DW_LOAD_JOB_ID VARCHAR,
	DW_LOAD_WORKFLOW_NAME VARCHAR
);
