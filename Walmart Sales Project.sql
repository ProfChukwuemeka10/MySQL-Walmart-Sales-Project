Create database Walmart_sales;

Create table if not exists Walmart(
invoice_id Varchar(30) Not null primary key,
branch varchar(5) Not null,
city Varchar(30) Not null,
customer_type varchar(30) Not null,
gender Varchar(10) Not null,
product_line Varchar(100) Not null,
unit_price Decimal(10, 2) Not null,
quantity Int Not null,
VAT Decimal(6, 4) Not null,
Total Decimal(20, 2) Not null,
Data datetime Not null,
Time time Not null,
Payment_method Varchar(30) Not null,
cogs Decimal(10, 2) Not null,
Gross_margin_Perc Decimal(10, 2) Not null,
Gross_income decimal(12, 4) Not null,
Rating Decimal(4, 1) Not null
);

Select * from walmart;

----------------------- Feature Engineering ----------------------
-- Inputing "time_of_day"
Drop Table walmart_table;
Drop Table walmartsalesdata.csv;


