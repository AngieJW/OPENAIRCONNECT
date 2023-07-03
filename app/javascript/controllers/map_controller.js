import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['input']
  connect() {
    console.log('map connected');

    navigator.geolocation.getCurrentPosition((data) => {
      console.log(data)
    });

    this.map = new google.maps.Map(
      document.getElementById("map_canvas"), {
        center: new google.maps.LatLng(43.2965, 5.3698),
        zoom: 13,
        mapTypeId: google.maps.MapTypeId.ROADMAP
      });
  }

  routesFinder() {
    const url = "https://www.strava.com/api/v3/athlete/routes?access_token=53b964a5cbefd9000950f5d1962721a2c6c40023"

    this.polyline = ""

    fetch(url)
    .then(response => response.json())
    .then(routeArray => {
      routeArray.forEach((route, index) => {
        const routeCard = document.createElement("div")
        routeCard
      })
      this.polyline = routeArray[0].map.summary_polyline
      this.initializeMap(this.polyline)
    })
  }

  find(event) {
    event.preventDefault();
    const url = "https://www.strava.com/api/v3/athlete/routes?access_token=53b964a5cbefd9000950f5d1962721a2c6c40023"

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

      var map = new google.maps.Map(
        document.getElementById("map_canvas"), {
          center: new google.maps.LatLng(37.4419, -122.1419),
          zoom: 13,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        });
      var polyline = new google.maps.Polyline({
        path: google.maps.geometry.encoding.decodePath(json.overview_polyline.points),
        map: map
      });
      var bounds = new google.maps.LatLngBounds();
      for (var i = 0; i < polyline.getPath().getLength(); i++) {
        bounds.extend(polyline.getPath().getAt(i));
      }
      map.fitBounds(bounds);
    }
  }
