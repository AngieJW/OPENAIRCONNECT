import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card-bookings"
export default class extends Controller {
  static targets = ["list_cards","card"];

  connect() {
    let cards = this.list_cardsTarget.querySelectorAll('li');
    cards.forEach((card, index) => {
      setTimeout(() => {
        card.classList.add('card_animation');
        card.classList.add('card_appear');
      }, (index + 1) * 100);
    });
  }
}
