-- Write a procedure with a cursor that loops through each subscriber and for each
-- subscriber GetWatchHistoryBySubscriber() to print their watch history.
DROP PROCEDURE IF EXISTS AllSubscriberWatchHistory;

DELIMITER //

CREATE PROCEDURE AllSubscriberWatchHistory()
BEGIN
    DECLARE FLAG INT DEFAULT FALSE;
    DECLARE sub_id INT;

    -- Cursor to fetch all subscribers
    DECLARE cur CURSOR FOR 
        SELECT SubscriberID FROM Subscribers;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET FLAG = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO sub_id;
        IF FLAG THEN
            LEAVE read_loop;
        END IF;

        CALL GetWatchHistoryBySubscriber(sub_id);

    END LOOP;

    CLOSE cur;
END //

DELIMITER ;
CALL AllSubscriberWatchHistory();