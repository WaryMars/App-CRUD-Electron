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
        const row = "<tr><td>" + rows[i].id + "</td><td>" + rows[i].nom_prod + "</td><td>" + rows[i].prix + "</td><td>" + rows[i].stock + "</td><td>" + "<i class='fi fi-rr-trash'></i> " + " <i class='fi fi-rr-edit'></i> " + "</td></tr>";
        document.getElementById("myTable").innerHTML += row;
    }
});


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
    window.location.reload(true);
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