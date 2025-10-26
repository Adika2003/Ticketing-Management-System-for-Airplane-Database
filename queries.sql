
-- Create airplane table
CREATE TABLE airplane (
  Airplane_ID VARCHAR(20) PRIMARY KEY,
  Airline VARCHAR(50) NOT NULL,
  Model VARCHAR(30) NOT NULL,
  Seating_Capacity INT(5) NOT NULL,
  Maintenance_Status VARCHAR(30) NOT NULL
);

-- Create airport table
CREATE TABLE airport (
  ICAO_Code VARCHAR(4) PRIMARY KEY,
  IATA_Code VARCHAR(3) NOT NULL,
  Airport_Name VARCHAR(100) NOT NULL,
  Location VARCHAR(30) NOT NULL,
  Country VARCHAR(30) NOT NULL
);

-- Create customer table
CREATE TABLE customer (
  Customer_ID VARCHAR(10) PRIMARY KEY,
  First_Name VARCHAR(20) NOT NULL,
  Last_Name VARCHAR(20) NOT NULL,
  Email VARCHAR(30) NOT NULL,
  Phone_Number BIGINT NOT NULL,
  Date_of_Birth DATE NOT NULL,
  Gender VARCHAR(7) NOT NULL,
  Address VARCHAR(30) NOT NULL,
  Nationality VARCHAR(20) NOT NULL
);

-- Create flight table
CREATE TABLE flight (
  Flight_ID VARCHAR(10) PRIMARY KEY,
  Flight_Number VARCHAR(10) NOT NULL,
  Airplane_ID VARCHAR(20) NOT NULL,
  Departure_Airport VARCHAR(4) NOT NULL,
  Arrival_Airport VARCHAR(4) NOT NULL,
  Departure_Time DATETIME NOT NULL,
  Arrival_Time DATETIME NOT NULL,
  Seats_Available INT NOT NULL,
  Flight_Status VARCHAR(20) NOT NULL,
  FOREIGN KEY (Airplane_ID) REFERENCES airplane(Airplane_ID),
  FOREIGN KEY (Departure_Airport) REFERENCES airport(ICAO_Code),
  FOREIGN KEY (Arrival_Airport) REFERENCES airport(ICAO_Code)
  

);

-- Create booking table
CREATE TABLE booking (
  Booking_ID VARCHAR(30) PRIMARY KEY,
  Customer_ID VARCHAR(30) NOT NULL,
  Flight_ID VARCHAR(30) NOT NULL,
  Booking_Date DATETIME NOT NULL,
  Booking_Status VARCHAR(20) CHECK (Booking_Status IN ('Confirmed','Pending','Cancelled')) NOT NULL,
  Total_Amount DECIMAL(10,2) NOT NULL,
  Number_of_Tickets INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES customer(Customer_ID),
  FOREIGN KEY (Flight_ID) REFERENCES flight(Flight_ID)
);

-- Create payment table
CREATE TABLE payment (
  Payment_ID VARCHAR(30) PRIMARY KEY,
  Booking_ID VARCHAR(30) NOT NULL,
  Payment_Method VARCHAR(20) NOT NULL CHECK (Payment_Method IN ('Card','Mobile Banking','Bank Transfer')),
  Payment_Date DATETIME NOT NULL,
  Transaction_Status VARCHAR(20) NOT NULL CHECK (Transaction_Status IN ('Completed','Pending','Failed')),
  FOREIGN KEY (Booking_ID) REFERENCES booking(Booking_ID)
);

-- Create ticket table
CREATE TABLE ticket (
  Ticket_ID VARCHAR(30) PRIMARY KEY,
  Booking_ID VARCHAR(30) NOT NULL,
  Ticket_Type VARCHAR(20) NOT NULL CHECK (Ticket_Type IN ('Economy','Business','First-Class')),
  Seat_Number VARCHAR(5),
  Ticket_Price DECIMAL(10,2) NOT NULL,
  Issuance_Date DATETIME NOT NULL,
  Ticket_Status VARCHAR(20) NOT NULL CHECK (Ticket_Status IN ('Pending','Active','Cancelled','Checked-in')),
  FOREIGN KEY (Booking_ID) REFERENCES booking(Booking_ID)
);

