-- 1.	How many rows are in the data_analyst_jobs table?

SELECT COUNT (*)
FROM data_analyst_jobs;

-- 1A. 1793

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
Limit 10;

-- 2A. ExxonMobil

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT (location)
FROM data_analyst_jobs
Where location = 'TN';


SELECT COUNT (location)
FROM data_analyst_jobs
Where location = 'TN' OR location = 'KY';

-- 3A. TN = 21. TN + KY = 27

-- 4.	How many postings in Tennessee have a star rating above 4?

SELECT star_rating, location
FROM data_analyst_jobs
WHERE star_rating > 4 AND location = 'TN';

-- 4A. 3

-- 5.	How many postings in the dataset have a review count between 500 and 1000?

SELECT review_count
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- 5A. 151

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT AVG(star_rating) AS avg_rating, location AS state
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC;

-- 6A. NE

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT DISTINCT title
FROM data_analyst_jobs;

-- 7A. 881

-- 8.	How many unique job titles are there for California companies?

SELECT DISTINCT title, location
FROM data_analyst_jobs
WHERE location = 'CA';

-- 8A. 230

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT title, review_count, AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY title, review_count;

-- 9A. 95

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT title, review_count, AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY title, review_count
ORDER BY avg_star_rating DESC;

-- 10A. Sr. Data Analyst - Media, 4.199

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE LOWER(title) LIKE '%analyst%';

-- 11A.774

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE LOWER(title) NOT LIKE '%analyst%' AND LOWER(title) NOT LIKE '%analytics%';

--12A. 4, Tableau.



-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
--  - Disregard any postings where the domain is NULL. 
--  - Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--   - Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?