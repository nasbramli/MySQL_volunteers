-- Working with volunteersDB
CREATE DATABASE volunteersdb;

USE volunteersdb;

-- 1. Unnormalised Form

CREATE TABLE volunteers (
  id int NOT NULL AUTO_INCREMENT,
  salutation VARCHAR(50) NOT NULL,
  surname VARCHAR(50) NOT NULL,
  mobile VARCHAR(12) NOT NULL,
  city VARCHAR(50) NOT NULL,
  languages VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO volunteers (salutation, surname, mobile, city, languages) VALUES
("Mr", 'Kroner', '0865214459', "London", "German, English"),
("Mrs", 'James', '45678912',	"Bristol", "English"),
("Miss", 'Dexter', '987654321', "Hove", "German, Dutch, English"),
("Mr", 'Stephen', '654321654', "London", "German");



-- 2. Writing Select Statements

-- SELECT * FROM volunteers;

-- SELECT surname, mobile FROM volunteers;

-- SELECT * FROM volunteers WHERE id = 1;

-- SELECT * FROM volunteers WHERE surname = 'James' AND city = 'Bristol';

-- SELECT * FROM volunteers WHERE city IN ('London');

-- SELECT * FROM volunteers WHERE city NOT IN ('London', 'Bristol');

-- SELECT * FROM volunteers WHERE surname IS NOT null;



-- 3. INSERT, UPDATE and DELETE


-- a) INSERT
 INSERT INTO volunteers (salutation, surname, mobile, city, languages) VALUES ('Mrs', 'Richards', '0754896325', 'London', 'German, Dutch');

INSERT INTO volunteers (salutation, surname, mobile, city, languages) VALUES  
('Mr', 'Eagle', '07546458745', 'Bristol', 'Dutch'),  
('Miss', 'Schofield', '0766984752', 'London', 'English');


-- b) UPDATE
UPDATE volunteers SET city = 'Leicester' WHERE id = 5;

UPDATE volunteers SET city = 'Leicester' WHERE surname = 'Richards'; # Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.


-- c) DELETE
DELETE FROM volunteers WHERE surname = 'Rogers'; # Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

SET SQL_SAFE_UPDATES = 0;                       # Disable safe updates: https://dev.mysql.com/doc/refman/8.0/en/mysql-tips.html#safe-updates
DELETE FROM volunteers WHERE surname = 'Eagle';

DELETE FROM volunteers WHERE surname = 'Eagle' AND id = 8;  # Or include the primary key to the conditional clause
