import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "myOffers", "offersReceived", "myCardDeck", "receivedCardDeck" ]

  connect() {
    this.init();
    window.addEventListener("DOMContentLoaded", this.init.bind(this));
  }

  init() {
    const url = window.location.href;
    const myOffersButton = this.myOffersTarget;
    const offersReceivedButton = this.offersReceivedTarget;

    if (url.includes("my_offers")) {
      myOffersButton.classList.add("active");
      this.myCardDeckTarget.classList.remove("d-none");
      this.receivedCardDeckTarget.classList.add("d-none");
    } else if (url.includes("offers_received")) {
      offersReceivedButton.classList.add("active");
      this.receivedCardDeckTarget.classList.remove("d-none");
      this.myCardDeckTarget.classList.add("d-none");
    }
  }

  updateCards(e) {
    if (e.currentTarget.innerHTML === "My Offers") {
      e.currentTarget.classList.add("active");
      this.myCardDeckTarget.classList.remove("d-none");
      this.receivedCardDeckTarget.classList.add("d-none");
    } else if (e.currentTarget.innerHTML === "Offers Received") {
      e.currentTarget.classList.add("active");
      this.receivedCardDeckTarget.classList.remove("d-none");
      this.myCardDeckTarget.classList.add("d-none");
    }
  }
}
