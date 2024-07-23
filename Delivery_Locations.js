class Delivery_Locations{
    constructor(DeliveryLocationID,DeliveryLocationName,DeliveryLocationAdress,DeliveryLocationType,DeliveryWasteTypes){
        this.DeliveryLocationID = DeliveryLocationID; 
        this.DeliveryLocationName = DeliveryLocationName;
        this.DeliveryLocationAdress = DeliveryLocationAdress;
        this.DeliveryLocationType = DeliveryLocationType;
        this.DeliveryWasteTypes = DeliveryWasteTypes;
    }
}

module.exports = Delivery_Locations;