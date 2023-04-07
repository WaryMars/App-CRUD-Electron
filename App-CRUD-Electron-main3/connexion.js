const { ipcRenderer } = require('electron');
const { connection } = require('./database');
const bcrypt = require('bcrypt');

const form = document.querySelector('#connexion-form');
const mail_utilisateurInput = document.querySelector('#mail_utilisateur');
const mdp_utilisateurInput = document.querySelector('#mdp_utilisateur');

form.addEventListener('submit', (event) => {
  event.preventDefault();

  const mail_utilisateur = mail_utilisateurInput.value;
  const mdp_utilisateur = mdp_utilisateurInput.value;

  // Récupération du mot de passe de l'utilisateur
  connection.query('SELECT * FROM utilisateur WHERE mail_utilisateur = ?', [mail_utilisateur])
    .then(([rows]) => {
      if (rows.length == 0) {
        ipcRenderer.send('login-reply', { success: false, message: 'Nom d\'utilisateur ou mot de passe incorrect.' });
        console.log("Nom d\'utilisateur ou mot de passe incorrect.");
        return;
      }

      const user = rows[0];

      // Vérification du mot de passe
      bcrypt.compare(mdp_utilisateur, user.mdp_utilisateur)
        .then((result) => {
          if (!result) {
            ipcRenderer.send('login-reply', { success: false, message: 'Nom d\'utilisateur ou mot de passe incorrect.' });
            alert("Nom d\'utilisateur ou mot de passe incorrect.");
            return;
          }

          ipcRenderer.send('connexion-success', { success: true, message: 'Connexion réussie.' });
          window.loadFile('dashboard.html')
          alert("Connexion réussie")
        })
        .catch((error) => {
          console.error(error);
          ipcRenderer.send('login-reply', { success: false, message: 'Erreur lors de la connexion.' });
          alert("Erreur lors de la connexion.");
        });
    })
    .catch((error) => {
      console.error(error);
      ipcRenderer.send('login-reply', { success: false, message: 'Erreur lors de la connexion.' });
      
    });
});
