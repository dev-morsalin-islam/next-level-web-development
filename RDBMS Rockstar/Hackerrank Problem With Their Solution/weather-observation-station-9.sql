
-- problem link: https://www.hackerrank.com/challenges/weather-observation-station-9/problem?isFullScreen=true
-- objective: select those distinct cities which name does not start with vowel

SELECT DISTINCT CITY FROM STATION
    WHERE NOT (
        CITY LIKE 'a%' 
        OR CITY LIKE 'e%' 
        OR CITY LIKE 'i%' 
        OR CITY LIKE 'o%' 
        OR CITY LIKE 'u%'
    );