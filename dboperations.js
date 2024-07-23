var config = require('./dbconfig');
const sql = require('mssql');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
require('dotenv').config();

async function login(UserEmail, password) {
    try {

        const pool = await sql.connect(config);


        const result = await pool.request()
            .input('UserEmail', sql.VarChar(50), UserEmail)
            .query('SELECT * FROM Users WHERE UserEmail = @UserEmail');


        if (result.recordset.length === 1) {
            const user = result.recordset[0];
            const isValidPassword = await bcrypt.compare(password, user.UserPassword);

            if (isValidPassword) {

                const secretKey = require(process.env.SECRET_KEY).randomBytes(64).toString('hex');

                const token = jwt.sign({
                    UserEmail: user.UserEmail,
                    role: user.RoleID,
                    userID: user.UserID
                }, secretKey, { expiresIn: '1h' });

                return { token, role: user.RoleID, userID: user.UserID };
            } else {

                throw new Error('Invalid password');
            }
        } else {

            throw new Error('User not found');
        }
    } catch (error) {

        console.error('Login error:', error);
        throw new Error('Internal server error');
    }
}

async function verifyToken(req, res, next) {
    const token = req.headers['authorization'];
    if (!token) {
        return res.status(401).json({ auth: false, message: 'No token received.' });
    }

    jwt.verify(token, process.env.SECRET_KEY, function(err, decoded) {
        if (err) {
            return res.status(500).json({ auth: false, message: 'Failed to verify token.' });
        }
        req.user = decoded;
        next();
    });
}

async function getUsers() {
    try {
        let pool = await sql.connect(config);
        let users = await pool.request().query("SELECT * from Users");
        return users.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function getRequestsView() {
    try {
        let pool = await sql.connect(config);
        let userRequests = await pool.request().query("SELECT * from RequestsView");
        return userRequests.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function getOperations() {
    try {
        let pool = await sql.connect(config);
        let operations = await pool.request().query("SELECT * from OperationsView");
        return operations.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function getOperation(OperationID) {
    console.log(OperationID)
    try {
        let pool = await sql.connect(config);
        let operation = await pool.request()
            .input('input_parameter', sql.Int, OperationID)
            .query("SELECT * from OperationsView where OperationID = @input_parameter");
        return operation.recordsets;

    }
    catch (error) {
        console.log(error);
    }
}

async function updateOperation(OperationID, Schedule, Price, CollectionLocationName, CollectionLocationAdress, DeliveryLocationName, DeliveryLocationAdress, CustomerName, DriverName, TransportNumber) {
    try {
        let pool = await sql.connect(config);
        let result = await pool.request()
            .input('input_parameter', sql.Int, OperationID)
            .input('Schedule', sql.VarChar(100), Schedule)
            .input('Price', sql.Decimal(9, 4), Price)
            .input('CollectionLocationName', sql.VarChar(100), CollectionLocationName)
            .input('CollectionLocationAdress', sql.VarChar(100), CollectionLocationAdress)
            .input('DeliveryLocationName', sql.VarChar(100), DeliveryLocationName)
            .input('DeliveryLocationAdress', sql.VarChar(100), DeliveryLocationAdress)
            .input('CustomerName', sql.VarChar(100), CustomerName)
            .input('DriverName', sql.VarChar(100), DriverName)
            .input('TransportNumber', sql.VarChar(100), TransportNumber)
            .query(`
                UPDATE Operations 
                SET Schedule = @Schedule, 
                    Price = @Price 
                WHERE OperationID = @input_parameter;

                UPDATE Collection_Locations 
                SET CollectionLocationName = @CollectionLocationName, 
                    CollectionLocationAdress = @CollectionLocationAdress 
                WHERE CollectionLocationID = (
                    SELECT CollectionLocationID 
                    FROM Operations 
                    WHERE OperationID = @input_parameter
                );

                UPDATE Delivery_Locations 
                SET DeliveryLocationName = @DeliveryLocationName, 
                    DeliveryLocationAdress = @DeliveryLocationAdress 
                WHERE DeliveryLocationID = (
                    SELECT DeliveryLocationID 
                    FROM Operations 
                    WHERE OperationID = @input_parameter
                );

                UPDATE Users
                SET UserName = @CustomerName
                WHERE UserID = (
                    SELECT CustomerID
                    FROM Operations
                    WHERE OperationID = @input_parameter
                );

                UPDATE Users
                SET UserName = @DriverName
                WHERE UserID = (
                    SELECT DriverID
                    FROM Operations
                    WHERE OperationID = @input_parameter
                );

                UPDATE Transport
                SET TransportNumber = @TransportNumber
                WHERE TransportID = (
                    SELECT TransportID
                    FROM Operations
                    WHERE OperationID = @input_parameter
                );
            `);
        return result.rowsAffected;
    } catch (error) {
        console.log(OperationID, Schedule, Price, CollectionLocationName, CollectionLocationAdress, DeliveryLocationName, DeliveryLocationAdress, CustomerName, DriverName, TransportNumber);
        console.log(error);
        throw error;
    }
}

async function getShortOperations() {
    try {
        let pool = await sql.connect(config);
        let operations = await pool.request().query("SELECT * from OperationsShortView");
        return operations.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function getAssets() {
    try {
        let pool = await sql.connect(config);
        let operations = await pool.request().query("SELECT * from AssetView");
        return operations.recordsets;
    }
    catch (error) {
        console.log(error);
    }
}

async function getUser(UserID) {
    try {
        let pool = await sql.connect(config);
        let user = await pool.request()
            .input('input_parameter', sql.Int, UserID)
            .query("SELECT * from Users where UserID = @input_parameter");
        return user.recordsets;

    }
    catch (error) {
        console.log(error);
    }
}

module.exports = {
    getUsers: getUsers, 
    getUser : getUser,
    getOperations : getOperations,
    getOperation : getOperation,
    getShortOperations : getShortOperations,
    getRequestsView : getRequestsView,
    getAssets : getAssets,
    updateOperation: updateOperation,
    login: login,
    verifyToken: verifyToken
}