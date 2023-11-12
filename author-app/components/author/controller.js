const service = require('./service');

const getAuthor = async (req, res) => {
  const author = await service.getAuthor(req.params.authorId);
  return res.status(200).send(author);
};

const getAuthorBooks = async (req, res) => {
  const books = await service.getAuthorBooks(req.params.authorId);
  return res.status(200).send(books);
};

module.exports = {
  getAuthor,
  getAuthorBooks,
};