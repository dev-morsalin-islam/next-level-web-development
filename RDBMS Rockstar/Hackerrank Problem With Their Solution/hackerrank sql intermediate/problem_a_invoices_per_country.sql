-- Active: 1747581627427@@127.0.0.1@5432@hackerrank



/*  
    Task: 
*/


-- making the database schema

--######### COUNTRY TABLE ########

CREATE TABLE COUNTRY(
    ID INT PRIMARY KEY,
    NAME VARCHAR(100)
);



-- ######### CITY TABLE #######

CREATE TABLE CITY(
    ID INT  PRIMARY KEY,
    CITY_NAME VARCHAR(128),
    POSTAL_CODE VARCHAR(16),
    COUNTRY_ID INT,
    FOREIGN KEY(COUNTRY_ID) REFERENCES COUNTRY(ID) ON DELETE CASCADE
);


-- ############ CUSTOMER TABLE ##########

CREATE TABLE CUSTOMER
(
    ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(255),
    CITY_ID INT,
    CUSTOMER_ADDRESS VARCHAR(255),
    CONTACT_PERSON VARCHAR(255),
    EMAIL VARCHAR(128),
    PHONE VARCHAR(128),
    IS_ACTIVE INT,
    FOREIGN KEY(CITY_ID) REFERENCES CITY(ID) ON DELETE CASCADE
);



-- ######## INVOICE TABLE ####


CREATE TABLE INVOICE(
    ID INT PRIMARY KEY,
    INVOICE_NUMBER VARCHAR(255),
    CUSTOMER_ID INT,
    USER_ACCOUNT_ID INT,
    TOTAL_PRICE DECIMAL(8,2),
    FOREIGN KEY(CUSTOMER_ID) REFERENCES CUSTOMER(ID)
);

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


-- ########## INSERTION ##########

INSERT INTO COUNTRY (ID, NAME) VALUES
    (1, 'Cameroon'),
    (2, 'Argentina'),
    (3, 'Burundi'),
    (4, 'Malta'),
    (5, 'Chile'),
    (6, 'Mali'),
    (7, 'Cyprus'),
    (8, 'Greece'),
    (9, 'Serbia'),
    (10, 'Kazakhstan'),
    (11, 'Paraguay'),
    (12, 'Singapore'),
    (13, 'Ireland'),
    (14, 'Estonia'),
    (15, 'Italy');


INSERT INTO CITY (ID, CITY_NAME, POSTAL_CODE, COUNTRY_ID) VALUES
    (1, 'Lake Tylerport', '92657', 7),
    (2, 'South Deannaville', '18351', 15),
    (3, 'Jacobshire', '03534', 7),
    (4, 'East Angela', '03856', 3),
    (5, 'Kleinbury', '67645', 13),
    (6, 'Lake Cheryl', '64753', 13),
    (7, 'Chadfurt', '51963', 12),
    (8, 'South Josephview', '12264', 13),
    (9, 'Lake Theresa', '67089', 11),
    (10, 'West Angela', '15882', 4),
    (11, 'Andreasstad', '19269', 2),
    (12, 'Lauraborough', '61225', 6),
    (13, 'Lake Andre', '72643', 2),
    (14, 'Kimside', '61739', 2),
    (15, 'North Chelsea', '92220', 14);


