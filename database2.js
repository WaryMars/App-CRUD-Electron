const mysql = require('mysql2/promise');

// Connexion à la base de données MySQL
const connection = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'mydatabase'
});


module.exports = { connection };
