function showWeather() {
  var show_weather = document.getElementById('content');
  var mountain_button1 = document.getElementById('mountain-button1');
  var mountain_button2 = document.getElementById('mountain-button2');
  var mountain_button3 = document.getElementById('mountain-button3');
  var mountain_button4 = document.getElementById('mountain-button4');
  var button = document.getElementById('button');
  var radar = document.getElementById('radar');
  show_weather.style.display = 'block';
  mountain_button1.style.display = 'none';
  mountain_button2.style.display = 'none';
  mountain_button3.style.display = 'none';
  mountain_button4.style.display = 'none';
  button.style.display = 'none';
  radar.style.display = 'block';

}