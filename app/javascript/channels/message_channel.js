import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Conected at MessageChannel")
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    let messageContainer = document.querySelector("div.message-container");
    messageContainer.innerHTML += data;
    messageContainer.scrollIntoView(false);
  }
});