INSERT INTO CUSTOMER (ID, CUSTOMER_NAME, CITY_ID, CUSTOMER_ADDRESS, CONTACT_PERSON, EMAIL, PHONE, IS_ACTIVE) VALUES
    (1, 'Alexandra Martin', 6, '5247 Smith Extension, East Stephen, TN 30290', 'Tracy Williams', 'phillipconner@gmail.com', '(822) 175-9900x1184', 0),
    (2, 'Timothy Smith', 1, '5531 Joseph Track, South Catherine, NJ 93782', 'Sabrina Salas', 'hwilliams@hotmail.com', '001-948-671-8473x689', 1),
    (3, 'Erica Davis', 10, '59327 Stevens Expressway, South Daniel, FL 35178', 'Dawn Manning', 'patrickbennett@thompson.com', '+1-978-717-6321', 0),
    (4, 'Jason Drake', 13, '51938 Nelson Points, Mccoytown, OK 08126', 'Stephanie Lopez', 'msmith@yahoo.com', '348.217.7487x205', 1),
    (5, 'Kimberly Walters', 12, '5963 Williams Streets, Port Sarah, TX 30491', 'Kenneth Decker', 'tinaadams@yahoo.com', '899.778.2529', 1),
    (6, 'Jonathan Matthews', 5, '0803 Carrillo Lock, West Sheri, VT 25253', 'Donna Delgado', 'johnanderson@gmail.com', '533-936-2984', 0),
    (7, 'Chad Clark', 6, '4144 Christopher Pine, Lake Shannon, TX 36452', 'Eric Smith', 'david85@hotmail.com', '(998) 816-8120', 1),
    (8, 'Kristin Yang', 15, '34393 Howard Greens, Garciafurt, WA 56711', 'Eric Walker', 'tracylamb@gmail.com', '994-270-1916', 0),
    (9, 'Travis Collins', 10, '61821 Heather Forest, Territown, PA 86266', 'Brett Navarro', 'byrondaniels@yahoo.com', '(954) 675-5226x0595', 1),
    (10, 'Amy Franklin', 14, '86714 Davis Canyon, Washingtonstad, WA 28394', 'Veronica Armstrong', 'andrew37@stone.com', '(650) 464-7997', 1),
    (11, 'Anthony Hoffman', 3, '20664 Linda Flat, Port Tara, IL 45792', 'Jacqueline Hopkins', 'sean71@chan.com', '+1-839-212-9535', 0),
    (12, 'Joseph Welch', 2, '52030 Christian Tunnel, South Eric, AK 50491', 'Kelsey Galloway', 'tracy24@gmail.com', '(689) 136-7766x715', 0),
    (13, 'Donna Wood', 14, '45516 David Point, Port Carol, WY 69558', 'Annette Santiago', 'sarahball@estrada.net', '+1-764-236-9853x842', 0),
    (14, 'Jacob Gonzalez', 1, '3561 Nicholas Mountains, East Andrew, NC 04206', 'Michael Kirby', 'michellemendoza@hunt.com', '001-983-201-1422x296', 1),
    (15, 'Stephanie Cruz', 7, '5937 Bradley Place, New Keithborough, SD 20131', 'Joseph Anderson', 'nburke@vaughn.com', '+1-531-334-1456x8354', 1);

INSERT INTO INVOICE (ID, INVOICE_NUMBER, CUSTOMER_ID, USER_ACCOUNT_ID, TOTAL_PRICE) VALUES
    (1, 'INV-202501', 6, 101, 234.50),
    (2, 'INV-202502', 1, 102, 1299.99),
    (3, 'INV-202503', 3, 103, 450.00),
    (4, 'INV-202504', 7, 104, 875.75),
    (5, 'INV-202505', 10, 105, 99.99),
    (6, 'INV-202506', 8, 106, 120.00),
    (7, 'INV-202507', 2, 107, 340.40),
    (8, 'INV-202508', 5, 108, 755.00),
    (9, 'INV-202509', 9, 109, 63.95),
    (10, 'INV-202510', 11, 110, 199.90),
    (11, 'INV-202511', 13, 111, 159.95),
    (12, 'INV-202512', 4, 112, 899.99),
    (13, 'INV-202513', 14, 113, 59.99),
    (14, 'INV-202514', 12, 114, 620.45),
    (15, 'INV-202515', 15, 115, 135.75);