-- Insert data into airplane
INSERT INTO airplane (Airplane_ID, Airline, Model, Seating_Capacity, Maintenance_Status) VALUES
('AP001', 'Biman Bangladesh Airlines', 'A320', '150', 'Operational'),
('AP002', 'US-Bangla Airlines', 'A321', '180', 'Operational'),
('AP003', 'NovoAir', 'ATR 72', '70', 'Operational'),
('AP004', 'Air Astra', 'Dash 8 Q400', '78', 'Operational'),
('AP005', 'Regent Airways', 'B737', '140', 'Operational'),
('AP006', 'Biman Bangladesh Airlines', 'B777', '400', 'Operational'),
('AP007', 'US-Bangla Airlines', 'A330', '250', 'Operational'),
('AP008', 'NovoAir', 'Embraer 190', '100', 'Operational'),
('AP009', 'Air Astra', 'A320', '160', 'Operational'),
('AP010', 'Regent Airways', 'B747', '350', 'Operational');
SELECT * FROM airplane;


-- Insert data into airport
INSERT INTO airport (ICAO_Code, IATA_Code, Airport_Name, Location, Country) VALUES
('VGEG', 'DAC', 'Hazrat Shahjalal International Airport', 'Dhaka', 'Bangladesh'),
('VGHS', 'CGP', 'Shah Amanat International Airport', 'Chittagong', 'Bangladesh'),
('VGBB', 'JSR', 'Osmani International Airport', 'Sylhet', 'Bangladesh'),
('VGBR', 'BZL', 'Barishal International Airport', 'Barishal', 'Bangladesh'),
('VGRJ', 'RJH', 'Shah Makhdum International Airport', 'Rajshahi', 'Bangladesh');
SELECT * FROM airport;


-- Insert data into customer
INSERT INTO customer (Customer_ID, First_Name, Last_Name, Email, Phone_Number, Date_of_Birth, Gender, Address, Nationality) VALUES
('CU001', 'Mizan', 'Hossain', 'mizan@email.com', 9876543210, '1990-03-15', 'Male', 'Dhaka, Bangladesh', 'Bangladeshi'),
('CU002', 'Nabila', 'Ahmed', 'nabila@email.com', 9876500000, '1995-08-19', 'Female', 'Chittagong, Bangladesh', 'Bangladeshi'),
('CU003', 'Rahim', 'Chowdhury', 'rahim@email.com', 9876512345, '1987-02-28', 'Male', 'Sylhet, Bangladesh', 'Bangladeshi'),
('CU004', 'Ayesha', 'Sultana', 'ayesha@email.com', 9876523456, '1992-11-10', 'Female', 'Rajshahi, Bangladesh', 'Bangladeshi'),
('CU005', 'Arif', 'Hossain', 'arif@email.com', 9876534567, '1991-07-22', 'Male', 'Barishal, Bangladesh', 'Bangladeshi'),
('CU006', 'Farah', 'Islam', 'farah@email.com', 9876545678, '1985-05-15', 'Female', 'Khulna, Bangladesh', 'Bangladeshi'),
('CU007', 'Jamil', 'Khan', 'jamil@email.com', 9876556789, '1993-12-05', 'Male', 'Mymensingh, Bangladesh', 'Bangladeshi'),
('CU008', 'Shabana', 'Begum', 'shabana@email.com', 9876567890, '1988-04-17', 'Female', 'Jessore, Bangladesh', 'Bangladeshi'),
('CU009', 'Nashit', 'Iqbal', 'nashit@email.com', 9876578901, '1996-01-12', 'Male', 'Comilla, Bangladesh', 'Bangladeshi'),
('CU010', 'Sultana', 'Rashid', 'sultana@email.com', 9876589012, '1994-09-25', 'Female', 'Barisal, Bangladesh', 'Bangladeshi'),
('CU011', 'Shamim', 'Akter', 'shamim@email.com', 9876590123, '1989-06-30', 'Male', 'Tangail, Bangladesh', 'Bangladeshi'),
('CU012', 'Lina', 'Jahan', 'lina@email.com', 9876601234, '1992-12-13', 'Female', 'Narsingdi, Bangladesh', 'Bangladeshi'),
('CU013', 'Junaid', 'Mahmud', 'junaid@email.com', 9876612345, '1986-02-09', 'Male', 'Rajshahi, Bangladesh', 'Bangladeshi'),
('CU014', 'Meher', 'Jahan', 'meher@email.com', 9876623456, '1990-08-03', 'Female', 'Sylhet, Bangladesh', 'Bangladeshi'),
('CU015', 'Fahim', 'Rahman', 'fahim@email.com', 9876634567, '1995-11-18', 'Male', 'Chittagong, Bangladesh', 'Bangladeshi'),
('CU016', 'Tania', 'Banu', 'tania@email.com', 9876645678, '1993-07-25', 'Female', 'Dhaka, Bangladesh', 'Bangladeshi'),
('CU017', 'Sami', 'Ahmed', 'sami@email.com', 9876656789, '1994-04-12', 'Male', 'Khulna, Bangladesh', 'Bangladeshi'),
('CU018', 'Rima', 'Akter', 'rima@email.com', 9876667890, '1992-09-10', 'Female', 'Jessore, Bangladesh', 'Bangladeshi'),
('CU019', 'Imran', 'Chowdhury', 'imran@email.com', 9876678901, '1987-03-05', 'Male', 'Barisal, Bangladesh', 'Bangladeshi'),
('CU020', 'Sadia', 'Jahan', 'sadia@email.com', 9876689012, '1995-10-30', 'Female', 'Comilla, Bangladesh', 'Bangladeshi'),
('CU021', 'Mushfiq', 'Islam', 'mushfiq@email.com', 9876690123, '1993-01-18', 'Male', 'Mymensingh, Bangladesh', 'Bangladeshi'),
('CU022', 'Rukaiya', 'Begum', 'rukaiya@email.com', 9876701234, '1990-11-07', 'Female', 'Tangail, Bangladesh', 'Bangladeshi'),
('CU023', 'Samir', 'Rahman', 'samir@email.com', 9876712345, '1988-04-29', 'Male', 'Narsingdi, Bangladesh', 'Bangladeshi'),
('CU024', 'Farhana', 'Sultana', 'farhana@email.com', 9876723456, '1994-06-11', 'Female', 'Dhaka, Bangladesh', 'Bangladeshi'),
('CU025', 'Hassan', 'Khan', 'hassan@email.com', 9876734567, '1991-05-25', 'Male', 'Khulna, Bangladesh', 'Bangladeshi');
SELECT * FROM customer;

