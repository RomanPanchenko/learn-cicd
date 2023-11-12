const models = require('../../models');

const getAuthorBook = async (authorId, bookId) => {
  const book = await models.book.findOne({ where: { id: bookId, author_id: authorId } });
  return book;
};

const getAuthorBooks = async (authorId) => {
  const books = await models.book.findAll({ where: { author_id: authorId } });
  return books;
};

module.exports = {
  getAuthorBook,
  getAuthorBooks,
};