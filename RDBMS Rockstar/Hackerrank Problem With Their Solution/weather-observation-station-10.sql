-- objective: select those city which does not end with vowel
-- problem link: https://www.hackerrank.com/challenges/weather-observation-station-10/problem?isFullScreen=true

SELECT DISTINCT CITY FROM STATION
    WHERE NOT
        (
            CITY LIKE '%A'
            OR CITY LIKE '%E'
            OR CITY LIKE '%I'
            OR CITY LIKE '%O'
            OR CITY LIKE '%U'
        )
        
        