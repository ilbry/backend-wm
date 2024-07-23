const dboperations = require('./dboperations');

var express = require('express');
var bodyParser = require('body-parser');
var cors = require('cors'); 
var app = express();
var router = express.Router();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());
app.use('/api', router);

router.use((request,response,next)=>{
   console.log('middleware');
   next();
})

router.route('/getUsers').get( (req, res) => {
   dboperations.getUsers()
       .then(result => {
           res.json(result[0]);
       })
       .catch(error => {
           console.log(error);
           res.status(500).send('Internal Server Error');
       });
});

router.route('/login').post(async (request, response) => {
   const { UserEmail, password } = request.body;
 
   try {
     const result = await dboperations.login(UserEmail, password);
     if (result) {
       response.json(result);
     } else {
      console.log(UserEmail, password);
       response.status(401).json({ message: 'Invalid UserEmail or password' });
     }
   } catch (error) {
     console.error('Login error:', error);
     response.status(500).json({ message: 'Internal server error' });
   }
 });
 
router.route('/getRequestsView').get((request, response)=>{

    dboperations.getRequestsView().then(result => {
       response.json(result[0]);
    })

})

router.route('/getAssets').get((request, response)=>{

   dboperations.getAssets().then(result => {
      response.json(result[0]);
   })

})

router.route('/getOperations').get((request, response)=>{

    dboperations.getOperations().then(result => {
       response.json(result[0]);
    })

})

router.route('/getOperation/:OperationID').get((request,response)=>{

   dboperations.getOperation(request.params.OperationID).then(result => {
      response.json(result[0]);
   })

})

router.route('/updateOperation/:OperationID').put((request, response) => {
   const { Schedule, Price, CollectionLocationName, CollectionLocationAdress, DeliveryLocationName, DeliveryLocationAdress, CustomerName, DriverName, TransportNumber } = request.body;
   const OperationID = request.params.OperationID;

   dboperations.updateOperation(OperationID, Schedule, Price, CollectionLocationName, CollectionLocationAdress, DeliveryLocationName, DeliveryLocationAdress, CustomerName, DriverName, TransportNumber)
       .then(() => {
           response.status(200).send("Operation updated successfully.");
       })
       .catch(error => {
           console.error("Error updating operation:", error);
           response.status(500).send("Error updating operation.");
       });
});

router.route('/getShortOperations').get((request, response)=>{

   dboperations.getShortOperations().then(result => {
      response.json(result[0]);
   })

})

router.route('/getUser/:UserID').get((request,response)=>{

    dboperations.getUser(request.params.UserID).then(result => {
       response.json(result[0]);
    })

})

var port = process.env.PORT || 8090;
app.listen(port);
console.log('Order API is runnning at ' + port);