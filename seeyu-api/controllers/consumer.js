
const {client} = require("../start/pulsar-client");
const fs = require("fs")


( async()=>{

 

    const consumer = await client.subscribe({
        topic:process.env.TOPIC_URL,
        ackTimeoutMs:10000,
        subscription:"seeyu-sub",
        subscriptionType:"Shared"
        
    })

        const data = await consumer.receive();

        let fulldata = Buffer.from(data.getData().toString());
       
        const CONVERTED_JSON = JSON.parse(fulldata);

        res.send(CONVERTED_JSON.user);
        await consumer.acknowledge(data);
     
    
       
        // await consumer.close();
        // await client.close();
       

})
