// import { Controller } from "@hotwired/stimulus"

// export default class extends Controller {
//   connect() {
//     console.log("colorize controller connected");
//     const senderId = this.data.get("sender-id");
//     this.element.style.backgroundColor = this.idToColor(senderId);
//   }

//   idToColor(id) {
//     let idString = id.toString();
//     let hash = 0;
//     for (let i = 0; i < idString.length; i++) {
//       hash = idString.charCodeAt(i) + ((hash << 5) - hash);
//     }
//     let color = (hash & 0x00FFFFFF).toString(16).toUpperCase();
//     return "#" + "00000".substring(0, 6 - color.length) + color;
//   }
// }
