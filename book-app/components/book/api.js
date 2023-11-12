const { getAuthorBook, getAuthorBooks } = require('./controller');

module.exports = (router) => {
  router.get('/book/:authorId/:bookId', getAuthorBook);
  router.get('/book/:authorId', getAuthorBooks);
};