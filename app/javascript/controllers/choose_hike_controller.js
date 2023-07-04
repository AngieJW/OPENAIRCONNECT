import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="choose-hike"
export default class extends Controller {
  static targets = ['chosenHike']

  pickHike(event) {
    const str_id = event.params.stravaId.slice(6);

    this.chosenHikeTarget.value = str_id
  }
}
