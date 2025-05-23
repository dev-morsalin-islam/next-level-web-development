

/*
    Task: for each pair of city and product return the names of city and product as well the total amount spent on the product to 2 decimal places.
    Order the result by the amount spent from high to low then by city name and product name in ascending order
*/

-- making all tables


-- ############# CITY TABLE

CREATE TABLE CITY(
    ID INT PRIMARY KEY,
    CITY_NAME VARCHAR(200),
    POSTAL_CODE VARCHAR(10),
    COUNTRY_ID INT
);

-- INSERTION

INSERT INTO CITY (ID, CITY_NAME, POSTAL_CODE, COUNTRY_ID) 
VALUES
    (1, 'West Danielview', '77196', 104),
    (2, 'North Robertchester', '19926', 104),
    (3, 'West Pamela', '33686', 100),
    (4, 'South Lorraineview', '47393', 102),
    (5, 'Watkinsmouth', '16477', 100),
    (6, 'East Smithborough', '22224', 101),
    (7, 'Lake Jonesbury', '84218', 103),
    (8, 'Browntown', '60358', 105),
    (9, 'Greenville', '88032', 102),
    (10, 'New Robertstad', '56373', 101),
    (11, 'Lake Sandraborough', '72635', 105),
    (12, 'East Laurenmouth', '10135', 103),
    (13, 'Jacksonfurt', '67155', 101),
    (14, 'Smithtown', '78462', 100),
    (15, 'Port Kimberly', '11539', 100),
    (16, 'New Andreafort', '49551', 102),
    (17, 'East Alexis', '58222', 105),
    (18, 'West Jacobtown', '13129', 101),
    (19, 'Lake Brandonville', '64112', 105),
    (20, 'New Cynthiaborough', '30282', 104);


-- ########## CUSTOMER TABLE ###########
CREATE TABLE CUSTOMER(
    ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(150),
    CITY_ID INT NOT NULL,
    CUSTOMER_ADDRESS VARCHAR(200),
    CONTACT_INFO VARCHAR(200),
    FOREIGN KEY(CITY_ID) REFERENCES CITY(ID) ON DELETE CASCADE

);
-- INSERTION
INSERT INTO CUSTOMER (ID, CUSTOMER_NAME, CITY_ID, CUSTOMER_ADDRESS, CONTACT_INFO) 
VALUES
    (1, 'Justin Lewis', 19, '553 Nichols Rue, Lake Brandonville, FL 64112', 'ylowe@hotmail.com'),
    (2, 'Robert Beltran', 4, 'Unit 8537 Box 7492, DPO AE 40905', 'cooperbrittany@valencia.biz'),
    (3, 'Robert Fox', 8, '70244 Scott Club Apt. 776, West Marvinbury, MN 90892', 'davidfranklin@weaver.info'),
    (4, 'Charlene Hansen', 13, '109 Laura Fall Suite 144, Jeffersonview, HI 48522', 'llopez@hotmail.com'),
    (5, 'Bryan Marquez', 7, '8769 Campos Court Apt. 095, Amyport, OK 81778', 'allison01@frazier.net'),
    (6, 'Sean Vaughn', 14, '9428 Thomas Divide Apt. 026, Lake Stephen, PA 15213', 'brandonperez@luna.net'),
    (7, 'Jenna Walter', 11, '6124 Katelyn Run, South Philip, VA 23651', 'spowers@yahoo.com'),
    (8, 'Tamara Porter', 20, 'Unit 7193 Box 8552, DPO AE 24376', 'kevin92@gmail.com'),
    (9, 'Christopher Rogers', 15, '8213 Clark Trail, New Rebeccatown, AR 76032', 'adriana54@gmail.com'),
    (10, 'Matthew Figueroa', 2, '40694 Davis Cliffs Apt. 303, Brianmouth, MA 54230', 'anthony82@cox.net'),
    (11, 'Amy Carson', 12, '9633 April Crossroad, West Sarahport, OH 44455', 'ashley56@moore.org'),
    (12, 'Christine Chandler', 5, '00899 Haynes Crescent, Lake Elizabeth, ND 58105', 'oconnellanthony@yahoo.com'),
    (13, 'Julie Alexander', 3, '629 Henry Bypass, South Billyfurt, NV 89122', 'barbara24@hotmail.com'),
    (14, 'Samuel Wells', 6, '538 Ryan Road Suite 095, East Jennifer, IL 60411', 'gibsonkimberly@gmail.com'),
    (15, 'George Barnes', 10, '0816 Taylor Hill Apt. 615, Port Alexisshire, WI 53597', 'cynthia93@gmail.com'),
    (16, 'Nancy Murray', 1, '0748 Wright Union, East Megan, GA 30331', 'jennifer89@fitzgerald.info'),
    (17, 'Amber Fitzgerald', 9, '9929 Melissa Ramp, New Erinmouth, CO 80501', 'ian35@yahoo.com'),
    (18, 'Kaitlyn Jimenez', 18, 'Unit 1082 Box 0740, DPO AE 47920', 'miranda78@hotmail.com'),
    (19, 'Derek Wilkins', 16, '3645 Webb Crossroad, South Matthew, TN 37919', 'elizabethmanning@cameron.com'),
    (20, 'Emily Jordan', 17, '2023 Chelsea Station, New Stevenmouth, OR 97035', 'douglaswalker@jensen.biz');


