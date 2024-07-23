CREATE DATABASE wastemanagement;
USE wastemanagement;

CREATE TABLE Transport (
    TransportID int PRIMARY KEY IDENTITY,
    TransportModel varchar(30),
    TransportType varchar(30),
	TransportNumber varchar(10)
);
SELECT * FROM Transport;

CREATE TABLE Roles (
    RoleID int PRIMARY KEY IDENTITY,
    RoleName varchar(50) UNIQUE,
);
SELECT * FROM Roles;

CREATE TABLE Users (
    UserID int PRIMARY KEY IDENTITY,
	RoleID int FOREIGN KEY REFERENCES Roles(RoleID),
	UserPassword varchar(255),
	UserEmail varchar(50),
    UserName varchar(100),
    UserDOB date,
    UserAdress varchar(100),
	TransportID int FOREIGN KEY REFERENCES Transport(TransportID)
);
SELECT * FROM Users;

CREATE TABLE Customers (
    UserID int FOREIGN KEY REFERENCES Users(UserID),
    RoleID int FOREIGN KEY REFERENCES Roles(RoleID),
    CustomerName varchar(100) FOREIGN KEY REFERENCES Users(UserName),
    CONSTRAINT CHK_ClientID CHECK (RoleID = 2)
);
SELECT * FROM Customers;

CREATE TABLE Drivers (
    UserID int FOREIGN KEY REFERENCES Users(UserID),
    RoleID int FOREIGN KEY REFERENCES Roles(RoleID),
    DriverName varchar(100) FOREIGN KEY REFERENCES Users(UserName),
    CONSTRAINT CHK_DriverID CHECK (RoleID = 3)
);
SELECT * FROM Drivers;

CREATE TABLE Collection_Locations (
    CollectionLocationID int PRIMARY KEY IDENTITY,
    CollectionLocationName varchar(100) NOT NULL,
    CollectionLocationAdress varchar(100) NOT NULL,
    WasteAmountTones FLOAT(5) NOT NULL,
    ClientID int FOREIGN KEY REFERENCES Users(UserID),
    CollectionWasteTypes varchar(100) NOT NULL,
);
SELECT * FROM Collection_Locations;

	CREATE TABLE Delivery_Locations (
    DeliveryLocationID int PRIMARY KEY IDENTITY,
    DeliveryLocationName varchar(100) NOT NULL,
    DeliveryLocationAdress varchar(100) NOT NULL,
    DeliveryLocationType varchar(100) NOT NULL,
    DeliveryWasteTypes varchar(100) NOT NULL,
);
SELECT * FROM Delivery_Locations;

CREATE TABLE Operations (
    OperationID int PRIMARY KEY IDENTITY,
    CollectionLocationID int FOREIGN KEY REFERENCES Collection_Locations(CollectionLocationID),	
    DeliveryLocationID int FOREIGN KEY REFERENCES Delivery_Locations(DeliveryLocationID),	
    DriverID int FOREIGN KEY REFERENCES Users(UserID),
	CustomerID int FOREIGN KEY REFERENCES Users(UserID),
	TransportID int FOREIGN KEY REFERENCES Transport(TransportID),
    Schedule varchar(100),
    Price DECIMAL(9, 4),	
);
SELECT * FROM Operations;

CREATE TABLE UserRequests (
    RequestID int PRIMARY KEY IDENTITY,
	RequestText varchar(800),
    UserID int FOREIGN KEY REFERENCES Users(UserID),	
);
SELECT * FROM UserRequests;