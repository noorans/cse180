SELECT M.rating AS rating , COUNT(M.totalEarned <> E.computedEarnings) AS misreportCount
FROM Movies M, earningsView E
WHERE M.movieID = E.movieID
AND M.year < 2019 
GROUP BY M.rating;

-- rating | misreportcount 
--------+----------------
 --G      |              5
 --P      |              4
 --R      |              2
--(3 rows)

DELETE FROM Tickets
WHERE theaterID = 111
AND seatNum = 1
AND showingDate = DATE '2009-06-23'
AND startTime = TIME '11:00:00';

DELETE FROM Tickets
WHERE theaterID = 444
AND seatNum = 5
AND showingDate = DATE '2020-06-24'
AND startTime = TIME '15:00:00';

-- rating | misreportcount
--------+----------------
-- G      |              5
-- P      |              4
-- R      |              2
--(3 rows)

--DELETE 1
--DELETE 1

SELECT M.rating AS rating , COUNT(M.totalEarned <> E.computedEarnings) AS misreportCount
FROM Movies M, earningsView E
WHERE M.movieID = E.movieID
AND M.year < 2019 
GROUP BY M.rating;