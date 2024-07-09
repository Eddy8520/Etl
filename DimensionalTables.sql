IF OBJECT_ID('Fact_Sales', 'U') IS NOT NULL
    DROP TABLE Fact_Sales;

IF OBJECT_ID('Dim_Assessor', 'U') IS NOT NULL
    DROP TABLE Dim_Assessor;

IF OBJECT_ID('Dim_Date', 'U') IS NOT NULL
    DROP TABLE Dim_Date;

IF OBJECT_ID('Dim_Property_Type', 'U') IS NOT NULL
    DROP TABLE Dim_Property_Type;

IF OBJECT_ID('Dim_Residential_Type', 'U') IS NOT NULL
    DROP TABLE Dim_Residential_Type;

IF OBJECT_ID('Dim_Location', 'U') IS NOT NULL
    DROP TABLE Dim_Location;

CREATE TABLE Dim_Assessor (
    Assessor_Remarks NVARCHAR(Max),
    OPM_remarks NVARCHAR(Max)
);

CREATE TABLE Dim_Date (
    Date_Recorded NVARCHAR(50),
    List_Year INT
);

CREATE TABLE Dim_Property_Type (
    Property_Type NVARCHAR(Max)
);

CREATE TABLE Dim_Residential_Type (
    Residential_Type NVARCHAR(Max) 
);

CREATE TABLE Dim_Location (
    Town NVARCHAR(Max),
    Location NVARCHAR(Max)
);

CREATE TABLE Fact_Sales (
    Serial_Number INT,
    Town NVARCHAR(100),
    Assessed_Value DECIMAL(19, 2),
    Sale_Amount BIGINT,
    Sales_Ratio DECIMAL(25, 15),
    Property_Type NVARCHAR(Max),
    Residential_Type NVARCHAR(Max),
    Non_Use_Code NVARCHAR(Max),
    Assessor_Remarks NVARCHAR(Max),
    Location NVARCHAR(Max),
    Date_Recorded NVARCHAR(50),
    List_Year INT
);


INSERT INTO Dim_Assessor 
SELECT DISTINCT Assessor_Remarks, OPM_remarks FROM dbo.Real_Estate;

INSERT INTO Dim_Date 
SELECT DISTINCT Date_Recorded, List_Year FROM dbo.Real_Estate;

INSERT INTO Dim_Property_Type 
SELECT DISTINCT Property_Type FROM dbo.Real_Estate;

INSERT INTO Dim_Residential_Type 
SELECT DISTINCT Residential_Type FROM dbo.Real_Estate;

INSERT INTO Dim_Location 
SELECT DISTINCT Town, Location FROM dbo.Real_Estate;

INSERT INTO Fact_Sales (
    Serial_Number, Town, Assessed_Value, Sale_Amount, Sales_Ratio,
    Property_Type, Residential_Type, Non_Use_Code,
    Assessor_Remarks, Location, Date_Recorded, List_Year
)
SELECT
    Serial_Number, s.Town, Assessed_Value, Sale_Amount, Sales_Ratio,
    s.Property_Type, s.Residential_Type, s.Non_Use_Code,
    s.Assessor_Remarks, s.Location, s.Date_Recorded, s.List_Year
FROM
    dbo.Real_Estate s;
