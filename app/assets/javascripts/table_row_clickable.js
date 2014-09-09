$(function() {
  $('.table-row-clickable tr').on('click', function(e) {
    var $target = $(e.target);
    if (!$target.is('a')) {
      var url = $target.closest('tr').data('href');
      if(url) {
        window.location = url;
      }
    }
  });
});