/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      LOWA_LIQUOR_SALES.DM1
 *
 * Date Created : Tuesday, August 13, 2024 22:56:31
 * Target DBMS : Microsoft Azure SQL DB
 */

/* 
 * TABLE: DIM_CATEGORY 
 */

CREATE TABLE DIM_CATEGORY(
    DIM_CATEGORY_SK           int             NOT NULL,
    SOURCE_CATEGORY_NUMBER    int             NOT NULL,
    CATEGORY_NAME             varchar(255)    NULL,
    DW_LOAD_WORKFLOW_NAME     varchar(50)     NOT NULL,
    DW_LOAD_JOB_ID            varchar(50)     NOT NULL,
    DW_LOAD_DATE              date            NOT NULL,
    DIM_SOURCE_SK             int             NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY NONCLUSTERED (DIM_CATEGORY_SK)
)

go


IF OBJECT_ID('DIM_CATEGORY') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_CATEGORY >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_CATEGORY >>>'
go

/* 
 * TABLE: DIM_CITY 
 */

CREATE TABLE DIM_CITY(
    DIM_CITY_SK              int             NOT NULL,
    CITY_NAME                varchar(100)    NOT NULL,
    DW_LOAD_WORKFLOW_NAME    varchar(50)     NOT NULL,
    DW_LOAD_JOB_ID           varchar(50)     NOT NULL,
    DW_LOAD_DATE             date            NOT NULL,
    DIM_SOURCE_SK            int             NOT NULL,
    CONSTRAINT PK9 PRIMARY KEY NONCLUSTERED (DIM_CITY_SK)
)

go


IF OBJECT_ID('DIM_CITY') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_CITY >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_CITY >>>'
go

/* 
 * TABLE: DIM_COUNTY 
 */

CREATE TABLE DIM_COUNTY(
    DIM_COUNTRY_SK           int             NOT NULL,
    SOURCE_COUNTY_NUMBER     int             NULL,
    COUNTY_NAME              varchar(100)    NULL,
    DW_LOAD_WORKFLOW_NAME    varchar(50)     NOT NULL,
    DW_LOAD_JOB_ID           varchar(50)     NOT NULL,
    DW_LOAD_DATE             date            NOT NULL,
    DIM_SOURCE_SK            int             NOT NULL,
    CONSTRAINT PK6 PRIMARY KEY NONCLUSTERED (DIM_COUNTRY_SK)
)

go


IF OBJECT_ID('DIM_COUNTY') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_COUNTY >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_COUNTY >>>'
go

/* 
 * TABLE: DIM_DATE 
 */

CREATE TABLE DIM_DATE(
    dim_date_key             int              NOT NULL,
    date                     date             NOT NULL,
    day_of_week              numeric(1, 0)    NOT NULL,
    day_name                 varchar(20)      NOT NULL,
    day_of_year              numeric(3, 0)    NOT NULL,
    week_of_year             numeric(2, 0)    NOT NULL,
    month                    numeric(2, 0)    NOT NULL,
    month_name               varchar(12)      NOT NULL,
    quarter                  numeric(1, 0)    NOT NULL,
    quarter_name             varchar(2)       NOT NULL,
    season                   numeric(1, 0)    NOT NULL,
    season_name              varchar(10)      NOT NULL,
    year                     numeric(4, 0)    NOT NULL,
    is_weekend               bit              NOT NULL,
    dw_load_job_id           varchar(10)      NOT NULL,
    dw_load_workflow_name    varchar(50)      NOT NULL,
    dw_load_date             datetime         NOT NULL,
    DIM_SOURCE_SK            int              NOT NULL,
    CONSTRAINT PK66 PRIMARY KEY NONCLUSTERED (dim_date_key)
)

go


IF OBJECT_ID('DIM_DATE') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_DATE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_DATE >>>'
go

/* 
 * TABLE: DIM_ITEM 
 */

CREATE TABLE DIM_ITEM(
    DIM_ITEM_SK                       int               NOT NULL,
    SOURCE_ITEM_NUMBER                varchar(18)       NOT NULL,
    ITEM_DESCRIPTION                  varchar(255)      NULL,
    BOTTLE_VOLUME_IN_ML               numeric(10, 2)    NULL,
    STATE_BOTTLE_COST_IN_DOLLARS      numeric(10, 2)    NULL,
    STATE_BOTTLE_RETAIL_IN_DOLLARS    numeric(10, 2)    NULL,
    DW_LOAD_WORKFLOW_NAME             varchar(50)       NOT NULL,
    DW_LOAD_JOB_ID                    varchar(50)       NOT NULL,
    DW_LOAD_DATE                      date              NOT NULL,
    DIM_SOURCE_SK                     int               NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY NONCLUSTERED (DIM_ITEM_SK)
)

