const app = require('express')()

app.get('/', (req, res) => {
  res.send("Hello from Appsody and App ID");
});
 
module.exports.app = app;
