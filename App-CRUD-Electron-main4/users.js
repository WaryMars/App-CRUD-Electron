const { ipcRenderer } = require('electron');

const usersList = document.getElementById('user-list');
const updateUserForm = document.getElementById('update-user-form');
const deleteUserForm = document.getElementById('delete-user-form');

// Afficher la liste des produits lors du chargement de la page

/**id, id_adresse, id_commande, identifiant_utilisateur, nom_utilisateur, prenom_utilisateur, mail_utilisateur, tel_utilisateur, mdp_utilisateur */
ipcRenderer.send('get-users');
ipcRenderer.on('user-list', (event, rows) => {
    for (var i = 0; i < rows.length; i++) {
        const row = "<tr><td>" + rows[i].id + "</td><td>" + rows[i].nom_utilisateur + "</td><td>" + rows[i].prenom_utilisateur + "</td><td>" + rows[i].mail_utilisateur + "</td><td>" + 
        " <button type='button' class='btn btn-primary' onclick='ModLigne(this)' data-bs-toggle='modal' data-bs-target='#updateModal' class='btn-del' style='border: none; background-color: white;' ><img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAN1JREFUSEvFlO0NwjAMBa8bwCQwAkzCKjACE8EIsAkbgJ6USKEkdj5a0T+V2vQufnY6sfI1rcxnRLABToDuV+CV22yvQNAbsA/QB3DMSXoEKfwZBDsgK2kVzOGHILgDklyAcxpVi6AUi3gxrm6BFYsE6oXiUkVfza6pwItFgixcLzxBDq4dlp7/TKolGIZbFSwCLwkWg5cEOjCa6bRx1ZnPm5DrwTss2oaR64aXKogCyYfgniCttjjn3u/eiih+2w2vOWjeBt333kl2Ad6Cmog8hjmZfxG07thcv3oPPg35Shmq75wnAAAAAElFTkSuQmCC' alt='Modifier'/></button> " +
        " <button type='button' class='btn btn-primary' onclick='SuppLigne(this)' data-bs-toggle='modal' data-bs-target='#delModal' class='btn-del' style='border: none; background-color: white;'> <img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAKlJREFUSEvtlcERQDAQRZ9KlIBOlEIFlKQUOqASJjM4hJ0fIje5ZTbZ9//uJJuReGWJ86MANdABpSFkBlpgsIQqgEuQC5cjUL0FrPtFS4iKyxKpBCp+ARwXYnt/OvatJwccyqV1z6J5/nXzvgb4CtX+5Ic6UAmjS/QDLu/qaUn+HsivKbpEivAYEDJofOh0N/msl+xGZQ8USvoeX4DmbnSqkRmY3z6WHLABUDk4GfuOp84AAAAASUVORK5CYII='/> </button> " + "</td></tr>";
        document.getElementById("myTable").innerHTML += row;
    }
});

function ModLigne(lig){
        
    boolMod =true;
    // Fait référence à l'element parent de l'élèment cliqué
    selectLig = lig.parentElement.parentElement;
    document.getElementById("id").value = selectLig.cells[0].innerHTML;
    document.getElementById("nom_utilisateur").value = selectLig.cells[1].innerHTML;
    document.getElementById("prenom_utilisateur").value = selectLig.cells[2].innerHTML;
    document.getElementById("mail_utilisateur").value = selectLig.cells[3].innerHTML;    
}


function SuppLigne(r) {
    // Supprimer le contenu HTML d'un élément ici une lgne de la table
    var i = r.parentNode.parentNode.rowIndex;
    document.getElementById("myUserTable").deleteRow(i);
    
}


// Mettre à jour un produit existant
updateUserForm.addEventListener('submit', (event) => {
    event.preventDefault();
    const id = updateusertForm.elements.id.value;
    const nom_utilisateur = updateUserForm.elements.nom_utilisateur.value;
    const prenom_utilisateur = updateUserForm.elements.prenom_utilisateur.value;
    const mail_utilisateur = updateUserForm.elements.mail_utilisateur.value;
    ipcRenderer.send('update-user', { id, nom_utilisateur, prenom_utilisateur, mail_utilisateur });
    updateUserForm.reset();
});
ipcRenderer.on('user-updated', () => {
    window.location.reload();
});

// Supprimer un produit existant
deleteUserForm.addEventListener('submit', (event) => {
    event.preventDefault();
    const id = deleteUserForm.elements.id.value;
    ipcRenderer.send('delete-user', id);
    deleteUserForm.reset();
});
ipcRenderer.on('user-deleted', () => {
    window.location.reload(true);
});