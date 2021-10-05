ALTER TABLE Tickets
ADD CONSTRAINT A FOREIGN KEY (theaterID, showingDate, startTime)
REFERENCES Showings (theaterID, showingDate, startTime)
ON UPDATE RESTRICT;

ALTER TABLE Tickets
ADD CONSTRAINT B FOREIGN KEY customerID
REFERENCES Customers (customerID)
ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE Tickets 
ADD CONSTRAINT C FOREIGN KEY (theaterID, seatNum)
REFERENCES TheaterSeats (theaterID, seatNum)
ON UPDATE CASCADE;