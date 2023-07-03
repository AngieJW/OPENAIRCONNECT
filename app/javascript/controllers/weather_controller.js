import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {

  static targets = ['location']
  connect() {
    console.log("salut moi c'est le tezerferfmps")
    console.log(this.locationTarget.innerText)
    // this.weatherForCity();
  }

  weatherForCity() {
    const apikey = "54b2d2c1e7bfe35c78e56be6cff61802";
    const lieu = this.locationTarget.innerText;
    this.geocoder(lieu, (coords) => {
      fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${coords[0]}&lon=${coords[1]}&appid=${apikey}&units=metrichttps://openweathermap.org/img/w/{iconId}.png`)
      .then(response => response.json())
      .then(data => {
        console.log('weather en bas');
        console.log(data);
        })
    });
  }
  geocoder(lieu, cb) {
    let geocoder = new google.maps.Geocoder();
    console.log('lieux');
      console.log(lieu);
      const request = { address: lieu }
      return geocoder
        .geocode(request)
        .then((result) => {
          const { results } = result;
          console.log(results);
          console.log(results[0].geometry.location.lat());
          console.log(results[0].geometry.location.lng());

          const lat = results[0].geometry.location.lat();
          const lng = results[0].geometry.location.lng();
          return [lat, lng];
        })
        .then(cb)
        .catch((e) => {
          alert("Geocode was not successful for the following reason: " + e);
      });
  }
}
