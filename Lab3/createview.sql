CREATE VIEW earningsView AS
    SELECT M.movieID, SUM(T.ticketPrice) AS computedEarnings
    FROM Movies M, Tickets T, Showings S
    WHERE T.theaterID = S.theaterID
    AND T.showingDate = S.showingDate
    AND T.startTime = S.startTime
    AND S.movieID = M.movieID
    GROUP BY M.movieID
	UNION
	SELECT A.movieID, 0
	FROM Movies A
	WHERE A.movieID NOT IN (SELECT M.movieID AS movieID
        			FROM Movies M, Showings S, Tickets T
        			WHERE T.theaterID = S.theaterID
                    AND T.showingDate = S.showingDate
                    AND T.startTime = S.startTime
                    AND S.movieID = M.movieID);