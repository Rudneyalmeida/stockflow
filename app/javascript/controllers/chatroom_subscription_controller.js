import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static targets = ["messages"]
  static values = {
    chatroomId: Number
  }
  connect() {
    console.log(this.chatroomIdValue)
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: (data) => { this.#insertMessage(data) } }
    )
  }

  disconnect() {
    console.log("Disconnected form channel.")
    this.channel.unsubscribe()
  }

  resetForm(event) {
    const form = event.target
    form.reset()
  }

  #insertMessage(data) {
    this.messagesTarget.insertAdjacentHTML("beforeEnd", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
}
