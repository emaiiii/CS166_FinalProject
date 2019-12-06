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
FROM Room r, Booking b
WHERE r.hotelID = b.hotelID AND r.hotelID = hotelID AND r.roomNo NOT IN (
		SELECT r.roomNo 
		FROM Room r, Booking b
		where r.roomNo = b.roomNo);

SELECT COUNT(*)
FROM Booking b, Room r
WHERE b.hotelID = r.hotelID AND b.roomNo = r.roomNo;

SELECT b.roomNo, b.roomType. b.price
FROM Booking b
LIMIT K
ORDER BY b.price ASC;

SELECT r.repairType, r.hotelID, r.roomNo
FROM Repair r, MaintenanceCompany m
WHERE r.mCompany = m.cmpID AND m.name = name;

SELECT DATE_PART('year', r.repairDate), COUNT(*)
FROM Repair r
WHERE r.roomNo = givenRoomNo AND r.hotelID = givenHotelID 
GROUP BY DATE_PART('year', r.repairDate);

SELECT r.roomNo
FROM Room r, Booking b
WHERE r.hotelID = b.hotelID AND (b.bookingDate BETWEEN bookingDate AND DATE bookingDate +
	INTERVAL '1 week');

SELECT b.price
FROM Booking b, Customer c
WHERE c.customerID = b.customer AND c.fName = fNameVar AND c.lname = lNameVar
LIMIT K
ORDER BY price desc;

DateRange *
SELECT b.price
FROM Booking b, Customer c
WHERE c.customerID = b.customer AND c.fName = fNameVar AND c.lname = lNameVar AND b.hotelID = hotelIDVar;

// List Top K Maintenance Company Names based on total repair count (descending order)
SELECT m.name
FROM MaintenanceCompany m, Repair r
WHERE m.cmpID = r.mCompany
LIMIT K
ORDER BY (SELECT count (*)
FROM MaintenanceCompany m, Repair r
WHERE m.cmpID = r.mCompany) DESC;

// List Top K Rooms with the highest price for a given date range
SELECT b.price, b.roomNo
FROM Room r, Booking b
WHERE r.hotelID = b.hotelID AND r.roomNo = b.roomNo AND (b.bookingDate BETWEEN dateStart AND DATE dateEND);
ORDER BY b.price DESC 
LIMIT K;

// Given a hotelID, customer Name and date range get the total cost incurred by the customer
SELECT SUM(b.price)
FROM Booking b
WHERE b.hotelID = hotelID AND b.customer = (SELECT c.customerID 
						FROM Customer c 
						WHERE c.fName = fName AND c.lName = lName)
AND b.bookingDate BETWEEN startDate AND DATE endDate;







