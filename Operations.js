class Operaions{
    constructor(OperationID,CollectionLocationID,DeliveryLocationID,DriverID,CustomerID,TransportID,Schedule,Price){
        this.OperationID = OperationID; 
        this.CollectionLocationID = CollectionLocationID;
        this.DeliveryLocationID = DeliveryLocationID;
        this.DriverID = DriverID;
        this.CustomerID = CustomerID;
        this.TransportID = TransportID;
        this.Schedule = Schedule;
        this.Price = Price;
    }
}

module.exports = Operaions;