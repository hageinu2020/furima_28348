window.addEventListener('load', function(){

  const PriceButton = document.getElementById("item-price")
  const TaxButton = document.getElementById("add-tax-price")
  const ProfitButton = document.getElementById("profit")


  PriceButton.addEventListener('input', function() {
  
    var price = document.getElementById("item-price").value;
    var fee = price*0.1
    var profit = price-fee;
    
    document.getElementById("add-tax-price").innerHTML = fee
    document.getElementById("profit").innerHTML = profit
  })
});
