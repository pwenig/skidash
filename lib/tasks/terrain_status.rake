desc "Fetch terrain status from mountains"
task :fetch_terrain => :environment do
  require 'nokogiri'
  require 'open-uri'

  # Loveland
  love = Mountain.find(10)
  url = "http://www.onthesnow.com/colorado/loveland/skireport.html"
  doc_love = Nokogiri::HTML(open(url))
  runs_love = run_parser(doc_love)
  lifts_love = lift_parser(doc_love)
  base_love = base_parser(doc_love)
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
  runs_eld = run_parser(doc_eld)
  lifts_eld = lift_parser(doc_eld)
  base_eld = base_parser(doc_eld)
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
  runs_steam = run_parser(doc_steam)
  lifts_steam = lift_parser(doc_steam)
  base_steam = base_parser(doc_steam)
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
  runs_vail = run_parser(doc_vail)
  lifts_vail = lift_parser(doc_vail)
  base_vail = base_parser(doc_vail)
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
  runs_wp = run_parser(doc_wp)
  lifts_wp = lift_parser(doc_wp)
  base_wp = base_parser(doc_wp)
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
  runs_breck = run_parser(doc_breck)
  lifts_breck = lift_parser(doc_breck)
  base_breck = base_parser(doc_breck)
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
  lifts_cop = lift_parser(doc_copper)
  runs_cop = run_parser(doc_copper)
  base_cop = base_parser(doc_copper)
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
  lifts_key = lift_parser(doc_key)
  runs_key = run_parser(doc_key)
  base_key = base_parser(doc_key)
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
  lifts_tell = lift_parser(doc_tell)
  runs_tell = run_parser(doc_tell)
  base_tell = base_parser(doc_tell)
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
  lifts_cb = lift_parser(doc_cb)
  runs_cb = run_parser(doc_cb)
  base_cb = base_parser(doc_cb)
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

def run_parser(doc)
  runs_string = doc.at_css("li:nth-child(1) .open").text.gsub(/\s+/, "")
  if runs_string[0..2].to_i > 99
    runs_string[0..2]
  else
    runs_string[0..1]
  end
end

def lift_parser(doc)
  lifts_string = doc.at_css("li:nth-child(2) .open").text.gsub(/\s+/, "")
  if lifts_string[0..1].to_i > 9
    lifts_string[0..1]
  else
    lifts_string[0]
  end
end

def base_parser(doc)
  base_string = doc.at_css(".sd").text
  base_string[0..1]
end