import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="event-route"
export default class extends Controller {
  static targets = ["location", "results", "hidden"]

  // connect() {
  //   console.log("hello toi");
  // }

  displayRoutes(event) {
    event.preventDefault();

    const res = this.resultsTarget
    this.hiddenTarget.classList.remove("d-none");

    this.resultsTarget.innerHTML = `Vos itinéraires pour ${this.locationTarget.value}`

    const url = "https://www.strava.com/api/v3/athlete/routes?access_token=56c04df1216fd05947d99a8992b0bb347e20f996"

    fetch(url)
      .then(response => response.json())
      .then(routeArray => {
        routeArray.slice(-5).forEach((route, index) => {
          let title = route["name"]
          let distance = route["distance"] / 10000
          let elevation = Math.trunc(route["elevation_gain"])
          let duration = route["estimated_moving_time"] / 60
          let hours = Math.floor(duration / 60);
          let minutes = Math.trunc(duration % 60);
          let routeUrl = route["map_urls"]["url"]
          console.log(route);
          console.log(route["id_str"]);
          let stravaId = new String(route["id_str"])
          let info = `
          <h2 class="title">${title}</h2>
          <ul class="d-flex">
            <li>Duration: ${hours}h ${minutes}m</li>
            <li>Distance: ${distance.toFixed(1)} km</li>
            <li>Elevation: ${elevation} m</li>
          </ul>
        `;
        let btnInput = `
        <div
          class="btn-create-hike btn btn-warning"
          data-action="click->choose-hike#pickHike"
          data-choose-hike-target="button"
          data-choose-hike-strava-id-param="id_is_${stravaId}"
        >
          Choisissez cette randonnée
        </div>
      `;

        this.resultsTargets.forEach((result, i) => {
          let randonnee = document.createElement('div');
          randonnee.setAttribute('data-choose-hike-target', 'randonnee');

          result.appendChild(randonnee);

          randonnee.insertAdjacentHTML('beforeend', `<img src='${routeUrl}'>`);
          randonnee.insertAdjacentHTML('beforeend', info);
          randonnee.insertAdjacentHTML('beforeend', btnInput);
        });
        })
      })
  }
}
