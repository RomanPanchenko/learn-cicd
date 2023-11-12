module.exports = (sequelize, Sequelize) => {
  const author = sequelize.define('author', {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    name: {
      type: Sequelize.STRING(200),
      allowNull: false,
    },
  }, {
    tableName: 'authors',
    timestamps: false,
  });

  return author;
};
