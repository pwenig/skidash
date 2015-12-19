desc "Fetches alert messages from CDOT"
task :fetch_alerts => :environment do

  messages = []

  alerts = TravelAlert.new
  alerts.road_alerts.each do |alert|
    if alert["Title"] != "NONE"
      messages << alert
    else

    end
  end
  if messages.count == 0
    puts "No Traffic Alerts"
  else
    send_traffic_alert(messages)
    puts messages
    puts "*" * 10
    puts "TRAVEL ALERT SENT"
  end
end


def send_traffic_alert(messages)
  Notification.new(messages)
end