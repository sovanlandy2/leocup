// an assumption is made here that the targeted div will have a static identifier, like class="navbar"
// this initializes the navbar on screen load with an appropriate class

if ($("#is_mobile").length !== 0) {
	$(".navbar").removeClass("navbar-static-top");
  $(".navbar").addClass("navbar-fixed-top");
} else {
  $(".navbar").removeClass("navbar-fixed-top");
  $(".navbar").addClass("navbar-static-top");
}

// if you want these classes to toggle when a desktop user shrinks the browser width to an xs width - or from xs to larger
$(window).resize(function() {
  if (window.innerWidth <= screen_xs) {
    $(".navbar").removeClass("navbar-static-top");
  	$(".navbar").addClass("navbar-fixed-top");
  } else {
    $(".navbar").removeClass("navbar-fixed-top");
  	$(".navbar").addClass("navbar-static-top");
  }
});