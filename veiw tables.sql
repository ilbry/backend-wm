USE wastemanagement;

CREATE VIEW OperationsView AS
SELECT 
    a.OperationID,
	b.CollectionLocationName,
    b.CollectionLocationAdress,
	c.DeliveryLocationName,
	c.DeliveryLocationAdress,
	d.CustomerName,
	e.DriverName,
	f.TransportNumber,
	a.Schedule,
	a.Price
FROM 
    Operations a
INNER JOIN 
    Collection_Locations b ON a.CollectionLocationID = b.CollectionLocationID
INNER JOIN
    Delivery_Locations c ON a.DeliveryLocationID = c.DeliveryLocationID
INNER JOIN
    Customers d ON a.CustomerID = d.UserID
INNER JOIN
    Drivers e ON a.DriverID = e.UserID
INNER JOIN
    Transport f ON a.TransportID = f.TransportID

SELECT * FROM OperationsView;

CREATE VIEW OperationsShortView AS
SELECT 
    a.OperationID,
	b.CustomerName,
	c.DriverName
FROM 
    Operations a
INNER JOIN
    Customers b ON a.CustomerID = b.UserID
INNER JOIN
    Drivers c ON a.DriverID = c.UserID

SELECT * FROM OperationsShortView;

CREATE VIEW RequestsView AS
SELECT
    UserName,
    RequestID,
    RequestText
FROM 
    Users a
INNER JOIN 
    UserRequests b ON a.UserID = b.UserID

SELECT * FROM RequestsView;

CREATE VIEW AssetView AS
SELECT 
    a.UserName,
	b.TransportID,
	b.TransportType,
    b.TransportModel,
	b.TransportNumber
FROM 
    Users a
INNER JOIN 
    Transport b ON a.TransportID = b.TransportID

SELECT * FROM AssetView;