USE LIBRARY;

-- SYNTAX => DELETE FROM table_name WHERE condition;
SET SQL_SAFE_UPDATES = FALSE; -- TO DELETE WE HAVE TO CHNAGE UPDATE MODE
DELETE FROM BOOK
	WHERE PRICE < 700 ; -- DELETE BOOK WHICH PRICE LESS THEN 700

SET SQL_SAFE_UPDATES = TRUE;

