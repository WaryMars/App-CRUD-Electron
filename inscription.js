const { ipcRenderer } = require('electron');
const { connection } = require('./database');
const bcrypt = require('bcrypt');

const form = document.querySelector('#inscription-form');
const usernameInput = document.querySelector('#username');
const passwordInput = document.querySelector('#password');

form.addEventListener('submit', (event) => {
  event.preventDefault();

  const username = usernameInput.value;
  const password = passwordInput.value;

  // Vérification de l'existence du nom d'utilisateur
  connection.query('SELECT COUNT(*) AS count FROM users WHERE username = ?', [username])
    .then(([rows]) => {
      if (rows[0].count > 0) {
        ipcRenderer.send('register-reply', { success: false, message: 'Nom d\'utilisateur déjà utilisé.' });
        return;
      }

      // Hachage du mot de passe
      bcrypt.hash(password, 10)
        .then((hash) => {
          // Insertion de l'utilisateur dans la base de données
          return connection.query('INSERT INTO users (username, password) VALUES (?, ?)', [username, hash]);
        })
        .then(() => {
          ipcRenderer.send('inscription-success', { success: true, message: 'Inscription réussie.' });
        })
        .catch((error) => {
          console.error(error);
          ipcRenderer.send('register-reply', { success: false, message: 'Erreur lors de l\'inscription.' });
        });
    })
    .catch((error) => {
      console.error(error);
      ipcRenderer.send('register-reply', { success: false, message: 'Erreur lors de la vérification du nom d\'utilisateur.' });
    });
});
