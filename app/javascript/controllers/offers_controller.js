import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "myOffers", "offersReceived", "myCardDeck", "receivedCardDeck" ]

  connect() {
    this.init();
    window.addEventListener("DOMContentLoaded", this.init.bind(this));
  }

  init() {
    const myOffersButton = this.myOffersTarget;
    myOffersButton.classList.add("active");
  }

  updateCards(e) {
    e.preventDefault(); // Prevent the default action
  
    const myOffersButton = this.myOffersTarget;
    const offersReceivedButton = this.offersReceivedTarget;
  
    // Remove active class from both buttons
    myOffersButton.classList.remove("active");
    offersReceivedButton.classList.remove("active");
  
    // Add d-none class to both cardDecks
    this.myCardDeckTarget.classList.add("d-none");
    this.receivedCardDeckTarget.classList.add("d-none");
  
    if (e.currentTarget.id === "myOffersLink") {
      myOffersButton.classList.add("active"); // Add active class to clicked button
      this.myCardDeckTarget.classList.remove("d-none"); // Remove d-none from corresponding cardDeck
    } else if (e.currentTarget.id === "offersReceivedLink") {
      offersReceivedButton.classList.add("active"); // Add active class to clicked button
      this.receivedCardDeckTarget.classList.remove("d-none"); // Remove d-none from corresponding cardDeck
    }
  }

}
