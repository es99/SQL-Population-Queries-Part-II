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

-- What country had the smallest population in 2007?
SELECT countries.name, countries.continent,
	population_years.year, MIN(population_years.population) AS menor_populacao
FROM countries JOIN population_years
ON population_years.country_id = countries.id
WHERE population_years.year = '2007';

-- What is the average population of Poland during the time period covered by this dataset?
SELECT countries.name, countries.continent,
	ROUND(AVG(population_years.population), 3) AS Media_populacao
FROM countries JOIN population_years
ON population_years.country_id = countries.id
WHERE countries.name = 'Poland';

-- How many countries have the word "The" in theis names?
SELECT COUNT(*) AS The_in_their_names
FROM countries
WHERE name LIKE '% The%';

-- What was the total population of each continent in 2010?
SELECT countries.continent, population_years.year, ROUND(SUM(population_years.population)) AS Soma_da_populacao
FROM countries JOIN population_years
ON population_years.country_id = countries.id
WHERE population_years.year = '2010'
GROUP BY countries.continent;
