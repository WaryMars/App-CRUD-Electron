const mysql = require('mysql2/promise');

const connection = mysql.createPool({
  host: 'mysql-wall-it.alwaysdata.net',
  user: 'wall-it',
  password: 'BTSSIO@25jo',
  database: 'wall-it_wallidb'
});

module.exports = { connection };
