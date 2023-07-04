import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="event-route"
export default class extends Controller {
  static targets = ["location", "results", "hidden"]

  // connect() {
  //   console.log("hello toi");
  // }

  displayRoutes(event) {
    event.preventDefault();
    console.log(this.locationTarget.value);
    console.log("tu as cliqué sur suivant")

    const res = this.resultsTarget
    this.hiddenTarget.classList.remove("d-none");
    this.resultsTarget.innerHTML = `Vos itinéraires pour ${this.locationTarget.value}`

    const url = "https://www.strava.com/api/v3/athlete/routes?access_token=53b964a5cbefd9000950f5d1962721a2c6c40023"


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
          let route_url = route["map_urls"]["url"]

          let info = `<h2 class="title"> ${title}</h2> <ul><li>Durée : ${hours}h ${minutes}m </li><li> Distance : ${distance.toFixed(1)} km </li><li>Dénivelé :${elevation} m</li></ul> `;
          let btnInput = `<button class="btn-create-hike btn btn-warning">Choisir cette randonnée</button>`
          console.log(res)
          res.insertAdjacentHTML('beforeend', `<img src='${route_url}'>`)
          res.insertAdjacentHTML('beforeend', info)
          res.insertAdjacentHTML('beforeend', btnInput)
        })
      })
  }
}
