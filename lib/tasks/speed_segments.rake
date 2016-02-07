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
  SpeedSegment.average_speed(west_bound)
  puts "*" * 10
  SpeedSegment.average_speed_springs_west(west_bound[0..2])
  puts "*" * 10
  SpeedSegment.average_speed_to_tunnel(west_bound[4..6])

  puts ""
  puts "*" * 20
  puts "[East Bound Speeds]"
  speeds.east_bound_speeds.each do |east_speed|
    puts east_speed["SegmentName"].gsub(/^\d..E\d..\s-/, '') + ":" + " "+ east_speed["AverageSpeed"] + " " + "MPH"
    east_bound << east_speed["AverageSpeed"].to_i
  end
  puts "*" * 10
  SpeedSegment.average_speed(east_bound)
  puts "*" * 10
  SpeedSegment.average_speed_from_tunnel(east_bound[5..7])
  puts "*" * 10
  SpeedSegment.average_speed_springs_east(east_bound[9..11])

end
