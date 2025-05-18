
-- objective: determine triangle type with associated 3 sides value
-- problem link: https://www.hackerrank.com/challenges/what-type-of-triangle/problem?isFullScreen=true

SELECT
CASE
    WHEN A + B <= C OR B + C <= A OR C + A <= B THEN 'Not A Triangle'
    WHEN A = B AND A = C THEN 'Equilateral'
    WHEN A = B OR B = C OR C = A THEN 'Isosceles'
    
    ELSE 'Scalene'
END
FROM TRIANGLES;