desc "Fetches alert messages from CDOT"
task :fetch_alerts => :environment do

  messages = []
  alert = []

  alerts = TravelAlert.new
  alerts.road_alerts.each do |road_alert|
    if road_alert["Title"] != "NONE"
      messages << road_alert
    else

    end
  end
  if messages.count == 0
    puts "No Traffic Alerts"
  else
    messages.each do |message|
      # added the below to reduce the number of repeat notifications
      if message["ReportedTime"][8..9].to_i == Time.now.day
        alert << message["LocationDescription"] + message["Title"]
        alert.join("")
        binding.pry
        send_traffic_alert(alert)
        puts alert
        puts "*" * 10
      else
      end
    end
  end
end


def send_traffic_alert(messages)
  messages.each do |message|
    Notification.new(message)
  end
end