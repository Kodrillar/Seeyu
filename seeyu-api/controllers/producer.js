
const path = require("path")
const notify = require("../services/notification-message"); 
const fs = require("fs");
const PiCamera = require("pi-camera");
const Sensor = require("pi-pir-sensor");





module.exports = async function(client, imgurClient) {
   

const myCamera = new PiCamera({
    mode:"photo",
    output: path.join(__dirname, "..", "temp/rc.jpg"),
    nopreview:true,
    rotation:180
});


myCamera.snap()
    .then(result =>{
        console.log("Your picture was captured");
    })
    .catch
   

   const producer = await client.createProducer({
      topic: process.env.TOPIC_URL
   });


   if(!imagePath) console.log("The imagePath (directory) does not exist!!");
  const uploadImage =  await imgurClient.upload({
       image: fs.createReadStream(imagePath),
       type: "stream"
   });

   
   const data = {
      user:process.env.SEEYU_USER,
      notification: notify,
      created_at: new Date(),
      image: uploadImage.data.link
   }

   console.log(uploadImage);

   producer.send({ data: Buffer.from(JSON.stringify(data)) });

   fs.unlinkSync(imagePath);
   await producer.flush();
//    //    await producer.close();
//    //    await client.close();

  console.log("Message sent!!!");

};



