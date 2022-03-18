require("dotenv").config();




async function SendPushNotification(data, callback){


    var header = {
        "Content-Type" : "application/json; charset=utf-8",
         Authorization : "Basic " + process.env.ONESIGNAL_API_KEY
        
    };

    var options = {
        host :"onesignal.com",
        port: 443,
        path:"/api/v1/notifications",
        method: "POST",
        headers: header
    };

   
    const https = require("https");
    const request = https.request(options, function (res){

        
        res.on("data", function(data){
            console.log(JSON.parse(data));
            return callback(null, JSON.parse(data))
        })
        console.log("called ===========================>");
        console.log(`this is ress  ${res}`);
    });

    

    request.on("error", function(error){
        console.log("thres rrror ========>>SKKK");
        return callback({
            message: error
        })
    });
    
    
    request.end();

}

module.exports = {
    SendPushNotification
}