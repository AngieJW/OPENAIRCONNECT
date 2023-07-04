import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["hideable"];
  connect() {
  }

  toggleTargets() {
    this.hideableTargets.forEach((el) => {
      el.classList.toggle("d-none")
    });
  }
}
