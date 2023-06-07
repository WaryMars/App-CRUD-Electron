const { ipcRenderer } = require('electron');
const { connection } = require('./database');
const bcrypt = require('bcrypt');

const form = document.querySelector('#inscription-form');
const mail_utilisateurInput = document.querySelector('#inputEmail');
const mdp_utilisateurInput = document.querySelector('#mdp_utilisateur');
const adresseInput = document.querySelector('#adresse');
const villeInput = document.querySelector('#Ville');
const cpInput = document.querySelector('#CP');

form.addEventListener('submit', (event) => {
  event.preventDefault();

  const mail_utilisateur = mail_utilisateurInput.value;
  const mdp_utilisateur = mdp_utilisateurInput.value;
  const pays = adresseInput.value;
  const ville = villeInput.value;
  const code_postal = cpInput.value;

  // Vérification de l'existence du nom d'utilisateur
  connection.query('SELECT COUNT(*) AS count FROM utilisateur WHERE mail_utilisateur = ?', [mail_utilisateur])
    .then(([rows]) => {
      if (rows[0].count > 0) {
        ipcRenderer.send('register-reply', { success: false, message: 'Nom d\'utilisateur déjà utilisé.' });
        window.alert('Mail déjà utilisé.');
        return;
      }

      // Hachage du mot de passe
      bcrypt.hash(mdp_utilisateur, 10)
        .then((hash) => {
          // Insertion de l'utilisateur dans la base de données
          return connection.query('INSERT INTO utilisateur (pays, ville, code_postal, mail_utilisateur, mdp_utilisateur) VALUES (?, ?, ?, ?, ?)', [pays, ville, code_postal, mail_utilisateur, hash]);
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