go


IF OBJECT_ID('DIM_ITEM') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_ITEM >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_ITEM >>>'
go

/* 
 * TABLE: DIM_LOCATION 
 */

CREATE TABLE DIM_LOCATION(
    DIM_LOCATION_SK          int               NOT NULL,
    ADDRESS                  varchar(255)      NULL,
    CITY                     varchar(100)      NULL,
    COUNTY                   varchar(10)       NULL,
    ZIP_CODE                 varchar(10)       NULL,
    LATITUDE                 numeric(12, 8)    NULL,
    LOGITUDE                 numeric(12, 8)    NULL,
    LOCATION                 varchar(512)      NULL,
    DW_LOAD_WORKFLOW_NAME    varchar(50)       NOT NULL,
    DW_LOAD_JOB_ID           varchar(50)       NOT NULL,
    DW_LOAD_DATE             date              NOT NULL,
    DIM_SOURCE_SK            int               NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY NONCLUSTERED (DIM_LOCATION_SK)
)

go


IF OBJECT_ID('DIM_LOCATION') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_LOCATION >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_LOCATION >>>'
go

/* 
 * TABLE: DIM_SOURCE 
 */

CREATE TABLE DIM_SOURCE(
    DIM_SOURCE_SK        int             NOT NULL,
    DIM_                 varchar(255)    NOT NULL,
    DW_LOAD_DATE         date            NOT NULL,
    DW_LOAD_USER_NAME    varchar(50)     NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY NONCLUSTERED (DIM_SOURCE_SK)
)

go


IF OBJECT_ID('DIM_SOURCE') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_SOURCE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_SOURCE >>>'
go

/* 
 * TABLE: DIM_STORE 
 */

CREATE TABLE DIM_STORE(
    DIM_STORE_SK             int             NOT NULL,
    SOURCE_STORE_NUMBER      int             NOT NULL,
    STORE_NAME               varchar(255)    NULL,
    DW_LOAD_WORKFLOW_NAME    varchar(50)     NOT NULL,
    DW_LOAD_JOB_ID           varchar(50)     NOT NULL,
    DW_LOAD_DATE             date            NOT NULL,
    DIM_SOURCE_SK            int             NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY NONCLUSTERED (DIM_STORE_SK)
)

go


IF OBJECT_ID('DIM_STORE') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_STORE >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_STORE >>>'
go

/* 
 * TABLE: DIM_VENDOR 
 */

CREATE TABLE DIM_VENDOR(
    DIM_VENDOR_SK            int             NOT NULL,
    SOURCE_VENDOR_NAME_NK    int             NOT NULL,
    VENDOR_NAME              varchar(100)    NULL,
    DW_LOAD_WORKFLOW_NAME    varchar(50)     NOT NULL,
    DW_LOAD_JOB_ID           varchar(50)     NOT NULL,
    DW_LOAD_DATE             date            NOT NULL,
    DIM_SOURCE_SK            int             NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY NONCLUSTERED (DIM_VENDOR_SK)
)

go


IF OBJECT_ID('DIM_VENDOR') IS NOT NULL
    PRINT '<<< CREATED TABLE DIM_VENDOR >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DIM_VENDOR >>>'
go

/* 
 * TABLE: FACT_CITY_YEARLY 
 */

CREATE TABLE FACT_CITY_YEARLY(
    FACT_CITY_YEARLY_SK      int            NOT NULL,
    DIM_CITY_SK              int            NOT NULL,
    YEAR                     int            NOT NULL,
    TOTAL_POPULATION         int            NULL,
    DW_LOAD_WORKFLOW_NAME    varchar(50)    NOT NULL,
    DW_LOAD_JOB_ID           varchar(50)    NOT NULL,
    DW_LOAD_DATE             date           NOT NULL,
    DIM_SOURCE_SK            int            NOT NULL,
    CONSTRAINT PK10 PRIMARY KEY NONCLUSTERED (FACT_CITY_YEARLY_SK)
)

go


IF OBJECT_ID('FACT_CITY_YEARLY') IS NOT NULL
    PRINT '<<< CREATED TABLE FACT_CITY_YEARLY >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FACT_CITY_YEARLY >>>'
go

