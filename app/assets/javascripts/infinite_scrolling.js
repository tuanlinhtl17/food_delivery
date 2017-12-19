$(document).ready(function () {
  $(window).on('scroll', function() {
    more_foods_url = $('.pagination .next_page a').attr('href');
    if (more_foods_url && $(window).scrollTop() > $(document).height() - $(window).height() - 100) {
      $('.pagination').html('<img src="/assets/images/ajax-loader.gif" alt="Loading..." title="Loading..." />');
      $.getScript(more_foods_url);
    }
  });
});