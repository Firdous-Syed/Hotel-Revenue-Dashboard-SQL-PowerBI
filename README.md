
# Hotel Revenue Dashboard
PROJECT OVERVIEW:

This project presents an interactive Hotel Revenue Dashboard built in Power BI, using the database created in SSMS.

PROBLEM STATEMENT:

1. Is the Hotel revenue growing by year?
2. Should we increase our parking space?
3. What trends can we see in the data?

TOOLS USED:

1. CSV/Excel
2. SSMS
3. SQL
4. Power BI
5. Power Query Editor
6. DAX

Basic Steps:

1. Create a database
2. Query & analyze data using SQL
3. Load & transform data in Power BI
4. Create visuals to understand the trends in Power BI

#Create a database

Created a database in SQL server management studio(SSMS).
Imported the raw data using the import wizard.


#Query & Analyze data
Combining all the tables data and creating a temp table:

--Fetching Data from the tables
Select * from dbo.[2018]

Select * from dbo.[2019]

Select * from dbo.[2020]

--Grouping all 3 tables in one
Select * from dbo.[2018]
Union
Select * from dbo.[2019]
Union
Select * from dbo.[2020]
--Creating Temp table using CTE 
WITH Hotels AS (
    SELECT * FROM dbo.[2018]
    UNION
    SELECT * FROM dbo.[2019]
    UNION
    SELECT * FROM dbo.[2020]
)

SELECT *
FROM Hotels 
LEFT JOIN dbo.market_segment
ON Hotels.market_segment = dbo.market_segment.market_segment
LEFT JOIN dbo.meal_cost
ON Hotels.meal = dbo.meal_co


1. Is the Hotel revenue growing by year?
In our dataset we don’t have revenue, but we do have adr (Average Daily Rate), stays_in_week_nights, and stays_in _weekend_nights. So, we will create a new column revenue by using the data of these three columns.

SELECT 
arrival_date_year,
hotel,
ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights) * adr),2) AS Revenue
FROM Hotels
GROUP BY arrival_date_year,hotel

Observation: Revenue increased from 2018 to 2019, but it began to decrease from 2019 to 2020.

2. Should we increase our parking space?

Used DAX to create a new measure
Parking Percentage = SUM(Hotel[required_car_parking_spaces])/Hotel[TotalNights]

Observation: The data did not present any sufficient evidence to suggest if increase in parking spaces is needed.

3. What trends can we see in the data?
Obervations:
The Gross Revenue has increased from 2018 to 2019 and then decreased from 2019 to 2020.

Net Revenue by Hotel type did not show any major difference with 'City Hotel' being at $13.2M and 'Resort Hotel' being at $12.69M



