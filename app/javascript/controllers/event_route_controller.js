import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="event-route"
export default class extends Controller {
  static targets = ["location", "results"]

  // connect() {
  //   console.log("hello toi");
  // }

  displayRoutes(event) {
    event.preventDefault();
    console.log(this.locationTarget.value);
    console.log("tu as cliqué sur suivant")
    console.log( this.resultsTarget);


    this.resultsTarget.classList.remove("d-none");
    this.resultsTarget.outerHTML = this.locationTarget.value
  }
}
