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
  love.update_attributes(:runs_open => runs_love, :lifts_open => lifts_love, :updated_at => Time.now)

  puts ""
  puts "Loveland"
  puts "Lifts Open: #{lifts_love}"
  puts "Runs Open: #{runs_love}"



  # Eldora
  eld = Mountain.find(1)
  url = "http://www.onthesnow.com/colorado/eldora-mountain-resort/skireport.html"
  doc_eld = Nokogiri::HTML(open(url))
  runs_string_eld = doc_eld.at_css("li:nth-child(1) .open").text.gsub(/\s+/, "")
  runs_eld = runs_string_eld[0..1]
  lifts_string_eld = doc_eld.at_css("li:nth-child(2) .open").text.gsub(/\s+/, "")
  lifts_eld = lifts_string_eld[0]
  eld.update_attributes(:runs_open => runs_eld, :lifts_open => lifts_eld, :updated_at => Time.now)

  puts ""
  puts "Eldora"
  puts "Lifts Open: #{lifts_eld}"
  puts "Runs Open: #{runs_eld}"



  # Steamboat
  steam = Mountain.find(2)
  url = "http://www.onthesnow.com/colorado/steamboat/skireport.html"
  doc_steam = Nokogiri::HTML(open(url))
  runs_string_steam = doc_steam.at_css("li:nth-child(1) .open").text.gsub(/\s+/, "")
  runs_steam = runs_string_steam[0..1]
  lifts_string_steam = doc_steam.at_css("li:nth-child(2) .open").text.gsub(/\s+/, "")
  lifts_steam = lifts_string_steam[0]
  steam.update_attributes(:runs_open => runs_steam, :lifts_open => lifts_steam, :updated_at => Time.now)

  puts ""
  puts "Steamboat"
  puts "Lifts Open: #{lifts_steam}"
  puts "Runs Open: #{runs_steam}"


  # Vail
  vail = Mountain.find(4)
  url = "http://www.onthesnow.com/colorado/vail/skireport.html"
  doc_vail = Nokogiri::HTML(open(url))
  runs_string_vail = doc_vail.at_css("li:nth-child(1) .open").text.gsub(/\s+/, "")
  runs_vail = runs_string_vail[0..1]
  lifts_string_vail = doc_vail.at_css("li:nth-child(2) .open").text.gsub(/\s+/, "")
  lifts_vail = lifts_string_vail[0..1]
  vail.update_attributes(:runs_open => runs_vail, :lifts_open => lifts_vail, :updated_at => Time.now)

  puts ""
  puts "Vail"
  puts "Lifts Open: #{lifts_vail}"
  puts "Runs Open: #{runs_vail}"


  # Winter Park
  wp = Mountain.find(6)
  url = "http://www.onthesnow.com/colorado/winter-park-resort/skireport.html"
  doc_wp = Nokogiri::HTML(open(url))
  runs_string_wp = doc_wp.at_css("li:nth-child(1) .open").text
  runs_wp = runs_string_wp[0..1]
  lifts_string_wp = doc_wp.at_css("li:nth-child(2) .open").text
  lifts_wp = lifts_string_wp[0..1]
  wp.update_attributes(:runs_open => runs_wp, :lifts_open => lifts_wp, :updated_at => Time.now)

  puts""
  puts "Winter Park"
  puts "Lifts Open: #{lifts_wp}"
  puts "Runs Open: #{runs_wp}"


  # A-Basin
  aba = Mountain.find(8)
  url = "http://www.onthesnow.com/colorado/arapahoe-basin-ski-area/skireport.html"
  doc_aba = Nokogiri::HTML(open(url))
  terrain_string_aba = doc_aba.at_css("#resort_terrain").text.gsub(/\s+/, "")
  lifts_aba = terrain_string_aba[24]
  runs_aba = terrain_string_aba[8..9]
  aba.update_attributes(:runs_open => runs_aba, :lifts_open => lifts_aba, :updated_at => Time.now)

  puts ""
  puts "A-Basin"
  puts "Lifts Open: #{lifts_aba}"
  puts "Runs Open: #{runs_aba}"


  # Breck
  breck = Mountain.find(3)
  url = "http://www.breckenridge.com/mountain/terrain-status.aspx#/Lifts"
  doc_breck = Nokogiri::HTML(open(url))
  lift_string_breck = doc_breck.at_css(".firstItem").text
  lifts_breck = lift_string_breck.gsub(/\s+/, "")[12]
  run_string_breck = doc_breck.at_css(".firstItem+li").text
  runs_breck = run_string_breck.gsub(/\s+/, "")[8..9]
  breck.update_attributes(:runs_open => runs_breck, :lifts_open => lifts_breck, :updated_at => Time.now)

  puts ""
  puts "Breckenridge"
  puts "Lifts Open: #{lifts_breck}"
  puts "Runs Open: #{runs_breck}"

  # Copper
  copper = Mountain.find(5)
  url = "http://www.coppercolorado.com/winter/the_mountain/dom/snow.html"
  doc_copper = Nokogiri::HTML(open(url))
  lift_string_cop = doc_copper.at_css("#report-page-conditions-status tr:nth-child(2) td:nth-child(1)").text
  lifts_cop = lift_string_cop
  run_string_cop = doc_copper.at_css("#report-page-conditions-status td:nth-child(2)").text
  runs_cop = run_string_cop
  copper.update_attributes(:runs_open => runs_cop, :lifts_open => lifts_cop, :updated_at => Time.now)


  puts ""
  puts "Copper"
  puts "Lifts Open: #{lifts_cop}"
  puts "Runs Open: #{runs_cop}"

