$(document).ready(function () {
  $('.js-push-button').on("click", function onClick() {
    $.post("/push");
  });
});