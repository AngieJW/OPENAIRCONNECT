import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="choose-hike"
export default class extends Controller {
  static targets = ['chosenHike', "randonnee", "button" ]

  pickHike(event) {
    const str_id = event.params.stravaId.slice(6);

    this.chosenHikeTarget.value = str_id

    let selectedRandonnee = event.target.parentNode
    console.log(this.chosenHikeTarget.value);


    if (selectedRandonnee) {

      this.buttonTargets.forEach(button => {
        button.innerHTML = "Choisir cette randonnée";
      });

      this.randonneeTargets.forEach(randonnee => {
          randonnee.classList.remove('randonnee-selected');
          selectedRandonnee.classList.add('randonnee-selected');
          event.target.innerHTML = "Randonnée selectionnée"
      });
    }
  }
}
