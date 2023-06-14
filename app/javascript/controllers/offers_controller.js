import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "myOffers", "offersReceived", "myOffersTab", "offersReceivedTab" ]
  

  connect() {
  }


  showMyOffers(e) { 
    e.preventDefault();
    this.myOffersTabTarget.classList.add("active");
    this.offersReceivedTabTarget.classList.remove("active");
    this.myOffersTarget.classList.remove("d-none");
    this.offersReceivedTarget.classList.add("d-none");
  }

  showOffersReceived(e) { 
    e.preventDefault();
    this.myOffersTabTarget.classList.remove("active");
    this.offersReceivedTabTarget.classList.add("active");
    this.myOffersTarget.classList.add("d-none");
    this.offersReceivedTarget.classList.remove("d-none");

  }

}


