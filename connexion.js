const { ipcRenderer } = require('electron');
const mysql = require('mysql2');
const { promisify } = require('util');
const { connection } = require('./database2');
const bcrypt = require('bcrypt');


const connexionForm = document.querySelector('#connexion-form');


connexionForm.addEventListener('submit', async (event) => {
  event.preventDefault();

  const username = event.target.username.value;
  const password = event.target.password.value;


  const query = promisify(connection.query.bind(connection));

   //Récupération du mot de passe de l'utilisateur
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
            window.alert('Nom d\'utilisateur ou mot de passe incorrect.');
            return;
          }

          ipcRenderer.send('login-reply', { success: true, message: 'Connexion réussie.' });
          window.alert('Connexion réussie.');
        })
        .catch((error) => {
          console.error(error);
          ipcRenderer.send('login-reply', { success: false, message: 'Erreur lors de la connexion.' });
          window.alert('Erreur lors de la connexion.')
        });
    })
    .catch((error) => {
      console.error(error);
      ipcRenderer.send('login-reply');
    });
 
 /* try {
    const results = await query(`SELECT * FROM users WHERE username = '${username}' AND password = '${password}'`);

    if (results.length > 0) {
      ipcRenderer.send('connexion-success', username);
    } else {
      ipcRenderer.send('connexion-failure');
    }
  } catch (error) {
    console.error(error);
  } finally {
    connection.end();
  }*/


});





// const { ipcRenderer } = require('electron');
// const { connection } = require('./database2');
// const bcrypt = require('bcrypt');

// const form = document.querySelector('#connexion-form');
// const usernameInput = document.querySelector('#username');
// const passwordInput = document.querySelector('#password');

// form.addEventListener('submit', (event) => {
//   event.preventDefault();

//   const username = usernameInput.value;
//   const password = passwordInput.value;

//   // Récupération du mot de passe de l'utilisateur
//   connection.query('SELECT * FROM users WHERE username = ?', [username])
//     .then(([rows]) => {
//       if (rows.length == 0) {
//         ipcRenderer.send('login-reply', { success: false, message: 'Nom d\'utilisateur ou mot de passe incorrect.' });
//         return;
//       }

//       const user = rows[0];

//       // Vérification du mot de passe
//       bcrypt.compare(password, user.password)
//         .then((result) => {
//           if (!result) {
//             ipcRenderer.send('login-reply', { success: false, message: 'Nom d\'utilisateur ou mot de passe incorrect.' });
//             return;
//           }

//           ipcRenderer.send('login-reply', { success: true, message: 'Connexion réussie.' });
//         })
//         .catch((error) => {
//           console.error(error);
//           ipcRenderer.send('login-reply', { success: false, message: 'Erreur lors de la connexion.' });
//         });
//     })
//     .catch((error) => {
//       console.error(error);
//       ipcRenderer.send('login-reply');
//     });
//   });
  