function showWeather() {
  var show_weather = document.getElementById('weather_content');
  var weather_button = document.getElementById('weather_button');
  var hide_weather_button = document.getElementById('hide_weather_button');
  show_weather.style.display = 'block';
  weather_button.style.display = 'none';
  hide_weather_button.style.display = 'block';
}

function showLifts() {
  var show_lifts = document.getElementById('lift-status');
  var lift_button = document.getElementById('lift-button');
  show_lifts.style.display = 'block';
  lift_button.style.display='none';
}
