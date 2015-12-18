class Notification

 def initialize(speed, direction)
   trigger_alert(speed, direction)
 end

  def trigger_alert(speed, direction)
    @alert_message = "
    SkiDash Alert!
    Slowing Traffic
    #{direction}
    Average Speed: #{speed}"

    user = YAML.load_file('config/users.yml')
    phone_number = user.first["phone_number"]
    send_message(phone_number, @alert_message)

    


  end


  def send_message(phone_number, alert_message)
    twilio_number = ENV['TWILIO_NUMBER']
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

        client.account.messages.create(
        :from => twilio_number,
        :to => phone_number,
        :body => alert_message,
    )
    puts "Alert Message Sent"
  end

end