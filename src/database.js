const mysql = require('promise-mysql');

const connection = mysql.createConnection({
  host: '127.0.0.1',
  port: '3306',
  user: 'admindb',
  password: '97410',
  database: 'electrondb'
});

function getConnection() {
  return connection;
}

module.exports = { getConnection };