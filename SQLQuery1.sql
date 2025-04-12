Select * from dbo.[2018]

Select * from dbo.[2019]

Select * from dbo.[2020]

--Grouping all 3 tables in one
Select * from dbo.[2018]
Union
Select * from dbo.[2019]
Union
Select * from dbo.[2020]

WITH Hotels AS (
    SELECT * FROM dbo.[2018]
    UNION
    SELECT * FROM dbo.[2019]
    UNION
    SELECT * FROM dbo.[2020]
)

--Query for merging all the tables
/*SELECT *
FROM Hotels 
LEFT JOIN dbo.market_segment
ON Hotels.market_segment = dbo.market_segment.market_segment
LEFT JOIN dbo.meal_cost
ON Hotels.meal = dbo.meal_cost.meal*/

--Query for "Is the hotel revenue growing yearly and also which hotel type is it?"
SELECT 
arrival_date_year,
hotel,
ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights) * adr),2) AS Revenue
FROM Hotels
GROUP BY arrival_date_year,hotel


--Query for "Should we increase our parking space?"
