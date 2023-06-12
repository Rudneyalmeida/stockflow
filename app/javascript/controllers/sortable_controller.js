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
          // onEnd: saveKanbanBinded,
          // onEnd: () => this.savePosition() // saves position after move
      });
    });
  }
}
