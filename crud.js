const { ipcRenderer } = require('electron');

// const productList = document.getElementById('product-list');
const addProductForm = document.getElementById('add-product-form');
const updateProductForm = document.getElementById('update-product-form');
const deleteProductForm = document.getElementById('delete-product-form');



const updateUserForm = document.getElementById('update-user-form');
const deleteUserForm = document.getElementById('delete-user-form');

const logoutButton = document.querySelector('#logout-button');

var ancre = "#page_produit";



// Afficher la liste des produits lors du chargement de la page
ipcRenderer.send('get-products');
ipcRenderer.on('product-list', (event, rows) => {
    for (let i = 0; i < rows.length; i++) {
        const row = "<tr><td>" + rows[i].id + "</td><td>" + rows[i].nom_prod + "</td><td>" + rows[i].prix + "</td><td>" + rows[i].stock + "</td><td>" + 
        " <button type='button' class='btn btn-primary' onclick='ModLigne(this)' data-bs-toggle='modal' data-bs-target='#updateModal' class='btn-del' style='border: none; background-color: white;' ><img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAN1JREFUSEvFlO0NwjAMBa8bwCQwAkzCKjACE8EIsAkbgJ6USKEkdj5a0T+V2vQufnY6sfI1rcxnRLABToDuV+CV22yvQNAbsA/QB3DMSXoEKfwZBDsgK2kVzOGHILgDklyAcxpVi6AUi3gxrm6BFYsE6oXiUkVfza6pwItFgixcLzxBDq4dlp7/TKolGIZbFSwCLwkWg5cEOjCa6bRx1ZnPm5DrwTss2oaR64aXKogCyYfgniCttjjn3u/eiih+2w2vOWjeBt333kl2Ad6Cmog8hjmZfxG07thcv3oPPg35Shmq75wnAAAAAElFTkSuQmCC' alt='Modifier'/></button> " +
        " <button type='button' class='btn btn-primary' onclick='SuppLigne(this)' data-bs-toggle='modal' data-bs-target='#delModal' class='btn-del' style='border: none; background-color: white;'> <img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAKlJREFUSEvtlcERQDAQRZ9KlIBOlEIFlKQUOqASJjM4hJ0fIje5ZTbZ9//uJJuReGWJ86MANdABpSFkBlpgsIQqgEuQC5cjUL0FrPtFS4iKyxKpBCp+ARwXYnt/OvatJwccyqV1z6J5/nXzvgb4CtX+5Ic6UAmjS/QDLu/qaUn+HsivKbpEivAYEDJofOh0N/msl+xGZQ8USvoeX4DmbnSqkRmY3z6WHLABUDk4GfuOp84AAAAASUVORK5CYII='/> </button> " + "</td></tr>";
        document.getElementById("myTable").innerHTML += row;
    }
});


// Afficher la liste des clients 
ipcRenderer.send('get-users');
ipcRenderer.on('user-list', (event, rowsUsers) => {
    for (let index = 0; index < rowsUsers.length; index++) {
        const rowUser = "<tr><td>" + rowsUsers[index].id + "</td><td>" + rowsUsers[index].identifiant_utilisateur + "</td><td>" + rowsUsers[index].nom_utilisateur + "</td><td>" + rowsUsers[index].prenom_utilisateur + "</td><td>" + rowsUsers[index].mail_utilisateur + "</td><td>" + rowsUsers[index].tel_utilisateur + "</td><td>" + rowsUsers[index].admin + "</td><td>" + 
        " <button type='button' class='btn btn-primary' onclick='modifierUser(this)' data-bs-toggle='modal' data-bs-target='#updateUser' class='btn-del' style='border: none; background-color: white;' ><img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAN1JREFUSEvFlO0NwjAMBa8bwCQwAkzCKjACE8EIsAkbgJ6USKEkdj5a0T+V2vQufnY6sfI1rcxnRLABToDuV+CV22yvQNAbsA/QB3DMSXoEKfwZBDsgK2kVzOGHILgDklyAcxpVi6AUi3gxrm6BFYsE6oXiUkVfza6pwItFgixcLzxBDq4dlp7/TKolGIZbFSwCLwkWg5cEOjCa6bRx1ZnPm5DrwTss2oaR64aXKogCyYfgniCttjjn3u/eiih+2w2vOWjeBt333kl2Ad6Cmog8hjmZfxG07thcv3oPPg35Shmq75wnAAAAAElFTkSuQmCC' alt='Modifier'/></button> " +
        " <button type='button' class='btn btn-primary' onclick='SuppLigne(this)' data-bs-toggle='modal' data-bs-target='#delUser' class='btn-del' style='border: none; background-color: white;'> <img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAKlJREFUSEvtlcERQDAQRZ9KlIBOlEIFlKQUOqASJjM4hJ0fIje5ZTbZ9//uJJuReGWJ86MANdABpSFkBlpgsIQqgEuQC5cjUL0FrPtFS4iKyxKpBCp+ARwXYnt/OvatJwccyqV1z6J5/nXzvgb4CtX+5Ic6UAmjS/QDLu/qaUn+HsivKbpEivAYEDJofOh0N/msl+xGZQ8USvoeX4DmbnSqkRmY3z6WHLABUDk4GfuOp84AAAAASUVORK5CYII='/> </button> " + "</td></tr>";
        document.getElementById("myUserTable").innerHTML += rowUser;
        // alert(rowUser)
    }
    
});

