// // 販売価格の入力フィールドを取得
// const sellingPriceInput = document.getElementById('item-price');

// // 販売手数料を表示する要素を取得
// const addTaxPriceElement = document.getElementById('add-tax-price');

// // 販売利益を表示する要素を取得
// const profitElement = document.getElementById('profit');

// // 販売価格の入力値が変更された時の処理
// sellingPriceInput.addEventListener('input', function() {
//   // 販売価格を取得
//   const sellingPrice = parseInt(sellingPriceInput.value);

//   // 販売手数料を計算
//   const addTaxPrice = Math.floor(sellingPrice * 0.1);

//   // 販売利益を計算
//   const profit = sellingPrice - addTaxPrice;

//   // 販売手数料を表示
//   addTaxPriceElement.textContent = addTaxPrice.toLocaleString();

//   // 販売利益を表示
//   profitElement.textContent = profit.toLocaleString();
// });



document.addEventListener('DOMContentLoaded', function() {
   const itemPriceInput = document.getElementById('item-price');
   const addTaxPriceElement = document.getElementById('add-tax-price');
   const profitElement = document.getElementById('profit');
 
   itemPriceInput.addEventListener('input', function() {
     const itemPrice = parseInt(itemPriceInput.value);
     
     if (!isNaN(itemPrice)) {
       const tax = Math.floor(itemPrice * 0.1);
       const profit = itemPrice - tax;
       
       addTaxPriceElement.textContent = tax;
       profitElement.textContent = profit;
     } else {
       addTaxPriceElement.textContent = '';
       profitElement.textContent = '';
     }
   });
 });