import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="items"
export default class extends Controller {
  static targets = ["listItems"];
  connect() {
    console.log('items connected')
  }

  addItem() {
    const listItems = this.listItemsTarget;
    console.log(listItems)
    const new_item = `<li class="item">
    <input type="text" name="item[][name]" id="item__name" value="" placeholder="Article" class="articles article_item">
    <input type="text" name="item[][quantity]" id="item__quantity" value="" placeholder="quantité" class="articles quantity_item">
  </li>`
    listItems.insertAdjacentHTML('beforeend', new_item);
  }
}
