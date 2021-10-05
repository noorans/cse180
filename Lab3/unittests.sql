INSERT INTO Tickets (theaterID, seatNum, showingDate, startTime, customerID, ticketPrice)
VALUES (444,2,'2018-06-23','02:42:40',12, 7.00);

INSERT INTO Tickets (theaterID, seatNum, showingDate, startTime, customerID, ticketPrice)
VALUES (333, 2, '2019-06-23', '20:00:00', 22222, 5.00);

INSERT INTO Tickets (theaterID, seatNum, showingDate, startTime, customerID, ticketPrice)
VALUES (332, 200000, '2019-06-23', '20:00:00', 2, 5.00);

--333|2|2019-06-23|20:00:00|2|5.00
UPDATE Tickets
SET ticketPrice = '5.50'
WHERE theaterID = 333
        AND seatNum = 2
        AND showingDate = '2019-06-23'
        AND startTime = '20:00:00';

UPDATE Tickets
SET ticketPrice = '-5.50'
WHERE theaterID = 333
        AND seatNum = 2
        AND showingDate = '2019-06-23'
        AND startTime = '20:00:00';

UPDATE Customers
SET joinDate = '2015-11-28'
WHERE customerID = 2;

UPDATE Customers
SET joinDate = '2015-11-26'
WHERE customerID = 2;

--111|2009-06-23|15:00:00|101|B
UPDATE Showings 
SET movieID = 101 AND priceCode = C
WHERE theaterID = 111
    AND showingDate = '2009-06-23'
    AND startTime = '15:00:00';

UPDATE Showings 
SET movieID = 101 AND priceCode = NULL
WHERE theaterID = 111
    AND showingDate = '2009-06-23'
    AND startTime = '15:00:00';