class SpeedSegment

  require 'Httparty'

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
    @east_bound_speeds = []
    responses = speed_segment_hash["SpeedDetails"]["Segment"]
    responses.each do |response|
      west_bound(response)
      east_bound(response)
    end
  end


  def west_bound (response)
    if response["RoadName"] == "I-70" &&
        response["Direction"] == "West" &&
        response["SegmentId"].to_i.between?(20, 25) ||
        response["SegmentId"].to_i.between?(27, 30) ||
        response["SegmentId"].to_i.between?(270, 271)
      @west_bound_speeds << response
    end
    self.west_bound_speeds = @west_bound_speeds

  end

  def east_bound(response)
    if response["RoadName"] == "I-70" &&
        response["Direction"] == "East" &&
        response["SegmentId"].to_i.between?(31, 34) ||
        response["SegmentId"].to_i.between?(272, 273) ||
        response["SegmentId"].to_i.between?(36, 41)
      @east_bound_speeds << response
    end
    self.east_bound_speeds = @east_bound_speeds
  end

end
