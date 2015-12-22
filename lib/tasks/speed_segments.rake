desc "Fetches speeds from CDOT"
task :fetch_speeds => :environment do

  west_bound = []
  east_bound = []

  speeds = SpeedSegment.new

  puts ""
  puts "*" * 20
  puts "[West Bound Speeds]"
  speeds.west_bound_speeds.each do |west_speed|
    puts west_speed["SegmentName"].gsub(/^\d..W\d..\s-/, '') + ":" + " "+ west_speed["AverageSpeed"] + " " + "MPH"
    west_bound << west_speed["AverageSpeed"].to_i
  end
  puts "*" * 10
  average_speed(west_bound)
  puts "*" * 10
  average_speed_to_tunnel(west_bound[2..5])


  puts ""
  puts "*" * 20
  puts "[East Bound Speeds]"
  speeds.east_bound_speeds.each do |east_speed|
    puts east_speed["SegmentName"].gsub(/^\d..E\d..\s-/, '') + ":" + " "+ east_speed["AverageSpeed"] + " " + "MPH"
    east_bound << east_speed["AverageSpeed"].to_i
  end
  puts "*" * 10
  average_speed(east_bound)
  puts "*" * 10
  average_speed_from_tunnel(east_bound[6..10])
end


def average_speed(speeds)
  sum = speeds.inject{|sum,x| sum + x }
  average_speed = sum/speeds.count
  puts "Average Overall Speed: #{average_speed} MPH"
  speed_analysis(average_speed)
end

def average_speed_to_tunnel(speeds)
  sum = speeds.inject{|sum,x| sum + x }
  average_speed = sum/speeds.count
  puts "Average Speed Empire to Tunnel: #{average_speed} MPH"
  direction = "Eastbound: Empire to Tunnel"
  speed_analysis(average_speed)
  send_alert(average_speed, direction)
end

def average_speed_from_tunnel(speeds)
  sum = speeds.inject{|sum,x| sum + x }
  average_speed = sum/speeds.count
  puts "Average Speed Tunnel to Idaho Springs: #{average_speed} MPH"
  direction = "Westbound: Tunnel to Idaho Springs"
  speed_analysis(average_speed)
  send_alert(average_speed, direction)
end

def speed_analysis(average_speed)
  if average_speed < 50 && average_speed > 31
    puts "Slowing Speeds -- Moderate Traffic"
  elsif average_speed < 30 && average_speed > 0
    puts "Very Slow Speeds -- Heavy Traffic"
  else
  puts "Normal Speeds -- Light to No Traffic"
  end
end

def send_alert(average_speed, direction)
  if average_speed < 50 && average_speed > 35
    puts "*" * 10
    puts "Moderate Traffic Alert: Traffic Slowing Down"
    message = "Moderate Traffic Alert: Traffic Slowing Down. #{direction}. Average speed is #{average_speed} MPH"
    Notification.new(message)
  elsif average_speed < 35
    puts "*" * 10
    puts "Heavy Traffic Alert: Speeds are under 35 mph"
    message = "Heavy Traffic Alert: Speeds are under 35 mph. #{direction}. Average speed is #{average_speed} MPH"
    Notification.new(message)
  else
    puts "*" * 10
    puts "No Traffic Alert Needed"
  end


end