const firebase = require("firebase-admin");

const serviceAccount = require(YOUR_PRIVATE_KEY) // generate firebase privateKey
const firebaseToken= "DEVICE_TOKEN";

firebase.initializeApp({
    credential:firebase.credential.cert(serviceAccount)
});

const notificationPayload = {
    notification:{
        title:"Hello, dear!",
        body: "MESSAGE_BODY_FROM_ASTRA_STREAMING",
        click_action: "FLUTTER_NOTIFICATION_CLICK"
    }
}


const options = {priority:"high", timeToLive:30 * 30 * 30};


// SEND MESSAGE THROUGH THIS
// firebase.messaging().sendToDevice(firebaseToken, notificationPayload ,options);


module.exports = firebase;