import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = {
    chatroomId: Number,
    userId: Number
  }
  static targets = ["messages"]

  connect() {
    console.log('hello');
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: res => {
        const data = JSON.parse(res)
        console.log(data)
        this.#insertMessageAndScrollDown(data.elementToAppend)
        console.log(data.authorId)
        console.log(this.userIdValue)
        if (Number(data.authorId) === Number(this.userIdValue)){
          this.messagesTarget.lastElementChild.classList.remove("other-message")
          this.messagesTarget.lastElementChild.classList.add("my-message")
        }
      }}
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }


  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event) {
    console.log('oui');
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }

}
