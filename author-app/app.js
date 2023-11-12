const config = require('config');
const app = require('express')();
const router = require('express-promise-router')();

app.get('/status', (req, res) => res.status(200).send('Status is OK'));
app.use(router);
require('./components/author/api')(router);

module.exports = app;