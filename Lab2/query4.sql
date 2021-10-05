SELECT J.customerID, J.name
FROM Customers J, Tickets K, Showings L, Movies M
WHERE J.name LIKE '%A%' OR J.name LIKE '%a%'
    AND J.customerID = K.customerID
    AND K.theaterID = L.theaterID
    AND K.showingDate = L.showingDate 
    AND K.startTime = L.startTime
    AND L.movieID = M.movieID
GROUP BY J.customerID, J.name
HAVING COUNT (DISTINCT M.movieID) >= 2;