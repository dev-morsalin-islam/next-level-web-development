

-- DATABASE CREATION

CREATE DATABASE CONSERVATION_DB;



-- ALL TABLE CREATION
CREATE  TABLE RANGERS(
    RANGER_ID SERIAL PRIMARY KEY,
    NAME VARCHAR(200) NOT NULL,
    REGION VARCHAR(150) NOT NULL

);




CREATE TABLE SPECIES(
    SPECIES_ID SERIAL PRIMARY KEY,
    COMMON_NAME VARCHAR(200) NOT NULL,
    SCIENTIFIC_NAME VARCHAR(200) UNIQUE NOT NULL,
    DISCOVERY_DATE DATE CHECK (DISCOVERY_DATE <= CURRENT_DATE),
    CONSERVATION_STATUS VARCHAR(100) NOT NULL CHECK (CONSERVATION_STATUS IN ('Least Concern', 'Near Threatened', 'Vulnerable', 'Endangered', 'Critically Endangered', 'Extinct in the Wild', 'Extinct','Historic', 'Safe'))

);



CREATE TABLE SIGHTINGS(
    SIGHTING_ID SERIAL PRIMARY KEY,
    RANGER_ID INT NOT NULL,
    SPECIES_ID INT NOT NULL,
    SIGHTING_TIME TIMESTAMP NOT NULL CHECK (SIGHTING_TIME <= CURRENT_TIMESTAMP), -- ADD RESTRICTION
    LOCATION VARCHAR(260) DEFAULT 'SUNDHORBON XYZ',
    NOTES VARCHAR(500),

    FOREIGN KEY (RANGER_ID) REFERENCES RANGERS(RANGER_ID) ON DELETE CASCADE,
    FOREIGN KEY (SPECIES_ID) REFERENCES SPECIES(SPECIES_ID) ON DELETE CASCADE


);







-- ##################### DATA INSERTION ##################

-- RANGERS TABLE INSERTION
INSERT INTO RANGERS (NAME, REGION) 
VALUES
    
    ('Amit Roy', 'Sundarbans'),
    ('Priya Das', 'Kaziranga'),
    ('Rahul Sen', 'Gir Forest'),
    ('Meera Patel', 'Western Ghats'),
    ('Sanjay Kumar', 'Nilgiri Hills'),
    ('Lata Singh', 'Eastern Himalayas'),
    ('Vikram Joshi', 'Satpura Range'),
    ('Nisha Verma', 'Central Plains'),
    ('Arjun Mehta', 'Desert Fringe');

-- SPECIES TABLE INSERTION
INSERT INTO SPECIES (
        COMMON_NAME, 
        SCIENTIFIC_NAME, 
        DISCOVERY_DATE, 
        CONSERVATION_STATUS
    ) 
VALUES
    ('Bengal Tiger', 'Panthera tigris tigris', '1800-01-01', 'Endangered'),
    ('Indian Rhino', 'Rhinoceros unicornis', '1758-01-01', 'Vulnerable'),
    ('Asiatic Lion', 'Panthera leo persica', '1826-01-01', 'Endangered'),
    ('Indian Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered'),
    ('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Vulnerable'),
    ('Sloth Bear', 'Melursus ursinus', '1791-01-01', 'Vulnerable'),
    ('Gharial', 'Gavialis gangeticus', '1827-01-01', 'Critically Endangered'),
    ('Great Indian Bustard', 'Ardeotis nigriceps', '1863-01-01', 'Critically Endangered'),
    ('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Endangered'),
    ('Blackbuck', 'Antilope cervicapra', '1758-01-01', 'Near Threatened');


-- SIGHTINGS TABLE INSERTION
INSERT INTO SIGHTINGS (
        RANGER_ID, 
        SPECIES_ID, 
        SIGHTING_TIME, 
        LOCATION, 
        NOTES
    ) 
VALUES
    (1, 1, '2024-05-20 08:30:00', 'Coastal Plains North', 'Tiger seen near riverbank'),
    (2, 2, '2024-05-21 10:15:00', 'Sundarbans Block A', 'Rhino grazing'),
    (3, 3, '2024-05-22 16:45:00', 'Kaziranga Zone 3', 'Lion resting under tree'),
    (4, 4, '2024-05-23 07:20:00', 'Gir Forest Range 5', 'Elephant herd crossing'),
    (5, 5, '2024-05-24 09:10:00', 'Western Ghats Trail', 'Snow leopard spotted'),
    (6, 6, '2024-05-25 18:00:00', 'Nilgiri Hills Slope', 'Sloth bear foraging'),
    (7, 7, '2024-05-26 11:30:00', 'Eastern Himalayas Ridge', 'Gharial near stream'),
    (8, 8, '2024-05-27 15:00:00', 'Satpura Range Lake', 'Bustard in grassland'),
    (9, 9, '2024-05-28 13:45:00', 'Central Plains Wetland', 'Red panda climbing tree'),
    (10, 10, '2024-05-29 17:25:00', 'Desert Fringe Oasis', 'Blackbuck herd running')
    (3, 6, '2024-05-30 09:00:00', 'Mountain Pass East', 'Rhino crossing the pass'),
    (4, 5, '2024-05-31 14:20:00', 'Snow Leopard Pass', 'Snow leopard spotted on pass'),
    (5, 4, '2024-06-01 07:45:00', 'Tiger Pass', 'Tiger tracks found on the pass'),
    (6, 3, '2024-06-02 12:10:00', 'River Pass', 'Gharial seen near river pass'),
    (7, 2, '2024-06-03 17:30:00', 'Elephant Pass', 'Elephant herd moving through pass');


