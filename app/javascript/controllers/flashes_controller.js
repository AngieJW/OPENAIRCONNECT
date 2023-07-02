import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flashes"
export default class extends Controller {
  static targets = ["alert"];
  connect() {
    setTimeout(() => {
      this.alertTarget.classList.add('alertdisappear');
      setTimeout(() => {
        this.alertTarget.classList.add('alertnone');
      }, 450);
    }, 3000);
  }
}
