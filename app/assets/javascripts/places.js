//= require jquery
//= require libs/gmaps.min

var parallaxRatio = 0.4;
var $parallax;

$(function() {
  $parallax = $('.js-parallax');

  $('body').on('click', '.js-anchor', onClickAnchor);
  $(window).on('scroll', onScroll).trigger('scroll');

  initializeMap();
});

function onClickAnchor(e) {
  var $eventTarget,
      id,
      $target;

  e.preventDefault();

  $eventTarget = $(e.currentTarget);
  id = $eventTarget.attr('href');
  $target = $(id);

  $('html, body').animate({
    scrollTop: $target.offset().top
  }, 500);
}


function onScroll() {
  var scrollTop = $(window).scrollTop();

  if(scrollTop > 600) {
    return;
  }

  window.requestAnimationFrame(function() {

    var value = Math.floor(scrollTop * parallaxRatio);

    $parallax.css({
      transform: 'translate3d(0, ' + value + 'px, 0)'
    });
  });
}


function initializeMap() {
  if(!$('#js-map')[0]) {
    return;
  }

  var lat = $('#js-map')[0].attr('let'),
      lng = $('#js-map')[0].attr('lng');

  var gmaps = new GMaps({
    div: '#js-map',
    lat: lat,
    lng: lng,
    scrollwheel: false
  });

  gmaps.addMarker({
    lat: lat,
    lng: lng,
  });

  google.maps.event.addDomListener(window, "resize", function() {
    var center = gmaps.map.getCenter();
    google.maps.event.trigger(gmaps.map, "resize");
    gmaps.map.setCenter(center);
  });
}
