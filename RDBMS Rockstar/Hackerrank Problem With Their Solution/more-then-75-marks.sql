
-- problem link: https://www.hackerrank.com/challenges/more-than-75-marks/problem?isFullScreen=true


-- OBJECTIVE: SELECT STUDENTS WHO GOT MORE THAN 75 MARKS. RETURN ORDER BY STUDENT NAME LAST 3 CHAR, IF MORE THEN 1 STUDENT LAST 3 CHAR ARE SAME THEN MAKE ORDER BY THEIR ID


SELECT NAME FROM STUDENTS AS S
    WHERE MARKS > 75
    ORDER BY RIGHT(S.NAME, 3), S.ID;