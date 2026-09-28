USE Database_Proyek_1;
SELECT * FROM happy2019;

-- Join kedua table dan melihat perubahan
CREATE VIEW Happiness_2018_2019 AS
With Joint_table as (SELECT happy2018.Country_or_region, 
        happy2018.Overall_rank AS Rank_2018,
        happy2018.Score AS Score_2018,
        happy2018.GDP_per_capita AS GDP_2018,
        happy2018.Social_support AS Social_2018,
        happy2018.Healthy_life_expectancy AS Life_2018,
        happy2018.Freedom_to_make_life_choices AS Freedom_2018,
        happy2018.Generosity AS Generosity_2018,
        happy2018.Perceptions_of_corruption AS Corruption_2018, 
        happy2019.Overall_rank AS Rank_2019,
        happy2019.Score AS Score_2019,
        happy2019.GDP_per_capita AS GDP_2019,
        happy2019.Social_support AS Social_2019,
        happy2019.Healthy_life_expectancy AS Life_2019,
        happy2019.Freedom_to_make_life_choices AS Freedom_2019,
        happy2019.Generosity AS Generosity_2019,
        happy2019.Perceptions_of_corruption AS Corruption_2019
FROM happy2018
INNER JOIN happy2019
ON happy2018.Country_or_region = happy2019.Country_or_region)

SELECT Rank_2019, Country_or_region,
CAST(Rank_2019 AS FLOAT) - CAST(Rank_2018 AS FLOAT) AS Pertumbuhan_Rank,
    CAST(Score_2019 AS FLOAT) - CAST(Score_2018 AS FLOAT) AS Pertumbuhan_Score,
    CAST(GDP_2019 AS FLOAT) - CAST(GDP_2018 AS FLOAT) AS Pertumbuhan_GDP,
    CAST(Social_2019 AS FLOAT) - CAST(Social_2018 AS FLOAT) AS Pertumbuhan_Social_Support,
    CAST(Life_2019 AS FLOAT) - CAST(Life_2018 AS FLOAT) AS Pertumbuhan_Health_Expectancy,
    CAST(Freedom_2019 AS FLOAT) - CAST(Freedom_2018 AS FLOAT) AS Pertumbuhan_Choices_Freedom,
    CAST(Generosity_2019 AS FLOAT) - CAST(Generosity_2018 AS FLOAT) AS Pertumbuhan_Generosity,
    CAST(Corruption_2019 AS FLOAT) - CAST(Corruption_2018 AS FLOAT) AS Pertumbuhan_Corruption 
    FROM Joint_table;

-- melihat negara dengan capita tinggi dan ranking mereka dalam kebahagiaan
WITH Rich_capita2018 AS
( SELECT Country_or_region AS RICH_COUNTRY, GDP_per_capita, Overall_rank from happy2018 
WHERE GDP_per_capita > 1300)

SELECT * FROM Rich_capita2018
ORDER BY Overall_rank;

WITH Rich_capita2019 AS
( SELECT Country_or_region AS RICH_COUNTRY, GDP_per_capita, Overall_rank from happy2019 
WHERE GDP_per_capita > 1300)

SELECT * FROM Rich_capita2019
ORDER BY Overall_rank;

-- Melihat seberapa penting kebebasan untuk memilih pililhan hidup dengan ranking kebahagiaan
SELECT Freedom_to_make_life_choices, Overall_rank FROM happy2018
ORDER BY Freedom_to_make_life_choices DESC;

SELECT Freedom_to_make_life_choices, Overall_rank FROM happy2019
ORDER BY Freedom_to_make_life_choices DESC;

-- Meng-order Generosity dan melihat relasinya dengan kebahagiaan
SELECT Country_or_region, 
CASE 
    WHEN Generosity <=100 THEN 'LOW'
    WHEN Generosity <= 200 THEN 'AVERAGE'
    WHEN Generosity >200 THEN 'HIGH'
END AS Generosity_Level, 
Overall_rank
FROM happy2019
ORDER BY Overall_rank;

-- Melihat hubungan perceptions of corruption dengan happiness rank
SELECT RANK() OVER(ORDER BY Perceptions_of_corruption ASC) AS Corruptions_rank, 
Perceptions_of_corruption,
Country_or_region, 
Overall_rank FROM happy2019;

SELECT RANK() OVER(ORDER BY Perceptions_of_corruption ASC) AS Corruptions_rank, 
Perceptions_of_corruption,
Country_or_region, 
Overall_rank FROM happy2018;

--Melihat Hubungan Healthy Life Expectancy dengan GDP per Capita dan kebahagiaan
WITH Hubungan_Life_Expectancy AS(
SELECT 
Healthy_life_expectancy, Score,
CASE 
    WHEN Healthy_life_expectancy <= 500 THEN 'LOW'
    WHEN Healthy_life_expectancy <= 700 THEN 'AVERAGE'
    ELSE'HIGH'
END AS Health_Expectancy_Group,
GDP_per_capita, 
Country_or_region,
Overall_rank FROM happy2019
)

SELECT AVG(Healthy_life_expectancy) AS Avg_Life_Expectancy, 
AVG(GDP_per_capita) AS Avg_GDP_Capita,
Health_Expectancy_Group, AVG(Score) AS Avg_Score 
FROM Hubungan_Life_Expectancy
GROUP BY Health_Expectancy_Group
ORDER BY Avg_Life_Expectancy DESC;