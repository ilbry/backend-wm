USE wastemanagement;

INSERT INTO Transport (TransportModel, TransportType, TransportNumber)
VALUES 
    ('Tesla', 'Garbage Truck', 'CT12 WLT'),
    ('Ford', 'Recycling Truck', 'RW09 TWR'),
    ('Toyota', 'Compost Truck', 'LL18 HGV'),
    ('Mercedes-Benz', 'Roll-off Truck', 'CW22 TRK'),
    ('Honda', 'Roll-off Truck', 'NP14 LRR'),
    ('Audi', 'Garbage Truck', 'CT34 RLT'),
    ('BMW', 'Recycling Truck', 'RW15 TFR'),
    ('Volkswagen', 'Compost Truck', 'LL25 HFT');

	
INSERT INTO Roles (RoleName) 
VALUES 
('Admin'),
('ExternalUser'),
('InternalUser');

INSERT INTO Users (RoleID, UserPassword, UserEmail, UserName, UserDOB, UserAdress, TransportID) 
VALUES 
(1, '123457', 'ilbry00@gmail.com', 'Illia Bryzh', '2003-02-08', '123 Main St', NULL),
(2, 'p@ssw0rd2', 'jane.smith@example.com', 'Jane Smith', '1991-02-02', '456 Elm St', NULL),
(2, 'p@ssw0rd3', 'mike.johnson@example.com', 'Mike Johnson', '1992-03-03', '789 Oak St', NULL),
(2, 'p@ssw0rd4', 'sara.williams@example.com', 'Sara Williams', '1993-04-04', '101 Maple St', NULL),
(2, 'p@ssw0rd5', 'chris.brown@example.com', 'Chris Brown', '1994-05-05', '111 Pine St', NULL),
(2, 'password6', 'sarah.jones@example.com', 'Sarah Jones', '1994-02-18', '222 Cedar St', NULL),
(3, 'password7', 'kevin.davis@example.com', 'Kevin Davis', '1987-06-30', '333 Walnut St', 1),
(3, 'password8', 'lisa.miller@example.com', 'Lisa Miller', '1991-09-22', '444 Birch St', 2),
(3, 'password9', 'matthew.wilson@example.com', 'Matthew Wilson', '1980-11-10', '555 Oak St', 3),
(3, 'password10', 'amanda.taylor@example.com', 'Amanda Taylor', '1983-08-05', '666 Elm St', 4),
(3, 'password11', 'alexandra.thomas@example.com', 'Alexandra Thomas', '1996-04-25', '777 Pine St', 5),
(2, 'password12', 'john.doe@example.com', 'John Doe', '1995-07-15', '888 Maple St', NULL),
(2, 'password13', 'jane.doe@example.com', 'Jane Doe', '1996-08-20', '999 Elm St', NULL),
(2, 'password14', 'sam.smith@example.com', 'Sam Smith', '1989-09-10', '123 Oak St', NULL),
(2, 'password15', 'emily.jackson@example.com', 'Emily Jackson', '1990-10-12', '456 Pine St', NULL),
(2, 'password16', 'michael.brown@example.com', 'Michael Brown', '1987-11-25', '789 Cedar St', NULL),
(2, 'password17', 'jessica.white@example.com', 'Jessica White', '1988-12-30', '101 Birch St', NULL),
(2, 'password18', 'david.jones@example.com', 'David Jones', '1992-05-22', '222 Walnut St', NULL),
(2, 'password19', 'olivia.miller@example.com', 'Olivia Miller', '1993-04-15', '333 Maple St', NULL),
(2, 'password20', 'william.wilson@example.com', 'William Wilson', '1994-03-18', '444 Elm St', NULL),
(2, 'password21', 'emma.thomas@example.com', 'Emma Thomas', '1991-02-07', '555 Oak St', NULL),
(2, 'password22', 'james.johnson@example.com', 'James Johnson', '1985-09-14', '666 Cedar St', NULL),
(2, 'password23', 'ava.anderson@example.com', 'Ava Anderson', '1986-08-29', '777 Pine St', NULL),
(2, 'password24', 'alexander.martin@example.com', 'Alexander Martin', '1984-07-26', '888 Cedar St', NULL),
(2, 'password25', 'oliver.garcia@example.com', 'Oliver Garcia', '1983-06-28', '999 Walnut St', NULL),
(2, 'password26', 'mia.martinez@example.com', 'Mia Martinez', '1982-05-31', '123 Maple St', NULL),
(3, 'password27', 'ryan.anderson@example.com', 'Ryan Anderson', '1980-04-05', '111 Oak St', 6),
(3, 'password28', 'ava.thompson@example.com', 'Ava Thompson', '1981-03-10', '222 Elm St', 7),
(3, 'password29', 'daniel.morris@example.com', 'Daniel Morris', '1979-02-15', '333 Pine St', 8);

INSERT INTO Customers (UserID, RoleID, CustomerName) 
VALUES 
(2, 2, 'Jane Smith'),
(3, 2, 'Mike Johnson'),
(4, 2, 'Sara Williams'),
(5, 2, 'Chris Brown'),
(6, 2, 'Sarah Jones'),
(13, 2, 'John Doe'),
(14, 2, 'Jane Doe'),
(15, 2, 'Sam Smith'),
(16, 2, 'Emily Jackson'),
(17, 2, 'Michael Brown'),
(18, 2, 'Jessica White'),
(19, 2, 'David Jones'),
(20, 2, 'Olivia Miller'),
(21, 2, 'William Wilson'),
(22, 2, 'Emma Thomas'),
(23, 2, 'James Johnson'),
(24, 2, 'Ava Anderson'),
(25, 2, 'Alexander Martin'),
(26, 2, 'Oliver Garcia'),
(27, 2, 'Mia Martinez');

