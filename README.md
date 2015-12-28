[![Build Status](https://travis-ci.org/pwenig/skidash.svg?branch=master)](https://travis-ci.org/pwenig/skidash)

![SkiDash Home Page](https://github.com/pwenig/skidash/blob/master/public/screen_shot.png)

SkiDash is a dashboard for Colorado ski conditions. It displays weather conditions, weather forecasts, terrain status, and live mountain images for popular ski areas as well as I-70 road conditions, travel alerts and speeds. In addition to the dashboard, SkiDash sends SMS alerts to beta users when highway speeds slow down or CDOT travel alerts are issued.

Staging:
http://skidash.herokuapp.com/


You will need API credentials to run this on your local machine. Once you have credentials:

* clone
* bundle install
* rake db:create
* rake db:migrate
* rake db:seed

Unit and Feature Tests:
* rspec spec




