import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["hideable"];
  connect() {
    console.log("funkar!")
  }

  // hide() {
  //   console.log(this.inputTarget);
  //   this.inputTarget.classList.toggle('d-none', !this.element.selected);
  // }

  toggleTargets() {
    this.hideableTargets.forEach((el) => {
      el.classList.toggle("d-none")
    });
  }
}