-- Insert data into flight
INSERT INTO flight (Flight_ID, Flight_Number, Airplane_ID, Departure_Airport, Arrival_Airport, Departure_Time, Arrival_Time, Seats_Available, Flight_Status) VALUES
('FL001', 'BG101', 'AP001', 'VGEG', 'VGHS', '2025-05-10 08:00:00', '2025-05-10 09:30:00', 150, 'On Time'),
('FL002', 'BG102', 'AP002', 'VGHS', 'VGEG', '2025-05-10 10:00:00', '2025-05-10 11:30:00', 180, 'Delayed'),
('FL003', 'BG103', 'AP003', 'VGBB', 'VGEG', '2025-05-10 12:00:00', '2025-05-10 14:00:00', 70, 'On Time'),
('FL004', 'BG104', 'AP004', 'VGBB', 'VGHS', '2025-05-10 13:00:00', '2025-05-10 15:00:00', 78, 'On Time'),
('FL005', 'BG105', 'AP005', 'VGEG', 'VGBR', '2025-05-11 09:00:00', '2025-05-11 11:00:00', 140, 'On Time'),
('FL006', 'BG106', 'AP006', 'VGHS', 'VGBR', '2025-05-11 10:00:00', '2025-05-11 12:00:00', 400, 'On Time'),
('FL007', 'BG107', 'AP007', 'VGBR', 'VGEG', '2025-05-11 15:00:00', '2025-05-11 16:30:00', 250, 'Delayed'),
('FL008', 'BG108', 'AP008', 'VGBR', 'VGBB', '2025-05-11 16:00:00', '2025-05-11 18:00:00', 100, 'On Time'),
('FL009', 'BG109', 'AP009', 'VGHS', 'VGBR', '2025-05-12 07:00:00', '2025-05-12 09:00:00', 160, 'Cancelled'),
('FL010', 'BG110', 'AP010', 'VGBB', 'VGBR', '2025-05-12 08:30:00', '2025-05-12 10:30:00', 350, 'On Time');
SELECT * FROM flight;

