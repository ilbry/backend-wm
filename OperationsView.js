class OperationsView{
    constructor(OperationID,CollectionLocationName,CollectionLocationAdress,DeliveryLocationName,DeliveryLocationAdress,CustomerName,DriverName,TransportNumber,Schedule,Price){
        this.OperationID = OperationID; 
        this.CollectionLocationName = CollectionLocationName;
        this.CollectionLocationAdress = CollectionLocationAdress;
        this.DriveDeliveryLocationNamerID = DeliveryLocationName;
        this.DeliveryLocationAdress = DeliveryLocationAdress;
        this.CustomerName = CustomerName;
        this.DriverName = DriverName;
        this.TransportNumber = TransportNumber;
        this.Schedule = Schedule;
        this.Price = Price;
    }
}

module.exports = OperationsView;