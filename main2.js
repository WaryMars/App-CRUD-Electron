// const { app, BrowserWindow, ipcMain } = require('electron');
// const { connection } = require('./database2');

// let mainWindow;

// function createWindow() {
//   mainWindow = new BrowserWindow({
//     width: 800,
//     height: 600,
//     webPreferences: {
//       nodeIntegration: true,
//     },
//   });

//   mainWindow.loadFile('inscription.html');

//   mainWindow.on('closed', function () {
//     mainWindow = null;
//   });
// }

// app.on('ready', () => {
//   createWindow();
// });

// app.on('window-all-closed', function () {
//   if (process.platform !== 'darwin') {
//     app.quit();
//   }
// });

// app.on('activate', function () {
//   if (mainWindow === null) {
//     createWindow();
//   }
// });

// ipcMain.on('register', async (event, args) => {
//   // Code pour l'inscription (voir fichier inscription.js)
  
//   // Vérifier si l'utilisateur existe déjà dans la base de données
//   const [rows] = await connection.execute(
//     'SELECT * FROM users WHERE username = ?',
//     [username]
//   );

//   if (rows.length > 0) {
//     // L'utilisateur existe déjà, envoyer une réponse indiquant une erreur
//     event.reply('register-response', { success: false, message: 'User already exists' });
//     return;
//   }

//   // Hacher le mot de passe avant de l'enregistrer dans la base de données
//   const salt = await bcrypt.genSalt(10);
//   const hash = await bcrypt.hash(password, salt);

//   // Insérer le nouvel utilisateur dans la base de données
//   await connection.execute(
//     'INSERT INTO users (username, password) VALUES (?, ?)',
//     [username, hash]
//   );

//   // Envoyer une réponse indiquant que l'inscription a réussi
//   event.reply('register-response', { success: true, message: 'User registered successfully' });
// });

// ipcMain.on('login', (event, args) => {
//   // Code pour la connexion (voir fichier connexion.js)
// });


const { app, BrowserWindow, ipcMain } = require('electron');
const path = require('path');

let mainWindow;

function createWindow() {
  mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      nodeIntegration: true,
      contextIsolation: false,
    },
  });

  mainWindow.loadFile(path.join(__dirname, 'connexion.html'));

  mainWindow.on('closed', function () {
    mainWindow = null;
  });
}

app.on('ready', () => {
  createWindow();
});

ipcMain.on('inscription-success', () => {
  mainWindow.loadFile(path.join(__dirname, 'connexion.html'));
});

ipcMain.on('connexion-success', (event, username) => {
  mainWindow.webContents.send('connected', username);
});

ipcMain.on('connexion-failure', () => {
  console.log('Mauvais nom d\'utilisateur ou mot de passe.');
});





// const { app, BrowserWindow } = require('electron');
// const path = require('path');
// const url = require('url');
// const { connection } = require('./database2');

// // Création de la fenêtre principale
// let mainWindow;

// function createWindow() {
//   mainWindow = new BrowserWindow({
//     width: 800,
//     height: 600,
//     webPreferences: {
//       nodeIntegration: true,
//       contextIsolation: false,
//       enableRemoteModule: true
//     }
//   });

//   // Chargement de la page HTML de connexion
//   mainWindow.loadFile('inscription.html');

//   // Ouverture des outils de développement
//   mainWindow.webContents.openDevTools();

//   // Fermeture de la fenêtre principale
//   mainWindow.on('closed', function () {
//     mainWindow = null;
//   });
// }

// // Lancement de l'application Electron
// app.on('ready', createWindow);

// // Fermeture de l'application Electron lorsque toutes les fenêtres sont fermées
// app.on('window-all-closed', function () {
//   if (process.platform !== 'darwin') app.quit();
// });

// // Réouverture de l'application Electron sur macOS
// app.on('activate', function () {
//   if (mainWindow === null) createWindow();
// });

// // Connexion à la base de données MySQL
// connection.connect(function (err) {
//   if (err) {
//     console.error('Erreur de connexion à la base de données : ' + err.stack);
//     return;
//   }

//   console.log('Connecté à la base de données MySQL.');
// });
