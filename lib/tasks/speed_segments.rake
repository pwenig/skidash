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
  average_speed_to_tunnel(west_bound[4..6])
  puts "*" * 10
  average_speed_springs_west(west_bound[0..2])

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
  average_speed_from_tunnel(east_bound[5..7])
  puts "*" * 10
  average_speed_springs_east(east_bound[9..11])
end


def average_speed(speeds)
  sum = speeds.inject{|sum,x| sum + x }
  average_speed = sum/speeds.count
  puts "Average Overall Speed: #{average_speed} MPH"
end



def average_speed_springs_west(speeds)
  sum = speeds.inject{|sum,x| sum + x }
  average_speed = sum/speeds.count
  puts "Average Speed Idaho Springs to Georgetown: #{average_speed} MPH"
  direction = "Westbound: Idaho Springs to Georgetown"
  send_alert(average_speed, direction)
end

def average_speed_to_tunnel(speeds)
  sum = speeds.inject{|sum,x| sum + x }
  average_speed = sum/speeds.count
  puts "Average Speed Bakerville to Tunnel: #{average_speed} MPH"
  direction = "Westbound: Bakerville to Tunnel"
  send_alert(average_speed, direction)
end

def average_speed_springs_east(speeds)
  sum = speeds.inject{|sum,x| sum + x }
  average_speed = sum/speeds.count
  puts "Average Speed Georgetown to Idaho Springs: #{average_speed} MPH"
  direction = "Eastbound: Georgetown to Idaho Springs"
  send_alert(average_speed, direction)
end

def average_speed_from_tunnel(speeds)
  sum = speeds.inject{|sum,x| sum + x }
  average_speed = sum/speeds.count
  puts "Average Speed Tunnel to Bakerville: #{average_speed} MPH"
  direction = "Eastbound: Tunnel to Bakerville"
  send_alert(average_speed, direction)
end


def send_alert(average_speed, direction)
  if average_speed < 50 && average_speed > 35
    puts "*" * 10
    puts "Moderate Traffic Alert: Traffic Slowing Down"
    message = "Moderate Traffic. Speeds under 50 mph. #{direction}. Average speed is #{average_speed} MPH"
    Notification.new(message)
  elsif average_speed < 35
    puts "*" * 10
    puts "Heavy Traffic Alert: Speeds are under 35 mph"
    message = "Heavy Traffic! Speeds are under 35 mph. #{direction}. Average speed is #{average_speed} MPH"
    Notification.new(message)
  else
    puts "*" * 10
    puts "No Traffic Alert Needed"
  end


end