-- Insert data into booking
INSERT INTO booking (Booking_ID, Customer_ID, Flight_ID, Booking_Date, Booking_Status, Total_Amount, Number_of_Tickets) VALUES
('BK001', 'CU001', 'FL001', '2025-05-01 10:00:00', 'Confirmed', 4500.00, 1),
('BK002', 'CU002', 'FL002', '2025-05-01 11:00:00', 'Pending', 9000.00, 2),
('BK003', 'CU003', 'FL003', '2025-05-02 14:00:00', 'Confirmed', 3150.00, 1),
('BK004', 'CU004', 'FL004', '2025-05-02 15:00:00', 'Cancelled', 7800.00, 3),
('BK005', 'CU005', 'FL005', '2025-05-03 08:30:00', 'Confirmed', 4900.00, 2),
('BK006', 'CU006', 'FL006', '2025-05-03 09:45:00', 'Pending', 9800.00, 1),
('BK007', 'CU007', 'FL007', '2025-05-04 10:00:00', 'Confirmed', 6250.00, 2),
('BK008', 'CU008', 'FL008', '2025-05-04 16:15:00', 'Pending', 2000.00, 1),
('BK009', 'CU009', 'FL009', '2025-05-05 07:30:00', 'Cancelled', 3200.00, 2),
('BK010', 'CU010', 'FL010', '2025-05-05 08:00:00', 'Confirmed', 7000.00, 1),
('BK011', 'CU011', 'FL001', '2025-05-06 09:00:00', 'Pending', 4500.00, 1),
('BK012', 'CU012', 'FL002', '2025-05-06 10:00:00', 'Confirmed', 9000.00, 2),
('BK013', 'CU013', 'FL003', '2025-05-07 14:30:00', 'Confirmed', 3150.00, 1),
('BK014', 'CU014', 'FL004', '2025-05-07 15:30:00', 'Cancelled', 7800.00, 3),
('BK015', 'CU015', 'FL005', '2025-05-08 09:00:00', 'Confirmed', 4900.00, 2),
('BK016', 'CU016', 'FL006', '2025-05-08 09:30:00', 'Pending', 9800.00, 1),
('BK017', 'CU017', 'FL007', '2025-05-09 10:15:00', 'Confirmed', 6250.00, 2),
('BK018', 'CU018', 'FL008', '2025-05-09 16:00:00', 'Pending', 2000.00, 1),
('BK019', 'CU019', 'FL009', '2025-05-10 07:00:00', 'Cancelled', 3200.00, 2),
('BK020', 'CU020', 'FL010', '2025-05-10 08:30:00', 'Confirmed', 7000.00, 1),
('BK021', 'CU021', 'FL001', '2025-05-11 10:00:00', 'Pending', 4500.00, 1),
('BK022', 'CU022', 'FL002', '2025-05-11 11:30:00', 'Confirmed', 9000.00, 2),
('BK023', 'CU023', 'FL003', '2025-05-12 12:00:00', 'Confirmed', 3150.00, 1),
('BK024', 'CU024', 'FL004', '2025-05-12 14:30:00', 'Cancelled', 7800.00, 3),
('BK025', 'CU025', 'FL005', '2025-05-13 08:45:00', 'Confirmed', 4900.00, 2);
SELECT * FROM booking ;


