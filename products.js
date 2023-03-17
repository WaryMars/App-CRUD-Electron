const { ipcRenderer } = require('electron');

const caca = document.getElementById('caca');
const productList = document.getElementById('product-list');
const addProductForm = document.getElementById('add-product-form');
const updateProductForm = document.getElementById('update-product-form');
const deleteProductForm = document.getElementById('delete-product-form');


// Afficher la liste des produits lors du chargement de la page
ipcRenderer.send('get-products');
ipcRenderer.on('product-list', (event, rows) => {
    for (var i = 0; i < rows.length; i++) {
        const row = "<tr><td>" + rows[i].id + "</td><td>" + rows[i].name + "</td><td>" + rows[i].price + "</td><td>" + rows[i].quantity + "</td><td>" + "<i class='fi fi-rr-trash'></i> " + " <i class='fi fi-rr-refresh'></i>" + "</td></tr>";
        document.getElementById("myTable").innerHTML += row;
    }
});


// Ajouter un nouveau produit
addProductForm.addEventListener('submit', (event) => {
    event.preventDefault();
    const name = addProductForm.elements.name.value;
    const price = addProductForm.elements.price.value;
    const quantity = addProductForm.elements.quantity.value;
    ipcRenderer.send('add-product', { name, price, quantity });
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
    const name = updateProductForm.elements.name.value;
    const price = updateProductForm.elements.price.value;
    const quantity = updateProductForm.elements.quantity.value;
    ipcRenderer.send('update-product', { id, name, price, quantity });
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