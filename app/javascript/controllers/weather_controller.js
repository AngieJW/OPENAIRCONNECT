import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {

  static targets = ['location', 'icon', 'date_event']
  connect() {
    console.log('weather connected')
    this.weatherForCity();
  }

  weatherForCity() {
    const apikey = "c154ab44639a41e04a296f6e09151146";
    const lieu = this.locationTarget.innerText;
    const iconParent = this.iconTarget;
    const dateEvent = this.date_eventTarget.innerText.split('/');
    const dateEventDate = new Date(Number(dateEvent[2]), Number(dateEvent[1]) - 1, Number(dateEvent[0]));
    const daydiff = Math.floor((dateEventDate - Date.now()) / (60000 * 60 * 24 ));
    this.geocoder(lieu, (coords) => {
      fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${coords[0]}&lon=${coords[1]}&appid=${apikey}&units=metric&cnt=${daydiff}`)
      .then(response => response.json())
      .then(data => {
        if (data.weather[0].icon == '01d') {
          iconParent.innerHTML = `<img src="/assets/sun.png" style="width: 30px; height: 30px;">`
        }
        else {
          iconParent.innerHTML = `<img src="https://openweathermap.org/img/w/${data.weather[0].icon}.png">`
        }
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
