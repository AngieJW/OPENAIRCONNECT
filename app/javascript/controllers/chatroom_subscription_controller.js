// app/javascript/controllers/chatroom_subscription_controller.js
import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]

  constructor(...args) {
    super(...args)
    this.channel = null
  }

  connect() {
    console.log(`Subscribing to Chatroom with the id ${this.chatroomIdValue}`)
    this.subscribe()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

  received(data) {
    this.insertMessage(data)
    this.insertMessageAndScrollDown(data)
    this.resetForm()
  }

  insertMessage(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
  }

  insertMessageAndScrollDown(data) {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm() {
    const form = this.element.querySelector("form")
    if (form) {
      form.reset()
    }
  }

  subscribe() {
    const consumer = createConsumer()
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        received: this.received.bind(this)
      }
    )
  }

  deleteMessage(event) {
    const messageElement = event.target.closest(".message")
    const messageId = messageElement.dataset.messageId

    fetch(`/events/${this.chatroomIdValue}/chatrooms/${this.chatroomIdValue}/messages/${messageId}`, {
      method: "DELETE"
    })
      .then(response => {
        if (response.ok) {
          messageElement.remove()
        } else {
          console.error("Failed to delete message")
        }
      })
      .catch(error => {
        console.error("Error occurred while deleting message:", error)
      })
  }
}
