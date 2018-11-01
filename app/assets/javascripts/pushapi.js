self.addEventListener("push", function(event) {
  fetch("/push_notifications/1.json").then(function(response) {
    if (200 !== response.status) throw Error();
    response.json().then(function(json) {
      if (json.error || !json.notification) throw Error();
      var data = json.notification;
      self.registration.showNotification(data.title, {
        body: data.body,
        tag: data.tag,
        icon: data.icon_url,
        data: data.trans_url,
      })
    })
  });
});

self.addEventListener("notificationclick", function(event) {
  var uri = event.notification.data;
  event.notification.close();
  event.waitUntil(clients.matchAll({
    type: "window"
  }).then(function(clientLists) {
    if (clients.openWindow) return clients.openWindow(uri);
  }))
});
