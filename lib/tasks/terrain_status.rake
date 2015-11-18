desc "Fetch terrain status from mountains"
task :fetch_terrain => :environment do
  require 'nokogiri'
  require 'open-uri'

  # Breck
  breck = Mountain.find(3)
  url = "http://www.breckenridge.com/mountain/terrain-status.aspx#/Lifts"
  doc_breck = Nokogiri::HTML(open(url))
  lift_string_breck = doc_breck.at_css(".firstItem").text
  lifts_breck = lift_string_breck.gsub(/\s+/, "")[12]
  run_string_breck = doc_breck.at_css(".firstItem+li").text
  runs_breck = run_string_breck.gsub(/\s+/, "")[8]
  breck.update_attributes(:runs_open => runs_breck, :lifts_open => lifts_breck)

  puts "Breck"
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
  copper.update_attributes(:runs_open => runs_cop, :lifts_open => lifts_cop)


  puts ""
  puts "Copper"
  puts "Lifts Open: #{lifts_cop}"
  puts "Runs Open: #{runs_cop}"

#   Keystone
  keystone = Mountain.find(9)
  url = "http://www.keystoneresort.com/ski-and-snowboard/terrain-status.aspx#/Lifts"
  doc_key = Nokogiri::HTML(open(url))
  lift_string_key = doc_key.at_css(".firstItem").text
  lifts_key = lift_string_key.gsub(/\s+/, "")[12]
  run_string_key = doc_key.at_css(".firstItem+li").text
  runs_key = run_string_key.gsub(/\s+/, "")[8]
  keystone.update_attributes(:runs_open => runs_key, :lifts_open => lifts_key)


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
  telluride.update_attributes(:runs_open => runs_tell, :lifts_open => lifts_tell)


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
  crested_butte.update_attributes(:runs_open => runs_cb, :lifts_open => lifts_cb)


  puts ""
  puts "Crested Butte"
  puts "Lifts Open: #{lifts_cb}"
  puts "Runs Open: #{runs_cb}"



end