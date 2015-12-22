class Notification

  def initialize(message)
    trigger_alert(message)
  end

  def trigger_alert(message)
    time = Time.zone.now.hour
    if time >= 7 && time <= 20
      binding.pry
      @alert_message = message
      users = User.all
      users.each do |user|
        phone_number = user["phone_number"]
        send_message(phone_number, @alert_message)
      end
    end
  end


  def send_message(phone_number, alert_message)
    twilio_number = ENV['TWILIO_NUMBER']
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    client.account.messages.create(
        :from => twilio_number,
        :to => phone_number,
        :body => "SkiDash Alert: #{alert_message}",
    )
    puts "Alert Message Sent"
  end

end