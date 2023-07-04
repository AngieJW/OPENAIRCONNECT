import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-input"
export default class extends Controller {
  static targets = ["inputs"]
  connect() {
    console.log("connected")
  }

  addField() {
    console.log("clicked")
    this.inputsTarget.insertAdjacentHTML("beforeend", `<div class="add-list-unit d-flex">
    <input type="text" name="item[][name]" id="item__name" value="" placeholder="Name">
    <input type="text" name="item[][quantity]" id="item__quantity" value="" placeholder="quantity">
    </div>`)
  }
}
