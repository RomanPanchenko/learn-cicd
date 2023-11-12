const config = require('config');
const axios = require('axios');
const models = require('../../models');

const bookAppHost = config.get('book_app.host');
const bookAppPort = config.get('book_app.port');

const getAuthor = async (authorId) => {
  const author = await models.author.findByPk(authorId);
  return author;
};

const getAuthorBooks = async (authorId) => {
  const books = await axios.get(`http://${bookAppHost}:${bookAppPort}/book/${authorId}`);
  return books.data;
};

module.exports = {
  getAuthor,
  getAuthorBooks,
};