-- ########## INVOICE TABLE #########
CREATE TABLE INVOICE(
    ID INT PRIMARY KEY,
    INVOICE_NUMBER VARCHAR(100),
    CUSTOMER_ID INT,
    USER_ACCOUNT_ID INT,
    TOTAL_PRICE DECIMAL(8,2),
    FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(ID) ON DELETE CASCADE
);

-- INSERTION

INSERT INTO INVOICE (ID, INVOICE_NUMBER, CUSTOMER_ID, USER_ACCOUNT_ID, TOTAL_PRICE) VALUES
    (1, 'INV-1001', 4, 501, 708.35),
    (2, 'INV-1002', 12, 502, 862.62),
    (3, 'INV-1003', 3, 503, 336.01),
    (4, 'INV-1004', 4, 504, 676.82),
    (5, 'INV-1005', 15, 505, 436.19),
    (6, 'INV-1006', 14, 506, 173.94),
    (7, 'INV-1007', 7, 507, 776.48),
    (8, 'INV-1008', 5, 508, 420.17),
    (9, 'INV-1009', 6, 509, 459.75),
    (10, 'INV-1010', 2, 510, 763.84),
    (11, 'INV-1011', 8, 511, 516.23),
    (12, 'INV-1012', 9, 512, 609.70),
    (13, 'INV-1013', 11, 513, 215.66),
    (14, 'INV-1014', 1, 514, 967.42),
    (15, 'INV-1015', 13, 515, 355.90),
    (16, 'INV-1016', 10, 516, 143.73),
    (17, 'INV-1017', 16, 517, 802.52),
    (18, 'INV-1018', 17, 518, 678.11),
    (19, 'INV-1019', 18, 519, 245.35),
    (20, 'INV-1020', 20, 520, 389.99);


-- ######### PRODUCT TABLE ##########
CREATE TABLE PRODUCT(
    ID INT PRIMARY KEY,
    SKU VARCHAR(200),
    PRODUCT_NAME VARCHAR(200),
    PRODUCT_DESCRIPTION VARCHAR(300),
    CURRENT_PRICE DECIMAL(8,2),
    QUANTITY_IN_STOCK DECIMAL(8,2),
    IS_ACTIVE BOOLEAN
);

