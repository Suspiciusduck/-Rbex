import { Controller } from "@hotwired/stimulus"

// Définissez votre contrôleur Stimulus
export default class extends Controller {
  connect() {
    // Code de connexion du contrôleur
  }
}

// Code pour la carte flottante
document.addEventListener("DOMContentLoaded", function() {
  const closeButton = document.getElementById("close-card");
  const card = document.getElementById("floating-card");
  const isCardClosed = localStorage.getItem("cardClosed");

  if (isCardClosed) {
    card.style.display = "none";
  } else {
    card.style.display = "block";
  }

  closeButton.addEventListener("click", function() {
    card.style.display = "none";
    localStorage.setItem("cardClosed", "true");
  });
});
