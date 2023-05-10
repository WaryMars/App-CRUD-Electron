const { app, BrowserWindow, ipcMain } = require('electron');
const { connection } = require('./database');
const path = require('path');

let mainWindow;

function createWindow() {
  mainWindow = new BrowserWindow({
    title: "Gestion Wall-it",
    width: 800,
    height: 600,
    webPreferences: {
      nodeIntegration: true,
      contextIsolation: false,
    },
  });

  //mainWindow.webContents.openDevTools();
  mainWindow.loadFile(path.join(__dirname, 'connexion.html'));


  mainWindow.on('closed', function () {
    mainWindow = null;
  });
}

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

app.on('ready', () => {
  createWindow();
});

ipcMain.on('inscription-success', () => {
  mainWindow.loadFile(path.join(__dirname, 'connexion.html'));
});

ipcMain.on('connexion-success', (event, username) => {
  mainWindow.webContents.send('connected', username);
  mainWindow.loadFile(path.join(__dirname, 'dashboard.html'));

});

ipcMain.on('connexion-failure', () => {
  mainWindow.alert('Mauvais nom d\'utilisateur ou mot de passe.');
});

/* Partie produit */

// Récupérez tous les produits
ipcMain.on('get-products', async (event, arg) => {
  const [rows] = await connection.execute('SELECT * FROM produit');
  event.reply('product-list', rows);
});

// Récupérez tous les client
ipcMain.on('get-users', async (event, arg) => {
  const [rowsUsers] = await connection.execute('SELECT * FROM utilisateur');
  event.reply('user-list', rowsUsers);
});

ipcMain.on('count-users', async (event, arg) => {
  const [usersCount] = await connection.execute('SELECT COUNT(*) FROM utilisateur');
  event.reply('user-count', usersCount);
});

// Ajoutez un nouveau produit
ipcMain.on('add-product', async (event, product) => {
  const { nom_prod, prix, stock } = product;
  await connection.execute('INSERT INTO produit (nom_prod, prix, stock) VALUES (?, ?, ?)', [nom_prod, prix, stock]);
  event.reply('product-added');
});

// Mettez à jour un produit existant
ipcMain.on('update-product', async (event, product) => {
  const { id, nom_prod, prix, stock } = product;
  await connection.execute('UPDATE produit SET nom_prod=?, prix=?, stock=? WHERE id=?', [nom_prod, prix, stock, id]);
  event.reply('product-updated');
});

ipcMain.on('update-user', async (event, user) => {
  const { id, identifiant_utilisateur, nom_utilisateur, prenom_utilisateur, mail_utilisateur, tel_utilisateur, admin } = user;
  await connection.execute('UPDATE utilisateur SET identifiant_utilisateur=?, nom_utilisateur=?, prenom_utilisateur=?, mail_utilisateur=?, tel_utilisateur=?, admin=?  WHERE id=?', [identifiant_utilisateur, nom_utilisateur, prenom_utilisateur, mail_utilisateur, tel_utilisateur, admin, id]);
  event.reply('user-updated');
});

// Supprimez un produit existant
ipcMain.on('delete-product', async (event, id) => {

  await connection.execute('DELETE FROM produit WHERE id=?', [id]);
  event.reply('product-deleted');
});

ipcMain.on('logout', () => {
  mainWindow.loadFile(path.join(__dirname, 'connexion.html'));
});





