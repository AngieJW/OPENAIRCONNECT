import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["message"];

  delete(event) {
    const messageId = event.target.dataset.messageId;

    // Perform an Ajax request to delete the message using the messageId
    fetch(`/event_chatroom_messages/${messageId}`, {
      method: "DELETE"
    })
      .then((response) => {
        if (response.ok) {
          // Handle the success response => remove the message from the DOM
          this.removeMessage(messageId);
        }
      })
      .catch((error) => {
        console.error(error);
      });
  }

  removeMessage(messageId) {
    const messageElement = this.element.querySelector(`#message-${messageId}`);
    messageElement.remove();
  }
}