// Afficher la liste des clients 
ipcRenderer.send('count-users');
ipcRenderer.on('user-count', (event, usersCount) => {
    for (let it = 0; it < usersCount.length; it++) {
        const rowUserCount = "<span>" + usersCount[it].id + "</span>";
        document.getElementById("count_user_text").innerHTML = rowUserCount;
       
    }
    
});


function ModLigne(lig){
        
    boolMod =true;
    // Fait référence à l'element parent de l'élèment cliqué
    selectLig = lig.parentElement.parentElement;
    document.getElementById("idProduct").value = selectLig.cells[0].innerHTML;
    document.getElementById("nom_prod").value = selectLig.cells[1].innerHTML;
    document.getElementById("prix").value = selectLig.cells[2].innerHTML;
    document.getElementById("stock").value = selectLig.cells[3].innerHTML;    
}

function modifierUser(line){
        
    boolMod =true;
    // Fait référence à l'element parent de l'élèment cliqué
    selectLig = line.parentElement.parentElement;
    document.getElementById("idUser").value = selectLig.cells[0].innerHTML;
    document.getElementById("identifiant_utilisateur").value = selectLig.cells[1].innerHTML;
    document.getElementById("nom_utilisateur").value = selectLig.cells[2].innerHTML;
    document.getElementById("prenom_utilisateur").value = selectLig.cells[3].innerHTML; 
    document.getElementById("mail_utilisateur").value = selectLig.cells[4].innerHTML; 
    document.getElementById("tel_utilisateur").value = selectLig.cells[5].innerHTML; 
    document.getElementById("admin").value = selectLig.cells[6].innerHTML;    
}


function SuppLigne(r) {
    // Supprimer le contenu HTML d'un élément ici une lgne de la table
    var supp = r.parentNode.parentNode.rowIndex;
    document.getElementById("myTable").deleteRow(supp);
    
}

// Ajouter un nouveau produit
addProductForm.addEventListener('submit', (event) => {
    event.preventDefault();
    const nom_prod = addProductForm.elements.nom_prod.value;
    const prix = addProductForm.elements.prix.value;
    const stock = addProductForm.elements.stock.value;
    ipcRenderer.send('add-product', { nom_prod, prix, stock });
    addProductForm.reset();
});
ipcRenderer.on('product-added', () => {
    //window.location.hash = ancre;
    window.location.reload(true);
});

// Mettre à jour un produit existant
updateProductForm.addEventListener('submit', (event) => {
    event.preventDefault();
    const id = updateProductForm.elements.idProduct.value;
    const nom_prod = updateProductForm.elements.nom_prod.value;
    const prix = updateProductForm.elements.prix.value;
    const stock = updateProductForm.elements.stock.value;
    ipcRenderer.send('update-product', { id, nom_prod, prix, stock });
    updateProductForm.reset();
});
ipcRenderer.on('product-updated', () => {
    window.location.reload();
});


// Mettre à jour un utilisateur existant
updateUserForm.addEventListener('submit', (event) => {
    event.preventDefault();
    const id = updateUserForm.elements.idUser.value;
    const identifiant_utilisateur = updateUserForm.elements.identifiant_utilisateur.value;
    const nom_utilisateur = updateUserForm.elements.nom_utilisateur.value;
    const prenom_utilisateur = updateUserForm.elements.prenom_utilisateur.value;
    const mail_utilisateur = updateUserForm.elements.mail_utilisateur.value;
    const tel_utilisateur = updateUserForm.elements.tel_utilisateur.value;
    const admin = updateUserForm.elements.admin.value;
    ipcRenderer.send('update-user', { id, identifiant_utilisateur, nom_utilisateur, prenom_utilisateur, mail_utilisateur, tel_utilisateur, admin });
    updateUserForm.reset();
});
ipcRenderer.on('user-updated', () => {
    window.location.reload();
});


// Supprimer un produit existant
deleteProductForm.addEventListener('submit', (event) => {
    event.preventDefault();
    const id = deleteProductForm.elements.idProduct.value;
    ipcRenderer.send('delete-product', id);
    deleteProductForm.reset();
});
ipcRenderer.on('product-deleted', () => {
    window.location.reload(true);
});

logoutButton.addEventListener('click', () => {
  ipcRenderer.send('logout');
});