/* 
 * TABLE: FACT_COUNTY_YEARLY 
 */

CREATE TABLE FACT_COUNTY_YEARLY(
    FACT_COUNTY_YEARLY_SK           int               NOT NULL,
    DIM_COUNTRY_SK                  int               NOT NULL,
    YEAR                            int               NOT NULL,
    TOTAL_POPULATION                numeric(20, 0)    NULL,
    TOTAL_SALES_IN_DOLLARS          numeric(20, 0)    NULL,
    TOTAL_VOLUME_SOLD_IN_GALLONS    numeric(10, 2)    NULL,
    SALES_PER_CAPITA                numeric(10, 2)    NULL,
    DW_LOAD_WORKFLOW_NAME           varchar(50)       NOT NULL,
    DW_LOAD_JOB_ID                  varchar(50)       NOT NULL,
    DW_LOAD_DATE                    date              NOT NULL,
    DIM_SOURCE_SK                   int               NOT NULL,
    CONSTRAINT PK8 PRIMARY KEY NONCLUSTERED (FACT_COUNTY_YEARLY_SK)
)

go


IF OBJECT_ID('FACT_COUNTY_YEARLY') IS NOT NULL
    PRINT '<<< CREATED TABLE FACT_COUNTY_YEARLY >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FACT_COUNTY_YEARLY >>>'
go

/* 
 * TABLE: FACT_LIQOUR_SALES 
 */

CREATE TABLE FACT_LIQOUR_SALES(
    FACT_LIQUOR_SALES_SK       int            NOT NULL,
    SOURE_INVOICE_NUMBER_NK    varchar(25)    NOT NULL,
    DIM_ITEM_SK                int            NOT NULL,
    DIM_CATEGORY_SK            int            NOT NULL,
    DIM_VENDOR_SK              int            NOT NULL,
    DIM_STORE_SK               int            NOT NULL,
    DIM_LOCATION_SK            int            NOT NULL,
    DIM_CITY_SK                int            NOT NULL,
    DIM_COUNTRY_SK             int            NOT NULL,
    INVOICE_DATE               int            NOT NULL,
    BOTTLE_SOLD                int            NULL,
    SALE_DOLLARS               float          NULL,
    VOLUME_SOLD_IN_LITRES      float          NULL,
    VOLUME_SOLD_IN_GALLONS     float          NULL,
    DW_LOAD_WORKFLOW_NAME      varchar(50)    NOT NULL,
    DW_LOAD_JOB_ID             varchar(50)    NOT NULL,
    DW_LOAD_DATE               date           NOT NULL,
    DIM_SOURCE_SK              int            NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY NONCLUSTERED (FACT_LIQUOR_SALES_SK)
)

go


IF OBJECT_ID('FACT_LIQOUR_SALES') IS NOT NULL
    PRINT '<<< CREATED TABLE FACT_LIQOUR_SALES >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE FACT_LIQOUR_SALES >>>'
go

/* 
 * TABLE: DIM_CATEGORY 
 */

ALTER TABLE DIM_CATEGORY ADD CONSTRAINT RefDIM_SOURCE47 
    FOREIGN KEY (DIM_SOURCE_SK)
    REFERENCES DIM_SOURCE(DIM_SOURCE_SK)
go


/* 
 * TABLE: DIM_CITY 
 */

ALTER TABLE DIM_CITY ADD CONSTRAINT RefDIM_SOURCE53 
    FOREIGN KEY (DIM_SOURCE_SK)
    REFERENCES DIM_SOURCE(DIM_SOURCE_SK)
go


/* 
 * TABLE: DIM_COUNTY 
 */

ALTER TABLE DIM_COUNTY ADD CONSTRAINT RefDIM_SOURCE55 
    FOREIGN KEY (DIM_SOURCE_SK)
    REFERENCES DIM_SOURCE(DIM_SOURCE_SK)
go


/* 
 * TABLE: DIM_DATE 
 */

ALTER TABLE DIM_DATE ADD CONSTRAINT RefDIM_SOURCE48 
    FOREIGN KEY (DIM_SOURCE_SK)
    REFERENCES DIM_SOURCE(DIM_SOURCE_SK)
go


/* 
 * TABLE: DIM_ITEM 
 */

ALTER TABLE DIM_ITEM ADD CONSTRAINT RefDIM_SOURCE51 
    FOREIGN KEY (DIM_SOURCE_SK)
    REFERENCES DIM_SOURCE(DIM_SOURCE_SK)
go


