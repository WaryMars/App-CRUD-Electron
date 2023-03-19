const mysql = require('mysql2/promise');

const connection = mysql.createPool({
  host: 'localhost',
  user: 'btssio',
  password: 'btssio',
  database: 'wallidb'
});

module.exports = { connection };
