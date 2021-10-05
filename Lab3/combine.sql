UPDATE Showings S
SET movieID = MS.movieID
FROM ModifyShowings MS
WHERE S.theaterID = MS.theaterID
    AND S.showingDate = MS.showingDate
    AND S.startTime = MS.startTime;


INSERT INTO Showings 
SELECT *
FROM ModifyShowings
WHERE (ModifyShowings.theaterID, ModifyShowings.showingDate, ModifyShowings.startTime) NOT IN (SELECT theaterID, showingDate, startTime
                                                                                                FROM Showings);

