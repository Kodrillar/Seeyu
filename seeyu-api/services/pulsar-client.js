const Pulsar = require("pulsar-client");

require("dotenv").config();

const client = new Pulsar.Client({
    tlsTrustCertsFilePath : "/etc/ssl/certs/ca-certificates.crt",
    serviceUrl: process.env.SERVICE_URL,
    operationTimeoutSeconds: 50,
    authentication: new Pulsar.AuthenticationToken({token:process.env.AUTH_TOKEN})
})

module.exports.client =  client;
module.exports.Pulsar = Pulsar;