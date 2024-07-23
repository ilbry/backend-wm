class Collection_Locations{
    constructor(CollectionLocationID,CollectionLocationName,CollectionLocationAdress,WasteAmountTones,ClientID,CollectionWasteTypes){
        this.CollectionLocationID = CollectionLocationID; 
        this.CollectionLocationName = CollectionLocationName;
        this.CollectionLocationAdress = CollectionLocationAdress;
        this.WasteAmountTones = WasteAmountTones;
        this.ClientID = ClientID;
        this.UserACollectionWasteTypesdress = CollectionWasteTypes;
    }
}

module.exports = Collection_Locations;