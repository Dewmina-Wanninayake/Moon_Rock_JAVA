let inUSD = true;
const usdPrice = parseFloat(document.getElementById("priceValue").dataset.usd);
const discount = parseFloat(document.getElementById("priceValue").dataset.discount);
const exchangeRate = 300;

function toggleCurrency() {
   let finalPrice = usdPrice;

   if (discount > 0) {
      finalPrice = usdPrice - (usdPrice * (discount / 100));
   }

   if (inUSD) {
      const lkrPrice = (finalPrice * exchangeRate).toFixed(2);
      document.getElementById("priceValue").innerText = `LKR ${lkrPrice} per night`;
      document.getElementById("currencyToggleBtn").innerText = "Convert to USD";
      inUSD = false;
   } else {
      document.getElementById("priceValue").innerText = `$${finalPrice.toFixed(2)} per night`;
      document.getElementById("currencyToggleBtn").innerText = "Convert to LKR";
      inUSD = true;
   }
}
