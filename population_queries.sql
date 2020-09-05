-- How many entries in the database are from Africa?
SELECT continent, COUNT(*) AS entradas 
FROM countries
WHERE continent = 'Africa';

-- What was the total population of Oceania in 2005?
SELECT countries.continent, SUM(population_years.population) AS total_populacao
FROM population_years JOIN countries
ON population_years.country_id = countries.id
WHERE countries.continent = 'Oceania' AND year = '2005';

-- What is the average population of countries in South America in 2003?
SELECT countries.continent, ROUND(AVG(population_years.population), 2) AS media_populacao
FROM population_years
JOIN countries ON population_years.country_id = countries.id
WHERE countries.continent = 'South America' AND population_years.year = '2003';