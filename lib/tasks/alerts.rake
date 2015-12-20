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
      alert << message["LocationDescription"] + message["Title"]
    end
    alert.join("")
    send_traffic_alert(alert)
    puts alert
    puts "*" * 10

  end
end


def send_traffic_alert(messages)
  messages.each do |message|
  Notification.new(message)
  end
  puts "TRAVEL ALERT SENT"
end