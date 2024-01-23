const app = require('express')();
const router = require('express-promise-router')();
const cors = require('cors');

// Disable CORS for all routes
app.use(cors());

app.get('/status', (req, res) => res.status(200).send('Status is OK'));
app.use(router);
require('./components/author/api')(router);

module.exports = app;