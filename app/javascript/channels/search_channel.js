import consumer from "channels/consumer"

consumer.subscriptions.create("SearchChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // Update the search analytics on the page with the new data
    let searchList = document.querySelector("#search-list");
    let newSearch = document.createElement("li");
    newSearch.innerText = data.term;
    searchList.appendChild(newSearch);
  }
});
