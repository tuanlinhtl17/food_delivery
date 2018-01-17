self.addEventListener('push', function (e) {
  var title = 'Food Delivery';
  var notification = self.registration.showNotification(title, {
    body: 'New order',
    icon: 'food-delivery-logo_1447-29.jpg'
  });
  e.waitUntil(notification);
});