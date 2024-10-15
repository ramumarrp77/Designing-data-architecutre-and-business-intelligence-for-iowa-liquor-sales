# Iowa Liquor Sales Analysis

## Overview
This repository contains the data processing and analysis pipeline for the Iowa Liquor Sales dataset, aimed at answering key business questions and providing insights into liquor sales trends across the state. The project includes data staging, profiling, and dimensional modeling, implemented with technologies such as **Alteryx**, **Snowflake**, **Talend**, and **Azure SQL**. Visualizations were created using **Tableau** and **Power BI**.


## Technologies Used

![Alteryx](https://img.shields.io/badge/Alteryx-1c7b9e?style=for-the-badge&logo=alteryx&logoColor=white)
![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?style=for-the-badge&logo=snowflake&logoColor=white)
![Talend](https://img.shields.io/badge/Talend-FF6D70?style=for-the-badge&logo=talend&logoColor=white)
![Azure SQL](https://img.shields.io/badge/Azure%20SQL-0078D4?style=for-the-badge&logo=microsoft-azure&logoColor=white)
![ADF](https://img.shields.io/badge/Azure%20Data%20Factory-0078D4?style=for-the-badge&logo=microsoft-azure&logoColor=white)
![Tableau](https://img.shields.io/badge/Tableau-E97627?style=for-the-badge&logo=tableau&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=power-bi&logoColor=black)
![ER/Studio](https://img.shields.io/badge/ER%2FStudio-3E5064?style=for-the-badge&logoColor=white)
![Dimensional Modelling](https://img.shields.io/badge/Dimensional%20Modelling-4CAF50?style=for-the-badge&logoColor=white)


## Dataset
The Iowa Liquor Sales dataset is publicly available at [data.iowa.gov](https://data.iowa.gov/Sales-Distribution/Iowa-Liquor-Sales/m3tr-qhgy/about_data). The dataset includes detailed records of liquor sales from various stores across the state, providing insights into sales amounts, volumes, and liquor types.

Key measures analyzed include:
- **Sales $** (total revenue)
- **Sales Volume** (gallons and bottles sold)
- **Gross Profit** (retail price - cost)
- **Sales per Capita**

The data also contains dimensions such as:
- **Store**
- **County**
- **City**
- **Category**
- **Item**
- **Vendor**

## Data Staging
Data was staged in **Azure SQL** using **ADF (Azure Data Factory)** pipelines. The staging schema contains several tables that represent different aspects of liquor sales:

- `stg_iowa_liquor_sales`
- `stg_iowa_liquor_products`
- `stg_iowa_liquor_stores`
- `stg_iowa_city_population_by_year`
- `stg_iowa_county_population_by_year`

The staging tables were used for further transformation and analysis.

## Data Profiling
We utilized **Snowflake** for profiling the data to identify gaps, inconsistencies, and potential cleaning tasks. The profiling revealed:
- **Data gaps** between cleaned and uncleaned sales data.
- **Trim and case** issues in textual data (e.g., county names).
- **Trailing zeros** in numerical fields like County Number.

Here are a few profiling results:
- Volume in Cleaned Table: **29,445,098 records**
- Volume in Not Cleaned Table: **24,847,472 records**
  
The differences were addressed using **Talend** for data cleaning.

## Data Model
We designed a **dimensional data model** in **Azure SQL**, which consists of the following tables:
- **Dimensional Tables**:
  - `DIM_CATEGORY`
  - `DIM_CITY`
  - `DIM_COUNTY`
  - `DIM_ITEM`
  - `DIM_STORE`
  - `DIM_VENDOR`
- **Fact Tables**:
  - `FACT_LIQUOR_SALES`
  - `FACT_CITY_YEARLY`
  - `FACT_COUNTY_YEARLY`

This model allows us to perform detailed analysis and reporting across various dimensions and time periods.

## Talend Jobs
**Talend** was used for data integration and ETL operations. We created jobs to load data into the dimensional model, with proper logging and exception handling. The Talend jobs handled:
- **Data cleaning**: Trimming, casing, and merging records.
- **Data transformation**: Loading the data into the final schema in **Azure SQL**.

## Visualization
Visualizations were built using **Tableau** and **Power BI** to present the insights derived from the data. These visualizations include:
- Year-over-year sales trends.
- Sales breakdowns by store, county, and city.
- Top-selling liquor types and bottle sizes.
  
## Inferences
- **Consistent Growth Period (2013-2021)**: Liquor sales saw steady year-over-year growth, with notable increases in 2014, 2016, 2018, and a significant spike in 2020.
- **Stabilization and Plateau (2022-2023)**: Sales stabilized between 429M and 446M, with a flattening YoY growth rate, indicating market saturation.
- **Sharp Decline and Market Disruption (2024)**: A dramatic sales drop in 2024 suggests major disruptions, warranting further investigation into potential causes.



## Conclusion
This project demonstrates the full lifecycle of data handling, from staging and profiling to modeling and visualization, answering key business questions about liquor sales in Iowa. The insights gained from this analysis can help businesses make informed decisions and understand market trends.
