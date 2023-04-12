const { ipcRenderer } = require('electron');
const { connection } = require('./database');
const bcrypt = require('bcrypt');

const form = document.querySelector('#inscription-form');
const mail_utilisateurInput = document.querySelector('#mail_utilisateur');
const mdp_utilisateurInput = document.querySelector('#mdp_utilisateur');

form.addEventListener('submit', (event) => {
  event.preventDefault();

  const mail_utilisateur = mail_utilisateurInput.value;
  const mdp_utilisateur = mdp_utilisateurInput.value;

  // Vérification de l'existence du nom d'utilisateur
  connection.query('SELECT COUNT(*) AS count FROM utilisateur WHERE mail_utilisateur = ?', [mail_utilisateur])
    .then(([rows]) => {
      if (rows[0].count > 0) {
        ipcRenderer.send('register-reply', { success: false, message: 'Nom d\'utilisateur déjà utilisé.' });
        return;
      }

      // Hachage du mot de passe
      bcrypt.hash(mdp_utilisateur, 10)
        .then((hash) => {
          // Insertion de l'utilisateur dans la base de données
          return connection.query('INSERT INTO utilisateur (mail_utilisateur, mdp_utilisateur) VALUES (?, ?)', [mail_utilisateur, hash]);
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