-- Insert data into payment
INSERT INTO payment (Payment_ID, Booking_ID, Payment_Method, Payment_Date, Transaction_Status) VALUES
('PM001', 'BK001', 'Card', '2025-05-01 10:05:00', 'Completed'),
('PM002', 'BK002', 'Mobile Banking', '2025-05-01 11:05:00', 'Pending'),
('PM003', 'BK003', 'Card', '2025-05-02 14:15:00', 'Completed'),
('PM004', 'BK004', 'Bank Transfer', '2025-05-02 15:10:00', 'Failed'),
('PM005', 'BK005', 'Card', '2025-05-03 08:45:00', 'Completed'),
('PM006', 'BK006', 'Mobile Banking', '2025-05-03 09:55:00', 'Pending'),
('PM007', 'BK007', 'Card', '2025-05-04 10:05:00', 'Completed'),
('PM008', 'BK008', 'Mobile Banking', '2025-05-04 16:30:00', 'Pending'),
('PM009', 'BK009', 'Bank Transfer', '2025-05-05 07:45:00', 'Failed'),
('PM010', 'BK010', 'Card', '2025-05-05 08:05:00', 'Completed'),
('PM011', 'BK011', 'Mobile Banking', '2025-05-06 09:10:00', 'Pending'),
('PM012', 'BK012', 'Card', '2025-05-06 10:10:00', 'Completed'),
('PM013', 'BK013', 'Bank Transfer', '2025-05-07 14:45:00', 'Failed'),
('PM014', 'BK014', 'Mobile Banking', '2025-05-07 15:00:00', 'Pending'),
('PM015', 'BK015', 'Card', '2025-05-08 09:05:00', 'Completed'),
('PM016', 'BK016', 'Mobile Banking', '2025-05-08 09:40:00', 'Pending'),
('PM017', 'BK017', 'Card', '2025-05-09 10:20:00', 'Completed'),
('PM018', 'BK018', 'Bank Transfer', '2025-05-09 16:05:00', 'Failed'),
('PM019', 'BK019', 'Mobile Banking', '2025-05-10 07:05:00', 'Pending'),
('PM020', 'BK020', 'Card', '2025-05-10 08:35:00', 'Completed'),
('PM021', 'BK021', 'Mobile Banking', '2025-05-11 10:05:00', 'Pending'),
('PM022', 'BK022', 'Card', '2025-05-11 11:40:00', 'Completed'),
('PM023', 'BK023', 'Bank Transfer', '2025-05-12 12:10:00', 'Failed'),
('PM024', 'BK024', 'Mobile Banking', '2025-05-12 14:00:00', 'Pending'),
('PM025', 'BK025', 'Card', '2025-05-13 08:50:00', 'Completed');
SELECT * FROM payment;


-- Insert data into ticket
INSERT INTO ticket (Ticket_ID, Booking_ID, Ticket_Type, Seat_Number, Ticket_Price, Issuance_Date, Ticket_Status) VALUES
('TK001', 'BK001', 'Economy', '12A', 4500.00, '2025-05-01 10:10:00', 'Active'),
('TK002', 'BK002', 'Business', '5B', 4500.00, '2025-05-01 11:15:00', 'Pending'),
('TK003', 'BK003', 'Economy', '10C', 3150.00, '2025-05-02 14:20:00', 'Active'),
('TK004', 'BK004', 'Business', '2A', 2600.00, '2025-05-02 15:15:00', 'Cancelled'),
('TK005', 'BK005', 'Economy', '16B', 2450.00, '2025-05-03 08:50:00', 'Active'),
('TK006', 'BK006', 'Business', '4C', 4900.00, '2025-05-03 09:40:00', 'Pending'),
('TK007', 'BK007', 'Economy', '11A', 3125.00, '2025-05-04 10:10:00', 'Active'),
('TK008', 'BK008', 'First-Class', '3D', 2000.00, '2025-05-04 16:40:00', 'Pending'),
('TK009', 'BK009', 'Economy', '6E', 1600.00, '2025-05-05 07:50:00', 'Cancelled'),
('TK010', 'BK010', 'First-Class', '1A', 7000.00, '2025-05-05 08:15:00', 'Active'),
('TK011', 'BK011', 'Business', '2C', 4500.00, '2025-05-06 09:20:00', 'Pending'),
('TK012', 'BK012', 'Economy', '5A', 4500.00, '2025-05-06 10:15:00', 'Active'),
('TK013', 'BK013', 'First-Class', '3B', 3150.00, '2025-05-07 14:30:00', 'Active'),
('TK014', 'BK014', 'Business', '1C', 2600.00, '2025-05-07 15:20:00', 'Cancelled'),
('TK015', 'BK015', 'Economy', '8C', 2450.00, '2025-05-08 09:10:00', 'Active'),
('TK016', 'BK016', 'First-Class', '4D', 4900.00, '2025-05-08 09:50:00', 'Pending'),
('TK017', 'BK017', 'Economy', '9E', 3125.00, '2025-05-09 10:25:00', 'Active'),
('TK018', 'BK018', 'Business', '2B', 2000.00, '2025-05-09 16:10:00', 'Pending'),
('TK019', 'BK019', 'First-Class', '1B', 1600.00, '2025-05-10 07:40:00', 'Cancelled'),
('TK020', 'BK020', 'Economy', '7A', 7000.00, '2025-05-10 08:40:00', 'Active'),
('TK021', 'BK021', 'Business', '3D', 4500.00, '2025-05-11 10:10:00', 'Pending'),
('TK022', 'BK022', 'Economy', '8B', 4500.00, '2025-05-11 11:50:00', 'Active'),
('TK023', 'BK023', 'First-Class', '12A', 3150.00, '2025-05-12 12:15:00', 'Active'),
('TK024', 'BK024', 'Business', '2C', 2600.00, '2025-05-12 14:05:00', 'Cancelled'),
('TK025', 'BK025', 'Economy', '6A', 2450.00, '2025-05-13 08:55:00', 'Active');
SELECT * FROM ticket;
-- View all data from customer table
SELECT * FROM customer;

