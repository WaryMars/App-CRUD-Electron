const { ipcRenderer } = require('electron');
const { connection } = require('./database');
const bcrypt = require('bcrypt');

const form = document.querySelector('#connexion-form');
const usernameInput = document.querySelector('#username');
const passwordInput = document.querySelector('#password');

form.addEventListener('submit', (event) => {
  event.preventDefault();

  const username = usernameInput.value;
  const password = passwordInput.value;

  // Récupération du mot de passe de l'utilisateur
  connection.query('SELECT * FROM users WHERE username = ?', [username])
    .then(([rows]) => {
      if (rows.length == 0) {
        ipcRenderer.send('login-reply', { success: false, message: 'Nom d\'utilisateur ou mot de passe incorrect.' });
        return;
      }

      const user = rows[0];

      // Vérification du mot de passe
      bcrypt.compare(password, user.password)
        .then((result) => {
          if (!result) {
            ipcRenderer.send('login-reply', { success: false, message: 'Nom d\'utilisateur ou mot de passe incorrect.' });
            return;
          }

          ipcRenderer.send('connexion-success', { success: true, message: 'Connexion réussie.' });
          window.loadFile('dashboard.html')
          alert("Connexion réussie")
        })
        .catch((error) => {
          console.error(error);
          ipcRenderer.send('login-reply', { success: false, message: 'Erreur lors de la connexion.' });
        });
    })
    .catch((error) => {
      console.error(error);
      ipcRenderer.send('login-reply', { success: false, message: 'Erreur lors de la connexion.' });
    });
});
