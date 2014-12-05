
$(function() {
  // Activating Best In Place
  $(".best_in_place").best_in_place();

  // Bootstrap's popover
  $('[data-toggle="popover"]').popover();

  // remove alert after 3 sec
  setTimeout(function(){
    $('.alert').remove();
  }, 3000);
});



