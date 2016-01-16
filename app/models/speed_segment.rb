class SpeedSegment

  require 'httparty'

  attr_accessor :west_bound_speeds
  attr_accessor :east_bound_speeds

  def initialize
    speed_segment_hash = fetch_speed_segments
    assign_values(speed_segment_hash)
  end


  def fetch_speed_segments
    auth = {:username => "#{ENV['CDOT_USERNAME']}", :password => "#{ENV['CDOT_PASSWORD']}"}
    HTTParty.get(" https://data.cotrip.org/xml/speed_segments.xml",
                 :basic_auth => auth)
  end

  def assign_values(speed_segment_hash)
    @west_bound_speeds = []
    @west_bound_with_colors = []
    @east_bound_speeds = []
    @east_bound_with_colors = []
    responses = speed_segment_hash["SpeedDetails"]["Segment"]
    responses.each do |response|
      west_bound(response)
      east_bound(response)
    end
    @west_bound_with_colors = set_colors(@west_bound_speeds)
    self.west_bound_speeds = @west_bound_with_colors
    @east_bound_with_colors = set_colors(@east_bound_speeds)
    self.east_bound_speeds = @east_bound_with_colors

  end


  def west_bound (response)
    if response["RoadName"] == "I-70" &&
        response["Direction"] == "West" &&
        response["SegmentId"].to_i.between?(20, 25) ||
        response["SegmentId"].to_i.between?(27, 30) ||
        response["SegmentId"].to_i.between?(270, 271)
      @west_bound_speeds << response
    end
  end

  def east_bound(response)
    if response["RoadName"] == "I-70" &&
        response["Direction"] == "East" &&
        response["SegmentId"].to_i.between?(31, 34) ||
        response["SegmentId"].to_i.between?(272, 273) ||
        response["SegmentId"].to_i.between?(36, 41)
      @east_bound_speeds << response
    end
  end

  def self.average_speed(speeds)
    sum = speeds.inject { |sum, x| sum + x }
    average_speed = sum/speeds.count
    puts "Average Overall Speed: #{average_speed} MPH"
  end

  def self.average_speed_springs_west(speeds)
    sum = speeds.inject { |sum, x| sum + x }
    average_speed = sum/speeds.count
    puts "Average Speed Idaho Springs to Georgetown: #{average_speed} MPH"
    direction = "WESTBOUND: Idaho Springs to Georgetown"
    send_alert(average_speed, direction)

  end

  def self.average_speed_to_tunnel(speeds)
    sum = speeds.inject { |sum, x| sum + x }
    average_speed = sum/speeds.count
    puts "Average Speed Bakerville to Tunnel: #{average_speed} MPH"
    direction = "WESTBOUND: Bakerville to Tunnel"
    send_alert(average_speed, direction)
  end

  def self.average_speed_from_tunnel(speeds)
    sum = speeds.inject { |sum, x| sum + x }
    average_speed = sum/speeds.count
    puts "Average Speed Tunnel to Bakerville: #{average_speed} MPH"
    direction = "EASTBOUND: Tunnel to Bakerville"
    send_alert(average_speed, direction)
  end

  def self.average_speed_springs_east(speeds)
    sum = speeds.inject { |sum, x| sum + x }
    average_speed = sum/speeds.count
    puts "Average Speed Georgetown to Idaho Springs: #{average_speed} MPH"
    direction = "EASTBOUND: Georgetown to Idaho Springs"
    send_alert(average_speed, direction)
  end

  def self.send_alert(average_speed, direction)
    if average_speed < 50 && average_speed > 35
      puts "*" * 10
      puts "Moderate Traffic Alert: Traffic Slowing Down"
      message = "Moderate Traffic. Speeds under 50 mph. #{direction}. Average speed is #{average_speed} MPH"
      Notification.new(message)
    elsif average_speed < 35
      puts "*" * 10
      puts "Heavy Traffic Alert: Speeds are under 35 mph"
      message = "HEAVY TRAFFIC! Speeds are under 35 mph. #{direction}. Average speed is #{average_speed} MPH"
      Notification.new(message)
    else
      puts "*" * 10
      puts "No Traffic Alert Needed"
    end
  end

  def set_colors(speed_segments)
    speed_segments.each do |segment|
      if segment["AverageSpeed"] == "-1"
        segment["AverageSpeed"] = "na"
        segment["Color"] = "white"
      elsif segment["AverageSpeed"].to_i <= 31 && segment["AverageSpeed"].to_i > 0
        segment["Color"] = "#FF0000"
      elsif segment["AverageSpeed"].to_i > 31 && segment["AverageSpeed"].to_i < 50
        segment["Color"] = "#FFFF00"
      else
        segment["Color"] = "#00FF00"
      end
    end
  end

end
