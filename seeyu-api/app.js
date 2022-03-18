const { client } = require("./services/pulsar-client");
const imgurClient = require("./services/imgur-client");
require("dotenv").config();


require("./controllers/producer")(client, imgurClient);