#   Keystone
  keystone = Mountain.find(9)
  url = "http://www.keystoneresort.com/ski-and-snowboard/terrain-status.aspx#/Lifts"
  doc_key = Nokogiri::HTML(open(url))
  lift_string_key = doc_key.at_css(".firstItem").text
  lifts_key = lift_string_key.gsub(/\s+/, "")[12..13]
  run_string_key = doc_key.at_css(".firstItem+li").text
  runs_key = run_string_key.gsub(/\s+/, "")[8..9]
  keystone.update_attributes(:runs_open => runs_key, :lifts_open => lifts_key, :updated_at => Time.now)


  puts ""
  puts "Keystone"
  puts "Lifts Open: #{lifts_key}"
  puts "Runs Open: #{runs_key}"


#   Telluride
  telluride = Mountain.find(11)
  url = "http://www.tellurideskiresort.com/the-mountain/snow-report/"
  doc_tell = Nokogiri::HTML(open(url))
  lift_string_tell = doc_tell.at_css(".liftsOpen .value").text
  run_string_tell = doc_tell.at_css(".trailsOpen .value").text
  lifts_tell = lift_string_tell
  runs_tell = run_string_tell
  telluride.update_attributes(:runs_open => runs_tell, :lifts_open => lifts_tell, :updated_at => Time.now)


  puts ""
  puts "Telluride"
  puts "Lifts Open: #{lifts_tell}"
  puts "Runs Open: #{runs_tell}"

# CB
  crested_butte = Mountain.find(7)
  url = "http://www.skicb.com/the-mountain/grooming-lift-status"
  doc_cb = Nokogiri::HTML(open(url))
  lift_string_cb = doc_cb.at_css(".lifts .value").text
  lifts_cb = lift_string_cb[0]
  run_string_cb = doc_cb.at_css(".value").text
  runs_cb = run_string_cb[0]
  crested_butte.update_attributes(:runs_open => runs_cb, :lifts_open => lifts_cb, :updated_at => Time.now)


  puts ""
  puts "Crested Butte"
  puts "Lifts Open: #{lifts_cb}"
  puts "Runs Open: #{runs_cb}"



end