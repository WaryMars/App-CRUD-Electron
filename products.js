const { ipcRenderer } = require('electron');

const productList = document.getElementById('product-list');
const addProductForm = document.getElementById('add-product-form');
const updateProductForm = document.getElementById('update-product-form');
const deleteProductForm = document.getElementById('delete-product-form');

var ancre = "#page_produit";



// Afficher la liste des produits lors du chargement de la page
ipcRenderer.send('get-products');
ipcRenderer.on('product-list', (event, rows) => {
    for (var i = 0; i < rows.length; i++) {
        const row = "<tr><td>" + rows[i].id + "</td><td>" + rows[i].nom_prod + "</td><td>" + rows[i].prix + "</td><td>" + rows[i].stock + "</td><td>" + 
        " <button type='button' class='btn btn-primary' onclick='ModLigne(this)' data-bs-toggle='modal' data-bs-target='#updateModal' class='btn-del' style='border: none; background-color: white;' ><img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAN1JREFUSEvFlO0NwjAMBa8bwCQwAkzCKjACE8EIsAkbgJ6USKEkdj5a0T+V2vQufnY6sfI1rcxnRLABToDuV+CV22yvQNAbsA/QB3DMSXoEKfwZBDsgK2kVzOGHILgDklyAcxpVi6AUi3gxrm6BFYsE6oXiUkVfza6pwItFgixcLzxBDq4dlp7/TKolGIZbFSwCLwkWg5cEOjCa6bRx1ZnPm5DrwTss2oaR64aXKogCyYfgniCttjjn3u/eiih+2w2vOWjeBt333kl2Ad6Cmog8hjmZfxG07thcv3oPPg35Shmq75wnAAAAAElFTkSuQmCC' alt='Modifier'/></button> " +
        " <button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#delModal' class='btn-del' style='border: none; background-color: white;'> <img src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAKlJREFUSEvtlcERQDAQRZ9KlIBOlEIFlKQUOqASJjM4hJ0fIje5ZTbZ9//uJJuReGWJ86MANdABpSFkBlpgsIQqgEuQC5cjUL0FrPtFS4iKyxKpBCp+ARwXYnt/OvatJwccyqV1z6J5/nXzvgb4CtX+5Ic6UAmjS/QDLu/qaUn+HsivKbpEivAYEDJofOh0N/msl+xGZQ8USvoeX4DmbnSqkRmY3z6WHLABUDk4GfuOp84AAAAASUVORK5CYII='/> </button> " + "</td></tr>";
        document.getElementById("myTable").innerHTML += row;
    }
});

function ModLigne(lig){
        
    boolMod =true;
    // Fait référence à l'element parent de l'élèment cliqué
    selectLig = lig.parentElement.parentElement;
    document.getElementById("id").value = selectLig.cells[0].innerHTML;
    document.getElementById("nom_prod").value = selectLig.cells[1].innerHTML;
    document.getElementById("prix").value = selectLig.cells[2].innerHTML;
    document.getElementById("stock").value = selectLig.cells[3].innerHTML;    
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
    const id = updateProductForm.elements.id.value;
    const nom_prod = updateProductForm.elements.nom_prod.value;
    const prix = updateProductForm.elements.prix.value;
    const stock = updateProductForm.elements.stock.value;
    ipcRenderer.send('update-product', { id, nom_prod, prix, stock });
    updateProductForm.reset();
});
ipcRenderer.on('product-updated', () => {
    window.location.reload();
});

// Supprimer un produit existant
deleteProductForm.addEventListener('submit', (event) => {
    event.preventDefault();
    const id = deleteProductForm.elements.id.value;
    ipcRenderer.send('delete-product', id);
    deleteProductForm.reset();
});
ipcRenderer.on('product-deleted', () => {
    window.location.reload(true);
});