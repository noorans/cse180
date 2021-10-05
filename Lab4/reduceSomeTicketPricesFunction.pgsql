--used pseudocode from lab section 

CREATE OR REPLACE FUNCTION reduceSomeTicketPricesFunction(maxTicketCount INTEGER) RETURNS INTEGER AS $$
DECLARE
    priceReduction INT;
    totalCount INT;
    tID INT;
    showingD DATE;
    startT TIME;
    mID INT;
    priceC CHAR(1);
    ticketP NUMERIC(4,2);

    DECLARE ticketA CURSOR FOR SELECT T.theaterID, T.showingDate, T.startTime, S.priceCode, T.ticketPrice
    FROM Tickets T, Showings S
    WHERE T.theaterID = S.theaterID
    AND T.showingDate = S.showingDate
    AND T.startTime = S.startTime
    AND S.priceCode IS NOT NULL 
    AND T.ticketPrice IS NOT NULL
    AND S.priceCode = 'A'
    ORDER BY S.priceCode,T.customerID; 

    DECLARE ticketB CURSOR FOR SELECT T.theaterID, T.showingDate, T.startTime, S.priceCode, T.ticketPrice
    FROM Tickets T, Showings S
    WHERE T.theaterID = S.theaterID
    AND T.showingDate = S.showingDate
    AND T.startTime = S.startTime
    AND S.priceCode IS NOT NULL 
    AND T.ticketPrice IS NOT NULL
    AND S.priceCode = 'B'
    ORDER BY S.priceCode,T.customerID; 

    DECLARE ticketC CURSOR FOR SELECT T.theaterID, T.showingDate, T.startTime, S.priceCode, T.ticketPrice
    FROM Tickets T, Showings S
    WHERE T.theaterID = S.theaterID
    AND T.showingDate = S.showingDate
    AND T.startTime = S.startTime
    AND S.priceCode IS NOT NULL 
    AND T.ticketPrice IS NOT NULL
    AND S.priceCode = 'C'
    ORDER BY S.priceCode,T.customerID; 

    BEGIN
        priceReduction = 0;
        totalCount = 0;
        OPEN ticketA;
        LOOP
            FETCH ticketA INTO tID, showingD, startT, priceC, ticketP;
            EXIT WHEN Not Found OR totalCount = maxTicketCount;
            UPDATE Tickets
            SET ticketPrice = ticketP -3
            WHERE theaterID = tID
            AND showingDate = showingD
            AND startTime - startT;
            totalCount = totalCount + 1;
            priceReduction = priceReduction + 3;
        END LOOP;
        CLOSE ticketA;

        OPEN ticketB;
        LOOP
            FETCH ticketB INTO tID, showingD, startT, priceC, ticketP;
            EXIT WHEN Not Found OR totalCount = maxTicketCount;
            UPDATE Tickets
            SET ticketPrice = ticketP -2
            WHERE theaterID = tID
            AND showingDate = showingD
            AND startTime - startT;
            totalCount = totalCount + 1;
            priceReduction = priceReduction + 2;
        END LOOP;
        CLOSE ticketB;

        OPEN ticketC;
        LOOP
            FETCH ticketC INTO tID, showingD, startT, priceC, ticketP;
            EXIT WHEN Not Found OR totalCount = maxTicketCount;
            UPDATE Tickets
            SET ticketPrice = ticketP - 1
            WHERE theaterID = tID
            AND showingDate = showingD
            AND startTime - startT;
            totalCount = totalCount + 1;
            priceReduction = priceReduction + 1;
        END LOOP;
        CLOSE ticketC;

        RETURN priceReduction;

    END;
    $$ LANGUAGE plpgsql;