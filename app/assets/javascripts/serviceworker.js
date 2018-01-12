self.addEventListener("push", onPush);

self.addEventListener('push', function (e) {
  var title = (event.data && event.data.text()) || "Yay a message";
  var notification =  self.registration.showNotification(title, {
                        body: "We have received a push message",
                        icon: "/assets/images/flat-51-512.png",
                        tag: "push-simple-demo-notification-tag"
                      });
  e.waitUntil(notification);
});