-- show all flight from dhaka
SELECT * FROM flight where Departure_Airport='VGEG';

-- order airport by Name
SELECT * FROM airport ORDER BY Airport_Name;

-- Find airplane Seating Capacity more then 100
SELECT * FROM airplane WHERE Seating_Capacity>100;

-- view name of femele customer 
SELECT 
    First_Name,
    Last_Name
FROM customer
WHERE Gender = 'Female';

-- count total male customer 
SELECT COUNT(*) AS Total_Male_Customers
FROM customer
WHERE Gender = 'Male';

-- names (numbers) of all flights operated by Biman Bangladesh Airlines
SELECT 
    f.Flight_ID,
    f.Flight_Number,
    a.Airline
FROM flight f
JOIN airplane a ON f.Airplane_ID = a.Airplane_ID
WHERE a.Airline = 'Biman Bangladesh Airlines';


--  list customers who were born before the year 2000
SELECT 
    Customer_ID,
    First_Name,
    Last_Name,
    Date_of_Birth
FROM customer
WHERE Date_of_Birth < '2000-01-01';

-- customer details for those traveling in Business Class
SELECT * 
FROM customer 
WHERE Customer_ID IN (
    SELECT Customer_ID 
    FROM booking 
    WHERE Booking_ID IN (
        SELECT Booking_ID 
        FROM ticket 
        WHERE Ticket_Type = 'Business'
    )
);



-- buy more then 2 ticket
SELECT 
    c.Customer_ID,
    c.First_Name,
    c.Last_Name,
    SUM(b.Number_of_Tickets) AS Total_Tickets
FROM customer c
JOIN booking b ON c.Customer_ID = b.Customer_ID
GROUP BY c.Customer_ID, c.First_Name, c.Last_Name
HAVING SUM(b.Number_of_Tickets) > 2;


-- view most used payment method 
SELECT payment_method, COUNT(payment_id) AS payment_count
FROM payment
GROUP BY payment_method
ORDER BY payment_count DESC
LIMIT 1;

-- view highest ticket price 
SELECT f.Flight_ID, f.Flight_Number, MAX(t.Ticket_Price) AS Highest_Ticket_Price
FROM flight f
JOIN booking b ON f.Flight_ID = b.Flight_ID
JOIN ticket t ON b.Booking_ID = t.Booking_ID
GROUP BY f.Flight_ID, f.Flight_Number
ORDER BY Highest_Ticket_Price DESC
LIMIT 1;

-- list most booked flight
SELECT 
    f.Flight_ID,
    f.Flight_Number,
    COUNT(b.Booking_ID) AS Total_Bookings
FROM booking b
JOIN flight f ON b.Flight_ID = f.Flight_ID
GROUP BY f.Flight_ID, f.Flight_Number
ORDER BY Total_Bookings DESC
LIMIT 10;
-- list of total flight of Barishal
SELECT 
    f.Flight_ID,
    f.Flight_Number,
    a1.IATA_Code AS Departure_IATA,
    a2.IATA_Code AS Arrival_IATA,
    f.Departure_Time,
    f.Arrival_Time
FROM flight f
JOIN airport a1 ON f.Departure_Airport = a1.ICAO_Code
JOIN airport a2 ON f.Arrival_Airport = a2.ICAO_Code
WHERE a1.IATA_Code = 'BZL' OR a2.IATA_Code = 'BZL';



-- list of flight dhaka to Barishal
SELECT 
    f.Flight_ID,
    f.Flight_Number,
    da.IATA_Code AS Departure_IATA,
    aa.IATA_Code AS Arrival_IATA,
    f.Departure_Time,
    f.Arrival_Time,
    f.Flight_Status
FROM flight f
JOIN airport da ON f.Departure_Airport = da.ICAO_Code
JOIN airport aa ON f.Arrival_Airport=aa.ICAO_Code
WHERE da.IATA_Code ='DAC' AND aa.IATA_Code = 'BZL';