-- QUERY:1️⃣ Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

CREATE OR REPLACE PROCEDURE REGISTER_RANGER(
    P_NAME VARCHAR(200),
    P_REGION VARCHAR(150)
)
LANGUAGE PLPGSQL
AS
$$
    BEGIN
        INSERT INTO RANGERS (NAME, REGION)
        VALUES(
            P_NAME,
            P_REGION
        );
    END;
$$;



 -- ##### TESTING ###
CALL REGISTER_RANGER('Derek Fox', 'Coastal Plains');
-- CHECK IF INSERTED OR NOT
-- SELECT * FROM RANGERS WHERE NAME = 'Derek Fox'; -- CHECK IF INSERTED OR NOT



-- ##############################################################################
-- QUERY: 2️⃣ Count unique species ever sighted
CREATE OR REPLACE FUNCTION COUNT_UNIQUE_SPECIES_EVER_SIGHTED()
RETURNS INTEGER
LANGUAGE PLPGSQL
AS
$$
    DECLARE RESULT INT;

    BEGIN
        SELECT COUNT(DISTINCT SP.SPECIES_ID)
            FROM SPECIES AS SP 

            INNER JOIN SIGHTINGS AS SI
                ON SP.SPECIES_ID = SI.SPECIES_ID
            INTO RESULT;
        RETURN RESULT;
    END;
$$;


-- ##### TESTING #####
SELECT COUNT_UNIQUE_SPECIES_EVER_SIGHTED() AS UNIQUE_SPECIES_COUNT;

-- ##############################################################################




-- QUERY: 3️⃣ Find all sightings where the location includes "Pass"
CREATE OR REPLACE FUNCTION FIND_SIGHTINGS_WITH_SAMPLE_LOCATION(P_SAMPLE_LOCATION VARCHAR(250))
RETURNS TABLE(
    SIGHTING_ID INT,
    SPECIES_ID INT,
    RANGER_ID INT,
    SIGHTING_TIME TIMESTAMP,
    LOCATION VARCHAR(260),
    NOTES VARCHAR(500)
)
LANGUAGE PLPGSQL
AS
$$
    BEGIN
        RETURN QUERY 
        SELECT 
            S.SIGHTING_ID,
            S.SPECIES_ID,
            S.RANGER_ID,
            S.SIGHTING_TIME,
            S.LOCATION,
            S.NOTES
        FROM SIGHTINGS AS S 
            WHERE S.LOCATION LIKE '%' || P_SAMPLE_LOCATION || '%'; -- MAKE IT DYNAMIC
    END;
$$;




-- ##### TESTING ############

SELECT * FROM FIND_SIGHTINGS_WITH_SAMPLE_LOCATION('Pass'); -- note that we have to pass case sensitive string.


-- #############################################################################


-- QUERY: 4️⃣ List each ranger's name and their total number of sightings
CREATE OR REPLACE FUNCTION RANGER_SIGHTINGS_COUNT()
RETURNS TABLE(
    NAME VARCHAR(200),
    TOTAL_SIGHTINGS INT
    )
LANGUAGE PLPGSQL
AS
$$
    BEGIN
        RETURN QUERY
        SELECT
            RN.NAME,
            COUNT(RN.NAME)::INT AS "TOTAL_SIGHTINGS" -- TYPE CASTING  BIG INT TO INT
        FROM RANGERS AS RN
        INNER JOIN SIGHTINGS AS SIG
            ON SIG.RANGER_ID = RN.RANGER_ID
        GROUP BY RN.NAME;

    END;
$$;


-- ######## TESTING #########

SELECT * FROM RANGER_SIGHTINGS_COUNT();

-- QUERY: 5️⃣ List species that have never been sighted
CREATE OR REPLACE FUNCTION SPECIES_NEVER_SIGHTED()
RETURNS TABLE(COMMON_NAME VARCHAR(200))
LANGUAGE PLPGSQL
AS
$$
    BEGIN
        RETURN QUERY
        SELECT SP.COMMON_NAME
            FROM SPECIES AS SP
        LEFT JOIN SIGHTINGS AS SI
            ON SP.SPECIES_ID = SI.SPECIES_ID
        WHERE SI.SPECIES_ID IS NULL;
        
        
    END;
$$;

-- ########## TESTING ######
SELECT * FROM SPECIES_NEVER_SIGHTED();

-- #####################################################



-- QUERY: 6️⃣ Show the most recent 2 sightings


CREATE OR REPLACE FUNCTION MOST_RECENT_SIGHTINGS(P_LIMIT INT)
RETURNS TABLE(
    COMMON_NAME VARCHAR(200),
    SIGHTING_TIME TIMESTAMP,
    "name" VARCHAR(200)
)
LANGUAGE PLPGSQL
AS
$$
    BEGIN
        RETURN QUERY
        SELECT
            SP.COMMON_NAME,
            SIG.SIGHTING_TIME,
            RN.NAME
        FROM SPECIES AS SP
            INNER JOIN SIGHTINGS AS SIG
                ON SP.SPECIES_ID = SIG.SPECIES_ID
            INNER JOIN RANGERS AS RN
                ON RN.RANGER_ID = SIG.RANGER_ID
        LIMIT P_LIMIT;
    END;
$$;



-- ###### TESTING #######
SELECT * FROM MOST_RECENT_SIGHTINGS(2);

-- QUERY: 7️⃣ Update all species discovered before year 1800 to have status 'Historic'
-- QUERY: 8️⃣ Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening' 
-- QUERY: 9️⃣ Delete rangers who have never sighted any species 

ALTER TABLE SPECIES