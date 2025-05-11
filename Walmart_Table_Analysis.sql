SELECT * FROM walmart_sales.`walmartsalesdata.csv`;

Select time,   # To modify and classify the time into Morning, Afternoon and Evening.
(Case
	When 'time' Between "00:00:00" And "12:00:00" Then "Morniing"
    When 'time' Between "12:01:00" And "16:00:00" Then "Afternoon"
    Else "Evening"
    End ) As time_of_day
from walmart_sales.`walmartsalesdata.csv`;

Alter Table walmart_sales.`walmartsalesdata.csv` add column time_of_day varchar(20); # To add a new column to the table

Update walmart_sales.`walmartsalesdata.csv`
set time_of_day = (
Case
	When 'time' Between "00:00:00" And "12:00:00" Then "Morniing"
    When 'time' Between "12:01:00" And "16:00:00" Then "Afternoon"
    Else "Evening"
    End 
);

---------------- Exploratory Data Analysis -----------------
SELECT * FROM walmart_sales.`walmartsalesdata.csv`;

select *
from walmart_sales.`walmartsalesdata.csv`
where Quantity > 9; ## prints all the variables whose quantity are greater than 9.

select *
from walmart_sales.`walmartsalesdata.csv`
where Gender = 'Female'; ### prints all the variables with gender "Female"

select substring('data', 1,4) as Year
from walmart_sales.`walmartsalesdata.csv`
where substring('data', 1,4) is not null ; ## Detach the year from the date, month and year columnn.

analyze table walmart_sales.`walmartsalesdata.csv`; # Analyzes the table or dataset to check its authenticity.


------ Day name ------------------
select Date,
dayname(Date) from walmart_sales.`walmartsalesdata.csv`;

Alter Table walmart_sales.`walmartsalesdata.csv`
Add Column Day_name Varchar(20); 

------- Month name -------------------------
select date, monthname(date)
from walmart_sales.`walmartsalesdata.csv`;

Alter Table walmart_sales.`walmartsalesdata.csv` add Column month_name varchar(10);

Update walmart_sales.`walmartsalesdata.csv`
Set month_name = mothname(date);


------------------------------- Exploratory Data Analysis --------------------------------------
---------------- How many unique cities does the data have?---------
Select
Distinct city
from walmart_sales.`walmartsalesdata.csv`; # The output is 3 - Yango, Naypyitaw and Mandalay

Select
Distinct Branch
from walmart_sales.`walmartsalesdata.csv`; # The output is  - A, B and cache index


------------------------------- In which city is individual brance----------
Select
Distinct City,
branch
from walmart_sales.`walmartsalesdata.csv`; # The output is tat Yango contains branch A, Naypitaw contains branch C while Mandalay contains branch B.

------------------- Questions on Products ---------------------------------------
--------- How many unique product lines does the data have?----------------

Select
distinct product_line
from walmart_sales.`walmartsalesdata.csv`; # 

Select
count(distinct product_line) # Of course the output is 6 distinct product lines
from walmart_sales.`walmartsalesdata.csv`; # 

------------ Most common payment method -------------

Select
count(distinct payment)
from walmart_sales.`walmartsalesdata.csv`; # 

Select
distinct payment
from walmart_sales.`walmartsalesdata.csv`; # Returns the distinct payment methods in the dataset.

Select
payment,
count(distinct payment) As cnt
from walmart_sales.`walmartsalesdata.csv`
Group by payment
Order by cnt DESC;


--------------------- What is the most selling product line?

Select
distinct product_line
from walmart_sales.`walmartsalesdata.csv`;


Select
product_line,
count(distinct product_line) As product
from walmart_sales.`walmartsalesdata.csv`
Group by product_line;

------------- What is the total revenue by month --------
select
month_name,
sum (Total) As Total_Sales
from walmart_sales.`walmartsalesdata.csv`
Group by Month_name
Order by Total_Sales Desc;

--------- What month has the highest COGS -----------
Select
month_name,
Sum(Cogs) As Total_Cogs
from walmart_sales.`walmartsalesdata.csv`
Group by month_name
Order by Total_Cogs;

-------- What product line had the largest revenue?-----------
Select 
product_line,
sum(Total) as Total_product_revenue
from walmart_sales.`walmartsalesdata.csv`
Group by product_line
Order by Total_product_revenue Desc;

---------  What city has the biggest Revenue? ----------
Select
city,
sum(Total) as Total_revenue_per_city
from walmart_sales.`walmartsalesdata.csv`
Group by city
Order by Total_revenue_per_city Desc;

Select
branch,
city,
sum(Total) as Total_revenue_per_city
from walmart_sales.`walmartsalesdata.csv`
Group by city, branch
Order by Total_revenue_per_city Desc;
----------- What product has the largest VAT-----------
select
product_line,
sum(Tax) as VAT_per_product
from walmart_sales.`walmartsalesdata.csv`
Group by product_line
Order by VAT_per_product Desc;


---------- which branch sold more products than average sold by others------------
Select
Branch,
Avg (Total) as Average_Sales_per_Branch
from walmart_sales.`walmartsalesdata.csv`
Group by Branch
Order by Average_Sales_per_Branch Desc;

Select
Branch,
Avg (Total) as Average_Sales_per_Branch
from walmart_sales.`walmartsalesdata.csv`
Group by Branch
Having sum(Total) > (Select Avg(Total) from walmart_sales.`walmartsalesdata.csv`);

--------- What is the most common product line by gender ----------
Select
Gender, 
product_line,
Count(distinct Gender) As Total_count_gender
from walmart_sales.`walmartsalesdata.csv`
Group by Gender, product_line
Order by Total_count_gender;


------- Average rating for each product ---------------
Select 
product_line,
Round(Avg (Rating), 2) as Average_rating_per_product
from walmart_sales.`walmartsalesdata.csv`
Group by Product_line
Order by Average_rating_per_product Desc;

--------- Product line information ---------------

