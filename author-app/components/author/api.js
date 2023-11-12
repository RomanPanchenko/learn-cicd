const { getAuthor, getAuthorBooks } = require('./controller');

module.exports = (router) => {
  router.get('/author/:authorId', getAuthor);
  router.get('/author/:authorId/books', getAuthorBooks);
};