Case Study on Olympics Data
I conducted a comprehensive case study on a dataset that contained information about all Olympic games played from Athens 1896 to Rio 2016. The dataset includes two main tables: olympics_history and noc_regions.

Dataset Information
Tables:
olympics_history: Individual athlete information in Olympic events.
noc_regions: National Olympics participant and their regions.
Dataset Overview
athlete_events.csv:

Total Rows: 45175
Total Columns: 15
Each row corresponds to an individual athlete competing in an Olympic event.
Column	Description
ID	Unique number for each athlete
Name	Athlete's name
Sex	M or F
Age	Integer
Height	In centimeters
Weight	In kilograms
Team	Team name
NOC	National Olympic Committee 3-letter code
Games	Year and season
Year	Integer
Season	Summer or Winter
City	Host city
Sport	Sport
Event	Event
Medal	Gold, Silver, Bronze, or NA
noc_regions:

Total Rows: 231

Total Columns: 3

Column	Description
NOC	National Olympic Committee 3-letter code
Region	Region name
Notes	Additional information about the region
20 Questions Explored
From the dataset, I explored the following  questions utilizing MYSQL:

How many Olympic games have been held?
List down all Olympic games held so far.
Mention the total number of nations that participated in each Olympic game.
Which nation has participated in all of the Olympic games?
Identify the sport played in all Summer Olympics.
Which sports were played only once in the Olympics?
Fetch the total number of sports played in each Olympic game.
Fetch the top 5 athletes who have won the most gold medals.
List down total gold, silver and bronze medals won by each country.
Break down all olympic games where India won medal for Hockey and how many medals in each olympic games



