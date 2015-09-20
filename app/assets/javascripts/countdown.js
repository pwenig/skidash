function countdown(date, mountain) {

var end1 = new Date(date);

var _second = 1000;
var _minute = _second * 60;
var _hour = _minute * 60;
var _day = _hour * 24;
var timer;

function showRemaining() {
  var now = new Date();
  var distance = end1 - now;
  if (distance < 0) {

    clearInterval(timer);
    document.getElementById(mountain).innerHTML = 'OPEN!';

    return;
  }
  var days = Math.floor(distance / _day);
  var hours = Math.floor((distance % _day) / _hour);
  var minutes = Math.floor((distance % _hour) / _minute);
  var seconds = Math.floor((distance % _minute) / _second);

  document.getElementById(mountain).innerHTML = days + ' Days ';
  document.getElementById(mountain).innerHTML += hours + ':';
  document.getElementById(mountain).innerHTML += minutes + ':';
  document.getElementById(mountain).innerHTML += seconds + '';
}

timer = setInterval(showRemaining, 1000);

}