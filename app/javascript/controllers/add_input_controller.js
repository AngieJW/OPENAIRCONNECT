import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-input"
export default class extends Controller {
  static targets = ["inputs"]
  connect() {
    console.log("connected")
  }

  addField() {
    console.log("clicked")
    this.inputsTarget.insertAdjacentHTML("beforeend",
    `<div class="add-list-unit d-flex">
        <div class="add-item-name">
          <input type="text" name="item[][name]" class="input__name" value="" placeholder=" item">
        </div>
        <div class="add-item-quantity">
          <input type="text" name="item[][quantity]" class="input__quantity" value="" placeholder=" quantité">
        </div>
    `)
  }
}
