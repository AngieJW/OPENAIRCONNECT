import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cards"
export default class extends Controller {
  static targets = ["list_cards","card"];

  connect() {
    let cards = this.list_cardsTarget.querySelectorAll('li');
    cards.forEach((card, index) => {
      setTimeout(() => {
        card.classList.add('card_animation'); // Remplacez 'ma-classe' par le nom de la classe que vous souhaitez ajouter
      }, (index + 1) * 500);
    });
  }
}
