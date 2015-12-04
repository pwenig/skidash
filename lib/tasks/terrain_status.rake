desc "Fetch terrain status from mountains"
task :fetch_terrain => :environment do
  require 'nokogiri'
  require 'open-uri'

  # Loveland
  love = Mountain.find(10)
  url = "http://www.onthesnow.com/colorado/loveland/skireport.html"
  doc_love = Nokogiri::HTML(open(url))
  runs_string_love = doc_love.at_css("li:nth-child(1) .open").text.gsub(/\s+/, "")
  runs_love = runs_string_love[0..1]
  lifts_string_love = doc_love.at_css("li:nth-child(2) .open").text.gsub(/\s+/, "")
  lifts_love = lifts_string_love[0]
  base_love_string = doc_love.at_css(".sd").text
  base_love = base_love_string[0..1]
  love.update_attributes(:runs_open => runs_love, :lifts_open => lifts_love, :base => base_love, :updated_at => Time.now)

  puts ""
  puts "Loveland"
  weather_condition(love.id)
  puts ""
  puts "Lifts Open: #{lifts_love}"
  puts "Runs Open: #{runs_love}"
  puts "Base: #{base_love}"


  # Eldora
  eld = Mountain.find(1)
  url = "http://www.onthesnow.com/colorado/eldora-mountain-resort/skireport.html"
  doc_eld = Nokogiri::HTML(open(url))
  runs_string_eld = doc_eld.at_css("li:nth-child(1) .open").text.gsub(/\s+/, "")
  runs_eld = runs_string_eld[0..1]
  lifts_string_eld = doc_eld.at_css("li:nth-child(2) .open").text.gsub(/\s+/, "")
  lifts_eld = lifts_string_eld[0]
  base_eld_string = doc_eld.at_css(".sd").text
  base_eld = base_eld_string[0..1]
  eld.update_attributes(:runs_open => runs_eld, :lifts_open => lifts_eld, :base => base_eld, :updated_at => Time.now)

  puts ""
  puts "Eldora"
  weather_condition(eld.id)
  puts ""
  puts "Lifts Open: #{lifts_eld}"
  puts "Runs Open: #{runs_eld}"
  puts "Base: #{base_eld}"



  # Steamboat
  steam = Mountain.find(2)
  url = "http://www.onthesnow.com/colorado/steamboat/skireport.html"
  doc_steam = Nokogiri::HTML(open(url))
  runs_string_steam = doc_steam.at_css("li:nth-child(1) .open").text.gsub(/\s+/, "")
  runs_steam = runs_string_steam[0..1]
  lifts_string_steam = doc_steam.at_css("li:nth-child(2) .open").text.gsub(/\s+/, "")
  lifts_steam = lifts_string_steam[0]
  base_steam_string = doc_steam.at_css(".sd").text
  base_steam = base_steam_string[0..1]
  steam.update_attributes(:runs_open => runs_steam, :lifts_open => lifts_steam, :base => base_steam, :updated_at => Time.now)

  puts ""
  puts "Steamboat"
  weather_condition(steam.id)
  puts ""
  puts "Lifts Open: #{lifts_steam}"
  puts "Runs Open: #{runs_steam}"
  puts "Base: #{base_steam}"


  # Vail
  vail = Mountain.find(4)
  url = "http://www.onthesnow.com/colorado/vail/skireport.html"
  doc_vail = Nokogiri::HTML(open(url))
  runs_string_vail = doc_vail.at_css("li:nth-child(1) .open").text.gsub(/\s+/, "")
  runs_vail = runs_string_vail[0..1]
  lifts_string_vail = doc_vail.at_css("li:nth-child(2) .open").text.gsub(/\s+/, "")
  lifts_vail = lifts_string_vail[0..1]
  base_vail_string = doc_vail.at_css(".sd").text
  base_vail = base_vail_string[0..1]
  vail.update_attributes(:runs_open => runs_vail, :lifts_open => lifts_vail, :base => base_vail, :updated_at => Time.now)

  puts ""
  puts "Vail"
  weather_condition(vail.id)
  puts ""
  puts "Lifts Open: #{lifts_vail}"
  puts "Runs Open: #{runs_vail}"
  puts "Base: #{base_vail}"


  # Winter Park
  wp = Mountain.find(6)
  url = "http://www.onthesnow.com/colorado/winter-park-resort/skireport.html"
  doc_wp = Nokogiri::HTML(open(url))
  runs_string_wp = doc_wp.at_css("li:nth-child(1) .open").text
  runs_wp = runs_string_wp[0..1]
  lifts_string_wp = doc_wp.at_css("li:nth-child(2) .open").text
  lifts_wp = lifts_string_wp[0..1]
  base_wp_string = doc_wp.at_css(".sd").text
  base_wp = base_wp_string[0..1]
  wp.update_attributes(:runs_open => runs_wp, :lifts_open => lifts_wp, :base => base_wp, :updated_at => Time.now)

  puts""
  puts "Winter Park"
  weather_condition(wp.id)
  puts ""
  puts "Lifts Open: #{lifts_wp}"
  puts "Runs Open: #{runs_wp}"
  puts "Base: #{base_wp}"


  # A-Basin
  aba = Mountain.find(8)
  url = "http://www.onthesnow.com/colorado/arapahoe-basin-ski-area/skireport.html"
  doc_aba = Nokogiri::HTML(open(url))
  terrain_string_aba = doc_aba.at_css("#resort_terrain").text.gsub(/\s+/, "")
  lifts_aba = terrain_string_aba[24]
  runs_aba = terrain_string_aba[8..9]
  base_aba_string = doc_aba.at_css(".sd").text
  base_aba = base_aba_string[0..1]
  aba.update_attributes(:runs_open => runs_aba, :lifts_open => lifts_aba, :base => base_aba, :updated_at => Time.now)

  puts ""
  puts "A-Basin"
  weather_condition(aba.id)
  puts ""
  puts "Lifts Open: #{lifts_aba}"
  puts "Runs Open: #{runs_aba}"
  puts "Base: #{base_aba}"


  # Breck
  breck = Mountain.find(3)
  url = "http://www.onthesnow.com/colorado/breckenridge/skireport.html"
  doc_breck = Nokogiri::HTML(open(url))
  runs_string_breck = doc_breck.at_css("li:nth-child(1) .open").text
  runs_breck = runs_string_breck.gsub(/\s+/, "")[0..1]
  lifts_string_breck = doc_breck.at_css("li:nth-child(2) .open").text
  lifts_breck = lifts_string_breck.gsub(/\s+/, "")[0..1]
  base_breck_string = doc_breck.at_css(".sd").text
  base_breck = base_breck_string[0..1]
  breck.update_attributes(:runs_open => runs_breck, :lifts_open => lifts_breck, :base => base_breck, :updated_at => Time.now)

  puts ""
  puts "Breckenridge"
  weather_condition(breck.id)
  puts ""
  puts "Lifts Open: #{lifts_breck}"
  puts "Runs Open: #{runs_breck}"
  puts "Base: #{base_breck}"

  # Copper
  copper = Mountain.find(5)
  url = "http://www.onthesnow.com/colorado/copper-mountain-resort/skireport.html"
  doc_copper = Nokogiri::HTML(open(url))
  lift_string_cop = doc_copper.at_css("li:nth-child(2) .open").text
  lifts_cop = lift_string_cop[0]
  run_string_cop = doc_copper.at_css("li:nth-child(1) .open").text
  runs_cop = run_string_cop[0..1]
  base_cop_string = doc_copper.at_css(".sd").text
  base_cop = base_cop_string[0..1]
  copper.update_attributes(:runs_open => runs_cop, :lifts_open => lifts_cop, :base => base_cop, :updated_at => Time.now)

  puts ""
  puts "Copper"
  weather_condition(copper.id)
  puts ""
  puts "Lifts Open: #{lifts_cop}"
  puts "Runs Open: #{runs_cop}"
  puts "Base: #{base_cop}"

