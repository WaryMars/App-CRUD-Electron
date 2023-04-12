const logoutButton = document.querySelector('#logout-button');

logoutButton.addEventListener('click', () => {
  // Envoyer un message pour effectuer la déconnexion
  ipcRenderer.send('logout');

  // Rediriger l'utilisateur vers la page de connexion
  window.loadFile('connexion.html');
});