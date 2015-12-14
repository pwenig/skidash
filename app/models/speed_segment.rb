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


  def set_colors(speed_segments)
    speed_segments.each do |segment|
      if segment["AverageSpeed"] == "-1"
        segment["AverageSpeed"] = "N/A"
        segment["Color"] = "white"
      elsif segment["AverageSpeed"].to_i < 30 && segment["AverageSpeed"].to_i > 0
        segment["Color"] = "#FF0000"
      elsif segment["AverageSpeed"].to_i > 31 && segment["AverageSpeed"].to_i < 55
        segment["Color"] = "#FFFF00"
      else
        segment["Color"] = "#00FF00"
      end
    end

  end



end
