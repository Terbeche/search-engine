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
    let searchItems = Array.from(searchList.getElementsByTagName("tr"));
    let item = searchItems.find(item => item.cells[0].innerText === data.term);
    if (item) {
      item.cells[1].innerText = data.count;
    } else {
      item = document.createElement("tr");
      let termCell = document.createElement("td");
      termCell.innerText = data.term;
      item.appendChild(termCell);
      let countCell = document.createElement("td");
      countCell.innerText = data.count;
      item.appendChild(countCell);
      searchList.appendChild(item);
    }
    Array.from(searchList.getElementsByTagName("tr"))
      .sort((a, b) => Number(b.cells[1].innerText) - Number(a.cells[1].innerText))
      .forEach(tr => searchList.appendChild(tr));
  }  
});
