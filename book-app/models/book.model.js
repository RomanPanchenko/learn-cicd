module.exports = (sequelize, Sequelize) => {
  const book = sequelize.define('book', {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    author_id: {
      type: Sequelize.INTEGER,
      allowNull: false,
    },
    name: {
      type: Sequelize.STRING(200),
      allowNull: false,
    },
  }, {
    tableName: 'books',
    timestamps: false,
  });

  return book;
};
