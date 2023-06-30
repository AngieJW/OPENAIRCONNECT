import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["list_cards","card"];

  connect() {
    let cards = this.list_cardsTarget.querySelectorAll('li');
    cards.forEach((card, index) => {
      setTimeout(() => {
        card.classList.add('card_animation');
      }, (index + 1) * 500);
    });
  }
}
