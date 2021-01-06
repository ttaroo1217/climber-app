import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p class="message-date">${data.content.created_at}</p>` + `<p class="message-user">${data.user_name}</p>` + `<p class="message-content">${data.content.content}</p>` + `<br>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_text');
    messages.insertAdjacentHTML('beforeend', html);
    newMessage.value='';
  }
});