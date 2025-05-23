

-- MAKE TABLE WHERE DELETED EMPLOYEES WILL BE STORE
CREATE TABLE DELETED_EMPLOYEES_AUDIT(
    NAME VARCHAR(100),
    SALARY INT,
    ID INT,
    DEPARTMENT_ID INT,
    HIRE_DATE DATE,
    DELETED_AT TIMESTAMP
);
-- MAKE TRIGGER
CREATE OR REPLACE FUNCTION SAVE_DELETED_EMPLOYEES()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL
    AS
    $$
        BEGIN
            INSERT INTO DELETED_EMPLOYEES_AUDIT(NAME, SALARY,  ID, DEPARTMENT_ID,HIRE_DATE, DELETED_AT)
                VALUES (OLD.EMPLOYEE_NAME, OLD.SALARY, OLD.EMPLOYEE_ID, OLD.DEPARTMENT_ID, OLD.HIRE_DATE, NOW());
            
            RETURN OLD;

        END;
    $$;


CREATE OR REPLACE TRIGGER SAVE_DELETED_EMPLOYEES_TRIGGER
BEFORE DELETE
ON EMPLOYEES
    FOR EACH ROW
    EXECUTE FUNCTION SAVE_DELETED_EMPLOYEES();




SELECT * FROM EMPLOYEES;
DELETE FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 2;
DELETE FROM DELETED_EMPLOYEES_AUDIT
    WHERE ID = 2;
SELECT *  FROM DELETED_EMPLOYEES_AUDIT;

-- now make reverse trigger => after delete audit table its data will be store in employees table 


CREATE FUNCTION RESTORE_EMPLOYEES()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
    BEGIN
        INSERT INTO EMPLOYEES(EMPLOYEE_NAME, EMPLOYEE_ID, DEPARTMENT_ID, SALARY, HIRE_DATE)
        VALUES(
            OLD.NAME,
            OLD.ID,
            OLD.DEPARTMENT_ID,
            OLD.SALARY,
            OLD.HIRE_DATE
        );
        RETURN OLD;
    END
$$

CREATE OR REPLACE TRIGGER RESTORE_EMPLOYEE_TRIGGER
BEFORE DELETE
    ON DELETED_EMPLOYEES_AUDIT
    FOR EACH ROW
    EXECUTE FUNCTION RESTORE_EMPLOYEES();