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

    const url = "https://www.strava.com/api/v3/athlete/routes?access_token=fae8f5a264dd1e038303e66f6d305c78581a61f9"

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
          const firstHalf = route["id_str"].substring(0, route["id_str"].length / 2)
          const secondHalf = route["id_str"].substring(route["id_str"].length / 2)
          console.log(route);
          console.log(route["id_str"]);
          // console.log(firstHalf);
          // console.log(secondHalf);
          let stravaId = new String(route["id_str"])
          let info = `<h2 class="title"> ${title}</h2> <ul><li>Durée : ${hours}h ${minutes}m </li><li> Distance : ${distance.toFixed(1)} km </li><li>Dénivelé :${elevation} m</li></ul> `;
          let btnInput = `<div class="btn-create-hike btn btn-warning" data-action="click->choose-hike#pickHike" data-choose-hike-strava-id-param="id_is_${stravaId}">Choisir cette randonnée</div>`
          console.log(btnInput);
          res.insertAdjacentHTML('beforeend', `<img src='${routeUrl}'>`)
          res.insertAdjacentHTML('beforeend', info)
          res.insertAdjacentHTML('beforeend', btnInput)
        })
      })
  }
}
