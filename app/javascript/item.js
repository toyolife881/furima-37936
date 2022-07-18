function item() {
  
  const price = document.getElementById("item-price");
  price.addEventListener('input',() => {

    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.round(price.value * 0.1);
    const profit = document.getElementById("profit");

    profit.innerHTML = Math.round(price.value - Math.round(price.value * 0.1));
  
  });

};

window.addEventListener('load', item);