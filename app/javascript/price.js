function price (){
  const articleText = document.getElementById("item-price");
  articleText.addEventListener("keyup",(e) =>{
    const price = articleText.value;
    const add_tax = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    add_tax.innerHTML = Math.ceil(price * 0.1)
    profit.innerHTML = Math.floor(price * 0.9)
  });
}


window.addEventListener('load', price);