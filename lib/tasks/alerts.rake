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
      if not_repeat(message)
        alert << message["LocationDescription"] + message["Title"]
        alert.join("")
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

def not_repeat(message)
  # added the below to reduce the number of repeat notifications
  message["ReportedTime"][8..9].to_i == Time.now.day &&
      message["ReportedTime"][11..12].to_i + 2 > Time.now.hour
  puts "No New Alerts"
end