-- INSERTION
INSERT INTO PRODUCT (ID, SKU, PRODUCT_NAME, PRODUCT_DESCRIPTION, CURRENT_PRICE, QUANTITY_IN_STOCK, IS_ACTIVE) 
VALUES
    (1, 'SKU001', 'Get', 'Around agreement card ten seven order.', 184.07, 98.63, TRUE),
    (2, 'SKU002', 'Feel', 'According significant great.', 163.59, 63.15, TRUE),
    (3, 'SKU003', 'Ok', 'Health claim myself maintain suggest whole issue.', 31.30, 97.93, FALSE),
    (4, 'SKU004', 'Last', 'Require rich develop card. Last at full animal.', 116.09, 5.13, TRUE),
    (5, 'SKU005', 'Fine', 'Give respond town lay mouth well story.', 67.78, 32.82, FALSE),
    (6, 'SKU006', 'There', 'Above across generation perform safe.', 195.61, 23.57, TRUE),
    (7, 'SKU007', 'Guy', 'Hotel amount personal they wall organization.', 110.26, 34.84, TRUE),
    (8, 'SKU008', 'Each', 'Street note process soon cultural small.', 115.12, 14.22, FALSE),
    (9, 'SKU009', 'Development', 'Single wide check.', 145.77, 73.32, TRUE),
    (10, 'SKU010', 'Goal', 'Through professor represent.', 82.25, 61.83, TRUE),
    (11, 'SKU011', 'Program', 'Help act they music sometimes professional above.', 65.32, 19.40, FALSE),
    (12, 'SKU012', 'Parent', 'Until measure yeah fill financial.', 97.98, 45.29, TRUE),
    (13, 'SKU013', 'Growth', 'Open guess blue.', 152.09, 80.75, TRUE),
    (14, 'SKU014', 'Office', 'Alone out myself.', 137.44, 57.80, FALSE),
    (15, 'SKU015', 'Evening', 'Employee positive good measure special.', 99.99, 29.66, TRUE),
    (16, 'SKU016', 'Teacher', 'Always guy cover.', 48.55, 66.28, TRUE),
    (17, 'SKU017', 'Business', 'Material son speak protect official.', 130.35, 94.12, TRUE),
    (18, 'SKU018', 'Price', 'Respond economy matter.', 111.47, 31.26, FALSE),
    (19, 'SKU019', 'Industry', 'Push feel floor citizen.', 173.88, 50.19, TRUE),
    (20, 'SKU020', 'Stage', 'Television issue organization goal base.', 87.56, 22.42, TRUE);


-- ############ INVOICE_ITEM TABLE #########
CREATE TABLE INVOICE_ITEM(
    ID INT PRIMARY KEY,
    INVOICE_ID INT,
    PRODUCT_ID INT,
    QUANTITY DECIMAL(8,2),
    PRICE DECIMAL(8,2),
    LINE_TOTAL_PRICE DECIMAL(8,2),
    FOREIGN KEY(INVOICE_ID) REFERENCES INVOICE(ID) ON DELETE CASCADE,
    FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCT(ID) ON DELETE CASCADE
);

-- INSERTION

INSERT INTO INVOICE_ITEM (ID, INVOICE_ID, PRODUCT_ID, QUANTITY, PRICE, LINE_TOTAL_PRICE) VALUES
    (1, 1, 10, 2.68, 221.10, 592.55),
    (2, 9, 1, 4.98, 243.15, 1210.89),
    (3, 7, 19, 2.95, 323.88, 955.45),
    (4, 2, 19, 1.46, 309.95, 452.53),
    (5, 3, 20, 4.07, 130.96, 533.01),
    (6, 20, 6, 2.87, 230.12, 660.44),
    (7, 11, 3, 1.99, 72.30, 143.88),
    (8, 4, 7, 3.21, 145.77, 467.94),
    (9, 8, 13, 2.56, 90.05, 230.53),
    (10, 6, 11, 3.14, 188.77, 592.75),
    (11, 10, 18, 2.90, 150.63, 436.83),
    (12, 14, 4, 2.37, 174.83, 414.35),
    (13, 5, 12, 1.67, 123.00, 205.41),
    (14, 16, 17, 2.73, 137.20, 374.56),
    (15, 13, 5, 4.19, 87.44, 366.48),
    (16, 15, 14, 3.61, 165.98, 599.20),
    (17, 18, 8, 1.48, 109.77, 162.47),
    (18, 12, 2, 3.03, 76.50, 231.85),
    (19, 19, 16, 2.62, 141.90, 371.78),
    (20, 17, 15, 4.31, 95.65, 412.27);
