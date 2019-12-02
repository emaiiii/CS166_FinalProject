INSERT INTO Customer
VALUES (customerID, fName, lName, address, phNo, DOB, gender);

INSERT INTO Room
VALUES (hotelID, roomNo, roomType);

INSERT INTO MaintenanceCompany
VALUES (cmpID, name, address, isCertified);

INSERT INTO Repair
VALUES (rID, hotelID, roomNo, mCompany, repairDate, description, repairType);

INSERT INTO Booking
VALUES (bID, customer, hotelID, roomNo, bookingDate, noOfPeople, price);

UPDATE Assigned
SET roomNo = roomNoVar
WHERE hotelID = hotelIDVar and staffID = staffIDVar;

string managerVar = "SELECT h.manager FROM Hotel h WHERE h.hID = hIDVar";
INSERT INTO Request
VALUES (reqIDrepairID, managerVar, repairID, requestDate, description);

SELECT COUNT(*) 
FROM Room r
WHERE r.roomNo IN(
	(SELECT r.roomNo
	FROM Room r)
	AND r.roomNo NOT IN
	(SELECT r.roomNo
	FROM Booking b, Room r
	WHERE b.hotelId = r.hotelID AND b.roomNo = r.roomNo));   

SELECT COUNT(*)
FROM Booking b, Room r
WHERE b.hotelID = r.hotelID AND b.roomNo = r.roomNo;


