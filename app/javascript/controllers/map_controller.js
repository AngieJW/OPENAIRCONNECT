import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['input']
  connect() {
    console.log('nonono');
    navigator.geolocation.getCurrentPosition((data) => {
      console.log(data)
    });
  }
  find(event) {
    event.preventDefault();
    let geocoder = new google.maps.Geocoder();
    console.log('lieuxx');
      console.log(this.inputTarget.value);
      const request = { address: this.inputTarget.value }
      geocoder
        .geocode(request)
        .then((result) => {
          const { results } = result;
          console.log(results);
          console.log(results[0].geometry.location.lat());
          console.log(results[0].geometry.location.lng());

          const lat = results[0].geometry.location.lat();
          const lng = results[0].geometry.location.lng();


        })
        .catch((e) => {
          alert("Geocode was not successful for the following reason: " + e);
      });
    }
  }