INSERT INTO PRODUCT (ID, SKU, PRODUCT_NAME, PRODUCT_DESCRIPTION, CURRENT_PRICE, QUANTITY_IN_STOCK, IS_ACTIVE) VALUES
    (1, 'SKU-001', 'Wireless Mouse', 'High precision optical mouse', 25.99, 150, TRUE),
    (2, 'SKU-002', 'Mechanical Keyboard', 'RGB backlit mechanical keyboard', 89.50, 75, TRUE),
    (3, 'SKU-003', 'USB-C Hub', 'Multiport adapter with HDMI and USB 3.0', 39.99, 120, TRUE),
    (4, 'SKU-004', '27" Monitor', 'Full HD LED monitor', 150.00, 40, TRUE),
    (5, 'SKU-005', 'Webcam', '1080p streaming webcam', 45.00, 60, TRUE),
    (6, 'SKU-006', 'Bluetooth Speaker', 'Portable wireless speaker', 55.25, 100, TRUE),
    (7, 'SKU-007', 'External SSD 1TB', 'Fast portable storage', 120.00, 30, TRUE),
    (8, 'SKU-008', 'Gaming Chair', 'Ergonomic gaming chair', 250.00, 25, TRUE),
    (9, 'SKU-009', 'Smartwatch', 'Fitness tracking smartwatch', 135.75, 80, TRUE),
    (10, 'SKU-010', 'Noise Cancelling Headphones', 'Over-ear Bluetooth headphones', 199.99, 50, TRUE),
    (11, 'SKU-011', 'Graphics Tablet', 'Drawing tablet with pen', 89.99, 45, TRUE),
    (12, 'SKU-012', 'Laptop Stand', 'Adjustable ergonomic laptop stand', 29.95, 90, TRUE),
    (13, 'SKU-013', 'Wireless Router', 'Dual band WiFi 6 router', 79.99, 70, TRUE),
    (14, 'SKU-014', 'Flash Drive 128GB', 'USB 3.1 flash drive', 19.99, 200, TRUE),
    (15, 'SKU-015', 'HDMI Cable', '2m high-speed HDMI cable', 9.99, 300, TRUE);


INSERT INTO INVOICE_ITEM (ID, INVOICE_ID, PRODUCT_ID, QUANTITY, PRICE, LINE_TOTAL_PRICE) VALUES
    (1, 1, 1, 2, 25.99, 51.98),
    (2, 1, 3, 1, 39.99, 39.99),
    (3, 2, 2, 3, 89.50, 268.50),
    (4, 2, 4, 2, 150.00, 300.00),
    (5, 3, 5, 5, 45.00, 225.00),
    (6, 4, 6, 4, 55.25, 221.00),
    (7, 5, 7, 1, 120.00, 120.00),
    (8, 6, 8, 1, 250.00, 250.00),
    (9, 7, 9, 2, 135.75, 271.50),
    (10, 8, 10, 1, 199.99, 199.99),
    (11, 9, 11, 2, 89.99, 179.98),
    (12, 10, 12, 3, 29.95, 89.85),
    (13, 11, 13, 1, 79.99, 79.99),
    (14, 12, 14, 4, 19.99, 79.96),
    (15, 13, 15, 5, 9.99, 49.95);




SELECT 
    co.name,
    COUNT(*) AS total_customers,
    ROUND(AVG(i.total_price), 6) AS avg_total_price
FROM 
    country AS co
    INNER JOIN city AS ci ON co.id = ci.country_id
    INNER JOIN customer AS cu ON ci.id = cu.city_id
    INNER JOIN invoice AS i ON cu.id = i.customer_id
GROUP BY 
    co.name
HAVING 
    AVG(i.total_price) > (SELECT AVG(total_price) FROM invoice);

SELECT * FROM COUNTRY;

SELECT 
    COUN.NAME,
    COUNT(*),
    ROUND(AVG(INV.TOTAL_PRICE),6)
FROM
    COUNTRY AS COUN
    INNER JOIN CITY AS CI
        ON COUN.ID = CI.COUNTRY_ID
    INNER JOIN CUSTOMER AS CUS
        ON CUS.CITY_ID = CI.ID
    INNER JOIN INVOICE AS INV
        ON INV.CUSTOMER_ID = INV.ID
GROUP BY
    COUN.NAME;
-- HAVING
--     AVG(INV.TOTAL_PRICE) > 