INSERT INTO Drivers (UserID, RoleID, DriverName) 
VALUES 
(7, 3, 'Kevin Davis'),
(8, 3, 'Lisa Miller'),
(9, 3, 'Matthew Wilson'),
(10, 3, 'Amanda Taylor'),
(11, 3, 'Alexandra Thomas'),
(28, 3, 'Ryan Anderson'),
(29, 3, 'Ava Thompson'),
(30, 3, 'Daniel Morris');

INSERT INTO Collection_Locations (CollectionLocationName, CollectionLocationAdress, WasteAmountTones, ClientID, CollectionWasteTypes)
VALUES 
    ('Location A', '123 Main St', 10.5, 2, 'Organic'),
    ('Location B', '456 Elm St', 8.2, 3, 'E-Waste'),
    ('Location C', '789 Oak St', 15.3, 4, 'Organic, Recycable'),
    ('Location D', '101 Pine St', 20.0, 5, 'Hazardous'),
    ('Location E', '222 Maple St', 12.8, 6, 'Recycable'),
    ('Location F', '333 Walnut St', 18.5, 13, 'Organic'),
    ('Location G', '444 Birch St', 14.2, 14, 'E-Waste'),
    ('Location H', '555 Oak St', 25.1, 15, 'Organic, Recyclable'),
    ('Location I', '666 Elm St', 30.0, 16, 'Hazardous'),
    ('Location J', '777 Pine St', 22.8, 17, 'Recyclable'),
    ('Location K', '888 Cedar St', 16.5, 18, 'Organic'),
    ('Location L', '999 Walnut St', 11.3, 19, 'E-Waste'),
    ('Location M', '123 Maple St', 19.7, 20, 'Hazardous'),
    ('Location N', '234 Oak St', 13.4, 21, 'Recyclable'),
    ('Location O', '345 Elm St', 8.9, 22, 'Organic'),
    ('Location P', '456 Pine St', 27.2, 23, 'E-Waste'),
    ('Location Q', '567 Cedar St', 22.6, 24, 'Organic, Recyclable'),
    ('Location R', '678 Birch St', 14.9, 25, 'Hazardous'),
    ('Location S', '789 Maple St', 10.7, 26, 'Recyclable'),
    ('Location T', '890 Oak St', 16.3, 27, 'Organic');

INSERT INTO Delivery_Locations (DeliveryLocationName, DeliveryLocationAdress, DeliveryLocationType, DeliveryWasteTypes)
VALUES 
    ('Location A', '123 Main St', 'Disposal', 'E-Waste'),
    ('Location B', '456 Elm St', 'Recycling', 'Hazardous'),
    ('Location C', '789 Oak St', 'Diposal', 'Organic'),
    ('Location D', '101 Pine St', 'Disposal', 'Organic, Recycable'),
    ('Location E', '222 Maple St', 'Recycling', 'Recycable'),
    ('Location F', '333 Walnut St', 'Disposal', 'Organic'),
    ('Location G', '444 Birch St', 'Recycling', 'Recyclable'),
    ('Location H', '555 Oak St', 'Disposal', 'Recycling, Paper');

INSERT INTO Operations (CollectionLocationID, DeliveryLocationID, DriverID, CustomerID, TransportID, Schedule, Price)
VALUES 
    (1, 3, 7, 2, 3, 'Monday 10:00 AM', 10000.00),
    (2, 1, 8, 3, 2, 'Wednesday 2:30 PM', 15000.50),
    (3, 4, 9, 4, 4, 'Friday 9:00 AM', 12000.75),
    (4, 2, 10, 5, 5, 'Tuesday 11:45 AM', 11000.25),
    (5, 5, 11, 6, 1, 'Thursday 3:00 PM', 18000.00),
    (6, 3, 28, 13, 6, 'Thursday 3:00 PM', 18000.00),
    (7, 4, 29, 14, 7, 'Monday 8:00 AM', 9000.00),
    (8, 2, 30, 15, 8, 'Tuesday 10:30 AM', 8500.50),
    (9, 4, 7, 16, 3, 'Thursday 1:00 PM', 9300.75),
    (10, 3, 8, 17, 2, 'Friday 11:15 AM', 8700.25),
    (11, 7, 9, 18, 4, 'Monday 2:30 PM', 9200.00),
    (12, 6, 10, 19, 5, 'Wednesday 9:00 AM', 8900.00),
    (13, 4, 11, 20, 1, 'Thursday 11:30 AM', 9100.50),
    (14, 3, 28, 21, 6, 'Friday 1:45 PM', 9400.75),
    (15, 8, 29, 22, 7, 'Tuesday 2:15 PM', 9600.25),
    (16, 8, 30, 23, 8, 'Wednesday 10:30 AM', 8800.00),
    (17, 8, 7, 24, 3, 'Thursday 1:00 PM', 9500.00),
    (18, 7, 8, 25, 2, 'Friday 9:30 AM', 9200.50),
    (19, 7, 9, 26, 4, 'Monday 12:45 PM', 9700.75),
    (20, 7, 10, 27, 5, 'Wednesday 2:00 PM', 9900.25);

INSERT INTO UserRequests (RequestText, UserID)
VALUES 
    ('Please change the collection day from Monday to Thursday.', 2),
    ('Transport id4 broke down', 9);