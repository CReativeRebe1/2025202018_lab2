-- Write a procedure GetWatchHistoryBySubscriber(IN sub_id INT) that returns all
-- shows watched by the subscriber along with watch time.

DROP PROCEDURE IF EXISTS GetWatchHistoryBySubscriber;
DELIMITER //

CREATE PROCEDURE GetWatchHistoryBySubscriber(IN sub_id INT)
BEGIN
    SELECT Title as ShowsWatched , WatchTime FROM Shows as s,WatchHistory as w where sub_id=SubscriberID and w.ShowID=s.ShowID;
END //

DELIMITER ;
CALL GetWatchHistoryBySubscriber(1);