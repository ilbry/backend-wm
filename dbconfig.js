const config = {
    user :'sa',
    password :'123457',
    server:'192.168.56.1',
    database:'wastemanagement',
    options:{
        trustedconnection: true,
        trustServerCertificate: true,
        enableArithAbort : true, 
        instancename :'DESKTOP-65P6PNM'
    },
    port: 1433
}

module.exports = config; 