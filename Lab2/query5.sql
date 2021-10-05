SELECT DISTINCT N.customerID AS custID, N.name AS custName, N.address AS custAddress, P.address AS theaterAddress, P.numSeats AS theaterSeats, Q.priceCode AS priceCode
FROM Customers N, Theaters P, Showings Q, Tickets R
WHERE N.name LIKE 'D%'
    AND N.customerID = R.customerID
    AND R.theaterID = Q.theaterID
    AND R.showingDate = Q.showingDate
    AND R.startTime = Q.startTime
    AND Q.priceCode IS NOT NULL
    AND Q.showingDate BETWEEN '2019-06-01' AND '2019-06-30'
    AND Q.theaterID = P.theaterID
    AND P.numSeats > 5;