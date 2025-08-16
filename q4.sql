-- Make a procedure SendWatchTimeReport() which internally calls
-- GetWatchHistoryBySubscriber() for all subscribers, but only if they have watched
-- something.

DROP PROCEDURE IF EXISTS SendWatchTimeReport;
DELIMITER //

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
	DECLARE done INT DEFAULT FALSE;
    DECLARE sub_id INT;
    
    DECLARE curr CURSOR FOR
		SELECT DISTINCT SubscriberID
        FROM WatchHistory
        WHERE WatchTime > 0;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN curr;
    READ_LOOP: LOOP
		FETCH curr INTO sub_id;
        IF done THEN 
			LEAVE READ_LOOP;
		END IF;
	
    CALL GetWatchHistoryBySubscriber(sub_id);
    END LOOP;
    CLOSE curr;
END //

DELIMITER ; 
CALL SendWatchTimeReport();       