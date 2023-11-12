const service = require('./service');

const getAuthorBook = async (req, res) => {
  const book = await service.getAuthorBook(req.params.authorId, req.params.bookId);
  return res.status(200).send(book);
};

const getAuthorBooks = async (req, res) => {
  const books = await service.getAuthorBooks(req.params.authorId);
  return res.status(200).send(books);
};

module.exports = {
  getAuthorBook,
  getAuthorBooks,
};