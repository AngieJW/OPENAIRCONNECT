import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['input']
  find() {
    let geocoder = new google.maps.Geocoder();
      console.log(this.inputTarget.value);
      const request = { address: this.inputTarget.value }
      geocoder
        .geocode(request)
        .then((result) => {
          const { results } = result;
          console.log(results);
          console.log(results[0].geometry.location.lat());
          console.log(results[0].geometry.location.lng());
          return results;
        })
        .catch((e) => {
          alert("Geocode was not successful for the following reason: " + e);
      });
    }
  }
