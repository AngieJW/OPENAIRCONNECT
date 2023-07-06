import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import "flatpickr/dist/l10n/fr.js";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {   disableMobile: "true", dateFormat: 'd-m-Y',  minDate: "today",  locale: "fr"})
  }
}
