import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="total-price"
export default class extends Controller {
  static targets = ["price"]
  connect() {

  }
calcul() {
  const date_in = new Date(document.querySelector("#reservation_check_in").value);
  const date_out = new Date(document.querySelector("#reservation_check_out").value);
  const differenceDate = ((date_out.getTime() - date_in.getTime())/86400000) + 1;
  const price = document.querySelector("#price").innerHTML;
  const calcul = differenceDate * price;

  if (calcul >= 0){
    this.priceTarget.innerHTML = `<p> Price total : ${calcul} € </p>`;
  }else{
    this.priceTarget.innerHTML = ` `
  }
}
}
