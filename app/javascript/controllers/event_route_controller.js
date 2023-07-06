import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="event-route"
export default class extends Controller {
  static targets = ["location", "results", "hidden"]
  static values = { stravaApiKey: String}

  // connect(){
  //   console.log(this.values);
  // }

  displayRoutes(event) {
    event.preventDefault();

    const res = this.resultsTarget
    this.hiddenTarget.classList.remove("d-none");

    this.resultsTarget.innerHTML = `<h2 class="home-headings">Vos itinéraires pour ${this.locationTarget.value}</h2>`
    console.log(this.stravaApiKeyValue);
    const url = `https://www.strava.com/api/v3/athlete/routes?access_token=${this.stravaApiKeyValue}`


    fetch(url)
      .then(response => response.json())
      .then(routeArray => {
        const routesFiltered = routeArray.filter(route => route["name"].split(':', 2)[0].trim() == this.locationTarget.value.trim());
        routesFiltered.forEach((route, index) => {
          let title = route["name"].split(':', 2)[1]
          let distance = route["distance"] / 10000
          let elevation = Math.trunc(route["elevation_gain"])
          let duration = route["estimated_moving_time"] / 60
          let hours = Math.floor(duration / 60);
          let minutes = Math.trunc(duration % 60);
          let routeUrl = route["map_urls"]["url"]
          let stravaId = new String(route["id_str"])
          let info = `
          <h2 class="title">${title}</h2>
          <ul class="list-group list-unstyled">
            <li class="list-group-item"><i class="fa-regular fa-clock"></i> Durée : ${hours}h ${minutes}m</li>
            <li class="list-group-item"><i class="fa-solid fa-person-hiking"></i> Distance : ${distance.toFixed(1)} km</li>
            <li class="list-group-item"><i class="fa-solid fa-arrow-up-right-dots"></i> Dénivelé : ${elevation} m</li>
          </ul>
        `;
        let btnInput = `
        <div
          class="btn-create-hike btn btn-success"
          data-action="click->choose-hike#pickHike"
          data-choose-hike-target="button"
          data-choose-hike-strava-id-param="id_is_${stravaId}"
        >
          Choisir cette randonnée
        </div>
      `;

        this.resultsTargets.forEach((result, i) => {
          let randonnee = document.createElement('div');
          randonnee.setAttribute('data-choose-hike-target', 'randonnee');
          randonnee.setAttribute('class', 'randonnee');

          result.appendChild(randonnee);

          randonnee.insertAdjacentHTML('beforeend', `<img class="img-fluid" src='${routeUrl}'>`);
          randonnee.insertAdjacentHTML('beforeend', info);
          randonnee.insertAdjacentHTML('beforeend', btnInput);
        });
        })
      })
  }
}
