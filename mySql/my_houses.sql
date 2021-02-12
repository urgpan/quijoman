use house_price_regression;

# 1. CREATE TABLE house_price_regression.house_price_data
# 2. Create a table `house_price_data` with the same columns as given in the csv file. 
# Please make sure you use the correct data types for the columns.
# 3. Import the data from the csv file into the table. Before you import the data into the empty table, make sure that you have deleted the headers from the csv file. To not modify the original data, if you want you can create a copy of the csv file as well. 
# Note you might have to use the following queries to give permission to SQL to import data from csv files in bulk:
drop table if exists house_price_data;
CREATE TABLE house_price_regression.house_price_data (
	id VARCHAR(50) NOT NULL,
    the_sale_date varchar(50) NOT NULL,
    bedrooms INT NOT NULL,
    bathrooms INT NOT NULL,
    sqft_living INT NOT NULL,
    sqft_lot INT NOT NULL,
    floors INT NOT NULL,
    waterfront INT NOT NULL,
    vista INT NOT NULL,
	state INT NOT NULL,
    grade INT NOT NULL,
    sqft_above INT NOT NULL,
    sqft_basement INT NOT NULL,
    yr_built INT NOT NULL, 
    yr_renovated INT NOT NULL,
    zipcode INT NOT NULL,
    latitude INT NOT NULL,
    longtitue INT NOT NULL,
    sqft_living15 INT NOT NULL,
    sqft_lot15 INT NOT NULL,
    price INT NOT NULL,
    PRIMARY KEY (id)

);
LOAD DATA LOCAL INFILE "C:/Users/jw156/Ironhack/Day20/data_mid_bootcamp_project_regression/regression_data.csv"
INTO TABLE house_price_regression.house_price_data 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
-- (id, @date_time_variable)
-- SET the_sale_date = str_to_date(@date_time_variable, '%d-%c-%y');


# 4.  Select all the data from table `house_price_data` to check if the data was imported correctly

select * FROM house_price_data;

# 5.  Use the alter table command to drop the column `date` from the database, as we would not use it in the analysis with SQL.
# Select all the data from the table to verify if the command worked. Limit your returned results to 10.

alter table house_price_data
drop column the_sale_date;

select * from house_price_data
LIMIT 10;

# 6. Use sql query to find how many rows of data you have.
select count(id) from house_price_data;

# 7.  Now we will try to find the unique values in some of the categorical columns:

    # - What are the unique values in the column `bedrooms`?
select distinct(bedrooms) as unique_values from house_price_data
order by bedrooms DESC;    

    # - What are the unique values in the column `bathrooms`?
select distinct(bathrooms) as unique_values from house_price_data
order by bathrooms desc;

    #- What are the unique values in the column `floors`?
select distinct(floors) as unique_values from house_price_data
order by floors desc;

    #- What are the unique values in the column `condition`?
select distinct(state) as unique_values from house_price_data
order by state desc;

    #- What are the unique values in the column `grade`?
select distinct(grade) as unique_values from house_price_data
order by grade desc;

# 8.  Arrange the data in a decreasing order by the price of the house. 
# Return only the IDs of the top 10 most expensive houses in your data.

select id from house_price_data
order by price DESC
LIMIT 10;

# 9.  What is the average price of all the properties in your data?
select avg(price) as AveragePrice from house_price_data;

-- 10. In this exercise we will use simple group by to check the properties of some of the categorical variables in our data

-- What is the average price of the houses grouped by bedrooms? 
-- The returned result should have only two columns, bedrooms and Average of the prices. 
--  Use an alias to change the name of the second column.
select bedrooms, avg(price) as average_house_price from house_price_data
group by bedrooms
order by bedrooms desc;

-- What is the average `sqft_living` of the houses grouped by bedrooms? 
-- The returned result should have only two columns, bedrooms and Average of the `sqft_living`. 
-- Use an alias to change the name of the second column.
select bedrooms, avg(sqft_living) as Average_Living_Size from house_price_data
group by bedrooms
order by bedrooms desc;

-- What is the average price of the houses with a waterfront and without a waterfront? 
-- The returned result should have only two columns, waterfront and `Average` of the prices.
-- Use an alias to change the name of the second column.
select waterfront, avg(price) from house_price_data
group by waterfront;

-- Is there any correlation between the columns `condition` and `grade`? 
-- You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column.
-- Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
select state, grade from house_price_regression
group by  state
order by state, grade DESC;

select (avg(state * grade) - avg(state ) + avg( grade ) ) / ( stddev( state) * stddev(grade)) as 'correlation' from house_price_data;


-- 11. One of the customers is only interested in the following houses:
-- Number of bedrooms either 3 or 4
-- Bathrooms more than 3
-- One Floor
-- No waterfront
-- Condition should be 3 at least
-- Grade should be 5 at least
-- Price less than 300000

-- For the rest of the things, they are not too concerned. 
-- Write a simple query to find what are the options available for them?

select * from house_price_data
WHERE bathrooms > 3
AND floors = 1
AND waterfront = 0
AND state >= 3
AND grade >= 5
and price < 300000
AND bedrooms = 3 or bedrooms = 4;

-- 12. Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database. 
-- Write a query to show them the list of such properties. You might need to use a sub query for this problem.

select * from house_price_data
where price > (
select 2*(avg(price)) from house_price_data)
ORDER BY price DESC;

-- 13. Since this is something that the senior management is regularly interested in, create a view of the same query.
CREATE VIEW properties_twice_average_price as
select * from house_price_data
where price > (
select 2*(avg(price)) from house_price_data)
ORDER BY price DESC;

-- 14. Most customers are interested in properties with three or four bedrooms. 
-- What is the difference in average prices of the properties with three and four bedrooms?
		
select (SELECT avg(price) from house_price_data
where bedrooms = 4) as four_bedroom_price, (SELECT avg(price) from house_price_data
where bedrooms = 3) as three_bedroom_price, (SELECT avg(price) from house_price_data
where bedrooms = 4) - (SELECT avg(price) from house_price_data
where bedrooms = 3) as difference;


-- 15. What are the different locations where properties are available in your database? (distinct zip codes)
select distinct zipcode from house_price_data;


-- 16. Show the list of all the properties that were renovated.
select id, yr_renovated from house_price_data
where yr_renovated != 0
order by yr_renovated;

-- 17. Provide the details of the property that is the 11th most expensive property in your database.
select * from house_price_data
ORDER BY price DESC
LIMIT 11, 1;

