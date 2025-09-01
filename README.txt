====================================
CS6.302 - Software System Development 
Lab - 2 :: SQL - Stored Procedures and Cursors
ROLL.NO : 2025202018
====================================

GitHub Repo Link - https://github.com/CReativeRebe1/SQL-Stored_Procedures_and_Cursors_lab2

====================================
--------------------------------------------------
Description:
--------------------------------------------------
This lab activity demonstrates the use of SQL stored procedures and cursors on a video-streaming platform database.
It covers creating procedures for listing subscribers, retrieving watch history, adding new subscribers with validation, and generating watch reports.
The goal is to practice modular SQL programming, conditional logic, and iterative cursor operations for database automation.

--------------------------------------------------
Execution Steps:
--------------------------------------------------       
1. Open MySQL Workbench and connect to your MySQL server.

2. Run the following command to create and use the lab database:
   CREATE DATABASE IF NOT EXISTS LAB_ACTIVITY2;
   USE LAB_ACTIVITY2;
   
   NOTE : I HAVE COMMENT OUT THE DATABASE SCRIPT IN q1.sql FILE IF YOU DON'T HAVE THE DATABASE YOU CAN UNCOMMENT IT AND RUN q1.sql FIRST. WITHOUT ANY DATABASE QUERIES WONT RUN.
          I HAVE ALSO ADDED SCHEMA IN THE END OF THIS FILE FOR THE DATABASE IF YOU WANTED TO ADD YOUR OWN DATA.

3.Select the database LAB_ACTIVITY2 as default before executing SQL scripts in step 4.

4. Execute the following SQL scripts one by one to create the stored procedures for each question:
   - q1.sql → Creates the procedure ListAllSubscribers().
   - q2.sql → Creates the procedure GetWatchHistoryBySubscriber(IN sub_id INT).
   - q3.sql → Creates the procedure AddSubscriberIfNotExists(IN subName VARCHAR(100)).
   - q4.sql → Creates the procedure SendWatchTimeReport().
   - q5.sql → Creates the procedure PrintAllSubscribersWatchHistory().

5. After executing the scripts, you can test each procedure by calling them, e.g.:
   CALL ListAllSubscribers();
   CALL GetWatchHistoryBySubscriber(1);
   CALL AddSubscriberIfNotExists('Michael Scott');
   CALL SendWatchTimeReport();
   CALL PrintAllSubscribersWatchHistory();
   
--------------------------------------------------
ACTIVITIES :
--------------------------------------------------
1. ListAllSubscribers() – Stored procedure that uses a cursor to iterate through all
Subscribers and prints their names.

2. Write a procedure GetWatchHistoryBySubscriber(IN sub_id INT) that returns all
shows watched by the subscriber along with watch time.

3. AddSubscriberIfNotExists(IN subName VARCHAR(100)) – Adds a new subscriber
into the Subscribers table, checking if the subscriber name already exists.

4. Make a procedure SendWatchTimeReport() which internally calls
GetWatchHistoryBySubscriber() for all subscribers, but only if they have watched
something.

5. Write a procedure with a cursor that loops through each subscriber and for each
subscriber GetWatchHistoryBySubscriber() to print their watch history.

--------------------------------------------------
SCHEMA :
--------------------------------------------------

CREATE DATABASE IF NOT EXISTS LAB_ACTIVITY2;
USE LAB_ACTIVITY2;

-- Table: Shows
CREATE TABLE IF NOT EXISTS Shows (
    ShowID INT PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    ReleaseYear INT
);

-- Table: Subscribers
CREATE TABLE IF NOT EXISTS Subscribers (
    SubscriberID INT PRIMARY KEY,
    SubscriberName VARCHAR(100),
    SubscriptionDate DATE
);

-- Table: WatchHistory
CREATE TABLE IF NOT EXISTS WatchHistory (
    HistoryID INT PRIMARY KEY,
    ShowID INT,
    SubscriberID INT,
    WatchTime INT, -- Duration in minutes
    FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
    FOREIGN KEY (SubscriberID) REFERENCES Subscribers(SubscriberID)
);


