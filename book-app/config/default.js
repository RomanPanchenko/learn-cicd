const ENV = process.env.NODE_ENV;

module.exports = {
  env: ENV,
  tz: 'UTC',
  host: '0.0.0.0',
  port: 3002,
  db: {
    dialect: 'mysql',
    username: '',
    password: '',
    database: '',
    host: '',
    port: '',
    synchronize: false,
  },
};
