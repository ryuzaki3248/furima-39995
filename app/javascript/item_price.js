const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");

priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   const tax = Math.floor(inputValue * 0.1); // 入力された金額の10%を計算し、小数点以下を切り捨てる
   const profit = inputValue - tax; // 入力された金額から販売手数料を引いた金額を計算する

   addTaxDom.innerHTML = tax; // 計算した販売手数料をadd-tax-price要素に表示する
   profitDom.innerHTML = profit; // 計算した販売利益をprofit要素に表示する
});