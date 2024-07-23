class AssetView{
    constructor(UserName,TransportID,TransportType,TransportModel,TransportNumber){
        this.UserName = UserName; 
        this.TransportID = TransportID;
        this.TransportType = TransportType;
        this.TransportModel = TransportModel    ;
        this.TransportNumber = TransportNumber;
    }
}

module.exports = AssetView;