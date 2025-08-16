-- AddSubscriberIfNotExists(IN subName VARCHAR(100)) – Adds a new subscriber
-- into the Subscribers table, checking if the subscriber name already exists.

DROP PROCEDURE IF EXISTS AddSubscriberIfNotExists;
DELIMITER //

CREATE PROCEDURE AddSubscriberIfNotExists(IN subName VARCHAR(100)) 
BEGIN
	DECLARE SUB_COUNT INT;
    DECLARE newidAvail INT;
    SELECT COUNT(*) INTO SUB_COUNT  
    FROM Subscribers 
    where SubscriberName=subName;
    
    IF SUB_COUNT = 0 THEN
		SELECT IFNULL(MAX(SubscriberID), 0) + 1 INTO newidAvail FROM Subscribers;
		
		INSERT INTO Subscribers(SubscriberID, SubscriberName, SubscriptionDate)
        VALUES(newidAvail, subName, CURDATE());
        SELECT CONCAT('Subscriber "', subName, '" added successfully.') AS message;
	ELSE
        SELECT CONCAT('Subscriber : "', subName, '" already exists.') AS message;
    END IF;
END //

DELIMITER ;

CALL AddSubscriberIfNotExists('YOGENDRA PATEL');