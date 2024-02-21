
CREATE TABLE IF NOT EXISTS OLYMPICS_HISTORY (
    id INT,
    name VARCHAR(255),
    sex VARCHAR(10),
    age VARCHAR(255),
    height VARCHAR(255),
    weight VARCHAR(255),
    team VARCHAR(255),
    noc VARCHAR(10),
    games VARCHAR(50),
    year INT,
    season VARCHAR(10),
    city VARCHAR(255),
    sport VARCHAR(255),
    event VARCHAR(255),
    medal VARCHAR(20)
);
SELECT*from OLYMPICS_HISTORY;
select count(1) from OLYMPICS_HISTORY;


CREATE TABLE IF NOT EXISTS OLYMPICS_HISTORY_NOC_REGIONS (
    noc VARCHAR(10),
    region VARCHAR(255),
    notes VARCHAR(255)
);
select*from OLYMPICS_HISTORY_NOC_REGIONS;


#1 How many olympics games have been held?
select count(distinct(games)) as total_olympics_played
from olympics_history;

-- 2. List down all Olympics games held so far.
select distinct(year), season,city 
from olympics_history
order by year;

-- 3. Mention the total no of nations who participated in each olympics game?
select games, count(distinct region) as total_country
from olympics_history oh 
join olympics_history_noc_regions ohn on ohn.noc = oh.noc
group by games order by games;

-- 4 Which nation has participated in all of the olympic games
#using window function
WITH OlympicCounts AS (
  SELECT region, COUNT(DISTINCT games) AS total_olympics_played,
         RANK() OVER (ORDER BY COUNT(DISTINCT games) DESC) AS r
  FROM olympics_history oh
  JOIN olympics_history_noc_regions onc ON onc.noc = oh.noc
  GROUP BY region
)

SELECT region, total_olympics_played
FROM OlympicCounts
WHERE r = 1;

-- 5. Identify the sport which was played in all summer olympics.

SELECT sport, COUNT(distinct games) AS no_of_games
FROM (
  SELECT DISTINCT games, sport
  FROM olympics_history
  WHERE season = 'Summer'
) AS t2
GROUP BY sport
HAVING COUNT(distinct games) = (
  SELECT COUNT(DISTINCT games)
  FROM olympics_history
  WHERE season = 'Summer'
)
# 6 Which Sports were just played only in one olympics season

with cte as (select sport, count(distinct games) as no_of_season_played
from olympics_history
group by sport
order by sport,no_of_season_played
)
select * from cte where no_of_season_played =1;

-- 7. Fetch the total no of sports played in each olympic games.
select games,count(distinct sport) as total_games_played
from olympics_history 
group by games
order by games;

-- 8. Fetch the top 5 athletes who have won the most gold medals.
with cte as (select name,team,
count(medal),dense_rank() over(order by count(medal) desc) as rnk 
from olympics_history
where medal = 'Gold'
group by name,team)
select * from cte where rnk<6;

-- 9. List down total gold, silver and bronze medals won by each country.
select region,
count(case when medal = 'Gold' then 1 end) as gold,
count(case when medal = 'Silver' then 1 end) as silver,
count(case when medal = 'Bronze' then 1 end) as bronze
from olympics_history oh
JOIN olympics_history_noc_regions onc ON onc.noc = oh.noc
group by region
order by gold desc,silver desc,bronze desc;

-- 10. Break down all olympic games where India won medal for Hockey and how many medals in each olympic games
select team,games,count(medal) as hockey_medal
from olympics_history
where sport = 'Hockey' and team = 'India' and medal<>'NA'
group by team,games
order by games;

