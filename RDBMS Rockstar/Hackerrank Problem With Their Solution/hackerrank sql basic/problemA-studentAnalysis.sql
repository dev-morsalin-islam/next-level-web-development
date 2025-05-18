

-- objective: return student who got less then 100 marks in 3 subjects with merge 2 tables 
SELECT S.ROLL_NUMBER, S.NAME FROM STUDENT_INFORMATION AS S
    LEFT JOIN EXAMINATION_MARKS AS M
        ON S.ROLL_NUMBER = M.ROLL_NUMBER 
            WHERE M.SUBJECT_ONE + M.SUBJECT_TWO + M.SUBJECT_THREE <100;