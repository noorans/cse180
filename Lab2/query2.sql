SELECT DISTINCT C.name, C.year
FROM Movies C, Customers D, Tickets E, Showings F
WHERE D.name = 'Donald Duck'
    AND D.customerID = E.customerID
    AND E.theaterID = F.theaterID
    AND E.showingDate = F.showingDate 
    AND E.startTime = F.startTime
    AND F.movieID = C.movieID