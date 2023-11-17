-- Working with volunteersDB
CREATE DATABASE volunteersdb;

USE volunteersdb;

-- 1. Unnormalised Form

-- 4. Normalisation
-- Normalisation gets rid of repeated data from an existing table(s)
-- Reason: repeated data takes up space on the system, and difficult to update
-- Imagine you have to update all fields where city = 'London' (by the multiples or millions)

-- a)
-- In the FIRST NORMAL, we create separate tables for columns cities and languages 
-- that are not functionally dependent to the records

-- Create the cities table
DROP TABLE IF EXISTS cities;

CREATE TABLE cities (
  id INT NOT NULL AUTO_INCREMENT,
  city VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO cities (id, city) VALUES
(1,	'London'),
(2,	'Bristol'),
(3,	'Hove');

-- Create the languages table
DROP TABLE IF EXISTS languages;

CREATE TABLE languages (
  id int NOT NULL AUTO_INCREMENT,
  language varchar(30) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO languages (id, language) VALUES
(1, 'German'),
(2, 'English'),
(3, 'Dutch');

-- Create the volunteers table in its first AND second normal form
DROP TABLE IF EXISTS volunteers;

CREATE TABLE volunteers (
  id INT NOT NULL AUTO_INCREMENT,
  surname VARCHAR(50) NOT NULL,
  mobile VARCHAR(12) NOT NULL,
  city_id INT NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO volunteers (surname, mobile, city_id) VALUES
('Kroner', '0865214459',	1),
('James',	'45678912',	2),
('Dexter', '987654321', 3),
('Stephen', '65412365', 1);


-- Saluation is also not functionally dependent of the columns in volunteers
INSERT INTO salutations (id, salutation) VALUES
(1, 'Mr'),
(2, 'Miss'),
(3, 'Mrs');

ALTER TABLE volunteers 
ADD COLUMN salutation_id INT NOT NULL AFTER id;

UPDATE volunteers SET salutation_id = 1 WHERE (id = 1);
UPDATE volunteers SET salutation_id = 3 WHERE (id = 2);
UPDATE volunteers SET salutation_id = 2 WHERE (id = 3);
UPDATE volunteers SET salutation_id = 1 WHERE (id = 4);


