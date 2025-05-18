

-- problem link: https://www.hackerrank.com/challenges/weather-observation-station-6/problem?isFullScreen=true

SELECT DISTINCT CITY FROM STATION
    WHERE CITY LIKE 'a%' 
    OR CITY LIKE 'e%' 
    OR CITY LIKE 'i%' 
    OR CITY LIKE 'o%' 
    OR CITY LIKE 'u%';