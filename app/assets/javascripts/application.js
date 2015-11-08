// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

/* Note Codepen is importing the jQuery Background Video plugin - https://github.com/BGStock/jquery-background-video */

$('.jquery-background-video').bgVideo({fadeIn: 2000});

function showWeather() {
  var show_weather = document.getElementById('content');
  var button = document.getElementById('button');
  var radar = document.getElementById('radar');
  show_weather.style.display = 'block';
  button.style.display = 'none';
  radar.style.display = 'block';

}