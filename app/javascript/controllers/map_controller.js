import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['input', 'strava']
  connect() {
    console.log('map connected');

    this.map = new google.maps.Map(
      document.getElementById("map_canvas"), {
        center: new google.maps.LatLng(43.2965, 5.3698),
        zoom: 13,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      });
  }

  routesFinder() {
    const url = "https://www.strava.com/api/v3/athlete/routes?access_token=58fa3f577e2904ecadac6e62e370ef4e92246cf0"

    this.polyline = ""

    fetch(url)
    .then(response => response.json())
    .then(routeArray => {
      routeArray.forEach((route, index) => {
        let title = route["name"]
        let distance = route["distance"] / 10000
        let elevation = Math.trunc(route["elevation_gain"])
        let duration = route["estimated_moving_time"] / 60
        let hours = Math.floor(duration / 60);
        let minutes = Math.trunc(duration % 60);
        let route_url = route["map_urls"]["url"]
        let info = `<h2 class="title"> ${title}</h2> <ul><li>Durée : ${hours}h ${minutes}m </li><li> Distance : ${distance.toFixed(1)} km </li><li>Dénivelé :${elevation} m</li></ul> `;
        let btnInput = `<button class="btn-create-hike">Créer une randonnée</button>`
        document.querySelector('#strava').insertAdjacentHTML('beforeend', `<img src='${route_url}'>`)
        document.querySelector('#strava').insertAdjacentHTML('beforeend', info)
        document.querySelector('#strava').insertAdjacentHTML('beforeend', btnInput)



        // AJOUTER EN INPUT FIELD POUR AJOUTER LA HIKE A L'EVENEMENT
        // ECOUTER LA VALUER DE L'INPUT (1 seul)*


        // const routeCard = createElement("div")
        // routeCard.innerHTML= `Pour la randonnée ${title}, la durée est de ${hours}h ${minutes}m, la distance est de ${distance.toFixed(1)} km et le dénivelé est de :${elevation} m`
        // let strava_results = document.getElementById("main");
        // strava_results.appendChild(routeCard);
      })
      this.polyline = routeArray[0].map.summary_polyline
      this.initializeMap(this.polyline)
    })
  }

  find(event) {
    event.preventDefault();
    const url = "https://www.strava.com/api/v3/athlete/routes?access_token=58fa3f577e2904ecadac6e62e370ef4e92246cf0"

    this.polyline = ""

    fetch(url)
    .then(response => response.json())
    .then(routeArray => {
      // routeArray.forEach((route) => {
      //   console.log(route.map.summary_polyline)
      // })
      this.polyline = routeArray[0].map.summary_polyline
      this.initializeMap(this.polyline)
    })

    // CODE DU GEOCODER

    // let geocoder = new google.maps.Geocoder();
    // console.log('lieuxx');
    //   console.log(this.inputTarget.value);
    //   const request = { address: this.inputTarget.value }
    //   geocoder
    //     .geocode(request)
    //     .then((result) => {
    //       const { results } = result;
    //       console.log(results);
    //       console.log(results[0].geometry.location.lat());
    //       console.log(results[0].geometry.location.lng());

    //       const lat = results[0].geometry.location.lat();
    //       const lng = results[0].geometry.location.lng();


    //     })
    //     .catch((e) => {
    //       alert("Geocode was not successful for the following reason: " + e);
    //   });
    }

    initializeMap(polyline) {
      const json = {
        "overview_polyline": {
          "points": polyline
        }
      };

      let map = new google.maps.Map(
        document.getElementById("map_canvas"), {
          center: new google.maps.LatLng(37.4419, -122.1419),
          zoom: 13,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        });
      let gmapsPolyline = new google.maps.Polyline({
        path: google.maps.geometry.encoding.decodePath(json.overview_polyline.points),
        map: map
      });
      let bounds = new google.maps.LatLngBounds();
      for (var i = 0; i < gmapsPolyline.getPath().getLength(); i++) {
        bounds.extend(gmapsPolyline.getPath().getAt(i));
      }
      map.fitBounds(bounds);
    }
  }
