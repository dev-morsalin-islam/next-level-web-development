

CREATE DATABASE LIBRARY;
USE LIBRARY;


CREATE TABLE  BOOK(
	NAME VARCHAR(300) NOT NULL,
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PRICE INT NOT NULL,
    AUTHOR VARCHAR(200)
    
);
-- INSERT DATA

INSERT INTO BOOK (NAME, PRICE, AUTHOR) VALUES
('Introduction to Algorithms', 700, 'Thomas H. Cormen'),
('Effective Java', 480, 'Joshua Bloch'),
('Java Concurrency in Practice', 600, 'Brian Goetz'),
('Learning React', 430, 'Alex Banks'),
('Fullstack D3 and Data Visualization', 650, 'Amelia Wattenberger'),
('Grokking Algorithms', 370, 'Aditya Bhargava'),
('Refactoring', 520, 'Martin Fowler'),
('Cracking the Coding Interview', 620, 'Gayle Laakmann McDowell'),
('Code Complete', 580, 'Steve McConnell'),
('Don''t Make Me Think', 340, 'Steve Krug'),
('The Clean Coder', 500, 'Robert C. Martin'),
('Fluent Python', 680, 'Luciano Ramalho'),
('Automate the Boring Stuff with Python', 390, 'Al Sweigart'),
('Pro Git', 250, 'Scott Chacon'),
('The DevOps Handbook', 560, 'Gene Kim'),
('Continuous Delivery', 720, 'Jez Humble'),
('Test-Driven Development', 410, 'Kent Beck'),
('Programming TypeScript', 480, 'Boris Cherny'),
('Typescript Quickly', 420, 'Yakov Fain'),
('JavaScript Everywhere', 350, 'Adam D. Scott'),
('The Road to React', 360, 'Robin Wieruch');


-- NOW WORK WITH SELECTION

-- ########### ALL SELECTION ####

SELECT * FROM BOOK;
-- SELECT INDIVIDUAL COLUMN

SELECT NAME AS "BOOK NAME", AUTHOR, PRICE 
	FROM BOOK;
    
--  Working with where

SELECT NAME , AUTHOR, PRICE FROM BOOK
	WHERE PRICE > 350;