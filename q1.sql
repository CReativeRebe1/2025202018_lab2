-- CREATE DATABASE IF NOT EXISTS LAB_ACTIVITY2;
-- USE LAB_ACTIVITY2;

-- -- Create Tables
-- CREATE TABLE IF NOT EXISTS Shows (
-- ShowID INT PRIMARY KEY,
-- Title VARCHAR(100),
-- Genre VARCHAR(50),
-- ReleaseYear INT
-- );
-- CREATE TABLE IF NOT EXISTS Subscribers (
-- SubscriberID INT PRIMARY KEY,
-- SubscriberName VARCHAR(100),
-- SubscriptionDate DATE
-- );
-- CREATE TABLE IF NOT EXISTS WatchHistory (
-- HistoryID INT PRIMARY KEY,
-- ShowID INT,
-- SubscriberID INT,
-- WatchTime INT, -- Duration in minutes
-- FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
-- FOREIGN KEY (SubscriberID) REFERENCES
-- Subscribers(SubscriberID)
-- );
-- -- Insert Sample Data
-- INSERT INTO Shows (ShowID, Title, Genre, ReleaseYear) VALUES
-- (1, 'Stranger Things', 'Sci-Fi', 2016),
-- (2, 'The Crown', 'Drama', 2016),
-- (3, 'The Witcher', 'Fantasy', 2019);
-- INSERT INTO Subscribers (SubscriberID, SubscriberName,
-- SubscriptionDate) VALUES
-- (1, 'Emily Clark', '2023-01-10'),
-- (2, 'Chris Adams', '2023-02-15'),
-- (3, 'Jordan Smith', '2023-03-05');
-- INSERT INTO WatchHistory (HistoryID, SubscriberID, ShowID,
-- WatchTime) VALUES
-- (1, 1, 1, 100),
-- (2, 1, 2, 10),
-- (3, 2, 1, 20),
-- (4, 2, 2, 40),
-- (5, 2, 3, 10),
-- (6, 3, 2, 10),
-- (7, 3, 1, 10);

-- -- ListAllSubscribers() – Stored procedure that uses a cursor to iterate through all
-- -- Subscribers and prints their names

DROP PROCEDURE IF EXISTS ListAllSubscribers;
DROP PROCEDURE IF EXISTS PrintSubscribers;

DELIMITER //

CREATE PROCEDURE PrintSubscribers(IN sub_name VARCHAR(100))
BEGIN
     SELECT CONCAT(sub_name) AS Subscriber;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE ListAllSubscribers()
 BEGIN
     DECLARE FLAG INT DEFAULT FALSE;
     DECLARE sub_name VARCHAR(100);

     DECLARE cur CURSOR FOR 
         SELECT SubscriberName FROM Subscribers ;
     DECLARE CONTINUE HANDLER FOR NOT FOUND SET FLAG = TRUE;

     OPEN cur;

     read_loop: LOOP
         FETCH cur INTO sub_name;
         IF FLAG THEN
             LEAVE read_loop;
         END IF;

         -- Call the nested procedure
         CALL PrintSubscribers(sub_name);
     END LOOP;

     CLOSE cur;
END //

DELIMITER ;
CALL ListAllSubscribers();
