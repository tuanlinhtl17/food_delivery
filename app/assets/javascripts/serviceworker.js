self.addEventListener('push', function (e) {
  var title = (e.data && e.data.text()) || 'Yay a message';
  var notification =  self.registration.showNotification(title, {
                        body: 'We have received a push message',
                        icon: 'flat-51-512.png'
                      });
  e.waitUntil(notification);
});
