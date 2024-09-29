const price = () => {
  const form = document.getElementById("item-price")
  form.addEventListener("keyup", () => {
    const commission = Math.round(form.value / 10)
    const addTaxPrice  = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = commission.toLocaleString();
    const profit  = document.getElementById("profit");
    profit.innerHTML = (form.value - commission).toLocaleString();
  });
 };
 
 window.addEventListener('turbo:load', price);
 window.addEventListener("turbo:render", price);