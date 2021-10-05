SELECT DISTINCT A.theaterID, A.address
FROM Theaters A, TheaterSeats B
WHERE B.brokenSeat = TRUE 
    AND A.theaterID = B.theaterID;