-- Active: 1747581627427@@127.0.0.1@5432@conservation_db

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
    CONSERVATION_STATUS VARCHAR(100) NOT NULL CHECK (CONSERVATION_STATUS IN ('Least Concern', 'Near Threatened', 'Vulnerable', 'Endangered', 'Critically Endangered', 'Extinct in the Wild', 'Extinct'))

);



CREATE TABLE SIGHTINGS(
    SIGHTING_ID SERIAL PRIMARY KEY,
    RANGER_ID INT NOT NULL,
    SPECIES_ID INT NOT NULL,
    SIGHTING_TIME TIMESTAMP NOT NULL CHECK (SIGHTING_TIME <= CURRENT_TIMESTAMP), -- ADD RESTRICTION
    LOCATION VARCHAR(260) DEFAULT 'SUNDHORBON XYZ',

    FOREIGN KEY (RANGER_ID) REFERENCES RANGERS(RANGER_ID) ON DELETE CASCADE,
    FOREIGN KEY (SPECIES_ID) REFERENCES SPECIES(SPECIES_ID) ON DELETE CASCADE


);



SELECT * FROM SIGHTINGS;



-- ##################### DATA INSERTION ##################


-- RANGERS TABLE INSERTION
INSERT INTO RANGERS (NAME, REGION) 
VALUES
    ('Amit Roy', 'Sundarbans'),
    ('Priya Das', 'Kaziranga'),
    ('Rahul Sen', 'Gir Forest');

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
    ('Asiatic Lion', 'Panthera leo persica', '1826-01-01', 'Endangered');

-- SIGHTINGS TABLE INSERTION
INSERT INTO SIGHTINGS (
    RANGER_ID, 
    SPECIES_ID, 
    SIGHTING_TIME, 
    LOCATION
) 
VALUES
    (1, 1, '2024-05-20 08:30:00', 'Sundarbans Block A'),
    (2, 2, '2024-05-21 10:15:00', 'Kaziranga Zone 3'),
    (3, 3, '2024-05-22 16:45:00', 'Gir Forest Range 5');



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
-- SELECT * FROM RANGERS WHERE NAME = 'Derek Fox'; -- CHECK IF INSERTED OR NOT




-- QUERY: 2️⃣ Count unique species ever sighted
-- QUERY: 3️⃣ Find all sightings where the location includes "Pass"
-- QUERY: 4️⃣ List each ranger's name and their total number of sightings
-- QUERY: 5️⃣ List species that have never been sighted
-- QUERY: 6️⃣ Show the most recent 2 sightings
-- QUERY: 7️⃣ Update all species discovered before year 1800 to have status 'Historic'
-- QUERY: 8️⃣ Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening' 
-- QUERY: 9️⃣ Delete rangers who have never sighted any species 

