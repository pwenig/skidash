def create_conditions

Condition.create( mountain_id: 1,
                  temperature: 32,
                  condition: "Clear",
                  wind: "From the North at 5 MPH",
                  forecast_today: "Mostly clear. Lows overnight in the upper single digits.",
                  high_temp: 32,
                  low_temp: 5,
                  snow_today: 1,
                  forecast_title_day2: "Friday",
                  forecast_day2: "Sunshine and clouds mixed. High near 35F. Winds SW at 5 to 10 mph.",
                  forecast_title_day3: "Saturday",
                  forecast_day3: "Variably cloudy with snow showers. High near 25F. Winds NW at 5 to 10 mph. Chance of snow 50%.")

Condition.create( mountain_id: 2,
                  temperature: 10,
                  condition: "Snow",
                  wind: "Calm",
                  forecast_today: "Mostly clear. Lows overnight in the upper single digits.",
                  high_temp: 10,
                  low_temp: 0,
                  snow_today: 0,
                  forecast_title_day2: "Friday",
                  forecast_day2: "Snow",
                  forecast_title_day3: "Saturday",
                  forecast_day3: "More snow")


end