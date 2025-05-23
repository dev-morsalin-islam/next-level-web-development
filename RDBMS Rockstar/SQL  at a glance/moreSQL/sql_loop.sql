

SELECT EMPLOYEE_ID, EMPLOYEE_NAME, DEPARTMENT_ID, SALARY, HIRE_DATE FROM EMPLOYEES;

CREATE TABLE COPY_TABLE
(
    ID INT,
    NAME VARCHAR(150),
    SALARY INT
);


DO
$$
    -- DECLARATION
    DECLARE
        REC RECORD; -- REC VARIABLE DATA TYPE WILL BE RECORD

     
    BEGIN
           FOR REC IN SELECT 
            EMPLOYEE_ID, 
            EMPLOYEE_NAME, 
            DEPARTMENT_ID, 
            SALARY, 
            HIRE_DATE 
                FROM EMPLOYEES
            LOOP
                IF REC.SALARY > 50000 THEN -- INSERT THOSE EMPLOYEES WHO GET GREATER THEN 50k SALARY
                    -- MY CUSTOM CONDITION 
                    INSERT INTO COPY_TABLE(ID, NAME, SALARY)
                    VALUES
                        (REC.EMPLOYEE_ID, REC.EMPLOYEE_NAME, REC.SALARY);

                END IF;
            END LOOP;
    END
$$;
SELECT * FROM COPY_TABLE;

/*
    PROCESS
    MAKE A TABLE
    DECLARE A VARIABLE TYPE RECORD
    FOR VARIABLE IN QUERY LOOP
        WORK
    END LOOP;
*/



-- function prime numbers from 1 to n optimization version n * sqrt(n) complexity

-- CREATE OR REPLACE FUNCTION PRIME_NUMBERS(PARAM_N INT)
-- RETURNS TABLE(PRIME_NUMBER INT)
-- LANGUAGE PLPGSQL
-- AS
-- $$
-- DECLARE
--     NUM INT;
--     NUM2 INT;
--     IS_PRIME BOOLEAN;
-- BEGIN
--     FOR NUM IN 2..PARAM_N LOOP
--         IS_PRIME := TRUE;

--         FOR NUM2 IN 2..CEIL(SQRT(NUM)) LOOP
--             IF NUM % NUM2 = 0 AND NUM2 <> NUM THEN
--                 IS_PRIME := FALSE;
--                 EXIT;
--             END IF;
--         END LOOP;

--         IF IS_PRIME THEN
--             PRIME_NUMBER := NUM;
--             RETURN NEXT;
--         END IF;
--     END LOOP;
-- END;
-- $$;


-- SELECT * FROM PRIME_NUMBERS(1000);


CREATE OR REPLACE FUNCTION PRIME_NUMBERS(N INT)
RETURNS TABLE(PRIME_NUMBER INT)
LANGUAGE PLPGSQL
AS
$$
    DECLARE
        I INT;
        J INT;
        IS_PRIME BOOLEAN;
    BEGIN
        FOR I IN 2..N LOOP

            IS_PRIME := TRUE;
            FOR J IN 2..CEIL(SQRT(I)) LOOP
                IF I % J = 0 THEN
                    IS_PRIME := FALSE;
                    EXIT; --  STOP OUTER LOOP
                END IF;
            END LOOP;
            IF IS_PRIME = TRUE THEN
                PRIME_NUMBER := I;
                RETURN NEXT;
            END IF;
        END LOOP;
    END;
$$;

SELECT * FROM PRIME_NUMBERS(100);