#   Keystone
  keystone = Mountain.find(9)
  url = "http://www.onthesnow.com/colorado/keystone/skireport.html"
  doc_key = Nokogiri::HTML(open(url))
  lift_string_key = doc_key.at_css("li:nth-child(2) .open").text
  lifts_key = lift_string_key.gsub(/\s+/, "")[0..1]
  run_string_key = doc_key.at_css("li:nth-child(1) .open").text
  runs_key = run_string_key.gsub(/\s+/, "")[0..1]
  base_key_string = doc_key.at_css(".sd").text
  base_key = base_key_string[0..1]
  keystone.update_attributes(:runs_open => runs_key, :lifts_open => lifts_key, :base => base_key, :updated_at => Time.now)


  puts ""
  puts "Keystone"
  weather_condition(keystone.id)
  puts ""
  puts "Lifts Open: #{lifts_key}"
  puts "Runs Open: #{runs_key}"
  puts "Base: #{base_key}"


#   Telluride
  telluride = Mountain.find(11)
  url = "http://www.onthesnow.com/colorado/telluride/skireport.html"
  doc_tell = Nokogiri::HTML(open(url))
  lift_string_tell = doc_tell.at_css("li:nth-child(2) .open").text
  run_string_tell = doc_tell.at_css("li:nth-child(1) .open").text
  lifts_tell = lift_string_tell.gsub(/\s+/, "")[0]
  runs_tell = run_string_tell.gsub(/\s+/, "")[0..1]
  base_tell_string = doc_tell.at_css(".sd").text
  base_tell = base_tell_string[0..1]
  telluride.update_attributes(:runs_open => runs_tell, :lifts_open => lifts_tell, :base => base_tell, :updated_at => Time.now)


  puts ""
  puts "Telluride"
  weather_condition(telluride.id)
  puts ""
  puts "Lifts Open: #{lifts_tell}"
  puts "Runs Open: #{runs_tell}"
  puts "Base: #{base_tell}"

