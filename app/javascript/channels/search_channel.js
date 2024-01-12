import consumer from "channels/consumer"

consumer.subscriptions.create("SearchChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    let searchList = document.querySelector("#search-list");
    let searchItems = Array.from(searchList.getElementsByTagName("li"));
    let item = searchItems.find(item => item.innerText.split(' - ')[0] === data.term);
    if (item) {
      item.innerText = `${data.term} - ${data.count}`;
    } else {
      item = document.createElement("li");
      item.innerText = `${data.term} - ${data.count}`;
      searchList.appendChild(item);
    }
    Array.from(searchList.getElementsByTagName("li"))
      .sort((a, b) => Number(b.innerText.split(' - ')[1]) - Number(a.innerText.split(' - ')[1]))
      .forEach(li => searchList.appendChild(li));
  }
});
