// import Rails from '@rails/ujs';
import Sortable from 'sortablejs'
import { Controller } from "stimulus"

// Connects to data-controller="sortable"
export default class extends Controller {
  static targets = [ "container", "card" ]

  connect() {
    console.log("Hello, Stimulus!", this.element)

    this.containerTargets.forEach((container) => { // targets all containers
      new Sortable(container, { // makes'em sortable
        group: 'products', // set all lists to same group (to change columns)
        animation: 300,
        filter: '.sortable-ignore', // any elements matching this CSS selector will not be draggable
        distance: 1, // distance in pixels to start the drag sequence
        onEnd: (event) => this.handleEnd(event) // fires after an item has been moved
      });
    });
  }

  handleEnd(event) {
    // get the id of the moved item
    let movedProductId = event.item.dataset.productId;

    // check which container the item was moved to
    if (event.to.classList.contains("products-offered")) {
      // the product was moved to the "Products Offered" container

      // select the corresponding checkbox for this product
      let checkbox = document.querySelector(`input[value="${movedProductId}"]`);
      checkbox.checked = true;
    } else {
      // the product was moved away from the "Products Offered" container

      // deselect the corresponding checkbox for this product
      let checkbox = document.querySelector(`input[value="${movedProductId}"]`);
      checkbox.checked = false;
    }
  }
}