# CB
  crested_butte = Mountain.find(7)
  url = "http://www.onthesnow.com/colorado/crested-butte-mountain-resort/skireport.html"
  doc_cb = Nokogiri::HTML(open(url))
  lift_string_cb = doc_cb.at_css("li:nth-child(2) .open").text
  lifts_cb = lift_string_cb.gsub(/\s+/, "")[0]
  run_string_cb = doc_cb.at_css("li:nth-child(1) .open").text
  runs_cb = run_string_cb.gsub(/\s+/, "")[0..1]
  base_cb_string = doc_cb.at_css(".sd").text
  base_cb = base_cb_string[0..1]
  crested_butte.update_attributes(:runs_open => runs_cb, :lifts_open => lifts_cb, :base => base_cb, :updated_at => Time.now)


  puts ""
  puts "Crested Butte"
  weather_condition(crested_butte.id)
  puts ""
  puts "Lifts Open: #{lifts_cb}"
  puts "Runs Open: #{runs_cb}"
  puts "Base: #{base_cb}"


end

def weather_condition(id)
  mountain = Mountain.find(id)
  weather_condition = WeatherCondition.new(mountain.zip_code)
  temperature = weather_condition.condition_hash[:temperature]
  condition = weather_condition.condition_hash[:condition]
  icon = weather_condition.condition_hash[:icon]
  wind = weather_condition.condition_hash[:wind_string]
  forecast_today = weather_condition.forecast_hash[:forecast_today]
  high_temp = weather_condition.forecast_hash[:today_high]
  low_temp = weather_condition.forecast_hash[:today_low]
  snow_today = weather_condition.forecast_hash[:snow_today]
  forecast_title_day2 = weather_condition.forecast_hash[:forecast_title_day2]
  forecast_day2 = weather_condition.forecast_hash[:forecast_day2]
  forecast_title_day3 = weather_condition.forecast_hash[:forecast_title_day3]
  forecast_day3 = weather_condition.forecast_hash[:forecast_day3]

  Condition.create( mountain_id: mountain.id,
                    temperature: temperature,
                    condition: condition,
                    icon: icon,
                    wind: wind,
                    forecast_today: forecast_today,
                    high_temp: high_temp,
                    low_temp: low_temp,
                    snow_today: snow_today,
                    forecast_title_day2: forecast_title_day2,
                    forecast_day2: forecast_day2,
                    forecast_title_day3: forecast_title_day3,
                    forecast_day3: forecast_day3)




  puts "*" * 40
  puts "Temp: #{temperature}"
  puts "Condition: #{condition}"
  puts "Wind: #{wind}"
  puts "Forecast today: #{forecast_today}"
  puts "High Temp: #{high_temp}"
  puts "Low Temp: #{low_temp}"
  puts "Snow today: #{snow_today}"
  puts "#{forecast_title_day2}: #{forecast_day2}"
  puts "#{forecast_title_day3}: #{forecast_day3}"

end