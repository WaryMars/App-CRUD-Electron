const mysql = require('mysql2/promise');

const connection = mysql.createPool({
  host: 'localhost',
  user: 'admindb',
  password: '97410',
  database: 'wallidb'
});

module.exports = { connection };