/* 
 * TABLE: DIM_LOCATION 
 */

ALTER TABLE DIM_LOCATION ADD CONSTRAINT RefDIM_SOURCE52 
    FOREIGN KEY (DIM_SOURCE_SK)
    REFERENCES DIM_SOURCE(DIM_SOURCE_SK)
go


/* 
 * TABLE: DIM_STORE 
 */

ALTER TABLE DIM_STORE ADD CONSTRAINT RefDIM_SOURCE54 
    FOREIGN KEY (DIM_SOURCE_SK)
    REFERENCES DIM_SOURCE(DIM_SOURCE_SK)
go


/* 
 * TABLE: DIM_VENDOR 
 */

ALTER TABLE DIM_VENDOR ADD CONSTRAINT RefDIM_SOURCE49 
    FOREIGN KEY (DIM_SOURCE_SK)
    REFERENCES DIM_SOURCE(DIM_SOURCE_SK)
go


/* 
 * TABLE: FACT_CITY_YEARLY 
 */

ALTER TABLE FACT_CITY_YEARLY ADD CONSTRAINT RefDIM_CITY7 
    FOREIGN KEY (DIM_CITY_SK)
    REFERENCES DIM_CITY(DIM_CITY_SK)
go

ALTER TABLE FACT_CITY_YEARLY ADD CONSTRAINT RefDIM_SOURCE57 
    FOREIGN KEY (DIM_SOURCE_SK)
    REFERENCES DIM_SOURCE(DIM_SOURCE_SK)
go


/* 
 * TABLE: FACT_COUNTY_YEARLY 
 */

ALTER TABLE FACT_COUNTY_YEARLY ADD CONSTRAINT RefDIM_COUNTY6 
    FOREIGN KEY (DIM_COUNTRY_SK)
    REFERENCES DIM_COUNTY(DIM_COUNTRY_SK)
go

ALTER TABLE FACT_COUNTY_YEARLY ADD CONSTRAINT RefDIM_SOURCE56 
    FOREIGN KEY (DIM_SOURCE_SK)
    REFERENCES DIM_SOURCE(DIM_SOURCE_SK)
go


/* 
 * TABLE: FACT_LIQOUR_SALES 
 */

ALTER TABLE FACT_LIQOUR_SALES ADD CONSTRAINT RefDIM_CATEGORY1 
    FOREIGN KEY (DIM_CATEGORY_SK)
    REFERENCES DIM_CATEGORY(DIM_CATEGORY_SK)
go

ALTER TABLE FACT_LIQOUR_SALES ADD CONSTRAINT RefDIM_STORE2 
    FOREIGN KEY (DIM_STORE_SK)
    REFERENCES DIM_STORE(DIM_STORE_SK)
go

ALTER TABLE FACT_LIQOUR_SALES ADD CONSTRAINT RefDIM_VENDOR3 
    FOREIGN KEY (DIM_VENDOR_SK)
    REFERENCES DIM_VENDOR(DIM_VENDOR_SK)
go

ALTER TABLE FACT_LIQOUR_SALES ADD CONSTRAINT RefDIM_LOCATION5 
    FOREIGN KEY (DIM_LOCATION_SK)
    REFERENCES DIM_LOCATION(DIM_LOCATION_SK)
go

ALTER TABLE FACT_LIQOUR_SALES ADD CONSTRAINT RefDIM_ITEM10 
    FOREIGN KEY (DIM_ITEM_SK)
    REFERENCES DIM_ITEM(DIM_ITEM_SK)
go

ALTER TABLE FACT_LIQOUR_SALES ADD CONSTRAINT RefDIM_DATE11 
    FOREIGN KEY (INVOICE_DATE)
    REFERENCES DIM_DATE(dim_date_key)
go

ALTER TABLE FACT_LIQOUR_SALES ADD CONSTRAINT RefDIM_COUNTY33 
    FOREIGN KEY (DIM_COUNTRY_SK)
    REFERENCES DIM_COUNTY(DIM_COUNTRY_SK)
go

ALTER TABLE FACT_LIQOUR_SALES ADD CONSTRAINT RefDIM_CITY34 
    FOREIGN KEY (DIM_CITY_SK)
    REFERENCES DIM_CITY(DIM_CITY_SK)
go

ALTER TABLE FACT_LIQOUR_SALES ADD CONSTRAINT RefDIM_SOURCE50 
    FOREIGN KEY (DIM_SOURCE_SK)
    REFERENCES DIM_SOURCE(DIM_SOURCE_SK)
go


